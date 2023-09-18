Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6BACD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 08:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yc89gJFhl3MRIb6CQKbmiZz3zzemnzwFSZfpFG8eaHg=; b=etQXE/mthkMmMXOgB1Yf7xK6vH
	jB2jXH9jHInnjTC7jlM6Nulo/oWB45fRKW1KROsAcrBdUrxJX39fDydW0/2ifOszK61fr5vqotpm/
	lb9tqE1gH7xFLS4Oj8eIwNhuGCrlHsE8xHsnnETehMYng0l0/HaIaSF0PQXiCDKNhoH8MATH54tN1
	VIPaX4PBb38KwaMUBfV94ARvYw3pc2HFKxtamuDW0WtYxi95wMqSmYWZj6wJGNfI7snyCDrmRZ19j
	zwUOsFEP3ST7Lhq2l9X9YPBqZeUiTaN6UU1HeN4o7+CLknksJ9F+fDY6Ii5+fz1PAbNJQshzZG57b
	9Nh7DuVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi9El-00Enqw-18;
	Mon, 18 Sep 2023 08:04:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi9Eh-00Enq3-2c
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 08:04:05 +0000
X-UUID: ea7eb6dc55f911ee86758d4a7c00f3a0-20230918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=yc89gJFhl3MRIb6CQKbmiZz3zzemnzwFSZfpFG8eaHg=;
	b=XcRgA45wMW8PpHQA3+LR9zUXDG6pFilcsLaNM0/Z3ouZXsCBVSGH2ygzSwp8EIGJn+HrxHwFC0ukKVn2yhAQaJucS3hHIpNaZ0Y2o0GqzlacL8NKsAj+tLtu2RxHlQ5rFA1gVe+TxzZeuJHeUVb+9yJ4c88otFjtTowzSal4FXo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:4923d862-f706-458c-8169-aa19cdc7695d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:13531014-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: ea7eb6dc55f911ee86758d4a7c00f3a0-20230918
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 852475697; Mon, 18 Sep 2023 01:03:56 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Sep 2023 16:03:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Sep 2023 16:03:53 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <jenhao.yang@mediatek.com>,
	<robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
	<ted.huang@mediatek.com>, <Stella.Chang@mediatek.com>,
	<Tom.Chou@mediatek.com>, <jsiuda@google.com>, <arowa@google.org>,
	<frankgor@google.com>, <kuabhs@google.com>, <druth@google.com>,
	<abhishekpandit@google.com>, <shawnku@google.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Deren
 Wu <deren.wu@mediatek.com>
Subject: [PATCH v2 2/3] wifi: mt76: mt7921: fix the wrong rate pickup for the chanctx driver
Date: Mon, 18 Sep 2023 16:03:07 +0800
Message-ID: <3d290e0d2fab20fcf341fde055397f46b542f24e.1695021398.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1695021398.git.deren.wu@mediatek.com>
References: <cover.1695021398.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_010403_854571_2AE0254E 
X-CRM114-Status: GOOD (  14.72  )
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
added the extension to mt76_connac2_mac_tx_rate_val by distinguishing if
it can support chanctx to fix the incorrect rate pickup.

Fixes: 41ac53c899bd ("wifi: mt76: mt7921: introduce chanctx support")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Reviewed-by: David Ruth <druth@chromium.org>
Tested-by: David Ruth <druth@chromium.org>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
v2: rebase on the top of maintainer tree
---
 drivers/net/wireless/mediatek/mt76/mac80211.c        | 9 +++++++--
 drivers/net/wireless/mediatek/mt76/mt76.h            | 3 ++-
 drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c | 7 +++++--
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 8cd1a7ed82f4..cb76053973aa 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -1744,11 +1744,16 @@ mt76_init_queue(struct mt76_dev *dev, int qid, int idx, int n_desc,
 }
 EXPORT_SYMBOL_GPL(mt76_init_queue);
 
-u16 mt76_calculate_default_rate(struct mt76_phy *phy, int rateidx)
+u16 mt76_calculate_default_rate(struct mt76_phy *phy,
+				struct ieee80211_vif *vif, int rateidx)
 {
+	struct mt76_vif *mvif = (struct mt76_vif *)vif->drv_priv;
+	struct cfg80211_chan_def *chandef = mvif->ctx ?
+					    &mvif->ctx->def :
+					    &phy->chandef;
 	int offset = 0;
 
-	if (phy->chandef.chan->band != NL80211_BAND_2GHZ)
+	if (chandef->chan->band != NL80211_BAND_2GHZ)
 		offset = 4;
 
 	/* pick the lowest rate for hidden nodes */
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index fabed3f3ef32..fede40cf86b7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1107,7 +1107,8 @@ int mt76_get_of_eeprom(struct mt76_dev *dev, void *data, int offset, int len);
 struct mt76_queue *
 mt76_init_queue(struct mt76_dev *dev, int qid, int idx, int n_desc,
 		int ring_base, u32 flags);
-u16 mt76_calculate_default_rate(struct mt76_phy *phy, int rateidx);
+u16 mt76_calculate_default_rate(struct mt76_phy *phy,
+				struct ieee80211_vif *vif, int rateidx);
 static inline int mt76_init_tx_queue(struct mt76_phy *phy, int qid, int idx,
 				     int n_desc, int ring_base, u32 flags)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index 3b63c64e7d54..93402d2c2538 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -293,7 +293,10 @@ u16 mt76_connac2_mac_tx_rate_val(struct mt76_phy *mphy,
 				 struct ieee80211_vif *vif,
 				 bool beacon, bool mcast)
 {
-	u8 nss = 0, mode = 0, band = mphy->chandef.chan->band;
+	struct mt76_vif *mvif = (struct mt76_vif *)vif->drv_priv;
+	struct cfg80211_chan_def *chandef = mvif->ctx ?
+					    &mvif->ctx->def : &mphy->chandef;
+	u8 nss = 0, mode = 0, band = chandef->chan->band;
 	int rateidx = 0, mcast_rate;
 
 	if (!vif)
@@ -326,7 +329,7 @@ u16 mt76_connac2_mac_tx_rate_val(struct mt76_phy *mphy,
 		rateidx = ffs(vif->bss_conf.basic_rates) - 1;
 
 legacy:
-	rateidx = mt76_calculate_default_rate(mphy, rateidx);
+	rateidx = mt76_calculate_default_rate(mphy, vif, rateidx);
 	mode = rateidx >> 8;
 	rateidx &= GENMASK(7, 0);
 out:
-- 
2.18.0


