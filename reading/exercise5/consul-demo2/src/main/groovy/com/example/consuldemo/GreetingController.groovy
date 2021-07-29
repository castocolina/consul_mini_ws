package com.example.consuldemo

import java.util.concurrent.atomic.AtomicLong;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import java.util.concurrent.TimeUnit

@RestController
@RefreshScope
public class GreetingController {

	@Value("\${spring.application.name:Sample}")
	private final String appName;

	@Value("\${greeting.message: Hard Coded in class = Hell0, %s!}")
	private final String template;

    @Value("\${greeting.delay:5}")
	private final Integer delay;

	private final AtomicLong counter = new AtomicLong();

	public GreetingController(){
		super();
	}

	@GetMapping("/greeting")
	public Greeting greeting(@RequestParam(value = "name", defaultValue = "Special World") String name) {
		TimeUnit.SECONDS.sleep(delay);
		return new Greeting(counter.incrementAndGet(), String.format(template, name));
	}
}