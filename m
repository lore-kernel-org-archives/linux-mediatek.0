From: <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 17/22] mtd: spi-nor: Check all the bits written, not just
 the BP ones
Date: Tue, 24 Sep 2019 07:46:47 +0000
Message-ID: <20190924074533.6618-18-tudor.ambarus@microchip.com>
References: <20190924074533.6618-1-tudor.ambarus@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190924074533.6618-1-tudor.ambarus@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: vigneshr@ti.com, boris.brezillon@collabora.com, marek.vasut@gmail.com, linux-mtd@lists.infradead.org, geert+renesas@glider.be, jonas@norrbonn.se
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, miquel.raynal@bootlin.com, richard@nod.at, joel@jms.id.au, andrew@aj.id.au, matthias.bgg@gmail.com, vz@mleia.com, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Tudor.Ambarus@microchip.com
List-Id: linux-mediatek@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

Check that all the bits written in the write_sr_and_check() method
match the status_new received value. Failing to write the other bits
is dangerous too, extend the check.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 6429c855547e..48bcb2ee1be5 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1493,7 +1493,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct=
 erase_info *instr)
 }
=20
 /* Write status register and ensure bits in mask match written values */
-static int write_sr_and_check(struct spi_nor *nor, u8 status_new, u8 mask)
+static int write_sr_and_check(struct spi_nor *nor, u8 status_new)
 {
 	int ret;
=20
@@ -1507,7 +1507,7 @@ static int write_sr_and_check(struct spi_nor *nor, u8=
 status_new, u8 mask)
 	if (ret)
 		return ret;
=20
-	return ((nor->bouncebuf[0] & mask) !=3D (status_new & mask)) ? -EIO : 0;
+	return (nor->bouncebuf[0] !=3D status_new) ? -EIO : 0;
 }
=20
 static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
@@ -1673,7 +1673,7 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, =
uint64_t len)
 	if ((status_new & mask) < (status_old & mask))
 		return -EINVAL;
=20
-	return write_sr_and_check(nor, status_new, mask);
+	return write_sr_and_check(nor, status_new);
 }
=20
 /*
@@ -1758,7 +1758,7 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs=
, uint64_t len)
 	if ((status_new & mask) > (status_old & mask))
 		return -EINVAL;
=20
-	return write_sr_and_check(nor, status_new, mask);
+	return write_sr_and_check(nor, status_new);
 }
=20
 /*
--=20
2.9.5
