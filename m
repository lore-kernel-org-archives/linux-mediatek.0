Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4A6606A326
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 03:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J4lu4/3Y;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Ry5oJCYS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AipeNk4KNk5XnDTmG7+2cR04bENv/ta70b3jNySa2Zw=; b=J4lu4/3YTx5Y8fsgmsh5ZtGFGn
	B1nplJ8kjeZVbTilP5HGXqOfHGU0f3sjRsRWknXJbfnFNqNoU7SB9nY5OU/voO6zjw8bbfGWwMApI
	BHFn6huaOYXDDQ+vbdbii36VAlJv5jFrHq4SXpCbFjlIXDesytSHcqN2ENw6/Zz7GWrGRZBeYdCUk
	xoqwBfj3DDo3LZfG2lFhkw8hlUWgdIkSrAUyedc54GutwLqY5Ot75DfrKC+E3a95N9EU4JKA/XjbO
	SXoD8ZTpmaKVQqzWz54vnDo+kDNO7BhXJa8GYpwuXR44uPEbtg6uQb4rPpCa5I6YB2J9rHZYijoM/
	W/TDbtKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIy-00000002FQN-3LIM;
	Tue, 10 Nov 2026 03:13:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIe-00000002EvL-11w4
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 03:13:34 +0000
X-UUID: b3c3e956dcb411f1acbe4559397dec65-20261109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=AipeNk4KNk5XnDTmG7+2cR04bENv/ta70b3jNySa2Zw=;
	b=Ry5oJCYShhwzZUZum51Typ/G7K3qLKop26yoWZbXIQKb5nXemetzbOt2AYd0Z2x5X9N/UHjqvTVQfj1K2cMV8vjGJ5VEjpXARUSDj4EyuFQqwgKCm7qohWjYoB3rprU7n4WoQl/7fgp/rvsn1Pm+XofrCJeTA70qX7mxBBX/YGg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:4ec40185-dae5-4451-981b-fbfd8f99fc56,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:a2931366-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b3c3e956dcb411f1acbe4559397dec65-20261109
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 587275763; Mon, 09 Nov 2026 20:13:29 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:28 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:28 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>
Subject: [PATCH 05/28] wifi: mt76: use named constants for the HT secondary channel offset
Date: Tue, 10 Nov 2026 11:12:21 +0800
Message-ID: <20261110031244.369014-6-emery.hsin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110031244.369014-1-emery.hsin@mediatek.com>
References: <20261110031244.369014-1-emery.hsin@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_191332_318800_18167E44 
X-CRM114-Status: GOOD (  11.89  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace the hard-coded 0/1/3 sco values with the standard
IEEE80211_HT_PARAM_CHA_SEC_NONE/ABOVE/BELOW constants. No functional
change.

This is a preparation patch before the MT7925 MLO hybrid/EMLSR work.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |  4 ++--
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   |  8 ++++----
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 19 ++++++++++---------
 3 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 3ef55781a0da..cd9c4569e4b2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1601,9 +1601,9 @@ int mt76_connac_mcu_uni_set_chctx(struct mt76_phy *phy, struct mt76_vif_link *mv
 	}
 
 	if (rlm_req.rlm.control_channel < rlm_req.rlm.center_chan)
-		rlm_req.rlm.sco = 1; /* SCA */
+		rlm_req.rlm.sco = IEEE80211_HT_PARAM_CHA_SEC_ABOVE;
 	else if (rlm_req.rlm.control_channel > rlm_req.rlm.center_chan)
-		rlm_req.rlm.sco = 3; /* SCB */
+		rlm_req.rlm.sco = IEEE80211_HT_PARAM_CHA_SEC_BELOW;
 
 	return mt76_mcu_send_msg(mdev, MCU_UNI_CMD(BSS_INFO_UPDATE), &rlm_req,
 				 sizeof(rlm_req), true);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 628f221fcc15..3954ca96c1f2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -880,9 +880,9 @@ int mt7921_mcu_set_roc(struct mt792x_phy *phy, struct mt792x_vif *vif,
 	};
 
 	if (chan->hw_value < center_ch)
-		req.roc.sco = 1; /* SCA */
+		req.roc.sco = IEEE80211_HT_PARAM_CHA_SEC_ABOVE;
 	else if (chan->hw_value > center_ch)
-		req.roc.sco = 3; /* SCB */
+		req.roc.sco = IEEE80211_HT_PARAM_CHA_SEC_BELOW;
 
 	switch (chan->band) {
 	case NL80211_BAND_6GHZ:
@@ -1293,9 +1293,9 @@ int mt7921_mcu_config_sniffer(struct mt792x_vif *vif,
 		req.tlv.center_ch2 = ieee80211_frequency_to_channel(freq2);
 
 	if (req.tlv.control_ch < req.tlv.center_ch)
-		req.tlv.sco = 1; /* SCA */
+		req.tlv.sco = IEEE80211_HT_PARAM_CHA_SEC_ABOVE;
 	else if (req.tlv.control_ch > req.tlv.center_ch)
-		req.tlv.sco = 3; /* SCB */
+		req.tlv.sco = IEEE80211_HT_PARAM_CHA_SEC_BELOW;
 
 	return mt76_mcu_send_msg(vif->phy->mt76->dev, MCU_UNI_CMD(SNIFFER),
 				 &req, sizeof(req), true);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index c8dab3cbb06b..b16a3c3122a1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1598,9 +1598,9 @@ int mt7925_mcu_set_mlo_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf
 				      MT792x_BAND_AUTO;
 
 		if (chan->hw_value < center_ch)
-			req.roc[i].sco = 1; /* SCA */
+			req.roc[i].sco = IEEE80211_HT_PARAM_CHA_SEC_ABOVE;
 		else if (chan->hw_value > center_ch)
-			req.roc[i].sco = 3; /* SCB */
+			req.roc[i].sco = IEEE80211_HT_PARAM_CHA_SEC_BELOW;
 
 		req.roc[i].band = ch_band[chan->band];
 	}
@@ -1689,12 +1689,13 @@ int mt7925_mcu_set_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf,
 		req.roc.center_chan2_from_ap = center_ch2;
 	}
 
-	/* 1 = SCA, 3 = SCB */
 	if (nl80211_chan_width_to_mhz(chandef.width) >= 40) {
 		pri40_freq = cfg80211_chandef_primary(&chandef,
 						      NL80211_CHAN_WIDTH_40, NULL);
 		if (pri40_freq > 0)
-			req.roc.sco = chan->center_freq < pri40_freq ? 1 : 3;
+			req.roc.sco = chan->center_freq < pri40_freq ?
+				       IEEE80211_HT_PARAM_CHA_SEC_ABOVE :
+				       IEEE80211_HT_PARAM_CHA_SEC_BELOW;
 	}
 
 	switch (chan->band) {
@@ -2546,9 +2547,9 @@ int mt7925_mcu_config_sniffer(struct mt792x_vif *vif,
 		req.tlv.center_ch2 = ieee80211_frequency_to_channel(freq2);
 
 	if (req.tlv.control_ch < req.tlv.center_ch)
-		req.tlv.sco = 1; /* SCA */
+		req.tlv.sco = IEEE80211_HT_PARAM_CHA_SEC_ABOVE;
 	else if (req.tlv.control_ch > req.tlv.center_ch)
-		req.tlv.sco = 3; /* SCB */
+		req.tlv.sco = IEEE80211_HT_PARAM_CHA_SEC_BELOW;
 
 	return mt76_mcu_send_msg(mphy->dev, MCU_UNI_CMD(SNIFFER),
 				 &req, sizeof(req), true);
@@ -2671,7 +2672,7 @@ void mt7925_mcu_bss_rlm_tlv(struct sk_buff *skb, struct mt76_phy *phy,
 	req->ht_op_info = 4; /* set HT 40M allowed */
 	req->rx_streams = hweight8(phy->antenna_mask);
 	req->center_chan2 = 0;
-	req->sco = 0;
+	req->sco = IEEE80211_HT_PARAM_CHA_SEC_NONE;
 	req->band = 1;
 
 	switch (band) {
@@ -2721,9 +2722,9 @@ void mt7925_mcu_bss_rlm_tlv(struct sk_buff *skb, struct mt76_phy *phy,
 	}
 
 	if (req->control_channel < req->center_chan)
-		req->sco = 1; /* SCA */
+		req->sco = IEEE80211_HT_PARAM_CHA_SEC_ABOVE;
 	else if (req->control_channel > req->center_chan)
-		req->sco = 3; /* SCB */
+		req->sco = IEEE80211_HT_PARAM_CHA_SEC_BELOW;
 }
 
 static struct sk_buff *
-- 
2.45.2


