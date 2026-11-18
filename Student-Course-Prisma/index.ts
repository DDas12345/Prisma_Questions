require("dotenv").config();

const { PrismaClient } = require("./generated/prisma");
const { PrismaPg } = require("@prisma/adapter-pg");

const adapter = new PrismaPg({
  connectionString: process.env.DATABASE_URL,
});

const prisma = new PrismaClient({ adapter });

async function main() {
  const alice = await prisma.student.create({
    data: {
      name: "Alice",
    },
  });

  console.log("Created student:", alice);
}

main()
  .catch(console.error)
  .finally(async () => {
    await prisma.$disconnect();
  });