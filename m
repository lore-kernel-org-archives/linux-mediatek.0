From: Yong Liang <yong.liang@mediatek.com>
Subject: [PATCH v2 2/2] clk: reset: Modify reset-controller driver
Date: Fri, 26 Apr 2019 15:10:18 +0800
Message-ID: <1556262618-14281-2-git-send-email-yong.liang@mediatek.com>
References: <1556262618-14281-1-git-send-email-yong.liang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1556262618-14281-1-git-send-email-yong.liang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, drinkcat@chromium.org, weiyi.lu@mediatek.com, jamesjj.liao@mediatek.com, jasu@njomotys.info, owen.chen@mediatek.com, chunhui.dai@mediatek.com, erin.lo@mediatek.com, eddie.huang@mediatek.com
Cc: "yong.liang" <yong.liang@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

From: "yong.liang" <yong.liang@mediatek.com>

Set reset signal by a register and clear reset signal by
another register for 8183.
Base on https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git branch clk-next and https://patchwork.kernel.org/patch/10856987/

Changes in patch v2:
Rollback modify for "_tuner_en_bit, _pcw_reg, _pcw_shift,"
in drivers/clk/mediatek/clk-mt8183.c

Signed-off-by: yong.liang <yong.liang@mediatek.com>
---
 drivers/clk/mediatek/clk-mt8183.c                  |   10 ++-
 drivers/clk/mediatek/clk-mtk.h                     |    3 +
 drivers/clk/mediatek/reset.c                       |   53 +++++++++++-
 .../dt-bindings/reset-controller/mt8183-resets.h   |   89 ++++++++++++++++++++
 4 files changed, 151 insertions(+), 4 deletions(-)
 create mode 100644 include/dt-bindings/reset-controller/mt8183-resets.h

diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
index 9d86510..cda5b91 100644
--- a/drivers/clk/mediatek/clk-mt8183.c
+++ b/drivers/clk/mediatek/clk-mt8183.c
@@ -1156,6 +1156,7 @@ static int clk_mt8183_apmixed_probe(struct platform_device *pdev)
 {
 	struct clk_onecell_data *clk_data;
 	struct device_node *node = pdev->dev.of_node;
+	int r;
 
 	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
 
@@ -1164,7 +1165,14 @@ static int clk_mt8183_apmixed_probe(struct platform_device *pdev)
 	mtk_clk_register_gates(node, apmixed_clks, ARRAY_SIZE(apmixed_clks),
 		clk_data);
 
-	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	if (r)
+		dev_err(&pdev->dev,
+			"%s(): could not register clock provider: %d\n",__func__, r);
+
+	mtk_register_reset_controller_set_clr(node, 4, 0x120);
+
+	return r;
 }
 
 static int clk_mt8183_top_probe(struct platform_device *pdev)
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 33ab173..7a74a54 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -248,4 +248,7 @@ struct clk *mtk_clk_register_ref2usb_tx(const char *name,
 void mtk_register_reset_controller(struct device_node *np,
 			unsigned int num_regs, int regofs);
 
+void mtk_register_reset_controller_set_clr(struct device_node *np,
+	unsigned int num_regs, int regofs);
+
 #endif /* __DRV_CLK_MTK_H */
diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index d3551d5..ee70798 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -27,6 +27,21 @@ struct mtk_reset {
 	struct reset_controller_dev rcdev;
 };
 
+static int mtk_reset_assert_set_clr(struct reset_controller_dev *rcdev,
+	unsigned long id)
+{
+	struct mtk_reset *data = container_of(rcdev, struct mtk_reset, rcdev);
+	return regmap_write(data->regmap, data->regofs + ((id / 32) << 4), 1);
+}
+
+static int mtk_reset_deassert_set_clr(struct reset_controller_dev *rcdev,
+	unsigned long id)
+{
+	struct mtk_reset *data = container_of(rcdev, struct mtk_reset, rcdev);
+	return regmap_write(data->regmap,
+		data->regofs + ((id / 32) << 4) + 0x4, 1);
+}
+
 static int mtk_reset_assert(struct reset_controller_dev *rcdev,
 			      unsigned long id)
 {
@@ -57,14 +72,31 @@ static int mtk_reset(struct reset_controller_dev *rcdev,
 	return mtk_reset_deassert(rcdev, id);
 }
 
+static int mtk_reset_set_clr(struct reset_controller_dev *rcdev,
+	unsigned long id)
+{
+	int ret;
+	ret = mtk_reset_assert_set_clr(rcdev, id);
+	if (ret)
+		return ret;
+	return mtk_reset_deassert_set_clr(rcdev, id);
+}
+
 static const struct reset_control_ops mtk_reset_ops = {
 	.assert = mtk_reset_assert,
 	.deassert = mtk_reset_deassert,
 	.reset = mtk_reset,
 };
 
-void mtk_register_reset_controller(struct device_node *np,
-			unsigned int num_regs, int regofs)
+static const struct reset_control_ops mtk_reset_ops_set_clr = {
+	.assert = mtk_reset_assert_set_clr,
+		.deassert = mtk_reset_deassert_set_clr,
+		.reset = mtk_reset_set_clr,
+};
+
+void mtk_register_reset_controller_common(struct device_node *np,
+			unsigned int num_regs, int regofs,
+			const struct reset_control_ops *reset_ops)
 {
 	struct mtk_reset *data;
 	int ret;
@@ -85,7 +117,7 @@ void mtk_register_reset_controller(struct device_node *np,
 	data->regofs = regofs;
 	data->rcdev.owner = THIS_MODULE;
 	data->rcdev.nr_resets = num_regs * 32;
-	data->rcdev.ops = &mtk_reset_ops;
+	data->rcdev.ops = reset_ops;
 	data->rcdev.of_node = np;
 
 	ret = reset_controller_register(&data->rcdev);
@@ -95,3 +127,18 @@ void mtk_register_reset_controller(struct device_node *np,
 		return;
 	}
 }
+
+void mtk_register_reset_controller(struct device_node *np,
+	unsigned int num_regs, int regofs)
+{
+	mtk_register_reset_controller_common(np, num_regs, regofs,
+		&mtk_reset_ops);
+}
+
+void mtk_register_reset_controller_set_clr(struct device_node *np,
+	unsigned int num_regs, int regofs)
+{
+	mtk_register_reset_controller_common(np, num_regs, regofs,
+		&mtk_reset_ops_set_clr);
+}
+
diff --git a/include/dt-bindings/reset-controller/mt8183-resets.h b/include/dt-bindings/reset-controller/mt8183-resets.h
new file mode 100644
index 0000000..f0d92af
--- /dev/null
+++ b/include/dt-bindings/reset-controller/mt8183-resets.h
@@ -0,0 +1,89 @@
+/*
+ * Copyright (c) 2017 MediaTek Inc.
+ * Author: Yong Liang, MediaTek
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8183
+#define _DT_BINDINGS_RESET_CONTROLLER_MT8183
+
+/* INFRACFG AO resets */
+#define MT8183_INFRACFG_AO_THERM_SW_RST				0
+#define MT8183_INFRACFG_AO_USB_TOP_SW_RST			1
+#define MT8183_INFRACFG_AO_MM_IOMMU_SW_RST			3
+#define MT8183_INFRACFG_AO_MSDC3_SW_RST				4
+#define MT8183_INFRACFG_AO_MSDC2_SW_RST				5
+#define MT8183_INFRACFG_AO_MSDC1_SW_RST				6
+#define MT8183_INFRACFG_AO_MSDC0_SW_RST				7
+#define MT8183_INFRACFG_AO_APDMA_SW_RST				9
+#define MT8183_INFRACFG_AO_MIMP_D_SW_RST			10
+#define MT8183_INFRACFG_AO_BTIF_SW_RST				12
+#define MT8183_INFRACFG_AO_DISP_PWM_SW_RST			14
+#define MT8183_INFRACFG_AO_AUXADC_SW_RST			15
+
+#define MT8183_INFRACFG_AO_IRTX_SW_RST				32
+#define MT8183_INFRACFG_AO_SPI0_SW_RST				33
+#define MT8183_INFRACFG_AO_I2C0_SW_RST				34
+#define MT8183_INFRACFG_AO_I2C1_SW_RST				35
+#define MT8183_INFRACFG_AO_I2C2_SW_RST				36
+#define MT8183_INFRACFG_AO_I2C3_SW_RST				37
+#define MT8183_INFRACFG_AO_UART0_SW_RST				38
+#define MT8183_INFRACFG_AO_UART1_SW_RST				39
+#define MT8183_INFRACFG_AO_UART2_SW_RST				40
+#define MT8183_INFRACFG_AO_PWM_SW_RST				41
+#define MT8183_INFRACFG_AO_SPI1_SW_RST				42
+#define MT8183_INFRACFG_AO_I2C4_SW_RST				43
+#define MT8183_INFRACFG_AO_DVFSP_SW_RST				44
+#define MT8183_INFRACFG_AO_SPI2_SW_RST				45
+#define MT8183_INFRACFG_AO_SPI3_SW_RST				46
+#define MT8183_INFRACFG_AO_UFSHCI_SW_RST			47
+
+#define MT8183_INFRACFG_AO_PMIC_WRAP_SW_RST			64
+#define MT8183_INFRACFG_AO_SPM_SW_RST				65
+#define MT8183_INFRACFG_AO_USBSIF_SW_RST			66
+#define MT8183_INFRACFG_AO_KP_SW_RST				68
+#define MT8183_INFRACFG_AO_APXGPT_SW_RST			69
+#define MT8183_INFRACFG_AO_CLDMA_AO_SW_RST			70
+#define MT8183_INFRACFG_AO_UNIPRO_UFS_SW_RST			71
+#define MT8183_INFRACFG_AO_DX_CC_SW_RST				72
+#define MT8183_INFRACFG_AO_UFSPHY_SW_RST			73
+
+#define MT8183_INFRACFG_AO_DX_CC_SEC_SW_RST			96
+#define MT8183_INFRACFG_AO_GCE_SW_RST				97
+#define MT8183_INFRACFG_AO_CLDMA_SW_RST				98
+#define MT8183_INFRACFG_AO_TRNG_SW_RST				99
+#define MT8183_INFRACFG_AO_AP_MD_CCIF_1_SW_RST			103
+#define MT8183_INFRACFG_AO_AP_MD_CCIF_SW_RST			104
+#define MT8183_INFRACFG_AO_I2C1_IMM_SW_RST			105
+#define MT8183_INFRACFG_AO_I2C1_ARB_SW_RST			106
+#define MT8183_INFRACFG_AO_I2C2_IMM_SW_RST			107
+#define MT8183_INFRACFG_AO_I2C2_ARB_SW_RST			108
+#define MT8183_INFRACFG_AO_I2C5_SW_RST				109
+#define MT8183_INFRACFG_AO_I2C5_IMM_SW_RST			110
+#define MT8183_INFRACFG_AO_I2C5_ARB_SW_RST			111
+#define MT8183_INFRACFG_AO_SPI4_SW_RST				112
+#define MT8183_INFRACFG_AO_SPI5_SW_RST				113
+#define MT8183_INFRACFG_AO_INFRA2MFGAXI_CBIP_CLAS_SW_RST	114
+#define MT8183_INFRACFG_AO_MFGAXI2INFRA_M0_CBIP_GLAS_OUT_SW_RST	115
+#define MT8183_INFRACFG_AO_MFGAXI2INFRA_M1_CBIP_GLAS_OUT_SW_RST	116
+#define MT8183_INFRACFG_AO_UFS_AES_SW_RST			117
+#define MT8183_INFRACFG_AO_CCU_I2C_IRQ_SW_RST			118
+#define MT8183_INFRACFG_AO_CCU_I2C_DMA_SW_RST			119
+#define MT8183_INFRACFG_AO_I2C6_SW_RST				120
+#define MT8183_INFRACFG_AO_CCU_GALS_SW_RST			121
+#define MT8183_INFRACFG_AO_IPU_GALS_SW_RST			122
+#define MT8183_INFRACFG_AO_CONN2AP_GALS_SW_RST			123
+#define MT8183_INFRACFG_AO_AP_MD_CCIF2_SW_RST			124
+#define MT8183_INFRACFG_AO_AP_MD_CCIF3_SW_RST			125
+#define MT8183_INFRACFG_AO_I2C7_SW_RST				126
+#define MT8183_INFRACFG_AO_I2C8_SW_RST				127
+
+#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8183 */
-- 
1.7.9.5
