Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A6CC3DA42
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qypwLl0mwyWHqK5nU8Jdk8GJ4MWZIRMXr/vMXZfeI4o=; b=KMmAw6a+srY859ldXmicry8jsF
	kE1xzIr5lYoDqX21hzRtyPdy8tFQITe2RW4r5AEKIMvLmMh6rx4ITuaeziwtUbrrJFcCjlAerdZQ1
	KW9JQMZwVV+gSH8R61nWDdFzJJinu5HyikJEWACO4T0M+ro8qclHtVwsVbRdH1pHM8a4hvjY7ECUv
	qUil5sWFnUqCXe6LNGflWg6omSVVyW8Zfdc+AZOHPS3mvWMcIh8U/o6Hj9D9PX3yx+3vEg8TeuAz7
	ljP1QVV7AbUvNsnpXtmXpkVMheKn2bxc3fe700RkYc890jpIl4/R+GEWLrA5EkJQcqz/u70DGWzGD
	zj/Gy3pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0n5-0000000HY8Q-32In;
	Sat, 06 Jul 2024 08:29:07 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0n3-0000000HY69-1hbV
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:29:06 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-254925e6472so364189fac.0
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:29:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254544; x=1720859344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qypwLl0mwyWHqK5nU8Jdk8GJ4MWZIRMXr/vMXZfeI4o=;
        b=eY3B4MtwZYW7zl0Bec+bMbtvHiEPFTxNeVLE0MpS4ZUYHpncEo/AxaIiKc89WXQwSf
         aJXWY9qdS45P/4vxDAILPTRwwUaecSD/R0maVpaBF84Q99ZtFB9ByodWgps+eJfE2Ld5
         r2sH0qJ/SveO/stwVeR0nyZdYBusSge94TG/B+xnAzwrVFTBDRWX4L7iqEDLx4bGP7sf
         CbeiYfdJZmqoAsDrx00VdJl/NOq/RRCkkNar60dw2NUL6iRjl2NEOeA6HvVu9o6VmVc4
         ob7Qr9lBv5Z2jRvcng9ffkdpy/KbHIJoUH83HixRNHs8K/zmDOEw4n9CkBVY9TQUFPC5
         9Irw==
X-Forwarded-Encrypted: i=1; AJvYcCX68y4kZH8m53orj559lghaa6JbLDVcSiQWYbRMMarNj+K5vVaUQHzW+7yqN27A+52xVcD/iSLyqgoxntzl69iRB4oSAkivhy9pSS8XTPE+FqUc
X-Gm-Message-State: AOJu0YwneWvQz41ZLBaeJ3dATCb6c66ksYDqoVqurr+6XCVOSzVIdq63
	21q8C1eyTcM5zxDwHdCc13QtuAB71sXlaPX/9zFlO9ZWffND02II
X-Google-Smtp-Source: AGHT+IFAu8L9vVPgIY5YNB7KoDorB2YZHSKha+nUgCsbxCPIACTWoPEncAfPQH/TpDKqm/w6cbkeBg==
X-Received: by 2002:a05:6871:24d9:b0:254:affe:5a08 with SMTP id 586e51a60fabf-25e2ba1b287mr6407103fac.2.1720254544551;
        Sat, 06 Jul 2024 01:29:04 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:29:03 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 25/37] wifi: mt76: mt7925: add mt7925_[assign,unassign]_vif_chanctx
Date: Sat,  6 Jul 2024 01:28:05 -0700
Message-Id: <15261879a16cb12674d6dea7703410baa6883799.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012905_480896_16F127B2 
X-CRM114-Status: GOOD (  16.25  )
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

add mt7925_[assign,unassign]_vif_chanctx to assign and unassign
chanctx to the specific link configuration. If the chctx is not
pass in the parameter, we will look up the channel information
from link_conf->chanreq.oper.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 75 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 17 +++--
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  1 +
 3 files changed, 82 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index dabfb8eca686..44d9da5aadd1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1730,8 +1730,13 @@ mt7925_change_chanctx(struct ieee80211_hw *hw,
 			mconf = &mvif->bss_conf;
 		}
 
