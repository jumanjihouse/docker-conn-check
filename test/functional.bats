@test "--help works" {
  run docker run --rm conn-check --help
  [ ${status} -eq 0 ]
  [[ ${output} =~ '--dry-run' ]]
}

@test "successfully checks TLS to google.com" {
  run docker run --rm conn-check --connect-timeout 10 /etc/conn-check/sample.yaml
  [ ${status} -eq 0 ]
  [[ ${output} =~ 'tls:www.google.com:443 OK' ]]
}
