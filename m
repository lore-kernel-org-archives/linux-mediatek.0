Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F71DC021BB
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2025 00:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/1XBpgqtT7Jisq7gLwkmRDRZc9Mx4bguTuo9qD7Avjc=; b=jIlqtujFLTFxDJExTRwnbE1DHu
	Xx1Sne/tHsNcq/AQevlxVcjm6Sg+O0GKCS0HUPXR+CAbK1Bl3vQtu96hoqgeSbQw+9xBPGAiOZyTh
	Z2y3edAvxHBb9qlAJAEsaonVbqygNnwyEZlSf/Mc8IM76UPKFK8HAP4Z76C6unVu7sc/Q8iDdXI1z
	NLPW25Wk5DkbX7ecpovM/KPG33rkB0JakH45kcWLW/0G9t9+kV2NH2zCPBq+dOiO7W7ws4Wr084wQ
	PcBDv5LkGLZ17PIuts2GWkwdGzMG/QJ7tAVVvJ2cfaRkO5DjFp4vH2asN54CWf4k3yV6Ly/zIJkwQ
	9hs6mOXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn5Ph-00000001t1k-1t6i;
	Wed, 26 Feb 2025 00:36:37 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn5Pe-00000001t0u-1ZzI
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Feb 2025 00:36:35 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2b1a9cbfc8dso1257814fac.2
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Feb 2025 16:36:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740530193; x=1741134993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/1XBpgqtT7Jisq7gLwkmRDRZc9Mx4bguTuo9qD7Avjc=;
        b=X38n4BaqeNyNE2OCf1l7zyLklg+mxP7W5ZO/liwbUpCV8bgPWjDbNkFkCNBCdUCIFg
         jDKayocGCpP8usp4HOtbN5Z1gzxzI577HbgDe1iuVSB3GyJLTOF+9DGGSQIu7A7IvIpd
         mBOg2B5xBLwSFqOFeSFgx/aLlvhR7zNPmhH4kF+PZrDuj2xY6lO8mLyHpRPyvKh4+SA9
         9SyV8opeFdOpKQzGctm4uL4KTM/tHZwBfArY60D3f4TdTdIMpvRyiBmKvPubv8e+vk5j
         E5Z1ks15zkHKeD14GDP6LssnAF+RjXqYUtHSDsrAynPIgbjmH5bg1E/KaaQHqNnpL/qf
         rVDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV0ehNrdb8Lh20Lgt2guCreAvrW2pEUyiF/I0K3ZkVocN/xfkV7jFQ6q6SxSTyhX/bsgy/HyzRwrlfmOEqyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxcGO+GTwZE7eFwyFh8LFw2a+ILMiL7ivBPeRdeNv2bOY5l+EQ+
	uS7zLy6bnJFoAA4GQ7MkSUHBXp8Gk3NLa79AJKDSLaLoOaDarZH8
X-Gm-Gg: ASbGncvf+4IFsuADBopajNB1QMfD5+YpstPvNxnsTUsT3xFTidNpox7p4Aq1ILjwD2C
	zn+0iVbFmTh/iKHCVxt20wr8c+hk4ODuyp1HF5JP1tWLk/0KvkGz2JaWJNWb8jolIq6NZSoeKsk
	4Rbhk0ID1un1/KaQKpQpDPb95LxkCOp3caGwDbR98Emnte49DxFu2y7Kvr9U+IvSuN6tCvI85tI
	6O0+Zodt9NHXOTIpFl57dfIiO8tDftRw3CplflIcWkFbV+DnIAQhncImK8NaCQ7qPd1F8iv72oH
	ssBUySUpD0pmBZumMQUL0HGmm3mv0lT5hhlMGQQfl2o=
X-Google-Smtp-Source: AGHT+IHQd94LMGWgRxKw5KrTvuxsUUJxnmjSeo3lNBOjf2cJcBcupyo6xLqDI9An5k+L2lz6Ru1pTQ==
X-Received: by 2002:a05:6871:5317:b0:2bc:9116:8856 with SMTP id 586e51a60fabf-2bd5187e0f5mr14532741fac.36.1740530193497;
        Tue, 25 Feb 2025 16:36:33 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7289dedfcd8sm507149a34.16.2025.02.25.16.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 16:36:32 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH v3 5/6] wifi: mt76: mt7925: integrate *mlo_sta_cmd and *sta_cmd
