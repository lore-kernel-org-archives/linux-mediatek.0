Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9C0FCB63B
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 23:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D6tzslYz/qBkYRLW0SjS8m12VVJZ7BWeZC0ivqU2SZY=; b=TZTTM/D7ZT1PhSodxWqkkfuvEp
	DI+TWBjcb6cDObKTREwv/YpfZ14FchgWhpJAYozXUeEtkrejgFCEjult3IhD4flayHSkRGKvCv7xS
	ec0rIf1zEdeD5eHjGLEH/ghk/dibkUdY7azH/UnFx38rZ0Hn7HuzKrN8GchhaNHZPuq7nnbaJxMn3
	+HntKRMZ3MMP4oK7d5HgVXCxZKismVHq8Z90wjeC97hzL8cWp7ppn8o2SkFPsucsjegcs6yKrIxVO
	2Tgn2y4wbAwAOb9Zj3qStZ0znKOnOJZxksXZMpvfYCqIuKfVefJ8k0nZ9E3qU02T3dp8ITSFsMeau
	aVBcEFCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeWA-00000004dbE-2toX;
	Fri, 06 Mar 2026 23:23:38 +0000
Received: from mail-oa1-f53.google.com ([209.85.160.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeW8-00000004dZo-2ejA
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 23:23:37 +0000
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-40423dbe98bso2303885fac.2
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 15:23:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839416; x=1773444216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D6tzslYz/qBkYRLW0SjS8m12VVJZ7BWeZC0ivqU2SZY=;
        b=hQmVZN9+QzLQQkfZkXsTgbhEoO3VN71qkU9xKpGvH82cIeavWz+rF7IRCllq0wKnr7
         e0CqWNGQdtH8PAUkVEusDpOLNfo9Qg+XNRAD0EsZKsNjAKXfuqQaZFtkeGJHmLkGs6bi
         m49+s96iVSuHDeHhomBa+a3lTuE/CCI7kpjyqHd120qQvW17RYTZmJtr+/ov3xhB1nd/
         bZXTusdIXQpkI3wnruMMsw91IjH2FPtz+XU7GWW5KLCct0dl2HoFIiv04URDB7eBfevw
         hg6L8zXxx4u8A19dnkm6v90VWkPmoWrw3Rrh9GWVHG7yZb3yjAnGKj0C9+fKRvTxte38
         VIaw==
X-Forwarded-Encrypted: i=1; AJvYcCWuHv1MikjXp612kAta7oMgBzgWdPiwbpFdjxaJMzJxmitwlDIZe97G6ca3AemdbzkgADganmxRANgUMJ8mEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzP60mYxN5BdVZ/oKLyk/sy1U62T3nzR1aqnQdfzpCHQYEfQiGo
	/0KTs34do3OhPNqMsJPq8JM94yUDagVT+12wkBIfZmDpIjDWC7ZZRI2P
X-Gm-Gg: ATEYQzx6+GfgYzYsRmd5+B5uR3Ufkdo4ZQDmqtr3FSaunb0pQK0L3GhOUplABnp9Mgz
	ik00Qe3nkpzpsS6yI35b8V64VxBZ5VSNhYIs13s+Z8gJE+GWOJaxV/SkdTv0E/OSr+OMzLU6GuU
	n58YSWHW76JspZzuD7I6zB8kmfm/jIYmLz+t1Wb/V7qD050RWxj8FpsDeYtLwzyvG7felR8uXGi
	ePoWtdPQddzisg/ahzWDATXR3j+5Q1YZRFPgt74H3nEXh1+YOVbyMRG5z8VOhj1Ns6LxG7+zEZY
	6GEOXO1O89tSL8W9IU0ESfdPrS8psSboUllWRLUtG78w+SZ7x7/aILhdO1iiS6uNYeJB78EmUAk
	9chXLzoBLgkvFdAbqCayHPVfIkz6PFl/mviBgGL36JBuazv7kI8vVf6BMJDhiDBzB7UZ3Zu0/sn
	uMd9DBg88kgs5GljIIZt6pFfh2NiOSaCUZDZtAxjWriGmj+1g=
X-Received: by 2002:a05:6870:700b:b0:3e8:9e7b:4ea4 with SMTP id 586e51a60fabf-416e3e8493dmr2297605fac.6.1772839415748;
        Fri, 06 Mar 2026 15:23:35 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-416e65b1c82sm2572344fac.5.2026.03.06.15.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:23:35 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 09/19] wifi: mt76: mt7925: pass mlink to wtbl_update_hdr_trans()
Date: Fri,  6 Mar 2026 17:22:28 -0600
Message-ID: <20260306232238.2039675-10-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306232238.2039675-1-sean.wang@kernel.org>
References: <20260306232238.2039675-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_152336_680434_815B6836 
X-CRM114-Status: GOOD (  10.04  )
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

Drop the mt792x_sta_to_link() lookup in mt7925_mcu_wtbl_update_hdr_trans()
and pass the resolved mlink from the caller instead. The link context is
already known at the call site, making the lookup redundant.

This keeps the helper lookup-free and makes link ownership explicit.

No functional change intended.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c   | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c    | 8 ++------
 drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h | 1 +
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index ddff6c5ab876..f5dd91dacca5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1598,7 +1598,7 @@ static void mt7925_sta_set_decap_offload(struct ieee80211_hw *hw,
 		if (!mlink->wcid.sta)
 			continue;
 
-		mt7925_mcu_wtbl_update_hdr_trans(dev, vif, sta, i);
+		mt7925_mcu_wtbl_update_hdr_trans(dev, vif, sta, mlink, i);
 	}
 
 	mt792x_mutex_release(dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 03515b891643..0b096838bca6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1097,18 +1097,14 @@ mt7925_mcu_sta_hdr_trans_tlv(struct sk_buff *skb,
 int mt7925_mcu_wtbl_update_hdr_trans(struct mt792x_dev *dev,
 				     struct ieee80211_vif *vif,
 				     struct ieee80211_sta *sta,
+				     struct mt792x_link_sta *mlink,
 				     int link_id)
 {
-	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct ieee80211_link_sta *link_sta = sta ? &sta->deflink : NULL;
-	struct mt792x_link_sta *mlink;
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_bss_conf *mconf;
-	struct mt792x_sta *msta;
 	struct sk_buff *skb;
 
-	msta = sta ? (struct mt792x_sta *)sta->drv_priv : &mvif->sta;
-
-	mlink = mt792x_sta_to_link(msta, link_id);
 	link_sta = mt792x_sta_to_link_sta(vif, sta, link_id);
 	mconf = mt792x_vif_to_link(mvif, link_id);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index 95f29dae4d9d..e28972f0615b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -371,6 +371,7 @@ int mt7925_mcu_set_rts_thresh(struct mt792x_phy *phy, u32 val);
 int mt7925_mcu_wtbl_update_hdr_trans(struct mt792x_dev *dev,
 				     struct ieee80211_vif *vif,
 				     struct ieee80211_sta *sta,
+				     struct mt792x_link_sta *mlink,
 				     int link_id);
 int mt7925_mcu_wf_rf_pin_ctrl(struct mt792x_phy *phy);
 
-- 
2.43.0


