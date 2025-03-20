_format_version: '3.0'
_transform: false
consumers:
- custom_id: ~
  created_at: 1734329209
  updated_at: 1741051546
  username: open-api
  id: 59d1ef15-24a5-4373-b957-e8192c15ff6e
  tags: []
parameters:
- value: ce8f9346-2b44-46af-af55-ab141518e1bb
  created_at: 1741051546
  key: cluster_id
services:
- tls_verify: ~
  retries: 5
  tls_verify_depth: ~
  tags: []
  ca_certificates: ~
  host: wenhao
  port: 3000
  created_at: 1733117004
  updated_at: 1741051547
  connect_timeout: 60000
  client_certificate: ~
  write_timeout: 60000
  name: wenhao
  read_timeout: 60000
  enabled: true
  protocol: http
  id: 1f8b86e3-6352-47a3-ac19-01537a11bec9
  path: ~
- tls_verify: ~
  retries: 5
  tls_verify_depth: ~
  tags: []
  ca_certificates: ~
  host: grafana
  port: 3000
  created_at: 1729740320
  updated_at: 1741051547
  connect_timeout: 60000
  client_certificate: ~
  write_timeout: 60000
  name: grafana
  read_timeout: 60000
  enabled: true
  protocol: http
  id: 228308d0-521c-45f8-a97d-fbe6966efa3c
  path: ~
- tls_verify: ~
  retries: 5
  tls_verify_depth: ~
  tags: []
  ca_certificates: ~
  host: gitea
  port: 3000
  created_at: 1729852876
  updated_at: 1741051547
  connect_timeout: 60000
  client_certificate: ~
  write_timeout: 60000
  name: gitea
  read_timeout: 60000
  enabled: true
  protocol: http
  id: 24a5cd06-6728-48ff-a7c8-1847c836bd59
  path: ~
- tls_verify: ~
  retries: 5
  tls_verify_depth: ~
  tags: []
  ca_certificates: ~
  host: hasura
  port: 8080
  created_at: 1729740396
  updated_at: 1741051547
  connect_timeout: 60000
  client_certificate: ~
  write_timeout: 60000
  name: hasura
  read_timeout: 60000
  enabled: true
  protocol: http
  id: 29bf0a09-9e84-449e-b660-d0c9bf24cab3
  path: ~
- tls_verify: ~
  retries: 5
  tls_verify_depth: ~
  tags: []
  ca_certificates: ~
  host: portainer
  port: 9443
  created_at: 1729740912
  updated_at: 1741051547
  connect_timeout: 60000
  client_certificate: ~
  write_timeout: 60000
  name: portainer
  read_timeout: 60000
  enabled: true
  protocol: https
  id: 2cd97a86-3853-4001-9f0d-7769dc40d508
  path: ~
- tls_verify: ~
  retries: 5
  tls_verify_depth: ~
  tags: []
  ca_certificates: ~
  host: konga
  port: 1337
  created_at: 1729736772
  updated_at: 1741051547
  connect_timeout: 60000
  client_certificate: ~
  write_timeout: 60000
  name: konga
  read_timeout: 60000
  enabled: true
  protocol: http
  id: 2df2f7c3-792a-4a30-b30c-6011e2f3f916
  path: /
- tls_verify: ~
  retries: 5
  tls_verify_depth: ~
  tags: []
  ca_certificates: ~
  host: backend
  port: 8080
  created_at: 1734330146
  updated_at: 1741051547
  connect_timeout: 60000
  client_certificate: ~
  write_timeout: 60000
  name: backend-open-api
  read_timeout: 60000
  enabled: true
  protocol: http
  id: 4007e6c1-6ccc-4747-9b96-7bb3f5f78b32
  path: /open-api/supos/
- tls_verify: ~
  retries: 5
  tls_verify_depth: ~
  tags: []
  ca_certificates: ~
  host: kibana
  port: 5601
  created_at: 1729740779
  updated_at: 1741051547
  connect_timeout: 60000
  client_certificate: ~
  write_timeout: 60000
  name: elastic
  read_timeout: 60000
  enabled: true
  protocol: http
  id: 43a4afb4-cabf-4fd8-a3f4-d8b31408e6dc
  path: /elastic/home/
- tls_verify: ~
  retries: 5
  tls_verify_depth: ~
  tags: []
  ca_certificates: ~
  host: backend
  port: 8080
  created_at: 1733290847
  updated_at: 1741051547
  connect_timeout: 60000
  client_certificate: ~
  write_timeout: 60000
  name: backend-service-api
  read_timeout: 60000
  enabled: true
  protocol: http
  id: 4d210886-a694-416d-847d-95fc597f5921
  path: /service-api/supos/
- tls_verify: ~
  retries: 5
  tls_verify_depth: ~
  tags: []
  ca_certificates: ~
  host: gateway
  port: 8070
  created_at: 1732610867
  updated_at: 1741051547
  connect_timeout: 60000
  client_certificate: ~
  write_timeout: 60000
  name: gateway
  read_timeout: 60000
  enabled: true
  protocol: http
  id: 5e8458a8-7323-4a25-9efa-4d56dbf5fa5b
  path: /
- tls_verify: ~
  retries: 5
  tls_verify_depth: ~
  tags: []
  ca_certificates: ~
  host: backend
  port: 8080
  created_at: 1729740054
  updated_at: 1741051546
  connect_timeout: 60000
  client_certificate: ~
  write_timeout: 60000
  name: backend
  read_timeout: 60000
  enabled: true
  protocol: http
  id: 5f70fd49-e3d7-4ba8-b152-62eca6ec4455
  path: /inter-api/supos/
- tls_verify: ~
  retries: 5
  tls_verify_depth: ~
  tags: []
  ca_certificates: ~
  host: backend
  port: 8080
  created_at: 1736404121
  updated_at: 1741051547
  connect_timeout: 60000
  client_certificate: ~
  write_timeout: 60000
  name: open-api-docs
  read_timeout: 60000
  enabled: true
  protocol: http
  id: 61c91a4e-3e0c-4253-abad-de0a0ff72369
  path: /swagger-ui/
- tls_verify: ~
  retries: 5
  tls_verify_depth: ~
  tags: []
  ca_certificates: ~
  host: minio
  port: 9001
  created_at: 1731396402
  updated_at: 1741051547
  connect_timeout: 60000
  client_certificate: ~
  write_timeout: 60000
  name: minio
  read_timeout: 60000
  enabled: true
  protocol: http
  id: 647747b1-8efe-45b6-b37f-430f5e5139d6
  path: /
- tls_verify: ~
  retries: 5
  tls_verify_depth: ~
  tags: []
  ca_certificates: ~
  host: backend
  port: 8080
  created_at: 1741670682
  updated_at: 1741671287
  connect_timeout: 60000
  client_certificate: ~
  write_timeout: 60000
  name: backend-files
  read_timeout: 60000
  enabled: true
  protocol: http
  id: 75a7373b-4dda-4a49-b1f8-de6ebee4d4c8
  path: /files
- tls_verify: ~
  retries: 5
  tls_verify_depth: ~
  tags: []
  ca_certificates: ~
  host: emqx
  port: 18083
  created_at: 1729740676
  updated_at: 1741051547
  connect_timeout: 60000
  client_certificate: ~
  write_timeout: 60000
  name: emqx
  read_timeout: 60000
  enabled: true
  protocol: http
  id: 89c6a77c-e3e6-4149-a0e7-6ace7fd0413b
  path: ~
