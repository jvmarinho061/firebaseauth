# loginflutterteste

Este projeto é um ambiente de testes focado em funcionalidades essenciais para aplicativos mobile, utilizando o Firebase como principal ferramenta de back-end.
O gerenciamento de estado utilizei Bloc para me adaptar a um novo meio de gerenciar o estado.
This project is a test environment focused on essential functionalities for mobile applications, using Firebase as the main back-end tool.
For state management, I used Bloc to adapt to a new way of managing state.
UI: As telas de login e cadastro reagem e disparam eventos de acordo com o estado, algumas partes interativas da tela são apenas estáticas ou estão pre=moldadas para consumir uma API real.
UI: The login and registration screens react and trigger events according to the state; some interactive parts of the screen are only static or are pre-built to consume a real API.
Utilização do **Firebase Authentication** para gerenciamento de usuários.
Persistência automática de sessão (gerenciada nativamente pelo Firebase), eliminando a necessidade de usar `SharedPreferences` ou `Keychain`. A sessão do usuário permanece ativa mesmo após o fechamento do aplicativo.
Uses **Firebase Authentication** for user management.
Automatic session persistence (natively handled by Firebase), eliminating the need for `SharedPreferences` or `Keychain`. The user session remains active even after the app is closed
Tentei priorizar pela organização limpa do projeto.
I tried to prioritize the clean organization of the project.
<img width="636" height="146" alt="image" src="https://github.com/user-attachments/assets/464bddcf-a29b-406a-82c9-84586703af76" />
<img width="398" height="842" alt="Captura de tela 2026-03-31 160813" src="https://github.com/user-attachments/assets/df73401f-4d89-4ab3-afc5-88a25f09320c" />
<img width="390" height="798" alt="Captura de tela 2026-03-31 160920" src="https://github.com/user-attachments/assets/ddd23082-96c2-44f6-a580-3b8df3ae3b2c" />
<img width="369" height="809" alt="Captura de tela 2026-03-31 161724" src="https://github.com/user-attachments/assets/7ebb9d6d-4db4-43b3-b338-29b3dbabd2bd" />
