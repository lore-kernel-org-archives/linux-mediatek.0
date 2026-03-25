Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF17CFEA807
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2026 04:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ardnxVXNLFnPNOoWJ45iMbsoAkD72wP/0L1ROL8+ewU=; b=sZhLZmSiRPOhgDmptoIQLZktih
	WSbmy3ZaIhGZRlc3kgZaNlwXJzWX9ocDS/nBTrXu7ANHiq54VWDt6cLJ3y/DD5/OnyGnMvg9HYWHN
	bAeeARbQROKxpWUKn5bGdmdE3dr6RPtkzitJkmNqhNLKH3cmVAVEyeTUJtbcd/U1a2mBVXfF3JKqO
	ZyIMQWUo/V40C4LpU4GRiIVZe28yNsmxoFx/q06ioPT0Fjy0P3IdPdEuef6ALg0GoqBFqAldt1+in
	ailWwaHc/sXEnVONLRslOKUNnrtcjFicCag0jJLgL3H7Pj/54QzM8Zs+ADogiIGFvYx+teFjWUFTF
	CfR50cuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Fw2-00000002gUu-2mhm;
	Wed, 25 Mar 2026 04:33:38 +0000
Received: from mail-yw1-f179.google.com ([209.85.128.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Fvz-00000002gT4-32Tw
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Mar 2026 04:33:36 +0000
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79a46260385so22175337b3.3
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Mar 2026 21:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774413215; x=1775018015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ardnxVXNLFnPNOoWJ45iMbsoAkD72wP/0L1ROL8+ewU=;
        b=kTD78q5khE6f/z2VCb1HButpmlhOoJvoZrb2U6SM22OK1pcr25ydT71brhBbh8ACW5
         6BNLTz8YIABvWx51rtYkZSOr7n0epFv38O6Ux7AYICRb88CLgXS3jNr62ByL4nkzgfek
         VM3cNyHPMjr2gSU0GwfvH+Z//8uVlNXnQZe+dolL6swNCCOyYJK5U9v0x8+Wl3GkvUYr
         OWPGu3xYJiYQyUGPHbwZMYval5z30p28YdG+OeY3f4LvaIy3Ys20+m8DL4ZUrZTDQrpN
         W0pUVv6lbqzObtaFwcSfYYqCb+YHHRpl11VsApu6T5u+lQcW+P3C7Qf1lENRn5Y44h8o
         FgZA==
X-Forwarded-Encrypted: i=1; AJvYcCUDR2m4JZWwpkgatgUc/JDVJvXjLGxoizFfkX8Jl5jbDCb0MHHM4eT80mVXZ43fO/HGBfpRqtrBbbMyOHLv4w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx83nJDAJtkGqsNN6YcgMXvfaYZd94WvBYonV0iBqxcAZZwdxp
	LgBhEe1FisOQZeAylvcGCA0cNf6B/oXRt9kTj1FXB6V46Ksjie2U+1dd
X-Gm-Gg: ATEYQzyqT+meb3AvE5Z6magKE9rF6FICqgsirbgz7eDfdxhjQejxkXQ7JA6X27Ju8uT
	fxqBCCgtd9/6SHzGWQc81u9GIhKn6exVKW4esmbyeNB/jz3vVL7xWyjCifN+9Fx9Vd8pndwIUef
	uI7UK9tGsRmPhAh5HQflucvolEd7hxtYE2ppoIUvXUs2zyjv8engW2KwvlKEFMLgPAiOlLL4d3q
	iGI5bPxOVzjb3tVNsRDdPpf+6stJfjVp4H7WYzGdYhQ4/4W5l7MvZPgDd6+MzDMeB/G55KKSn+N
	ARES55KwdcNRA4Otl2+tEBg40eXfH3QHn9OZjhhCRtNB3WLS+SLv/GU759y3fHNMHXWTj8WlvY8
	zQb4Lq2BNExcs6npnVJIagTNAW7sfq3meiB2Mrj81lXWnOFQSxAgmhiOblZSYLyTc1gSBhEuJwf
	JfsFHUeFUIjZp2uhxWm2qyiTRijMMH8znYEu8O7gkU6eKsriLcE3fU46AY5Q1E4gN63Ufyasjva
	w==
X-Received: by 2002:a05:690c:6:b0:79a:c701:28c5 with SMTP id 00721157ae682-79acf4efa39mr23359817b3.27.1774413209816;
        Tue, 24 Mar 2026 21:33:29 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:3916:ec63:baa5:b5f0])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a903e0b8csm82707977b3.12.2026.03.24.21.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 21:33:29 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 2/3] wifi: mt76: connac: factor out rate power limit calculation
Date: Tue, 24 Mar 2026 23:33:17 -0500
Message-ID: <20260325043318.13298-2-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325043318.13298-1-sean.wang@kernel.org>
References: <20260325043318.13298-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_213335_776033_9E2B1772 
X-CRM114-Status: GOOD (  10.24  )
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

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
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


