Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337E5CFA765
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 10:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=txWUOB79K06GeolSRm+ANM2ztWW1pbykpHjLqNGngDA=; b=Tw8i/mCIOkF/7d7WV4i46miCxt
	BeFrQMmJGpWqEMPg256nqvcbjbfMqPY5IfW7KKFj1SWgzuUFQONn8NJbZyCz2Y0rmskUmcyo/6XX9
	Ev1YcgnBW9m5UJ4JtMiuZCO1mjMr7wVxgmNBL+jKjw3HtGNCIqzCQ39mB9c0+rBVB/n7GMuHUSg7j
	r/KN+fqGHi2DloXbfja7XZlBdFC2yixpViunzaoqwMTThMZcsAcZJ/B2+esHVBdjR+tvVNNgAmnBl
	AHhyYKvn0cnLgn7s9MiJ69l3JD57dn9H+6EpCpAfWXvp6WZx9lqEdopbN53CL/8xStKbImPTaB5ci
	ZM341IVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swfz2-0000000ByeB-0YVZ;
	Fri, 04 Oct 2024 10:56:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swfW5-0000000BqMl-3gHe;
	Fri, 04 Oct 2024 10:26:35 +0000
X-UUID: 1f9b38a4823b11efba0aef63c0775dbf-20241004
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=txWUOB79K06GeolSRm+ANM2ztWW1pbykpHjLqNGngDA=;
	b=euT0uT0guMrBwyaIVwYOzUxwyp6d4QfEMQ+D/gqAv9zuYLCeiMURSewfmkhX60cb6mErVG5aQR4iP9gQMUBIrbiZQyruzNyJPIfNHwhX1JVo7Zi/foAzaQq3wQCR1XQVxnk7gZpM23ejnFzh28Jgr9GAw1LkULqrzmkKIUUdQc8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:902bf3ea-97a9-43c8-8ffe-b772f0989fbc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:cde5c040-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1f9b38a4823b11efba0aef63c0775dbf-20241004
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 70138420; Fri, 04 Oct 2024 03:26:31 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 4 Oct 2024 18:26:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 4 Oct 2024 18:26:28 +0800
From: Sky Huang <SkyLake.Huang@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Daniel Golle
	<daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
	<SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Steven Liu <Steven.Liu@mediatek.com>, SkyLake.Huang
	<skylake.huang@mediatek.com>
Subject: [PATCH net-next 4/9] net: phy: mediatek: Improve readability of mtk-phy-lib.c's mtk_phy_led_hw_ctrl_set()
Date: Fri, 4 Oct 2024 18:24:08 +0800
Message-ID: <20241004102413.5838-5-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241004102413.5838-1-SkyLake.Huang@mediatek.com>
References: <20241004102413.5838-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_032633_950646_33E8E5E0 
X-CRM114-Status: GOOD (  10.32  )
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

From: "SkyLake.Huang" <skylake.huang@mediatek.com>

This patch removes parens around TRIGGER_NETDEV_RX/TRIGGER_NETDEV_TX in
mtk_phy_led_hw_ctrl_set(), which improves readability.

Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
---
 drivers/net/phy/mediatek/mtk-phy-lib.c | 44 ++++++++++++++------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-phy-lib.c b/drivers/net/phy/mediatek/mtk-phy-lib.c
index e1fbeff..20796ae 100644
--- a/drivers/net/phy/mediatek/mtk-phy-lib.c
+++ b/drivers/net/phy/mediatek/mtk-phy-lib.c
@@ -127,29 +127,33 @@ int mtk_phy_led_hw_ctrl_set(struct phy_device *phydev, u8 index,
 		on |= MTK_PHY_LED_ON_LINK2500;
 
 	if (rules & BIT(TRIGGER_NETDEV_RX)) {
-		blink |= (on & on_set) ?
-			  (((on & MTK_PHY_LED_ON_LINK10) ?
-			    MTK_PHY_LED_BLINK_10RX : 0) |
-			   ((on & MTK_PHY_LED_ON_LINK100) ?
-			    MTK_PHY_LED_BLINK_100RX : 0) |
-			   ((on & MTK_PHY_LED_ON_LINK1000) ?
-			    MTK_PHY_LED_BLINK_1000RX : 0) |
-			   ((on & MTK_PHY_LED_ON_LINK2500) ?
-			    MTK_PHY_LED_BLINK_2500RX : 0)) :
-			  rx_blink_set;
+		if (on & on_set) {
+			if (on & MTK_PHY_LED_ON_LINK10)
+				blink |= MTK_PHY_LED_BLINK_10RX;
+			if (on & MTK_PHY_LED_ON_LINK100)
+				blink |= MTK_PHY_LED_BLINK_100RX;
+			if (on & MTK_PHY_LED_ON_LINK1000)
+				blink |= MTK_PHY_LED_BLINK_1000RX;
+			if (on & MTK_PHY_LED_ON_LINK2500)
+				blink |= MTK_PHY_LED_BLINK_2500RX;
+		} else {
+			blink |= rx_blink_set;
+		}
 	}
 
 	if (rules & BIT(TRIGGER_NETDEV_TX)) {
-		blink |= (on & on_set) ?
-			  (((on & MTK_PHY_LED_ON_LINK10) ?
-			    MTK_PHY_LED_BLINK_10TX : 0) |
-			   ((on & MTK_PHY_LED_ON_LINK100) ?
-			    MTK_PHY_LED_BLINK_100TX : 0) |
-			   ((on & MTK_PHY_LED_ON_LINK1000) ?
-			    MTK_PHY_LED_BLINK_1000TX : 0) |
-			   ((on & MTK_PHY_LED_ON_LINK2500) ?
-			    MTK_PHY_LED_BLINK_2500TX : 0)) :
-			  tx_blink_set;
+		if (on & on_set) {
+			if (on & MTK_PHY_LED_ON_LINK10)
+				blink |= MTK_PHY_LED_BLINK_10TX;
+			if (on & MTK_PHY_LED_ON_LINK100)
+				blink |= MTK_PHY_LED_BLINK_100TX;
+			if (on & MTK_PHY_LED_ON_LINK1000)
+				blink |= MTK_PHY_LED_BLINK_1000TX;
+			if (on & MTK_PHY_LED_ON_LINK2500)
+				blink |= MTK_PHY_LED_BLINK_2500TX;
+		} else {
+			blink |= tx_blink_set;
+		}
 	}
 
 	if (blink || on)
-- 
2.45.2


