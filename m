Return-Path: <SRS0=YoM+=H3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53CACC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 14:59:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F23BB64ECE
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 14:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F23BB64ECE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=moxgK39bL4N87GSvXvq/qLM8CsEag/QD9gKVUm0KbRk=; b=rGiIboatpDMp9fVgbpdiooP4QC
	01kbxpwZByyD4LW1+DNgebloHggYgBrL2fJVfLJ4udgwd6uzNPFq7amyZBymKYk4iORhanZFffX3u
	We4LulGgeb1gimWjvMCpjshAfMAtwwp3JE2TQpQCnfiA4OEDrRGM5XgN5dCQ9+4lyERdJCiIxyv6w
	Y56zJ8wIaG+XGGxdtkocO3Mkj7G6Zt2KExDLaq+FvIbXBVVwyvQ+eEgwcJZA0dia/5XOGa9MQXY7M
	PrHLGOGp+ie/MNBIH4pXBHW5InJvlyS7gFCJ1FAdFsReMC2yey7CV+22utV2AGweEeWo9fAWzN3zF
	xgb7Sxjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFI6M-0003WT-Dj; Thu, 25 Feb 2021 14:58:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFI6I-0003VH-Ox
 for linux-mediatek@lists.infradead.org; Thu, 25 Feb 2021 14:58:48 +0000
X-UUID: 94259638c0c04d8ba2adf9faf365dff2-20210225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=1khAEvrXT8L9zpKe+gN7xsZh0yLiASF5WAKKQ3xV/P0=; 
 b=TAm2oYsADdak7awmP2dcTdGY0W5hocz6ArcurFz3p9RKkT5XHNRCgpcD3XFKX32i6h7FT8m/+4RQ9aWLPw/PDw+kSIqxUhHZMpVn/ZknQyzCSUEz0L1323dW3ZoY5OLQuUMTm5NWk9uyN8a23qvfZYfAK7UW81L6VWs90f3M/9A=;
X-UUID: 94259638c0c04d8ba2adf9faf365dff2-20210225
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 131220821; Thu, 25 Feb 2021 06:58:40 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Feb 2021 06:58:39 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Feb 2021 22:58:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 25 Feb 2021 22:58:36 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v2 1/2] mt76: mt7915: add missing capabilities for DBDC
Date: Thu, 25 Feb 2021 22:58:35 +0800
Message-ID: <dd852df70c61ad730f39566ed6fa22c736ce5942.1614239710.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: B25BA3C93DB8F615E26B47FBE407EC944DEC344A3EDE7C449983167C4ED8749A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_095847_624960_F80594B0 
X-CRM114-Status: GOOD (  11.36  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless@vger.kernel.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Adjust capabilities setup for DBDC to improve performance.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
change since v2 - adjust setup sequence.
---
 .../net/wireless/mediatek/mt76/mt7915/init.c  | 50 +++++++++++--------
 1 file changed, 29 insertions(+), 21 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index c599b44a728c..98de148e1043 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -113,6 +113,24 @@ mt7915_init_wiphy(struct ieee80211_hw *hw)
 	ieee80211_hw_set(hw, WANT_MONITOR_VIF);
 
 	hw->max_tx_fragments = 4;
+
+	if (phy->mt76->cap.has_2ghz)
+		phy->mt76->sband_2g.sband.ht_cap.cap |=
+			IEEE80211_HT_CAP_LDPC_CODING |
+			IEEE80211_HT_CAP_MAX_AMSDU;
+
+	if (phy->mt76->cap.has_5ghz) {
+		phy->mt76->sband_5g.sband.ht_cap.cap |=
+			IEEE80211_HT_CAP_LDPC_CODING |
+			IEEE80211_HT_CAP_MAX_AMSDU;
+		phy->mt76->sband_5g.sband.vht_cap.cap |=
+			IEEE80211_VHT_CAP_MAX_MPDU_LENGTH_7991 |
+			IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_MASK;
+	}
+
+	mt76_set_stream_caps(phy->mt76, true);
+	mt7915_set_stream_vht_txbf_caps(phy);
+	mt7915_set_stream_he_caps(phy);
 }
 
 static void
@@ -240,22 +258,17 @@ static int mt7915_register_ext_phy(struct mt7915_dev *dev)
 	phy->mt76 = mphy;
 	mphy->chainmask = dev->chainmask & ~dev->mphy.chainmask;
 	mphy->antenna_mask = BIT(hweight8(mphy->chainmask)) - 1;
-	mt7915_init_wiphy(mphy->hw);
 
 	INIT_LIST_HEAD(&phy->stats_list);
 	INIT_DELAYED_WORK(&mphy->mac_work, mt7915_mac_work);
 
 	mt7915_eeprom_parse_band_config(phy);
-	mt7915_set_stream_vht_txbf_caps(phy);
-	mt7915_set_stream_he_caps(phy);
+	mt7915_init_wiphy(mphy->hw);
 
 	memcpy(mphy->macaddr, dev->mt76.eeprom.data + MT_EE_MAC_ADDR2,
 	       ETH_ALEN);
 	mt76_eeprom_override(mphy);
 
-	/* The second interface does not get any packets unless it has a vif */
-	ieee80211_hw_set(mphy->hw, WANT_MONITOR_VIF);
-
 	ret = mt7915_init_tx_queues(phy, MT7915_TXQ_BAND1,
 				    MT7915_TX_RING_SIZE);
 	if (ret)
@@ -332,8 +345,14 @@ static int mt7915_init_hardware(struct mt7915_dev *dev)
 
 void mt7915_set_stream_vht_txbf_caps(struct mt7915_phy *phy)
 {
-	int nss = hweight8(phy->mt76->chainmask);
-	u32 *cap = &phy->mt76->sband_5g.sband.vht_cap.cap;
+	int nss;
+	u32 *cap;
+
+	if (!phy->mt76->cap.has_5ghz)
+		return;
+
+	nss = hweight8(phy->mt76->chainmask);
+	*cap = &phy->mt76->sband_5g.sband.vht_cap.cap;
 
 	*cap |= IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE |
 		IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE |
@@ -637,25 +656,14 @@ int mt7915_register_device(struct mt7915_dev *dev)
 		return ret;
 
 	mt7915_init_wiphy(hw);
-	dev->mphy.sband_2g.sband.ht_cap.cap |=
-			IEEE80211_HT_CAP_LDPC_CODING |
-			IEEE80211_HT_CAP_MAX_AMSDU;
-	dev->mphy.sband_5g.sband.ht_cap.cap |=
-			IEEE80211_HT_CAP_LDPC_CODING |
-			IEEE80211_HT_CAP_MAX_AMSDU;
-	dev->mphy.sband_5g.sband.vht_cap.cap |=
-			IEEE80211_VHT_CAP_MAX_MPDU_LENGTH_7991 |
-			IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_MASK;
+
 	if (!dev->dbdc_support)
 		dev->mphy.sband_5g.sband.vht_cap.cap |=
 			IEEE80211_VHT_CAP_SHORT_GI_160 |
 			IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160_80PLUS80MHZ;
+
 	dev->mphy.hw->wiphy->available_antennas_rx = dev->mphy.chainmask;
 	dev->mphy.hw->wiphy->available_antennas_tx = dev->mphy.chainmask;
-
-	mt76_set_stream_caps(&dev->mphy, true);
-	mt7915_set_stream_vht_txbf_caps(&dev->phy);
-	mt7915_set_stream_he_caps(&dev->phy);
 	dev->phy.dfs_state = -1;
 
 #ifdef CONFIG_NL80211_TESTMODE
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
