-- À coller une seule fois dans Supabase : SQL Editor → New query → Run.
-- Crée la table des plannings et le dossier des images, avec des règles
-- pour que chaque compte ne voie et ne modifie QUE ses propres données.

create table if not exists public.planners (
  user_id    uuid primary key references auth.users(id) on delete cascade,
  data       jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.planners enable row level security;

drop policy if exists "planner lecture" on public.planners;
drop policy if exists "planner ajout" on public.planners;
drop policy if exists "planner modif" on public.planners;
drop policy if exists "planner suppression" on public.planners;
create policy "planner lecture"     on public.planners for select using (auth.uid() = user_id);
create policy "planner ajout"       on public.planners for insert with check (auth.uid() = user_id);
create policy "planner modif"       on public.planners for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "planner suppression" on public.planners for delete using (auth.uid() = user_id);

-- Images de la page Vision : dossier privé, un sous-dossier par compte.
insert into storage.buckets (id, name, public)
values ('vision', 'vision', false)
on conflict (id) do nothing;

drop policy if exists "vision lecture" on storage.objects;
drop policy if exists "vision ajout" on storage.objects;
drop policy if exists "vision modif" on storage.objects;
drop policy if exists "vision suppression" on storage.objects;
create policy "vision lecture"     on storage.objects for select using (bucket_id = 'vision' and auth.uid()::text = (storage.foldername(name))[1]);
create policy "vision ajout"       on storage.objects for insert with check (bucket_id = 'vision' and auth.uid()::text = (storage.foldername(name))[1]);
create policy "vision modif"       on storage.objects for update using (bucket_id = 'vision' and auth.uid()::text = (storage.foldername(name))[1]);
create policy "vision suppression" on storage.objects for delete using (bucket_id = 'vision' and auth.uid()::text = (storage.foldername(name))[1]);
