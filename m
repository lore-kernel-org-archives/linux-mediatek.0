Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABE1C27C53
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0dXcuhqd0lvvqm+NBo7m/RnwTDnBF6gybJXfOPI8oU=; b=YNKlBbnlW1rgwRgdO4qYFqAZMd
	9ICJdUGrWSn6L3U+t0ra/Ld7jFt9TNj4rEP9FMFZ6ztDPRHmKd2DTdcVJOxzcyDUOt40bINhPsNCf
	+3EHW4fSI2iASNBDF3OcGBCcZy/yhtc3C7HMIX6oRwvRefUT6/gsCoTe6RucVWjOiTBU3TaHOI3JM
	GPpwUv1kLX5DTtetL17yLRbbDxahHvfO/IuL02WzDnV/V6AY+e40ZAuWfXEZJxc8mM28jOLl3YsBy
	9S46jZZ+7x8hl/+h9H9lOgxraHtOjsvkRQE3CsAWok7BNV6KdSueLc3sEmBGrGxXbrGXrFi+xfCDx
	61vt6hug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakO-0000000Evqo-2EqU;
	Thu, 13 Jun 2024 03:03:32 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakI-0000000Evml-1bTh
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:03:29 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-250aa23752dso56684fac.3
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247805; x=1718852605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0dXcuhqd0lvvqm+NBo7m/RnwTDnBF6gybJXfOPI8oU=;
        b=BCEH3x5CH+Wp93a/KTALM9ffhCTQCCJ7tZ7NEj7Sd7eDYRa9MUHM/4mMDRc8gpGsBn
         7ZK++wp7g5Iji0Fefv3vmLdY2T+oFNg92IUugGuar1HCfdcii5R7loCeFwUr1YxVgj02
         bw0MxcrDMciTWNlmVNH2RhkBH3VqK0YdX7JZbtYr9YJzf53wSvoyJRASnioCdMlD4MjK
         janTAk04STJFECzXy0MLZzlGaKwX4zKCZXyW+DCXT0faLvU+xY9cZE/fsUiegHCMlvTL
         iHWiQPXJXyyGyNyyz3BGZ78q7Z5pE/l2sOzHmx5YUtiQ8FBn0b9+jwTrjVLppaxFQ+gF
         jeNA==
X-Forwarded-Encrypted: i=1; AJvYcCXCnYbV3lbzZzfDGdJT/dgTPIgelgbqtr6ce7C4JjAWi62D3Qt1ciqQOmfommd3c9Qr6IMvyNh6eLqjBwjh6A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx14IhcO18U6sTNojfzTNkWfozg4OtzZpTFNdBjmXbkzMgJeCtL
	G8xmeXc1VvpeUPuCtLg4Dkf+2YiBicAY774Yg+NXlIwXVEJsdYqt
X-Google-Smtp-Source: AGHT+IHi7rQNTqoSwiFznMBjXn3k3B1PCO5vHCiG3wFDk2jnlRKV9q6PICtm0P8Y3Y5/9BSnjwQ0wQ==
X-Received: by 2002:a05:6820:b0b:b0:5ba:c4ed:ee98 with SMTP id 006d021491bc7-5bb3b7a4c51mr3589757eaf.0.1718247805119;
        Wed, 12 Jun 2024 20:03:25 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:03:24 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 18/47] wifi: mt76: mt7925: extend mt7925_mcu_set_bss_pm for per-link BSS
Date: Wed, 12 Jun 2024 20:02:12 -0700
Message-Id: <20240613030241.5771-19-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200326_449524_33BE4E04 
X-CRM114-Status: GOOD (  13.33  )
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

Extend mt7925_mcu_set_bss_pm with per-link BSS configuration.

The patch we created is a prerequisite to enable the MLO function in the
driver. It is purely a refactoring patch so the functionality should
remain unchanged.

Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c  |  4 ++--
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c   | 15 ++++++++-------
 .../net/wireless/mediatek/mt76/mt7925/mt7925.h    |  3 ++-
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 457e1fa2fde1..aeed2c777a20 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1263,7 +1263,7 @@ mt7925_start_ap(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	if (err)
 		goto out;
 
-	err = mt7925_mcu_set_bss_pm(dev, vif, true);
+	err = mt7925_mcu_set_bss_pm(dev, link_conf, true);
 	if (err)
 		goto out;
 
@@ -1285,7 +1285,7 @@ mt7925_stop_ap(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 
 	mt792x_mutex_acquire(dev);
 
-	err = mt7925_mcu_set_bss_pm(dev, vif, false);
+	err = mt7925_mcu_set_bss_pm(dev, link_conf, false);
 	if (err)
 		goto out;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 18e19ffdbb7e..0350f0e34690 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1319,10 +1319,11 @@ mt7925_mcu_uni_bss_bcnft(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 }
 
 int
-mt7925_mcu_set_bss_pm(struct mt792x_dev *dev, struct ieee80211_vif *vif,
+mt7925_mcu_set_bss_pm(struct mt792x_dev *dev,
+		      struct ieee80211_bss_conf *link_conf,
 		      bool enable)
 {
-	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
 	struct {
 		struct {
 			u8 bss_idx;
@@ -1339,13 +1340,13 @@ mt7925_mcu_set_bss_pm(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 		} __packed enable;
 	} req = {
 		.hdr = {
-			.bss_idx = mvif->bss_conf.mt76.idx,
+			.bss_idx = mconf->mt76.idx,
 		},
 		.enable = {
 			.tag = cpu_to_le16(UNI_BSS_INFO_BCNFT),
 			.len = cpu_to_le16(sizeof(struct bcnft_tlv)),
-			.dtim_period = vif->bss_conf.dtim_period,
-			.bcn_interval = cpu_to_le16(vif->bss_conf.beacon_int),
+			.dtim_period = link_conf->dtim_period,
+			.bcn_interval = cpu_to_le16(link_conf->beacon_int),
 		},
 	};
 	struct {
@@ -1359,7 +1360,7 @@ mt7925_mcu_set_bss_pm(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 		} __packed disable;
 	} req1 = {
 		.hdr = {
-			.bss_idx = mvif->bss_conf.mt76.idx,
+			.bss_idx = mconf->mt76.idx,
 		},
 		.disable = {
 			.tag = cpu_to_le16(UNI_BSS_INFO_PM_DISABLE),
@@ -1693,7 +1694,7 @@ int mt7925_mcu_set_beacon_filter(struct mt792x_dev *dev,
 					       MT_WF_RFCR_DROP_OTHER_BEACON);
 	}
 
-	err = mt7925_mcu_set_bss_pm(dev, vif, false);
+	err = mt7925_mcu_set_bss_pm(dev, &vif->bss_conf, false);
 	if (err)
 		return err;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index f689f7a359ea..07ea03195e4e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -192,7 +192,8 @@ int __mt7925_start(struct mt792x_phy *phy);
 int mt7925_register_device(struct mt792x_dev *dev);
 void mt7925_unregister_device(struct mt792x_dev *dev);
 int mt7925_run_firmware(struct mt792x_dev *dev);
-int mt7925_mcu_set_bss_pm(struct mt792x_dev *dev, struct ieee80211_vif *vif,
+int mt7925_mcu_set_bss_pm(struct mt792x_dev *dev,
+			  struct ieee80211_bss_conf *link_conf,
 			  bool enable);
 int mt7925_mcu_sta_update(struct mt792x_dev *dev, struct ieee80211_sta *sta,
 			  struct ieee80211_vif *vif, bool enable,
-- 
2.34.1


