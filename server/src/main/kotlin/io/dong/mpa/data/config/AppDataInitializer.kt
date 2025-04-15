package io.dong.mpa.data.config

import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.InitializingBean
import org.springframework.boot.ApplicationArguments
import org.springframework.boot.ApplicationRunner
import org.springframework.boot.CommandLineRunner
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty
import org.springframework.stereotype.Component

@Component
@ConditionalOnProperty(name = ["myapp.data.init"], havingValue = "true")
class AppDataInitializer : InitializingBean, ApplicationRunner, CommandLineRunner {
    val log: Logger = LoggerFactory.getLogger(AppDataInitializer::class.java)

    override fun afterPropertiesSet() {
        log.info("todo : 1")
    }

    override fun run(args: ApplicationArguments?) {
        log.info("todo : 2")
    }

    override fun run(vararg args: String?) {
        log.info("todo : 3")
    }
}