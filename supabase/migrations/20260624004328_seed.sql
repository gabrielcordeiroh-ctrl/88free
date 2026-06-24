--Usuário de Teste (auth.users)
INSERT INTO auth.users (
  instance_id, id, role, email, encrypted_password, 
  email_confirmed_at, recovery_sent_at, last_sign_in_at, 
  raw_app_meta_data, raw_user_meta_data, created_at, updated_at
)
VALUES (
  '00000000-0000-0000-0000-000000000000',
  '9687f273-bd31-4374-a459-9d983b6d564b',
  'authenticated',
  'gabriel@88free.com.br',
  crypt('senha123', gen_salt('bf')),
  NOW(), NULL, NOW(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name":"Gabriel Cordeiro"}',
  NOW(), NOW()
) ON CONFLICT (id) DO NOTHING;

-- Perfil de teste (trabalhador)
INSERT INTO public.profiles (id, full_name, cpf, phone)
VALUES (
  '9687f273-bd31-4374-a459-9d983b6d564b',
  'Gabriel Cordeiro',
  '05252813043',
  '48988144699'
) ON CONFLICT (id) DO NOTHING;

-- Estabelecimento de Teste
INSERT INTO public.estabelecimentos (id, razao_social, cnpj, endereco)
VALUES (
  '88888888-8888-8888-8888-888888888888',
  'Restaurante do Gabriel',
  '12345678000199',
  'rua dos butias'
) ON CONFLICT (id) DO NOTHING;

-- Vaga PLANEJADA (Daqui a 4 dias) - Sem taxa
INSERT INTO public.vagas (estabelecimento_id, funcao, data_diaria, valor_pagamento)
VALUES ('88888888-8888-8888-8888-888888888888', 'garçom', NOW() + INTERVAL '4 days', 100.00);

-- Criar Vaga URGENTE (Daqui a 5 horas) - Deve aplicar +20%
INSERT INTO public.vagas (estabelecimento_id, funcao, data_diaria, valor_pagamento)
VALUES ('88888888-8888-8888-8888-888888888888', 'garçom', NOW() + INTERVAL '5 hours', 100.00);