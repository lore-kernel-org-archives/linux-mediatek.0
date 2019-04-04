From: Nilesh Hase <nilhase25@gmail.com>
Subject: [PATCH] MT7621-SPI: spi-mt7621: Fix alignment and style problems     Fixed Coding function and style issues
Date: Fri,  5 Apr 2019 00:22:36 +0530
Message-ID: <20190404185235.5257-1-nilhase25@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: matthias.bgg@gmail.com
Cc: gregkh@linuxfoundation.org, neil@brown.name, sr@denx.de, sankalpnegi2310@gmail.com, gch981213@gmail.com, devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Nilesh Hase <nilhase25@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

Fix checkpatch issues: "CHECK: Alignment should match open parenthesis" 

Signed-off-by: Nilesh Hase <nilhase25@gmail.com>
---
 drivers/staging/mt7621-spi/spi-mt7621.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/mt7621-spi/spi-mt7621.c b/drivers/staging/mt7621-spi/spi-mt7621.c
index b509f9fe3346..6fa9876f5a92 100644
--- a/drivers/staging/mt7621-spi/spi-mt7621.c
+++ b/drivers/staging/mt7621-spi/spi-mt7621.c
@@ -303,7 +303,7 @@ static int mt7621_spi_setup(struct spi_device *spi)
 	struct mt7621_spi *rs = spidev_to_mt7621_spi(spi);
 
 	if ((spi->max_speed_hz == 0) ||
-		(spi->max_speed_hz > (rs->sys_freq / 2)))
+	    (spi->max_speed_hz > (rs->sys_freq / 2)))
 		spi->max_speed_hz = (rs->sys_freq / 2);
 
 	if (spi->max_speed_hz < (rs->sys_freq / 4097)) {
-- 
2.20.1
