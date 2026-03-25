Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04D0FEA807
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2026 04:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2obK+0//qjZWU2JZcp5VyDPc6Q6QS5+BiBkfTjrf2jM=; b=ESKJVpVBJqJR7eMqGxRC12jLLJ
	ELvXHZBn7fKdzm6vDXZsAwYBck/x0u/iY51efnwm/6hWWxEhwndimOsoOG1hxK40SQjGl7x76mi3Q
	v9m4PYLKLEJR2jY1UtaSBeYeEF+AvFSIpoQ2y/VCD7P3wkEVSIBaIPlrM0RgXjtNNpBa0qIXz/voY
	rChkIbfDgoXAejxipEuMZ2oiWEBmljoEWMe5XQlRe3UKa1UVYd84TYWb2NGN2QDm6vPaWZeOiPKZY
	c6m/+o/Nv1HvW0doJ2vsGZl1FVM2E8jdA77OocXppvxCFwn3B8KmxtqjWJ1hOM3WOux9Cp6O2DqJk
	0DlgeKBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Fvs-00000002gRj-3gu7;
	Wed, 25 Mar 2026 04:33:28 +0000
Received: from mail-yw1-f179.google.com ([209.85.128.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Fvq-00000002gRL-3WVJ
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Mar 2026 04:33:27 +0000
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79a3e2e64f4so15871687b3.1
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Mar 2026 21:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774413205; x=1775018005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2obK+0//qjZWU2JZcp5VyDPc6Q6QS5+BiBkfTjrf2jM=;
        b=qrAPQLv6kTK7iKjrwa41yu2mAMu1/Lt5bW+IB0b+ZxQ2RmWO7fgnq5ol7vizShrViE
         LgjOHE8DpVvoZxgD54eVfQCgHkQDXA6vC8WtW/9wQuKArf67Fr80Vq5sVS4wTz1XbiF3
         TZsV2BS6QqrfmMEfX3M4/X/vAxZL9LqLFrS+gBXnZYVJA8mCfgMzZrY/AMBaXVsemGD/
         QsB7P+VL4WCGPnV+PFav/ZWWcEZKwBdoVETmJX13H3kzhBeJhuY471vo7pIrPWA9W9Ds
         q1/OtImz2eszremE/JMDkjVYHtq9b6tEyIgEo91WxkCmkjQunLWe1RsqjECBWr7K/Yz4
         C0Yw==
X-Forwarded-Encrypted: i=1; AJvYcCX187N8wMYUYfLuF2+8oP8vSdlV77bIWFoKX3GUG4h1Whhd09BCEwrFprjjJb4nxRqvrPNvsh5+mjE7CZG9fg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJLXuidikUfas45lfjKBj24xvorq2Otm+WOoceeUtdYaubiOZm
	jDO/WVp1gkT/qaOQ8ltpeys0b0xm+Mc3+V2TH2FJJJLHEhSkneFyCKODqezG4g==
X-Gm-Gg: ATEYQzzfrx2+2fA9m+w//pc+6sRyFMh8lXCl2eojZeOtMpxP1qd1nqXCVYDgP1UlLmq
	5WWluqOmT/z8iJctY2N8YKYEeMVDf19pwXwdgPkk2TjibkpLzn0wcmFLhHP8t7Gf+jhO6AOSGOz
	6KrWEBx+oPhf8An/kYemjic9qMflL5h5MIkzMjzXlR4zwvtm/am5RoVX7vvjU8GqFP23QEb+Y36
	ppUAhnv2Q72IM2j7Gc/wAjac0LzHcmhTp6BuE7DFRxaHFc/pRF4Sf3efpB5N5dgLj3X7ZgFbqbF
	A0czhv8bURZWqN2EVkx+dDixW1m8iKVzyb8xnenumku7UrRuFPpje3/+cVuEcOOYTXCTyQ9IHNJ
	VdJ6R6tA2NdxJIcV6LqjCA9FyWsEjafZhzoDLhps2jCIE/Fn/U6OSKG4Pw8I3gzSv1PmRyBkFjY
	ICx+8UGjvZQeTIv9GhtFrdUggJwzPRYak1T2uzF91trCJUtz8krC11OE0nDEL5yaQMUl3uMxJI2
	g==
X-Received: by 2002:a05:690c:4a10:b0:79a:b118:4386 with SMTP id 00721157ae682-79acf728b0dmr20936267b3.48.1774413204969;
        Tue, 24 Mar 2026 21:33:24 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:3916:ec63:baa5:b5f0])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a903e0b8csm82707977b3.12.2026.03.24.21.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 21:33:23 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 1/3] wifi: mt76: connac: use a helper to cache txpower_cur
Date: Tue, 24 Mar 2026 23:33:16 -0500
Message-ID: <20260325043318.13298-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_213326_910068_428DABBD 
X-CRM114-Status: GOOD (  10.80  )
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

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
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


