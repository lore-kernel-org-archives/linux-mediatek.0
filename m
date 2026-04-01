Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9174710FCAC0
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2026 18:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aauRVUQQqkGVpGY51g7LHYShg9XLgVwRWtM8bAaqPig=; b=nxOnfr2mc17sKty/gn7INfEEvd
	CX3Ah2f/Qywuqy8BKEmUWCha9ZvaBhBAd5iQv45L4OLc4Y3tKdScfuAqV3APrcoeUX7zxtstqMnh9
	GKeNb2fL3ZT0kZCCI9kIS93LijH8m0PbuYPrF365v9dUccswlekw4Cj5E1Mh5o1aUUjMRCqWN/9+x
	lky0hhvtnqsEPAJICULhe01Yf4K6aRYY+SdZkFlMlGy6chdbk4mOixAYLBJ+5yFrOuTXritpNVKXL
	SAyaVavLofTJOHPiwYk663foP2laNmQlTBAwBWIcjICzs0Ll+5kgsaGPpcTBE7LY/tsPowfzmpqBm
	HAP4rGWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w80E5-0000000FxFy-0OJk;
	Wed, 01 Apr 2026 18:23:37 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w80E2-0000000FxFd-3FHw
	for linux-mediatek@lists.infradead.org;
	Wed, 01 Apr 2026 18:23:36 +0000
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-46aa216a65aso25625b6e.1
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Apr 2026 11:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775067813; x=1775672613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aauRVUQQqkGVpGY51g7LHYShg9XLgVwRWtM8bAaqPig=;
        b=MQkPD6G/mLmdCrlP+a10hGo3KAvGvjTOA1Op/Giyi+ssUyt/6Fcri4NnVzdbnSuqqO
         s7doCJOpmUuCjRWqYi/MMhiXYOEzUrnjwS7o6McvYkjhVnkFjfoz4WET0Ufox3tiNrH8
         F1U0fCydCiE+Sr+OVr2yDWpRIB6/K1V82goo0+QaeeElUUbLxZIe51ohb4BHYIViXB5I
         NPrwqVSWQSkQLzQ8ryGFcivYjRyfYdIH8rTRFt/M0maGRv1a2WHvbO6QhvPpMBKgeQz6
         jUwc8XAUR8J26uD5NCHm56SgUY78Kk7raWmmgCjJ7EyZPvmlPwJ1zIS1OXcVpKWKDbAS
         1G/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVupQYYBzzv3wl1/03mvlM0/Nh5eextK2syyw0HlTTPQnzgPjmri3YiOjkv7gQf7xD1GQ9iUGkHdjdNY+3F6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx15aBpUyDNmzeWvkwo0H2jExR8WwPWANEqs6Dl6wvXRoUWYFjo
	YxglMDrYKPubY/5pG/PUt45GWC4bzAAb/QIM9kmj9xIZS7t2o8YjwGk7rbp64w==
X-Gm-Gg: ATEYQzwH6WnuUeAMndKxu6/7UIg3r3rmfLmeJZtbENWr51AOiwKHjrjB4gqb5lK8X/p
	e4p91gw6FynHYEfbt9E2Kstym5Xvs3OKMkWWuwfyNScGhizzgDYjljCaG23rjNV6Rdws6CQwLU8
	6GeMx41mA2+fHnorVPXGtGM2bzaBREekA53Mi4zMsaHXCEHNMN+mTjZKTSdiRvbmbrE1+fyfcSJ
	a0rwkmjPh9Wdv0gXayVDWiusTaMki3pDTEizSIpNAgalUaUXSQ1ADjHS54UJo1+FVlfpneSyWzG
	VaUbEI/bynWIZF5nJF1qYoLZAcEMFXK02zui3Yi9j2d/nV0/SpZzWfVjDFfPwKcAE7DX55Uye0a
	YzH96ohPvER+zALUE+WfJBiBGpzFaLA/icsjLzejSKtIjrIvDY4Kpe1zEHvZMQxPrzf5k8L05+3
	TLHx/ut9XroK+4rOlUKO/BlunQ/CN0IzLXASIm1FFt4ck+13c=
