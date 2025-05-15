_transform: false
_format_version: '3.0'
consumers:
- created_at: 1734329209
  updated_at: 1747296459
  tags: []
  custom_id: ~
  id: 59d1ef15-24a5-4373-b957-e8192c15ff6e
  username: open-api
parameters:
- created_at: 1742432166
  value: ce8f9346-2b44-46af-af55-ab141518e1bb
  key: cluster_id
services:
- write_timeout: 60000
  tls_verify: ~
  protocol: http
  tls_verify_depth: ~
  client_certificate: ~
  host: wenhao
  port: 3000
  id: 1f8b86e3-6352-47a3-ac19-01537a11bec9
  enabled: true
  path: ~
  tags: []
  created_at: 1733117004
  updated_at: 1747296459
  ca_certificates: ~
  connect_timeout: 60000
  name: wenhao
  retries: 5
  read_timeout: 60000
- write_timeout: 60000
  tls_verify: ~
  protocol: http
  tls_verify_depth: ~
  client_certificate: ~
  host: grafana
  port: 3000
  id: 228308d0-521c-45f8-a97d-fbe6966efa3c
  enabled: true
  path: ~
  tags: []
  created_at: 1729740320
  updated_at: 1747296459
  ca_certificates: ~
  connect_timeout: 60000
  name: grafana
  retries: 5
  read_timeout: 60000
- write_timeout: 60000
  tls_verify: ~
  protocol: http
  tls_verify_depth: ~
  client_certificate: ~
  host: gitea
  port: 3000
  id: 24a5cd06-6728-48ff-a7c8-1847c836bd59
  enabled: true
  path: ~
  tags: []
  created_at: 1729852876
  updated_at: 1747296459
  ca_certificates: ~
  connect_timeout: 60000
  name: gitea
  retries: 5
  read_timeout: 60000
- write_timeout: 60000
  tls_verify: ~
  protocol: http
  tls_verify_depth: ~
  client_certificate: ~
  host: hasura
  port: 8080
  id: 29bf0a09-9e84-449e-b660-d0c9bf24cab3
  enabled: true
  path: ~
  tags: []
  created_at: 1729740396
  updated_at: 1747296459
  ca_certificates: ~
  connect_timeout: 60000
  name: hasura
  retries: 5
  read_timeout: 60000
- write_timeout: 60000
  tls_verify: ~
  protocol: https
  tls_verify_depth: ~
  client_certificate: ~
  host: portainer
  port: 9443
  id: 2cd97a86-3853-4001-9f0d-7769dc40d508
  enabled: true
  path: ~
  tags: []
  created_at: 1729740912
  updated_at: 1747296459
  ca_certificates: ~
  connect_timeout: 60000
  name: portainer
  retries: 5
  read_timeout: 60000
- write_timeout: 60000
  tls_verify: ~
  protocol: http
  tls_verify_depth: ~
  client_certificate: ~
  host: konga
  port: 1337
  id: 2df2f7c3-792a-4a30-b30c-6011e2f3f916
  enabled: true
  path: /
  tags: []
  created_at: 1729736772
  updated_at: 1747296459
  ca_certificates: ~
  connect_timeout: 60000
  name: konga
  retries: 5
  read_timeout: 60000
- write_timeout: 60000
  tls_verify: ~
  protocol: http
  tls_verify_depth: ~
  client_certificate: ~
  host: backend
  port: 8080
  id: 4007e6c1-6ccc-4747-9b96-7bb3f5f78b32
  enabled: true
  path: /open-api/supos/
  tags: []
  created_at: 1734330146
  updated_at: 1747296459
  ca_certificates: ~
  connect_timeout: 60000
  name: backend-open-api
  retries: 5
  read_timeout: 60000
- write_timeout: 60000
  tls_verify: ~
  protocol: http
  tls_verify_depth: ~
  client_certificate: ~
  host: backend
  port: 8080
  id: 42684a67-ac8f-48d6-ae2b-62e1cd26f9d8
  enabled: true
  path: /service-api/supos/proxy/event/flows
  tags: []
  created_at: 1742976133
  updated_at: 1747296459
  ca_certificates: ~
  connect_timeout: 60000
  name: event-flow-proxy
  retries: 5
  read_timeout: 60000
- write_timeout: 60000
  tls_verify: ~
  protocol: http
  tls_verify_depth: ~
  client_certificate: ~
  host: kibana
  port: 5601
  id: 43a4afb4-cabf-4fd8-a3f4-d8b31408e6dc
  enabled: true
  path: /elastic/home/
  tags: []
  created_at: 1729740779
  updated_at: 1747296459
  ca_certificates: ~
  connect_timeout: 60000
  name: elastic
  retries: 5
  read_timeout: 60000
- write_timeout: 60000
  tls_verify: ~
  protocol: http
  tls_verify_depth: ~
  client_certificate: ~
  host: backend
  port: 8080
  id: 4d210886-a694-416d-847d-95fc597f5921
  enabled: true
  path: /service-api/supos/
  tags: []
  created_at: 1733290847
  updated_at: 1747296459
  ca_certificates: ~
  connect_timeout: 60000
  name: backend-service-api
  retries: 5
  read_timeout: 60000
- write_timeout: 60000
  tls_verify: ~
  protocol: http
  tls_verify_depth: ~
  client_certificate: ~
  host: gateway
  port: 8070
  id: 5e8458a8-7323-4a25-9efa-4d56dbf5fa5b
  enabled: true
  path: /
  tags: []
  created_at: 1732610867
  updated_at: 1747296459
  ca_certificates: ~
  connect_timeout: 60000
  name: gateway
  retries: 5
  read_timeout: 60000
- write_timeout: 60000
  tls_verify: ~
  protocol: http
  tls_verify_depth: ~
  client_certificate: ~
  host: backend
  port: 8080
  id: 5f70fd49-e3d7-4ba8-b152-62eca6ec4455
  enabled: true
  path: /inter-api/supos/
  tags: []
  created_at: 1729740054
  updated_at: 1747296459
  ca_certificates: ~
  connect_timeout: 60000
  name: backend
  retries: 5
  read_timeout: 60000
- write_timeout: 60000
  tls_verify: ~
  protocol: http
  tls_verify_depth: ~
  client_certificate: ~
  host: backend
  port: 8080
  id: 61c91a4e-3e0c-4253-abad-de0a0ff72369
  enabled: true
  path: /swagger-ui/
  tags: []
  created_at: 1736404121
  updated_at: 1747296459
  ca_certificates: ~
  connect_timeout: 60000
  name: open-api-docs
  retries: 5
  read_timeout: 60000
- write_timeout: 60000
  tls_verify: ~
  protocol: http
  tls_verify_depth: ~
  client_certificate: ~
  host: minio
  port: 9001
  id: 647747b1-8efe-45b6-b37f-430f5e5139d6
  enabled: true
  path: /
  tags: []
  created_at: 1731396402
  updated_at: 1747296459
  ca_certificates: ~
  connect_timeout: 60000
  name: minio
  retries: 5
  read_timeout: 60000
- write_timeout: 60000
  tls_verify: ~
  protocol: http
  tls_verify_depth: ~
  client_certificate: ~
  host: eventflow
  port: 1889
  id: 6a3bcaba-7ba3-4c3b-b5c2-1a8ecbc571ac
  enabled: true
  path: ~
  tags: []
  created_at: 1742536198
  updated_at: 1747296459
  ca_certificates: ~
  connect_timeout: 60000
  name: EventFlow
  retries: 5
  read_timeout: 60000
