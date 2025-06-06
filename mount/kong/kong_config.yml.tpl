_format_version: '3.0'
_transform: false
consumers:
- created_at: 1734329209
  id: 59d1ef15-24a5-4373-b957-e8192c15ff6e
  updated_at: 1745574422
  tags: []
  custom_id: ~
  username: open-api
parameters:
- created_at: 1742432166
  value: ce8f9346-2b44-46af-af55-ab141518e1bb
  key: cluster_id
services:
- tls_verify: ~
  id: 1f8b86e3-6352-47a3-ac19-01537a11bec9
  tls_verify_depth: ~
  name: wenhao
  host: wenhao
  port: 3000
  client_certificate: ~
  connect_timeout: 60000
  ca_certificates: ~
  read_timeout: 60000
  created_at: 1733117004
  updated_at: 1745574422
  enabled: true
  path: ~
  write_timeout: 60000
  retries: 5
  protocol: http
  tags: []
- tls_verify: ~
  id: 228308d0-521c-45f8-a97d-fbe6966efa3c
  tls_verify_depth: ~
  name: grafana
  host: grafana
  port: 3000
  client_certificate: ~
  connect_timeout: 60000
  ca_certificates: ~
  read_timeout: 60000
  created_at: 1729740320
  updated_at: 1745574422
  enabled: true
  path: ~
  write_timeout: 60000
  retries: 5
  protocol: http
  tags: []
- tls_verify: ~
  id: 24a5cd06-6728-48ff-a7c8-1847c836bd59
  tls_verify_depth: ~
  name: gitea
  host: gitea
  port: 3000
  client_certificate: ~
  connect_timeout: 60000
  ca_certificates: ~
  read_timeout: 60000
  created_at: 1729852876
  updated_at: 1745574422
  enabled: true
  path: ~
  write_timeout: 60000
  retries: 5
  protocol: http
  tags: []
- tls_verify: ~
  id: 29bf0a09-9e84-449e-b660-d0c9bf24cab3
  tls_verify_depth: ~
  name: hasura
  host: hasura
  port: 8080
  client_certificate: ~
  connect_timeout: 60000
  ca_certificates: ~
  read_timeout: 60000
  created_at: 1729740396
  updated_at: 1745574422
  enabled: true
  path: ~
  write_timeout: 60000
  retries: 5
  protocol: http
  tags: []
- tls_verify: ~
  id: 2cd97a86-3853-4001-9f0d-7769dc40d508
  tls_verify_depth: ~
  name: portainer
  host: portainer
  port: 9443
  client_certificate: ~
  connect_timeout: 60000
  ca_certificates: ~
  read_timeout: 60000
  created_at: 1729740912
  updated_at: 1745574422
  enabled: true
  path: ~
  write_timeout: 60000
  retries: 5
  protocol: https
  tags: []
- tls_verify: ~
  id: 2df2f7c3-792a-4a30-b30c-6011e2f3f916
  tls_verify_depth: ~
  name: konga
  host: konga
  port: 1337
  client_certificate: ~
  connect_timeout: 60000
  ca_certificates: ~
  read_timeout: 60000
  created_at: 1729736772
  updated_at: 1745574422
  enabled: true
  path: /
  write_timeout: 60000
  retries: 5
  protocol: http
  tags: []
- tls_verify: ~
  id: 4007e6c1-6ccc-4747-9b96-7bb3f5f78b32
  tls_verify_depth: ~
  name: backend-open-api
  host: backend
  port: 8080
  client_certificate: ~
  connect_timeout: 60000
  ca_certificates: ~
  read_timeout: 60000
  created_at: 1734330146
  updated_at: 1745574422
  enabled: true
  path: /open-api/supos/
  write_timeout: 60000
  retries: 5
  protocol: http
  tags: []
- tls_verify: ~
  id: 42684a67-ac8f-48d6-ae2b-62e1cd26f9d8
  tls_verify_depth: ~
  name: event-flow-proxy
  host: backend
  port: 8080
  client_certificate: ~
  connect_timeout: 60000
  ca_certificates: ~
  read_timeout: 60000
  created_at: 1742976133
  updated_at: 1745574422
  enabled: true
  path: /service-api/supos/proxy/event/flows
  write_timeout: 60000
  retries: 5
  protocol: http
  tags: []
- tls_verify: ~
  id: 43a4afb4-cabf-4fd8-a3f4-d8b31408e6dc
  tls_verify_depth: ~
  name: elastic
  host: kibana
  port: 5601
  client_certificate: ~
  connect_timeout: 60000
  ca_certificates: ~
  read_timeout: 60000
  created_at: 1729740779
  updated_at: 1745574422
  enabled: true
  path: /elastic/home/
  write_timeout: 60000
  retries: 5
  protocol: http
  tags: []
- tls_verify: ~
  id: 4d210886-a694-416d-847d-95fc597f5921
  tls_verify_depth: ~
  name: backend-service-api
  host: backend
  port: 8080
  client_certificate: ~
  connect_timeout: 60000
  ca_certificates: ~
  read_timeout: 60000
  created_at: 1733290847
  updated_at: 1745574422
  enabled: true
  path: /service-api/supos/
  write_timeout: 60000
  retries: 5
  protocol: http
  tags: []
- tls_verify: ~
  id: 5e8458a8-7323-4a25-9efa-4d56dbf5fa5b
  tls_verify_depth: ~
  name: gateway
  host: gateway
  port: 8070
  client_certificate: ~
  connect_timeout: 60000
  ca_certificates: ~
  read_timeout: 60000
  created_at: 1732610867
  updated_at: 1745574422
  enabled: true
  path: /
  write_timeout: 60000
  retries: 5
  protocol: http
  tags: []
- tls_verify: ~
  id: 5f70fd49-e3d7-4ba8-b152-62eca6ec4455
  tls_verify_depth: ~
  name: backend
  host: backend
  port: 8080
  client_certificate: ~
  connect_timeout: 60000
  ca_certificates: ~
  read_timeout: 60000
  created_at: 1729740054
  updated_at: 1745574422
  enabled: true
  path: /inter-api/supos/
  write_timeout: 60000
  retries: 5
  protocol: http
  tags: []
- tls_verify: ~
  id: 61c91a4e-3e0c-4253-abad-de0a0ff72369
  tls_verify_depth: ~
  name: open-api-docs
  host: backend
  port: 8080
  client_certificate: ~
  connect_timeout: 60000
  ca_certificates: ~
  read_timeout: 60000
  created_at: 1736404121
  updated_at: 1745574422
  enabled: true
  path: /swagger-ui/
  write_timeout: 60000
  retries: 5
  protocol: http
  tags: []
- tls_verify: ~
  id: 647747b1-8efe-45b6-b37f-430f5e5139d6
  tls_verify_depth: ~
  name: minio
  host: minio
  port: 9001
  client_certificate: ~
  connect_timeout: 60000
  ca_certificates: ~
  read_timeout: 60000
  created_at: 1731396402
  updated_at: 1745574422
  enabled: true
  path: /
  write_timeout: 60000
  retries: 5
  protocol: http
  tags: []
- tls_verify: ~
  id: 6a3bcaba-7ba3-4c3b-b5c2-1a8ecbc571ac
  tls_verify_depth: ~
  name: EventFlow
  host: eventflow
  port: 1889
  client_certificate: ~
  connect_timeout: 60000
  ca_certificates: ~
  read_timeout: 60000
  created_at: 1742536198
  updated_at: 1745574422
  enabled: true
  path: ~
  write_timeout: 60000
  retries: 5
  protocol: http
  tags: []
- tls_verify: ~
  id: 75a7373b-4dda-4a49-b1f8-de6ebee4d4c8
  tls_verify_depth: ~
  name: backend-files
  host: backend
  port: 8080
  client_certificate: ~
  connect_timeout: 60000
  ca_certificates: ~
  read_timeout: 60000
  created_at: 1741670682
  updated_at: 1745574422
  enabled: true
  path: /files
  write_timeout: 60000
  retries: 5
  protocol: http
  tags: []
