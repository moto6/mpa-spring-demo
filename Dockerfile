FROM --platform=linux/amd64 node:20 AS client-builder
WORKDIR /builder
COPY client/package.json client/package-lock.json .
RUN npm install
COPY client/ .
RUN npm run build

FROM --platform=linux/amd64 azul/zulu-openjdk:21 AS server-builder
WORKDIR /builder
COPY server/gradle/ gradle
COPY --chmod=+x server/gradlew.bat .
COPY --chmod=+x server/gradlew .
RUN ./gradlew --version --no-daemon
COPY server/ .
RUN ./gradlew clean build --no-daemon
RUN java -Djarmode=tools -jar build/libs/todoapp.jar extract --layers --destination extracted

FROM --platform=linux/amd64 azul/zulu-openjdk:21-jre-slim as server-runtime
WORKDIR /application
COPY --from=client-builder /builder/dist/pages/ templates
COPY --from=client-builder /builder/dist/favicon.ico static/
COPY --from=client-builder /builder/dist/profile-picture.png static/
COPY --from=client-builder /builder/dist/assets/ static/assets
COPY --from=server-builder /builder/extracted/application/ .
COPY --from=server-builder /builder/extracted/dependencies/ .
COPY --from=server-builder /builder/extracted/snapshot-dependencies/ .
COPY --from=server-builder /builder/extracted/spring-boot-loader/ .
ENTRYPOINT ["java", "-jar", "todoapp.jar"]