# Spring Boot with PostgreSQL

โปรเจ็ค Spring Boot เปล่าที่เชื่อมต่อกับฐานข้อมูล PostgreSQL

## คุณสมบัติ

- Spring Boot 3.2.0
- PostgreSQL Database
- JPA/Hibernate
- Maven

## การติดตั้ง

### 1. ติดตั้ง PostgreSQL

1. ดาวน์โหลดและติดตั้ง PostgreSQL จาก [https://www.postgresql.org/download/](https://www.postgresql.org/download/)
2. สร้างฐานข้อมูลใหม่ (ถ้าต้องการ):
   ```sql
   CREATE DATABASE your_database_name;
   ```

### 2. ตั้งค่าฐานข้อมูล

แก้ไขไฟล์ `src/main/resources/application.properties`:

```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/your_database_name
spring.datasource.username=your_username
spring.datasource.password=your_password
```

### 3. รันแอปพลิเคชัน

```bash
# Clone โปรเจ็ค
git clone <repository-url>
cd java-rbac

# รันแอปพลิเคชัน
mvn spring-boot:run
```

แอปพลิเคชันจะรันที่ `http://localhost:8080`

## API Endpoints

### Public Endpoints
- `GET /api/public/hello` - ทดสอบการเชื่อมต่อ

## โครงสร้างโปรเจ็ค

```
src/main/java/com/example/javarbac/
├── JavaRbacApplication.java          # Main application class
└── controller/
    └── TestController.java           # Test endpoints
```

## การใช้งาน

### ทดสอบการเชื่อมต่อ

```bash
curl http://localhost:8080/api/public/hello
```

## การพัฒนาเพิ่มเติม

1. เพิ่ม Entity classes
2. เพิ่ม Repository interfaces
3. เพิ่ม Service classes
4. เพิ่ม Controller endpoints
5. เพิ่ม Unit tests

## ข้อกำหนดระบบ

- Java 17 หรือสูงกว่า
- Maven 3.6 หรือสูงกว่า
- PostgreSQL 12 หรือสูงกว่า 