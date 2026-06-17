-- 1. Garante que o PostGIS está ativo no schema de extensões
CREATE EXTENSION IF NOT EXISTS postgis SCHEMA extensions;

-- 2. Adiciona o campo de localização na tabela de estabelecimentos
ALTER TABLE public.estabelecimentos 
ADD COLUMN IF NOT EXISTS localizacao extensions.geography(Point, 4326);

-- 3. Adiciona o campo de localização na tabela de perfis (freelancers)
ALTER TABLE public.profiles 
ADD COLUMN IF NOT EXISTS localizacao extensions.geography(Point, 4326);