-- DropForeignKey
ALTER TABLE "Trainer" DROP CONSTRAINT "Trainer_hometownCityId_fkey";

-- AlterTable
ALTER TABLE "Trainer" ALTER COLUMN "hometownCityId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Trainer" ADD CONSTRAINT "Trainer_hometownCityId_fkey" FOREIGN KEY ("hometownCityId") REFERENCES "City"("id") ON DELETE SET NULL ON UPDATE CASCADE;
