Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40B310FCAC9
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2026 18:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFwAsGzOmBHffBxJWkSRpHG2Hwbi2J13ykcPgyMD9uk=; b=G+dUOd0reKXomiAWPI3LYtDMTc
	Cus/spXk1riIfjZ+DRFkL/AQGpye/HVy5mdbpLSFY+eCpuRAvaQrm6wyLdWx+pSys8cAgRaE8P6yg
	6Uq2qk2U2aiweNRaQx6DgI6kPcNUDqY32wCSSboHSX/qdCtGrIiPeDI32A4DS/iwZ8qm1RzmZc+7o
	tcFzyBNc71HVe7Cs0Nnt3KFwIZmEou0dzxlo4h5T+nN4nqK01nlHucbGEnvJLMsxXQZwKG7psic/8
	opT+ZsI16ukU8kkvUMhEK8O6J4n+AOPOUEVu6+b92nnhukLnRYpk5Y/dlQ/0dLI30p4WiS1bc4A+D
	Mt3LU8uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w80E9-0000000FxI5-3Krh;
	Wed, 01 Apr 2026 18:23:41 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w80E7-0000000FxGw-3Eab
	for linux-mediatek@lists.infradead.org;
	Wed, 01 Apr 2026 18:23:41 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-4042905015cso46032fac.0
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Apr 2026 11:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775067818; x=1775672618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fFwAsGzOmBHffBxJWkSRpHG2Hwbi2J13ykcPgyMD9uk=;
        b=AP9Jg7+j91MbI99SdmSm06im+Cr5/eh6J2ictmgKe2FI8HOmAMmjv5KRNd3lxSI1j+
         Mx6shsVq6xjJSutefLrgjLHrjt/HcB4R0t00XqmOu7Q82YwbuNgymKwEu/lCwnysn3DU
         y+xSOnKIrisFlIW2MUX0r9apkSVhsLndtOrKWmiGSqbHNb/6LjeoX7SSZzMLejGmJaXN
         GELqmwhuNWaZMGmL/R+5IIXaKhh9FKjVID+HRuBL29e7BK2Zqf+hMC6/a4QHkCOlBab8
         F0/GzGtiX5Ybyon4EA7WkiLsVGUxwizNwB1YRQ9o7+gm/GrmAMWtl1NyO0W7hgzxOYqI
         yoxA==
X-Forwarded-Encrypted: i=1; AJvYcCUCOJlkvIzFkdfTCcagIdr4uJB6FJH9EeVes0spNh7ItnRTxKR1PLyh1Ou+WYlf57c1XySX7RffSOyXQ3UJGw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1YJqaVPU+cIqZYEWzGnl4L1YSru6uFt5WndYUt3OPqdpkd5Pd
	kuKBsQfMwOLu+vq+C4E2aq2t/5+h5W+nHrWWi4Vj8UUvyRARFI0u8cJsZGioqQ==
X-Gm-Gg: ATEYQzwGdXDaGtorjk74vDFCcZsBhdff8GW/+/4v62jktwUVACtTXqtpH/69JrE6up1
	F9FpfwISF99QDtJ4Ly3ZkWBqg3sVmooXhtErk31Ddc/Yq3/r8LlcIC58Nut5TAUv7cLZNZQy90j
	WHaXiZnF9C9CEANRr3dyQlqp/Zn/32VrYpEIiudU8QxJe1ylyXWCK3Xuhk22JmH3n4lzCMd0p4Z
	6KKwecp8A1gOF12TRXOjQw1VsIbJ8eaKYtGWIT9GyZmCSsTF1i9N0kXO69KIWh+TvVRzzXutthp
	cWrdICf4zsTowHBNGlyPOBDle5cDlngaEFDN51UPni1yfs+LDgpchu14Y4z2K5dnSpDaAwP0Zl+
	0medd/h9L+Kw6PPBgpnYULqOQMpwE+XwZrv+BswEcDGqrmKWckLInGHAkBDPynrwH8gVun2xirA
	oVbqbn3eYkqvMBGD1aN8IM99f/PyXpCVFkuP0B9gyhe6pZNFVF9PmniA/x7A==
