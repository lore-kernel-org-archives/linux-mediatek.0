From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] soc: mediatek: Use devm_kcalloc() in init_scp()
Date: Wed, 26 Apr 2017 18:52:19 +0200
Message-ID: <bb0b7d0d-a2e7-3415-2c15-961a05493e08@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, James Liao <jamesjj.liao@mediatek.com>, Kevin Hilman <khilman@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shunli Wang <shunli.wang@mediatek.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-mediatek@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 26 Apr 2017 18:33:15 +0200

Multiplications for the size determination of memory allocations
indicated that array data structures should be processed.
Thus use the corresponding function "devm_kcalloc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/soc/mediatek/mtk-scpsys.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index beb79162369a..9abf2b067ec6 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -365,15 +365,14 @@ static struct scp *init_scp(struct platform_device *pdev,
 	if (IS_ERR(scp->base))
 		return ERR_CAST(scp->base);
 
-	scp->domains = devm_kzalloc(&pdev->dev,
-				sizeof(*scp->domains) * num, GFP_KERNEL);
+	scp->domains = devm_kcalloc(&pdev->dev, num, sizeof(*scp->domains),
+				    GFP_KERNEL);
 	if (!scp->domains)
 		return ERR_PTR(-ENOMEM);
 
 	pd_data = &scp->pd_data;
-
-	pd_data->domains = devm_kzalloc(&pdev->dev,
-			sizeof(*pd_data->domains) * num, GFP_KERNEL);
+	pd_data->domains = devm_kcalloc(&pdev->dev, num,
+					sizeof(*pd_data->domains), GFP_KERNEL);
 	if (!pd_data->domains)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.12.2
