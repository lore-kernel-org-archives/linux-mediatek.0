Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B07EC369BD
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Apr 2025 10:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WwQBx5fEB+uvLYfypIdunG+zLMu/9QNNGo72DjZopiw=; b=GM1bx+703EeZhI
	JtpOnSGAt7LPJy+2CqNaERzN+Z7zj4COk8/GsgeLCe0FEe1ArZfz+ym9/lD3fgYFX41gymOi2LrVA
	8zgGxt77yot3B/mdgKrOJsqMCyCa6Wo02biXT9KO+0qMf578SUimfj+5nvHpaE1QyKpiSHq4I3QeQ
	7xTYc/GlSFbxVDsdQNqY4W3NSo+B5h8ClWdMj1vO2V9ELmd4RH+Jo0gIDyI1cHXaQyPa/stblJyk6
	HzQu9oIKLaEqiSEZbGvA9j55SYOktnjPOHN4G8xAV+7a/eAGHRSm5qU4lyEbQ1q5L0cwQ5KiQu+S5
	0N2tH295ppmREtbNONqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5051-00000009CQL-0IBl;
	Wed, 16 Apr 2025 10:33:19 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4zTN-0000000936u-3mDB;
	Wed, 16 Apr 2025 09:54:27 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout4.routing.net (Postfix) with ESMTP id 52A8810120A;
	Wed, 16 Apr 2025 09:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1744797262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WwQBx5fEB+uvLYfypIdunG+zLMu/9QNNGo72DjZopiw=;
	b=LO3/i1GiLZ/5iIBRfVfr5RyXRrZ/Vg41LIGx+uVsOa72fDur3fwrbHHuZGC8fzKdTiLnkk
	ZOas2dJNW5dZavmvotOWGPMtK5ZcLwgeYjs9nxLVRk839T1vi3teujDfwce8+aj7KZ/rL1
	JbJbtUYEsn2/Y5re/PZOdVhrfPjQGek=
Received: from frank-u24.. (fttx-pool-80.245.72.47.bambit.de [80.245.72.47])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 68167360C65;
	Wed, 16 Apr 2025 09:54:21 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 6/8] phy: mediatek: xsphy: support type switch by pericfg
