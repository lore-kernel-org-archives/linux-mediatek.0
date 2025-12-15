Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6A9D5B172
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Dec 2025 06:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xuXAFZNbEBiEpSlSbJJrUwJukFhmlhgnFfCvnA9f2cw=; b=h06iH2Y7oVOiiWffy5RXvZhdW9
	RW1cd6Se2nV8rpbSrUk7kx+AxmdyjONKI5VDVvXB6a4Mwu4qm6wexbmVBGm8ZfM3BpUvZmJVcPkY6
	BElAU/MDAF1pkatWO/eHcJje6gItDSuUYqeVe8s0AB9lpWqFc0J0ojLGzB0AxCNZhZCOVrcOTiruX
	gTnSAkfHiLN8Yml4R6umVraVjyeAEJzGMZH5JkbZy4EiFvIQ6LR9e6xJM+N1Q14z4Cja884o/f0Jb
	cEmHYtLLgCv9u/hE7oGmw/mDjc+VZLUDV7NQB2RdBbgYD5Ipdyym43edQ0AblKJU2yOGP5Nv2ma1L
	VaZtDJmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV2Dn-000000039nU-0ov5;
	Mon, 15 Dec 2025 06:38:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV2Dg-000000039kz-2KgD
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Dec 2025 06:38:13 +0000
X-UUID: 9ac913a0d98011f0a52f393f94899d25-20251214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xuXAFZNbEBiEpSlSbJJrUwJukFhmlhgnFfCvnA9f2cw=;
	b=Q5O+bbulkMM/xql+4xEjv/N5+LLVRyjTJbmmpOhbkzAPH5kFlNXRFEw/6FvhkM3T8Tf/AC7WDsoQ75UIgBZj7obk93wkdxsUfT/JCrJYhmp8uNWeV05Kr5n3JSAnpV+Vh7ABN2X858PrPcV3ZWOstwvFYdrC4v31NtsuNVl0Hhw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:cc9af9a9-b25a-4ca5-adfc-4dc6da294274,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:c41672c6-8a73-4871-aac2-7b886d064f36,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9ac913a0d98011f0a52f393f94899d25-20251214
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 352793620; Sun, 14 Dec 2025 23:38:02 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 15 Dec 2025 14:37:59 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 14:37:59 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76 v2 3/7] wifi: mt76: mt7996: set specific BSSINFO and STAREC commands after channel switch
Date: Mon, 15 Dec 2025 14:37:24 +0800
Message-ID: <20251215063728.3013365-3-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251215063728.3013365-1-shayne.chen@mediatek.com>
References: <20251215063728.3013365-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_223808_882389_045EFD29 
X-CRM114-Status: GOOD (  11.37  )
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

From: StanleyYP Wang <StanleyYP.Wang@mediatek.com>

After channel switch, some tags of BSSINFO (rfch) and STAREC (bfer,
rate_ctrl) commands should also be updated. Otherwise, a BSS might not be
able to transmit with its peer using correct bandwidth.

Co-developed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7996/main.c  | 14 ++++-
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 59 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  3 +
 3 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 18c6cdaae20b..afc0ca3f3939 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -962,12 +962,24 @@ mt7996_post_channel_switch(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	struct cfg80211_chan_def *chandef = &link_conf->chanreq.oper;
 	struct mt7996_dev *dev = mt7996_hw_dev(hw);
 	struct mt7996_phy *phy = mt7996_band_phy(dev, chandef->chan->band);
-	int ret;
+	struct mt7996_vif_link *link;
+	int ret = -EINVAL;
 
 	mutex_lock(&dev->mt76.mutex);
 
+	link = mt7996_vif_conf_link(dev, vif, link_conf);
+	if (!link)
+		goto out;
+
+	ret = mt7996_mcu_update_bss_rfch(phy, link);
+	if (ret)
+		goto out;
+
+	ieee80211_iterate_stations_mtx(hw, mt7996_mcu_update_sta_rec_bw, link);
+
 	ret = mt7996_mcu_rdd_resume_tx(phy);
 
+out:
 	mutex_unlock(&dev->mt76.mutex);
 
 	return ret;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 81d09d0e924f..0e514b818d0f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -1231,6 +1231,22 @@ int mt7996_mcu_add_bss_info(struct mt7996_phy *phy, struct ieee80211_vif *vif,
 				     MCU_WMWA_UNI_CMD(BSS_INFO_UPDATE), true);
 }
 
