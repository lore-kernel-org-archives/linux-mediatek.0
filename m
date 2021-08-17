Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27202C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 09:21:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E20DC600CC
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 09:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E20DC600CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q1DYsSgiYuZclxvWMUFskuu9kd5DD3ELh3WN5cV+31c=; b=vZDuPOFfJqaboP
	Gh5LMxcwgezN96gz1PAyBcCoh8/TN5mpB0BTS9ikk4Kll+zTDfKOiZ2zCMxntPygLI6ezoDwq6y8B
	a+tuB2MM9IP4Kik8uUZlr9NBT6QuZojG3i5yYKItSB1NbfRj2mkGVZcSD9AwCPh3M5lzpLkrF/2o3
	sCVWQRyYDiASRqf+IU6AWjztYPOobrs/mzLmrc0zuCfkcdA4e0mjgbFi+5UVG6Ph/Am66QDOdeUOw
	CdUt9+igB1sFT+wsinCTHhEwvJjcdRTINlU52x1NHhq1GTzaTLMeTWNQXgWk3X0f6EEhoeS/h4nY7
	8g1bCvnvZfQ/vKdEMpDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFvHM-001lzz-6R; Tue, 17 Aug 2021 09:21:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFvGa-001lbU-Hf; Tue, 17 Aug 2021 09:20:20 +0000
X-UUID: ba932aa022db497b91469e05d2cd65d1-20210817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=XAwOS9SCC26VzEk++HTMZzBQiMrERt3/X/GuZOlbdOg=; 
 b=t0cw6H/9h72st7VrTBUhDw+42z6PeoHDJ8VskmX+5/Sd1aqcmo6YU3JyLTcIsPKwgG5v8oAouTNgke6z+qpmi/csDJ6IGoH8o90MTMxhW5hC2UILseqP3TO5HezTx5JRAPcRs2buAdOyndye/QdzXchJGd+KLheTMsG4feq8qbE=;
X-UUID: ba932aa022db497b91469e05d2cd65d1-20210817
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 739672566; Tue, 17 Aug 2021 02:20:12 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 02:20:10 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 17:20:09 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 17 Aug 2021 17:20:08 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Stanley Chu <stanley.chu@mediatek.com>
Subject: [PATCH v3 3/9] phy: phy-mtk-tphy: support type switch by pericfg
Date: Tue, 17 Aug 2021 17:19:41 +0800
Message-ID: <1629191987-20774-3-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1629191987-20774-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1629191987-20774-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_022016_652511_8579CA3F 
X-CRM114-Status: GOOD (  19.46  )
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

Add support type switch between USB3, PCIe, SATA and SGMII by
pericfg register, this is used to take the place of efuse or
jumper.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~3: no changes
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 84 ++++++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index 3259210f08a1..a6502058a1a5 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -10,11 +10,13 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 
 /* version V1 sub-banks offset base address */
 /* banks shared by multiple phys */
@@ -280,6 +282,14 @@
 #define RG_CDR_BIRLTD0_GEN3_MSK		GENMASK(4, 0)
 #define RG_CDR_BIRLTD0_GEN3_VAL(x)	(0x1f & (x))
 
+/* PHY switch between pcie/usb3/sgmii/sata */
+#define USB_PHY_SWITCH_CTRL	0x0
+#define RG_PHY_SW_TYPE		GENMASK(3, 0)
+#define RG_PHY_SW_PCIE		0x0
+#define RG_PHY_SW_USB3		0x1
+#define RG_PHY_SW_SGMII		0x2
+#define RG_PHY_SW_SATA		0x3
+
 #define TPHY_CLKS_CNT	2
 
 enum mtk_phy_version {
@@ -322,7 +332,10 @@ struct mtk_phy_instance {
 	};
 	struct clk_bulk_data clks[TPHY_CLKS_CNT];
 	u32 index;
-	u8 type;
+	u32 type;
+	struct regmap *type_sw;
+	u32 type_sw_reg;
+	u32 type_sw_index;
 	int eye_src;
 	int eye_vrt;
 	int eye_term;
@@ -969,6 +982,64 @@ static void u2_phy_props_set(struct mtk_tphy *tphy,
 	}
 }
 
+/* type switch for usb3/pcie/sgmii/sata */
+static int phy_type_syscon_get(struct mtk_phy_instance *instance,
+			       struct device_node *dn)
+{
+	struct of_phandle_args args;
+	int ret;
+
+	/* type switch function is optional */
+	if (!of_property_read_bool(dn, "mediatek,syscon-type"))
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
+static int phy_type_set(struct mtk_phy_instance *instance)
+{
+	int type;
+	u32 mask;
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
+	case PHY_TYPE_SATA:
+		type = RG_PHY_SW_SATA;
+		break;
+	case PHY_TYPE_USB2:
+	default:
+		return 0;
+	}
+
+	mask = RG_PHY_SW_TYPE << (instance->type_sw_index * BITS_PER_BYTE);
+	regmap_update_bits(instance->type_sw, instance->type_sw_reg, mask, type);
+
+	return 0;
+}
+
 static int mtk_phy_init(struct phy *phy)
 {
 	struct mtk_phy_instance *instance = phy_get_drvdata(phy);
@@ -993,6 +1064,9 @@ static int mtk_phy_init(struct phy *phy)
 	case PHY_TYPE_SATA:
 		sata_phy_instance_init(tphy, instance);
 		break;
+	case PHY_TYPE_SGMII:
+		/* nothing to do, only used to set type */
+		break;
 	default:
 		dev_err(tphy->dev, "incompatible PHY type\n");
 		clk_bulk_disable_unprepare(TPHY_CLKS_CNT, instance->clks);
@@ -1081,7 +1155,8 @@ static struct phy *mtk_phy_xlate(struct device *dev,
 	if (!(instance->type == PHY_TYPE_USB2 ||
 	      instance->type == PHY_TYPE_USB3 ||
 	      instance->type == PHY_TYPE_PCIE ||
-	      instance->type == PHY_TYPE_SATA)) {
+	      instance->type == PHY_TYPE_SATA ||
+	      instance->type == PHY_TYPE_SGMII)) {
 		dev_err(dev, "unsupported device type: %d\n", instance->type);
 		return ERR_PTR(-EINVAL);
 	}
@@ -1100,6 +1175,7 @@ static struct phy *mtk_phy_xlate(struct device *dev,
 	}
 
 	phy_parse_property(tphy, instance);
+	phy_type_set(instance);
 
 	return instance->phy;
 }
@@ -1244,6 +1320,10 @@ static int mtk_tphy_probe(struct platform_device *pdev)
 		retval = devm_clk_bulk_get_optional(&phy->dev, TPHY_CLKS_CNT, clks);
 		if (retval)
 			goto put_child;
+
+		retval = phy_type_syscon_get(instance, child_np);
+		if (retval)
+			goto put_child;
 	}
 
 	provider = devm_of_phy_provider_register(dev, mtk_phy_xlate);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
