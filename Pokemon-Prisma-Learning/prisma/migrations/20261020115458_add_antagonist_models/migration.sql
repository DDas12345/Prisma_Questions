-- CreateTable
CREATE TABLE "Antagonist" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "motive" TEXT,

    CONSTRAINT "Antagonist_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "VillainousOrganization" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "goal" TEXT,

    CONSTRAINT "VillainousOrganization_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GameAntagonist" (
    "gameId" INTEGER NOT NULL,
    "antagonistId" INTEGER NOT NULL,
    "role" TEXT,

    CONSTRAINT "GameAntagonist_pkey" PRIMARY KEY ("gameId","antagonistId")
);

-- CreateTable
CREATE TABLE "GameOrganization" (
    "gameId" INTEGER NOT NULL,
    "organizationId" INTEGER NOT NULL,
    "role" TEXT,

    CONSTRAINT "GameOrganization_pkey" PRIMARY KEY ("gameId","organizationId")
);

-- CreateTable
CREATE TABLE "AntagonistOrganization" (
    "antagonistId" INTEGER NOT NULL,
    "organizationId" INTEGER NOT NULL,
    "position" TEXT,

    CONSTRAINT "AntagonistOrganization_pkey" PRIMARY KEY ("antagonistId","organizationId")
);

-- CreateIndex
CREATE UNIQUE INDEX "Antagonist_name_key" ON "Antagonist"("name");

-- CreateIndex
CREATE UNIQUE INDEX "VillainousOrganization_name_key" ON "VillainousOrganization"("name");

-- AddForeignKey
ALTER TABLE "GameAntagonist" ADD CONSTRAINT "GameAntagonist_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "Game"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameAntagonist" ADD CONSTRAINT "GameAntagonist_antagonistId_fkey" FOREIGN KEY ("antagonistId") REFERENCES "Antagonist"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameOrganization" ADD CONSTRAINT "GameOrganization_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "Game"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameOrganization" ADD CONSTRAINT "GameOrganization_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "VillainousOrganization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AntagonistOrganization" ADD CONSTRAINT "AntagonistOrganization_antagonistId_fkey" FOREIGN KEY ("antagonistId") REFERENCES "Antagonist"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AntagonistOrganization" ADD CONSTRAINT "AntagonistOrganization_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "VillainousOrganization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
