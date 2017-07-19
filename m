From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 074/102] soc: mediatek: PMIC wrap: explicitly request exclusive reset control
Date: Wed, 19 Jul 2017 17:26:18 +0200
Message-ID: <20170719152646.25903-75-p.zabel@pengutronix.de>
References: <20170719152646.25903-1-p.zabel@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170719152646.25903-1-p.zabel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Commit a53e35db70d1 ("reset: Ensure drivers are explicit when requesting
reset lines") started to transition the reset control request API calls
to explicitly state whether the driver needs exclusive or shared reset
control behavior. Convert all drivers requesting exclusive resets to the
explicit API call so the temporary transition helpers can be removed.

No functional changes.

Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index c80a04e1b2b16..05496ba674517 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -1145,7 +1145,7 @@ static int pwrap_probe(struct platform_device *pdev)
 	if (IS_ERR(wrp->base))
 		return PTR_ERR(wrp->base);
 
-	wrp->rstc = devm_reset_control_get(wrp->dev, "pwrap");
+	wrp->rstc = devm_reset_control_get_exclusive(wrp->dev, "pwrap");
 	if (IS_ERR(wrp->rstc)) {
 		ret = PTR_ERR(wrp->rstc);
 		dev_dbg(wrp->dev, "cannot get pwrap reset: %d\n", ret);
@@ -1159,7 +1159,8 @@ static int pwrap_probe(struct platform_device *pdev)
 		if (IS_ERR(wrp->bridge_base))
 			return PTR_ERR(wrp->bridge_base);
 
-		wrp->rstc_bridge = devm_reset_control_get(wrp->dev, "pwrap-bridge");
+		wrp->rstc_bridge = devm_reset_control_get_exclusive(wrp->dev,
+								    "pwrap-bridge");
 		if (IS_ERR(wrp->rstc_bridge)) {
 			ret = PTR_ERR(wrp->rstc_bridge);
 			dev_dbg(wrp->dev, "cannot get pwrap-bridge reset: %d\n", ret);
-- 
2.11.0