- tls_verify: ~
  retries: 5
  tls_verify_depth: ~
  tags:
  - root:frontend
  - menu.tag.connections:1
  - menu.tag.devtools:2
  - menu.tag.apps:3
  - menu.tag.settings:4
  - home:5
  ca_certificates: ~
  host: frontend
  port: 3000
  created_at: 1729738059
  updated_at: 1741051547
  connect_timeout: 60000
  client_certificate: ~
  write_timeout: 60000
  name: frontend
  read_timeout: 60000
  enabled: true
  protocol: http
  id: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  path: ~
- tls_verify: ~
  retries: 5
  tls_verify_depth: ~
  tags: []
  ca_certificates: ~
  host: fuxa
  port: 1881
  created_at: 1733732987
  updated_at: 1741051547
  connect_timeout: 60000
  client_certificate: ~
  write_timeout: 60000
  name: fuxa
  read_timeout: 60000
  enabled: true
  protocol: http
  id: abdb1947-dbbf-4a85-ac55-50969ac0ed85
  path: ~
- tls_verify: ~
  retries: 5
  tls_verify_depth: ~
  tags: []
  ca_certificates: ~
  host: backend
  port: 8080
  created_at: 1730685511
  updated_at: 1741051547
  connect_timeout: 60000
  client_certificate: ~
  write_timeout: 60000
  name: node-red-proxy
  read_timeout: 60000
  enabled: true
  protocol: http
  id: b096bcf5-2984-4acc-9bd5-a570a7653fcd
  path: /service-api/supos/proxy/flows
- tls_verify: ~
  retries: 5
  tls_verify_depth: ~
  tags: []
  ca_certificates: ~
  host: keycloak
  port: 8080
  created_at: 1729740513
  updated_at: 1741051547
  connect_timeout: 60000
  client_certificate: ~
  write_timeout: 60000
  name: keycloak
  read_timeout: 60000
  enabled: true
  protocol: http
  id: b2a70de2-d5db-4755-b8ba-b205d8fbb680
  path: /
- tls_verify: ~
  retries: 5
  tls_verify_depth: ~
  tags: []
  ca_certificates: ~
  host: nodered
  port: 1880
  created_at: 1729739239
  updated_at: 1741051547
  connect_timeout: 60000
  client_certificate: ~
  write_timeout: 60000
  name: nodered
  read_timeout: 60000
  enabled: true
  protocol: http
  id: bba8a174-4679-49df-8bf9-ae9285f1e77e
  path: ~
- tls_verify: ~
  retries: 5
  tls_verify_depth: ~
  tags: []
  ca_certificates: ~
  host: chat2db
  port: 10824
  created_at: 1741747300
  updated_at: 1741763222
  connect_timeout: 60000
  client_certificate: ~
  write_timeout: 60000
  name: chat2db-backend
  read_timeout: 60000
  enabled: true
  protocol: http
  id: c53d8d7a-962e-4561-accc-ddf6447336df
  path: /
- tls_verify: ~
  retries: 5
  tls_verify_depth: ~
  tags: []
  ca_certificates: ~
  host: minio-inter
  port: 9000
  created_at: 1731460027
  updated_at: 1741051547
  connect_timeout: 60000
  client_certificate: ~
  write_timeout: 60000
  name: minio-inter
  read_timeout: 60000
  enabled: true
  protocol: http
  id: cc3e8a53-82e1-4f6e-bde6-75207ca2f6d3
  path: ~
- tls_verify: ~
  retries: 5
  tls_verify_depth: ~
  tags: []
  ca_certificates: ~
  host: platform
  port: 3001
  created_at: 1741747189
  updated_at: 1741754706
  connect_timeout: 60000
  client_certificate: ~
  write_timeout: 60000
  name: chat2db
  read_timeout: 60000
  enabled: true
  protocol: http
  id: d9ac42d8-9d41-41e3-a80f-4b64cc215bcf
  path: /
- tls_verify: ~
  retries: 5
  tls_verify_depth: ~
  tags: []
  ca_certificates: ~
  host: keycloak
  port: 8080
  created_at: 1732105495
  updated_at: 1741051547
  connect_timeout: 60000
  client_certificate: ~
  write_timeout: 60000
  name: login
  read_timeout: 60000
  enabled: true
  protocol: http
  id: e3e88607-311a-4c23-a9c7-bb879efc463e
  path: /realms/supos/protocol/openid-connect/auth
- tls_verify: ~
  retries: 5
  tls_verify_depth: ~
  tags: []
  ca_certificates: ~
  host: apm
  port: 8080
  created_at: 1730264819
  updated_at: 1741051547
  connect_timeout: 60000
  client_certificate: ~
  write_timeout: 60000
  name: apm
  read_timeout: 60000
  enabled: true
  protocol: http
  id: f145ba5c-e9aa-48a6-8a10-9ee476010f7f
  path: ~
- tls_verify: ~
  retries: 5
  tls_verify_depth: ~
  tags: []
  ca_certificates: ~
  host: copilotkit
  port: 4000
  created_at: 1729748350
  updated_at: 1741051547
  connect_timeout: 600000
  client_certificate: ~
  write_timeout: 600000
  name: GenerativeUI
  read_timeout: 600000
  enabled: true
  protocol: http
  id: f8fd7fd2-d8f6-47d7-9c54-aa51a24a68ad
  path: /copilotkit
