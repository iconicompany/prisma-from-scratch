# prisma-from-scratch

## Создание проекта

По инструкции https://www.prisma.io/docs/getting-started/quickstart без TypeScript

1. Создать проект: `npm init -y`
2. Установить prisma: `npm install prisma` 
3. Настроить prisma: `npx prisma init`
4. Создать БД в Postgres: `cat sql/schema.pg.sql |sudo -u postgres psql`
5. Описать модель данных в файле [prisma/schema.prisma](prisma/schema.prisma) 
6. Создать миграцию `npx prisma migrate dev --name init`
7. Создать скрипт для работы с БД [src/script.mjs](src/script.mjs)
8. Запустить скрипт: `node src/script.mjs`. Будет создана запись User
