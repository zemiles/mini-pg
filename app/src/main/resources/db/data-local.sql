-- =====================================================================
-- mini-pg 로컬 테스트 데이터 (내 PC 도커 오라클 전용, 운영에 쓰지 않음)
--
-- 테스트 가맹점 M001의 시크릿 키 원문: test_sk_minipg_M001_local_0001
-- DB에는 아래 SHA-256 해시만 들어간다.
--
-- 요청 헤더 예:
--   Authorization: Basic TTAwMTp0ZXN0X3NrX21pbmlwZ19NMDAxX2xvY2FsXzAwMDE=
--   (= Base64("M001:test_sk_minipg_M001_local_0001"))
-- =====================================================================

INSERT INTO merchant (merchant_id, name, status)
VALUES ('M001', '테스트 가맹점', 'ACTIVE');

INSERT INTO merchant_secret_key (merchant_id, key_prefix, key_hash, environment, status, issued_at)
VALUES ('M001', 'test_sk_mini',
        'da99134425543fdd920c601dc16ede5d514776ceaf516e8e3d31ed86514c9505',
        'TEST', 'ACTIVE', SYSTIMESTAMP);

COMMIT;