X-Received: by 2002:a05:6870:2012:b0:417:5b7a:704b with SMTP id 586e51a60fabf-422cfec06abmr2923345fac.31.1775067818559;
        Wed, 01 Apr 2026 11:23:38 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-422eb3c9e06sm386778fac.15.2026.04.01.11.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 11:23:38 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Devin Wittmayer <lucid_duck@justthetip.ca>,
	Satadru Pramanik <satadru@gmail.com>
Subject: [PATCH v2 2/3] wifi: mt76: connac: factor out rate power limit calculation
Date: Wed,  1 Apr 2026 13:23:21 -0500
Message-ID: <20260401182322.64355-2-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401182322.64355-1-sean.wang@kernel.org>
References: <20260401182322.64355-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_112339_817462_A1188F42 
X-CRM114-Status: GOOD (  11.27  )
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

Factor out the per-channel rate power limit calculation into a shared
helper.

This avoids duplicating the same regulatory, SAR and rate-limit logic in
multiple paths.

Reported-by: Devin Wittmayer <lucid_duck@justthetip.ca>
Closes: https://lore.kernel.org/linux-wireless/20260130215839.53270-1-lucid_duck@justthetip.ca/
Tested-by: Devin Wittmayer <lucid_duck@justthetip.ca>
Tested-by: Satadru Pramanik <satadru@gmail.com>
Co-developed-by: Devin Wittmayer <lucid_duck@justthetip.ca>
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2:
- Rebased onto the latest mt76 tree
- Added Reported-by, Tested-by, Co-developed-by and Signed-off-by tags
---
 .../net/wireless/mediatek/mt76/mt76_connac.h  |  3 ++
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 28 +++++++++++++------
 2 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index d0953e02810b..1549a97873ee 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -421,6 +421,9 @@ void mt76_connac_gen_ppe_thresh(u8 *he_ppet, int nss, enum nl80211_band band);
 int mt76_connac_init_tx_queues(struct mt76_phy *phy, int idx, int n_desc,
 			       int ring_base, void *wed, u32 flags);
 void mt76_connac_set_txpower_cur(struct mt76_phy *phy, s8 max_power);
+s8 mt76_connac_get_rate_power_limit(struct mt76_phy *phy,
+				    struct ieee80211_channel *chan,
+				    struct mt76_power_limits *limits);
 void mt76_connac_write_hw_txp(struct mt76_dev *dev,
 			      struct mt76_tx_info *tx_info,
 			      void *txp_ptr, u32 id);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 897b065a2be6..1117a22c70ac 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -2223,15 +2223,10 @@ mt76_connac_mcu_rate_txpower_band(struct mt76_phy *phy,
 				.hw_value = ch_list[idx],
 				.band = band,
 			};
-			s8 reg_power, sar_power, max_power;
-
-			reg_power = mt76_connac_get_ch_power(phy, &chan,
-							     tx_power);
-			sar_power = mt76_get_sar_power(phy, &chan, reg_power);
-
-			max_power = mt76_get_rate_power_limits(phy, &chan, limits,
-							       sar_power);
+			s8 max_power;
 
+			max_power = mt76_connac_get_rate_power_limit(phy, &chan,
+								     limits);
 			if (phy->chandef.chan &&
 			    phy->chandef.chan->hw_value == ch_list[idx] &&
 			    phy->chandef.chan->band == band)
@@ -2967,6 +2962,23 @@ int mt76_connac_mcu_rdd_cmd(struct mt76_dev *dev, int cmd, u8 index,
 }
 EXPORT_SYMBOL_GPL(mt76_connac_mcu_rdd_cmd);
 
+s8 mt76_connac_get_rate_power_limit(struct mt76_phy *phy,
+				    struct ieee80211_channel *chan,
+				    struct mt76_power_limits *limits)
+{
+	s8 reg_power, sar_power;
+	int tx_power;
+
+	tx_power = 2 * phy->hw->conf.power_level;
+	if (!tx_power)
+		tx_power = 127;
+
+	reg_power = mt76_connac_get_ch_power(phy, chan, tx_power);
+	sar_power = mt76_get_sar_power(phy, chan, reg_power);
+	return mt76_get_rate_power_limits(phy, chan, limits, sar_power);
+}
+EXPORT_SYMBOL_GPL(mt76_connac_get_rate_power_limit);
+
 static int
 mt76_connac_mcu_send_ram_firmware(struct mt76_dev *dev,
 				  const struct mt76_connac2_fw_trailer *hdr,
-- 
2.43.0


