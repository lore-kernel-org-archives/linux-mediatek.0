Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36DEECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 06:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6+oGyl9dP8hxzdhVR6EPUTnIGGLS5/EJMLDztRGSB5o=; b=FYE5XLam7gFAlrRo/yweDj9c+d
	jPLnHbxhyDCAvoxbvW6G+UGtmuO2cUATDQ+ruwk3iepaQDfgtSm9ibw0qlEvGvL2TGj9fpYvGIqxC
	S7MB5s14pWNGpbOaG2VziU/Co/rZSUqcvlk/wcV3jv4Kiw1Ydi3uaUhTbDdbk3C0/ZhOjPJbH9yon
	ZJKVLErBi7qCZfbJxC5wTmFxhaLvtxRyjMzl2mKKS8pqJTMlPafuQf6UkN+RHP00Q1FSoUAZb+h5d
	nLrCaRE4K8bA/ZcgZm/X0Ub2c7Crn/hIfJ/TISiT5VPuaq+gr9CNOK1B3WaWskQ/pagoadMaMJc2A
	SQFmNXEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYLah-008ESL-OD; Wed, 14 Sep 2022 06:09:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYLab-008EFK-T4; Wed, 14 Sep 2022 06:09:39 +0000
X-UUID: a0bc4ab9e784498ea6c20716ddddfe5e-20220913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=6+oGyl9dP8hxzdhVR6EPUTnIGGLS5/EJMLDztRGSB5o=;
	b=su4E6TP7sY1RovXT6HpexwllXcw0wMfTfv6Clj0Bh68PsM96YIEuqYyjtdrVLwVS5KXhPhBHLjeGNTq11EEDGRxs/FT9v7/1xanEpVJxjUKETqtw5nH+yESCF5hUXdA1YQyvqQK7HoUUlmYZ7XXMD1FcOVuG2tN8T925P5pkiUw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:bcd5518b-4f24-4b17-8224-8ef39a04d4f0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:e3b456f6-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a0bc4ab9e784498ea6c20716ddddfe5e-20220913
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2128097698; Tue, 13 Sep 2022 23:09:27 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 14 Sep 2022 14:07:52 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 14 Sep 2022 14:07:51 +0800
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
Subject: [PATCH v3 5/7] phy: phy-mtk-tphy: disable gpio mode for all usb2 phys
Date: Wed, 14 Sep 2022 14:07:44 +0800
Message-ID: <20220914060746.10004-5-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220914060746.10004-1-chunfeng.yun@mediatek.com>
References: <20220914060746.10004-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_230937_975051_3CF4F33C 
X-CRM114-Status: GOOD (  11.56  )
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

Disable DP/DM's GPIO mode for all usb2 phy, not only for the first
usb2 phy which usually supports dual-role mode.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~v3: no changes
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index 7f40b8b052bd..79920c066e59 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -532,8 +532,7 @@ static void u2_phy_instance_init(struct mtk_tphy *tphy,
 	/* disable switch 100uA current to SSUSB */
 	mtk_phy_clear_bits(com + U3P_USBPHYACR5, PA5_RG_U2_HS_100U_U3_EN);
 
-	if (!index)
-		mtk_phy_clear_bits(com + U3P_U2PHYACR4, P2C_U2_GPIO_CTR_MSK);
+	mtk_phy_clear_bits(com + U3P_U2PHYACR4, P2C_U2_GPIO_CTR_MSK);
 
 	if (tphy->pdata->avoid_rx_sen_degradation) {
 		if (!index) {
-- 
2.18.0


