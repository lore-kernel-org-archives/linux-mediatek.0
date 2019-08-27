From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] mt76: mt7603: use devm_platform_ioremap_resource() to simplify code
Date: Tue, 27 Aug 2019 21:44:45 +0800
Message-ID: <20190827134445.14696-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nbd@nbd.name, lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com, royluo@google.com, kvalo@codeaurora.org, davem@davemloft.net, matthias.bgg@gmail.com, swboyd@chromium.org, yuehaibing@huawei.com, weiyongjun1@huawei.com
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/mediatek/mt76/mt7603/soc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/soc.c b/drivers/net/wireless/mediatek/mt76/mt7603/soc.c
index c6c1ce6..c22715e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/soc.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/soc.c
@@ -9,7 +9,6 @@
 static int
 mt76_wmac_probe(struct platform_device *pdev)
 {
-	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	struct mt7603_dev *dev;
 	void __iomem *mem_base;
 	struct mt76_dev *mdev;
@@ -20,7 +19,7 @@ mt76_wmac_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	mem_base = devm_ioremap_resource(&pdev->dev, res);
+	mem_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mem_base)) {
 		dev_err(&pdev->dev, "Failed to get memory resource\n");
 		return PTR_ERR(mem_base);
-- 
2.7.4
