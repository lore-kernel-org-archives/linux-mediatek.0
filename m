Return-Path: <SRS0=c7Bv=H4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D279C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 16:44:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42A0D64F0E
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 16:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42A0D64F0E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RZ34r+7trwSZMJcm453tEUh3I/OZafuCoO7rmdCbZhU=; b=1cGKGb7bYriDZyNXgHiJxPcRE5
	xB/nPhrU1zVcVNWN7FGs/ck7u09MTCz0gpCRF1EqYLeh+KzTVjSt1chn68mikDfEyKujrmpX5edae
	ySb+TK33/k40XUqoyxX3aaDLAq9e8sTCCYGVlkjVyl0UU60ASbah0vtLiZ+Y2OQMEytUwZsMDXXa+
	b7mHY9b624hXrZXcLOuUN57DkuD8GTUWAxtwhfV/X4S8LREQdEhtuiv3pGo1reYQcDIgqxDcMUcC1
	ienSyWPicZNzVNzcg4tXrivvs6Xxp9eoXRfOk+SOW3kKWoVjDiTaxI/qadCQdSRe4I87958ZNkka6
	+HE1Z7Lw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFgEP-0004oN-IA; Fri, 26 Feb 2021 16:44:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFgEN-0004nI-Ay
 for linux-mediatek@lists.infradead.org; Fri, 26 Feb 2021 16:44:44 +0000
X-UUID: fe0126abf24943759bbb0c84955167f8-20210226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=GYUAL3d+i8wF1KUcPD1xoc3GKWFm9Ip8HjkYGEfNYtY=; 
 b=oNazxlX3wdcmlxdT+p1ern0w73eNrHknhaHaZqylF3oBVHJvJqnSqI/c/ObsrgBFJUOLb1HK7e1pvK7AO1xTu5kuoRS1zpFZBWfLCPTa0zCU8i8P3RJrLifumiZANYo49VUaX6Pq6fRjlidbtYnC8EYk6NhKoBrm8BHmTgc1Pik=;
X-UUID: fe0126abf24943759bbb0c84955167f8-20210226
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 800274502; Fri, 26 Feb 2021 08:44:33 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Feb 2021 08:44:32 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 27 Feb 2021 00:44:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 27 Feb 2021 00:44:29 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v3 1/2] mt76: mt7915: add missing capabilities for DBDC
Date: Sat, 27 Feb 2021 00:44:27 +0800
Message-ID: <427ab5a2a79b8bbfa05225cfe4cfb55b3f143c8c.1614357346.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 499513151A86E2E5101392422E2DCAE1DCD9EF30BE8BD662A6E60BF995734AC32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_114443_583503_9CE3D84C 
X-CRM114-Status: GOOD (  11.43  )
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

This improves dbdc performance.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
change since v3 - fix build warnings.
change since v2 - adjust setup sequence.
---
 .../net/wireless/mediatek/mt76/mt7915/init.c  | 50 +++++++++++--------
 1 file changed, 29 insertions(+), 21 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index c599b44a728c..165be6abcc96 100644
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
+	cap = &phy->mt76->sband_5g.sband.vht_cap.cap;
 
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
