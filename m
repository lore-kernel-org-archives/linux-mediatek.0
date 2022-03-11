Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C08EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 13:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UjmYDq4BXTl9Tl13F8QNjXKhwRHaTTgcGEYMB5vinSQ=; b=2kDV46N8tTbLkv
	k0bJnLSeo2IZd9jyE64P+/hMDLCqU+eM67bOie0MNJ0jXP8E+d7eBAvbgDCYPVzf2tzw7JIUzUAf/
	Za22KIqy6p8bCxxxePXvKRLxoc9ROr1JNiE0Rs35pw8uxR5QA9ebOPlokiO7xcu8FMVGQOUWpAn+0
	ocXNqnXf28FbnOynOIZ/0mW0ntMHTYsXHQUdwyE89UwLxE1Ggpmn7tukt1Dx/mt7IWWx+QebldIN3
	AlFbB0edC+cIm1o+K0quX3fKM76AFN9Q5hyRlfh6KY9ScCZiDzS0sF8AHkE29IOtG/G0qS7v0V1Pq
	GnebQk2JAjOFyUntbHYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSfag-00Ga2g-3W; Fri, 11 Mar 2022 13:45:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSfaT-00Ga0r-Co; Fri, 11 Mar 2022 13:45:47 +0000
X-UUID: 0ab0cb648e324c8bbd494a8a21ade2c5-20220311
X-UUID: 0ab0cb648e324c8bbd494a8a21ade2c5-20220311
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1061876310; Fri, 11 Mar 2022 06:45:42 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Mar 2022 05:35:40 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 11 Mar 2022 21:35:32 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Mar 2022 21:35:31 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Jianjun Wang <jianjun.wang@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rex-bc.chen@mediatek.com>,
 <randy.wu@mediatek.com>, <jieyy.yang@mediatek.com>,
 <chuanjia.liu@mediatek.com>, <qizhong.cheng@mediatek.com>,
 <jian.yang@mediatek.com>
