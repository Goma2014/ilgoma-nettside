import { defineCollection } from 'astro:content';
import { glob } from 'astro/loaders';
import { z } from 'astro/zod';

const nyheter = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/nyheter' }),
  schema: z.object({
    tittel: z.string(),
    dato: z.coerce.date(),
    bilde: z.string().optional(),
    ingress: z.string().optional(),
    nokkeltall: z.array(z.object({ tall: z.string(), tekst: z.string() })).optional(),
  }),
});

const sider = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/sider' }),
  schema: z.object({
    tittel: z.string(),
  }),
});

export const collections = { nyheter, sider };
