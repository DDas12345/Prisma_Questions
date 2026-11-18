-- CreateTable
CREATE TABLE "GameProtagonist" (
    "gameId" INTEGER NOT NULL,
    "trainerId" INTEGER NOT NULL,

    CONSTRAINT "GameProtagonist_pkey" PRIMARY KEY ("gameId","trainerId")
);

-- AddForeignKey
ALTER TABLE "GameProtagonist" ADD CONSTRAINT "GameProtagonist_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "Game"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameProtagonist" ADD CONSTRAINT "GameProtagonist_trainerId_fkey" FOREIGN KEY ("trainerId") REFERENCES "Trainer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
