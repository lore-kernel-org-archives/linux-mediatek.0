From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] dmaengine: mediatek: Use devm_platform_ioremap_resource() in
 mtk_uart_apdma_probe()
Date: Sun, 22 Sep 2019 13:14:11 +0200
Message-ID: <366e776c-8760-eeb7-c248-7380c9f4fd34@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>, Long Cheng <long.cheng@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-mediatek@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Sep 2019 13:07:41 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index f40051d6aecb..c20e6bd4e298 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -475,7 +475,6 @@ static int mtk_uart_apdma_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	struct mtk_uart_apdmadev *mtkd;
 	int bit_mask = 32, rc;
-	struct resource *res;
 	struct mtk_chan *c;
 	unsigned int i;

@@ -532,13 +531,7 @@ static int mtk_uart_apdma_probe(struct platform_device *pdev)
 			goto err_no_dma;
 		}

-		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
-		if (!res) {
-			rc = -ENODEV;
-			goto err_no_dma;
-		}
-
-		c->base = devm_ioremap_resource(&pdev->dev, res);
+		c->base = devm_platform_ioremap_resource(pdev, i);
 		if (IS_ERR(c->base)) {
 			rc = PTR_ERR(c->base);
 			goto err_no_dma;
--
2.23.0