routes:
- snis: ~
  tags:
  - ${ENABLE_ELK}
  - description:menu.desc.logs
  - parentName:menu.tag.settings
  - sort:2
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1730253324
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: logs
  destinations: ~
  service: 43a4afb4-cabf-4fd8-a3f4-d8b31408e6dc
  paths:
  - /elastic/home/app/discover#/?_g=(filters:!(),refreshInterval:(pause:!t,value:60000),time:(from:now-15m,to:now))&_a=(columns:!(container.name,message),dataSource:(type:dataView),filters:!(),grid:(columns:(container.name:(width:301))),index:'31d5c920-8e8a-11ef-80e3-d78ebb901f76',interval:auto,query:(language:kuery,query:''),sort:!(!('@timestamp',desc)))
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: 050c90d4-b22d-4d44-a159-0d35c949a111
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags: ~
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1730270842
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: grafana-inter
  destinations: ~
  service: 228308d0-521c-45f8-a97d-fbe6966efa3c
  paths:
  - /grafana/home/
  path_handling: v1
  methods: ~
  preserve_host: true
  hosts: ~
  request_buffering: true
  id: 10c662d8-8304-439b-85a0-398ae09d09e8
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags:
  - description:menu.desc.cicd
  - sort:199
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1730254514
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: cicd
  destinations: ~
  service: 24a5cd06-6728-48ff-a7c8-1847c836bd59
  paths:
  - /gitea/home/user/login?redirect_to=/gitea/home/
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: 15023439-25a9-481d-90a5-894d4d87d3bf
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags:
  - menu
  - parentName:menu.tag.apps
  - description:menu.desc.genApps
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1731311256
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: genApps
  destinations: ~
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  paths:
  - /app-display
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: 1dfa8b71-07e8-41a5-a07d-536fa0e295a2
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags: ~
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1734328715
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: open-hasura-graphql
  destinations: ~
  service: 29bf0a09-9e84-449e-b660-d0c9bf24cab3
  paths:
  - /open-api/graphql/
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: 1fe717e7-804d-473b-b12b-7f5f68b5ec48
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags: ~
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1730265781
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: apm-backend-iner
  destinations: ~
  service: f145ba5c-e9aa-48a6-8a10-9ee476010f7f
  paths:
  - /apps/freezonex-aps/
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: 209f6169-707c-49f1-86cc-602bc4674b2e
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags:
  - description:menu.desc.mqttBroker
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1729740717
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: mqttBroker
  destinations: ~
  service: 89c6a77c-e3e6-4149-a0e7-6ace7fd0413b
  paths:
  - /emqx/home/
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: 215cdb87-6e13-4e2e-804f-9ea1ac2ff417
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags: ~
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1729748378
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: copilotkit
  destinations: ~
  service: f8fd7fd2-d8f6-47d7-9c54-aa51a24a68ad
  paths:
  - /copilotkit
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: 29027b71-49ce-41d1-96fc-14bcb3a2da00
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags:
  - menu
  - parentName:menu.tag.devtools
  - description:menu.desc.alert
  - sort:1
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1734346408
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: alert
  destinations: ~
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  paths:
  - /alert
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: 33b0281c-dea4-4e2b-a523-4b335953fed9
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags: ~
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1729740083
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: backend
  destinations: ~
  service: 5f70fd49-e3d7-4ba8-b152-62eca6ec4455
  paths:
  - /inter-api/supos/
  path_handling: v1
  methods: ~
  preserve_host: true
  hosts: ~
  request_buffering: true
  id: 3794799e-0c23-4065-a88d-7a08c46fbaf4
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags: []
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1730685544
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: node-red-flows
  destinations: ~
  service: b096bcf5-2984-4acc-9bd5-a570a7653fcd
  paths:
  - /nodered/home/flows
  path_handling: v1
  methods:
  - GET
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: 3f8f8bf7-4d53-4a11-bc6d-d017beda8695
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags:
  - menu
  - description:menu.desc.dataModeling
  - sort:1
  - parentName:menu.tag.connections
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1731311044
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: dataModeling
  destinations: ~
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  paths:
  - /uns
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: 4d89ed56-90bf-490d-ac8c-30def8be2e2c
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags:
  - menu
  - parentName:menu.tag.devtools
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1741747272
  updated_at: 1741750506
  response_buffering: true
  headers: ~
  sources: ~
  name: DBConnect
  destinations: ~
  service: d9ac42d8-9d41-41e3-a80f-4b64cc215bcf
  paths:
  - /chat2db/home/connections
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: 4e5336db-053c-4c9f-a773-bb83a2557ffb
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags:
  - description:menu.desc.graphQL
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1729740461
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: graphQL
  destinations: ~
  service: 29bf0a09-9e84-449e-b660-d0c9bf24cab3
  paths:
  - /hasura/home/
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: 4f4b9999-c921-4ca8-9eef-63db46e6b2b5
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags: ~
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1733290917
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: backend-service-api
  destinations: ~
  service: 4d210886-a694-416d-847d-95fc597f5921
  paths:
  - /service-api/supos/
  path_handling: v1
  methods: ~
  preserve_host: true
  hosts: ~
  request_buffering: true
  id: 5a0cdda1-0ac2-4255-a4bc-a11a8b4a00d5
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags: ~
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1741671187
  updated_at: 1741671187
  response_buffering: true
  headers: ~
  sources: ~
  name: backend-files
  destinations: ~
  service: 75a7373b-4dda-4a49-b1f8-de6ebee4d4c8
  paths:
  - /files
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: 670008e2-5811-4d9d-b925-5429d16caa8f
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags: ~
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1734328933
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: open-hasura-restapi
  destinations: ~
  service: 29bf0a09-9e84-449e-b660-d0c9bf24cab3
  paths:
  - /open-api/restapi/
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: 6856a277-bcae-43a3-992c-81fc5c605baf
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags: ~
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1732611195
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: gateway
  destinations: ~
  service: 5e8458a8-7323-4a25-9efa-4d56dbf5fa5b
  paths:
  - /gateway
  path_handling: v1
  methods: ~
  preserve_host: true
  hosts: ~
  request_buffering: true
  id: 6ce6b319-0e38-4bf4-ba1d-4d043a926ba7
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags: ~
  https_redirect_status_code: 426
  strip_path: false
  created_at: 1730264872
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: apm-frontend-inter
  destinations: ~
  service: f145ba5c-e9aa-48a6-8a10-9ee476010f7f
  paths:
  - /apps/freezonex-aps/apsfrontend/
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: 6f2a8d9e-d76f-46b9-b2d4-27286651433d
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags: ~
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1741747323
  updated_at: 1741763254
  response_buffering: true
  headers: ~
  sources: ~
  name: chat2dbapi
  destinations: ~
  service: c53d8d7a-962e-4561-accc-ddf6447336df
  paths:
  - /chat2db/
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: 78e5de54-af01-4eff-bb5d-bfbde4f35835
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags:
  - description:menu.desc.konga
  - sort:2
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1729736896
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: konga
  destinations: ~
  service: 2df2f7c3-792a-4a30-b30c-6011e2f3f916
  paths:
  - /konga/home/
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: 79d5e57d-340c-4d18-93ee-a6a8f4a0f212
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags: []
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1729740838
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: elastic-inter
  destinations: ~
  service: 43a4afb4-cabf-4fd8-a3f4-d8b31408e6dc
  paths:
  - /elastic/home/
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: 8154564f-57c9-4de4-a605-a204c46bf15a
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags:
  - description:menu.desc.apm
  https_redirect_status_code: 426
  strip_path: false
  created_at: 1730265586
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: apm
  destinations: ~
  service: f145ba5c-e9aa-48a6-8a10-9ee476010f7f
  paths:
  - /apsfrontend/dashboard
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: 833d37e3-05bb-4a1d-992c-0a0e5c19b0dd
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags:
  - parentName:menu.tag.connections
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1733209593
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: StreamProcessing
  destinations: ~
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  paths:
  - /streams
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: 8613d94b-0fd7-4b81-8f9d-ac5df267b7e3
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags:
  - parentName:menu.tag.connections
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1733733028
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: LowCodeTool
  destinations: ~
  service: abdb1947-dbbf-4a85-ac55-50969ac0ed85
  paths:
  - /fuxa/home/
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: 86fbf4ad-d446-47e3-a9ba-00ead9113c17
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags:
  - menuPort:13020
  - menuProtocol:http
  - menuHost:${ENTRANCE_DOMAIN}
  - description:The llm webUI which is  easy to use
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1733117175
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: Ollama
  destinations: ~
  service: 1f8b86e3-6352-47a3-ac19-01537a11bec9
  paths:
  - /
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: 95100aa4-a76b-481c-8485-56eb1f71a529
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags: ~
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1734330177
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: open-backend-api
  destinations: ~
  service: 4007e6c1-6ccc-4747-9b96-7bb3f5f78b32
  paths:
  - /open-api/supos/
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: 9df937e7-2ffb-49f4-b60b-4bb5b551419a
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags:
  - sort:2
  - menu
  - description:menu.desc.nodered.flow
  - parentName:menu.tag.connections
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1731311377
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: collection-flow
  destinations: ~
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  paths:
  - /collection-flow
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: a13bb597-9740-4dde-929e-d140c286d869
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags:
  - menu
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1736404187
  updated_at: 1741508002
  response_buffering: true
  headers: ~
  sources: ~
  name: open-api-docs
  destinations: ~
  service: 61c91a4e-3e0c-4253-abad-de0a0ff72369
  paths:
  - /swagger-ui
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: a1f72e00-26fa-47a6-997c-a3c6c6aef9e7
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags:
  - menu
  - description:menu.desc.generativeUI
  - parentName:menu.tag.devtools
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1731311359
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: generativeUI
  destinations: ~
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  paths:
  - /app-space
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: a2060aa0-88e5-4247-9635-f93438bbdd84
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags:
  - 'parentName:menu.tag.settings'
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1741573643
  updated_at: 1741573643
  response_buffering: true
  headers: ~
  sources: ~
  name: workflow
  destinations: ~
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  paths:
  - /workflow
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: a5040934-75dd-40c6-94ea-9497ab2b0579
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags:
  - description:menu.desc.objectStorageServer
  - sort:200
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1731396438
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: objectStorageServer
  destinations: ~
  service: 647747b1-8efe-45b6-b37f-430f5e5139d6
  paths:
  - /minio/home/
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: a6d04fe9-a464-493c-8f3a-4750fdd93a32
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags:
  - description:menu.desc.grafana
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1730270517
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: grafana
  destinations: ~
  service: 228308d0-521c-45f8-a97d-fbe6966efa3c
  paths:
  - /grafana/home/dashboards/
  path_handling: v1
  methods: ~
  preserve_host: true
  hosts: ~
  request_buffering: true
  id: aa02bbb9-6459-43bd-9b65-91d89c8854dd
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags: ~
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1731473911
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: keycloak-auth
  destinations: ~
  service: b2a70de2-d5db-4755-b8ba-b205d8fbb680
  paths:
  - /keycloak/home/auth/
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: b610973a-764e-4cef-910e-0794f334e4bd
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags: ~
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1732108769
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: login
  destinations: ~
  service: e3e88607-311a-4c23-a9c7-bb879efc463e
  paths:
  - /supos-login
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: ba7b2df9-b0d8-4b6b-844d-43f935f3181f
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags: ~
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1729738250
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: frontend
  destinations: ~
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  paths:
  - /
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: c2dececa-99f4-45e1-9859-01e88352bd58
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags:
  - menu
  - description:menu.desc.home
  - sort:1
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1731635333
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: home
  destinations: ~
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  paths:
  - /home
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: c90b4b7a-8a51-4f40-b4e2-6c0a40be1b15
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags:
  - description:menu.desc.keycloak
  - sort:1
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1729740574
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: keycloak
  destinations: ~
  service: b2a70de2-d5db-4755-b8ba-b205d8fbb680
  paths:
  - /keycloak/home/
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: d0cea78f-1e0d-4b90-98ea-980a455bf5f5
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags:
  - sort:3
  - menu
  - description:menu.desc.dashboards
  - parentName:menu.tag.connections
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1730770040
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: dashboards
  destinations: ~
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  paths:
  - /dashboards
  path_handling: v1
  methods: ~
  preserve_host: true
  hosts: ~
  request_buffering: true
  id: d2a81d6f-8b2a-4b28-8929-3c51ccd16021
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags: ~
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1731460050
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: minio-inter
  destinations: ~
  service: cc3e8a53-82e1-4f6e-bde6-75207ca2f6d3
  paths:
  - /minio/inter/
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: dbb92267-e886-4ee8-b758-a9f9e9af1998
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags: []
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1729852903
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: gitea-inter
  destinations: ~
  service: 24a5cd06-6728-48ff-a7c8-1847c836bd59
  paths:
  - /gitea/home/
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: e3459f2d-fcb2-412e-87fc-b098d8906b7e
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags: ~
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1741747250
  updated_at: 1741750892
  response_buffering: true
  headers: ~
  sources: ~
  name: chat2db-inter
  destinations: ~
  service: d9ac42d8-9d41-41e3-a80f-4b64cc215bcf
  paths:
  - /chat2db/home/
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: e3ff5178-c156-47e6-90f4-ec2a45b05953
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags: ~
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1733118225
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: 测试中文
  destinations: ~
  service: 5e8458a8-7323-4a25-9efa-4d56dbf5fa5b
  paths:
  - /test
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: ea381a8a-a76a-4043-9e05-d5e5c9bf3492
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags:
  - menu
  - parentName:menu.tag.devtools
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1741747220
  updated_at: 1741750995
  response_buffering: true
  headers: ~
  sources: ~
  name: SQLEditor
  destinations: ~
  service: d9ac42d8-9d41-41e3-a80f-4b64cc215bcf
  paths:
  - /chat2db/home/workspace
  path_handling: v1
  methods: ~
  preserve_host: true
  hosts: ~
  request_buffering: true
  id: ed108474-cc43-4b66-b92a-5de38f061c6d
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags:
  - menu
  - parentName:menu.tag.settings
  - description:menu.desc.advanceUse
  - sort:3
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1734056913
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: advancedUse
  destinations: ~
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  paths:
  - /advanced-use
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: f0a59836-7eea-45b3-b188-51c45c68f305
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags:
  - menu
  - description:menu.desc.account
  - parentName:menu.tag.settings
  - sort:1
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1732696995
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: account
  destinations: ~
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  paths:
  - /account-management
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: f610002e-8e5c-424a-9fdc-e86d754b3142
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags: []
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1729739343
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: NodeRed
  destinations: ~
  service: bba8a174-4679-49df-8bf9-ae9285f1e77e
  paths:
  - /nodered/home/
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: f8bccdbf-46fd-4dd7-aafe-d1a8e13c3450
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags:
  - description:menu.desc.dockerMgmt
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1729740933
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: dockerMgmt
  destinations: ~
  service: 2cd97a86-3853-4001-9f0d-7769dc40d508
  paths:
  - /portainer/home/
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: fb690c3a-e09e-4fcf-aad1-5d357c1938ec
  protocols:
  - http
  - https
  regex_priority: 0
