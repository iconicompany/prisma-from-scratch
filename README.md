# prisma-from-scratch

## Создание проекта

По инструкции https://www.prisma.io/docs/getting-started/quickstart без TypeScript

1. Создать проект: `npm init -y`
2. Установить prisma: `npm install prisma` 
3. Настроить prisma: `npx prisma init`
4. Создать БД в Postgres: `cat sql/schema.pg.sql |sudo -u postgres psql`
5. Описать модель данных в файле [prisma/schema.prisma](prisma/schema.prisma) 
```
model User {
  id    Int     @id @default(autoincrement())
  email String  @unique
  name  String?
  posts Post[]
}

model Post {
  id        Int     @id @default(autoincrement())
  title     String
  content   String?
  published Boolean @default(false)
  author    User    @relation(fields: [authorId], references: [id])
  authorId  Int
}
```
6. Создать миграцию `npx prisma migrate dev --name init`
7. Создать скрипт для работы с БД [src/script.mjs](src/script.mjs)
8. Запустить скрипт: `node src/script.mjs`. Будет создана запись User

## Создание справочника

1. Добавить таблицу EducationLevel с полями id, code, name

```  
/// Справочник Образование
model EducationLevel {
  id    Int     @id @default(autoincrement())
  code  String  @unique
  name  String
}
```
2. Создать новую миграцию `npx prisma migrate dev --name education_level` 
3. Настроить seed-скрипт для пополнения данных справочника  [prisma/seed.mjs](prisma/seed.mjs)
4. Выполнить seed: `npx prisma db seed`. Для проверки заполнения таблицы можно использовать `npx prisma studio``