X-Received: by 2002:a05:6808:308d:b0:45e:dbf9:61c7 with SMTP id 5614622812f47-46ae01e3780mr2409342b6e.46.1775067812855;
        Wed, 01 Apr 2026 11:23:32 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-422eb3c9e06sm386778fac.15.2026.04.01.11.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 11:23:32 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Devin Wittmayer <lucid_duck@justthetip.ca>,
	Satadru Pramanik <satadru@gmail.com>
Subject: [PATCH v2 1/3] wifi: mt76: connac: use a helper to cache txpower_cur
Date: Wed,  1 Apr 2026 13:23:20 -0500
Message-ID: <20260401182322.64355-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_112334_842675_CF7CF8CB 
X-CRM114-Status: GOOD (  11.42  )
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

The cached txpower value is derived from the bounded channel power after
applying the chainmask path delta.

Use a helper for that conversion so callers do not open-code it.

Reported-by: Devin Wittmayer <lucid_duck@justthetip.ca>
Closes: https://lore.kernel.org/linux-wireless/20260130215839.53270-1-lucid_duck@justthetip.ca/
Tested-by: Devin Wittmayer <lucid_duck@justthetip.ca>
Tested-by: Satadru Pramanik <satadru@gmail.com>
Co-developed-by: Devin Wittmayer <lucid_duck@justthetip.ca>
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
--
v2:
- Rebased onto the latest mt76 tree
- Added Reported-by, Tested-by, Co-developed-by and Signed-off-by tags
---
 drivers/net/wireless/mediatek/mt76/mt76_connac.h     |  2 +-
 drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c |  9 +++++++++
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 11 ++++++++---
 3 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index 51423c7740bd..d0953e02810b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -420,7 +420,7 @@ mt76_connac_mutex_release(struct mt76_dev *dev, struct mt76_connac_pm *pm)
 void mt76_connac_gen_ppe_thresh(u8 *he_ppet, int nss, enum nl80211_band band);
 int mt76_connac_init_tx_queues(struct mt76_phy *phy, int idx, int n_desc,
 			       int ring_base, void *wed, u32 flags);
-
+void mt76_connac_set_txpower_cur(struct mt76_phy *phy, s8 max_power);
 void mt76_connac_write_hw_txp(struct mt76_dev *dev,
 			      struct mt76_tx_info *tx_info,
 			      void *txp_ptr, u32 id);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index 0339e2e7ab60..b2daa6c7d061 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -275,6 +275,15 @@ int mt76_connac_init_tx_queues(struct mt76_phy *phy, int idx, int n_desc,
 }
 EXPORT_SYMBOL_GPL(mt76_connac_init_tx_queues);
 
+void mt76_connac_set_txpower_cur(struct mt76_phy *phy, s8 max_power)
+{
+	int delta;
+
+	delta = mt76_tx_power_path_delta(hweight16(phy->chainmask));
+	phy->txpower_cur = max_power - delta;
+}
+EXPORT_SYMBOL_GPL(mt76_connac_set_txpower_cur);
+
 #define __bitrate_mask_check(_mcs, _mode)				\
 ({									\
 	u8 i = 0;							\
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 89bd52ea8bf7..897b065a2be6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -2223,14 +2223,19 @@ mt76_connac_mcu_rate_txpower_band(struct mt76_phy *phy,
 				.hw_value = ch_list[idx],
 				.band = band,
 			};
-			s8 reg_power, sar_power;
+			s8 reg_power, sar_power, max_power;
 
 			reg_power = mt76_connac_get_ch_power(phy, &chan,
 							     tx_power);
 			sar_power = mt76_get_sar_power(phy, &chan, reg_power);
 
-			mt76_get_rate_power_limits(phy, &chan, limits,
-						   sar_power);
+			max_power = mt76_get_rate_power_limits(phy, &chan, limits,
+							       sar_power);
+
+			if (phy->chandef.chan &&
+			    phy->chandef.chan->hw_value == ch_list[idx] &&
+			    phy->chandef.chan->band == band)
+				mt76_connac_set_txpower_cur(phy, max_power);
 
 			tx_power_tlv.last_msg = ch_list[idx] == last_ch;
 			sku_tlbv.channel = ch_list[idx];
-- 
2.43.0


