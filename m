Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFE0C7EE23
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 May 2023 14:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UNQJ6UYhjogc5c1wDAOrvT+H4ssYX1133dol8QFtPq8=; b=k4uOHHAnSmtfEqX+1lk44Df5F1
	061fq4MGAEJ2Tgn14iYWxGyTtXcLCXhdSGFoBkF4jM6pzvNDE1p1y3mfd2wdb3p6YCTK0VzxNppZv
	OwBFexcNa5r5ZjwA3h8GEg+IfrV2sqYLjI1H8JUlyl1c0mek6fTPNIgyCjBSnsVwM7vNDM0ZTvqzy
	G57G6jQpNo48FFZlQZBED5PaQa0pBG53zgOxYMi9FbjmoODje+m23T+ILoAoCDJooHbX4+evBz6LS
	Jqom9hR7A56I0z+vH/OuYDfK02mCi0mzFMMNInC4uPoTLgDYfved19uKNaAWFHVoKZbf+kV7g/nYR
	6HgxYORQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzeJK-00D9io-0h;
	Thu, 18 May 2023 14:08:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzeJH-00D9h1-0w
	for linux-mediatek@lists.infradead.org;
	Thu, 18 May 2023 14:08:52 +0000
X-UUID: 8041e408f58511ed912e1518a6540028-20230518
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=UNQJ6UYhjogc5c1wDAOrvT+H4ssYX1133dol8QFtPq8=;
	b=r8FEtcGeIa82PjY4agXBiPBOjD28FV0wxhsK82be2FLTzUYi5h3RFJhBaMrG86YoW43S5yTSGjM9/nYPReudky+uU9Bs+y+VOzmg7AdhCAe7mq/cyltoBzpVDk5wHnQxZq2qAPxMC1sF0AT73IgT1vL+z8VXqm9ByMDjMzn9K5k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:e3fb0ee2-6264-422c-a997-f31cd3b54570,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:61d847c1-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 8041e408f58511ed912e1518a6540028-20230518
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 694993424; Thu, 18 May 2023 07:08:44 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 18 May 2023 22:08:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 18 May 2023 22:08:42 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, Leon Yen
	<Leon.Yen@mediatek.com>, Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Stella Chang
	<Stella.Chang@mediatek.com>, Quan Zhou <quan.zhou@mediatek.com>, Ryder Lee
	<ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7921: fix non-PSC channel scan fail
Date: Thu, 18 May 2023 22:08:14 +0800
Message-ID: <ee69ceae1809d39557e5e6872a7e9121b9d321f8.1684418645.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_070851_334584_216A9FBF 
X-CRM114-Status: UNSURE (   9.03  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

Due to the scan command may only request legacy bands and PSC channel
in 6GHz band, we are unable to scan the APs on non-PSC channel in this
case. Enable WIPHY_FLAG_SPLIT_SCAN_6GHZ to support non-PSC channel
(obtained during scan on legacy bands) in 6GHz scan request.

Fixes: 50ac15a511e3 ("mt76: mt7921: add 6GHz support")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index e929f6eb65ce..49f243d73336 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -113,7 +113,8 @@ mt7921_init_wiphy(struct ieee80211_hw *hw)
 	wiphy->max_sched_scan_ssids = MT76_CONNAC_MAX_SCHED_SCAN_SSID;
 	wiphy->max_match_sets = MT76_CONNAC_MAX_SCAN_MATCH;
 	wiphy->max_sched_scan_reqs = 1;
-	wiphy->flags |= WIPHY_FLAG_HAS_CHANNEL_SWITCH;
+	wiphy->flags |= WIPHY_FLAG_HAS_CHANNEL_SWITCH |
+			WIPHY_FLAG_SPLIT_SCAN_6GHZ;
 	wiphy->reg_notifier = mt7921_regd_notifier;
 
 	wiphy->features |= NL80211_FEATURE_SCHED_SCAN_RANDOM_MAC_ADDR |
-- 
2.18.0


