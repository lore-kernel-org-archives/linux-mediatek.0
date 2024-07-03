Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C6AC31D97
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 21:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6qob4+aEz9AnxDvyJPADamvZqFlBJwBhBj073zgKUw=; b=MXgxI8FqbLsWafc4GqJHr2jx/Q
	RSY4xQgbIZ63PrPCuioaJFTSz8NjgH95uKnZCpaD8mTuAVrbm7AverN7ucv/+jlVW10rNovK27o+O
	22DV/x7tRXayFR5g2OJCTmRe412Qb0eELdkY4FLyMiR4Sp5qryiOBCSYtqWeF8HaTQ6FJaQ9wveDL
	nrudTR39wgQxAkST3UK9Rd02g7i9kSmMPfXMnJoScGxkUvhiOMnUmJKBUZo1jol/XTmhijNoF95re
	FXT+YTIEVl0zMha9q25xgP7H/WgJTnx8Cql0COXbpXHRj4h2bz8tBe2XXhm2zEbqr+bpbZTIg88cR
	acJkFusA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7lU-0000000BXSK-02sj;
	Wed, 03 Jul 2024 21:43:48 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7lQ-0000000BXQg-49T1
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 21:43:46 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-25cd49906aeso4013fac.2
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 14:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720043024; x=1720647824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B6qob4+aEz9AnxDvyJPADamvZqFlBJwBhBj073zgKUw=;
        b=aYS3XOtbXDI/scdQsIiTq5nKtZnjIAZEcahUaEmL4xJjD25LKa5xTRMXwdtKV7jun0
         YmFhqdPH7/RNadBwZrssfxUf6exJMEjNKVyVkVNui5c5rFUWOrRVCP3iDzBJV5JgO0g7
         SK4uq2uNP1FTxuXvxmu7gDBCR6duIxU/bgGUtac8dJ5LAr4ZcgzBwBEMlHMTfkDYdyEQ
         BHeUuO+hbPf47zDL6t93CjgmA47VJRYSAC7KnTe2yE6L1scBygCrE7XivPmkXslWFYmt
         kKrnu2RuX7Kp8gfOZHMAyURqqLer+fB6Q+dFFsnnO4Ez7MKax4Istg+3TIsypctphZgW
         klLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSCEHK9xQYo8AQBDcGNNpkLOE1bYuoTBA/4WYKtvmSvQ9Jarhhf5lRmRm4HK/wZYVbtaZN32zh8okHV8KB+r17CoCikgOH0WfF2tgM+2QQZ1UF
X-Gm-Message-State: AOJu0YxPkz1Qoelz8I3Dghs7JmnBLNKwJBqKYAymbXl95HbXEjv3PMk8
	qXig31XqUv7lHteddaZTutCSB+64JHbIgvSa7cUNAXpig0kezB4P
X-Google-Smtp-Source: AGHT+IFRqrqB0oJS3To8CcpUlTALffwBa/HcXjrOdTq70HVTagouqm9arBdBlmJYNrdzs27Y8+RfEA==
X-Received: by 2002:a05:6830:68cd:b0:700:d697:6ca7 with SMTP id 46e09a7af769-70207554355mr12585737a34.0.1720043022162;
        Wed, 03 Jul 2024 14:43:42 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b20953sm2111417a34.54.2024.07.03.14.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:43:39 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 26/29] wifi: mt76: mt7925: update mt7925_mcu_sta_update for MLO
Date: Wed,  3 Jul 2024 14:42:31 -0700
Message-Id: <8b39975133d1c41ff724669562bd340eb2894617.1720042294.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720042294.git.sean.wang@kernel.org>
References: <cover.1720042294.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_144345_058120_198872BF 
X-CRM114-Status: GOOD (  13.82  )
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

update mt7925_mcu_sta_update for the MLO-enabled firmware.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  9 +++
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 65 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  3 +-
 3 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index e636b033b87e..9329c959674f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -545,6 +545,13 @@ struct sta_rec_muru {
 	} mimo_ul;
 } __packed;
 
