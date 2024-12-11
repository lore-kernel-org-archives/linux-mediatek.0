Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E8BE77180
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 01:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tRF9ugiz33htRxpTQb5KpK3OS4duLbF4MKOYzIA9S2Y=; b=gEvPThAsnUJ28LWsd04CV+lPpF
	i8ZOBsgYWZLX39OWzTy7LdwXacFCxkUHgJBb2Sriyik5WUcpJHr/Meuce/pJX+42/MEilchSyfch4
	Dc6nRlQxhZpJvnJEpGeIced55d81CBuEesinKmadR2F9IJr88fb9RR7+s4pmlrvseGg6Bv/v1bdSj
	bITsarqo+RezrOhfaeP27u19l+k7DUWjHz7NWoWKvkdNWp8igIYxTUsjsuCxtajCMGRFKeXsqjZeM
	UaV2bCMuDqXLt3u3fBr3tbqfHajITyyO4UEro5gui0pvZTwRl1Ur0x8t4WvBG6R6a7XEt/3iVcyac
	NNDExaLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBOs-0000000DOyC-33tX;
	Wed, 11 Dec 2024 01:20:26 +0000
Received: from mail-oa1-f54.google.com ([209.85.160.54])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBOq-0000000DOxF-1G9E
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Dec 2024 01:20:25 +0000
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-29fe7ff65e6so784149fac.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 17:20:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733880023; x=1734484823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tRF9ugiz33htRxpTQb5KpK3OS4duLbF4MKOYzIA9S2Y=;
        b=hcUENBQDv8sVDfcdb/j6OpVxNdr6BO8biTbbP078NnKWNa6RWrkMQhYm43a7UMSqEo
         4uB3f3pjwgif6/30vsSyqhP+YrxiH4bNqjn3+OSk0q8YlaLhFNP+RLTQtRFXJWayJC+n
         qzbGEv1h/cEOF6cq0DNphUDzsemN0TKLTJXnCv4r8ZvhXaTTqIAjPePsZ3UTgt3IB5x+
         2dMajPHnZIDcgL7g/9UCPrKeb0+mCOgDO+vMf8tceZlLIB6ghIuLybifmpTwgHLjpHvc
         9iooUpQ62o6mzU2YZ2k3q0Dy1UGwRstLeQd9pamqKObR+YxmdO3vJb+s3Z8Zgos5Snkn
         jV9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV6gxkt03wy6jgn23tNis4VYdwm1wnaVIGZjivZVAV3ZjUqb57dJha+YkB0Wfg1twPdK7OMj+6C2r+x4AakVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4TXiuW95q86IevXbQUKVojF7xkwhhNji44jBEHrO72UFoVSlz
	FRc2b4JZz0uOI654js/kTG3M8Z37UwQxe9cHK/M3DvFHZzH5lT2BXlvva1IX4tw=
X-Gm-Gg: ASbGnctnJTGtntNtFNtvnaL4otlPsifHzUPKsvE+nAtzzmYXjRSesTpWxwelLU9QT1x
	p9bKY8yTUo0pH5IqLXbQQRs2vzDIcqNwOFVedBZ4frxgkkxA3167A8FIY58DvKdEaDr6DkYdzW4
	b6Dv8UkERl63L2tlMzuJp5IxctC9ty5WYGgO1LRjbKIJfGyWLSHnfDlPmHrHXq+eyd8UJqwxL0s
	2yoYOg3E5s7HXT9uVCRCTrWMMDU9Sz/5qTl974906GGoiSkHz27t9p8uGAnoKiBvo8VyQk=
X-Google-Smtp-Source: AGHT+IE1TVNPZ38uP/IvTR3MzgVFIX09y+QeA5AuUwqpjwg/ND5Ay0/c4177SuRviRkvgjmcxh8OFg==
X-Received: by 2002:a05:6870:470e:b0:29e:49b3:c50e with SMTP id 586e51a60fabf-2a012c1ffe5mr694106fac.13.1733880023388;
        Tue, 10 Dec 2024 17:20:23 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29f93552d34sm2705701fac.24.2024.12.10.17.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 17:20:21 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 13/17] wifi: mt76: mt7925: Update secondary link PS flow
Date: Tue, 10 Dec 2024 17:19:22 -0800
Message-Id: <20241211011926.5002-13-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241211011926.5002-1-sean.wang@kernel.org>
References: <20241211011926.5002-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_172024_338704_77A56F8B 
X-CRM114-Status: GOOD (  13.08  )
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

Update the power-saving flow for secondary links.

