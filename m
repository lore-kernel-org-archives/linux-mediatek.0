From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v6 08/14] soc: mediatek: Refactor bus protection control
Date: Thu, 20 Jun 2019 10:38:00 +0800
Message-ID: <1560998286-9189-9-git-send-email-weiyi.lu@mediatek.com>
References: <1560998286-9189-1-git-send-email-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1560998286-9189-1-git-send-email-weiyi.lu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>, srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org, Yong Wu <yong.wu@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Put bus protection enable and disable control in separate functions.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-scpsys.c | 44 ++++++++++++++++++++++++++-------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index 58627ab..178198b 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -274,6 +274,30 @@ static int scpsys_sram_disable(struct scp_domain *scpd, void __iomem *ctl_addr)
 			MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
 }
 
+static int scpsys_bus_protect_enable(struct scp_domain *scpd)
+{
+	struct scp *scp = scpd->scp;
+
+	if (!scpd->data->bus_prot_mask)
+		return 0;
+
+	return mtk_infracfg_set_bus_protection(scp->infracfg,
+			scpd->data->bus_prot_mask,
+			scp->bus_prot_reg_update);
+}
+
+static int scpsys_bus_protect_disable(struct scp_domain *scpd)
+{
+	struct scp *scp = scpd->scp;
+
+	if (!scpd->data->bus_prot_mask)
+		return 0;
+
+	return mtk_infracfg_clear_bus_protection(scp->infracfg,
+			scpd->data->bus_prot_mask,
+			scp->bus_prot_reg_update);
+}
+
 static int scpsys_power_on(struct generic_pm_domain *genpd)
 {
 	struct scp_domain *scpd = container_of(genpd, struct scp_domain, genpd);
@@ -316,13 +340,9 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	if (ret < 0)
 		goto err_pwr_ack;
 
-	if (scpd->data->bus_prot_mask) {
-		ret = mtk_infracfg_clear_bus_protection(scp->infracfg,
-				scpd->data->bus_prot_mask,
-				scp->bus_prot_reg_update);
-		if (ret)
-			goto err_pwr_ack;
-	}
+	ret = scpsys_bus_protect_disable(scpd);
+	if (ret < 0)
+		goto err_pwr_ack;
 
 	return 0;
 
@@ -344,13 +364,9 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 	u32 val;
 	int ret, tmp;
 
-	if (scpd->data->bus_prot_mask) {
-		ret = mtk_infracfg_set_bus_protection(scp->infracfg,
-				scpd->data->bus_prot_mask,
-				scp->bus_prot_reg_update);
-		if (ret)
-			goto out;
-	}
+	ret = scpsys_bus_protect_enable(scpd);
+	if (ret < 0)
+		goto out;
 
 	ret = scpsys_sram_disable(scpd, ctl_addr);
 	if (ret < 0)
-- 
1.8.1.1.dirty