- write_timeout: 60000
  tls_verify: ~
  protocol: http
  tls_verify_depth: ~
  client_certificate: ~
  host: backend
  port: 8080
  id: 75a7373b-4dda-4a49-b1f8-de6ebee4d4c8
  enabled: true
  path: /files
  tags: []
  created_at: 1741670682
  updated_at: 1747296459
  ca_certificates: ~
  connect_timeout: 60000
  name: backend-files
  retries: 5
  read_timeout: 60000
- write_timeout: 60000
  tls_verify: ~
  protocol: http
  tls_verify_depth: ~
  client_certificate: ~
  host: TDengineUI
  port: 3000
  id: 776a9d80-b936-4e00-b892-3861b19dd954
  enabled: true
  path: ~
  tags: []
  created_at: 1742538082
  updated_at: 1747296459
  ca_certificates: ~
  connect_timeout: 60000
  name: TDengineUI
  retries: 5
  read_timeout: 60000
- write_timeout: 60000
  tls_verify: ~
  protocol: http
  tls_verify_depth: ~
  client_certificate: ~
  host: emqx
  port: 18083
  id: 89c6a77c-e3e6-4149-a0e7-6ace7fd0413b
  enabled: true
  path: ~
  tags: []
  created_at: 1729740676
  updated_at: 1747296459
  ca_certificates: ~
  connect_timeout: 60000
  name: emqx
  retries: 5
  read_timeout: 60000
- write_timeout: 60000
  tls_verify: ~
  protocol: http
  tls_verify_depth: ~
  client_certificate: ~
  host: frontend
  port: 3000
  id: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  enabled: true
  path: ~
  tags:
  - root:frontend
  - Home:1
  - EventFlow:4
  - menu.tag.devtools:5
  - menu.tag.uns:1
  - menu.tag.appspace:6
  - menu.tag.system:7
  - SourceFlow:3
  - Namespace:2
  created_at: 1729738059
  updated_at: 1747297224
  ca_certificates: ~
  connect_timeout: 60000
  name: frontend
  retries: 5
  read_timeout: 60000
- write_timeout: 60000
  tls_verify: ~
  protocol: http
  tls_verify_depth: ~
  client_certificate: ~
  host: fuxa
  port: 1881
  id: abdb1947-dbbf-4a85-ac55-50969ac0ed85
  enabled: true
  path: ~
  tags: []
  created_at: 1733732987
  updated_at: 1747296459
  ca_certificates: ~
  connect_timeout: 60000
  name: fuxa
  retries: 5
  read_timeout: 60000
- write_timeout: 60000
  tls_verify: ~
  protocol: http
  tls_verify_depth: ~
  client_certificate: ~
  host: backend
  port: 8080
  id: b096bcf5-2984-4acc-9bd5-a570a7653fcd
  enabled: true
  path: /service-api/supos/proxy/flows
  tags: []
  created_at: 1730685511
  updated_at: 1747296459
  ca_certificates: ~
  connect_timeout: 60000
  name: node-red-proxy
  retries: 5
  read_timeout: 60000
- write_timeout: 60000
  tls_verify: ~
  protocol: http
  tls_verify_depth: ~
  client_certificate: ~
  host: keycloak
  port: 8080
  id: b2a70de2-d5db-4755-b8ba-b205d8fbb680
  enabled: true
  path: /
  tags: []
  created_at: 1729740513
  updated_at: 1747296459
  ca_certificates: ~
  connect_timeout: 60000
  name: keycloak
  retries: 5
  read_timeout: 60000
- write_timeout: 60000
  tls_verify: ~
  protocol: http
  tls_verify_depth: ~
  client_certificate: ~
  host: nodered
  port: 1880
  id: bba8a174-4679-49df-8bf9-ae9285f1e77e
  enabled: true
  path: ~
  tags: []
  created_at: 1729739239
  updated_at: 1747296459
  ca_certificates: ~
  connect_timeout: 60000
  name: nodered
  retries: 5
  read_timeout: 60000
- write_timeout: 60000
  tls_verify: ~
  protocol: http
  tls_verify_depth: ~
  client_certificate: ~
  host: chat2db
  port: 10824
  id: c53d8d7a-962e-4561-accc-ddf6447336df
  enabled: true
  path: /
  tags: []
  created_at: 1741747300
  updated_at: 1747296459
  ca_certificates: ~
  connect_timeout: 60000
  name: chat2db-backend
  retries: 5
  read_timeout: 60000
- write_timeout: 60000
  tls_verify: ~
  protocol: http
  tls_verify_depth: ~
  client_certificate: ~
  host: nodered
  port: 1883
  id: c8af139a-b55e-4afb-a98f-13857004231c
  enabled: true
  path: /nodered-api/
  tags: []
  created_at: 1745569827
  updated_at: 1747296459
  ca_certificates: ~
  connect_timeout: 60000
  name: nodered-backend
  retries: 5
  read_timeout: 60000
- write_timeout: 60000
  tls_verify: ~
  protocol: http
  tls_verify_depth: ~
  client_certificate: ~
  host: minio-inter
  port: 9000
  id: cc3e8a53-82e1-4f6e-bde6-75207ca2f6d3
  enabled: true
  path: ~
  tags: []
  created_at: 1731460027
  updated_at: 1747296459
  ca_certificates: ~
  connect_timeout: 60000
  name: minio-inter
  retries: 5
  read_timeout: 60000
- write_timeout: 60000
  tls_verify: ~
  protocol: http
  tls_verify_depth: ~
  client_certificate: ~
  host: platform
  port: 3001
  id: d9ac42d8-9d41-41e3-a80f-4b64cc215bcf
  enabled: true
  path: /
  tags: []
  created_at: 1741747189
  updated_at: 1747296459
  ca_certificates: ~
  connect_timeout: 60000
  name: chat2db
  retries: 5
  read_timeout: 60000
- write_timeout: 60000
  tls_verify: ~
  protocol: http
  tls_verify_depth: ~
  client_certificate: ~
  host: keycloak
  port: 8080
  id: e3e88607-311a-4c23-a9c7-bb879efc463e
  enabled: true
  path: /realms/supos/protocol/openid-connect/auth
  tags: []
  created_at: 1732105495
  updated_at: 1747296459
  ca_certificates: ~
  connect_timeout: 60000
  name: login
  retries: 5
  read_timeout: 60000
- write_timeout: 60000
  tls_verify: ~
  protocol: http
  tls_verify_depth: ~
  client_certificate: ~
  host: apm
  port: 8080
  id: f145ba5c-e9aa-48a6-8a10-9ee476010f7f
  enabled: true
  path: ~
  tags: []
  created_at: 1730264819
  updated_at: 1747296459
  ca_certificates: ~
  connect_timeout: 60000
  name: apm
  retries: 5
  read_timeout: 60000
- write_timeout: 600000
  tls_verify: ~
  protocol: http
  tls_verify_depth: ~
  client_certificate: ~
  host: copilotkit
  port: 4000
  id: f8fd7fd2-d8f6-47d7-9c54-aa51a24a68ad
  enabled: true
  path: /copilotkit
  tags: []
  created_at: 1729748350
  updated_at: 1747296459
  ca_certificates: ~
  connect_timeout: 600000
  name: GenerativeUI
  retries: 5
  read_timeout: 600000