Subject: [PATCH 1/2] phy: mediatek: Add PCIe PHY driver
Date: Fri, 11 Mar 2022 21:35:26 +0800
Message-ID: <20220311133527.5914-2-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311133527.5914-1-jianjun.wang@mediatek.com>
References: <20220311133527.5914-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_054545_453237_015323EE 
X-CRM114-Status: GOOD (  22.41  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add PCIe GEN3 PHY driver support on MediaTek chipsets.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
---
 drivers/phy/mediatek/Kconfig        |  11 ++
 drivers/phy/mediatek/Makefile       |   1 +
 drivers/phy/mediatek/phy-mtk-pcie.c | 198 ++++++++++++++++++++++++++++
 3 files changed, 210 insertions(+)
 create mode 100644 drivers/phy/mediatek/phy-mtk-pcie.c

diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
index 55f8e6c048ab..387ed1b3f2cc 100644
--- a/drivers/phy/mediatek/Kconfig
+++ b/drivers/phy/mediatek/Kconfig
@@ -55,3 +55,14 @@ config PHY_MTK_MIPI_DSI
 	select GENERIC_PHY
 	help
 	  Support MIPI DSI for Mediatek SoCs.
+
+config PHY_MTK_PCIE
+	tristate "MediaTek PCIe-PHY Driver"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on OF
+	select GENERIC_PHY
+	help
+	  Say 'Y' here to add support for MediaTek PCIe PHY driver.
+	  This driver create the basic PHY instance and provides initialize
+	  callback for PCIe GEN3 port, it supports software efuse
+	  initialization.
diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
index ace660fbed3a..788c13147f63 100644
--- a/drivers/phy/mediatek/Makefile
+++ b/drivers/phy/mediatek/Makefile
@@ -6,6 +6,7 @@
 obj-$(CONFIG_PHY_MTK_TPHY)		+= phy-mtk-tphy.o
 obj-$(CONFIG_PHY_MTK_UFS)		+= phy-mtk-ufs.o
 obj-$(CONFIG_PHY_MTK_XSPHY)		+= phy-mtk-xsphy.o
+obj-$(CONFIG_PHY_MTK_PCIE)		+= phy-mtk-pcie.o
 
 phy-mtk-hdmi-drv-y			:= phy-mtk-hdmi.o
 phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-mt2701.o
diff --git a/drivers/phy/mediatek/phy-mtk-pcie.c b/drivers/phy/mediatek/phy-mtk-pcie.c
new file mode 100644
index 000000000000..45a67d9171f6
--- /dev/null
+++ b/drivers/phy/mediatek/phy-mtk-pcie.c
@@ -0,0 +1,198 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Jianjun Wang <jianjun.wang@mediatek.com>
+ */
+
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+
+#include "phy-mtk-io.h"
+
+#define PEXTP_ANA_GLB_00_REG		0x9000
+#define PEXTP_ANA_LN0_TX_REG		0xA004
+#define PEXTP_ANA_LN0_RX_REG		0xA03C
+#define PEXTP_ANA_LN1_TX_REG		0xA104
+#define PEXTP_ANA_LN1_RX_REG		0xA13c
+
+/* PEXTP_GLB_00_RG[28:24] Internal Resistor Selection of TX Bias Current */
+#define EFUSE_GLB_INTR_SEL		GENMASK(28, 24)
+#define EFUSE_GLB_INTR_VAL(x)		((0x1f & (x)) << 24)
+
+/* PEXTP_ANA_LN_RX_RG[3:0] LN0 RX impedance selection */
+#define EFUSE_LN_RX_SEL			GENMASK(3, 0)
+#define EFUSE_LN_RX_VAL(x)		(0xf & (x))
+
+/* PEXTP_ANA_LN_TX_RG[5:2] LN0 TX PMOS impedance selection */
+#define EFUSE_LN_TX_PMOS_SEL		GENMASK(5, 2)
+#define EFUSE_LN_TX_PMOS_VAL(x)		((0xf & (x)) << 2)
+
+/* PEXTP_ANA_LN_TX_RG[11:8] LN0 TX NMOS impedance selection */
+#define EFUSE_LN_TX_NMOS_SEL		GENMASK(11, 8)
+#define EFUSE_LN_TX_NMOS_VAL(x)		((0xf & (x)) << 8)
+
+struct mtk_pcie_phy {
+	struct device *dev;
+	struct phy *phy;
+	void __iomem *sif_base;
+};
+
+static int mtk_pcie_phy_init(struct phy *phy)
+{
+	struct mtk_pcie_phy *pcie_phy = phy_get_drvdata(phy);
+	struct device *dev = pcie_phy->dev;
+	bool nvmem_enabled;
+	u32 glb_intr, tx_pmos, tx_nmos, rx_data;
+	int ret;
+
+	nvmem_enabled = device_property_read_bool(dev, "nvmem-cells");
+	if (!nvmem_enabled)
+		return 0;
+
+	/* Set efuse value for lane0 */
+	ret = nvmem_cell_read_variable_le_u32(dev, "tx_ln0_pmos", &tx_pmos);
+	if (ret) {
+		dev_err(dev, "%s: Failed to read tx_ln0_pmos\n", __func__);
+		return ret;
+	}
+
+	ret = nvmem_cell_read_variable_le_u32(dev, "tx_ln0_nmos", &tx_nmos);
+	if (ret) {
+		dev_err(dev, "%s: Failed to read tx_ln0_nmos\n", __func__);
+		return ret;
+	}
+
+	ret = nvmem_cell_read_variable_le_u32(dev, "rx_ln0", &rx_data);
+	if (ret) {
+		dev_err(dev, "%s: Failed to read rx_ln0\n", __func__);
+		return ret;
+	}
+
+	/* Don't wipe the old data if there is no data in efuse cell */
+	if (!(tx_pmos || tx_nmos || rx_data)) {
+		dev_warn(dev, "%s: No efuse data found, but dts enable it\n",
+			 __func__);
+		return 0;
+	}
+
+	mtk_phy_update_bits(pcie_phy->sif_base + PEXTP_ANA_LN0_TX_REG,
+			    EFUSE_LN_TX_PMOS_SEL,
+			    EFUSE_LN_TX_PMOS_VAL(tx_pmos));
+
+	mtk_phy_update_bits(pcie_phy->sif_base + PEXTP_ANA_LN0_TX_REG,
+			    EFUSE_LN_TX_NMOS_SEL,
+			    EFUSE_LN_TX_NMOS_VAL(tx_nmos));
+
+	mtk_phy_update_bits(pcie_phy->sif_base + PEXTP_ANA_LN0_RX_REG,
+			    EFUSE_LN_RX_SEL, EFUSE_LN_RX_VAL(rx_data));
+
+	/* Set global data */
+	ret = nvmem_cell_read_variable_le_u32(dev, "glb_intr", &glb_intr);
+	if (ret) {
+		dev_err(dev, "%s: Failed to read glb_intr\n", __func__);
+		return ret;
+	}
+
+	mtk_phy_update_bits(pcie_phy->sif_base + PEXTP_ANA_GLB_00_REG,
+			    EFUSE_GLB_INTR_SEL, EFUSE_GLB_INTR_VAL(glb_intr));
+
+	/*
+	 * Set efuse value for lane1, only available for the platform which
+	 * supports two lane.
+	 */
+	ret = nvmem_cell_read_variable_le_u32(dev, "tx_ln1_pmos", &tx_pmos);
+	if (ret) {
+		dev_err(dev, "%s: Failed to read tx_ln1_pmos, efuse value not support for lane 1\n",
+			__func__);
+		return 0;
+	}
+
+	ret = nvmem_cell_read_variable_le_u32(dev, "tx_ln1_nmos", &tx_nmos);
+	if (ret) {
+		dev_err(dev, "%s: Failed to read tx_ln1_pmos\n", __func__);
+		return ret;
+	}
+
+	ret = nvmem_cell_read_variable_le_u32(dev, "rx_ln1", &rx_data);
+	if (ret) {
+		dev_err(dev, "%s: Failed to read rx_ln1\n", __func__);
+		return ret;
+	}
+
+	if (!(tx_pmos || tx_nmos || rx_data))
+		return 0;
+
+	mtk_phy_update_bits(pcie_phy->sif_base + PEXTP_ANA_LN1_TX_REG,
+			    EFUSE_LN_TX_PMOS_SEL,
+			    EFUSE_LN_TX_PMOS_VAL(tx_pmos));
+
+	mtk_phy_update_bits(pcie_phy->sif_base + PEXTP_ANA_LN1_TX_REG,
+			    EFUSE_LN_TX_NMOS_SEL,
+			    EFUSE_LN_TX_NMOS_VAL(tx_nmos));
+
+	mtk_phy_update_bits(pcie_phy->sif_base + PEXTP_ANA_LN1_RX_REG,
+			    EFUSE_LN_RX_SEL, EFUSE_LN_RX_VAL(rx_data));
+
+	return 0;
+}
+
+static const struct phy_ops mtk_pcie_phy_ops = {
+	.init	= mtk_pcie_phy_init,
+	.owner	= THIS_MODULE,
+};
+
+static int mtk_pcie_phy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct phy_provider *provider;
+	struct mtk_pcie_phy *pcie_phy;
+
+	pcie_phy = devm_kzalloc(dev, sizeof(*pcie_phy), GFP_KERNEL);
+	if (!pcie_phy)
+		return -ENOMEM;
+
+	pcie_phy->dev = dev;
+
+	pcie_phy->sif_base = devm_platform_ioremap_resource_byname(pdev, "sif");
+	if (IS_ERR(pcie_phy->sif_base)) {
+		dev_err(dev, "%s: Failed to map phy-sif base\n", __func__);
+		return PTR_ERR(pcie_phy->sif_base);
+	}
+
+	pcie_phy->phy = devm_phy_create(dev, dev->of_node, &mtk_pcie_phy_ops);
+	if (IS_ERR(pcie_phy->phy)) {
+		dev_err(dev, "%s: Failed to create PCIe phy\n", __func__);
+		return PTR_ERR(pcie_phy->phy);
+	}
+
+	phy_set_drvdata(pcie_phy->phy, pcie_phy);
+
+	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(provider);
+}
+
+static const struct of_device_id mtk_pcie_phy_of_match[] = {
+	{ .compatible = "mediatek,pcie-phy" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, mtk_pcie_phy_of_match);
+
+static struct platform_driver mtk_pcie_phy_driver = {
+	.probe	= mtk_pcie_phy_probe,
+	.driver	= {
+		.name = "mtk-pcie-phy",
+		.of_match_table = mtk_pcie_phy_of_match,
+	},
+};
+module_platform_driver(mtk_pcie_phy_driver);
+
+MODULE_DESCRIPTION("MediaTek PCIe PHY driver");
+MODULE_AUTHOR("Jianjun Wang <jianjun.wang@mediatek.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
