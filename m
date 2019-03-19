From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v5 07/14] soc: mediatek: Refactor sram control
Date: Tue, 19 Mar 2019 16:01:33 +0800
Message-ID: <20190319080140.24055-8-weiyi.lu@mediatek.com>
References: <20190319080140.24055-1-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190319080140.24055-1-weiyi.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Weiyi Lu <weiyi.lu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Put sram enable and disable control in separate functions.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-scpsys.c | 79 ++++++++++++++++++++-----------
 1 file changed, 51 insertions(+), 28 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index 3e9be07a2627..65b734b40098 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -235,12 +235,55 @@ static void scpsys_clk_disable(struct clk *clk[], int max_num)
 	}
 }
 
+static int scpsys_sram_enable(struct scp_domain *scpd, void __iomem *ctl_addr)
+{
+	u32 val;
+	u32 pdn_ack = scpd->data->sram_pdn_ack_bits;
+	int tmp;
+
+	val = readl(ctl_addr) & ~scpd->data->sram_pdn_bits;
+	writel(val, ctl_addr);
+
+	/* Either wait until SRAM_PDN_ACK all 0 or have a force wait */
+	if (MTK_SCPD_CAPS(scpd, MTK_SCPD_FWAIT_SRAM)) {
+		/*
+		 * Currently, MTK_SCPD_FWAIT_SRAM is necessary only for
+		 * MT7622_POWER_DOMAIN_WB and thus just a trivial setup
+		 * is applied here.
+		 */
+		usleep_range(12000, 12100);
+	} else {
+		/* Either wait until SRAM_PDN_ACK all 1 or 0 */
+		int ret = readl_poll_timeout(ctl_addr, tmp,
+				(tmp & pdn_ack) == 0,
+				MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int scpsys_sram_disable(struct scp_domain *scpd, void __iomem *ctl_addr)
+{
+	u32 val;
+	u32 pdn_ack = scpd->data->sram_pdn_ack_bits;
+	int tmp;
+
+	val = readl(ctl_addr) | scpd->data->sram_pdn_bits;
+	writel(val, ctl_addr);
+
+	/* Either wait until SRAM_PDN_ACK all 1 or 0 */
+	return readl_poll_timeout(ctl_addr, tmp,
+			(tmp & pdn_ack) == pdn_ack,
+			MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+}
+
 static int scpsys_power_on(struct generic_pm_domain *genpd)
 {
 	struct scp_domain *scpd = container_of(genpd, struct scp_domain, genpd);
 	struct scp *scp = scpd->scp;
 	void __iomem *ctl_addr = scp->base + scpd->data->ctl_offs;
-	u32 pdn_ack = scpd->data->sram_pdn_ack_bits;
 	u32 val;
 	int ret, tmp;
 
@@ -252,6 +295,7 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	if (ret)
 		goto err_clk;
 
+	/* subsys power on */
 	val = readl(ctl_addr);
 	val |= PWR_ON_BIT;
 	writel(val, ctl_addr);
@@ -273,24 +317,9 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	val |= PWR_RST_B_BIT;
 	writel(val, ctl_addr);
 
-	val &= ~scpd->data->sram_pdn_bits;
-	writel(val, ctl_addr);
-
-	/* Either wait until SRAM_PDN_ACK all 0 or have a force wait */
-	if (MTK_SCPD_CAPS(scpd, MTK_SCPD_FWAIT_SRAM)) {
-		/*
-		 * Currently, MTK_SCPD_FWAIT_SRAM is necessary only for
-		 * MT7622_POWER_DOMAIN_WB and thus just a trivial setup is
-		 * applied here.
-		 */
-		usleep_range(12000, 12100);
-
-	} else {
-		ret = readl_poll_timeout(ctl_addr, tmp, (tmp & pdn_ack) == 0,
-					 MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
-		if (ret < 0)
-			goto err_pwr_ack;
-	}
+	ret = scpsys_sram_enable(scpd, ctl_addr);
+	if (ret < 0)
+		goto err_pwr_ack;
 
 	if (scpd->data->bus_prot_mask) {
 		ret = mtk_infracfg_clear_bus_protection(scp->infracfg,
@@ -317,7 +346,6 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 	struct scp_domain *scpd = container_of(genpd, struct scp_domain, genpd);
 	struct scp *scp = scpd->scp;
 	void __iomem *ctl_addr = scp->base + scpd->data->ctl_offs;
-	u32 pdn_ack = scpd->data->sram_pdn_ack_bits;
 	u32 val;
 	int ret, tmp;
 
@@ -329,17 +357,12 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 			goto out;
 	}
 
-	val = readl(ctl_addr);
-	val |= scpd->data->sram_pdn_bits;
-	writel(val, ctl_addr);
-
-	/* wait until SRAM_PDN_ACK all 1 */
-	ret = readl_poll_timeout(ctl_addr, tmp, (tmp & pdn_ack) == pdn_ack,
-				 MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+	ret = scpsys_sram_disable(scpd, ctl_addr);
 	if (ret < 0)
 		goto out;
 
-	val |= PWR_ISO_BIT;
+	/* subsys power off */
+	val = readl(ctl_addr) | PWR_ISO_BIT;
 	writel(val, ctl_addr);
 
 	val &= ~PWR_RST_B_BIT;
-- 
2.18.0