- write_timeout: 60000
  tls_verify: ~
  protocol: http
  tls_verify_depth: ~
  client_certificate: ~
  host: mcpclient
  port: 3000
  id: fbc56015-44d7-42ba-ac9f-abe725bc2478
  enabled: true
  path: ~
  tags: []
  created_at: 1742543141
  updated_at: 1747296459
  ca_certificates: ~
  connect_timeout: 60000
  name: mcpclient
  retries: 5
  read_timeout: 60000
routes:
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /elastic/home/app/discover#/?_g=(filters:!(),refreshInterval:(pause:!t,value:60000),time:(from:now-15m,to:now))&_a=(columns:!(container.name,message),dataSource:(type:dataView),filters:!(),grid:(columns:(container.name:(width:301))),index:'31d5c920-8e8a-11ef-80e3-d78ebb901f76',interval:auto,query:(language:kuery,query:''),sort:!(!('@timestamp',desc)))
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags:
  - none
  - description:menu.desc.logs
  - sort:7
  - parentName:menu.tag.system
  created_at: 1730253324
  updated_at: 1747296460
  id: 050c90d4-b22d-4d44-a159-0d35c949a111
  service: 43a4afb4-cabf-4fd8-a3f4-d8b31408e6dc
  request_buffering: true
  name: Logs
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags: ~
  created_at: 1742538180
  updated_at: 1747296460
  id: 0e566d44-48f2-442e-a7e9-b288926f3e88
  service: 776a9d80-b936-4e00-b892-3861b19dd954
  request_buffering: true
  name: TDengineUI
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /grafana/home/
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags: ~
  created_at: 1730270842
  updated_at: 1747296460
  id: 10c662d8-8304-439b-85a0-398ae09d09e8
  service: 228308d0-521c-45f8-a97d-fbe6966efa3c
  request_buffering: true
  name: grafana-inter
  preserve_host: true
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /gitea/home/user/login?redirect_to=/gitea/home/
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags:
  - description:menu.desc.cicd
  - sort:1
  - parentName:menu.tag.devtools
  - none
  created_at: 1730254514
  updated_at: 1747296460
  id: 15023439-25a9-481d-90a5-894d4d87d3bf
  service: 24a5cd06-6728-48ff-a7c8-1847c836bd59
  request_buffering: true
  name: CICD
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /app-display
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags:
  - none
  - description:menu.desc.genApps
  - sort:2
  - parentName:menu.tag.appspace
  created_at: 1731311256
  updated_at: 1747296460
  id: 1dfa8b71-07e8-41a5-a07d-536fa0e295a2
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  request_buffering: true
  name: GenApps
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /open-api/graphql/
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags: ~
  created_at: 1734328715
  updated_at: 1747296460
  id: 1fe717e7-804d-473b-b12b-7f5f68b5ec48
  service: 29bf0a09-9e84-449e-b660-d0c9bf24cab3
  request_buffering: true
  name: open-hasura-graphql
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /apps/freezonex-aps/
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags: ~
  created_at: 1730265781
  updated_at: 1747296460
  id: 209f6169-707c-49f1-86cc-602bc4674b2e
  service: f145ba5c-e9aa-48a6-8a10-9ee476010f7f
  request_buffering: true
  name: apm-backend-iner
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /emqx/home/
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags:
  - description:menu.desc.mqttBroker
  - menu
  - parentName:menu.tag.system
  - sort:3
  created_at: 1729740717
  updated_at: 1747296460
  id: 215cdb87-6e13-4e2e-804f-9ea1ac2ff417
  service: 89c6a77c-e3e6-4149-a0e7-6ace7fd0413b
  request_buffering: true
  name: MqttBroker
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: false
  paths:
  - /dashboard
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags: ~
  created_at: 1747292731
  updated_at: 1747296460
  id: 283b512d-233d-4c30-bc35-f9c4129acec0
  service: 6a3bcaba-7ba3-4c3b-b5c2-1a8ecbc571ac
  request_buffering: true
  name: Dashboard2
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /copilotkit
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags: ~
  created_at: 1729748378
  updated_at: 1747296459
  id: 29027b71-49ce-41d1-96fc-14bcb3a2da00
  service: f8fd7fd2-d8f6-47d7-9c54-aa51a24a68ad
  request_buffering: true
  name: copilotkit
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /alert
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags:
  - none
  - parentName:menu.tag.devtools
  - description:menu.desc.alert
  - sort:2
  created_at: 1734346408
  updated_at: 1747296460
  id: 33b0281c-dea4-4e2b-a523-4b335953fed9
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  request_buffering: true
  name: Alert
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /inter-api/supos/
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags: ~
  created_at: 1729740083
  updated_at: 1747296460
  id: 3794799e-0c23-4065-a88d-7a08c46fbaf4
  service: 5f70fd49-e3d7-4ba8-b152-62eca6ec4455
  request_buffering: true
  name: backend
  preserve_host: true
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /nodered/home/flows
  methods:
  - GET
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags: []
  created_at: 1730685544
  updated_at: 1747296460
  id: 3f8f8bf7-4d53-4a11-bc6d-d017beda8695
  service: b096bcf5-2984-4acc-9bd5-a570a7653fcd
  request_buffering: true
  name: node-red-flows
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /eventflow/home/
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags: []
  created_at: 1742536226
  updated_at: 1747296460
  id: 45a9fec1-6eaa-49c5-ae00-7aa180f1efde
  service: 6a3bcaba-7ba3-4c3b-b5c2-1a8ecbc571ac
  request_buffering: true
  name: EventFlowBackend
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /uns
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags:
  - menu
  - description:menu.desc.dataModeling
  - homeParentName:menu.tag.uns
  - homeIconUrl:homeNamespace
  - sort:1
  created_at: 1731311044
  updated_at: 1747296879
  id: 4d89ed56-90bf-490d-ac8c-30def8be2e2c
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  request_buffering: true
  name: Namespace
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /chat2db/home/connections
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags:
  - menu
  - parentName:menu.tag.devtools
  - description:menu.desc.dbconnect
  - sort:2
  created_at: 1741747272
  updated_at: 1747296460
  id: 4e5336db-053c-4c9f-a773-bb83a2557ffb
  service: d9ac42d8-9d41-41e3-a80f-4b64cc215bcf
  request_buffering: true
  name: DBConnect
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /hasura/home/
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags:
  - description:menu.desc.graphQL
  created_at: 1729740461
  updated_at: 1747296460
  id: 4f4b9999-c921-4ca8-9eef-63db46e6b2b5
  service: 29bf0a09-9e84-449e-b660-d0c9bf24cab3
  request_buffering: true
  name: graphQL
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /service-api/supos/
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags: ~
  created_at: 1733290917
  updated_at: 1747296460
  id: 5a0cdda1-0ac2-4255-a4bc-a11a8b4a00d5
  service: 4d210886-a694-416d-847d-95fc597f5921
  request_buffering: true
  name: backend-service-api
  preserve_host: true
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: false
  paths:
  - /mcpclient/home
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags:
  - none
  - parentName:menu.tag.appspace
  - description:menu.desc.mcpclient
  - sort:3
  created_at: 1742543248
  updated_at: 1747296460
  id: 6239b86d-4ef1-48d9-b512-7b05306ab705
  service: fbc56015-44d7-42ba-ac9f-abe725bc2478
  request_buffering: true
  name: McpClient
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /files
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags: ~
  created_at: 1741671187
  updated_at: 1747296460
  id: 670008e2-5811-4d9d-b925-5429d16caa8f
  service: 75a7373b-4dda-4a49-b1f8-de6ebee4d4c8
  request_buffering: true
  name: backend-files
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /open-api/restapi/
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags: ~
  created_at: 1734328933
  updated_at: 1747296460
  id: 6856a277-bcae-43a3-992c-81fc5c605baf
  service: 29bf0a09-9e84-449e-b660-d0c9bf24cab3
  request_buffering: true
  name: open-hasura-restapi
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /gateway
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags: ~
  created_at: 1732611195
  updated_at: 1747296460
  id: 6ce6b319-0e38-4bf4-ba1d-4d043a926ba7
  service: 5e8458a8-7323-4a25-9efa-4d56dbf5fa5b
  request_buffering: true
  name: gateway
  preserve_host: true
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: false
  paths:
  - /apps/freezonex-aps/apsfrontend/
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags: ~
  created_at: 1730264872
  updated_at: 1747296460
  id: 6f2a8d9e-d76f-46b9-b2d4-27286651433d
  service: f145ba5c-e9aa-48a6-8a10-9ee476010f7f
  request_buffering: true
  name: apm-frontend-inter
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /chat2db/
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags: ~
  created_at: 1741747323
  updated_at: 1747296460
  id: 78e5de54-af01-4eff-bb5d-bfbde4f35835
  service: c53d8d7a-962e-4561-accc-ddf6447336df
  request_buffering: true
  name: chat2dbapi
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /konga/home/
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags:
  - description:menu.desc.konga
  - sort:1
  - parentName:menu.tag.system
  - menu
  created_at: 1729736896
  updated_at: 1747296460
  id: 79d5e57d-340c-4d18-93ee-a6a8f4a0f212
  service: 2df2f7c3-792a-4a30-b30c-6011e2f3f916
  request_buffering: true
  name: RoutingManagement
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /elastic/home/
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags: []
  created_at: 1729740838
  updated_at: 1747296460
  id: 8154564f-57c9-4de4-a605-a204c46bf15a
  service: 43a4afb4-cabf-4fd8-a3f4-d8b31408e6dc
  request_buffering: true
  name: elastic-inter
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: false
  paths:
  - /apsfrontend/dashboard
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags:
  - description:menu.desc.apm
  created_at: 1730265586
  updated_at: 1747296460
  id: 833d37e3-05bb-4a1d-992c-0a0e5c19b0dd
  service: f145ba5c-e9aa-48a6-8a10-9ee476010f7f
  request_buffering: true
  name: apm
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /streams
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags:
  - parentName:menu.tag.connections
  created_at: 1733209593
  updated_at: 1747296460
  id: 8613d94b-0fd7-4b81-8f9d-ac5df267b7e3
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  request_buffering: true
  name: StreamProcessing
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /fuxa/home/
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags:
  - parentName:menu.tag.connections
  created_at: 1733733028
  updated_at: 1747296460
  id: 86fbf4ad-d446-47e3-a9ba-00ead9113c17
  service: abdb1947-dbbf-4a85-ac55-50969ac0ed85
  request_buffering: true
  name: LowCodeTool
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags:
  - menuPort:13020
  - menuProtocol:http
  - menuHost:127.0.0.1
  - description:The llm webUI which is  easy to use
  created_at: 1733117175
  updated_at: 1747296459
  id: 95100aa4-a76b-481c-8485-56eb1f71a529
  service: 1f8b86e3-6352-47a3-ac19-01537a11bec9
  request_buffering: true
  name: Ollama
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /open-api/supos/
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags: ~
  created_at: 1734330177
  updated_at: 1747296459
  id: 9df937e7-2ffb-49f4-b60b-4bb5b551419a
  service: 4007e6c1-6ccc-4747-9b96-7bb3f5f78b32
  request_buffering: true
  name: open-backend-api
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /collection-flow
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags:
  - menu
  - description:menu.desc.nodered.flow
  - homeParentName:menu.tag.uns
  - homeIconUrl:homeSourceFlow
  - sort:2
  created_at: 1731311377
  updated_at: 1747296851
  id: a13bb597-9740-4dde-929e-d140c286d869
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  request_buffering: true
  name: SourceFlow
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /swagger-ui
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags: []
  created_at: 1736404187
  updated_at: 1747296460
  id: a1f72e00-26fa-47a6-997c-a3c6c6aef9e7
  service: 61c91a4e-3e0c-4253-abad-de0a0ff72369
  request_buffering: true
  name: open-api-docs
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /app-space
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags:
  - none
  - description:menu.desc.generativeUI
  - parentName:menu.tag.appspace
  - sort:2
  created_at: 1731311359
  updated_at: 1747296460
  id: a2060aa0-88e5-4247-9635-f93438bbdd84
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  request_buffering: true
  name: GenerativeUI
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /workflow
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags:
  - parentName:menu.tag.settings
  created_at: 1741573643
  updated_at: 1747296460
  id: a5040934-75dd-40c6-94ea-9497ab2b0579
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  request_buffering: true
  name: workflow
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /minio/home/
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags:
  - description:menu.desc.objectStorageServer
  - sort:200
  created_at: 1731396438
  updated_at: 1747296460
  id: a6d04fe9-a464-493c-8f3a-4750fdd93a32
  service: 647747b1-8efe-45b6-b37f-430f5e5139d6
  request_buffering: true
  name: objectStorageServer
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /nodered-api/
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags: ~
  created_at: 1745569857
  updated_at: 1747296460
  id: a867deba-ad15-4059-aeda-4d5c8c551d59
  service: c8af139a-b55e-4afb-a98f-13857004231c
  request_buffering: true
  name: nodered-backend
  preserve_host: true
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /grafana/home/dashboards/
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags:
  - description:menu.desc.grafana
  created_at: 1730270517
  updated_at: 1747296460
  id: aa02bbb9-6459-43bd-9b65-91d89c8854dd
  service: 228308d0-521c-45f8-a97d-fbe6966efa3c
  request_buffering: true
  name: grafana
  preserve_host: true
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /keycloak/home/auth/
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags: ~
  created_at: 1731473911
  updated_at: 1747296460
  id: b610973a-764e-4cef-910e-0794f334e4bd
  service: b2a70de2-d5db-4755-b8ba-b205d8fbb680
  request_buffering: true
  name: keycloak-auth
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /EventFlow
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags:
  - menu
  - homeParentName:menu.tag.uns
  - description:menu.desc.eventflow
  - homeIconUrl:homeEventFlow
  - sort:3
  created_at: 1742968905
  updated_at: 1747296460
  id: b8262364-32bf-4422-9d6c-04b97bc8c3a7
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  request_buffering: true
  name: EventFlow
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /supos-login
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags: ~
  created_at: 1732108769
  updated_at: 1747296460
  id: ba7b2df9-b0d8-4b6b-844d-43f935f3181f
  service: e3e88607-311a-4c23-a9c7-bb879efc463e
  request_buffering: true
  name: login
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags: ~
  created_at: 1729738250
  updated_at: 1747296460
  id: c2dececa-99f4-45e1-9859-01e88352bd58
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  request_buffering: true
  name: frontend
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /home
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags:
  - menu
  - description:menu.desc.home
  - sort:1
  created_at: 1731635333
  updated_at: 1747296460
  id: c90b4b7a-8a51-4f40-b4e2-6c0a40be1b15
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  request_buffering: true
  name: Home
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /keycloak/home/
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags:
  - description:menu.desc.keycloak
  - menu
  - sort:2
  - parentName:menu.tag.system
  created_at: 1729740574
  updated_at: 1747296460
  id: d0cea78f-1e0d-4b90-98ea-980a455bf5f5
  service: b2a70de2-d5db-4755-b8ba-b205d8fbb680
  request_buffering: true
  name: Authentication
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /dashboards
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags:
  - menu
  - description:menu.desc.dashboards
  - parentName:menu.tag.system
  - sort:5
  created_at: 1730770040
  updated_at: 1747296460
  id: d2a81d6f-8b2a-4b28-8929-3c51ccd16021
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  request_buffering: true
  name: Dashboards
  preserve_host: true
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /minio/inter/
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags: ~
  created_at: 1731460050
  updated_at: 1747296459
  id: dbb92267-e886-4ee8-b758-a9f9e9af1998
  service: cc3e8a53-82e1-4f6e-bde6-75207ca2f6d3
  request_buffering: true
  name: minio-inter
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /gitea/home/
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags: []
  created_at: 1729852903
  updated_at: 1747296460
  id: e3459f2d-fcb2-412e-87fc-b098d8906b7e
  service: 24a5cd06-6728-48ff-a7c8-1847c836bd59
  request_buffering: true
  name: gitea-inter
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /chat2db/home/
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags: ~
  created_at: 1741747250
  updated_at: 1747296460
  id: e3ff5178-c156-47e6-90f4-ec2a45b05953
  service: d9ac42d8-9d41-41e3-a80f-4b64cc215bcf
  request_buffering: true
  name: chat2db-inter
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /eventflow/home/flows
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags: []
  created_at: 1742976255
  updated_at: 1747296460
  id: e8e7fe7d-16ba-415a-8d19-e2c41b76b365
  service: 42684a67-ac8f-48d6-ae2b-62e1cd26f9d8
  request_buffering: true
  name: event-node-flows
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /chat2db/home/workspace
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags:
  - menu
  - parentName:menu.tag.devtools
  - description:menu.desc.sqledit
  - sort:4
  created_at: 1741747220
  updated_at: 1747296460
  id: ed108474-cc43-4b66-b92a-5de38f061c6d
  service: d9ac42d8-9d41-41e3-a80f-4b64cc215bcf
  request_buffering: true
  name: SQLEditor
  preserve_host: true
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /advanced-use
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags:
  - menu
  - description:menu.desc.advanceUse
  - sort:9
  - parentName:menu.tag.system
  created_at: 1734056913
  updated_at: 1747296460
  id: f0a59836-7eea-45b3-b188-51c45c68f305
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  request_buffering: true
  name: AdvancedUse
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /account-management
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags:
  - menu
  - description:menu.desc.account
  - parentName:menu.tag.system
  - sort:4
  created_at: 1732696995
  updated_at: 1747296460
  id: f610002e-8e5c-424a-9fdc-e86d754b3142
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  request_buffering: true
  name: UserManagement
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /nodered/home/
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags: []
  created_at: 1729739343
  updated_at: 1747296460
  id: f8bccdbf-46fd-4dd7-aafe-d1a8e13c3450
  service: bba8a174-4679-49df-8bf9-ae9285f1e77e
  request_buffering: true
  name: NodeRed
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /portainer/home/
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags:
  - description:menu.desc.dockerMgmt
  - menu
  - sort:6
  - parentName:menu.tag.system
  created_at: 1729740933
  updated_at: 1747296460
  id: fb690c3a-e09e-4fcf-aad1-5d357c1938ec
  service: 2cd97a86-3853-4001-9f0d-7769dc40d508
  request_buffering: true
  name: ContainerManagement
  preserve_host: false
