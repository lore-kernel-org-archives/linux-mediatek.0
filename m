From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v5 12/14] soc: mediatek: Add extra sram control
Date: Tue, 19 Mar 2019 16:01:38 +0800
Message-ID: <20190319080140.24055-13-weiyi.lu@mediatek.com>
References: <20190319080140.24055-1-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190319080140.24055-1-weiyi.lu@mediatek.com>
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
Cc: James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>, srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

For some power domains like vpu_core on MT8183 whose sram need to
do clock and internal isolation while power on/off sram.
We add a flag "sram_iso_ctrl" in scp_domain_data to judge if we
need to do the extra sram isolation control or not.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-scpsys.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index 356ca2626b36..94c10f69655d 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -57,6 +57,8 @@
 #define PWR_ON_BIT			BIT(2)
 #define PWR_ON_2ND_BIT			BIT(3)
 #define PWR_CLK_DIS_BIT			BIT(4)
+#define PWR_SRAM_CLKISO_BIT		BIT(5)
+#define PWR_SRAM_ISOINT_B_BIT		BIT(6)
 
 #define PWR_STATUS_CONN			BIT(1)
 #define PWR_STATUS_DISP			BIT(3)
@@ -115,6 +117,8 @@ static const char * const clk_names[] = {
  * @name: The domain name.
  * @sta_mask: The mask for power on/off status bit.
  * @ctl_offs: The offset for main power control register.
+ * @sram_iso_ctrl: The flag to judge if the power domain need to do
+ *                 the extra sram isolation control.
  * @sram_pdn_bits: The mask for sram power control bits.
  * @sram_pdn_ack_bits: The mask for sram power control acked bits.
  * @bus_prot_mask: The mask for single step bus protection.
@@ -131,6 +135,7 @@ struct scp_domain_data {
 	const char *name;
 	u32 sta_mask;
 	int ctl_offs;
+	bool sram_iso_ctrl;
 	u32 sram_pdn_bits;
 	u32 sram_pdn_ack_bits;
 	u32 bus_prot_mask;
@@ -273,6 +278,14 @@ static int scpsys_sram_enable(struct scp_domain *scpd, void __iomem *ctl_addr)
 			return ret;
 	}
 
+	if (scpd->data->sram_iso_ctrl)	{
+		val = readl(ctl_addr) | PWR_SRAM_ISOINT_B_BIT;
+		writel(val, ctl_addr);
+		udelay(1);
+		val &= ~PWR_SRAM_CLKISO_BIT;
+		writel(val, ctl_addr);
+	}
+
 	return 0;
 }
 
@@ -282,6 +295,15 @@ static int scpsys_sram_disable(struct scp_domain *scpd, void __iomem *ctl_addr)
 	u32 pdn_ack = scpd->data->sram_pdn_ack_bits;
 	int tmp;
 
+	if (scpd->data->sram_iso_ctrl)	{
+		val = readl(ctl_addr);
+		val |= PWR_SRAM_CLKISO_BIT;
+		writel(val, ctl_addr);
+		val &= ~PWR_SRAM_ISOINT_B_BIT;
+		writel(val, ctl_addr);
+		udelay(1);
+	}
+
 	val = readl(ctl_addr) | scpd->data->sram_pdn_bits;
 	writel(val, ctl_addr);
 
-- 
2.18.0