- tls_verify: ~
  id: 776a9d80-b936-4e00-b892-3861b19dd954
  tls_verify_depth: ~
  name: TDengineUI
  host: TDengineUI
  port: 3000
  client_certificate: ~
  connect_timeout: 60000
  ca_certificates: ~
  read_timeout: 60000
  created_at: 1742538082
  updated_at: 1745574422
  enabled: true
  path: ~
  write_timeout: 60000
  retries: 5
  protocol: http
  tags: []
- tls_verify: ~
  id: 89c6a77c-e3e6-4149-a0e7-6ace7fd0413b
  tls_verify_depth: ~
  name: emqx
  host: emqx
  port: 18083
  client_certificate: ~
  connect_timeout: 60000
  ca_certificates: ~
  read_timeout: 60000
  created_at: 1729740676
  updated_at: 1745574422
  enabled: true
  path: ~
  write_timeout: 60000
  retries: 5
  protocol: http
  tags: []
- tls_verify: ~
  id: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  tls_verify_depth: ~
  name: frontend
  host: frontend
  port: 3000
  client_certificate: ~
  connect_timeout: 60000
  ca_certificates: ~
  read_timeout: 60000
  created_at: 1729738059
  updated_at: 1745574422
  enabled: true
  path: ~
  write_timeout: 60000
  retries: 5
  protocol: http
  tags:
  - root:frontend
  - Home:1
  - SourceFlow:3
  - Namespace:2
  - EventFlow:4
  - menu.tag.devtools:5
  - menu.tag.uns:1
  - menu.tag.appspace:6
  - menu.tag.system:7
- tls_verify: ~
  id: abdb1947-dbbf-4a85-ac55-50969ac0ed85
  tls_verify_depth: ~
  name: fuxa
  host: fuxa
  port: 1881
  client_certificate: ~
  connect_timeout: 60000
  ca_certificates: ~
  read_timeout: 60000
  created_at: 1733732987
  updated_at: 1745574422
  enabled: true
  path: ~
  write_timeout: 60000
  retries: 5
  protocol: http
  tags: []
- tls_verify: ~
  id: b096bcf5-2984-4acc-9bd5-a570a7653fcd
  tls_verify_depth: ~
  name: node-red-proxy
  host: backend
  port: 8080
  client_certificate: ~
  connect_timeout: 60000
  ca_certificates: ~
  read_timeout: 60000
  created_at: 1730685511
  updated_at: 1745574422
  enabled: true
  path: /service-api/supos/proxy/flows
  write_timeout: 60000
  retries: 5
  protocol: http
  tags: []
- tls_verify: ~
  id: b2a70de2-d5db-4755-b8ba-b205d8fbb680
  tls_verify_depth: ~
  name: keycloak
  host: keycloak
  port: 8080
  client_certificate: ~
  connect_timeout: 60000
  ca_certificates: ~
  read_timeout: 60000
  created_at: 1729740513
  updated_at: 1745574422
  enabled: true
  path: /
  write_timeout: 60000
  retries: 5
  protocol: http
  tags: []
- tls_verify: ~
  id: bba8a174-4679-49df-8bf9-ae9285f1e77e
  tls_verify_depth: ~
  name: nodered
  host: nodered
  port: 1880
  client_certificate: ~
  connect_timeout: 60000
  ca_certificates: ~
  read_timeout: 60000
  created_at: 1729739239
  updated_at: 1745574422
  enabled: true
  path: ~
  write_timeout: 60000
  retries: 5
  protocol: http
  tags: []
- tls_verify: ~
  id: c53d8d7a-962e-4561-accc-ddf6447336df
  tls_verify_depth: ~
  name: chat2db-backend
  host: chat2db
  port: 10824
  client_certificate: ~
  connect_timeout: 60000
  ca_certificates: ~
  read_timeout: 60000
  created_at: 1741747300
  updated_at: 1745574422
  enabled: true
  path: /
  write_timeout: 60000
  retries: 5
  protocol: http
  tags: []
- tls_verify: ~
  id: c8af139a-b55e-4afb-a98f-13857004231c
  tls_verify_depth: ~
  name: nodered-backend
  host: nodered
  port: 1883
  client_certificate: ~
  connect_timeout: 60000
  ca_certificates: ~
  read_timeout: 60000
  created_at: 1745569827
  updated_at: 1745569827
  enabled: true
  path: /nodered-api/
  write_timeout: 60000
  retries: 5
  protocol: http
  tags: []
- tls_verify: ~
  id: cc3e8a53-82e1-4f6e-bde6-75207ca2f6d3
  tls_verify_depth: ~
  name: minio-inter
  host: minio-inter
  port: 9000
  client_certificate: ~
  connect_timeout: 60000
  ca_certificates: ~
  read_timeout: 60000
  created_at: 1731460027
  updated_at: 1745574422
  enabled: true
  path: ~
  write_timeout: 60000
  retries: 5
  protocol: http
  tags: []
- tls_verify: ~
  id: d9ac42d8-9d41-41e3-a80f-4b64cc215bcf
  tls_verify_depth: ~
  name: chat2db
  host: platform
  port: 3001
  client_certificate: ~
  connect_timeout: 60000
  ca_certificates: ~
  read_timeout: 60000
  created_at: 1741747189
  updated_at: 1745574422
  enabled: true
  path: /
  write_timeout: 60000
  retries: 5
  protocol: http
  tags: []
- tls_verify: ~
  id: e3e88607-311a-4c23-a9c7-bb879efc463e
  tls_verify_depth: ~
  name: login
  host: keycloak
  port: 8080
  client_certificate: ~
  connect_timeout: 60000
  ca_certificates: ~
  read_timeout: 60000
  created_at: 1732105495
  updated_at: 1745574422
  enabled: true
  path: /realms/supos/protocol/openid-connect/auth
  write_timeout: 60000
  retries: 5
  protocol: http
  tags: []
- tls_verify: ~
  id: f145ba5c-e9aa-48a6-8a10-9ee476010f7f
  tls_verify_depth: ~
  name: apm
  host: apm
  port: 8080
  client_certificate: ~
  connect_timeout: 60000
  ca_certificates: ~
  read_timeout: 60000
  created_at: 1730264819
  updated_at: 1745574422
  enabled: true
  path: ~
  write_timeout: 60000
  retries: 5
  protocol: http
  tags: []
- tls_verify: ~
  id: f8fd7fd2-d8f6-47d7-9c54-aa51a24a68ad
  tls_verify_depth: ~
  name: GenerativeUI
  host: copilotkit
  port: 4000
  client_certificate: ~
  connect_timeout: 600000
  ca_certificates: ~
  read_timeout: 600000
  created_at: 1729748350
  updated_at: 1745574422
  enabled: true
  path: /copilotkit
  write_timeout: 600000
  retries: 5
  protocol: http
  tags: []
- tls_verify: ~
  id: fbc56015-44d7-42ba-ac9f-abe725bc2478
  tls_verify_depth: ~
  name: mcpclient
  host: mcpclient
  port: 3000
  client_certificate: ~
  connect_timeout: 60000
  ca_certificates: ~
  read_timeout: 60000
  created_at: 1742543141
  updated_at: 1745574422
  enabled: true
  path: ~
  write_timeout: 60000
  retries: 5
  protocol: http
  tags: []
