package org.example.jenkins.java;

import org.example.jenkins.MavenApplication;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

class MavenApplicationTest {

    @Test
    void testGettingHelloWorldFromTheMethod(){
        assertThat(MavenApplication.sayHelloWorld()).isEqualTo("Hello World");
    }
}