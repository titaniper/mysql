import Redis from 'ioredis';

async function main() {
  // const redis = new Redis(31379, 'localhost', {
  //   password: 'Y0dGemMzZHZjbVIzZDNkbA==',
  // });

  const redis = new Redis({
    host: 'localhost',
    port: 31379,
    // username: 'default',
    password: 'passwordwwwe',
  });

  // 테스트 데이터 설정
  await redis.set('key2', 'value2');
  console.log('데이터가 설정되었습니다.');

  // 데이터 가져오기
  const value = await redis.get('key2');
  console.log(`설정된 데이터: ${value}`);

  // 연결 종료
  redis.disconnect();
}

main().catch(console.error);