Date: Tue, 25 Feb 2025 16:35:55 -0800
Message-Id: <20250226003556.82644-5-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226003556.82644-1-sean.wang@kernel.org>
References: <20250226003556.82644-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_163634_419379_B2F8A5BB 
X-CRM114-Status: GOOD (  14.36  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

Integrate *mlo_sta_cmd and *sta_cmd for the MLO firmware.

Fixes: 86c051f2c418 ("wifi: mt76: mt7925: enabling MLO when the firmware supports it")
Cc: stable@vger.kernel.org
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2: generate the patch based on the latest mt76 tree
v3: fixed merge error
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |  64 +--------
 .../wireless/mediatek/mt76/mt7925/mcu.c.rej   | 131 +++++++++++++-----
 2 files changed, 104 insertions(+), 91 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 4c133200c70b..34e7165d1a0f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1820,49 +1820,6 @@ mt7925_mcu_sta_mld_tlv(struct sk_buff *skb,
 	}
 }
 
-static int
-mt7925_mcu_sta_cmd(struct mt76_phy *phy,
-		   struct mt76_sta_cmd_info *info)
-{
-	struct mt76_vif_link *mvif = (struct mt76_vif_link *)info->vif->drv_priv;
-	struct mt76_dev *dev = phy->dev;
-	struct sk_buff *skb;
-	int conn_state;
-
-	skb = __mt76_connac_mcu_alloc_sta_req(dev, mvif, info->wcid,
-					      MT7925_STA_UPDATE_MAX_SIZE);
-	if (IS_ERR(skb))
-		return PTR_ERR(skb);
-
-	conn_state = info->enable ? CONN_STATE_PORT_SECURE :
-				    CONN_STATE_DISCONNECT;
-	if (info->link_sta)
-		mt76_connac_mcu_sta_basic_tlv(dev, skb, info->link_conf,
-					      info->link_sta,
-					      conn_state, info->newly);
-	if (info->link_sta && info->enable) {
-		mt7925_mcu_sta_phy_tlv(skb, info->vif, info->link_sta);
-		mt7925_mcu_sta_ht_tlv(skb, info->link_sta);
-		mt7925_mcu_sta_vht_tlv(skb, info->link_sta);
-		mt76_connac_mcu_sta_uapsd(skb, info->vif, info->link_sta->sta);
-		mt7925_mcu_sta_amsdu_tlv(skb, info->vif, info->link_sta);
-		mt7925_mcu_sta_he_tlv(skb, info->link_sta);
-		mt7925_mcu_sta_he_6g_tlv(skb, info->link_sta);
-		mt7925_mcu_sta_eht_tlv(skb, info->link_sta);
-		mt7925_mcu_sta_rate_ctrl_tlv(skb, info->vif,
-					     info->link_sta);
-		mt7925_mcu_sta_state_v2_tlv(phy, skb, info->link_sta,
-					    info->vif, info->rcpi,
-					    info->state);
-		mt7925_mcu_sta_mld_tlv(skb, info->vif, info->link_sta->sta);
-	}
-
-	if (info->enable)
-		mt7925_mcu_sta_hdr_trans_tlv(skb, info->vif, info->link_sta);
-
-	return mt76_mcu_skb_send_msg(dev, skb, info->cmd, true);
-}
-
 static void
 mt7925_mcu_sta_remove_tlv(struct sk_buff *skb)
 {
@@ -1875,8 +1832,8 @@ mt7925_mcu_sta_remove_tlv(struct sk_buff *skb)
 }
 
 static int
-mt7925_mcu_mlo_sta_cmd(struct mt76_phy *phy,
-		       struct mt76_sta_cmd_info *info)
+mt7925_mcu_sta_cmd(struct mt76_phy *phy,
+		   struct mt76_sta_cmd_info *info)
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)info->vif->drv_priv;
 	struct mt76_dev *dev = phy->dev;