- headers: ~
  regex_priority: 0
  sources: ~
  https_redirect_status_code: 426
  destinations: ~
  strip_path: true
  paths:
  - /aboutus
  methods: ~
  response_buffering: true
  path_handling: v1
  protocols:
  - http
  - https
  snis: ~
  hosts: ~
  tags:
  - menu
  - description:menu.desc.aboutus
  - parentName:menu.tag.system
  - sort:8
  created_at: 1733822464
  updated_at: 1747296460
  id: fb8efe62-0030-4540-a521-a3b4215b4f59
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  request_buffering: true
  name: AboutUs
  preserve_host: false
plugins:
- consumer: ~
  protocols:
  - grpc
  - grpcs
  - http
  - https
  route: ~
  enabled: false
  tags: ~
  created_at: 1733799127
  updated_at: 1747296460
  instance_name: ~
  service: ~
  config:
    login_url: http://127.0.0.1:8088/keycloak/home/auth/realms/supos/protocol/openid-connect/auth?client_id=supos&redirect_uri=http://127.0.0.1:8088/inter-api/supos/auth/token&response_type=code&scope=openid
    whitelist_paths:
    - ^/inter-api/supos/auth.*$
    - ^/inter-api/supos/systemConfig.*$
    - ^/$
    - ^/assets.*$
    - ^/locale.*$
    - ^/logo.*$
    - ^/gitea.*git.*$
    - ^/supos-login.*$
    - ^/403$
    - ^/open-api/.*$
    - ^/keycloak.*$
    - ^/files.*$
    - ^/test/.*$
    forbidden_url: /403
    enable_resource_check: true
    enable_deny_check: true
  name: supos-auth-checker
  id: 1845ee75-d704-40e1-a8b0-aa2baaf9d71b
