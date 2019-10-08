From: hariprasad@osuosl.org, Kelam@osuosl.org,
	hariprasad.kelam@gmail.com
Subject: [PATCH] staging: mt7621-dma: make use of
 devm_platform_ioremap_resource
Date: Tue,  8 Oct 2019 11:55:51 +0530
Message-ID: <1570515959-26572-1-git-send-email-hariprasad.kelam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
Cc: devel@driverdev.osuosl.org, Hariprasad Kelam <hariprasad.kelam@gmail.com>, Benjamin Sherman <benjamin@bensherman.io>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jules Irenge <jbi.octave@gmail.com>, Stephen Boyd <swboyd@chromium.org>, Armando Miraglia <arma2ff0@gmail.com>, linux-mediatek@lists.infradead.org, Bhanusree Pola <bhanusreemahesh@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

From: Hariprasad Kelam <hariprasad.kelam@gmail.com>

fix below issue reported by coccicheck
rivers/staging//mt7621-dma/mtk-hsdma.c:671:1-5: WARNING: Use
devm_platform_ioremap_resource for base

Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
---
 drivers/staging/mt7621-dma/mtk-hsdma.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/mt7621-dma/mtk-hsdma.c b/drivers/staging/mt7621-dma/mtk-hsdma.c
index d964642..03c8937 100644
--- a/drivers/staging/mt7621-dma/mtk-hsdma.c
+++ b/drivers/staging/mt7621-dma/mtk-hsdma.c
@@ -650,7 +650,6 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
 	struct mtk_hsdma_chan *chan;
 	struct mtk_hsdam_engine *hsdma;
 	struct dma_device *dd;
-	struct resource *res;
 	int ret;
 	int irq;
 	void __iomem *base;
@@ -667,8 +666,7 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
 	if (!hsdma)
 		return -EINVAL;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 	hsdma->base = base + HSDMA_BASE_OFFSET;
-- 
2.7.4
