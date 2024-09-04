#!/bin/bash

# 디렉토리 구조 생성 및 .gitkeep 파일 추가
directories=(
  "01-basics/installation"
  "01-basics/data-types"
  "01-basics/create-tables"
  "01-basics/crud-operations"
  "02-advanced-queries/joins"
  "02-advanced-queries/subqueries"
  "02-advanced-queries/views"
  "02-advanced-queries/stored-procedures"
  "03-indexing-and-optimization/index-types"
  "03-indexing-and-optimization/query-optimization"
  "03-indexing-and-optimization/explain-plan"
  "04-transactions-and-locking/acid-properties"
  "04-transactions-and-locking/transaction-isolation-levels"
  "04-transactions-and-locking/deadlock-prevention"
  "05-replication-and-scaling/master-slave-replication"
  "05-replication-and-scaling/group-replication"
  "05-replication-and-scaling/sharding"
  "06-security/user-management"
  "06-security/privileges"
  "06-security/encryption"
  "07-administration/backup-and-recovery"
  "07-administration/performance-tuning"
  "07-administration/monitoring"
  "08-projects/project1"
  "08-projects/project2"
  "08-projects/project3"
  "resources/books"
  "resources/articles"
)

for dir in "${directories[@]}"; do
  mkdir -p "$dir"
  touch "$dir/.gitkeep"
done

# README.md 및 useful-links.md 파일 생성
# touch mysql-study/README.md
# touch mysql-study/resources/useful-links.md

echo "MySQL 학습 디렉토리 구조가 성공적으로 생성되었습니다."