- consumer: ~
  protocols:
  - grpc
  - grpcs
  - http
  - https
  route: 9df937e7-2ffb-49f4-b60b-4bb5b551419a
  enabled: true
  tags: ~
  created_at: 1734330234
  updated_at: 1747296460
  instance_name: ~
  service: ~
  config:
    anonymous: ~
    key_in_header: true
    key_in_query: true
    run_on_preflight: true
    key_in_body: false
    hide_credentials: false
    realm: ~
    key_names:
    - apikey
  name: key-auth
  id: 2285421f-56e3-4510-be12-69fa1040d810
- consumer: ~
  protocols:
  - grpc
  - grpcs
  - http
  - https
  route: ~
  enabled: true
  tags: ~
  created_at: 1734073535
  updated_at: 1747296460
  instance_name: ~
  service: e3e88607-311a-4c23-a9c7-bb879efc463e
  config:
    add:
      headers: []
      querystring: []
      body: []
    rename:
      headers: []
      querystring: []
      body: []
    append:
      headers: []
      querystring:
      - client_id:supos
      - response_type:code
      - scope:openid
      - redirect_uri:http://127.0.0.1:8088/inter-api/supos/auth/token
      body: []
    replace:
      headers: []
      uri: ~
      querystring: []
      body: []
    http_method: ~
    remove:
      headers: []
      querystring: []
      body: []
  name: request-transformer
  id: 46bda5cf-63ea-401f-9f06-b9e024aa5597
- consumer: ~
  protocols:
  - grpc
  - grpcs
  - http
  - https
  route: 1fe717e7-804d-473b-b12b-7f5f68b5ec48
  enabled: true
  tags: ~
  created_at: 1734329742
  updated_at: 1747296460
  instance_name: ~
  service: ~
  config:
    anonymous: ~
    key_in_header: true
    key_in_query: true
    run_on_preflight: true
    key_in_body: false
    hide_credentials: false
    realm: ~
    key_names:
    - apikey
  name: key-auth
  id: 4e339a48-e193-4bc7-99ba-94f2e1e18a8f
