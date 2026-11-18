import "dotenv/config";
import { PrismaPg } from "@prisma/adapter-pg";
import { PrismaClient } from "./generated/prisma/client";

const connectionString = process.env.DATABASE_URL;

if (!connectionString) {
  throw new Error("DATABASE_URL is missing from .env");
}

const adapter = new PrismaPg({ connectionString });
const prisma = new PrismaClient({ adapter });

async function main() {
  const games = await prisma.game.findMany({
    where: {
      releaseStatus: "Released",
      releaseYear: {
        gte: 2010,
      },
    },
    select: {
      id: true,
      name: true,
      releaseYear: true,
      releaseStatus: true,
    },
    orderBy: [
      { releaseYear: "asc" },
      { id: "asc" },
    ],
    skip: 0,
    take: 5,
  });

  console.log("\nFIRST 5 RELEASED GAMES FROM 2010 ONWARD");
  console.table(games);

  console.log(`\nRecords returned: ${games.length}`);
  console.log("\nStep 285A complete.");
}

main()
  .catch(console.error)
  .finally(async () => {
    await prisma.$disconnect();
  });