Fixes: 86c051f2c418 ("wifi: mt76: mt7925: enabling MLO when the firmware supports it")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  7 ++++++
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 25 ++++++-------------
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  3 +++
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  7 ++++--
 4 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 615d7a370923..f2a0159be9c1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1903,6 +1903,13 @@ static void mt7925_link_info_changed(struct ieee80211_hw *hw,
 	if (changed & (BSS_CHANGED_QOS | BSS_CHANGED_BEACON_ENABLED))
 		mt7925_mcu_set_tx(dev, info);
 
+	if (changed & BSS_CHANGED_BSSID) {
+		if (ieee80211_vif_is_mld(vif) &&
+		    hweight16(mvif->valid_links) == 2)
+			/* Indicate the secondary setup done */
+			mt7925_mcu_uni_bss_bcnft(dev, info, true);
+	}
+
 	mt792x_mutex_release(dev);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index a0df9a4c4b23..9fafb7cce356 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1364,7 +1364,7 @@ int mt7925_mcu_uni_bss_ps(struct mt792x_dev *dev,
 				 &ps_req, sizeof(ps_req), true);
 }
 
-static int
+int
 mt7925_mcu_uni_bss_bcnft(struct mt792x_dev *dev,
 			 struct ieee80211_bss_conf *link_conf, bool enable)
 {
@@ -1925,32 +1925,21 @@ int mt7925_mcu_set_beacon_filter(struct mt792x_dev *dev,
 {
 #define MT7925_FIF_BIT_CLR		BIT(1)
 #define MT7925_FIF_BIT_SET		BIT(0)
-	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-	unsigned long valid = ieee80211_vif_is_mld(vif) ?
-				      mvif->valid_links : BIT(0);
-	struct ieee80211_bss_conf *bss_conf;
 	int err = 0;
-	int i;
 
 	if (enable) {
-		for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
-			bss_conf = mt792x_vif_to_bss_conf(vif, i);
-			err = mt7925_mcu_uni_bss_bcnft(dev, bss_conf, true);
-			if (err < 0)
-				return err;
-		}
+		err = mt7925_mcu_uni_bss_bcnft(dev, &vif->bss_conf, true);
+		if (err < 0)
+			return err;
 
 		return mt7925_mcu_set_rxfilter(dev, 0,
 					       MT7925_FIF_BIT_SET,
 					       MT_WF_RFCR_DROP_OTHER_BEACON);
 	}
 
-	for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
-		bss_conf = mt792x_vif_to_bss_conf(vif, i);
-		err = mt7925_mcu_set_bss_pm(dev, bss_conf, false);
-		if (err)
-			return err;
-	}
+	err = mt7925_mcu_set_bss_pm(dev, &vif->bss_conf, false);
+	if (err < 0)
+		return err;
 
 	return mt7925_mcu_set_rxfilter(dev, 0,
 				       MT7925_FIF_BIT_CLR,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index ac53bdc99332..31bb8ed2ec51 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -643,4 +643,7 @@ int mt7925_mcu_set_chctx(struct mt76_phy *phy, struct mt76_vif *mvif,
 int mt7925_mcu_set_rate_txpower(struct mt76_phy *phy);
 int mt7925_mcu_update_arp_filter(struct mt76_dev *dev,
 				 struct ieee80211_bss_conf *link_conf);
+int
+mt7925_mcu_uni_bss_bcnft(struct mt792x_dev *dev,
+			 struct ieee80211_bss_conf *link_conf, bool enable);
 #endif
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index ab12616ec2b8..2b8b9b2977f7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -241,6 +241,7 @@ static inline struct mt792x_bss_conf *
 mt792x_vif_to_link(struct mt792x_vif *mvif, u8 link_id)
 {
 	struct ieee80211_vif *vif;
+	struct mt792x_bss_conf *bss_conf;
 
 	vif = container_of((void *)mvif, struct ieee80211_vif, drv_priv);
 
@@ -248,8 +249,10 @@ mt792x_vif_to_link(struct mt792x_vif *mvif, u8 link_id)
 	    link_id >= IEEE80211_LINK_UNSPECIFIED)
 		return &mvif->bss_conf;
 
-	return rcu_dereference_protected(mvif->link_conf[link_id],
-		lockdep_is_held(&mvif->phy->dev->mt76.mutex));
+	bss_conf = rcu_dereference_protected(mvif->link_conf[link_id],
+					     lockdep_is_held(&mvif->phy->dev->mt76.mutex));
+
+	return bss_conf ? bss_conf : &mvif->bss_conf;
 }
 
 static inline struct mt792x_link_sta *
-- 
2.25.1