+int mt7996_mcu_update_bss_rfch(struct mt7996_phy *phy, struct mt7996_vif_link *link)
+{
+	struct mt7996_dev *dev = phy->dev;
+	struct sk_buff *skb;
+
+	skb = __mt7996_mcu_alloc_bss_req(&dev->mt76, &link->mt76,
+					 MT7996_BSS_UPDATE_MAX_SIZE);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	mt7996_mcu_bss_rfch_tlv(skb, phy);
+
+	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
+				     MCU_WMWA_UNI_CMD(BSS_INFO_UPDATE), true);
+}
+
 int mt7996_mcu_set_timing(struct mt7996_phy *phy, struct ieee80211_vif *vif,
 			  struct ieee80211_bss_conf *link_conf)
 {
@@ -2590,6 +2606,49 @@ int mt7996_mcu_teardown_mld_sta(struct mt7996_dev *dev,
 				     MCU_WMWA_UNI_CMD(STA_REC_UPDATE), true);
 }
 
+void mt7996_mcu_update_sta_rec_bw(void *data, struct ieee80211_sta *sta)
+{
+	struct mt7996_vif_link *link = (struct mt7996_vif_link *)data;
+	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
+	struct mt7996_sta_link *msta_link;
+	struct mt7996_dev *dev;
+	struct ieee80211_bss_conf *link_conf;
+	struct ieee80211_link_sta *link_sta;
+	struct ieee80211_vif *vif;
+	struct sk_buff *skb;
+	int link_id;
+
+	if (link->mt76.mvif != &msta->vif->mt76)
+		return;
+
+	dev = link->phy->dev;
+	link_id = link->msta_link.wcid.link_id;
+	link_sta = link_sta_dereference_protected(sta, link_id);
+	if (!link_sta)
+		return;
+
+	msta_link = mt76_dereference(msta->link[link_id], &dev->mt76);
+	if (!msta_link)
+		return;
+
+	vif = container_of((void *)msta->vif, struct ieee80211_vif, drv_priv);
+	link_conf = link_conf_dereference_protected(vif, link_id);
+	if (!link_conf)
+		return;
+
+	skb = __mt76_connac_mcu_alloc_sta_req(&dev->mt76, &link->mt76,
+					      &msta_link->wcid,
+					      MT7996_STA_UPDATE_MAX_SIZE);
+	if (IS_ERR(skb))
+		return;
+
+	mt7996_mcu_sta_bfer_tlv(dev, skb, link_conf, link_sta, link);
+	mt7996_mcu_sta_rate_ctrl_tlv(skb, dev, vif, link_conf, link_sta, link);
+
+	mt76_mcu_skb_send_msg(&dev->mt76, skb,
+			      MCU_WMWA_UNI_CMD(STA_REC_UPDATE), true);
+}
+
 static int
 mt7996_mcu_sta_key_tlv(struct mt76_dev *dev, struct mt76_wcid *wcid,
 		       struct sk_buff *skb,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index d31864f973cc..8f1043159f58 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -670,6 +670,8 @@ int mt7996_mcu_add_bss_info(struct mt7996_phy *phy, struct ieee80211_vif *vif,
 			    struct ieee80211_bss_conf *link_conf,
 			    struct mt76_vif_link *mlink,
 			    struct mt7996_sta_link *msta_link, int enable);
+int mt7996_mcu_update_bss_rfch(struct mt7996_phy *phy,
+			       struct mt7996_vif_link *link);
 int mt7996_mcu_add_sta(struct mt7996_dev *dev,
 		       struct ieee80211_bss_conf *link_conf,
 		       struct ieee80211_link_sta *link_sta,
@@ -679,6 +681,7 @@ int mt7996_mcu_add_sta(struct mt7996_dev *dev,
 int mt7996_mcu_teardown_mld_sta(struct mt7996_dev *dev,
 				struct mt7996_vif_link *link,
 				struct mt7996_sta_link *msta_link);
+void mt7996_mcu_update_sta_rec_bw(void *data, struct ieee80211_sta *sta);
 int mt7996_mcu_add_tx_ba(struct mt7996_dev *dev,
 			 struct ieee80211_ampdu_params *params,
 			 struct ieee80211_vif *vif, bool enable);
-- 
2.51.0


