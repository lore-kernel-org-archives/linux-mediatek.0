Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB68C2BD09
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+USdL7ArJsY57rZRvrCt0BwNw+zeRk0nzAefn/Xndk=; b=aqkU3LXLT6tWf72z6l5zNsK5nH
	8QZQsp8Lq5jGvOqBprjykv8VxNj2ab9Bi9iJ/1GwNvvSlNscuAdnpRQsdH3K2gqOyQOmibzf/05JK
	VALQ5GS2Sw9B1dbQjUoqOClReghaXUNSAEZTQVfNkG607AYWuBknW/esg2KH8Oaa9p17XQ3SyQByD
	lA2DYgVGLc5B1Xo8XNvH6nZY576CskpIu//bm4hkygLtqcw7TOehtfEV8nZ9g4q3enxEEd031F4QR
	LUvnD4jlNIcCLLQDEgpaqyl1ejEZh1J8rf72i5j/CH9yxm65K+tdrGX5zMoHKw33FlpYlD02d9Y8H
	wKOMQ6ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0nE-0000000HYE3-0Ac0;
	Sat, 06 Jul 2024 08:29:16 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0nA-0000000HYBS-2eqQ
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:29:14 +0000
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3d926517363so7767b6e.3
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254552; x=1720859352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1+USdL7ArJsY57rZRvrCt0BwNw+zeRk0nzAefn/Xndk=;
        b=NcKBsY3YcpCpSFArtqx5ruMry03LRujRIweWA7xNbGhmsFeads7OMd/t6ExeAB9/xc
         4V91sywc/c/hKyZsxmmGLw1Tzd/Rv0RGTT8M2ryzSj2cmBuo8K9CY0BAfWwAfhtmeFjV
         V0qGIWJfEz1v+4dX3JZxyBBiNynJ06LFVlhLjD6GWNZoVQzVRFF+2hFZYr1+TvTwrNYd
         ppbW6FD/vpxs0XbVcgkRjw8GtG/fOELPvYvhJ+aeRjnIc87DU5BiBalR+lRr9zNy2fBa
         vr39ZGTxGXM/zbW++z1J9ZqTVVg/ljkCve44sc9BbT+Mywj1OE8P0rl2yTSD/S96ZTb9
         aaLw==
X-Forwarded-Encrypted: i=1; AJvYcCXbEba6vBhqw1+PMx/PxU+/GY1cTv023VjqV3zcsiyagtTeeQ3GFQZHN5jYYqx9K4NxbFYYvvwQRYSYQIhVE0vaaJCjLq9AxqXx6Ynm76yYsVoA
X-Gm-Message-State: AOJu0YzPrO72dEUUMoB5tJ+POTs5Jv28yLLsrPSYLiuGkmt2GDjWef26
	P/kCno7SJdLLrkQD8pq/ITxa8D2gwlRPz7Zg38ErN9UmhBHEaJ2i
X-Google-Smtp-Source: AGHT+IGP8iOYD5INfWsaL7Vr8mfVbnuHHO04NYvHLKOWfybrC1drsFZxus7lkGSvAzTF3rPmzj+Ipw==
X-Received: by 2002:a05:6871:5229:b0:25e:dce:491b with SMTP id 586e51a60fabf-25e2b8b79abmr6843926fac.1.1720254551753;
        Sat, 06 Jul 2024 01:29:11 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:29:10 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 29/37] wifi: mt76: mt7925: update mt7925_mcu_sta_update for MLO
Date: Sat,  6 Jul 2024 01:28:09 -0700
Message-Id: <2e25bfc2d8aa503ecd1ba8099c6e54dce0c27b99.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012912_741245_3244A573 
X-CRM114-Status: GOOD (  13.75  )
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
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 68 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  3 +-
 3 files changed, 78 insertions(+), 2 deletions(-)

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
index 2ffd46f16921..28e974195be7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1812,6 +1812,66 @@ mt7925_mcu_sta_cmd(struct mt76_phy *phy,
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
+	struct mt792x_vif *mvif = (struct mt792x_vif *)info->vif->drv_priv;
+	struct mt76_dev *dev = phy->dev;
+	struct mt792x_bss_conf *mconf;
+	struct sk_buff *skb;
+
+	mconf = mt792x_vif_to_link(mvif, info->wcid->link_id);
+
+	skb = __mt76_connac_mcu_alloc_sta_req(dev, &mconf->mt76, info->wcid,
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
@@ -1830,6 +1890,7 @@ int mt7925_mcu_sta_update(struct mt792x_dev *dev,
 	};
 	struct mt792x_sta *msta;
 	struct mt792x_link_sta *mlink;
+	int err;
 
 	if (link_sta) {
 		msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
@@ -1838,7 +1899,12 @@ int mt7925_mcu_sta_update(struct mt792x_dev *dev,
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
index 7b0c6937f918..a97e5b539ab9 100644
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