routes:
- preserve_host: false
  id: 050c90d4-b22d-4d44-a159-0d35c949a111
  paths:
  - /elastic/home/app/discover#/?_g=(filters:!(),refreshInterval:(pause:!t,value:60000),time:(from:now-15m,to:now))&_a=(columns:!(container.name,message),dataSource:(type:dataView),filters:!(),grid:(columns:(container.name:(width:301))),index:'31d5c920-8e8a-11ef-80e3-d78ebb901f76',interval:auto,query:(language:kuery,query:''),sort:!(!('@timestamp',desc)))
  regex_priority: 0
  name: Logs
  https_redirect_status_code: 426
  strip_path: true
  service: 43a4afb4-cabf-4fd8-a3f4-d8b31408e6dc
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags:
  - ${ENABLE_ELK_MENU}
  - description:menu.desc.logs
  - sort:7
  - parentName:menu.tag.system
  path_handling: v1
  created_at: 1730253324
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: 0e566d44-48f2-442e-a7e9-b288926f3e88
  paths:
  - /
  regex_priority: 0
  name: TDengineUI
  https_redirect_status_code: 426
  strip_path: true
  service: 776a9d80-b936-4e00-b892-3861b19dd954
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags: ~
  path_handling: v1
  created_at: 1742538180
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: true
  id: 10c662d8-8304-439b-85a0-398ae09d09e8
  paths:
  - /grafana/home/
  regex_priority: 0
  name: grafana-inter
  https_redirect_status_code: 426
  strip_path: true
  service: 228308d0-521c-45f8-a97d-fbe6966efa3c
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags: ~
  path_handling: v1
  created_at: 1730270842
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: 15023439-25a9-481d-90a5-894d4d87d3bf
  paths:
  - /gitea/home/user/login?redirect_to=/gitea/home/
  regex_priority: 0
  name: CICD
  https_redirect_status_code: 426
  strip_path: true
  service: 24a5cd06-6728-48ff-a7c8-1847c836bd59
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags:
  - description:menu.desc.cicd
  - sort:1
  - parentName:menu.tag.devtools
  - ${ENABLE_GITEA_MENU}
  path_handling: v1
  created_at: 1730254514
  sources: ~
  hosts: ~

  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: 1dfa8b71-07e8-41a5-a07d-536fa0e295a2
  paths:
  - /app-display
  regex_priority: 0
  name: GenApps
  https_redirect_status_code: 426
  strip_path: true
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags:
  - ${ENABLE_GITEA_MENU}
  - description:menu.desc.genApps
  - sort:2
  - parentName:menu.tag.appspace
  path_handling: v1
  created_at: 1731311256
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: 1fe717e7-804d-473b-b12b-7f5f68b5ec48
  paths:
  - /open-api/graphql/
  regex_priority: 0
  name: open-hasura-graphql
  https_redirect_status_code: 426
  strip_path: true
  service: 29bf0a09-9e84-449e-b660-d0c9bf24cab3
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags: ~
  path_handling: v1
  created_at: 1734328715
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: 209f6169-707c-49f1-86cc-602bc4674b2e
  paths:
  - /apps/freezonex-aps/
  regex_priority: 0
  name: apm-backend-iner
  https_redirect_status_code: 426
  strip_path: true
  service: f145ba5c-e9aa-48a6-8a10-9ee476010f7f
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags: ~
  path_handling: v1
  created_at: 1730265781
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: 215cdb87-6e13-4e2e-804f-9ea1ac2ff417
  paths:
  - /emqx/home/
  regex_priority: 0
  name: MqttBroker
  https_redirect_status_code: 426
  strip_path: true
  service: 89c6a77c-e3e6-4149-a0e7-6ace7fd0413b
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags:
  - description:menu.desc.mqttBroker
  - menu
  - parentName:menu.tag.system
  - sort:3
  path_handling: v1
  created_at: 1729740717
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: 29027b71-49ce-41d1-96fc-14bcb3a2da00
  paths:
  - /copilotkit
  regex_priority: 0
  name: copilotkit
  https_redirect_status_code: 426
  strip_path: true
  service: f8fd7fd2-d8f6-47d7-9c54-aa51a24a68ad
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags: ~
  path_handling: v1
  created_at: 1729748378
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: 33b0281c-dea4-4e2b-a523-4b335953fed9
  paths:
  - /alert
  regex_priority: 0
  name: Alert
  https_redirect_status_code: 426
  strip_path: true
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags:
  - none
  - parentName:menu.tag.devtools
  - description:menu.desc.alert
  - sort:2
  path_handling: v1
  created_at: 1734346408
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: true
  id: 3794799e-0c23-4065-a88d-7a08c46fbaf4
  paths:
  - /inter-api/supos/
  regex_priority: 0
  name: backend
  https_redirect_status_code: 426
  strip_path: true
  service: 5f70fd49-e3d7-4ba8-b152-62eca6ec4455
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags: ~
  path_handling: v1
  created_at: 1729740083
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: 3f8f8bf7-4d53-4a11-bc6d-d017beda8695
  paths:
  - /nodered/home/flows
  regex_priority: 0
  name: node-red-flows
  https_redirect_status_code: 426
  strip_path: true
  service: b096bcf5-2984-4acc-9bd5-a570a7653fcd
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags: []
  path_handling: v1
  created_at: 1730685544
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods:
  - GET
- preserve_host: false
  id: 45a9fec1-6eaa-49c5-ae00-7aa180f1efde
  paths:
  - /eventflow/home/
  regex_priority: 0
  name: EventFlowBackend
  https_redirect_status_code: 426
  strip_path: true
  service: 6a3bcaba-7ba3-4c3b-b5c2-1a8ecbc571ac
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags: []
  path_handling: v1
  created_at: 1742536226
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: 4d89ed56-90bf-490d-ac8c-30def8be2e2c
  paths:
  - /uns
  regex_priority: 0
  name: Namespace
  https_redirect_status_code: 426
  strip_path: true
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags:
  - menu
  - description:menu.desc.dataModeling
  - homeParentName:menu.tag.uns
  - homeIconUrl:homeNamespace
  - sort:1
  path_handling: v1
  created_at: 1731311044
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: 4e5336db-053c-4c9f-a773-bb83a2557ffb
  paths:
  - /chat2db/home/connections
  regex_priority: 0
  name: DBConnect
  https_redirect_status_code: 426
  strip_path: true
  service: d9ac42d8-9d41-41e3-a80f-4b64cc215bcf
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags:
  - menu
  - parentName:menu.tag.devtools
  - description:menu.desc.dbconnect
  - sort:2
  path_handling: v1
  created_at: 1741747272
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: 4f4b9999-c921-4ca8-9eef-63db46e6b2b5
  paths:
  - /hasura/home/
  regex_priority: 0
  name: graphQL
  https_redirect_status_code: 426
  strip_path: true
  service: 29bf0a09-9e84-449e-b660-d0c9bf24cab3
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags:
  - description:menu.desc.graphQL
  path_handling: v1
  created_at: 1729740461
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: true
  id: 5a0cdda1-0ac2-4255-a4bc-a11a8b4a00d5
  paths:
  - /service-api/supos/
  regex_priority: 0
  name: backend-service-api
  https_redirect_status_code: 426
  strip_path: true
  service: 4d210886-a694-416d-847d-95fc597f5921
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags: ~
  path_handling: v1
  created_at: 1733290917
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: 6239b86d-4ef1-48d9-b512-7b05306ab705
  paths:
  - /mcpclient/home
  regex_priority: 0
  name: McpClient
  https_redirect_status_code: 426
  strip_path: false
  service: fbc56015-44d7-42ba-ac9f-abe725bc2478
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags:
  - ${ENABLE_MCP_MENU}
  - parentName:menu.tag.appspace
  - description:menu.desc.mcpclient
  - sort:3
  path_handling: v1
  created_at: 1742543248
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: 670008e2-5811-4d9d-b925-5429d16caa8f
  paths:
  - /files
  regex_priority: 0
  name: backend-files
  https_redirect_status_code: 426
  strip_path: true
  service: 75a7373b-4dda-4a49-b1f8-de6ebee4d4c8
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags: ~
  path_handling: v1
  created_at: 1741671187
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: 6856a277-bcae-43a3-992c-81fc5c605baf
  paths:
  - /open-api/restapi/
  regex_priority: 0
  name: open-hasura-restapi
  https_redirect_status_code: 426
  strip_path: true
  service: 29bf0a09-9e84-449e-b660-d0c9bf24cab3
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags: ~
  path_handling: v1
  created_at: 1734328933
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: true
  id: 6ce6b319-0e38-4bf4-ba1d-4d043a926ba7
  paths:
  - /gateway
  regex_priority: 0
  name: gateway
  https_redirect_status_code: 426
  strip_path: true
  service: 5e8458a8-7323-4a25-9efa-4d56dbf5fa5b
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags: ~
  path_handling: v1
  created_at: 1732611195
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: 6f2a8d9e-d76f-46b9-b2d4-27286651433d
  paths:
  - /apps/freezonex-aps/apsfrontend/
  regex_priority: 0
  name: apm-frontend-inter
  https_redirect_status_code: 426
  strip_path: false
  service: f145ba5c-e9aa-48a6-8a10-9ee476010f7f
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags: ~
  path_handling: v1
  created_at: 1730264872
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: 78e5de54-af01-4eff-bb5d-bfbde4f35835
  paths:
  - /chat2db/
  regex_priority: 0
  name: chat2dbapi
  https_redirect_status_code: 426
  strip_path: true
  service: c53d8d7a-962e-4561-accc-ddf6447336df
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags: ~
  path_handling: v1
  created_at: 1741747323
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: 79d5e57d-340c-4d18-93ee-a6a8f4a0f212
  paths:
  - /konga/home/
  regex_priority: 0
  name: RoutingManagement
  https_redirect_status_code: 426
  strip_path: true
  service: 2df2f7c3-792a-4a30-b30c-6011e2f3f916
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags:
  - description:menu.desc.konga
  - sort:1
  - parentName:menu.tag.system
  - menu
  path_handling: v1
  created_at: 1729736896
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: 8154564f-57c9-4de4-a605-a204c46bf15a
  paths:
  - /elastic/home/
  regex_priority: 0
  name: elastic-inter
  https_redirect_status_code: 426
  strip_path: true
  service: 43a4afb4-cabf-4fd8-a3f4-d8b31408e6dc
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags: []
  path_handling: v1
  created_at: 1729740838
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~


