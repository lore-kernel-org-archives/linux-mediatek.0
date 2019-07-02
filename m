From: fatihaltinpinar@gmail.com
Subject: [PATCH] Staging: mt7621-dma: mtk-hsdma: fix a coding style issue
Date: Tue,  2 Jul 2019 11:06:32 +0300
Message-ID: <20190702080632.27470-1-fatihaltinpinar@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: matthias.bgg@gmail.com
Cc: gregkh@linuxfoundation.org, devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Fatih ALTINPINAR <fatihaltinpinar@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

From: Fatih ALTINPINAR <fatihaltinpinar@gmail.com>

Fixed a coding style issue. Removed curly brackets of an one
line if statement.

Signed-off-by: Fatih ALTINPINAR <fatihaltinpinar@gmail.com>
---
 drivers/staging/mt7621-dma/mtk-hsdma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/mt7621-dma/mtk-hsdma.c b/drivers/staging/mt7621-dma/mtk-hsdma.c
index 0fbb9932d6bb..a58725dd2611 100644
--- a/drivers/staging/mt7621-dma/mtk-hsdma.c
+++ b/drivers/staging/mt7621-dma/mtk-hsdma.c
@@ -664,9 +664,8 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	hsdma = devm_kzalloc(&pdev->dev, sizeof(*hsdma), GFP_KERNEL);
-	if (!hsdma) {
+	if (!hsdma)
 		return -EINVAL;
-	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	base = devm_ioremap_resource(&pdev->dev, res);
-- 
2.17.1