Date: Wed, 16 Apr 2025 11:53:58 +0200
Message-ID: <20250416095402.90543-7-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416095402.90543-1-linux@fw-web.de>
References: <20250416095402.90543-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: d04aa45f-1d93-4d11-ada7-f6a9fc71389d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_025426_217729_F9C86776 
X-CRM114-Status: GOOD (  18.07  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Daniel Golle <daniel@makrotopia.org>

Patch from Sam Shih <sam.shih@mediatek.com> found in MediaTek SDK
released under GPL.

Get syscon and use it to set the PHY type.
Extend support to PCIe and SGMII mode in addition to USB2 and USB3.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/phy/mediatek/phy-mtk-xsphy.c | 85 +++++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/mediatek/phy-mtk-xsphy.c b/drivers/phy/mediatek/phy-mtk-xsphy.c
index 7c248f5cfca5..c0ddb9273cc3 100644
--- a/drivers/phy/mediatek/phy-mtk-xsphy.c
+++ b/drivers/phy/mediatek/phy-mtk-xsphy.c
@@ -11,10 +11,12 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/iopoll.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 
 #include "phy-mtk-io.h"
 
@@ -81,12 +83,22 @@
 #define XSP_SR_COEF_DIVISOR	1000
 #define XSP_FM_DET_CYCLE_CNT	1024
 
+/* PHY switch between pcie/usb3/sgmii */
+#define USB_PHY_SWITCH_CTRL	0x0
+#define RG_PHY_SW_TYPE		GENMASK(3, 0)
+#define RG_PHY_SW_PCIE		0x0
+#define RG_PHY_SW_USB3		0x1
+#define RG_PHY_SW_SGMII		0x2
+
 struct xsphy_instance {
 	struct phy *phy;
 	void __iomem *port_base;
 	struct clk *ref_clk;	/* reference clock of anolog phy */
 	u32 index;
 	u32 type;
+	struct regmap *type_sw;
+	u32 type_sw_reg;
+	u32 type_sw_index;
 	/* only for HQA test */
 	int efuse_intr;
 	int efuse_tx_imp;
@@ -259,6 +271,10 @@ static void phy_parse_property(struct mtk_xsphy *xsphy,
 			inst->efuse_intr, inst->efuse_tx_imp,
 			inst->efuse_rx_imp);
 		break;
+	case PHY_TYPE_PCIE:
+	case PHY_TYPE_SGMII:
+		/* nothing to do */
+		break;
 	default:
 		dev_err(xsphy->dev, "incompatible phy type\n");
 		return;
@@ -305,6 +321,62 @@ static void u3_phy_props_set(struct mtk_xsphy *xsphy,
 				     RG_XTP_LN0_RX_IMPSEL, inst->efuse_rx_imp);
 }
 
+/* type switch for usb3/pcie/sgmii */
+static int phy_type_syscon_get(struct xsphy_instance *instance,
+			       struct device_node *dn)
+{
+	struct of_phandle_args args;
+	int ret;
+
+	/* type switch function is optional */
+	if (!of_property_present(dn, "mediatek,syscon-type"))
+		return 0;
+
+	ret = of_parse_phandle_with_fixed_args(dn, "mediatek,syscon-type",
+					       2, 0, &args);
+	if (ret)
+		return ret;
+
+	instance->type_sw_reg = args.args[0];
+	instance->type_sw_index = args.args[1] & 0x3; /* <=3 */
+	instance->type_sw = syscon_node_to_regmap(args.np);
+	of_node_put(args.np);
+	dev_info(&instance->phy->dev, "type_sw - reg %#x, index %d\n",
+		 instance->type_sw_reg, instance->type_sw_index);
+
+	return PTR_ERR_OR_ZERO(instance->type_sw);
+}
+
+static int phy_type_set(struct xsphy_instance *instance)
+{
+	int type;
+	u32 offset;
+
+	if (!instance->type_sw)
+		return 0;
+
+	switch (instance->type) {
+	case PHY_TYPE_USB3:
+		type = RG_PHY_SW_USB3;
+		break;
+	case PHY_TYPE_PCIE:
+		type = RG_PHY_SW_PCIE;
+		break;
+	case PHY_TYPE_SGMII:
+		type = RG_PHY_SW_SGMII;
+		break;
+	case PHY_TYPE_USB2:
+	default:
+		return 0;
+	}
+
+	offset = instance->type_sw_index * BITS_PER_BYTE;
+	regmap_update_bits(instance->type_sw, instance->type_sw_reg,
+			   RG_PHY_SW_TYPE << offset, type << offset);
+
+	return 0;
+}
+
 static int mtk_phy_init(struct phy *phy)
 {
 	struct xsphy_instance *inst = phy_get_drvdata(phy);
@@ -325,6 +397,10 @@ static int mtk_phy_init(struct phy *phy)
 	case PHY_TYPE_USB3:
 		u3_phy_props_set(xsphy, inst);
 		break;
+	case PHY_TYPE_PCIE:
+	case PHY_TYPE_SGMII:
+		/* nothing to do, only used to set type */
+		break;
 	default:
 		dev_err(xsphy->dev, "incompatible phy type\n");
 		clk_disable_unprepare(inst->ref_clk);
@@ -403,12 +479,15 @@ static struct phy *mtk_phy_xlate(struct device *dev,
 
 	inst->type = args->args[0];
 	if (!(inst->type == PHY_TYPE_USB2 ||
-	      inst->type == PHY_TYPE_USB3)) {
+	      inst->type == PHY_TYPE_USB3 ||
+	      inst->type == PHY_TYPE_PCIE ||
+	      inst->type == PHY_TYPE_SGMII)) {
 		dev_err(dev, "unsupported phy type: %d\n", inst->type);
 		return ERR_PTR(-EINVAL);
 	}
 
 	phy_parse_property(xsphy, inst);
+	phy_type_set(inst);
 
 	return inst->phy;
 }
@@ -510,6 +589,10 @@ static int mtk_xsphy_probe(struct platform_device *pdev)
 			dev_err(dev, "failed to get ref_clk(id-%d)\n", port);
 			return PTR_ERR(inst->ref_clk);
 		}
+
+		retval = phy_type_syscon_get(inst, child_np);
+		if (retval)
+			return retval;
 	}
 
 	provider = devm_of_phy_provider_register(dev, mtk_phy_xlate);
-- 
2.43.0


