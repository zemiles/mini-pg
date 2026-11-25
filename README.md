# mini-pg

네트워크 오류나 타임아웃으로 같은 결제 요청이 반복될 때 중복 결제를 방지하기 위한 Java 백엔드입니다. 결제 요청의 **멱등성**을 중심으로 재시도와 동시 요청을 처리하는 흐름을 설계하고 있습니다.

## 현재 상태

Spring Boot 애플리케이션과 빌드 구성을 마련했고, 애플리케이션 컨텍스트가 정상적으로 로딩되는지 검증하는 테스트가 있습니다. 결제 API와 외부 PG 연동은 개발 예정입니다.

## 개발 목표

- 동일한 결제 요청이 재시도될 때 중복 처리하지 않고 앞선 처리 결과를 반환합니다.
- 같은 멱등 키로 요청 내용이 달라지는 경우를 구분합니다.
- 동일한 요청이 동시에 들어오는 상황을 테스트합니다.

## 기술 스택

- Java 21, Spring Boot 4.2.0, Gradle Wrapper 9.9.2
- Spring Web MVC, Spring Data JPA, Bean Validation, H2

## 로컬 실행 및 테스트

JDK 21을 사용합니다. 현재 구성은 내장 H2를 사용하며 별도 데이터베이스 접속 설정이 필요하지 않습니다.

```bash
./gradlew bootRun
./gradlew test
```

Windows PowerShell에서는 아래 명령을 사용합니다.

```powershell
.\gradlew.bat bootRun
.\gradlew.bat test
```

[빌드 설정](build.gradle) · [애플리케이션 테스트](src/test/java/io/github/zemiles/paymentidempotency/PaymentIdempotencyApplicationTests.java)