- consumer: ~
  protocols:
  - grpc
  - grpcs
  - http
  - https
  route: ~
  enabled: true
  tags: ~
  created_at: 1734073759
  updated_at: 1747296460
  instance_name: ~
  service: e3e88607-311a-4c23-a9c7-bb879efc463e
  config:
    add:
      json: []
      json_types: []
      headers: []
    rename:
      json: []
      headers: []
    append:
      json: []
      json_types: []
      headers:
      - X-Frame-Options:DENY
      - Content-Security-Policy:frame-ancestors 'none'
    replace:
      json: []
      json_types: []
      headers: []
    remove:
      json: []
      headers:
      - x-frame-options
      - Content-Security-Policy
  name: response-transformer
  id: 73285cac-cf4e-4368-bf8f-d3285f9686d4
- consumer: ~
  protocols:
  - grpc
  - grpcs
  - http
  - https
  route: 6856a277-bcae-43a3-992c-81fc5c605baf
  enabled: true
  tags: ~
  created_at: 1734329166
  updated_at: 1747296460
  instance_name: ~
  service: ~
  config:
    anonymous: ~
    key_in_header: true
    key_in_query: true
    run_on_preflight: true
    key_in_body: false
    hide_credentials: false
    realm: ~
    key_names:
    - apikey
  name: key-auth
  id: 9e4c8423-76d1-498d-8883-b9b18bdbf161
- consumer: ~
  protocols:
  - grpc
  - grpcs
  - http
  - https
  route: a6d04fe9-a464-493c-8f3a-4750fdd93a32
  enabled: true
  tags: ~
  created_at: 1731400906
  updated_at: 1747296460
  instance_name: ~
  service: ~
  config:
    add:
      json: []
      json_types: []
      headers:
      - X-Frame-Options:SAMEORIGIN
    rename:
      json: []
      headers: []
    append:
      json: []
      json_types: []
      headers: []
    replace:
      json: []
      json_types: []
      headers: []
    remove:
      json: []
      headers:
      - X-Frame-Options
  name: response-transformer
  id: b5722a76-60b9-483d-90ac-e5de173264e2
- consumer: ~
  protocols:
  - grpc
  - grpcs
  - http
  - https
  route: ba7b2df9-b0d8-4b6b-844d-43f935f3181f
  enabled: true
  tags: ~
  created_at: 1734014838
  updated_at: 1747296460
  instance_name: ~
  service: ~
  config:
    home_url: /home
  name: supos-url-transformer
  id: f45e7fd0-74e5-4b36-b265-5df962eb1b58
upstreams:
- hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  healthchecks:
    active:
      headers: ~
      https_sni: ~
      https_verify_certificate: true
      type: http
      timeout: 1
      concurrency: 10
      healthy:
        interval: 0
        http_statuses:
        - 200
        - 302
        successes: 0
      http_path: /
      unhealthy:
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        interval: 0
    threshold: 0
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
  hash_on: none
  client_certificate: ~
  hash_on_header: ~
  hash_on_query_arg: ~
  id: 00f62da1-73b3-4308-8ae5-856268388aa9
  hash_on_uri_capture: ~
  host_header: ~
  hash_on_cookie: ~
  slots: 1000
  tags: ~
  hash_on_cookie_path: /
  updated_at: 1747296460
  use_srv_name: false
  algorithm: round-robin
  name: apm
  created_at: 1730264799
  hash_fallback: none
- hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  healthchecks:
    active:
      headers: ~
      https_sni: ~
      https_verify_certificate: true
      type: http
      timeout: 1
      concurrency: 10
      healthy:
        interval: 0
        http_statuses:
        - 200
        - 302
        successes: 0
      http_path: /
      unhealthy:
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        interval: 0
    threshold: 0
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
  hash_on: none
  client_certificate: ~
  hash_on_header: ~
  hash_on_query_arg: ~
  id: 09fa87e7-1cf1-4fc3-9ad6-6861572a8ef4
  hash_on_uri_capture: ~
  host_header: ~
  hash_on_cookie: ~
  slots: 1000
  tags: ~
  hash_on_cookie_path: /
  updated_at: 1747296460
  use_srv_name: false
  algorithm: round-robin
  name: minio-inter
  created_at: 1731459961
  hash_fallback: none
- hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  healthchecks:
    active:
      headers: ~
      https_sni: ~
      https_verify_certificate: true
      type: http
      timeout: 1
      concurrency: 10
      healthy:
        interval: 0
        http_statuses:
        - 200
        - 302
        successes: 0
      http_path: /
      unhealthy:
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        interval: 0
    threshold: 0
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
  hash_on: none
  client_certificate: ~
  hash_on_header: ~
  hash_on_query_arg: ~
  id: 14bdf793-231d-439e-8d67-3e47a3e7da05
  hash_on_uri_capture: ~
  host_header: ~
  hash_on_cookie: ~
  slots: 1000
  tags: ~
  hash_on_cookie_path: /
  updated_at: 1747296460
  use_srv_name: false
  algorithm: round-robin
  name: platform
  created_at: 1741754738
  hash_fallback: none
- hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  healthchecks:
    active:
      headers: ~
      https_sni: ~
      https_verify_certificate: true
      type: http
      timeout: 1
      concurrency: 10
      healthy:
        interval: 0
        http_statuses:
        - 200
        - 302
        successes: 0
      http_path: /
      unhealthy:
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        interval: 0
    threshold: 0
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
  hash_on: none
  client_certificate: ~
  hash_on_header: ~
  hash_on_query_arg: ~
  id: 14ee49e7-f9bf-4234-a48f-7b7df7dda0ea
  hash_on_uri_capture: ~
  host_header: ~
  hash_on_cookie: ~
  slots: 1000
  tags: ~
  hash_on_cookie_path: /
  updated_at: 1747296460
  use_srv_name: false
  algorithm: round-robin
  name: keycloak
  created_at: 1729739799
  hash_fallback: none
- hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  healthchecks:
    active:
      headers: ~
      https_sni: ~
      https_verify_certificate: true
      type: http
      timeout: 1
      concurrency: 10
      healthy:
        interval: 0
        http_statuses:
        - 200
        - 302
        successes: 0
      http_path: /
      unhealthy:
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        interval: 0
    threshold: 0
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
  hash_on: none
  client_certificate: ~
  hash_on_header: ~
  hash_on_query_arg: ~
  id: 220c1252-a48b-4e7e-af42-b134f316ed16
  hash_on_uri_capture: ~
  host_header: ~
  hash_on_cookie: ~
  slots: 1000
  tags: ~
  hash_on_cookie_path: /
  updated_at: 1747296460
  use_srv_name: false
  algorithm: round-robin
  name: nodered
  created_at: 1729739256
  hash_fallback: none
- hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  healthchecks:
    active:
      headers: ~
      https_sni: ~
      https_verify_certificate: true
      type: http
      timeout: 1
      concurrency: 10
      healthy:
        interval: 0
        http_statuses:
        - 200
        - 302
        successes: 0
      http_path: /
      unhealthy:
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        interval: 0
    threshold: 0
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
  hash_on: none
  client_certificate: ~
  hash_on_header: ~
  hash_on_query_arg: ~
  id: 2a0fa8a9-98a4-4456-9d2c-faba35b54882
  hash_on_uri_capture: ~
  host_header: ~
  hash_on_cookie: ~
  slots: 1000
  tags: ~
  hash_on_cookie_path: /
  updated_at: 1747296460
  use_srv_name: false
  algorithm: round-robin
  name: konga
  created_at: 1729737217
  hash_fallback: none
- hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  healthchecks:
    active:
      headers: ~
      https_sni: ~
      https_verify_certificate: true
      type: http
      timeout: 1
      concurrency: 10
      healthy:
        interval: 0
        http_statuses:
        - 200
        - 302
        successes: 0
      http_path: /
      unhealthy:
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        interval: 0
    threshold: 0
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
  hash_on: none
  client_certificate: ~
  hash_on_header: ~
  hash_on_query_arg: ~
  id: 2e9455f1-241d-4a1e-840e-fea66dd9aa09
  hash_on_uri_capture: ~
  host_header: ~
  hash_on_cookie: ~
  slots: 1000
  tags: ~
  hash_on_cookie_path: /
  updated_at: 1747296460
  use_srv_name: false
  algorithm: round-robin
  name: grafana
  created_at: 1729739617
  hash_fallback: none
- hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  healthchecks:
    active:
      headers: ~
      https_sni: ~
      https_verify_certificate: true
      type: http
      timeout: 1
      concurrency: 10
      healthy:
        interval: 0
        http_statuses:
        - 200
        - 302
        successes: 0
      http_path: /
      unhealthy:
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        interval: 0
    threshold: 0
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
  hash_on: none
  client_certificate: ~
  hash_on_header: ~
  hash_on_query_arg: ~
  id: 3f51d2ee-7609-4f71-b6ec-8ded27b417a2
  hash_on_uri_capture: ~
  host_header: ~
  hash_on_cookie: ~
  slots: 1000
  tags: ~
  hash_on_cookie_path: /
  updated_at: 1747296460
  use_srv_name: false
  algorithm: round-robin
  name: portainer
  created_at: 1729739903
  hash_fallback: none
- hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  healthchecks:
    active:
      headers: ~
      https_sni: ~
      https_verify_certificate: true
      type: http
      timeout: 1
      concurrency: 10
      healthy:
        interval: 0
        http_statuses:
        - 200
        - 302
        successes: 0
      http_path: /
      unhealthy:
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        interval: 0
    threshold: 0
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
  hash_on: none
  client_certificate: ~
  hash_on_header: ~
  hash_on_query_arg: ~
  id: 420478e2-bdc8-49ec-ba0e-cc4cfd41afc8
  hash_on_uri_capture: ~
  host_header: ~
  hash_on_cookie: ~
  slots: 1000
  tags: ~
  hash_on_cookie_path: /
  updated_at: 1747296460
  use_srv_name: false
  algorithm: round-robin
  name: kibana
  created_at: 1729739883
  hash_fallback: none
- hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  healthchecks:
    active:
      headers: ~
      https_sni: ~
      https_verify_certificate: true
      type: http
      timeout: 1
      concurrency: 10
      healthy:
        interval: 0
        http_statuses:
        - 200
        - 302
        successes: 0
      http_path: /
      unhealthy:
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        interval: 0
    threshold: 0
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
  hash_on: none
  client_certificate: ~
  hash_on_header: ~
  hash_on_query_arg: ~
  id: 47b5a73e-51c6-4ace-b507-40458125c0a6
  hash_on_uri_capture: ~
  host_header: ~
  hash_on_cookie: ~
  slots: 1000
  tags: ~
  hash_on_cookie_path: /
  updated_at: 1747296460
  use_srv_name: false
  algorithm: round-robin
  name: gitea
  created_at: 1729852910
  hash_fallback: none
- hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  healthchecks:
    active:
      headers: ~
      https_sni: ~
      https_verify_certificate: true
      type: http
      timeout: 1
      concurrency: 10
      healthy:
        interval: 0
        http_statuses:
        - 200
        - 302
        successes: 0
      http_path: /
      unhealthy:
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        interval: 0
    threshold: 0
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
  hash_on: none
  client_certificate: ~
  hash_on_header: ~
  hash_on_query_arg: ~
  id: 747a43cc-42c4-457a-abac-518c2fe537b3
  hash_on_uri_capture: ~
  host_header: ~
  hash_on_cookie: ~
  slots: 1000
  tags: ~
  hash_on_cookie_path: /
  updated_at: 1747296460
  use_srv_name: false
  algorithm: round-robin
  name: copilotkit
  created_at: 1729739930
  hash_fallback: none
- hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  healthchecks:
    active:
      headers: ~
      https_sni: ~
      https_verify_certificate: true
      type: http
      timeout: 1
      concurrency: 10
      healthy:
        interval: 0
        http_statuses:
        - 200
        - 302
        successes: 0
      http_path: /
      unhealthy:
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        interval: 0
    threshold: 0
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
  hash_on: none
  client_certificate: ~
  hash_on_header: ~
  hash_on_query_arg: ~
  id: ab6fb6a2-97b9-45e7-b508-46df2df5203e
  hash_on_uri_capture: ~
  host_header: ~
  hash_on_cookie: ~
  slots: 1000
  tags: ~
  hash_on_cookie_path: /
  updated_at: 1747296460
  use_srv_name: false
  algorithm: round-robin
  name: hasura
  created_at: 1729739734
  hash_fallback: none
- hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  healthchecks:
    active:
      headers: ~
      https_sni: ~
      https_verify_certificate: true
      type: http
      timeout: 1
      concurrency: 10
      healthy:
        interval: 0
        http_statuses:
        - 200
        - 302
        successes: 0
      http_path: /
      unhealthy:
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        interval: 0
    threshold: 0
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
  hash_on: none
  client_certificate: ~
  hash_on_header: ~
  hash_on_query_arg: ~
  id: c0645f32-b63d-49ba-a723-5cbef9014c99
  hash_on_uri_capture: ~
  host_header: ~
  hash_on_cookie: ~
  slots: 1000
  tags: ~
  hash_on_cookie_path: /
  updated_at: 1747296460
  use_srv_name: false
  algorithm: round-robin
  name: frontend
  created_at: 1729737694
  hash_fallback: none
- hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  healthchecks:
    active:
      headers: ~
      https_sni: ~
      https_verify_certificate: true
      type: http
      timeout: 1
      concurrency: 10
      healthy:
        interval: 0
        http_statuses:
        - 200
        - 302
        successes: 0
      http_path: /
      unhealthy:
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        interval: 0
    threshold: 0
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
  hash_on: none
  client_certificate: ~
  hash_on_header: ~
  hash_on_query_arg: ~
  id: c6844f11-b711-4f5f-a2d4-4516995790c5
  hash_on_uri_capture: ~
  host_header: ~
  hash_on_cookie: ~
  slots: 1000
  tags: ~
  hash_on_cookie_path: /
  updated_at: 1747296460
  use_srv_name: false
  algorithm: round-robin
  name: minio
  created_at: 1731396351
  hash_fallback: none
- hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  healthchecks:
    active:
      headers: ~
      https_sni: ~
      https_verify_certificate: true
      type: http
      timeout: 1
      concurrency: 10
      healthy:
        interval: 0
        http_statuses:
        - 200
        - 302
        successes: 0
      http_path: /
      unhealthy:
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        interval: 0
    threshold: 0
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
  hash_on: none
  client_certificate: ~
  hash_on_header: ~
  hash_on_query_arg: ~
  id: e6729ab9-c894-4963-bbdc-dfae17c88096
  hash_on_uri_capture: ~
  host_header: ~
  hash_on_cookie: ~
  slots: 1000
  tags: ~
  hash_on_cookie_path: /
  updated_at: 1747296460
  use_srv_name: false
  algorithm: round-robin
  name: backend
  created_at: 1729739594
  hash_fallback: none
- hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  healthchecks:
    active:
      headers: ~
      https_sni: ~
      https_verify_certificate: true
      type: http
      timeout: 1
      concurrency: 10
      healthy:
        interval: 0
        http_statuses:
        - 200
        - 302
        successes: 0
      http_path: /
      unhealthy:
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        interval: 0
    threshold: 0
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
  hash_on: none
  client_certificate: ~
  hash_on_header: ~
  hash_on_query_arg: ~
  id: fa9fc31a-7d71-43bd-a453-c21704b71ac6
  hash_on_uri_capture: ~
  host_header: ~
  hash_on_cookie: ~
  slots: 1000
  tags: ~
  hash_on_cookie_path: /
  updated_at: 1747296460
  use_srv_name: false
  algorithm: round-robin
  name: emqx
  created_at: 1729739828
  hash_fallback: none
- hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  healthchecks:
    active:
      headers: ~
      https_sni: ~
      https_verify_certificate: true
      type: http
      timeout: 1
      concurrency: 10
      healthy:
        interval: 0
        http_statuses:
        - 200
        - 302
        successes: 0
      http_path: /
      unhealthy:
        http_statuses:
        - 429
        - 404
        - 500
        - 501
        - 502
        - 503
        - 504
        - 505
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
        interval: 0
    threshold: 0
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
  hash_on: none
  client_certificate: ~
  hash_on_header: ~
  hash_on_query_arg: ~
  id: fc85cfef-6e90-4592-a022-730f5d84ed99
  hash_on_uri_capture: ~
  host_header: ~
  hash_on_cookie: ~
  slots: 1000
  tags: ~
  hash_on_cookie_path: /
  updated_at: 1747296460
  use_srv_name: false
  algorithm: round-robin
  name: fuxa
  created_at: 1733536118
  hash_fallback: none
targets:
- weight: 100
  tags: ~
  created_at: 1730264807.829
  updated_at: 1747296460.343
  id: 0be879dd-7ba3-42e3-96a8-5be0c8dcadfe
  upstream: 00f62da1-73b3-4308-8ae5-856268388aa9
  target: apm:8080
- weight: 100
  tags: ~
  created_at: 1729739629.259
  updated_at: 1747296460.349
  id: 0c66a055-3e1d-4e77-aedd-6de30939a5a2
  upstream: 2e9455f1-241d-4a1e-840e-fea66dd9aa09
  target: grafana:3000
- weight: 100
  tags: ~
  created_at: 1729852918.487
  updated_at: 1747296460.353
  id: 29a2c68c-7501-49b1-aef1-56e1be3c2d74
  upstream: 47b5a73e-51c6-4ace-b507-40458125c0a6
  target: gitea:3000
- weight: 100
  tags: ~
  created_at: 1733536131.451
  updated_at: 1747296460.311
  id: 2cc80d27-504d-4c1a-afaf-646f6e432fd6
  upstream: fc85cfef-6e90-4592-a022-730f5d84ed99
  target: fuxa:1881
- weight: 100
  tags: ~
  created_at: 1731397614.344
  updated_at: 1747296460.32
  id: 2f312fcf-baa6-4de0-84aa-0779713ae279
  upstream: c6844f11-b711-4f5f-a2d4-4516995790c5
  target: minio:9001
- weight: 100
  tags: ~
  created_at: 1729737239.883
  updated_at: 1747296460.326
  id: 38ae0eeb-fa36-40a1-8c72-aaa43e7b9ceb
  upstream: 2a0fa8a9-98a4-4456-9d2c-faba35b54882
  target: konga:1337
- weight: 100
  tags: ~
  created_at: 1729739844.316
  updated_at: 1747296460.333
  id: 3ec4626c-673a-4cc1-86fa-10f3b1bdc537
  upstream: fa9fc31a-7d71-43bd-a453-c21704b71ac6
  target: emqx:18083
- weight: 100
  tags: ~
  created_at: 1729739274.174
  updated_at: 1747296460.361
  id: 5a923a6d-0661-43ad-a668-e89f4980e5a6
  upstream: 220c1252-a48b-4e7e-af42-b134f316ed16
  target: nodered:1880
- weight: 100
  tags: ~
  created_at: 1729739915.095
  updated_at: 1747296460.341
  id: 78410225-c503-4d2c-885d-c38a72244aa0
  upstream: 3f51d2ee-7609-4f71-b6ec-8ded27b417a2
  target: portainer:9443
- weight: 100
  tags: ~
  created_at: 1741754798.218
  updated_at: 1747296460.346
  id: 7c5e8a1d-6022-42b6-83b7-b1f39739b9df
  upstream: 14bdf793-231d-439e-8d67-3e47a3e7da05
  target: frontend:3001
- weight: 100
  tags: ~
  created_at: 1729739753.711
  updated_at: 1747296460.351
  id: 8d09a927-4def-479d-8ed9-0473be2a281a
  upstream: ab6fb6a2-97b9-45e7-b508-46df2df5203e
  target: hasura:8080
- weight: 100
  tags: ~
  created_at: 1729832116.752
  updated_at: 1747296460.355
  id: a4cdac00-4421-4a49-b2ba-b2f720f4998d
  upstream: 14ee49e7-f9bf-4234-a48f-7b7df7dda0ea
  target: keycloak:8080
- weight: 100
  tags: ~
  created_at: 1729739894.022
  updated_at: 1747296460.318
  id: afe138dc-2d5e-4329-80ff-a0154b634f42
  upstream: 420478e2-bdc8-49ec-ba0e-cc4cfd41afc8
  target: kibana:5601
- weight: 100
  tags: ~
  created_at: 1729739606.748
  updated_at: 1747296460.323
  id: e401fd6b-6a87-41be-a501-6456afeb14d3
  upstream: e6729ab9-c894-4963-bbdc-dfae17c88096
  target: backend:8080
- weight: 100
  tags: ~
  created_at: 1731459990.339
  updated_at: 1747296460.329
  id: e5f0e5f7-8b6a-476b-ac72-2e4a32bab571
  upstream: 09fa87e7-1cf1-4fc3-9ad6-6861572a8ef4
  target: minio:9000
- weight: 100
  tags: ~
  created_at: 1729914708.061
  updated_at: 1747296460.336
  id: ef3e3b44-a490-40e8-afac-2b9e2d202643
  upstream: c0645f32-b63d-49ba-a723-5cbef9014c99
  target: frontend:3000
- weight: 100
  tags: ~
  created_at: 1729914781.603
  updated_at: 1747296460.358
  id: f4e24691-4181-42a6-b32c-6c7e8cd92077
  upstream: 747a43cc-42c4-457a-abac-518c2fe537b3
  target: frontend:4000
keyauth_credentials:
- created_at: 1734329245
  ttl: ~
  id: 6b9443ae-73f0-4db6-af00-4f1e3a415dbb
  key: 4174348a-9222-4e81-b33e-5d72d2fd7f1e
  tags: ~
  consumer: 59d1ef15-24a5-4373-b957-e8192c15ff6e
