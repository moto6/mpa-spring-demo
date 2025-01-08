package io.dong.mpa

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class MpaApplication

fun main(args: Array<String>) {
	runApplication<MpaApplication>(*args)
}