- preserve_host: false
  id: 833d37e3-05bb-4a1d-992c-0a0e5c19b0dd
  paths:
  - /apsfrontend/dashboard
  regex_priority: 0
  name: apm
  https_redirect_status_code: 426
  strip_path: false
  service: f145ba5c-e9aa-48a6-8a10-9ee476010f7f
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags:
  - description:menu.desc.apm
  path_handling: v1
  created_at: 1730265586
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: 8613d94b-0fd7-4b81-8f9d-ac5df267b7e3
  paths:
  - /streams
  regex_priority: 0
  name: StreamProcessing
  https_redirect_status_code: 426
  strip_path: true
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags:
  - parentName:menu.tag.connections
  path_handling: v1
  created_at: 1733209593
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: 86fbf4ad-d446-47e3-a9ba-00ead9113c17
  paths:
  - /fuxa/home/
  regex_priority: 0
  name: LowCodeTool
  https_redirect_status_code: 426
  strip_path: true
  service: abdb1947-dbbf-4a85-ac55-50969ac0ed85
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags:
  - parentName:menu.tag.connections
  path_handling: v1
  created_at: 1733733028
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: 95100aa4-a76b-481c-8485-56eb1f71a529
  paths:
  - /
  regex_priority: 0
  name: Ollama
  https_redirect_status_code: 426
  strip_path: true
  service: 1f8b86e3-6352-47a3-ac19-01537a11bec9
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags:
  - menuPort:13020
  - menuProtocol:http
  - menuHost:${ENTRANCE_DOMAIN}
  - description:The llm webUI which is  easy to use
  path_handling: v1
  created_at: 1733117175
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: 9df937e7-2ffb-49f4-b60b-4bb5b551419a
  paths:
  - /open-api/supos/
  regex_priority: 0
  name: open-backend-api
  https_redirect_status_code: 426
  strip_path: true
  service: 4007e6c1-6ccc-4747-9b96-7bb3f5f78b32
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags: ~
  path_handling: v1
  created_at: 1734330177
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: a13bb597-9740-4dde-929e-d140c286d869
  paths:
  - /collection-flow
  regex_priority: 0
  name: SourceFlow
  https_redirect_status_code: 426
  strip_path: true
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags:
  - menu
  - description:menu.desc.nodered.flow
  - sort:2
  - homeParentName:menu.tag.uns
  - homeIconUrl:homeSourceFlow
  path_handling: v1
  created_at: 1731311377
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: a1f72e00-26fa-47a6-997c-a3c6c6aef9e7
  paths:
  - /swagger-ui
  regex_priority: 0
  name: open-api-docs
  https_redirect_status_code: 426
  strip_path: true
  service: 61c91a4e-3e0c-4253-abad-de0a0ff72369
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags: []
  path_handling: v1
  created_at: 1736404187
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
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
- preserve_host: false
  id: a2060aa0-88e5-4247-9635-f93438bbdd84
  paths:
  - /app-space
  regex_priority: 0
  name: GenerativeUI
  https_redirect_status_code: 426
  strip_path: true
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags:
  - none
  - description:menu.desc.generativeUI
  - parentName:menu.tag.appspace
  - sort:2
  path_handling: v1
  created_at: 1731311359
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: a5040934-75dd-40c6-94ea-9497ab2b0579
  paths:
  - /workflow
  regex_priority: 0
  name: workflow
  https_redirect_status_code: 426
  strip_path: true
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags:
  - parentName:menu.tag.settings
  path_handling: v1
  created_at: 1741573643
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: a6d04fe9-a464-493c-8f3a-4750fdd93a32
  paths:
  - /minio/home/
  regex_priority: 0
  name: objectStorageServer
  https_redirect_status_code: 426
  strip_path: true
  service: 647747b1-8efe-45b6-b37f-430f5e5139d6
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags:
  - description:menu.desc.objectStorageServer
  - sort:200
  path_handling: v1
  created_at: 1731396438
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: true
  id: a867deba-ad15-4059-aeda-4d5c8c551d59
  paths:
  - /nodered-api/
  regex_priority: 0
  name: nodered-backend
  https_redirect_status_code: 426
  strip_path: true
  service: c8af139a-b55e-4afb-a98f-13857004231c
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags: ~
  path_handling: v1
  created_at: 1745569857
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745569857
  methods: ~
