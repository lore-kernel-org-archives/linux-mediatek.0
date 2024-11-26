Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624B1D5A6D1
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2024 03:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QuBPUTQJ8C/KdD4Nkz2ttqOpSmGo+BG1v2FUi6iesuw=; b=qS1gUwMF69cpq/NJ7soKDkI8a1
	CFmLDNPRsJrr1yo7lZpX04KwyuujwkhNtj4qui/eItouU8owTkMu0I1zYz3s4gBSUPEjeXeMkWzQW
	0jDtMUvRY+b6TFcwg0EhFd/ovrtW3PYvJapKFTZUhGncy2H0hUOGGV4tq8zq/QlUmhIZ0Akx9duKD
	lBzJyrP6y/CmAh+exTjWFC/kVdeTuf1JLKVCYifoUZOJgvkF4+tmxOw5att3NwmsSX/FP8f6WqUna
	5wrQoSFwqRjL/TnJXaofPBbzTi0ZG/FC5wRrjLTO35uV6nqO6BolcqZUG1ZtkK7GHfg5f4QnNs4Nx
	LDORX3dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFlo7-00000009WcJ-2A0s;
	Tue, 26 Nov 2024 03:00:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFlnA-00000009WMs-0Fci;
	Tue, 26 Nov 2024 02:59:09 +0000
X-UUID: 656d8c84aba211ef82ff63e91e7eb18c-20241125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QuBPUTQJ8C/KdD4Nkz2ttqOpSmGo+BG1v2FUi6iesuw=;
	b=BCSAL9YJrUJj1QeFYJDQQLHw14AoV6VQfVMREasZmexMksDDUTetanBm7fPxmZ0Z5iBheB9/IYILQ7ZkgCI2MWxliTvAsaNqJnKOZSpJqRP80+QVNzrdSXwtrAS+USuqWR+YqYqlexj+wYWRRkFPYUGHqq1EzMv3dNL55r2ifKg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:929f2fa1-d1e5-421c-986e-38dba381014f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:edef63b9-596a-4e31-81f2-cae532fa1b81,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
	:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 656d8c84aba211ef82ff63e91e7eb18c-20241125
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 318952299; Mon, 25 Nov 2024 19:59:04 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 26 Nov 2024 10:59:01 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 26 Nov 2024 10:59:01 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] phy: mediatek: xsphy: add support to set disconnect threshold
Date: Tue, 26 Nov 2024 10:58:59 +0800
Message-ID: <20241126025859.29923-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241126025859.29923-1-chunfeng.yun@mediatek.com>
References: <20241126025859.29923-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_185908_100591_F90D1DCF 
X-CRM114-Status: GOOD (  10.99  )
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

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/mediatek/phy-mtk-xsphy.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-xsphy.c b/drivers/phy/mediatek/phy-mtk-xsphy.c
index 7c248f5cfca5..718ed8f17c2d 100644
--- a/drivers/phy/mediatek/phy-mtk-xsphy.c
+++ b/drivers/phy/mediatek/phy-mtk-xsphy.c
@@ -59,6 +59,7 @@
 #define XSP_USBPHYACR6		((SSUSB_SIFSLV_U2PHY_COM) + 0x018)
 #define P2A6_RG_BC11_SW_EN	BIT(23)
 #define P2A6_RG_OTG_VBUSCMP_EN	BIT(20)
+#define PA6_RG_U2_DISCTH	GENMASK(7, 4)
 
 #define XSP_U2PHYDTM1		((SSUSB_SIFSLV_U2PHY_COM) + 0x06C)
 #define P2D_FORCE_IDDIG		BIT(9)
@@ -95,6 +96,7 @@ struct xsphy_instance {
 	int eye_src;
 	int eye_vrt;
 	int eye_term;
+	int discth;
 };
 
 struct mtk_xsphy {
@@ -244,9 +246,12 @@ static void phy_parse_property(struct mtk_xsphy *xsphy,
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
@@ -285,6 +290,9 @@ static void u2_phy_props_set(struct mtk_xsphy *xsphy,
 	if (inst->eye_term)
 		mtk_phy_update_field(pbase + XSP_USBPHYACR1, P2A1_RG_TERM_SEL,
 				     inst->eye_term);
+	if (inst->discth)
+		mtk_phy_update_field(pbase + XSP_USBPHYACR6, PA6_RG_U2_DISCTH,
+				     inst->discth);
 }
 
 static void u3_phy_props_set(struct mtk_xsphy *xsphy,
-- 
2.46.0


