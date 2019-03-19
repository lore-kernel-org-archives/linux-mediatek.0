From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v5 05/14] soc: mediatek: Refactor regulator control
Date: Tue, 19 Mar 2019 16:01:31 +0800
Message-ID: <20190319080140.24055-6-weiyi.lu@mediatek.com>
References: <20190319080140.24055-1-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190319080140.24055-1-weiyi.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Weiyi Lu <weiyi.lu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Put regulator enable and disable control in separate functions.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-scpsys.c | 32 ++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index 2855111b221a..765ad4a5e5df 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -192,6 +192,22 @@ static int scpsys_domain_is_on(struct scp_domain *scpd)
 	return -EINVAL;
 }
 
+static int scpsys_regulator_enable(struct scp_domain *scpd)
+{
+	if (!scpd->supply)
+		return 0;
+
+	return regulator_enable(scpd->supply);
+}
+
+static int scpsys_regulator_disable(struct scp_domain *scpd)
+{
+	if (!scpd->supply)
+		return 0;
+
+	return regulator_disable(scpd->supply);
+}
+
 static int scpsys_power_on(struct generic_pm_domain *genpd)
 {
 	struct scp_domain *scpd = container_of(genpd, struct scp_domain, genpd);
@@ -202,11 +218,9 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	int ret, tmp;
 	int i;
 
-	if (scpd->supply) {
-		ret = regulator_enable(scpd->supply);
-		if (ret)
-			return ret;
-	}
+	ret = scpsys_regulator_enable(scpd);
+	if (ret < 0)
+		return ret;
 
 	for (i = 0; i < MAX_CLKS && scpd->clk[i]; i++) {
 		ret = clk_prepare_enable(scpd->clk[i]);
@@ -274,8 +288,7 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 			clk_disable_unprepare(scpd->clk[i]);
 	}
 err_clk:
-	if (scpd->supply)
-		regulator_disable(scpd->supply);
+	scpsys_regulator_disable(scpd);
 
 	dev_err(scp->dev, "Failed to power on domain %s\n", genpd->name);
 
@@ -334,8 +347,9 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 	for (i = 0; i < MAX_CLKS && scpd->clk[i]; i++)
 		clk_disable_unprepare(scpd->clk[i]);
 
-	if (scpd->supply)
-		regulator_disable(scpd->supply);
+	ret = scpsys_regulator_disable(scpd);
+	if (ret < 0)
+		goto out;
 
 	return 0;
 
-- 
2.18.0