- preserve_host: true
  id: aa02bbb9-6459-43bd-9b65-91d89c8854dd
  paths:
  - /grafana/home/dashboards/
  regex_priority: 0
  name: grafana
  https_redirect_status_code: 426
  strip_path: true
  service: 228308d0-521c-45f8-a97d-fbe6966efa3c
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags:
  - description:menu.desc.grafana
  path_handling: v1
  created_at: 1730270517
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: b610973a-764e-4cef-910e-0794f334e4bd
  paths:
  - /keycloak/home/auth/
  regex_priority: 0
  name: keycloak-auth
  https_redirect_status_code: 426
  strip_path: true
  service: b2a70de2-d5db-4755-b8ba-b205d8fbb680
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags: ~
  path_handling: v1
  created_at: 1731473911
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: b8262364-32bf-4422-9d6c-04b97bc8c3a7
  paths:
  - /EventFlow
  regex_priority: 0
  name: EventFlow
  https_redirect_status_code: 426
  strip_path: true
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags:
  - menu
  - homeParentName:menu.tag.uns
  - description:menu.desc.eventflow
  - homeIconUrl:homeEventFlow
  - sort:3
  path_handling: v1
  created_at: 1742968905
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: ba7b2df9-b0d8-4b6b-844d-43f935f3181f
  paths:
  - /supos-login
  regex_priority: 0
  name: login
  https_redirect_status_code: 426
  strip_path: true
  service: e3e88607-311a-4c23-a9c7-bb879efc463e
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags: ~
  path_handling: v1
  created_at: 1732108769
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: c2dececa-99f4-45e1-9859-01e88352bd58
  paths:
  - /
  regex_priority: 0
  name: frontend
  https_redirect_status_code: 426
  strip_path: true
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags: ~
  path_handling: v1
  created_at: 1729738250
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: c90b4b7a-8a51-4f40-b4e2-6c0a40be1b15
  paths:
  - /home
  regex_priority: 0
  name: Home
  https_redirect_status_code: 426
  strip_path: true
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags:
  - menu
  - description:menu.desc.home
  - sort:1
  path_handling: v1
  created_at: 1731635333
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: d0cea78f-1e0d-4b90-98ea-980a455bf5f5
  paths:
  - /keycloak/home/
  regex_priority: 0
  name: Authentication
  https_redirect_status_code: 426
  strip_path: true
  service: b2a70de2-d5db-4755-b8ba-b205d8fbb680
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags:
  - description:menu.desc.keycloak
  - menu
  - sort:2
  - parentName:menu.tag.system
  path_handling: v1
  created_at: 1729740574
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: true
  id: d2a81d6f-8b2a-4b28-8929-3c51ccd16021
  paths:
  - /dashboards
  regex_priority: 0
  name: Dashboards
  https_redirect_status_code: 426
  strip_path: true
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags:
  - menu
  - description:menu.desc.dashboards
  - parentName:menu.tag.system
  - sort:5
  path_handling: v1
  created_at: 1730770040
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: dbb92267-e886-4ee8-b758-a9f9e9af1998
  paths:
  - /minio/inter/
  regex_priority: 0
  name: minio-inter
  https_redirect_status_code: 426
  strip_path: true
  service: cc3e8a53-82e1-4f6e-bde6-75207ca2f6d3
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags: ~
  path_handling: v1
  created_at: 1731460050
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: e3459f2d-fcb2-412e-87fc-b098d8906b7e
  paths:
  - /gitea/home/
  regex_priority: 0
  name: gitea-inter
  https_redirect_status_code: 426
  strip_path: true
  service: 24a5cd06-6728-48ff-a7c8-1847c836bd59
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags: []
  path_handling: v1
  created_at: 1729852903
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: e3ff5178-c156-47e6-90f4-ec2a45b05953
  paths:
  - /chat2db/home/
  regex_priority: 0
  name: chat2db-inter
  https_redirect_status_code: 426
  strip_path: true
  service: d9ac42d8-9d41-41e3-a80f-4b64cc215bcf
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags: ~
  path_handling: v1
  created_at: 1741747250
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: e8e7fe7d-16ba-415a-8d19-e2c41b76b365
  paths:
  - /eventflow/home/flows
  regex_priority: 0
  name: event-node-flows
  https_redirect_status_code: 426
  strip_path: true
  service: 42684a67-ac8f-48d6-ae2b-62e1cd26f9d8
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags: []
  path_handling: v1
  created_at: 1742976255
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: ea381a8a-a76a-4043-9e05-d5e5c9bf3492
  paths:
  - /test
  regex_priority: 0
  name: 测试中文
  https_redirect_status_code: 426
  strip_path: true
  service: 5e8458a8-7323-4a25-9efa-4d56dbf5fa5b
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags: ~
  path_handling: v1
  created_at: 1733118225
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: true
  id: ed108474-cc43-4b66-b92a-5de38f061c6d
  paths:
  - /chat2db/home/workspace
  regex_priority: 0
  name: SQLEditor
  https_redirect_status_code: 426
  strip_path: true
  service: d9ac42d8-9d41-41e3-a80f-4b64cc215bcf
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags:
  - menu
  - parentName:menu.tag.devtools
  - description:menu.desc.sqledit
  - sort:4
  path_handling: v1
  created_at: 1741747220
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: f0a59836-7eea-45b3-b188-51c45c68f305
  paths:
  - /advanced-use
  regex_priority: 0
  name: AdvancedUse
  https_redirect_status_code: 426
  strip_path: true
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags:
  - menu
  - description:menu.desc.advanceUse
  - sort:9
  - parentName:menu.tag.system
  path_handling: v1
  created_at: 1734056913
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: f610002e-8e5c-424a-9fdc-e86d754b3142
  paths:
  - /account-management
  regex_priority: 0
  name: UserManagement
  https_redirect_status_code: 426
  strip_path: true
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags:
  - menu
  - description:menu.desc.account
  - parentName:menu.tag.system
  - sort:4
  path_handling: v1
  created_at: 1732696995
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: f8bccdbf-46fd-4dd7-aafe-d1a8e13c3450
  paths:
  - /nodered/home/
  regex_priority: 0
  name: NodeRed
  https_redirect_status_code: 426
  strip_path: true
  service: bba8a174-4679-49df-8bf9-ae9285f1e77e
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags: []
  path_handling: v1
  created_at: 1729739343
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: fb690c3a-e09e-4fcf-aad1-5d357c1938ec
  paths:
  - /portainer/home/
  regex_priority: 0
  name: ContainerManagement
  https_redirect_status_code: 426
  strip_path: true
  service: 2cd97a86-3853-4001-9f0d-7769dc40d508
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags:
  - description:menu.desc.dockerMgmt
  - ${ENABLE_PORTAINER_MENU}
  - sort:6
  - parentName:menu.tag.system
  path_handling: v1
  created_at: 1729740933
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
- preserve_host: false
  id: fb8efe62-0030-4540-a521-a3b4215b4f59
  paths:
  - /aboutus
  regex_priority: 0
  name: AboutUs
  https_redirect_status_code: 426
  strip_path: true
  service: 8e081976-8223-4494-9b4c-0aa5a441bdd5
  request_buffering: true
  snis: ~
  response_buffering: true
  headers: ~
  tags:
  - menu
  - description:menu.desc.aboutus
  - parentName:menu.tag.system
  - sort:8
  path_handling: v1
  created_at: 1733822464
  sources: ~
  hosts: ~
  protocols:
  - http
  - https
  destinations: ~
  updated_at: 1745574422
  methods: ~
plugins:
- route: ~
  id: 1845ee75-d704-40e1-a8b0-aa2baaf9d71b
  service: ~
  consumer: ~
  tags: ~
  created_at: 1733799127
  name: supos-auth-checker
  enabled: ${KONG_AUTH_ENABLED}
  instance_name: ~
  protocols:
  - grpc
  - grpcs
  - http
  - https
  updated_at: 1745574422
  config:
    login_url: ${BASE_URL}/keycloak/home/auth/realms/supos/protocol/openid-connect/auth?client_id=supos&redirect_uri=${BASE_URL}/inter-api/supos/auth/token&response_type=code&scope=openid
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
- route: 9df937e7-2ffb-49f4-b60b-4bb5b551419a
  id: 2285421f-56e3-4510-be12-69fa1040d810
  service: ~
  consumer: ~
  tags: ~
  created_at: 1734330234
  name: key-auth
  enabled: false
  instance_name: ~
  protocols:
  - grpc
  - grpcs
  - http
  - https
  updated_at: 1745574422
  config:
    key_in_body: false
    run_on_preflight: true
    realm: ~
    key_names:
    - apikey
    anonymous: ~
    key_in_header: true
    hide_credentials: false
    key_in_query: true
