-- =====================================================
-- Distributed Print Ring - Optional Local Setup for 6 Nodes
-- The application auto-creates tables if the database already exists.
-- Default shared-database table names:
--   node1_print_jobs / node1_ring_metadata
--   ...
--   node6_print_jobs / node6_ring_metadata
-- =====================================================

CREATE DATABASE IF NOT EXISTS print_ring_demo CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE print_ring_demo;

CREATE TABLE IF NOT EXISTS node1_print_jobs (
  job_id VARCHAR(100) PRIMARY KEY,
  document_content TEXT NOT NULL,
  requested_by VARCHAR(100) NOT NULL,
  requested_node INT NOT NULL,
  submitted_lamport BIGINT NOT NULL,
  submitted_at BIGINT NOT NULL,
  processed_node INT NULL,
  processed_lamport BIGINT NULL,
  processed_at BIGINT NULL,
  status VARCHAR(50) NOT NULL,
  note VARCHAR(255) NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS node1_ring_metadata (
  key_name VARCHAR(100) PRIMARY KEY,
  value_text VARCHAR(255) NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS node2_print_jobs LIKE node1_print_jobs;
CREATE TABLE IF NOT EXISTS node2_ring_metadata LIKE node1_ring_metadata;
CREATE TABLE IF NOT EXISTS node3_print_jobs LIKE node1_print_jobs;
CREATE TABLE IF NOT EXISTS node3_ring_metadata LIKE node1_ring_metadata;
CREATE TABLE IF NOT EXISTS node4_print_jobs LIKE node1_print_jobs;
CREATE TABLE IF NOT EXISTS node4_ring_metadata LIKE node1_ring_metadata;
CREATE TABLE IF NOT EXISTS node5_print_jobs LIKE node1_print_jobs;
CREATE TABLE IF NOT EXISTS node5_ring_metadata LIKE node1_ring_metadata;
CREATE TABLE IF NOT EXISTS node6_print_jobs LIKE node1_print_jobs;
CREATE TABLE IF NOT EXISTS node6_ring_metadata LIKE node1_ring_metadata;