+struct sta_rec_remove {
+	__le16 tag;
+	__le16 len;
+	u8 action;
+	u8 pad[3];
+} __packed;
+
 struct sta_phy {
 	u8 type;
 	u8 flag;
@@ -814,6 +821,8 @@ enum {
 	STA_REC_HE_V2 = 0x19,
 	STA_REC_MLD = 0x20,
 	STA_REC_EHT = 0x22,
+	STA_REC_MLD_OFF = 0x23,
+	STA_REC_REMOVE = 0x25,
 	STA_REC_PN_INFO = 0x26,
 	STA_REC_KEY_V3 = 0x27,
 	STA_REC_HDRT = 0x28,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 218efe543dbb..dcb8c506543b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1805,6 +1805,63 @@ mt7925_mcu_sta_cmd(struct mt76_phy *phy,
 	return mt76_mcu_skb_send_msg(dev, skb, info->cmd, true);
 }
 
+static void
+mt7925_mcu_sta_remove_tlv(struct sk_buff *skb)
+{
+	struct sta_rec_remove *rem;
+	struct tlv *tlv;
+
+	tlv = mt76_connac_mcu_add_tlv(skb, 0x25, sizeof(*rem));
+	rem = (struct sta_rec_remove *)tlv;
+	rem->action = 0;
+}
+
+static int
+mt7925_mcu_mlo_sta_cmd(struct mt76_phy *phy,
+		       struct mt76_sta_cmd_info *info)
+{
+	struct mt76_vif *mvif = (struct mt76_vif *)info->vif->drv_priv;
+	struct mt76_dev *dev = phy->dev;
+	struct sk_buff *skb;
+
+	skb = __mt76_connac_mcu_alloc_sta_req(dev, mvif, info->wcid,
+					      MT7925_STA_UPDATE_MAX_SIZE);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	if (info->enable)
+		mt76_connac_mcu_sta_basic_tlv(dev, skb, info->vif,
+					      info->link_sta,
+					      info->enable, info->newly);
+
+	if (info->enable && info->link_sta) {
+		mt7925_mcu_sta_phy_tlv(skb, info->vif, info->link_sta);
+		mt7925_mcu_sta_ht_tlv(skb, info->link_sta);
+		mt7925_mcu_sta_vht_tlv(skb, info->link_sta);
+		mt76_connac_mcu_sta_uapsd(skb, info->vif, info->link_sta->sta);
+		mt7925_mcu_sta_amsdu_tlv(skb, info->vif, info->link_sta);
+		mt7925_mcu_sta_he_tlv(skb, info->link_sta);
+		mt7925_mcu_sta_he_6g_tlv(skb, info->link_sta);
+		mt7925_mcu_sta_eht_tlv(skb, info->link_sta);
+		mt7925_mcu_sta_rate_ctrl_tlv(skb, info->vif,
+					     info->link_sta);
+		mt7925_mcu_sta_state_v2_tlv(phy, skb, info->link_sta,
+					    info->vif, info->rcpi,
+					    info->state);
+		if (info->state != MT76_STA_INFO_STATE_NONE)
+			mt7925_mcu_sta_mld_tlv(skb, info->vif, info->link_sta->sta);
+		mt7925_mcu_sta_hdr_trans_tlv(skb, info->vif, info->link_sta);
+	}
+
+	if (!info->enable) {
+		mt7925_mcu_sta_remove_tlv(skb);
+		mt76_connac_mcu_add_tlv(skb, STA_REC_MLD_OFF,
+					sizeof(struct tlv));
+	}
+
+	return mt76_mcu_skb_send_msg(dev, skb, info->cmd, true);
+}
+
 int mt7925_mcu_sta_update(struct mt792x_dev *dev,
 			  struct ieee80211_link_sta *link_sta,
 			  struct ieee80211_vif *vif, bool enable,
@@ -1823,6 +1880,7 @@ int mt7925_mcu_sta_update(struct mt792x_dev *dev,
 	};
 	struct mt792x_sta *msta;
 	struct mt792x_link_sta *mlink;
+	int err;
 
 	if (link_sta) {
 		msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
@@ -1831,7 +1889,12 @@ int mt7925_mcu_sta_update(struct mt792x_dev *dev,
 	info.wcid = link_sta ? &mlink->wcid : &mvif->sta.deflink.wcid;
 	info.newly = link_sta ? state != MT76_STA_INFO_STATE_ASSOC : true;
 
-	return mt7925_mcu_sta_cmd(&dev->mphy, &info);
+	if (ieee80211_vif_is_mld(vif))
+		err = mt7925_mcu_mlo_sta_cmd(&dev->mphy, &info);
+	else
+		err = mt7925_mcu_sta_cmd(&dev->mphy, &info);
+
+	return err;
 }
 
 int mt7925_mcu_set_beacon_filter(struct mt792x_dev *dev,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index 545f6b2d524c..8a0196699230 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -492,7 +492,8 @@ struct bss_rlm_tlv {
 					 sizeof(struct sta_rec_eht) +		\
 					 sizeof(struct sta_rec_hdr_trans) +	\
 					 sizeof(struct sta_rec_mld) +		\
-					 sizeof(struct tlv))
+					 sizeof(struct tlv) * 2 +		\
+					 sizeof(struct sta_rec_remove))
 
 #define MT7925_BSS_UPDATE_MAX_SIZE	(sizeof(struct bss_req_hdr) +		\
 					 sizeof(struct mt76_connac_bss_basic_tlv) +	\
-- 
2.25.1