- route: ~
  id: 46bda5cf-63ea-401f-9f06-b9e024aa5597
  service: e3e88607-311a-4c23-a9c7-bb879efc463e
  consumer: ~
  tags: ~
  created_at: 1734073535
  name: request-transformer
  enabled: true
  instance_name: ~
  protocols:
  - grpc
  - grpcs
  - http
  - https
  updated_at: 1745574422
  config:
    replace:
      body: []
      headers: []
      uri: ~
      querystring: []
    append:
      headers: []
      body: []
      querystring:
      - client_id:supos
      - response_type:code
      - scope:openid
      - redirect_uri:${BASE_URL}/inter-api/supos/auth/token
    add:
      headers: []
      body: []
      querystring: []
    http_method: ~
    rename:
      headers: []
      body: []
      querystring: []
    remove:
      headers: []
      body: []
      querystring: []
- route: 1fe717e7-804d-473b-b12b-7f5f68b5ec48
  id: 4e339a48-e193-4bc7-99ba-94f2e1e18a8f
  service: ~
  consumer: ~
  tags: ~
  created_at: 1734329742
  name: key-auth
  enabled: true
  instance_name: ~
  protocols:
  - grpc
  - grpcs
  - http
  - https
  updated_at: 1745574422
  config:
    key_in_body: false
    run_on_preflight: true
    realm: ~
    key_names:
    - apikey
    anonymous: ~
    key_in_header: true
    hide_credentials: false
    key_in_query: true
- route: ~
  id: 73285cac-cf4e-4368-bf8f-d3285f9686d4
  service: e3e88607-311a-4c23-a9c7-bb879efc463e
  consumer: ~
  tags: ~
  created_at: 1734073759
  name: response-transformer
  enabled: true
  instance_name: ~
  protocols:
  - grpc
  - grpcs
  - http
  - https
  updated_at: 1745574422
  config:
    replace:
      headers: []
      json: []
      json_types: []
    append:
      headers:
      - X-Frame-Options:DENY
      - Content-Security-Policy:frame-ancestors 'none'
      json: []
      json_types: []
    add:
      headers: []
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
- route: 6856a277-bcae-43a3-992c-81fc5c605baf
  id: 9e4c8423-76d1-498d-8883-b9b18bdbf161
  service: ~
  consumer: ~
  tags: ~
  created_at: 1734329166
  name: key-auth
  enabled: true
  instance_name: ~
  protocols:
  - grpc
  - grpcs
  - http
  - https
  updated_at: 1745574422
  config:
    key_in_body: false
    run_on_preflight: true
    realm: ~
    key_names:
    - apikey
    anonymous: ~
    key_in_header: true
    hide_credentials: false
    key_in_query: true
- route: a6d04fe9-a464-493c-8f3a-4750fdd93a32
  id: b5722a76-60b9-483d-90ac-e5de173264e2
  service: ~
  consumer: ~
  tags: ~
  created_at: 1731400906
  name: response-transformer
  enabled: true
  instance_name: ~
  protocols:
  - grpc
  - grpcs
  - http
  - https
  updated_at: 1745574422
  config:
    replace:
      headers: []
      json: []
      json_types: []
    append:
      headers: []
      json: []
      json_types: []
    add:
      headers:
      - X-Frame-Options:SAMEORIGIN
      json: []
      json_types: []
    rename:
      headers: []
      json: []
    remove:
      headers:
      - X-Frame-Options
      json: []
- route: ba7b2df9-b0d8-4b6b-844d-43f935f3181f
  id: f45e7fd0-74e5-4b36-b265-5df962eb1b58
  service: ~
  consumer: ~
  tags: ~
  created_at: 1734014838
  name: supos-url-transformer
  enabled: true
  instance_name: ~
  protocols:
  - grpc
  - grpcs
  - http
  - https
  updated_at: 1745574422
  config:
    home_url: /home
