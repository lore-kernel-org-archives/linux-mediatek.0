From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] mtd: mtk-nor: Drop bogus __init from mtk_nor_init()
Date: Fri, 15 Jan 2016 14:46:29 +0100
Message-ID: <1452865589-555-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Bayi Cheng <bayi.cheng@mediatek.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-mediatek@lists.infradead.org

WARNING: drivers/mtd/spi-nor/mtk-quadspi.o(.text+0x77e): Section mismatch in reference from the function mtk_nor_drv_probe() to the function .init.text:mtk_nor_init()
The function mtk_nor_drv_probe() references
the function __init mtk_nor_init().
This is often because mtk_nor_drv_probe lacks a __init
annotation or the annotation of mtk_nor_init is wrong.

Drop the bogus __init from mtk_nor_init() to kill this warning.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Presumably this went unnoticed because some versions of gcc inline
mtk_nor_init()?
---
 drivers/mtd/spi-nor/mtk-quadspi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/mtk-quadspi.c b/drivers/mtd/spi-nor/mtk-quadspi.c
index d5f850d035bb93fb..8bed1a4cb79ce585 100644
--- a/drivers/mtd/spi-nor/mtk-quadspi.c
+++ b/drivers/mtd/spi-nor/mtk-quadspi.c
@@ -371,8 +371,8 @@ static int mt8173_nor_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf,
 	return ret;
 }
 
-static int __init mtk_nor_init(struct mt8173_nor *mt8173_nor,
-			       struct device_node *flash_node)
+static int mtk_nor_init(struct mt8173_nor *mt8173_nor,
+			struct device_node *flash_node)
 {
 	int ret;
 	struct spi_nor *nor;
-- 
1.9.1