- snis: ~
  tags:
  - menu
  - sort:4
  - description:menu.desc.aboutus
  - parentName:menu.tag.settings
  https_redirect_status_code: 426
  strip_path: true
  created_at: 1733822464
  updated_at: 1741051547
  response_buffering: true
  headers: ~
  sources: ~
  name: aboutus
  destinations: ~
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  paths:
  - /aboutus
  path_handling: v1
  methods: ~
  preserve_host: false
  hosts: ~
  request_buffering: true
  id: fb8efe62-0030-4540-a521-a3b4215b4f59
  protocols:
  - http
  - https
  regex_priority: 0
plugins:
- route: ~
  name: supos-auth-checker
  tags: ~
  instance_name: ~
  enabled: false
  service: ~
  created_at: 1733799127
  updated_at: 1741051547
  id: 1845ee75-d704-40e1-a8b0-aa2baaf9d71b
  config:
    whitelist_paths:
    - ^/inter-api/supos/auth.*$
    - ^/inter-api/supos/systemConfig.*$
    - ^/files.*$
    - ^/$
    - ^/assets.*$
    - ^/locale.*$
    - ^/logo.*$
    - ^/gitea.*git.*$
    - ^/supos-login.*$
    - ^/403$
    - ^/open-api/.*$
    - ^/keycloak.*$
    forbidden_url: /403
    enable_resource_check: true
    enable_deny_check: true
    login_url: /supos-login
  consumer: ~
  protocols:
  - grpc
  - grpcs
  - http
  - https
