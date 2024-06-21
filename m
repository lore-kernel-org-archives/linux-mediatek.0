Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E347C27C4F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jun 2024 12:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vaRahnf6HvtLueonuL1iOLmCm5bgf+4n+aOc5u6IpV8=; b=qRIsCzchLv2TazUB+zyyF607t5
	PmFwEfPtfEHlkCeuEEZnjVDDnYDs+2kLTg8VlR7fTtoTTiDKWjYwDBgxdWJSQF3gt2ky7ZLSpYEP+
	56BJ15vDGiu4tvGGSWvIHVjEZlQLLXeAgnsaWXL9lsZM5Er1YprRm/OjwAmKmanE8iVOm57clHUyo
	t719IMVWWBjyXXpPZoaRTDN1ZFob8nKkZbP8NjzlCZ/DIsib/mT5/cJG3cI0jKOQCzqzBykFpG237
	i4S+xgK9drNssyrBoKCm/Fx4mLGUwSUCtqnDk9Si1MpdXkJE4uPuylUugk/KlsaNekE/wF1o2whuN
	iJ+LQSEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKdOI-000000098Ou-0Rwm;
	Fri, 21 Jun 2024 12:29:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKdOF-000000098N2-0HFI;
	Fri, 21 Jun 2024 12:29:16 +0000
X-UUID: dad6df5c2fc911efb2966dae1f787272-20240621
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vaRahnf6HvtLueonuL1iOLmCm5bgf+4n+aOc5u6IpV8=;
	b=Aezo5WTPC+GQxMdyo1S36Ug4yjiS2g3sobc6tn9mTpur5ctd/ZxAM4cG9CKwQtazXtUqEWb24vRKyO13k5NONH6/jWwEIhZmRGeTsXYtKGBdZE0xaD5HSKRIgE81e6VyfXYyIRy5RhF0rN0zqSjgaal0m/MuTtVPRafPL6T9/KE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:64ec04f2-0286-475b-ba02-063f9e59664e,IP:0,U
	RL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:393d96e,CLOUDID:6ff45f85-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: dad6df5c2fc911efb2966dae1f787272-20240621
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 434627682; Fri, 21 Jun 2024 05:29:07 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 21 Jun 2024 20:29:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 21 Jun 2024 20:29:04 +0800
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
Subject: [PATCH net-next v8 13/13] net: phy: mediatek: Remove unnecessary outer parens of "supported_triggers" var
Date: Fri, 21 Jun 2024 20:20:45 +0800
Message-ID: <20240621122045.30732-14-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240621122045.30732-1-SkyLake.Huang@mediatek.com>
References: <20240621122045.30732-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.009600-8.000000
X-TMASE-MatchedRID: BIV06Js6OJN00I3rWKbGqx+WEMjoO9WWTJDl9FKHbrkKogmGusPLbx8+
	XHETeZCzky2SP4enkne5cURAloITPh8TzIzimOwPC24oEZ6SpSmb4wHqRpnaDv2+yxuUhyIMgJA
	8qGaptLPShjii885JA4vplMkCs/9/iZH4SxuZVKyUPItSaAwao61fEoqpp7DACF9ypY+Mx5JZKM
	ggZKh680ma3zYT97IFAYfQIAUhBayZvmCbKVb49sZL6x5U/HridGByp+zdaDg=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.009600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D1749B019A7B2828F5F206AC65DCFED23103E55B87D2E39D248FA145F544E7402000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_052915_131524_8B75E618 
X-CRM114-Status: UNSURE (   9.24  )
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

From: "SkyLake.Huang" <skylake.huang@mediatek.com>

This patch removes unnecessary outer parens of "supported_triggers" vars
in mtk-ge.c & mtk-ge-soc.c to improve readability.

Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
---
 drivers/net/phy/mediatek/mtk-ge-soc.c | 16 ++++++++--------
 drivers/net/phy/mediatek/mtk-ge.c     | 16 ++++++++--------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index fc33729..ff469c4 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -1229,14 +1229,14 @@ static int mt798x_phy_led_brightness_set(struct phy_device *phydev,
 }
 
 static const unsigned long supported_triggers =
-	(BIT(TRIGGER_NETDEV_FULL_DUPLEX) |
-	 BIT(TRIGGER_NETDEV_HALF_DUPLEX) |
-	 BIT(TRIGGER_NETDEV_LINK)        |
-	 BIT(TRIGGER_NETDEV_LINK_10)     |
-	 BIT(TRIGGER_NETDEV_LINK_100)    |
-	 BIT(TRIGGER_NETDEV_LINK_1000)   |
-	 BIT(TRIGGER_NETDEV_RX)          |
-	 BIT(TRIGGER_NETDEV_TX));
+	BIT(TRIGGER_NETDEV_FULL_DUPLEX) |
+	BIT(TRIGGER_NETDEV_HALF_DUPLEX) |
+	BIT(TRIGGER_NETDEV_LINK)        |
+	BIT(TRIGGER_NETDEV_LINK_10)     |
+	BIT(TRIGGER_NETDEV_LINK_100)    |
+	BIT(TRIGGER_NETDEV_LINK_1000)   |
+	BIT(TRIGGER_NETDEV_RX)          |
+	BIT(TRIGGER_NETDEV_TX);
 
 static int mt798x_phy_led_hw_is_supported(struct phy_device *phydev, u8 index,
 					  unsigned long rules)
diff --git a/drivers/net/phy/mediatek/mtk-ge.c b/drivers/net/phy/mediatek/mtk-ge.c
index 07b5b22..235fee5 100644
--- a/drivers/net/phy/mediatek/mtk-ge.c
+++ b/drivers/net/phy/mediatek/mtk-ge.c
@@ -157,14 +157,14 @@ static int mt753x_phy_led_brightness_set(struct phy_device *phydev,
 }
 
 static const unsigned long supported_triggers =
-	(BIT(TRIGGER_NETDEV_FULL_DUPLEX) |
-	 BIT(TRIGGER_NETDEV_HALF_DUPLEX) |
-	 BIT(TRIGGER_NETDEV_LINK)        |
-	 BIT(TRIGGER_NETDEV_LINK_10)     |
-	 BIT(TRIGGER_NETDEV_LINK_100)    |
-	 BIT(TRIGGER_NETDEV_LINK_1000)   |
-	 BIT(TRIGGER_NETDEV_RX)          |
-	 BIT(TRIGGER_NETDEV_TX));
+	BIT(TRIGGER_NETDEV_FULL_DUPLEX) |
+	BIT(TRIGGER_NETDEV_HALF_DUPLEX) |
+	BIT(TRIGGER_NETDEV_LINK)        |
+	BIT(TRIGGER_NETDEV_LINK_10)     |
+	BIT(TRIGGER_NETDEV_LINK_100)    |
+	BIT(TRIGGER_NETDEV_LINK_1000)   |
+	BIT(TRIGGER_NETDEV_RX)          |
+	BIT(TRIGGER_NETDEV_TX);
 
 static int mt753x_phy_led_hw_is_supported(struct phy_device *phydev, u8 index,
 					  unsigned long rules)
-- 
2.34.1