upstreams:
- id: 00f62da1-73b3-4308-8ae5-856268388aa9
  slots: 1000
  hash_fallback: none
  hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  name: apm
  hash_on_cookie: ~
  hash_on_cookie_path: /
  healthchecks:
    threshold: 0
    active:
      http_path: /
      https_sni: ~
      https_verify_certificate: true
      concurrency: 10
      type: http
      timeout: 1
      healthy:
        http_statuses:
        - 200
        - 302
        interval: 0
        successes: 0
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
      headers: ~
    passive:
      healthy:
        successes: 0
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
      unhealthy:
        http_statuses:
        - 429
        - 500
        - 503
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
      type: http
  host_header: ~
  client_certificate: ~
  algorithm: round-robin
  use_srv_name: false
  created_at: 1730264799
  updated_at: 1745574422
  tags: ~
  hash_on: none
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  hash_on_header: ~
- id: 09fa87e7-1cf1-4fc3-9ad6-6861572a8ef4
  slots: 1000
  hash_fallback: none
  hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  name: minio-inter
  hash_on_cookie: ~
  hash_on_cookie_path: /
  healthchecks:
    threshold: 0
    active:
      http_path: /
      https_sni: ~
      https_verify_certificate: true
      concurrency: 10
      type: http
      timeout: 1
      healthy:
        http_statuses:
        - 200
        - 302
        interval: 0
        successes: 0
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
      headers: ~
    passive:
      healthy:
        successes: 0
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
      unhealthy:
        http_statuses:
        - 429
        - 500
        - 503
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
      type: http
  host_header: ~
  client_certificate: ~
  algorithm: round-robin
  use_srv_name: false
  created_at: 1731459961
  updated_at: 1745574422
  tags: ~
  hash_on: none
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  hash_on_header: ~
- id: 14bdf793-231d-439e-8d67-3e47a3e7da05
  slots: 1000
  hash_fallback: none
  hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  name: platform
  hash_on_cookie: ~
  hash_on_cookie_path: /
  healthchecks:
    threshold: 0
    active:
      http_path: /
      https_sni: ~
      https_verify_certificate: true
      concurrency: 10
      type: http
      timeout: 1
      healthy:
        http_statuses:
        - 200
        - 302
        interval: 0
        successes: 0
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
      headers: ~
    passive:
      healthy:
        successes: 0
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
      unhealthy:
        http_statuses:
        - 429
        - 500
        - 503
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
      type: http
  host_header: ~
  client_certificate: ~
  algorithm: round-robin
  use_srv_name: false
  created_at: 1741754738
  updated_at: 1745574422
  tags: ~
  hash_on: none
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  hash_on_header: ~
- id: 14ee49e7-f9bf-4234-a48f-7b7df7dda0ea
  slots: 1000
  hash_fallback: none
  hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  name: keycloak
  hash_on_cookie: ~
  hash_on_cookie_path: /
  healthchecks:
    threshold: 0
    active:
      http_path: /
      https_sni: ~
      https_verify_certificate: true
      concurrency: 10
      type: http
      timeout: 1
      healthy:
        http_statuses:
        - 200
        - 302
        interval: 0
        successes: 0
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
      headers: ~
    passive:
      healthy:
        successes: 0
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
      unhealthy:
        http_statuses:
        - 429
        - 500
        - 503
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
      type: http
  host_header: ~
  client_certificate: ~
  algorithm: round-robin
  use_srv_name: false
  created_at: 1729739799
  updated_at: 1745574422
  tags: ~
  hash_on: none
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  hash_on_header: ~
- id: 220c1252-a48b-4e7e-af42-b134f316ed16
  slots: 1000
  hash_fallback: none
  hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  name: nodered
  hash_on_cookie: ~
  hash_on_cookie_path: /
  healthchecks:
    threshold: 0
    active:
      http_path: /
      https_sni: ~
      https_verify_certificate: true
      concurrency: 10
      type: http
      timeout: 1
      healthy:
        http_statuses:
        - 200
        - 302
        interval: 0
        successes: 0
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
      headers: ~
    passive:
      healthy:
        successes: 0
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
      unhealthy:
        http_statuses:
        - 429
        - 500
        - 503
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
      type: http
  host_header: ~
  client_certificate: ~
  algorithm: round-robin
  use_srv_name: false
  created_at: 1729739256
  updated_at: 1745574422
  tags: ~
  hash_on: none
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  hash_on_header: ~
- id: 2a0fa8a9-98a4-4456-9d2c-faba35b54882
  slots: 1000
  hash_fallback: none
  hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  name: konga
  hash_on_cookie: ~
  hash_on_cookie_path: /
  healthchecks:
    threshold: 0
    active:
      http_path: /
      https_sni: ~
      https_verify_certificate: true
      concurrency: 10
      type: http
      timeout: 1
      healthy:
        http_statuses:
        - 200
        - 302
        interval: 0
        successes: 0
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
      headers: ~
    passive:
      healthy:
        successes: 0
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
      unhealthy:
        http_statuses:
        - 429
        - 500
        - 503
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
      type: http
  host_header: ~
  client_certificate: ~
  algorithm: round-robin
  use_srv_name: false
  created_at: 1729737217
  updated_at: 1745574422
  tags: ~
  hash_on: none
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  hash_on_header: ~
- id: 2e9455f1-241d-4a1e-840e-fea66dd9aa09
  slots: 1000
  hash_fallback: none
  hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  name: grafana
  hash_on_cookie: ~
  hash_on_cookie_path: /
  healthchecks:
    threshold: 0
    active:
      http_path: /
      https_sni: ~
      https_verify_certificate: true
      concurrency: 10
      type: http
      timeout: 1
      healthy:
        http_statuses:
        - 200
        - 302
        interval: 0
        successes: 0
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
      headers: ~
    passive:
      healthy:
        successes: 0
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
      unhealthy:
        http_statuses:
        - 429
        - 500
        - 503
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
      type: http
  host_header: ~
  client_certificate: ~
  algorithm: round-robin
  use_srv_name: false
  created_at: 1729739617
  updated_at: 1745574422
  tags: ~
  hash_on: none
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  hash_on_header: ~
- id: 3f51d2ee-7609-4f71-b6ec-8ded27b417a2
  slots: 1000
  hash_fallback: none
  hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  name: portainer
  hash_on_cookie: ~
  hash_on_cookie_path: /
  healthchecks:
    threshold: 0
    active:
      http_path: /
      https_sni: ~
      https_verify_certificate: true
      concurrency: 10
      type: http
      timeout: 1
      healthy:
        http_statuses:
        - 200
        - 302
        interval: 0
        successes: 0
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
      headers: ~
    passive:
      healthy:
        successes: 0
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
      unhealthy:
        http_statuses:
        - 429
        - 500
        - 503
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
      type: http
  host_header: ~
  client_certificate: ~
  algorithm: round-robin
  use_srv_name: false
  created_at: 1729739903
  updated_at: 1745574422
  tags: ~
  hash_on: none
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  hash_on_header: ~
- id: 420478e2-bdc8-49ec-ba0e-cc4cfd41afc8
  slots: 1000
  hash_fallback: none
  hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  name: kibana
  hash_on_cookie: ~
  hash_on_cookie_path: /
  healthchecks:
    threshold: 0
    active:
      http_path: /
      https_sni: ~
      https_verify_certificate: true
      concurrency: 10
      type: http
      timeout: 1
      healthy:
        http_statuses:
        - 200
        - 302
        interval: 0
        successes: 0
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
      headers: ~
    passive:
      healthy:
        successes: 0
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
      unhealthy:
        http_statuses:
        - 429
        - 500
        - 503
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
      type: http
  host_header: ~
  client_certificate: ~
  algorithm: round-robin
  use_srv_name: false
  created_at: 1729739883
  updated_at: 1745574422
  tags: ~
  hash_on: none
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  hash_on_header: ~
- id: 47b5a73e-51c6-4ace-b507-40458125c0a6
  slots: 1000
  hash_fallback: none
  hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  name: gitea
  hash_on_cookie: ~
  hash_on_cookie_path: /
  healthchecks:
    threshold: 0
    active:
      http_path: /
      https_sni: ~
      https_verify_certificate: true
      concurrency: 10
      type: http
      timeout: 1
      healthy:
        http_statuses:
        - 200
        - 302
        interval: 0
        successes: 0
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
      headers: ~
    passive:
      healthy:
        successes: 0
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
      unhealthy:
        http_statuses:
        - 429
        - 500
        - 503
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
      type: http
  host_header: ~
  client_certificate: ~
  algorithm: round-robin
  use_srv_name: false
  created_at: 1729852910
  updated_at: 1745574422
  tags: ~
  hash_on: none
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  hash_on_header: ~
- id: 747a43cc-42c4-457a-abac-518c2fe537b3
  slots: 1000
  hash_fallback: none
  hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  name: copilotkit
  hash_on_cookie: ~
  hash_on_cookie_path: /
  healthchecks:
    threshold: 0
    active:
      http_path: /
      https_sni: ~
      https_verify_certificate: true
      concurrency: 10
      type: http
      timeout: 1
      healthy:
        http_statuses:
        - 200
        - 302
        interval: 0
        successes: 0
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
      headers: ~
    passive:
      healthy:
        successes: 0
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
      unhealthy:
        http_statuses:
        - 429
        - 500
        - 503
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
      type: http
  host_header: ~
  client_certificate: ~
  algorithm: round-robin
  use_srv_name: false
  created_at: 1729739930
  updated_at: 1745574422
  tags: ~
  hash_on: none
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  hash_on_header: ~
- id: ab6fb6a2-97b9-45e7-b508-46df2df5203e
  slots: 1000
  hash_fallback: none
  hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  name: hasura
  hash_on_cookie: ~
  hash_on_cookie_path: /
  healthchecks:
    threshold: 0
    active:
      http_path: /
      https_sni: ~
      https_verify_certificate: true
      concurrency: 10
      type: http
      timeout: 1
      healthy:
        http_statuses:
        - 200
        - 302
        interval: 0
        successes: 0
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
      headers: ~
    passive:
      healthy:
        successes: 0
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
      unhealthy:
        http_statuses:
        - 429
        - 500
        - 503
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
      type: http
  host_header: ~
  client_certificate: ~
  algorithm: round-robin
  use_srv_name: false
  created_at: 1729739734
  updated_at: 1745574422
  tags: ~
  hash_on: none
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  hash_on_header: ~
- id: c0645f32-b63d-49ba-a723-5cbef9014c99
  slots: 1000
  hash_fallback: none
  hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  name: frontend
  hash_on_cookie: ~
  hash_on_cookie_path: /
  healthchecks:
    threshold: 0
    active:
      http_path: /
      https_sni: ~
      https_verify_certificate: true
      concurrency: 10
      type: http
      timeout: 1
      healthy:
        http_statuses:
        - 200
        - 302
        interval: 0
        successes: 0
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
      headers: ~
    passive:
      healthy:
        successes: 0
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
      unhealthy:
        http_statuses:
        - 429
        - 500
        - 503
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
      type: http
  host_header: ~
  client_certificate: ~
  algorithm: round-robin
  use_srv_name: false
  created_at: 1729737694
  updated_at: 1745574422
  tags: ~
  hash_on: none
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  hash_on_header: ~
- id: c6844f11-b711-4f5f-a2d4-4516995790c5
  slots: 1000
  hash_fallback: none
  hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  name: minio
  hash_on_cookie: ~
  hash_on_cookie_path: /
  healthchecks:
    threshold: 0
    active:
      http_path: /
      https_sni: ~
      https_verify_certificate: true
      concurrency: 10
      type: http
      timeout: 1
      healthy:
        http_statuses:
        - 200
        - 302
        interval: 0
        successes: 0
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
      headers: ~
    passive:
      healthy:
        successes: 0
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
      unhealthy:
        http_statuses:
        - 429
        - 500
        - 503
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
      type: http
  host_header: ~
  client_certificate: ~
  algorithm: round-robin
  use_srv_name: false
  created_at: 1731396351
  updated_at: 1745574422
  tags: ~
  hash_on: none
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  hash_on_header: ~
- id: e6729ab9-c894-4963-bbdc-dfae17c88096
  slots: 1000
  hash_fallback: none
  hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  name: backend
  hash_on_cookie: ~
  hash_on_cookie_path: /
  healthchecks:
    threshold: 0
    active:
      http_path: /
      https_sni: ~
      https_verify_certificate: true
      concurrency: 10
      type: http
      timeout: 1
      healthy:
        http_statuses:
        - 200
        - 302
        interval: 0
        successes: 0
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
      headers: ~
    passive:
      healthy:
        successes: 0
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
      unhealthy:
        http_statuses:
        - 429
        - 500
        - 503
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
      type: http
  host_header: ~
  client_certificate: ~
  algorithm: round-robin
  use_srv_name: false
  created_at: 1729739594
  updated_at: 1745574422
  tags: ~
  hash_on: none
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  hash_on_header: ~
- id: fa9fc31a-7d71-43bd-a453-c21704b71ac6
  slots: 1000
  hash_fallback: none
  hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  name: emqx
  hash_on_cookie: ~
  hash_on_cookie_path: /
  healthchecks:
    threshold: 0
    active:
      http_path: /
      https_sni: ~
      https_verify_certificate: true
      concurrency: 10
      type: http
      timeout: 1
      healthy:
        http_statuses:
        - 200
        - 302
        interval: 0
        successes: 0
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
      headers: ~
    passive:
      healthy:
        successes: 0
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
      unhealthy:
        http_statuses:
        - 429
        - 500
        - 503
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
      type: http
  host_header: ~
  client_certificate: ~
  algorithm: round-robin
  use_srv_name: false
  created_at: 1729739828
  updated_at: 1745574422
  tags: ~
  hash_on: none
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  hash_on_header: ~
- id: fc85cfef-6e90-4592-a022-730f5d84ed99
  slots: 1000
  hash_fallback: none
  hash_fallback_header: ~
  hash_fallback_query_arg: ~
  hash_fallback_uri_capture: ~
  name: fuxa
  hash_on_cookie: ~
  hash_on_cookie_path: /
  healthchecks:
    threshold: 0
    active:
      http_path: /
      https_sni: ~
      https_verify_certificate: true
      concurrency: 10
      type: http
      timeout: 1
      healthy:
        http_statuses:
        - 200
        - 302
        interval: 0
        successes: 0
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
      headers: ~
    passive:
      healthy:
        successes: 0
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
      unhealthy:
        http_statuses:
        - 429
        - 500
        - 503
        tcp_failures: 0
        timeouts: 0
        http_failures: 0
      type: http
  host_header: ~
  client_certificate: ~
  algorithm: round-robin
  use_srv_name: false
  created_at: 1733536118
  updated_at: 1745574422
  tags: ~
  hash_on: none
  hash_on_query_arg: ~
  hash_on_uri_capture: ~
  hash_on_header: ~