- route: 9df937e7-2ffb-49f4-b60b-4bb5b551419a
  name: key-auth
  tags: ~
  instance_name: ~
  enabled: true
  service: ~
  created_at: 1734330234
  updated_at: 1741051547
  id: 2285421f-56e3-4510-be12-69fa1040d810
  config:
    anonymous: ~
    key_names:
    - apikey
    realm: ~
    run_on_preflight: true
    key_in_header: true
    key_in_query: true
    key_in_body: false
    hide_credentials: false
  consumer: ~
  protocols:
  - grpc
  - grpcs
  - http
  - https
- route: ~
  name: request-transformer
  tags: ~
  instance_name: ~
  enabled: true
  service: e3e88607-311a-4c23-a9c7-bb879efc463e
  created_at: 1734073535
  updated_at: 1741051547
  id: 46bda5cf-63ea-401f-9f06-b9e024aa5597
  config:
    append:
      querystring:
      - client_id:supos
      - response_type:code
      - scope:openid
      - redirect_uri:${BASE_URL}/inter-api/supos/auth/token
      headers: []
      body: []
    replace:
      querystring: []
      body: []
      headers: []
      uri: ~
    rename:
      querystring: []
      headers: []
      body: []
    remove:
      querystring: []
      headers: []
      body: []
    add:
      querystring: []
      headers: []
      body: []
    http_method: ~
  consumer: ~
  protocols:
  - grpc
  - grpcs
  - http
  - https
- route: 1fe717e7-804d-473b-b12b-7f5f68b5ec48
  name: key-auth
  tags: ~
  instance_name: ~
  enabled: true
  service: ~
  created_at: 1734329742
  updated_at: 1741051547
  id: 4e339a48-e193-4bc7-99ba-94f2e1e18a8f
  config:
    anonymous: ~
    key_names:
    - apikey
    realm: ~
    run_on_preflight: true
    key_in_header: true
    key_in_query: true
    key_in_body: false
    hide_credentials: false
  consumer: ~
  protocols:
  - grpc
  - grpcs
  - http
  - https
- route: ~
  name: response-transformer
  tags: ~
  instance_name: ~
  enabled: true
  service: e3e88607-311a-4c23-a9c7-bb879efc463e
  created_at: 1734073759
  updated_at: 1741051547
  id: 73285cac-cf4e-4368-bf8f-d3285f9686d4
  config:
    append:
      headers:
      - X-Frame-Options:DENY
      - Content-Security-Policy:frame-ancestors 'none'
      json: []
      json_types: []
    rename:
      headers: []
      json: []
    remove:
      headers:
      - x-frame-options
      - Content-Security-Policy
      json: []
    add:
      headers: []
      json: []
      json_types: []
    replace:
      headers: []
      json: []
      json_types: []
  consumer: ~
  protocols:
  - grpc
  - grpcs
  - http
  - https
- route: 6856a277-bcae-43a3-992c-81fc5c605baf
  name: key-auth
  tags: ~
  instance_name: ~
  enabled: true
  service: ~
  created_at: 1734329166
  updated_at: 1741051547
  id: 9e4c8423-76d1-498d-8883-b9b18bdbf161
  config:
    anonymous: ~
    key_names:
    - apikey
    realm: ~
    run_on_preflight: true
    key_in_header: true
    key_in_query: true
    key_in_body: false
    hide_credentials: false
  consumer: ~
  protocols:
  - grpc
  - grpcs
  - http
  - https
- route: a6d04fe9-a464-493c-8f3a-4750fdd93a32
  name: response-transformer
  tags: ~
  instance_name: ~
  enabled: true
  service: ~
  created_at: 1731400906
  updated_at: 1741051547
  id: b5722a76-60b9-483d-90ac-e5de173264e2
  config:
    append:
      headers: []
      json: []
      json_types: []
    rename:
      headers: []
      json: []
    remove:
      headers:
      - X-Frame-Options
      json: []
    add:
      headers:
      - X-Frame-Options:SAMEORIGIN
      json: []
      json_types: []
    replace:
      headers: []
      json: []
      json_types: []
  consumer: ~
  protocols:
  - grpc
  - grpcs
  - http
  - https
- route: ba7b2df9-b0d8-4b6b-844d-43f935f3181f
  name: supos-url-transformer
  tags: ~
  instance_name: ~
  enabled: true
  service: ~
  created_at: 1734014838
  updated_at: 1741051547
  id: f45e7fd0-74e5-4b36-b265-5df962eb1b58
  config:
    home_url: /home
  consumer: ~
  protocols:
  - grpc
  - grpcs
  - http
  - https
upstreams:
- hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  tags: ~
  hash_on: none
  healthchecks:
    passive:
      healthy:
        http_statuses:
        - 200
        - 201
        - 202
        - 203
        - 204
        - 205
        - 206
        - 207
        - 208
        - 226
        - 300
        - 301
        - 302
        - 303
        - 304
        - 305
        - 306
        - 307
        - 308
        successes: 0
      unhealthy:
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 500
        - 503
      type: http
    active:
      https_verify_certificate: true
      concurrency: 10
      healthy:
        interval: 0
        successes: 0
        http_statuses:
        - 200
        - 302
      unhealthy:
        interval: 0
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
      type: http
      headers: ~
      timeout: 1
      http_path: /
      https_sni: ~
    threshold: 0
  hash_on_header: ~
  created_at: 1730264799
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  client_certificate: ~
  use_srv_name: false
  name: apm
  hash_on_cookie: ~
  hash_on_cookie_path: /
  algorithm: round-robin
  host_header: ~
  id: 00f62da1-73b3-4308-8ae5-856268388aa9
  hash_fallback: none
  updated_at: 1741051547
  slots: 1000
  hash_fallback_header: ~
- hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  tags: ~
  hash_on: none
  healthchecks:
    passive:
      healthy:
        http_statuses:
        - 200
        - 201
        - 202
        - 203
        - 204
        - 205
        - 206
        - 207
        - 208
        - 226
        - 300
        - 301
        - 302
        - 303
        - 304
        - 305
        - 306
        - 307
        - 308
        successes: 0
      unhealthy:
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 500
        - 503
      type: http
    active:
      https_verify_certificate: true
      concurrency: 10
      healthy:
        interval: 0
        successes: 0
        http_statuses:
        - 200
        - 302
      unhealthy:
        interval: 0
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
      type: http
      headers: ~
      timeout: 1
      http_path: /
      https_sni: ~
    threshold: 0
  hash_on_header: ~
  created_at: 1731459961
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  client_certificate: ~
  use_srv_name: false
  name: minio-inter
  hash_on_cookie: ~
  hash_on_cookie_path: /
  algorithm: round-robin
  host_header: ~
  id: 09fa87e7-1cf1-4fc3-9ad6-6861572a8ef4
  hash_fallback: none
  updated_at: 1741051547
  slots: 1000
  hash_fallback_header: ~
- hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  tags: ~
  hash_on: none
  healthchecks:
    passive:
      healthy:
        http_statuses:
        - 200
        - 201
        - 202
        - 203
        - 204
        - 205
        - 206
        - 207
        - 208
        - 226
        - 300
        - 301
        - 302
        - 303
        - 304
        - 305
        - 306
        - 307
        - 308
        successes: 0
      unhealthy:
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 500
        - 503
      type: http
    active:
      https_verify_certificate: true
      concurrency: 10
      healthy:
        interval: 0
        successes: 0
        http_statuses:
        - 200
        - 302
      unhealthy:
        interval: 0
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
      type: http
      headers: ~
      timeout: 1
      http_path: /
      https_sni: ~
    threshold: 0
  hash_on_header: ~
  created_at: 1741754738
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  client_certificate: ~
  use_srv_name: false
  name: platform
  hash_on_cookie: ~
  hash_on_cookie_path: /
  algorithm: round-robin
  host_header: ~
  id: 14bdf793-231d-439e-8d67-3e47a3e7da05
  hash_fallback: none
  updated_at: 1741754870
  slots: 1000
  hash_fallback_header: ~
- hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  tags: ~
  hash_on: none
  healthchecks:
    passive:
      healthy:
        http_statuses:
        - 200
        - 201
        - 202
        - 203
        - 204
        - 205
        - 206
        - 207
        - 208
        - 226
        - 300
        - 301
        - 302
        - 303
        - 304
        - 305
        - 306
        - 307
        - 308
        successes: 0
      unhealthy:
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 500
        - 503
      type: http
    active:
      https_verify_certificate: true
      concurrency: 10
      healthy:
        interval: 0
        successes: 0
        http_statuses:
        - 200
        - 302
      unhealthy:
        interval: 0
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
      type: http
      headers: ~
      timeout: 1
      http_path: /
      https_sni: ~
    threshold: 0
  hash_on_header: ~
  created_at: 1729739799
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  client_certificate: ~
  use_srv_name: false
  name: keycloak
  hash_on_cookie: ~
  hash_on_cookie_path: /
  algorithm: round-robin
  host_header: ~
  id: 14ee49e7-f9bf-4234-a48f-7b7df7dda0ea
  hash_fallback: none
  updated_at: 1741051547
  slots: 1000
  hash_fallback_header: ~
- hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  tags: ~
  hash_on: none
  healthchecks:
    passive:
      healthy:
        http_statuses:
        - 200
        - 201
        - 202
        - 203
        - 204
        - 205
        - 206
        - 207
        - 208
        - 226
        - 300
        - 301
        - 302
        - 303
        - 304
        - 305
        - 306
        - 307
        - 308
        successes: 0
      unhealthy:
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 500
        - 503
      type: http
    active:
      https_verify_certificate: true
      concurrency: 10
      healthy:
        interval: 0
        successes: 0
        http_statuses:
        - 200
        - 302
      unhealthy:
        interval: 0
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
      type: http
      headers: ~
      timeout: 1
      http_path: /
      https_sni: ~
    threshold: 0
  hash_on_header: ~
  created_at: 1729739256
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  client_certificate: ~
  use_srv_name: false
  name: nodered
  hash_on_cookie: ~
  hash_on_cookie_path: /
  algorithm: round-robin
  host_header: ~
  id: 220c1252-a48b-4e7e-af42-b134f316ed16
  hash_fallback: none
  updated_at: 1741051547
  slots: 1000
  hash_fallback_header: ~
- hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  tags: ~
  hash_on: none
  healthchecks:
    passive:
      healthy:
        http_statuses:
        - 200
        - 201
        - 202
        - 203
        - 204
        - 205
        - 206
        - 207
        - 208
        - 226
        - 300
        - 301
        - 302
        - 303
        - 304
        - 305
        - 306
        - 307
        - 308
        successes: 0
      unhealthy:
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 500
        - 503
      type: http
    active:
      https_verify_certificate: true
      concurrency: 10
      healthy:
        interval: 0
        successes: 0
        http_statuses:
        - 200
        - 302
      unhealthy:
        interval: 0
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
      type: http
      headers: ~
      timeout: 1
      http_path: /
      https_sni: ~
    threshold: 0
  hash_on_header: ~
  created_at: 1729737217
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  client_certificate: ~
  use_srv_name: false
  name: konga
  hash_on_cookie: ~
  hash_on_cookie_path: /
  algorithm: round-robin
  host_header: ~
  id: 2a0fa8a9-98a4-4456-9d2c-faba35b54882
  hash_fallback: none
  updated_at: 1741051547
  slots: 1000
  hash_fallback_header: ~
- hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  tags: ~
  hash_on: none
  healthchecks:
    passive:
      healthy:
        http_statuses:
        - 200
        - 201
        - 202
        - 203
        - 204
        - 205
        - 206
        - 207
        - 208
        - 226
        - 300
        - 301
        - 302
        - 303
        - 304
        - 305
        - 306
        - 307
        - 308
        successes: 0
      unhealthy:
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 500
        - 503
      type: http
    active:
      https_verify_certificate: true
      concurrency: 10
      healthy:
        interval: 0
        successes: 0
        http_statuses:
        - 200
        - 302
      unhealthy:
        interval: 0
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
      type: http
      headers: ~
      timeout: 1
      http_path: /
      https_sni: ~
    threshold: 0
  hash_on_header: ~
  created_at: 1729739617
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  client_certificate: ~
  use_srv_name: false
  name: grafana
  hash_on_cookie: ~
  hash_on_cookie_path: /
  algorithm: round-robin
  host_header: ~
  id: 2e9455f1-241d-4a1e-840e-fea66dd9aa09
  hash_fallback: none
  updated_at: 1741051547
  slots: 1000
  hash_fallback_header: ~
- hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  tags: ~
  hash_on: none
  healthchecks:
    passive:
      healthy:
        http_statuses:
        - 200
        - 201
        - 202
        - 203
        - 204
        - 205
        - 206
        - 207
        - 208
        - 226
        - 300
        - 301
        - 302
        - 303
        - 304
        - 305
        - 306
        - 307
        - 308
        successes: 0
      unhealthy:
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 500
        - 503
      type: http
    active:
      https_verify_certificate: true
      concurrency: 10
      healthy:
        interval: 0
        successes: 0
        http_statuses:
        - 200
        - 302
      unhealthy:
        interval: 0
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
      type: http
      headers: ~
      timeout: 1
      http_path: /
      https_sni: ~
    threshold: 0
  hash_on_header: ~
  created_at: 1729739903
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  client_certificate: ~
  use_srv_name: false
  name: portainer
  hash_on_cookie: ~
  hash_on_cookie_path: /
  algorithm: round-robin
  host_header: ~
  id: 3f51d2ee-7609-4f71-b6ec-8ded27b417a2
  hash_fallback: none
  updated_at: 1741051547
  slots: 1000
  hash_fallback_header: ~
- hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  tags: ~
  hash_on: none
  healthchecks:
    passive:
      healthy:
        http_statuses:
        - 200
        - 201
        - 202
        - 203
        - 204
        - 205
        - 206
        - 207
        - 208
        - 226
        - 300
        - 301
        - 302
        - 303
        - 304
        - 305
        - 306
        - 307
        - 308
        successes: 0
      unhealthy:
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 500
        - 503
      type: http
    active:
      https_verify_certificate: true
      concurrency: 10
      healthy:
        interval: 0
        successes: 0
        http_statuses:
        - 200
        - 302
      unhealthy:
        interval: 0
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
      type: http
      headers: ~
      timeout: 1
      http_path: /
      https_sni: ~
    threshold: 0
  hash_on_header: ~
  created_at: 1729739883
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  client_certificate: ~
  use_srv_name: false
  name: kibana
  hash_on_cookie: ~
  hash_on_cookie_path: /
  algorithm: round-robin
  host_header: ~
  id: 420478e2-bdc8-49ec-ba0e-cc4cfd41afc8
  hash_fallback: none
  updated_at: 1741051547
  slots: 1000
  hash_fallback_header: ~
- hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  tags: ~
  hash_on: none
  healthchecks:
    passive:
      healthy:
        http_statuses:
        - 200
        - 201
        - 202
        - 203
        - 204
        - 205
        - 206
        - 207
        - 208
        - 226
        - 300
        - 301
        - 302
        - 303
        - 304
        - 305
        - 306
        - 307
        - 308
        successes: 0
      unhealthy:
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 500
        - 503
      type: http
    active:
      https_verify_certificate: true
      concurrency: 10
      healthy:
        interval: 0
        successes: 0
        http_statuses:
        - 200
        - 302
      unhealthy:
        interval: 0
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
      type: http
      headers: ~
      timeout: 1
      http_path: /
      https_sni: ~
    threshold: 0
  hash_on_header: ~
  created_at: 1729852910
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  client_certificate: ~
  use_srv_name: false
  name: gitea
  hash_on_cookie: ~
  hash_on_cookie_path: /
  algorithm: round-robin
  host_header: ~
  id: 47b5a73e-51c6-4ace-b507-40458125c0a6
  hash_fallback: none
  updated_at: 1741051547
  slots: 1000
  hash_fallback_header: ~
- hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  tags: ~
  hash_on: none
  healthchecks:
    passive:
      healthy:
        http_statuses:
        - 200
        - 201
        - 202
        - 203
        - 204
        - 205
        - 206
        - 207
        - 208
        - 226
        - 300
        - 301
        - 302
        - 303
        - 304
        - 305
        - 306
        - 307
        - 308
        successes: 0
      unhealthy:
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 500
        - 503
      type: http
    active:
      https_verify_certificate: true
      concurrency: 10
      healthy:
        interval: 0
        successes: 0
        http_statuses:
        - 200
        - 302
      unhealthy:
        interval: 0
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
      type: http
      headers: ~
      timeout: 1
      http_path: /
      https_sni: ~
    threshold: 0
  hash_on_header: ~
  created_at: 1729739930
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  client_certificate: ~
  use_srv_name: false
  name: copilotkit
  hash_on_cookie: ~
  hash_on_cookie_path: /
  algorithm: round-robin
  host_header: ~
  id: 747a43cc-42c4-457a-abac-518c2fe537b3
  hash_fallback: none
  updated_at: 1741051547
  slots: 1000
  hash_fallback_header: ~
- hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  tags: ~
  hash_on: none
  healthchecks:
    passive:
      healthy:
        http_statuses:
        - 200
        - 201
        - 202
        - 203
        - 204
        - 205
        - 206
        - 207
        - 208
        - 226
        - 300
        - 301
        - 302
        - 303
        - 304
        - 305
        - 306
        - 307
        - 308
        successes: 0
      unhealthy:
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 500
        - 503
      type: http
    active:
      https_verify_certificate: true
      concurrency: 10
      healthy:
        interval: 0
        successes: 0
        http_statuses:
        - 200
        - 302
      unhealthy:
        interval: 0
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
      type: http
      headers: ~
      timeout: 1
      http_path: /
      https_sni: ~
    threshold: 0
  hash_on_header: ~
  created_at: 1729739734
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  client_certificate: ~
  use_srv_name: false
  name: hasura
  hash_on_cookie: ~
  hash_on_cookie_path: /
  algorithm: round-robin
  host_header: ~
  id: ab6fb6a2-97b9-45e7-b508-46df2df5203e
  hash_fallback: none
  updated_at: 1741051547
  slots: 1000
  hash_fallback_header: ~
- hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  tags: ~
  hash_on: none
  healthchecks:
    passive:
      healthy:
        http_statuses:
        - 200
        - 201
        - 202
        - 203
        - 204
        - 205
        - 206
        - 207
        - 208
        - 226
        - 300
        - 301
        - 302
        - 303
        - 304
        - 305
        - 306
        - 307
        - 308
        successes: 0
      unhealthy:
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 500
        - 503
      type: http
    active:
      https_verify_certificate: true
      concurrency: 10
      healthy:
        interval: 0
        successes: 0
        http_statuses:
        - 200
        - 302
      unhealthy:
        interval: 0
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
      type: http
      headers: ~
      timeout: 1
      http_path: /
      https_sni: ~
    threshold: 0
  hash_on_header: ~
  created_at: 1729737694
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  client_certificate: ~
  use_srv_name: false
  name: frontend
  hash_on_cookie: ~
  hash_on_cookie_path: /
  algorithm: round-robin
  host_header: ~
  id: c0645f32-b63d-49ba-a723-5cbef9014c99
  hash_fallback: none
  updated_at: 1741051547
  slots: 1000
  hash_fallback_header: ~
- hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  tags: ~
  hash_on: none
  healthchecks:
    passive:
      healthy:
        http_statuses:
        - 200
        - 201
        - 202
        - 203
        - 204
        - 205
        - 206
        - 207
        - 208
        - 226
        - 300
        - 301
        - 302
        - 303
        - 304
        - 305
        - 306
        - 307
        - 308
        successes: 0
      unhealthy:
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 500
        - 503
      type: http
    active:
      https_verify_certificate: true
      concurrency: 10
      healthy:
        interval: 0
        successes: 0
        http_statuses:
        - 200
        - 302
      unhealthy:
        interval: 0
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
      type: http
      headers: ~
      timeout: 1
      http_path: /
      https_sni: ~
    threshold: 0
  hash_on_header: ~
  created_at: 1731396351
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  client_certificate: ~
  use_srv_name: false
  name: minio
  hash_on_cookie: ~
  hash_on_cookie_path: /
  algorithm: round-robin
  host_header: ~
  id: c6844f11-b711-4f5f-a2d4-4516995790c5
  hash_fallback: none
  updated_at: 1741051547
  slots: 1000
  hash_fallback_header: ~
- hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  tags: ~
  hash_on: none
  healthchecks:
    passive:
      healthy:
        http_statuses:
        - 200
        - 201
        - 202
        - 203
        - 204
        - 205
        - 206
        - 207
        - 208
        - 226
        - 300
        - 301
        - 302
        - 303
        - 304
        - 305
        - 306
        - 307
        - 308
        successes: 0
      unhealthy:
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 500
        - 503
      type: http
    active:
      https_verify_certificate: true
      concurrency: 10
      healthy:
        interval: 0
        successes: 0
        http_statuses:
        - 200
        - 302
      unhealthy:
        interval: 0
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
      type: http
      headers: ~
      timeout: 1
      http_path: /
      https_sni: ~
    threshold: 0
  hash_on_header: ~
  created_at: 1729739594
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  client_certificate: ~
  use_srv_name: false
  name: backend
  hash_on_cookie: ~
  hash_on_cookie_path: /
  algorithm: round-robin
  host_header: ~
  id: e6729ab9-c894-4963-bbdc-dfae17c88096
  hash_fallback: none
  updated_at: 1741051547
  slots: 1000
  hash_fallback_header: ~
- hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  tags: ~
  hash_on: none
  healthchecks:
    passive:
      healthy:
        http_statuses:
        - 200
        - 201
        - 202
        - 203
        - 204
        - 205
        - 206
        - 207
        - 208
        - 226
        - 300
        - 301
        - 302
        - 303
        - 304
        - 305
        - 306
        - 307
        - 308
        successes: 0
      unhealthy:
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 500
        - 503
      type: http
    active:
      https_verify_certificate: true
      concurrency: 10
      healthy:
        interval: 0
        successes: 0
        http_statuses:
        - 200
        - 302
      unhealthy:
        interval: 0
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
      type: http
      headers: ~
      timeout: 1
      http_path: /
      https_sni: ~
    threshold: 0
  hash_on_header: ~
  created_at: 1729739828
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  client_certificate: ~
  use_srv_name: false
  name: emqx
  hash_on_cookie: ~
  hash_on_cookie_path: /
  algorithm: round-robin
  host_header: ~
  id: fa9fc31a-7d71-43bd-a453-c21704b71ac6
  hash_fallback: none
  updated_at: 1741051547
  slots: 1000
  hash_fallback_header: ~
- hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  tags: ~
  hash_on: none
  healthchecks:
    passive:
      healthy:
        http_statuses:
        - 200
        - 201
        - 202
        - 203
        - 204
        - 205
        - 206
        - 207
        - 208
        - 226
        - 300
        - 301
        - 302
        - 303
        - 304
        - 305
        - 306
        - 307
        - 308
        successes: 0
      unhealthy:
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 500
        - 503
      type: http
    active:
      https_verify_certificate: true
      concurrency: 10
      healthy:
        interval: 0
        successes: 0
        http_statuses:
        - 200
        - 302
      unhealthy:
        interval: 0
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
      type: http
      headers: ~
      timeout: 1
      http_path: /
      https_sni: ~
    threshold: 0
  hash_on_header: ~
  created_at: 1733536118
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  client_certificate: ~
  use_srv_name: false
  name: fuxa
  hash_on_cookie: ~
  hash_on_cookie_path: /
  algorithm: round-robin
  host_header: ~
  id: fc85cfef-6e90-4592-a022-730f5d84ed99
  hash_fallback: none
  updated_at: 1741051547
  slots: 1000
  hash_fallback_header: ~
targets:
- weight: 100
  upstream: 00f62da1-73b3-4308-8ae5-856268388aa9
  created_at: 1730264807.829
  updated_at: 1740658918.066
  target: apm:8080
  id: 0be879dd-7ba3-42e3-96a8-5be0c8dcadfe
  tags: ~
- weight: 100
  upstream: 2e9455f1-241d-4a1e-840e-fea66dd9aa09
  created_at: 1729739629.259
  updated_at: 1740658918.07
  target: grafana:3000
  id: 0c66a055-3e1d-4e77-aedd-6de30939a5a2
  tags: ~
- weight: 100
  upstream: 47b5a73e-51c6-4ace-b507-40458125c0a6
  created_at: 1729852918.487
  updated_at: 1740658918.074
  target: gitea:3000
  id: 29a2c68c-7501-49b1-aef1-56e1be3c2d74
  tags: ~
- weight: 100
  upstream: fc85cfef-6e90-4592-a022-730f5d84ed99
  created_at: 1733536131.451
  updated_at: 1740658918.079
  target: fuxa:1881
  id: 2cc80d27-504d-4c1a-afaf-646f6e432fd6
  tags: ~
- weight: 100
  upstream: c6844f11-b711-4f5f-a2d4-4516995790c5
  created_at: 1731397614.344
  updated_at: 1740658918.083
  target: minio:9001
  id: 2f312fcf-baa6-4de0-84aa-0779713ae279
  tags: ~
- weight: 100
  upstream: 2a0fa8a9-98a4-4456-9d2c-faba35b54882
  created_at: 1729737239.883
  updated_at: 1740658918.064
  target: konga:1337
  id: 38ae0eeb-fa36-40a1-8c72-aaa43e7b9ceb
  tags: ~
- weight: 100
  upstream: fa9fc31a-7d71-43bd-a453-c21704b71ac6
  created_at: 1729739844.316
  updated_at: 1740658918.068
  target: emqx:18083
  id: 3ec4626c-673a-4cc1-86fa-10f3b1bdc537
  tags: ~
- weight: 100
  upstream: 220c1252-a48b-4e7e-af42-b134f316ed16
  created_at: 1729739274.174
  updated_at: 1740658918.073
  target: nodered:1880
  id: 5a923a6d-0661-43ad-a668-e89f4980e5a6
  tags: ~
- weight: 100
  upstream: 3f51d2ee-7609-4f71-b6ec-8ded27b417a2
  created_at: 1729739915.095
  updated_at: 1740658918.078
  target: portainer:9443
  id: 78410225-c503-4d2c-885d-c38a72244aa0
  tags: ~
- weight: 100
  upstream: 14bdf793-231d-439e-8d67-3e47a3e7da05
  created_at: 1741754798.218
  updated_at: 1741754798.218
  target: frontend:3001
  id: 7c5e8a1d-6022-42b6-83b7-b1f39739b9df
  tags: ~
- weight: 100
  upstream: ab6fb6a2-97b9-45e7-b508-46df2df5203e
  created_at: 1729739753.711
  updated_at: 1740658918.082
  target: hasura:8080
  id: 8d09a927-4def-479d-8ed9-0473be2a281a
  tags: ~
- weight: 100
  upstream: 14ee49e7-f9bf-4234-a48f-7b7df7dda0ea
  created_at: 1729832116.752
  updated_at: 1740658918.063
  target: keycloak:8080
  id: a4cdac00-4421-4a49-b2ba-b2f720f4998d
  tags: ~
- weight: 100
  upstream: 420478e2-bdc8-49ec-ba0e-cc4cfd41afc8
  created_at: 1729739894.022
  updated_at: 1740658918.067
  target: kibana:5601
  id: afe138dc-2d5e-4329-80ff-a0154b634f42
  tags: ~
- weight: 100
  upstream: e6729ab9-c894-4963-bbdc-dfae17c88096
  created_at: 1729739606.748
  updated_at: 1740658918.071
  target: backend:8080
  id: e401fd6b-6a87-41be-a501-6456afeb14d3
  tags: ~
- weight: 100
  upstream: 09fa87e7-1cf1-4fc3-9ad6-6861572a8ef4
  created_at: 1731459990.339
  updated_at: 1740658918.076
  target: minio:9000
  id: e5f0e5f7-8b6a-476b-ac72-2e4a32bab571
  tags: ~
- weight: 100
  upstream: c0645f32-b63d-49ba-a723-5cbef9014c99
  created_at: 1729914708.061
  updated_at: 1740658918.081
  target: frontend:3000
  id: ef3e3b44-a490-40e8-afac-2b9e2d202643
  tags: ~
- weight: 100
  upstream: 747a43cc-42c4-457a-abac-518c2fe537b3
  created_at: 1729914781.603
  updated_at: 1740658918.085
  target: frontend:4000
  id: f4e24691-4181-42a6-b32c-6c7e8cd92077
  tags: ~
keyauth_credentials:
- created_at: 1734329245
  key: 4174348a-9222-4e81-b33e-5d72d2fd7f1e
  tags: ~
  id: 6b9443ae-73f0-4db6-af00-4f1e3a415dbb
  consumer: 59d1ef15-24a5-4373-b957-e8192c15ff6e
  ttl: ~
