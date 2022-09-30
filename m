Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361F9C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 15:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wWJ0mt3ROZT4OOAHgPpc2L/Yd1at0XK5LU19Ae0Jek=; b=WTA9Jye39QQ9c4Cg+oPwe7LTRD
	1EUkN/k5gDaotZ92i0tPXTojXN0q7V5R4fnWwdLl4Cg6eu3ix3O2VDfCdnQyyvxlc6pCy52AOgUe1
	m28A6FempNHyQApP3rrBiRoaa/po0HdlCWlaT/4EM4S7jyzkIKHky1n2ajLV0OVwISrwku1APzeZR
	0WL60qb9DGZ9q5aXF7w0J3seogXcbEHiKqM/5lBqo4B9qfWUpnoQnQ/HQTANoaTWvwe680UsQ+Pcr
	E5tfm1xmKR1C4Hpbp7jCgXAdE8+isbiLJmc/ELSM8Tm5g4uaW/3UqP7PE0dQ4epGaGxUSxpNzpa90
	52lrIIAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeIDK-00ALqe-KD; Fri, 30 Sep 2022 15:46:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeIBX-00AKgY-JO
	for linux-mediatek@lists.infradead.org; Fri, 30 Sep 2022 15:44:21 +0000
X-UUID: 5457270ff9ac4fccaa89d6bd3bdafa56-20220930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=7wWJ0mt3ROZT4OOAHgPpc2L/Yd1at0XK5LU19Ae0Jek=;
	b=UE2K+4uDNQzXrCXX+eLXsegQHbi2D3RVQIl+WAS9jgGOB5xiOZX1JoBSsfkJrzMOTamD3AL3NH9KPUtPXk0paeke7fvcHYVWSYh0bWGuobcLgBnkT8vV4klHtyQynAbeiczL8zS9/iKA8/UyC9qpwAeUnHf2pSdUN4vX14axQck=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:fc8e7525-d347-41f2-9789-df398ddc6c94,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:38379907-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5457270ff9ac4fccaa89d6bd3bdafa56-20220930
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 750968022; Fri, 30 Sep 2022 08:44:12 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 30 Sep 2022 23:13:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 30 Sep 2022 23:13:38 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 3/6] wifi: mt76: mt7915: rework testmode tx antenna setting
Date: Fri, 30 Sep 2022 23:13:12 +0800
Message-ID: <20220930151315.19012-3-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220930151315.19012-1-shayne.chen@mediatek.com>
References: <20220930151315.19012-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_084419_697088_11C704F7 
X-CRM114-Status: GOOD (  14.88  )
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

Let the configuration of testmode antenna mask on both band0 and band1
become antenna_mask rather than chainmask. This could simplify the
settings for user and get rid of the conversion when sending fw command.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c    |  7 +------
 .../wireless/mediatek/mt76/mt7915/testmode.c   | 18 ++++++++----------
 2 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 6417fe685f17..56491364a903 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2642,14 +2642,9 @@ int mt7915_mcu_set_chan_info(struct mt7915_phy *phy, int cmd)
 
 #ifdef CONFIG_NL80211_TESTMODE
 	if (phy->mt76->test.tx_antenna_mask &&
-	    (phy->mt76->test.state == MT76_TM_STATE_TX_FRAMES ||
-	     phy->mt76->test.state == MT76_TM_STATE_RX_FRAMES ||
-	     phy->mt76->test.state == MT76_TM_STATE_TX_CONT)) {
+	    mt76_testmode_enabled(phy->mt76)) {
 		req.tx_streams_num = fls(phy->mt76->test.tx_antenna_mask);
 		req.rx_streams = phy->mt76->test.tx_antenna_mask;
-
-		if (phy != &dev->phy)
-			req.rx_streams >>= dev->chainshift;
 	}
 #endif
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
index efb9bb8231e2..e1838f046568 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
@@ -447,15 +447,10 @@ mt7915_tm_set_tx_frames(struct mt7915_phy *phy, bool en)
 	if (en) {
 		mt7915_tm_update_channel(phy);
 
-		if (td->tx_spe_idx) {
+		if (td->tx_spe_idx)
 			phy->test.spe_idx = td->tx_spe_idx;
-		} else {
-			u8 tx_ant = td->tx_antenna_mask;
-
-			if (phy != &dev->phy)
-				tx_ant >>= dev->chainshift;
-			phy->test.spe_idx = spe_idx_map[tx_ant];
-		}
+		else
+			phy->test.spe_idx = spe_idx_map[td->tx_antenna_mask];
 	}
 
 	mt7915_tm_set_tam_arb(phy, en,
@@ -696,7 +691,9 @@ mt7915_tm_set_params(struct mt76_phy *mphy, struct nlattr **tb,
 {
 	struct mt76_testmode_data *td = &mphy->test;
 	struct mt7915_phy *phy = mphy->priv;
-	u32 changed = 0;
+	struct mt7915_dev *dev = phy->dev;
+	u32 chainmask = mphy->chainmask, changed = 0;
+	bool ext_phy = phy != &dev->phy;
 	int i;
 
 	BUILD_BUG_ON(NUM_TM_CHANGED >= 32);
@@ -705,7 +702,8 @@ mt7915_tm_set_params(struct mt76_phy *mphy, struct nlattr **tb,
 	    td->state == MT76_TM_STATE_OFF)
 		return 0;
 
-	if (td->tx_antenna_mask & ~mphy->chainmask)
+	chainmask = ext_phy ? chainmask >> dev->chainshift : chainmask;
+	if (td->tx_antenna_mask > chainmask)
 		return -EINVAL;
 
 	for (i = 0; i < ARRAY_SIZE(tm_change_map); i++) {
-- 
2.25.1


