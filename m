Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C338D606A31C
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 03:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MiAVrqMJ;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=hTpnodpp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Zf2VZ93Zqi5hlJQQVJeksW4j9pVqkbWH8lcTWAcUOVk=; b=MiAVrqMJUk6fsVin6R+fErY5Hj
	lodzuZajriPOHEm6LLLJ+7g2yq6LMHaJWyzZ0L8G27Vn6SHXEd+fsaCeZp+wkNHVsLmQj0xf+H+7o
	5mBjQz3mUqomsTO+3t6OBV2VD97wMn2ak3CDoMCmOdVCAsMMhCcUxYz2cozPlxuVQUv2AYfPUrMQR
	Erho0BbiYLR5eFvIha7Z49ohIalFx9xcGI7np8MYWLRqlT8RVfrcJdw9hz9sIJ3DP5dKtV61fhae1
	7+XHJ8SQ60pvT+8RdLt8yroNcChwVhS64KTDsMmgQcFoZXSImc90a7yUscs6XArhkzM8TPWWMS+Ln
	A+RNsTwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcXd-00000002IJ4-1Q71;
	Tue, 10 Nov 2026 03:29:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcXZ-00000002IGh-07le
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 03:28:59 +0000
X-UUID: b7dd17f6dcb411f1afed4741b24580c9-20261109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Zf2VZ93Zqi5hlJQQVJeksW4j9pVqkbWH8lcTWAcUOVk=;
	b=hTpnodppzmjVQV/64Olgm7GBAqY+oSEqZdFLhzoWvpogtXrfYf9+VHdbuC2RTg3amnlYc+fBi79OlS5YCA3xO9jiaMMQTsdpf3/f/7cZqZG1VnL0pTB0zS9JFD99525czwjHTk7YctG0GJabzPMGeUhkCIvOzVqf7fwiBexD+IM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:89ccbbee-cbbd-4ecd-b0b8-7ca5a103dbc4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:042b0f57-a87d-42b7-8ffd-9e23ca174329,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b7dd17f6dcb411f1afed4741b24580c9-20261109
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 998271998; Mon, 09 Nov 2026 20:13:36 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:34 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:33 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>
Subject: [PATCH 09/28] wifi: mt76: mt7925: deactivate the DEV and BSS on disconnect
Date: Tue, 10 Nov 2026 11:12:25 +0800
Message-ID: <20261110031244.369014-10-emery.hsin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110031244.369014-1-emery.hsin@mediatek.com>
References: <20261110031244.369014-1-emery.hsin@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_192857_087779_E9968D41 
X-CRM114-Status: GOOD (  16.59  )
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

On disconnect the BSS is marked disconnected but stays active, so the
firmware keeps its old band binding and a later connection can get the
stale band. Also deactivate the DEV and BSS and reset the band to auto.

This is a preparation patch before the MT7925 MLO hybrid/EMLSR work.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 25 +++++++--
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 56 -------------------
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  2 -
 3 files changed, 21 insertions(+), 62 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 62018d17745c..4889d3bfe08d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1401,15 +1401,30 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 	link_conf = mt792x_vif_to_bss_conf(vif, link_id);
 
 	if (vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls) {
+		struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 		struct mt792x_bss_conf *mconf;
 
 		mconf = mt792x_link_conf_to_mconf(link_conf);
 
-		if (ieee80211_vif_is_mld(vif))
-			mt792x_mac_link_bss_remove(dev, mconf, mlink);
-		else
+		/* reset to auto band so the deactivate drops the band binding */
+		mconf->mt76.band_idx = MT792x_BAND_AUTO;
+
+		if (ieee80211_vif_is_mld(vif)) {
+			/* Sub-links are removed. The primary link is kept for
+			 * reconnect but deactivated in firmware.
+			 */
+			if (mconf != &mvif->bss_conf)
+				mt792x_mac_link_bss_remove(dev, mconf, mlink);
+			else
+				mt792x_mcu_set_dev_active(dev, link_conf, mconf,
+							  &mlink->wcid, false);
+		} else {
+			/* deactivate DEV and BSS, re-activated on the next connect */
 			mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx, link_conf,
 						link_sta, false);
+			mt792x_mcu_set_dev_active(dev, link_conf, mconf,
+						  &mlink->wcid, false);
+		}
 	}
 
 	spin_lock_bh(&mdev->sta_poll_lock);