@@ -1890,12 +1847,10 @@ mt7925_mcu_mlo_sta_cmd(struct mt76_phy *phy,
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
 
-	if (info->enable)
+	if (info->enable && info->link_sta) {
 		mt76_connac_mcu_sta_basic_tlv(dev, skb, info->link_conf,
 					      info->link_sta,
 					      info->enable, info->newly);
-
-	if (info->enable && info->link_sta) {
 		mt7925_mcu_sta_phy_tlv(skb, info->vif, info->link_sta);
 		mt7925_mcu_sta_ht_tlv(skb, info->link_sta);
 		mt7925_mcu_sta_vht_tlv(skb, info->link_sta);
@@ -1946,7 +1901,6 @@ int mt7925_mcu_sta_update(struct mt792x_dev *dev,
 	};
 	struct mt792x_sta *msta;
 	struct mt792x_link_sta *mlink;
-	int err;
 
 	if (link_sta) {
 		msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
@@ -1954,17 +1908,7 @@ int mt7925_mcu_sta_update(struct mt792x_dev *dev,
 	}
 	info.wcid = link_sta ? &mlink->wcid : &mvif->sta.deflink.wcid;
 
-	if (link_sta)
-		info.newly = state != MT76_STA_INFO_STATE_ASSOC;
-	else
-		info.newly = state == MT76_STA_INFO_STATE_ASSOC ? false : true;
-
-	if (ieee80211_vif_is_mld(vif))
-		err = mt7925_mcu_mlo_sta_cmd(&dev->mphy, &info);
-	else
-		err = mt7925_mcu_sta_cmd(&dev->mphy, &info);
-
-	return err;
+	return mt7925_mcu_sta_cmd(&dev->mphy, &info);
 }
 
 int mt7925_mcu_set_beacon_filter(struct mt792x_dev *dev,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c.rej b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c.rej
index 3cdfc4e9a45f..dea7e7b3755a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c.rej
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c.rej
@@ -1,35 +1,104 @@
 --- drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
 +++ drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
-@@ -2176,13 +2178,26 @@ void mt7925_mcu_bss_rlm_tlv(struct sk_buff *skb, struct mt76_phy *phy,
+@@ -1771,49 +1771,6 @@ mt7925_mcu_sta_mld_tlv(struct sk_buff *skb,
+ 	}
+ }
  
- 	tlv = mt76_connac_mcu_add_tlv(skb, UNI_BSS_INFO_RLM, sizeof(*req));
- 	req = (struct bss_rlm_tlv *)tlv;
--	req->control_channel = chandef->chan->hw_value,
--	req->center_chan = ieee80211_frequency_to_channel(freq1),
--	req->center_chan2 = ieee80211_frequency_to_channel(freq2),
--	req->tx_streams = hweight8(phy->antenna_mask),
-+	req->control_channel = chandef->chan->hw_value;
-+	req->center_chan = ieee80211_frequency_to_channel(freq1);
-+	req->center_chan2 = 0;
-+	req->tx_streams = hweight8(phy->antenna_mask);
- 	req->ht_op_info = 4, /* set HT 40M allowed */
--	req->rx_streams = hweight8(phy->antenna_mask),
--	req->band = band;
-+	req->rx_streams = hweight8(phy->antenna_mask);
-+	req->center_chan2 = 0;
-+	req->sco = 0;
-+
-+	switch (band) {
-+	case NL80211_BAND_2GHZ:
-+		req->band = 1;
-+		break;
-+	case NL80211_BAND_5GHZ:
-+		req->band = 2;
-+		break;
-+	case NL80211_BAND_6GHZ:
-+		req->band = 3;
-+		break;
-+	}
+-static int
+-mt7925_mcu_sta_cmd(struct mt76_phy *phy,
+-		   struct mt76_sta_cmd_info *info)
+-{
+-	struct mt76_vif *mvif = (struct mt76_vif *)info->vif->drv_priv;
+-	struct mt76_dev *dev = phy->dev;
+-	struct sk_buff *skb;
+-	int conn_state;
+-
+-	skb = __mt76_connac_mcu_alloc_sta_req(dev, mvif, info->wcid,
+-					      MT7925_STA_UPDATE_MAX_SIZE);
+-	if (IS_ERR(skb))
+-		return PTR_ERR(skb);
+-
+-	conn_state = info->enable ? CONN_STATE_PORT_SECURE :
+-				    CONN_STATE_DISCONNECT;
+-	if (info->link_sta)
+-		mt76_connac_mcu_sta_basic_tlv(dev, skb, info->vif,
+-					      info->link_sta,
+-					      conn_state, info->newly);
+-	if (info->link_sta && info->enable) {
+-		mt7925_mcu_sta_phy_tlv(skb, info->vif, info->link_sta);
+-		mt7925_mcu_sta_ht_tlv(skb, info->link_sta);
+-		mt7925_mcu_sta_vht_tlv(skb, info->link_sta);
+-		mt76_connac_mcu_sta_uapsd(skb, info->vif, info->link_sta->sta);
+-		mt7925_mcu_sta_amsdu_tlv(skb, info->vif, info->link_sta);
+-		mt7925_mcu_sta_he_tlv(skb, info->link_sta);
+-		mt7925_mcu_sta_he_6g_tlv(skb, info->link_sta);
+-		mt7925_mcu_sta_eht_tlv(skb, info->link_sta);
+-		mt7925_mcu_sta_rate_ctrl_tlv(skb, info->vif,
+-					     info->link_sta);
+-		mt7925_mcu_sta_state_v2_tlv(phy, skb, info->link_sta,
+-					    info->vif, info->rcpi,
+-					    info->state);
+-		mt7925_mcu_sta_mld_tlv(skb, info->vif, info->link_sta->sta);
+-	}
+-
+-	if (info->enable)
+-		mt7925_mcu_sta_hdr_trans_tlv(skb, info->vif, info->link_sta);
+-
+-	return mt76_mcu_skb_send_msg(dev, skb, info->cmd, true);
+-}
+-
+ static void
+ mt7925_mcu_sta_remove_tlv(struct sk_buff *skb)
+ {
+@@ -1826,8 +1783,8 @@ mt7925_mcu_sta_remove_tlv(struct sk_buff *skb)
+ }
  
- 	switch (chandef->width) {
- 	case NL80211_CHAN_WIDTH_40:
+ static int
+-mt7925_mcu_mlo_sta_cmd(struct mt76_phy *phy,
+-		       struct mt76_sta_cmd_info *info)
++mt7925_mcu_sta_cmd(struct mt76_phy *phy,
++		  struct mt76_sta_cmd_info *info)
+ {
+ 	struct mt792x_vif *mvif = (struct mt792x_vif *)info->vif->drv_priv;
+ 	struct mt76_dev *dev = phy->dev;
+@@ -1841,12 +1798,10 @@ mt7925_mcu_mlo_sta_cmd(struct mt76_phy *phy,
+ 	if (IS_ERR(skb))
+ 		return PTR_ERR(skb);
+ 
+-	if (info->enable)
++	if (info->enable && info->link_sta) {
+ 		mt76_connac_mcu_sta_basic_tlv(dev, skb, info->vif,
+ 					      info->link_sta,
+ 					      info->enable, info->newly);
+-
+-	if (info->enable && info->link_sta) {
+ 		mt7925_mcu_sta_phy_tlv(skb, info->vif, info->link_sta);
+ 		mt7925_mcu_sta_ht_tlv(skb, info->link_sta);
+ 		mt7925_mcu_sta_vht_tlv(skb, info->link_sta);
+@@ -1896,7 +1851,6 @@ int mt7925_mcu_sta_update(struct mt792x_dev *dev,
+ 	};
+ 	struct mt792x_sta *msta;
+ 	struct mt792x_link_sta *mlink;
+-	int err;
+ 
+ 	if (link_sta) {
+ 		msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
+@@ -1904,17 +1858,7 @@ int mt7925_mcu_sta_update(struct mt792x_dev *dev,
+ 	}
+ 	info.wcid = link_sta ? &mlink->wcid : &mvif->sta.deflink.wcid;
+ 
+-	if (link_sta)
+-		info.newly = state != MT76_STA_INFO_STATE_ASSOC;
+-	else
+-		info.newly = state == MT76_STA_INFO_STATE_ASSOC ? false : true;
+-
+-	if (ieee80211_vif_is_mld(vif))
+-		err = mt7925_mcu_mlo_sta_cmd(&dev->mphy, &info);
+-	else
+-		err = mt7925_mcu_sta_cmd(&dev->mphy, &info);
+-
+-	return err;
++	return mt7925_mcu_sta_cmd(&dev->mphy, &info);
+ }
+ 
+ int mt7925_mcu_set_beacon_filter(struct mt792x_dev *dev,
-- 
2.25.1


