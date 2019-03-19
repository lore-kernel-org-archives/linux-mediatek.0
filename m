From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v5 09/14] soc: mediatek: Add basic_clk_name to scp_power_data
Date: Tue, 19 Mar 2019 16:01:35 +0800
Message-ID: <20190319080140.24055-10-weiyi.lu@mediatek.com>
References: <20190319080140.24055-1-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190319080140.24055-1-weiyi.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Weiyi Lu <weiyi.lu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Try to stop extending the clk_id or clk_names if there are
more and more new BASIC clocks. To get its own clocks by the
basic_clk_name of each power domain.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-scpsys.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index 6bf846cb1893..c6360de4e41e 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -118,6 +118,8 @@ static const char * const clk_names[] = {
  * @bus_prot_mask: The mask for single step bus protection.
  * @clk_id: The basic clock needs to be enabled before enabling certain
  *          power domains.
+ * @basic_clk_name: provide the same purpose with field "clk_id"
+ *                  by declaring basic clock prefix name rather than clk_id.
  * @caps: The flag for active wake-up action.
  */
 struct scp_domain_data {
@@ -128,6 +130,7 @@ struct scp_domain_data {
 	u32 sram_pdn_ack_bits;
 	u32 bus_prot_mask;
 	enum clk_id clk_id[MAX_CLKS];
+	const char *basic_clk_name[MAX_CLKS];
 	u8 caps;
 };
 
@@ -499,16 +502,24 @@ static struct scp *init_scp(struct platform_device *pdev,
 
 		scpd->data = data;
 
-		for (j = 0; j < MAX_CLKS && data->clk_id[j]; j++) {
-			struct clk *c = clk[data->clk_id[j]];
+		if (data->clk_id[0]) {
+			for (j = 0; j < MAX_CLKS && data->clk_id[j]; j++) {
+				struct clk *c = clk[data->clk_id[j]];
 
-			if (IS_ERR(c)) {
-				dev_err(&pdev->dev, "%s: clk unavailable\n",
-					data->name);
-				return ERR_CAST(c);
-			}
+				if (IS_ERR(c)) {
+					dev_err(&pdev->dev,
+						"%s: clk unavailable\n",
+						data->name);
+					return ERR_CAST(c);
+				}
 
-			scpd->clk[j] = c;
+				scpd->clk[j] = c;
+			}
+		} else if (data->basic_clk_name[0]) {
+			for (j = 0; j < MAX_CLKS &&
+					data->basic_clk_name[j]; j++)
+				scpd->clk[j] = devm_clk_get(&pdev->dev,
+						data->basic_clk_name[j]);
 		}
 
 		genpd->name = data->name;
-- 
2.18.0
