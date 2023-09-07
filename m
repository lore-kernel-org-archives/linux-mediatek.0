Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDAD3EC875E
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 23:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9rcsNpbBeMmYdOrH0fdRc8XKB6/Epb7pPmL0hbsW2JA=; b=FE3x8wimGCqnSQgYpZ73vO7Moo
	Yp7zzShvruMNWsi76NoTgemZUY/QZfM6DkNneAya4RXtNnBoWr4majwa0wuY6gPrZER0BUahkxdRO
	DM8axiVYGyn+oSpD8AZSEJsQ3H6Vwu0Pu2wBIKVnyfwYZPESk1Hlusnx4HWb+Rk2wrRNUCxKyF4yf
	AzvMhxUjXcexmNFkmG9Gzb4aDBjDy2W87IWXGWYXj/9peXU47YUjnPbSMAmfhb6vHXhdFgdjmrQdx
	4lU1B1edeqVgc07byU4xG/V1H3Upp4dlOZNwV7UvoDqMzZx8b6aGuX+1own53sivNX4L33bmDj0hM
	Hwfg5dXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeOUY-00Co1O-1j;
	Thu, 07 Sep 2023 23:32:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeOUV-00Co10-2w
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Sep 2023 23:32:53 +0000
X-UUID: d88d45184dd611ee86758d4a7c00f3a0-20230907
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=9rcsNpbBeMmYdOrH0fdRc8XKB6/Epb7pPmL0hbsW2JA=;
	b=Zha8TSRY3VH8JnVw9u+0z1ssQQVmMvYmUgJDp/zpf4hJPkA2zZV1XBwD8GQgt6YcPg0j7nyGhJYevbyxW/nh2TUJfLiE1mpApEjBmSeqephWX40Khs7PnymyFZgnkiYP4UPXy1OuBzzAg7qbS9ci9xPCAv/J082n0T/+3jAu7U4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:f7762f33-cfc2-49a9-9583-a038d8a13345,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:a15aaf13-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d88d45184dd611ee86758d4a7c00f3a0-20230907
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 80360470; Thu, 07 Sep 2023 16:32:44 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 8 Sep 2023 07:32:08 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 8 Sep 2023 07:32:08 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <robin.chiu@mediatek.com>,
	<Eddie.Chen@mediatek.com>, <jsiuda@google.com>, <arowa@google.org>,
	<frankgor@google.com>, <kuabhs@google.com>, <druth@google.com>,
	<abhishekpandit@google.com>, <shawnku@google.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] wifi: mt76: mt7921: fix the wrong rate selected in fw for the chanctx driver
Date: Fri, 8 Sep 2023 07:32:07 +0800
Message-ID: <4b2ee1382896dd7ff27ecbef6e1ad496edccd3ad.1694129223.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3092-8.6.1018-23728.005
X-TM-AS-Result: No-10--1.614500-8.000000
X-TMASE-MatchedRID: x6uIgBUWMEwmcsJib2IjaW3NvezwBrVmncKJki+ooR0OUs4CTUgKy49X
	7Ioij9Lv15nUytvXrcwa7rkdR+2D46YofNn3TZqQtw+xHnsmQjNU3K6aV1ad7Zsoi2XrUn/Jn6K
	dMrRsL14qtq5d3cxkNffvWahKfRU4FQm9UF7uFyRdS0hNkMonVSeW1fq+KmOGgjgarYenaZbHCP
	n/QUOXkiD5+gO+AAWPvR8SMYiv5PDzBh4ndoetdro3/9IQaRpdF0aD5ljt43pMcHZD6gqu7wxMj
	fifIXfowkvVoA11TwqeqD9WtJkSIw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.614500-8.000000
X-TMASE-Version: SMEX-14.0.0.3092-8.6.1018-23728.005
X-TM-SNTS-SMTP: D8A335030467CFCF19C7B0C788FAA99AA899852EF5D11554A43B9033D9B4B5492000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_163251_959177_20662CED 
X-CRM114-Status: GOOD (  12.21  )
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

From: Sean Wang <sean.wang@mediatek.com>

The variable band should be determined by the ieee80211_chanctx_conf when
the driver is a kind of chanctx one e.g mt7921 and mt7922 driver so we
added the extension to mt76_connac2_mac_tx_rate_val and
mt76_connac_get_he_phy_cap for the firmware can select the proper rate.

Fixes: 41ac53c899bd ("wifi: mt76: mt7921: introduce chanctx support")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 0f0a519f956f..8274a57e1f0f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -829,7 +829,9 @@ void mt76_connac_mcu_sta_tlv(struct mt76_phy *mphy, struct sk_buff *skb,
 			     struct ieee80211_vif *vif,
 			     u8 rcpi, u8 sta_state)
 {
-	struct cfg80211_chan_def *chandef = &mphy->chandef;
+	struct mt76_vif *mvif = (struct mt76_vif *)vif->drv_priv;
+	struct cfg80211_chan_def *chandef = mvif->ctx ?
+					    &mvif->ctx->def : &mphy->chandef;
 	enum nl80211_band band = chandef->chan->band;
 	struct mt76_dev *dev = mphy->dev;
 	struct sta_rec_ra_info *ra_info;
@@ -1369,7 +1371,10 @@ EXPORT_SYMBOL_GPL(mt76_connac_get_phy_mode_ext);
 const struct ieee80211_sta_he_cap *
 mt76_connac_get_he_phy_cap(struct mt76_phy *phy, struct ieee80211_vif *vif)
 {
-	enum nl80211_band band = phy->chandef.chan->band;
+	struct mt76_vif *mvif = (struct mt76_vif *)vif->drv_priv;
+	struct cfg80211_chan_def *chandef = mvif->ctx ?
+					    &mvif->ctx->def : &phy->chandef;
+	enum nl80211_band band = chandef->chan->band;
 	struct ieee80211_supported_band *sband;
 
 	sband = phy->hw->wiphy->bands[band];
-- 
2.25.1