-		if (mconf)
-			mt7925_mcu_set_chctx(mvif->phy->mt76, &mconf->mt76, ctx);
+		if (mconf) {
+			struct ieee80211_bss_conf *link_conf;
+
+			link_conf = mt792x_vif_to_bss_conf(vif, mconf->link_id);
+			mt7925_mcu_set_chctx(mvif->phy->mt76, &mconf->mt76,
+					     link_conf, ctx);
+		}
 	}
 
 	mt792x_mutex_release(phy->dev);
@@ -1978,6 +1983,68 @@ mt7925_change_sta_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	return err;
 }
 
+static int mt7925_assign_vif_chanctx(struct ieee80211_hw *hw,
+				     struct ieee80211_vif *vif,
+				     struct ieee80211_bss_conf *link_conf,
+				     struct ieee80211_chanctx_conf *ctx)
+{
+	struct mt792x_chanctx *mctx = (struct mt792x_chanctx *)ctx->drv_priv;
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+	struct ieee80211_bss_conf *pri_link_conf;
+	struct mt792x_bss_conf *mconf;
+
+	mutex_lock(&dev->mt76.mutex);
+
+	if (ieee80211_vif_is_mld(vif)) {
+		mconf = mt792x_vif_to_link(mvif, link_conf->link_id);
+		pri_link_conf = mt792x_vif_to_bss_conf(vif, mvif->deflink_id);
+
+		if (vif->type == NL80211_IFTYPE_STATION &&
+		    mconf == &mvif->bss_conf)
+			mt7925_mcu_add_bss_info(&dev->phy, NULL, pri_link_conf,
+						NULL, true);
+	} else {
+		mconf = &mvif->bss_conf;
+	}
+
+	mconf->mt76.ctx = ctx;
+	mctx->bss_conf = mconf;
+	mutex_unlock(&dev->mt76.mutex);
+
+	return 0;
+}
+
+static void mt7925_unassign_vif_chanctx(struct ieee80211_hw *hw,
+					struct ieee80211_vif *vif,
+					struct ieee80211_bss_conf *link_conf,
+					struct ieee80211_chanctx_conf *ctx)
+{
+	struct mt792x_chanctx *mctx = (struct mt792x_chanctx *)ctx->drv_priv;
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+	struct ieee80211_bss_conf *pri_link_conf;
+	struct mt792x_bss_conf *mconf;
+
+	mutex_lock(&dev->mt76.mutex);
+
+	if (ieee80211_vif_is_mld(vif)) {
+		mconf = mt792x_vif_to_link(mvif, link_conf->link_id);
+		pri_link_conf = mt792x_vif_to_bss_conf(vif, mvif->deflink_id);
+
+		if (vif->type == NL80211_IFTYPE_STATION &&
+		    mconf == &mvif->bss_conf)
+			mt7925_mcu_add_bss_info(&dev->phy, NULL, pri_link_conf,
+						NULL, false);
+	} else {
+		mconf = &mvif->bss_conf;
+	}
+
+	mctx->bss_conf = NULL;
+	mconf->mt76.ctx = NULL;
+	mutex_unlock(&dev->mt76.mutex);
+}
+
 const struct ieee80211_ops mt7925_ops = {
 	.tx = mt792x_tx,
 	.start = mt7925_start,
@@ -2030,8 +2097,8 @@ const struct ieee80211_ops mt7925_ops = {
 	.add_chanctx = mt7925_add_chanctx,
 	.remove_chanctx = mt7925_remove_chanctx,
 	.change_chanctx = mt7925_change_chanctx,
-	.assign_vif_chanctx = mt792x_assign_vif_chanctx,
-	.unassign_vif_chanctx = mt792x_unassign_vif_chanctx,
+	.assign_vif_chanctx = mt7925_assign_vif_chanctx,
+	.unassign_vif_chanctx = mt7925_unassign_vif_chanctx,
 	.mgd_prepare_tx = mt7925_mgd_prepare_tx,
 	.mgd_complete_tx = mt7925_mgd_complete_tx,
 	.vif_cfg_changed = mt7925_vif_cfg_changed,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 3d5eaeb96047..5979e47ec142 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2083,9 +2083,11 @@ mt7925_mcu_uni_add_beacon_offload(struct mt792x_dev *dev,
 
 static
 void mt7925_mcu_bss_rlm_tlv(struct sk_buff *skb, struct mt76_phy *phy,
+			    struct ieee80211_bss_conf *link_conf,
 			    struct ieee80211_chanctx_conf *ctx)
 {
-	struct cfg80211_chan_def *chandef = ctx ? &ctx->def : &phy->chandef;
+	struct cfg80211_chan_def *chandef = ctx ? &ctx->def :
+						  &link_conf->chanreq.oper;
 	int freq1 = chandef->center_freq1, freq2 = chandef->center_freq2;
 	enum nl80211_band band = chandef->chan->band;
 	struct bss_rlm_tlv *req;
@@ -2152,6 +2154,7 @@ __mt7925_mcu_alloc_bss_req(struct mt76_dev *dev, struct mt76_vif *mvif, int len)
 }
 
 int mt7925_mcu_set_chctx(struct mt76_phy *phy, struct mt76_vif *mvif,
+			 struct ieee80211_bss_conf *link_conf,
 			 struct ieee80211_chanctx_conf *ctx)
 {
 	struct sk_buff *skb;
@@ -2161,7 +2164,7 @@ int mt7925_mcu_set_chctx(struct mt76_phy *phy, struct mt76_vif *mvif,
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
 
-	mt7925_mcu_bss_rlm_tlv(skb, phy, ctx);
+	mt7925_mcu_bss_rlm_tlv(skb, phy, link_conf, ctx);
 
 	return mt76_mcu_skb_send_msg(phy->dev, skb,
 				     MCU_UNI_CMD(BSS_INFO_UPDATE), true);
@@ -2223,7 +2226,8 @@ mt7925_mcu_bss_basic_tlv(struct sk_buff *skb,
 {
 	struct ieee80211_vif *vif = link_conf->vif;
 	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
-	struct cfg80211_chan_def *chandef = ctx ? &ctx->def : &phy->chandef;
+	struct cfg80211_chan_def *chandef = ctx ? &ctx->def :
+						  &link_conf->chanreq.oper;
 	enum nl80211_band band = chandef->chan->band;
 	struct mt76_connac_bss_basic_tlv *basic_req;
 	struct mt792x_link_sta *mlink;
@@ -2348,7 +2352,8 @@ mt7925_mcu_bss_bmc_tlv(struct sk_buff *skb, struct mt792x_phy *phy,
 		       struct ieee80211_chanctx_conf *ctx,
 		       struct ieee80211_bss_conf *link_conf)
 {
-	struct cfg80211_chan_def *chandef = ctx ? &ctx->def : &phy->mt76->chandef;
+	struct cfg80211_chan_def *chandef = ctx ? &ctx->def :
+						  &link_conf->chanreq.oper;
 	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
 	enum nl80211_band band = chandef->chan->band;
 	struct mt76_vif *mvif = &mconf->mt76;
@@ -2488,8 +2493,6 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 			    int enable)
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)link_conf->vif->drv_priv;
-	struct mt792x_bss_conf *mconf = mt792x_vif_to_link(mvif,
-							   link_conf->link_id);
 	struct mt792x_dev *dev = phy->dev;
 	struct sk_buff *skb;
 
@@ -2513,7 +2516,7 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 		mt7925_mcu_bss_color_tlv(skb, link_conf, enable);
 	}
 
-	mt7925_mcu_bss_rlm_tlv(skb, phy->mt76, mconf->mt76.ctx);
+	mt7925_mcu_bss_rlm_tlv(skb, phy->mt76, link_conf, ctx);
 
 	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
 				     MCU_UNI_CMD(BSS_INFO_UPDATE), true);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index 7fb46cad9157..6ae5286385d9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -623,6 +623,7 @@ int mt7925_mcu_set_deep_sleep(struct mt792x_dev *dev, bool enable);
 int mt7925_mcu_set_channel_domain(struct mt76_phy *phy);
 int mt7925_mcu_set_radio_en(struct mt792x_phy *phy, bool enable);
 int mt7925_mcu_set_chctx(struct mt76_phy *phy, struct mt76_vif *mvif,
+			 struct ieee80211_bss_conf *link_conf,
 			 struct ieee80211_chanctx_conf *ctx);
 int mt7925_mcu_set_rate_txpower(struct mt76_phy *phy);
 int mt7925_mcu_update_arp_filter(struct mt76_dev *dev,
-- 
2.25.1


