-- CreateTable
CREATE TABLE "City" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "region" TEXT NOT NULL,

    CONSTRAINT "City_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Trainer" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "hometownCityId" INTEGER NOT NULL,
    "currentCityId" INTEGER,

    CONSTRAINT "Trainer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GameTrainer" (
    "gameId" INTEGER NOT NULL,
    "trainerId" INTEGER NOT NULL,

    CONSTRAINT "GameTrainer_pkey" PRIMARY KEY ("gameId","trainerId")
);

-- CreateIndex
CREATE UNIQUE INDEX "City_name_region_key" ON "City"("name", "region");

-- AddForeignKey
ALTER TABLE "Trainer" ADD CONSTRAINT "Trainer_hometownCityId_fkey" FOREIGN KEY ("hometownCityId") REFERENCES "City"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Trainer" ADD CONSTRAINT "Trainer_currentCityId_fkey" FOREIGN KEY ("currentCityId") REFERENCES "City"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameTrainer" ADD CONSTRAINT "GameTrainer_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "Game"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameTrainer" ADD CONSTRAINT "GameTrainer_trainerId_fkey" FOREIGN KEY ("trainerId") REFERENCES "Trainer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
