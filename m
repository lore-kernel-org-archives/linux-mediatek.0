From: <Tudor.Ambarus@microchip.com>
Subject: [PATCH 09/23] mtd: spi-nor: Fix retlen handling in sst_write()
Date: Tue, 17 Sep 2019 15:55:09 +0000
Message-ID: <20190917155426.7432-10-tudor.ambarus@microchip.com>
References: <20190917155426.7432-1-tudor.ambarus@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190917155426.7432-1-tudor.ambarus@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: vigneshr@ti.com, boris.brezillon@collabora.com, marek.vasut@gmail.com, miquel.raynal@bootlin.com, richard@nod.at, linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, joel@jms.id.au, andrew@aj.id.au, matthias.bgg@gmail.com, vz@mleia.com, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Tudor.Ambarus@microchip.com
List-Id: linux-mediatek@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

In case the write of the first byte failed, retlen was incorrectly
incremented to *retlen +=3D actual; on the exit path. retlen should be
incremented when actual data was written to the flash.

Rename 'sst_write_err' label to 'out' as it is no longer generic for
all the write errors in the sst_write() method, and may introduce
confusion.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 271c2b465038..151db98f7d49 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2665,12 +2665,12 @@ static int sst_write(struct mtd_info *mtd, loff_t t=
o, size_t len,
 		/* write one byte. */
 		ret =3D spi_nor_write_data(nor, to, 1, buf);
 		if (ret < 0)
-			goto sst_write_err;
+			goto unlock_and_unprep;
 		WARN(ret !=3D 1, "While writing 1 byte written %i bytes\n",
 		     (int)ret);
 		ret =3D spi_nor_wait_till_ready(nor);
 		if (ret)
-			goto sst_write_err;
+			goto unlock_and_unprep;
 	}
 	to +=3D actual;
=20
@@ -2681,12 +2681,12 @@ static int sst_write(struct mtd_info *mtd, loff_t t=
o, size_t len,
 		/* write two bytes. */
 		ret =3D spi_nor_write_data(nor, to, 2, buf + actual);
 		if (ret < 0)
-			goto sst_write_err;
+			goto out;
 		WARN(ret !=3D 2, "While writing 2 bytes written %i bytes\n",
 		     (int)ret);
 		ret =3D spi_nor_wait_till_ready(nor);
 		if (ret)
-			goto sst_write_err;
+			goto out;
 		to +=3D 2;
 		nor->sst_write_second =3D true;
 	}
@@ -2694,35 +2694,35 @@ static int sst_write(struct mtd_info *mtd, loff_t t=
o, size_t len,
=20
 	ret =3D spi_nor_write_disable(nor);
 	if (ret)
-		goto sst_write_err;
+		goto out;
=20
 	ret =3D spi_nor_wait_till_ready(nor);
 	if (ret)
-		goto sst_write_err;
+		goto out;
=20
 	/* Write out trailing byte if it exists. */
 	if (actual !=3D len) {
 		ret =3D spi_nor_write_enable(nor);
 		if (ret)
-			goto sst_write_err;
+			goto out;
=20
 		nor->program_opcode =3D SPINOR_OP_BP;
 		ret =3D spi_nor_write_data(nor, to, 1, buf + actual);
 		if (ret < 0)
-			goto sst_write_err;
+			goto out;
 		WARN(ret !=3D 1, "While writing 1 byte written %i bytes\n",
 		     (int)ret);
 		ret =3D spi_nor_wait_till_ready(nor);
 		if (ret)
-			goto sst_write_err;
+			goto out;
=20
 		ret =3D spi_nor_write_disable(nor);
 		if (ret)
-			goto sst_write_err;
+			goto out;
=20
 		actual +=3D 1;
 	}
-sst_write_err:
+out:
 	*retlen +=3D actual;
 unlock_and_unprep:
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_WRITE);
--=20
2.9.5
