Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DB2C27C53
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7m5poBoCf/FKm4KBPm6gYtwcp9bMCiSU6fa4NfX9MgI=; b=DaWy/A30Iou4Rxr9lA8RRxW+pS
	pali15RvMWuU3WkQBl4NXXc5PcHZLdGB1AfedKZDfJn3EeFSMT8O+41lF6Eyg5CNcgWHWfs2aWsxk
	ll66+5dGXf5Bj1zqufjUrcmrwNqPZArQxcIPz7Q3eJvlD3q/rtTRGM7ZwlG/gGHMbiOgyf6qkUch2
	dkcT96H+C8AjO0Py70voyuKaS8Ai1mWmpJJgJmO8f6tsZFJHJhodcnGuIP89iWGuN+Or+oJZgv/cv
	8DRj7Lw907NIJKuEYkobVJ13of6Jxg5FKg1B61QGhEAL13bAYHwTKTy5g3HrLd2U1sbJWiQcZII50
	czF6YEzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakU-0000000Evuw-2qAV;
	Thu, 13 Jun 2024 03:03:38 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakP-0000000EvqY-0FST
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:03:35 +0000
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3d1b8bacf67so76850b6e.2
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:03:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247811; x=1718852611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7m5poBoCf/FKm4KBPm6gYtwcp9bMCiSU6fa4NfX9MgI=;
        b=Zn0gbeNuJwyShveJuzCRXvpQfg4YR27UiXY79+Om2LOgO5Q3E+zAWz74IOnuihSpsU
         wHDT4J6bQCzg76l12iCeDadAt2Z8GIcmUaaTNIpYX6rZQ8j9l9rYye2jn++EMARK9xNC
         JARHSTAeX9BvAG2XROJ505fW4lWRDqzjN+yLqMsB18hIKSTCjxNwv2NolxZ4GYMX7GIX
         BU8PKa5mpV49qGSL/TsFfHzUO8cxrNcEcZ9p2MCsdZwLuITnYrb/vREJiLahBaxu8Aco
         zz/0ef7rT5OpsUHXYoXucxLP9O1q2q5Aj8mFco/coRuKOcc38OShQVEtYvrdzQJXjW4g
         +fXg==
X-Forwarded-Encrypted: i=1; AJvYcCXa4sm/317mB7J+uyJfSWI2HHydGEieUmhI+vzufJTkY1fBELT0SCj8atGq4wSIodORVNAQgiFrl0PUU16YgvDCjF2fh1sCvl3mgs3M39il91Jm
X-Gm-Message-State: AOJu0YzUwLoOQc1Pe2QUouqiCQph/SIjAKOMAlpFXay3wPvmxbvaxWd5
	to4sJ25cVkVUFmSmAgEcKVbaQ5ulf+hEWXvPe1ZJv4tMgBkJjDJW
X-Google-Smtp-Source: AGHT+IH3VdcAKYywuUVd8RSqNF5vSLpmMq9sWAa41UhcYYob9I0jkUAqyH169yOPlWKe5BmMi2s3rQ==
X-Received: by 2002:a05:6820:d88:b0:5ba:ead2:c742 with SMTP id 006d021491bc7-5bb3b7a3d2bmr3671830eaf.0.1718247811382;
        Wed, 12 Jun 2024 20:03:31 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:03:29 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 21/47] wifi: mt76: mt7925: extend mt7925_mcu_uni_bss_ps for per-link BSS
Date: Wed, 12 Jun 2024 20:02:15 -0700
Message-Id: <20240613030241.5771-22-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200333_151702_1307695A 
X-CRM114-Status: GOOD (  12.84  )
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

Extend mt7925_mcu_uni_bss_ps with per-link BSS configuration.

The patch we created is a prerequisite to enable the MLO function in the
driver. It is purely a refactoring patch so the functionality should
remain unchanged.

Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c   |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c    | 11 ++++++-----
 drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h |  3 ++-
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index bba17e51a023..cd20b85109b9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1383,7 +1383,7 @@ static void mt7925_vif_cfg_changed(struct ieee80211_hw *hw,
 	}
 
 	if (changed & BSS_CHANGED_PS)
-		mt7925_mcu_uni_bss_ps(dev, vif);
+		mt7925_mcu_uni_bss_ps(dev, &vif->bss_conf);
 
 	mt792x_mutex_release(dev);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 8950df09a025..7624ec23e064 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1243,9 +1243,10 @@ int mt7925_mcu_set_eeprom(struct mt792x_dev *dev)
 }
 EXPORT_SYMBOL_GPL(mt7925_mcu_set_eeprom);
 
-int mt7925_mcu_uni_bss_ps(struct mt792x_dev *dev, struct ieee80211_vif *vif)
+int mt7925_mcu_uni_bss_ps(struct mt792x_dev *dev,
+			  struct ieee80211_bss_conf *link_conf)
 {
-	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
 	struct {
 		struct {
 			u8 bss_idx;
@@ -1264,16 +1265,16 @@ int mt7925_mcu_uni_bss_ps(struct mt792x_dev *dev, struct ieee80211_vif *vif)
 		} __packed ps;
 	} __packed ps_req = {
 		.hdr = {
-			.bss_idx = mvif->bss_conf.mt76.idx,
+			.bss_idx = mconf->mt76.idx,
 		},
 		.ps = {
 			.tag = cpu_to_le16(UNI_BSS_INFO_PS),
 			.len = cpu_to_le16(sizeof(struct ps_tlv)),
-			.ps_state = vif->cfg.ps ? 2 : 0,
+			.ps_state = link_conf->vif->cfg.ps ? 2 : 0,
 		},
 	};
 
-	if (vif->type != NL80211_IFTYPE_STATION)
+	if (link_conf->vif->type != NL80211_IFTYPE_STATION)
 		return -EOPNOTSUPP;
 
 	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD(BSS_INFO_UPDATE),
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index 8ab2bb01ba73..ef37951f69d5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -242,7 +242,8 @@ int mt7925_mcu_uni_rx_ba(struct mt792x_dev *dev,
 			 bool enable);
 void mt7925_scan_work(struct work_struct *work);
 void mt7925_roc_work(struct work_struct *work);
-int mt7925_mcu_uni_bss_ps(struct mt792x_dev *dev, struct ieee80211_vif *vif);
+int mt7925_mcu_uni_bss_ps(struct mt792x_dev *dev,
+			  struct ieee80211_bss_conf *link_conf);
 void mt7925_coredump_work(struct work_struct *work);
 int mt7925_get_txpwr_info(struct mt792x_dev *dev, u8 band_idx,
 			  struct mt7925_txpwr *txpwr);
-- 
2.34.1


