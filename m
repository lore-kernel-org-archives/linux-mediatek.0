Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D351C27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnZF05g1ossfZRm0FvsZx86VQptBSn3TL85vtMAglhw=; b=vETn0wGLeh7u2AbIhIS3bcy0C1
	CLCXcFwHJUZnOhlf8NZUjHFpdESETlNpX1BpFFYLQv/b7olniJKV2+A/oTtXUNIkjakiKbN2d5bzD
	zKyUBZUjgub50pu1ItvfPJb9/9WYfdTKrRoLeA4eMHmYZVvkTD6RNNxJqcNy5ZRUrBnex9zTb/uQU
	71X9+qI2/vW+i6UvndqHUWf24W1IZORbsUOW67A3/+5urYLVdhYnepw1+mTpzOzoHjNTaQb7i/Q/d
	vo08ljhW9DQkYaUywL1cX49ubk8NehX02mftio2ok5R+SEmOZrQdF1zpmcg46uMRTZW1FEL0xbLEg
	KMB2R/+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHal9-0000000EwNR-3gbc;
	Thu, 13 Jun 2024 03:04:19 +0000
Received: from mail-oo1-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHal5-0000000EwJw-1tld
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:04:18 +0000
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5bb10cfe7daso36902eaf.2
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247855; x=1718852655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnZF05g1ossfZRm0FvsZx86VQptBSn3TL85vtMAglhw=;
        b=AQaPu8FSarid4a1yCUk1MQV5VvjhjGfJHIvUGXwJwfsn0RbTpO/waA5x4tFNKxowr+
         87OLBGL33cNxozolge6BuVu286HZ+CO50CT1k/aQT0sQwEgOSyxLawFJzc+9X11mEy1W
         x8xz5Ikr9OEsbbfH0HJfHiA9KCMWS9MLSKpVXfA+79ieYlqVEgk+kCuOd/1ncXgYVqkK
         1Ea0Nk3YhAzNaK7zCqdc2Qqy17ubWsbvnDW+Qbd893Tb/dVxE4fe6INyQN6Pvln6hJVY
         tpo3sSirD1Y+8Y/81tRjJ41PKQ0/RUPFT2aM9dv/i232tUOPCJrdZjgGlIVH/L5QvNzi
         sSPg==
X-Forwarded-Encrypted: i=1; AJvYcCUAvXEXAOLrEiI20Sy82VCOUYQwl1GPHSY1Ot0cWBNFyd+FfzGQKKTlfwA1ODRnysbc2LPCa2FFxU5ilUB+LkKDM81yB0oRIyLp1A5PSTp5TJgv
X-Gm-Message-State: AOJu0YxkVcu14jt40nPtVkGiP1LQR0sK8VWMhZ1dOAYK1PZTyMVRJ7VY
	4+ht/DdELYYYcnXfCULURAdqyQTYz4w1fw8bxruGMHxlp9Be27HIJKH5u6KnkvU=
X-Google-Smtp-Source: AGHT+IHws/ZWXRCtHHewDwSprWC4KLFzfUqKsSexiREanNejKeD2YkRsqQNuGYB5vQ2IxCcXbOwpiQ==
X-Received: by 2002:a4a:d196:0:b0:5bd:87a0:66d with SMTP id 006d021491bc7-5bd87a01b93mr287086eaf.1.1718247854625;
        Wed, 12 Jun 2024 20:04:14 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:04:13 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 43/47] wifi: mt76: mt7925: add mt7925_mac_link_sta_assoc to associate per-link STA
Date: Wed, 12 Jun 2024 20:02:37 -0700
Message-Id: <20240613030241.5771-44-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200415_914090_E26ECE02 
X-CRM114-Status: GOOD (  11.21  )
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

The mt7925_mac_link_sta_add function currently associates the per-link STA.
We will extend this function when we implement the MLO functionality.

This patch only includes structural changes and does not involve any
logic changes.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 29 +++++++++++++------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 3911cf71462f..b159d26303ca 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -766,32 +766,43 @@ int mt7925_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 }
 EXPORT_SYMBOL_GPL(mt7925_mac_sta_add);
 
-void mt7925_mac_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *vif,
-			  struct ieee80211_sta *sta)
+static void mt7925_mac_link_sta_assoc(struct mt76_dev *mdev,
+				      struct ieee80211_vif *vif,
+				      struct ieee80211_link_sta *link_sta)
 {
 	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
-	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct ieee80211_bss_conf *link_conf;
+	struct mt792x_link_sta *mlink;
+	struct mt792x_sta *msta;
+
+	msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
+	mlink = mt792x_sta_to_link(msta, link_sta->link_id);
 
 	mt792x_mutex_acquire(dev);
 
 	link_conf = mt792x_vif_to_bss_conf(vif, vif->bss_conf.link_id);
 
-	if (vif->type == NL80211_IFTYPE_STATION && !sta->tdls)
+	if (vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls)
 		mt7925_mcu_add_bss_info(&dev->phy, mvif->bss_conf.mt76.ctx,
-					link_conf, &sta->deflink, true);
+					link_conf, link_sta, true);
 
-	ewma_avg_signal_init(&msta->deflink.avg_ack_signal);
+	ewma_avg_signal_init(&mlink->avg_ack_signal);
 
-	mt7925_mac_wtbl_update(dev, msta->deflink.wcid.idx,
+	mt7925_mac_wtbl_update(dev, mlink->wcid.idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
-	memset(msta->deflink.airtime_ac, 0, sizeof(msta->deflink.airtime_ac));
+	memset(mlink->airtime_ac, 0, sizeof(mlink->airtime_ac));
 
-	mt7925_mcu_sta_update(dev, &sta->deflink, vif, true, MT76_STA_INFO_STATE_ASSOC);
+	mt7925_mcu_sta_update(dev, link_sta, vif, true, MT76_STA_INFO_STATE_ASSOC);
 
 	mt792x_mutex_release(dev);
 }
+
+void mt7925_mac_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *vif,
+			  struct ieee80211_sta *sta)
+{
+	mt7925_mac_link_sta_assoc(mdev, vif, &sta->deflink);
+}
 EXPORT_SYMBOL_GPL(mt7925_mac_sta_assoc);
 
 void mt7925_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
-- 
2.34.1