targets:
- id: 0be879dd-7ba3-42e3-96a8-5be0c8dcadfe
  target: apm:8080
  upstream: 00f62da1-73b3-4308-8ae5-856268388aa9
  tags: ~
  created_at: 1730264807.829
  updated_at: 1745569731.691
  weight: 100
- id: 0c66a055-3e1d-4e77-aedd-6de30939a5a2
  target: grafana:3000
  upstream: 2e9455f1-241d-4a1e-840e-fea66dd9aa09
  tags: ~
  created_at: 1729739629.259
  updated_at: 1745569731.676
  weight: 100
- id: 29a2c68c-7501-49b1-aef1-56e1be3c2d74
  target: gitea:3000
  upstream: 47b5a73e-51c6-4ace-b507-40458125c0a6
  tags: ~
  created_at: 1729852918.487
  updated_at: 1745569731.679
  weight: 100
- id: 2cc80d27-504d-4c1a-afaf-646f6e432fd6
  target: fuxa:1881
  upstream: fc85cfef-6e90-4592-a022-730f5d84ed99
  tags: ~
  created_at: 1733536131.451
  updated_at: 1745569731.682
  weight: 100
- id: 2f312fcf-baa6-4de0-84aa-0779713ae279
  target: minio:9001
  upstream: c6844f11-b711-4f5f-a2d4-4516995790c5
  tags: ~
  created_at: 1731397614.344
  updated_at: 1745569731.685
  weight: 100
- id: 38ae0eeb-fa36-40a1-8c72-aaa43e7b9ceb
  target: konga:1337
  upstream: 2a0fa8a9-98a4-4456-9d2c-faba35b54882
  tags: ~
  created_at: 1729737239.883
  updated_at: 1745569731.688
  weight: 100
- id: 3ec4626c-673a-4cc1-86fa-10f3b1bdc537
  target: emqx:18083
  upstream: fa9fc31a-7d71-43bd-a453-c21704b71ac6
  tags: ~
  created_at: 1729739844.316
  updated_at: 1745569731.69
  weight: 100
- id: 5a923a6d-0661-43ad-a668-e89f4980e5a6
  target: nodered:1880
  upstream: 220c1252-a48b-4e7e-af42-b134f316ed16
  tags: ~
  created_at: 1729739274.174
  updated_at: 1745569731.694
  weight: 100
- id: 78410225-c503-4d2c-885d-c38a72244aa0
  target: portainer:9443
  upstream: 3f51d2ee-7609-4f71-b6ec-8ded27b417a2
  tags: ~
  created_at: 1729739915.095
  updated_at: 1745569731.675
  weight: 100
- id: 7c5e8a1d-6022-42b6-83b7-b1f39739b9df
  target: frontend:3001
  upstream: 14bdf793-231d-439e-8d67-3e47a3e7da05
  tags: ~
  created_at: 1741754798.218
  updated_at: 1745569731.695
  weight: 100
- id: 8d09a927-4def-479d-8ed9-0473be2a281a
  target: hasura:8080
  upstream: ab6fb6a2-97b9-45e7-b508-46df2df5203e
  tags: ~
  created_at: 1729739753.711
  updated_at: 1745569731.678
  weight: 100
- id: a4cdac00-4421-4a49-b2ba-b2f720f4998d
  target: keycloak:8080
  upstream: 14ee49e7-f9bf-4234-a48f-7b7df7dda0ea
  tags: ~
  created_at: 1729832116.752
  updated_at: 1745569731.681
  weight: 100
- id: afe138dc-2d5e-4329-80ff-a0154b634f42
  target: kibana:5601
  upstream: 420478e2-bdc8-49ec-ba0e-cc4cfd41afc8
  tags: ~
  created_at: 1729739894.022
  updated_at: 1745569731.684
  weight: 100
- id: e401fd6b-6a87-41be-a501-6456afeb14d3
  target: backend:8080
  upstream: e6729ab9-c894-4963-bbdc-dfae17c88096
  tags: ~
  created_at: 1729739606.748
  updated_at: 1745569731.686
  weight: 100
- id: e5f0e5f7-8b6a-476b-ac72-2e4a32bab571
  target: minio:9000
  upstream: 09fa87e7-1cf1-4fc3-9ad6-6861572a8ef4
  tags: ~
  created_at: 1731459990.339
  updated_at: 1745569731.689
  weight: 100
- id: ef3e3b44-a490-40e8-afac-2b9e2d202643
  target: frontend:3000
  upstream: c0645f32-b63d-49ba-a723-5cbef9014c99
  tags: ~
  created_at: 1729914708.061
  updated_at: 1745569731.692
  weight: 100
- id: f4e24691-4181-42a6-b32c-6c7e8cd92077
  target: frontend:4000
  upstream: 747a43cc-42c4-457a-abac-518c2fe537b3
  tags: ~
  created_at: 1729914781.603
  updated_at: 1745569731.673
  weight: 100
keyauth_credentials:
- created_at: 1734329245
  id: 6b9443ae-73f0-4db6-af00-4f1e3a415dbb
  key: 4174348a-9222-4e81-b33e-5d72d2fd7f1e
  consumer: 59d1ef15-24a5-4373-b957-e8192c15ff6e
  tags: ~
  ttl: ~
