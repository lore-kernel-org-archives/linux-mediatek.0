Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A344ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 06:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1OAmeDA6ar/po8UT6QCtGaslauKiW3mbQc6OuQ6RaAY=; b=tdSe5gAFMNPBck8+yaSqeKI+Fk
	pOiXZujYFHhp4zXT6tDVFfKgK4pGxrdxUKhSgkSuhLi6lu41N9bWz93o55eb/0Q1UjwlZ+e/pc5DP
	kG5lOXL0EPajD2hgO50/Zhd0AYTQnAp0qRIwEBYLJ03Y9EaWKOWcuX1xjnKrT8ru1gItKlx69gjwg
	Ryr3xFp1qLYq92Gm6vaUavgHCCTjsvxIrh1ZfQi2hdY0+Vg/KNqDciEtvB9S/bha211LgUGbqpRsb
	x7c+QkXQ3DIi+PAHPFMa7EM9la+J/R2fmDIf2fWYZCrrOelPcxX+OGUSDGL+jUsReZXj1V8nw2G5+
	wmdpqR0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYLjH-008PoQ-9S; Wed, 14 Sep 2022 06:18:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYLjE-008PmS-CR; Wed, 14 Sep 2022 06:18:33 +0000
X-UUID: 031713acdf1049179cbf646b2870e62a-20220913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1OAmeDA6ar/po8UT6QCtGaslauKiW3mbQc6OuQ6RaAY=;
	b=noAtErndxSVSIHaIg27pDYUFGGSWV5cOcToFuraIULssJZWSkyj3UzozT9kYuMmEVHQKWkz4UBrKBEQyfyEOVSZVdw4nLXV5uR0AQTfBajwGD3xezWtj48UpvL8r1mUpcUcAmpaOBn5NyCzk0uiOOoPG80QWLnxZnZopEb0lEEE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:d899ddf2-789d-48c8-b69b-75503ed0b725,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:67125fec-2856-4fce-b125-09d4c7ebe045,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 031713acdf1049179cbf646b2870e62a-20220913
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 773015791; Tue, 13 Sep 2022 23:18:28 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 14 Sep 2022 14:07:50 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 14 Sep 2022 14:07:49 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
	<kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Eddie Hung
	<eddie.hung@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 3/7] phy: phy-mtk-tphy: add property to set pre-emphasis
Date: Wed, 14 Sep 2022 14:07:42 +0800
Message-ID: <20220914060746.10004-3-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220914060746.10004-1-chunfeng.yun@mediatek.com>
References: <20220914060746.10004-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_231832_458597_6D700147 
X-CRM114-Status: GOOD (  11.74  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a property to set usb2 phy's pre-emphasis, it's disabled by default
on some SoCs.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~v3: no changes
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index 8ee7682b8e93..986fde0f63a0 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -72,6 +72,8 @@
 #define PA5_RG_U2_HS_100U_U3_EN	BIT(11)
 
 #define U3P_USBPHYACR6		0x018
+#define PA6_RG_U2_PRE_EMP		GENMASK(31, 30)
+#define PA6_RG_U2_PRE_EMP_VAL(x)	((0x3 & (x)) << 30)
 #define PA6_RG_U2_BC11_SW_EN		BIT(23)
 #define PA6_RG_U2_OTG_VBUSCMP_EN	BIT(20)
 #define PA6_RG_U2_DISCTH		GENMASK(7, 4)
@@ -370,6 +372,7 @@ struct mtk_phy_instance {
 	int eye_term;
 	int intr;
 	int discth;
+	int pre_emphasis;
 	bool bc12_en;
 };
 
@@ -841,10 +844,13 @@ static void phy_parse_property(struct mtk_tphy *tphy,
 				 &instance->intr);
 	device_property_read_u32(dev, "mediatek,discth",
 				 &instance->discth);
+	device_property_read_u32(dev, "mediatek,pre-emphasis",
+				 &instance->pre_emphasis);
 	dev_dbg(dev, "bc12:%d, src:%d, vrt:%d, term:%d, intr:%d, disc:%d\n",
 		instance->bc12_en, instance->eye_src,
 		instance->eye_vrt, instance->eye_term,
 		instance->intr, instance->discth);
+	dev_dbg(dev, "pre-emp:%d\n", instance->pre_emphasis);
 }
 
 static void u2_phy_props_set(struct mtk_tphy *tphy,
@@ -875,6 +881,10 @@ static void u2_phy_props_set(struct mtk_tphy *tphy,
 	if (instance->discth)
 		mtk_phy_update_bits(com + U3P_USBPHYACR6, PA6_RG_U2_DISCTH,
 				    PA6_RG_U2_DISCTH_VAL(instance->discth));
+
+	if (instance->pre_emphasis)
+		mtk_phy_update_bits(com + U3P_USBPHYACR6, PA6_RG_U2_PRE_EMP,
+				    PA6_RG_U2_PRE_EMP_VAL(instance->pre_emphasis));
 }
 
 /* type switch for usb3/pcie/sgmii/sata */
-- 
2.18.0


