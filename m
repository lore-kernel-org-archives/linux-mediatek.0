Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C75C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 07:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f1tgPc8dZcHFMR28dgdSs/ee4dx5oz/SyHDJ+Qbu5x0=; b=FNTH30eiE3Imut
	0X5TV2vq2rkqISi7eD1MaOsnkkrID4V2hkWaSYSGqgqWO2BO5H1D/wO2pD2KaeNWZmOJD0dW2fkMk
	BL5SX2arkc4BImh8yiVkY8wjDW5jZEjbSBlZrqnVUNJ/1zdD5VZJuylvwI+4znHaRZkztSJ5gV4CK
	Y6XTfxlxANwj8a36G9QF7GT7I7baroX8B9iEaVhXPH3ZlO2DFJZu5q+zMPH2xZiFekfhppRIjwC9i
	z677G8hLhzttwSjCehjS34cwqipPiMmz1lMO0lKFJ3G70jaOq9l56u67foPosGnLVht4o/UcVhMsH
	zXfGfrMYaaKE6MGQERgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0ead-001yIb-IP; Mon, 13 Jun 2022 07:34:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0eaQ-001yEs-TI; Mon, 13 Jun 2022 07:34:12 +0000
X-UUID: f88526613bf742b390311c9af1a2bcac-20220613
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:c5c1ce0c-182b-4752-91b4-b86093363049,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:b14ad71,CLOUDID:a7935cc6-12ba-4305-bfdf-9aefbdc32516,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: f88526613bf742b390311c9af1a2bcac-20220613
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1172290061; Mon, 13 Jun 2022 00:34:04 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Jun 2022 00:26:51 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 13 Jun 2022 15:26:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Jun 2022 15:26:49 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>,
	<chunfeng.yun@mediatek.com>, <kishon@ti.com>, <vkoul@kernel.org>,
	<matthias.bgg@gmail.com>, <airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<ck.hu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH v11 1/1] phy: phy-mtk-dp: Add driver for DP phy
Date: Mon, 13 Jun 2022 15:26:48 +0800
Message-ID: <20220613072648.11081-2-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220613072648.11081-1-rex-bc.chen@mediatek.com>
References: <20220613072648.11081-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_003411_000202_6E95019F 
X-CRM114-Status: GOOD (  23.42  )
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

From: Markus Schneider-Pargmann <msp@baylibre.com>

This is a new driver that supports the integrated DisplayPort phy for
mediatek SoCs, especially the mt8195. The phy is integrated into the
DisplayPort controller and will be created by the mtk-dp driver. This
driver expects a struct regmap to be able to work on the same registers
as the DisplayPort controller. It sets the device data to be the struct
phy so that the DisplayPort controller can easily work with it.

The driver does not have any devicetree bindings because the datasheet
does not list the controller and the phy as distinct units.

