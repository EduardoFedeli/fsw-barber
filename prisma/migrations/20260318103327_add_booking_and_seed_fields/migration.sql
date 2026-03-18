/*
  Warnings:

  - You are about to drop the column `baerbershopId` on the `BarbershopService` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `BarbershopService` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `BarbershopService` table. All the data in the column will be lost.
  - Added the required column `description` to the `Barbershop` table without a default value. This is not possible if the table is not empty.
  - Added the required column `imageUrl` to the `Barbershop` table without a default value. This is not possible if the table is not empty.
  - Added the required column `barbershopId` to the `BarbershopService` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "BarbershopService" DROP CONSTRAINT "BarbershopService_baerbershopId_fkey";

-- AlterTable
ALTER TABLE "Barbershop" ADD COLUMN     "description" TEXT NOT NULL,
ADD COLUMN     "imageUrl" TEXT NOT NULL,
ADD COLUMN     "phones" TEXT[];

-- AlterTable
ALTER TABLE "BarbershopService" DROP COLUMN "baerbershopId",
DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "barbershopId" TEXT NOT NULL,
ALTER COLUMN "price" SET DATA TYPE DECIMAL(65,30);

-- AddForeignKey
ALTER TABLE "BarbershopService" ADD CONSTRAINT "BarbershopService_barbershopId_fkey" FOREIGN KEY ("barbershopId") REFERENCES "Barbershop"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
