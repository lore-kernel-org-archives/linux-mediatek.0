Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAB1F34C4B
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Apr 2026 12:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GvOqx4sdw0sMbNpfkb1Q+9eP9nnVJjINUA+bUhziztM=; b=BIMTb/Irwjiqv13UocYnWWddEq
	0lqmWhmhwRcAvWfLcROgomSzNQAA4byLgiFR/miW1F2tRG2VPf2K+9v2tsW9TX7JnvW1pKWONhxtZ
	5Shl1nZqwe4WB+3BAQXmiBlHc0rAsmVxEfSKmqezsnaZQoZ97bnR3J5OZ068eAteERSnAtTfQyy7P
	bRAUfJs3u7WHXCTpn+t0aUoLw37lj6OuqnGqr7fdM14zOIVvIypvlaNPCDSRJ1/9/sUzkpg1LGD2o
	VTvg6xp1gMLUpm6TCldR9PDb0ym1nV13Gg5niZrU/KjePkq/ub+kuuUm16IHRG13A14/nxiX36133
	22xhxYYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGPI-0000000FdrH-0v0A;
	Mon, 13 Apr 2026 12:28:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGPF-0000000Fdpx-2olE;
	Mon, 13 Apr 2026 12:28:46 +0000
X-UUID: 4ef0ad14373411f19e7563141e833ce8-20260413
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GvOqx4sdw0sMbNpfkb1Q+9eP9nnVJjINUA+bUhziztM=;
	b=fCizvNALAnca8hJibh6f8IH6oyu5ggxTWPqs5hHDVgjAE99Vj0UT+IkKt4DyxK2VTd/L9fV59zWBqN1gYSVbETqzEzrTHB+dLy+t823tx/FyCcsngs3uqq5YWoTtXFAPoqd22h2KEqRsVtPN/Nj5+K0fW9+TDF2img1zIhBsiMg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:9563ec93-7254-4cf9-a204-dbf1288079bb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:15eb5d8f-6df4-4a3d-a7a4-fbdc42d669ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4ef0ad14373411f19e7563141e833ce8-20260413
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 616013022; Mon, 13 Apr 2026 05:28:42 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 13 Apr 2026 20:28:40 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 13 Apr 2026 20:28:39 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 RESEND 2/2] phy: mediatek: xsphy: add support to set disconnect threshold
Date: Mon, 13 Apr 2026 20:28:36 +0800
Message-ID: <20260413122836.4848-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260413122836.4848-1-chunfeng.yun@mediatek.com>
References: <20260413122836.4848-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_052845_718726_5F192558 
X-CRM114-Status: GOOD (  10.54  )
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

Add a property to tune usb2 phy's disconnect threshold.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: change property name
---
 drivers/phy/mediatek/phy-mtk-xsphy.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-xsphy.c b/drivers/phy/mediatek/phy-mtk-xsphy.c
index c0ddb9273cc3..46345e4f4189 100644
--- a/drivers/phy/mediatek/phy-mtk-xsphy.c
+++ b/drivers/phy/mediatek/phy-mtk-xsphy.c
@@ -61,6 +61,7 @@
 #define XSP_USBPHYACR6		((SSUSB_SIFSLV_U2PHY_COM) + 0x018)
 #define P2A6_RG_BC11_SW_EN	BIT(23)
 #define P2A6_RG_OTG_VBUSCMP_EN	BIT(20)
+#define PA6_RG_U2_DISCTH	GENMASK(7, 4)
 
 #define XSP_U2PHYDTM1		((SSUSB_SIFSLV_U2PHY_COM) + 0x06C)
 #define P2D_FORCE_IDDIG		BIT(9)
@@ -107,6 +108,7 @@ struct xsphy_instance {
 	int eye_src;
 	int eye_vrt;
 	int eye_term;
+	int discth;
 };
 
 struct mtk_xsphy {
@@ -256,9 +258,12 @@ static void phy_parse_property(struct mtk_xsphy *xsphy,
 					 &inst->eye_vrt);
 		device_property_read_u32(dev, "mediatek,eye-term",
 					 &inst->eye_term);
-		dev_dbg(dev, "intr:%d, src:%d, vrt:%d, term:%d\n",
+		device_property_read_u32(dev, "mediatek,discth",
+					 &inst->discth);
+		dev_dbg(dev, "intr:%d, src:%d, vrt:%d, term:%d, discth:%d\n",
 			inst->efuse_intr, inst->eye_src,
-			inst->eye_vrt, inst->eye_term);
+			inst->eye_vrt, inst->eye_term,
+			inst->discth);
 		break;
 	case PHY_TYPE_USB3:
 		device_property_read_u32(dev, "mediatek,efuse-intr",
@@ -301,6 +306,9 @@ static void u2_phy_props_set(struct mtk_xsphy *xsphy,
 	if (inst->eye_term)
 		mtk_phy_update_field(pbase + XSP_USBPHYACR1, P2A1_RG_TERM_SEL,
 				     inst->eye_term);
+	if (inst->discth)
+		mtk_phy_update_field(pbase + XSP_USBPHYACR6, PA6_RG_U2_DISCTH,
+				     inst->discth);
 }
 
 static void u3_phy_props_set(struct mtk_xsphy *xsphy,
-- 
2.45.2