The interaction with the controller can be covered by the configure
callback of the phy framework and its displayport parameters.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
[Bo-Chen: Modify reviewers' comments.]
Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 MAINTAINERS                       |   1 +
 drivers/phy/mediatek/Kconfig      |   8 ++
 drivers/phy/mediatek/Makefile     |   1 +
 drivers/phy/mediatek/phy-mtk-dp.c | 202 ++++++++++++++++++++++++++++++
 4 files changed, 212 insertions(+)
 create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a6d3bd9d2a8d..f1460ee9ce83 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6698,6 +6698,7 @@ L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/display/mediatek/
 F:	drivers/gpu/drm/mediatek/
+F:	drivers/phy/mediatek/phy-mtk-dp.c
 F:	drivers/phy/mediatek/phy-mtk-hdmi*
 F:	drivers/phy/mediatek/phy-mtk-mipi*
 
diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
index 55f8e6c048ab..d631525d12e1 100644
--- a/drivers/phy/mediatek/Kconfig
+++ b/drivers/phy/mediatek/Kconfig
@@ -55,3 +55,11 @@ config PHY_MTK_MIPI_DSI
 	select GENERIC_PHY
 	help
 	  Support MIPI DSI for Mediatek SoCs.
+
+config PHY_MTK_DP
+	tristate "MediaTek DP-PHY Driver"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on OF
+	select GENERIC_PHY
+	help
+	  Support DisplayPort PHY for MediaTek SoCs.
diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
index ace660fbed3a..4ba1e0650434 100644
--- a/drivers/phy/mediatek/Makefile
+++ b/drivers/phy/mediatek/Makefile
@@ -3,6 +3,7 @@
 # Makefile for the phy drivers.
 #
 
+obj-$(CONFIG_PHY_MTK_DP)		+= phy-mtk-dp.o
 obj-$(CONFIG_PHY_MTK_TPHY)		+= phy-mtk-tphy.o
 obj-$(CONFIG_PHY_MTK_UFS)		+= phy-mtk-ufs.o
 obj-$(CONFIG_PHY_MTK_XSPHY)		+= phy-mtk-xsphy.o
diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
new file mode 100644
index 000000000000..c4d5ca1719a4
--- /dev/null
+++ b/drivers/phy/mediatek/phy-mtk-dp.c
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MediaTek DisplayPort PHY driver
+ *
+ * Copyright (c) 2022 BayLibre
+ * Copyright (c) 2022 MediaTek
+ */
+
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define PHY_OFFSET			0x1000
+
+#define MTK_DP_PHY_DIG_PLL_CTL_1	(PHY_OFFSET + 0x14)
+#define TPLL_SSC_EN			BIT(3)
+
+#define MTK_DP_PHY_DIG_BIT_RATE		(PHY_OFFSET + 0x3C)
+#define BIT_RATE_RBR			0
+#define BIT_RATE_HBR			1
+#define BIT_RATE_HBR2			2
+#define BIT_RATE_HBR3			3
+
+#define MTK_DP_PHY_DIG_SW_RST		(PHY_OFFSET + 0x38)
+#define DP_GLB_SW_RST_PHYD		BIT(0)
+
+#define MTK_DP_LANE0_DRIVING_PARAM_3		(PHY_OFFSET + 0x138)
+#define MTK_DP_LANE1_DRIVING_PARAM_3		(PHY_OFFSET + 0x238)
+#define MTK_DP_LANE2_DRIVING_PARAM_3		(PHY_OFFSET + 0x338)
+#define MTK_DP_LANE3_DRIVING_PARAM_3		(PHY_OFFSET + 0x438)
+#define XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT	BIT(4)
+#define XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT	(BIT(10) | BIT(12))
+#define XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT	GENMASK(20, 19)
+#define XTP_LN_TX_LCTXC0_SW0_PRE3_DEFAULT	GENMASK(29, 29)
+#define DRIVING_PARAM_3_DEFAULT	(XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT | \
+				 XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT | \
+				 XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT | \
+				 XTP_LN_TX_LCTXC0_SW0_PRE3_DEFAULT)
+
+#define XTP_LN_TX_LCTXC0_SW1_PRE0_DEFAULT	GENMASK(4, 3)
+#define XTP_LN_TX_LCTXC0_SW1_PRE1_DEFAULT	GENMASK(12, 9)
+#define XTP_LN_TX_LCTXC0_SW1_PRE2_DEFAULT	(BIT(18) | BIT(21))
+#define XTP_LN_TX_LCTXC0_SW2_PRE0_DEFAULT	GENMASK(29, 29)
+#define DRIVING_PARAM_4_DEFAULT	(XTP_LN_TX_LCTXC0_SW1_PRE0_DEFAULT | \
+				 XTP_LN_TX_LCTXC0_SW1_PRE1_DEFAULT | \
+				 XTP_LN_TX_LCTXC0_SW1_PRE2_DEFAULT | \
+				 XTP_LN_TX_LCTXC0_SW2_PRE0_DEFAULT)
+
+#define XTP_LN_TX_LCTXC0_SW2_PRE1_DEFAULT	(BIT(3) | BIT(5))
+#define XTP_LN_TX_LCTXC0_SW3_PRE0_DEFAULT	GENMASK(13, 12)
+#define DRIVING_PARAM_5_DEFAULT	(XTP_LN_TX_LCTXC0_SW2_PRE1_DEFAULT | \
+				 XTP_LN_TX_LCTXC0_SW3_PRE0_DEFAULT)
+
+#define XTP_LN_TX_LCTXCP1_SW0_PRE0_DEFAULT	0
+#define XTP_LN_TX_LCTXCP1_SW0_PRE1_DEFAULT	GENMASK(10, 10)
+#define XTP_LN_TX_LCTXCP1_SW0_PRE2_DEFAULT	GENMASK(19, 19)
+#define XTP_LN_TX_LCTXCP1_SW0_PRE3_DEFAULT	GENMASK(28, 28)
+#define DRIVING_PARAM_6_DEFAULT	(XTP_LN_TX_LCTXCP1_SW0_PRE0_DEFAULT | \
+				 XTP_LN_TX_LCTXCP1_SW0_PRE1_DEFAULT | \
+				 XTP_LN_TX_LCTXCP1_SW0_PRE2_DEFAULT | \
+				 XTP_LN_TX_LCTXCP1_SW0_PRE3_DEFAULT)
+
+#define XTP_LN_TX_LCTXCP1_SW1_PRE0_DEFAULT	0
+#define XTP_LN_TX_LCTXCP1_SW1_PRE1_DEFAULT	GENMASK(10, 9)
+#define XTP_LN_TX_LCTXCP1_SW1_PRE2_DEFAULT	GENMASK(19, 18)
+#define XTP_LN_TX_LCTXCP1_SW2_PRE0_DEFAULT	0
+#define DRIVING_PARAM_7_DEFAULT	(XTP_LN_TX_LCTXCP1_SW1_PRE0_DEFAULT | \
+				 XTP_LN_TX_LCTXCP1_SW1_PRE1_DEFAULT | \
+				 XTP_LN_TX_LCTXCP1_SW1_PRE2_DEFAULT | \
+				 XTP_LN_TX_LCTXCP1_SW2_PRE0_DEFAULT)
+
+#define XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT	GENMASK(3, 3)
+#define XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT	0
+#define DRIVING_PARAM_8_DEFAULT	(XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT | \
+				 XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT)
+
+struct mtk_dp_phy {
+	struct regmap *regs;
+};
+
+static int mtk_dp_phy_init(struct phy *phy)
+{
+	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
+	u32 driving_params[] = {
+		DRIVING_PARAM_3_DEFAULT,
+		DRIVING_PARAM_4_DEFAULT,
+		DRIVING_PARAM_5_DEFAULT,
+		DRIVING_PARAM_6_DEFAULT,
+		DRIVING_PARAM_7_DEFAULT,
+		DRIVING_PARAM_8_DEFAULT
+	};
+
+	regmap_bulk_write(dp_phy->regs, MTK_DP_LANE0_DRIVING_PARAM_3,
+			  driving_params, ARRAY_SIZE(driving_params));
+	regmap_bulk_write(dp_phy->regs, MTK_DP_LANE1_DRIVING_PARAM_3,
+			  driving_params, ARRAY_SIZE(driving_params));
+	regmap_bulk_write(dp_phy->regs, MTK_DP_LANE2_DRIVING_PARAM_3,
+			  driving_params, ARRAY_SIZE(driving_params));
+	regmap_bulk_write(dp_phy->regs, MTK_DP_LANE3_DRIVING_PARAM_3,
+			  driving_params, ARRAY_SIZE(driving_params));
+
+	return 0;
+}
+
+static int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
+	u32 val;
+
+	if (opts->dp.set_rate) {
+		switch (opts->dp.link_rate) {
+		default:
+			dev_err(&phy->dev,
+				"Implementation error, unknown linkrate %x\n",
+				opts->dp.link_rate);
+			return -EINVAL;
+		case 1620:
+			val = BIT_RATE_RBR;
+			break;
+		case 2700:
+			val = BIT_RATE_HBR;
+			break;
+		case 5400:
+			val = BIT_RATE_HBR2;
+			break;
+		case 8100:
+			val = BIT_RATE_HBR3;
+			break;
+		}
+		regmap_write(dp_phy->regs, MTK_DP_PHY_DIG_BIT_RATE, val);
+	}
+
+	regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_PLL_CTL_1,
+			   TPLL_SSC_EN, opts->dp.ssc ? TPLL_SSC_EN : 0);
+
+	return 0;
+}
+
+static int mtk_dp_phy_reset(struct phy *phy)
+{
+	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
+
+	regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_SW_RST,
+			   DP_GLB_SW_RST_PHYD, 0);
+	usleep_range(50, 200);
+	regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_SW_RST,
+			   DP_GLB_SW_RST_PHYD, 1);
+
+	return 0;
+}
+
+static const struct phy_ops mtk_dp_phy_dev_ops = {
+	.init = mtk_dp_phy_init,
+	.configure = mtk_dp_phy_configure,
+	.reset = mtk_dp_phy_reset,
+	.owner = THIS_MODULE,
+};
+
+static int mtk_dp_phy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_dp_phy *dp_phy;
+	struct phy *phy;
+	struct regmap *regs;
+
+	regs = *(struct regmap **)dev->platform_data;
+	if (!regs)
+		return dev_err_probe(dev, EINVAL,
+				     "No data passed, requires struct regmap**\n");
+
+	dp_phy = devm_kzalloc(dev, sizeof(*dp_phy), GFP_KERNEL);
+	if (!dp_phy)
+		return -ENOMEM;
+
+	dp_phy->regs = regs;
+	phy = devm_phy_create(dev, NULL, &mtk_dp_phy_dev_ops);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy),
+				     "Failed to create DP PHY\n");
+
+	phy_set_drvdata(phy, dp_phy);
+	if (!dev->of_node)
+		phy_create_lookup(phy, "dp", dev_name(dev));
+
+	return 0;
+}
+
+struct platform_driver mtk_dp_phy_driver = {
+	.probe = mtk_dp_phy_probe,
+	.driver = {
+		.name = "mediatek-dp-phy",
+	},
+};
+module_platform_driver(mtk_dp_phy_driver);
+
+MODULE_AUTHOR("Markus Schneider-Pargmann <msp@baylibre.com>");
+MODULE_DESCRIPTION("MediaTek DP PHY Driver");
+MODULE_LICENSE("GPL");
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