@@ -1457,6 +1472,9 @@ mt7925_mac_sta_remove_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 
 		mconf = mt792x_link_conf_to_mconf(link_conf);
 
+		/* reset to auto band before the disconnect command */
+		mconf->mt76.band_idx = MT792x_BAND_AUTO;
+
 		mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx, link_conf,
 					link_sta, false);
 	}
@@ -1529,7 +1547,6 @@ void mt7925_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 
 	if (ieee80211_vif_is_mld(vif)) {
 		mt7925_mac_sta_remove_links(dev, vif, sta, msta->valid_links);
-		mt7925_mcu_del_dev(mdev, vif);
 	} else {
 		mt7925_mac_link_sta_remove(mdev, vif, &sta->deflink,
 					   &msta->deflink);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index b16a3c3122a1..557f8d3dea12 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -3185,62 +3185,6 @@ int mt7925_mcu_set_timing(struct mt792x_phy *phy,
 				     MCU_UNI_CMD(BSS_INFO_UPDATE), true);
 }
 
-void mt7925_mcu_del_dev(struct mt76_dev *mdev,
-			struct ieee80211_vif *vif)
-{
-	struct mt76_vif_link *mvif = (struct mt76_vif_link *)vif->drv_priv;
-	struct {
-		struct {
-			u8 omac_idx;
-			u8 band_idx;
-			__le16 pad;
-		} __packed hdr;
-		struct req_tlv {
-			__le16 tag;
-			__le16 len;
-			u8 active;
-			u8 link_idx; /* hw link idx */
-			u8 omac_addr[ETH_ALEN];
-		} __packed tlv;
-	} dev_req = {
-		.tlv = {
-			.tag = cpu_to_le16(DEV_INFO_ACTIVE),
-			.len = cpu_to_le16(sizeof(struct req_tlv)),
-			.active = true,
-		},
-	};
-	struct {
-		struct {
-			u8 bss_idx;
-			u8 pad[3];
-		} __packed hdr;
-		struct mt76_connac_bss_basic_tlv basic;
-	} basic_req = {
-		.basic = {
-			.tag = cpu_to_le16(UNI_BSS_INFO_BASIC),
-			.len = cpu_to_le16(sizeof(struct mt76_connac_bss_basic_tlv)),
-			.active = true,
-			.conn_state = 1,
-		},
-	};
-
-	dev_req.hdr.omac_idx = mvif->omac_idx;
-	dev_req.hdr.band_idx = mvif->band_idx;
-
-	basic_req.hdr.bss_idx = mvif->idx;
-	basic_req.basic.omac_idx = mvif->omac_idx;
-	basic_req.basic.band_idx = mvif->band_idx;
-	basic_req.basic.link_idx = mvif->link_idx;
-
-	mt76_mcu_send_msg(mdev, MCU_UNI_CMD(BSS_INFO_UPDATE),
-			  &basic_req, sizeof(basic_req), true);
-
-	/* recovery omac address for the legacy interface */
-	memcpy(dev_req.tlv.omac_addr, vif->addr, ETH_ALEN);
-	mt76_mcu_send_msg(mdev, MCU_UNI_CMD(DEV_INFO_UPDATE),
-			  &dev_req, sizeof(dev_req), true);
-}
-
 int mt7925_mcu_add_bss_info_sta(struct mt792x_phy *phy,
 				struct ieee80211_chanctx_conf *ctx,
 				struct ieee80211_bss_conf *link_conf,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index 11f9eac13ffc..4a6a1226a317 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -730,8 +730,6 @@ int mt7925_mcu_sched_scan_req(struct mt76_phy *phy,
 int mt7925_mcu_sched_scan_enable(struct mt76_phy *phy,
 				 struct ieee80211_vif *vif,
 				 bool enable);
-void mt7925_mcu_del_dev(struct mt76_dev *mdev,
-			struct ieee80211_vif *vif);
 int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 			    struct ieee80211_chanctx_conf *ctx,
 			    struct ieee80211_bss_conf *link_conf,
-- 
2.45.2


