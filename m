Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D82ECAAD4
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 08:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xVxvSjmhQezfhC0S2j5lAGlt+gBCzkVCvfJs45f+cwg=; b=HLQl+QnLdXKgaHwnBZKwsv7n5I
	E6M7xFNrDDNKpy7tkdoKym0uVH4sqN1u7z1TLbXGe74A9fVjijSK0Vb260DBjVJhzqztTjQCc4u2J
	RSsa3XPFuX/Qh/fWhlH4jSblO2HbX4VC7am4Zjo73h0sXSOL1bjGabtbexsFHT/mxiLQxZTy7RDxg
	p/GGLcpJV5SMLlFb2jCQEYj/H8pTUQl1KcWvGoe4hTdcyfSNifCOxyFZoebPb2NGg4u702+q8z4dc
	SA/I+LC7j+/N2P+e9gtpvSAu33gItw3vSOwtIFwzpHJRhAOifNPzt8ocTai9ARiOsYlBF8ScGMsQC
	iuLtNDcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSZzl-0066ic-IM; Mon, 29 Aug 2022 08:19:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSZze-0066cz-NO; Mon, 29 Aug 2022 08:19:40 +0000
X-UUID: c2919ad9eb594c6fb41fe4021bde709b-20220829
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xVxvSjmhQezfhC0S2j5lAGlt+gBCzkVCvfJs45f+cwg=;
	b=S+kEJSXAASWNg+vrWAkzednvc4sIJH5aoQcBbT6qxiIL56x4rKCOnPVzjG7Ogkdza06gXMGs9Wt008dt+PxBmvdYO/QG0PcF3SWQ8rQu0zCVf+vv4HTHDN7vuIxSVNxbQzzSI//DpOhId7xZ/2360UOWjioA0oX1IKfDbdQYl38=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:89572f1c-ac51-489b-bbf9-16880ee25abc,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:2bbee9cf-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c2919ad9eb594c6fb41fe4021bde709b-20220829
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 818374050; Mon, 29 Aug 2022 01:19:36 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 29 Aug 2022 16:08:34 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Aug 2022 16:08:33 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
	<kishon@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@canonical.com>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH v2 4/7] phy: phy-mtk-tphy: disable hardware efuse when set INTR
Date: Mon, 29 Aug 2022 16:08:27 +0800
Message-ID: <20220829080830.5378-4-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829080830.5378-1-chunfeng.yun@mediatek.com>
References: <20220829080830.5378-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_011938_785503_C1525C16 
X-CRM114-Status: GOOD (  10.39  )
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

INTR's value is able autoload from hardware efuse by default, when
software tries to update its value, should disable hardware efuse
firstly.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index 986fde0f63a0..7f40b8b052bd 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -874,9 +874,14 @@ static void u2_phy_props_set(struct mtk_tphy *tphy,
 		mtk_phy_update_bits(com + U3P_USBPHYACR1, PA1_RG_TERM_SEL,
 				    PA1_RG_TERM_SEL_VAL(instance->eye_term));
 
-	if (instance->intr)
+	if (instance->intr) {
+		if (u2_banks->misc)
+			mtk_phy_set_bits(u2_banks->misc + U3P_MISC_REG1,
+					 MR1_EFUSE_AUTO_LOAD_DIS);
+
 		mtk_phy_update_bits(com + U3P_USBPHYACR1, PA1_RG_INTR_CAL,
 				    PA1_RG_INTR_CAL_VAL(instance->intr));
+	}
 
 	if (instance->discth)
 		mtk_phy_update_bits(com + U3P_USBPHYACR6, PA6_RG_U2_DISCTH,
-- 
2.18.0


