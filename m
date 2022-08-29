Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C412ECAAD2
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 08:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ByurP8LTCvZUKtx+bAbwVCfLZuY+QlHIJXELPrb1i/w=; b=KIhRZDjO2vWkJEv/DNb0NDMSty
	2RTYVjNhXeqdakgID8j5BqPN1HPsPetSaZUgGIZ5u35cj29IEatH/+FqDYcMD4QwQ8y8PjwLhvxRK
	MjOMQPlTinkGCg8IXxPnD1v8OhdX2BoNXHcMj/yruH0jHke5SYeKt4LLC7+bRd9hoJqSSuCvWC1Vz
	12STDSPKkYTW+HlAErAplr+4uVg6dS57PAVgbsW27u+SNNdDw3FQO+6QeA6TitPK7L4bInDjMwHzn
	5Otuuj9iyOiFEax9EVtEfFziCpbyevmT/jGAwu7Q51O9GRauDpg3rsbjGn1XGtjhL1S8NdIwapho1
	lAbtjwXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSZtj-0063A3-DY; Mon, 29 Aug 2022 08:13:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSZtJ-0062pc-7K; Mon, 29 Aug 2022 08:13:06 +0000
X-UUID: 4d37d295bff641e89b4899c890fe896c-20220829
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ByurP8LTCvZUKtx+bAbwVCfLZuY+QlHIJXELPrb1i/w=;
	b=m/dzneuCjOlwophhS0OC5+Loj/f7ZOsy5NQQrrImbfJLEo2w9QQDNojUOCtekWzdXnUM68C1Tj+tT/gbRY4W81vDjpzCkN5ng2V5+toLxcBXzr+TXbQzZ6KPMKNiTT3TDlUzXRuGT8bY5RE7TdPtKcOLhhWTd3kBBKBMzqe0LYA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:5fb04775-de0f-4c49-bdad-35b98c1b275f,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:92946820-1c20-48a5-82a0-25f9c331906d,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 4d37d295bff641e89b4899c890fe896c-20220829
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 842509644; Mon, 29 Aug 2022 01:10:05 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 29 Aug 2022 16:08:35 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Aug 2022 16:08:34 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
	<kishon@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@canonical.com>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH v2 5/7] phy: phy-mtk-tphy: disable gpio mode for all usb2 phys
Date: Mon, 29 Aug 2022 16:08:28 +0800
Message-ID: <20220829080830.5378-5-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829080830.5378-1-chunfeng.yun@mediatek.com>
References: <20220829080830.5378-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_011305_487134_00CBF134 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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
v2: no changes
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


