Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3A1C31D97
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 21:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4D8GOqEYIjIhd4nO67HazbxOlKo7VMKVeEfzgJOHMfM=; b=1mnVMt6f0A57b50ri+PHkyx3Y5
	Oru9km7qP8Qbzm5vlv/ETaOOPy9Pa7e6gTTJqA3uAvrcIhuB906k8aPk1fsaaH+06SvQfarhfIuVi
	6HM959gp2MKWCQbn+uwS1e6MZqj92P2qDLVy9PjYfHK4B/IsDeBVGrRZeXhwYDQwbmnpKfl4/aT3o
	tNGdkWs7yxte1IG1T6OSbk1CcaAGrJd7NW33iVUbWjD4xl2jPIhUaYPjAgfTdnTGWRft/IvmKteKd
	bOQwspIUkgaR1sfR7WbXZnF3h4M0mDJV/GHI4GhP3SHjjBOGg0n7YyB9EuRx4bUxfm8Amo1BwGk4w
	ve2FQyxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7kc-0000000BWyE-1sJV;
	Wed, 03 Jul 2024 21:42:54 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7kZ-0000000BWwo-3KC2
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 21:42:52 +0000
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-70204bcd5eeso80640a34.2
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 14:42:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720042971; x=1720647771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4D8GOqEYIjIhd4nO67HazbxOlKo7VMKVeEfzgJOHMfM=;
        b=GM2r7yzqj5VXxmSXVdkAcB6UN3ySw8TUo/pZvqVy/k3Wy5BnKpbqJyn38rGkeTcFsw
         jCUw4I2gyp65fuQ7OTCMBg4bowxYBMQ9sJRnD2O6i9HIowLy99TMLM9GIhdYM9F2gIwI
         WdXgt5NMvQhfB5eLXDZHpnv+Uevh04kL6lN6PRPu7K81L+Ju2AxQmsmWtZoSJIeZWwcR
         ilW5fLXJagyASyHGzZ6joSc/6CaTPq4JT3qljQZncQoPlgYup1Qej6Agx2ut5tBMsUrJ
         ySSvo7EXBKsurRzF1DP5fJq6J7jMfwEv+D0dxhKMB2S74TAEQT4N4dJyOPbVrtkJjVCy
         xAEw==
X-Forwarded-Encrypted: i=1; AJvYcCXHO2uHsMagTRs++byYIvrsyQgjO1KUUIvXYARItmza01pkVK5jFYBDoqIZB+hqlna19SA4q4htRcuQVZKMDX/Y8DfxUiqYRj89DKW+WczuUGfI
X-Gm-Message-State: AOJu0YwFLRJFAP8cJvta6BNWg0/u4kIlaElJBdIiTR+LQXExlDpobnzk
	FmOJeFopSU0HFk6FpXClR7bW1uL8WR10o0Rr16FPuRaWfjYgWDYC
X-Google-Smtp-Source: AGHT+IFEM8AtOC4VbrN1MHEZJ0NHJbO6KnrzFOQm439w+AkKKPB6yfmZQC83oKo5lnuyh8d2s8jkcQ==
X-Received: by 2002:a05:6830:1bfb:b0:700:d064:36d3 with SMTP id 46e09a7af769-70207742e4bmr13770945a34.2.1720042970791;
        Wed, 03 Jul 2024 14:42:50 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b20953sm2111417a34.54.2024.07.03.14.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:42:48 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 02/29] wifi: mt76: mt7925: update mt7925_mac_link_sta_[add, remove] for MLO
Date: Wed,  3 Jul 2024 14:42:07 -0700
Message-Id: <0fce480ad67237ce4f65138fe5e45f8090ae08f2.1720042294.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720042294.git.sean.wang@kernel.org>
References: <cover.1720042294.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_144251_857426_F05B4EFF 
X-CRM114-Status: GOOD (  11.68  )
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

[add, remove] the per-link STA from the corresponding to per-link BSS with
the same link id. The change remains compatible with the non-MLO mode.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 24 ++++++++++++-------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 8b10b63bc98d..1c8a44789e51 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -728,12 +728,13 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct ieee80211_bss_conf *link_conf;
+	u8 link_id = link_sta->link_id;
 	struct mt792x_link_sta *mlink;
 	struct mt792x_sta *msta;
 	int ret, idx;
 
 	msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
-	mlink = mt792x_sta_to_link(msta, link_sta->link_id);
+	mlink = mt792x_sta_to_link(msta, link_id);
 
 	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT792x_WTBL_STA - 1);
 	if (idx < 0)
@@ -753,12 +754,16 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	mt7925_mac_wtbl_update(dev, idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
-	link_conf = mt792x_vif_to_bss_conf(vif, vif->bss_conf.link_id);
+	link_conf = mt792x_vif_to_bss_conf(vif, link_id);
 
 	/* should update bss info before STA add */
-	if (vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls)
-		mt7925_mcu_add_bss_info(&dev->phy, mvif->bss_conf.mt76.ctx,
+	if (vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls) {
+		struct mt792x_bss_conf *mconf;
+
+		mconf = mt792x_vif_to_link(mvif, link_id);
+		mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
 					link_conf, link_sta, false);
+	}
 
 	ret = mt7925_mcu_sta_update(dev, link_sta, vif, true,
 				    MT76_STA_INFO_STATE_NONE);
@@ -830,11 +835,12 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 {
 	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
 	struct ieee80211_bss_conf *link_conf;
+	u8 link_id = link_sta->link_id;
 	struct mt792x_link_sta *mlink;
 	struct mt792x_sta *msta;
 
 	msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
-	mlink = mt792x_sta_to_link(msta, link_sta->link_id);
+	mlink = mt792x_sta_to_link(msta, link_id);
 
 	mt76_connac_free_pending_tx_skbs(&dev->pm, &mlink->wcid);
 	mt76_connac_pm_wake(&dev->mphy, &dev->pm);
@@ -844,12 +850,14 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 	mt7925_mac_wtbl_update(dev, mlink->wcid.idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
-	link_conf = mt792x_vif_to_bss_conf(vif, vif->bss_conf.link_id);
+	link_conf = mt792x_vif_to_bss_conf(vif, link_id);
 
 	if (vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls) {
 		struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-		mt7925_mcu_add_bss_info(&dev->phy,
-					mvif->bss_conf.mt76.ctx, link_conf,
+		struct mt792x_bss_conf *mconf;
+
+		mconf = mt792x_vif_to_link(mvif, link_id);
+		mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx, link_conf,
 					link_sta, false);
 	}
 
-- 
2.25.1


