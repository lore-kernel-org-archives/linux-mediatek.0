Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99B3ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 06:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jSwt/ki3JQREepib86T8riyIEToF+UUI+rq4B/t53Os=; b=ByDi6TaUJEntoJcfxKeNU4ydxH
	Dz5pNr5oOL7j/ysF/G/fb8rdhQ+do0HSrjywY6eLlSIAJqKPl8vfDchKe8nzwFgj39g73DR7hzP3v
	mdIm7tjgE2MzgBB9UIdmHHxUCzK4UDP02qtGkVxy7kWwBqaNsyn6n4FEy1ULQguIW//9dGetPiH/f
	TNuLHbE3dSw1BnUh6lgCPsdoPwbyN2HjbFuT1OauJHerpLATo+6iNMsJGvxtFot4wvJHJYqz6iRDn
	MmDv3Ncv/fJBZs2vGIuhynmYLk+67xTw3+ObZaggGe5wuT7B1FGpkqRE0bVzsHO28R1zijv/wNLyn
	UouF4ELA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYLtt-008bIs-AO; Wed, 14 Sep 2022 06:29:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYLtr-008bE1-3l; Wed, 14 Sep 2022 06:29:32 +0000
X-UUID: 24a8b4399fe044b5a5cc5d1da5bd7ce9-20220913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=jSwt/ki3JQREepib86T8riyIEToF+UUI+rq4B/t53Os=;
	b=CxULDdXgGyR8El/FS6SKlcSJ7tTUp1JznFUelYHmBc1mVANiW0jo6GxXMREu9yGD0MxzommpVf/YQhqN/XXSUVlwiFk9MJDHfQG6+c0s7YmMSBvQB3nbKKFzEmcK5ou+05ELzB6mkwQiBb+1ItvQSK7Wd1CEXeGtyJyw26OwuGs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:2c15992d-1c9f-4a5c-8b9a-3baca9fc273d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:2867975d-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 24a8b4399fe044b5a5cc5d1da5bd7ce9-20220913
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 66790074; Tue, 13 Sep 2022 23:29:25 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 14 Sep 2022 14:07:53 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 14 Sep 2022 14:07:52 +0800
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
Subject: [PATCH v3 6/7] phy: phy-mtk-tphy: set utmi 0 register in init() ops
Date: Wed, 14 Sep 2022 14:07:45 +0800
Message-ID: <20220914060746.10004-6-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220914060746.10004-1-chunfeng.yun@mediatek.com>
References: <20220914060746.10004-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_232931_185327_AAFE9FD7 
X-CRM114-Status: GOOD (  10.70  )
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

No need repeat to clear utmi 0 register in ->power_on() and
->power_off(), just do it in ->init()

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~v3: no changes
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index 79920c066e59..e0f227a0d3cc 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -522,8 +522,8 @@ static void u2_phy_instance_init(struct mtk_tphy *tphy,
 	/* switch to USB function, and enable usb pll */
 	mtk_phy_clear_bits(com + U3P_U2PHYDTM0, P2C_FORCE_UART_EN | P2C_FORCE_SUSPENDM);
 
-	mtk_phy_update_bits(com + U3P_U2PHYDTM0, P2C_RG_XCVRSEL | P2C_RG_DATAIN,
-			    P2C_RG_XCVRSEL_VAL(1) | P2C_RG_DATAIN_VAL(0));
+	mtk_phy_clear_bits(com + U3P_U2PHYDTM0,
+			   P2C_RG_XCVRSEL | P2C_RG_DATAIN | P2C_DTM0_PART_MASK);
 
 	mtk_phy_clear_bits(com + U3P_U2PHYDTM1, P2C_RG_UART_EN);
 
@@ -565,9 +565,6 @@ static void u2_phy_instance_power_on(struct mtk_tphy *tphy,
 	void __iomem *com = u2_banks->com;
 	u32 index = instance->index;
 
-	mtk_phy_clear_bits(com + U3P_U2PHYDTM0,
-			   P2C_RG_XCVRSEL | P2C_RG_DATAIN | P2C_DTM0_PART_MASK);
-
 	/* OTG Enable */
 	mtk_phy_set_bits(com + U3P_USBPHYACR6, PA6_RG_U2_OTG_VBUSCMP_EN);
 
@@ -590,8 +587,6 @@ static void u2_phy_instance_power_off(struct mtk_tphy *tphy,
 	void __iomem *com = u2_banks->com;
 	u32 index = instance->index;
 
-	mtk_phy_clear_bits(com + U3P_U2PHYDTM0, P2C_RG_XCVRSEL | P2C_RG_DATAIN);
-
 	/* OTG Disable */
 	mtk_phy_clear_bits(com + U3P_USBPHYACR6, PA6_RG_U2_OTG_VBUSCMP_EN);
 
-- 
2.18.0


