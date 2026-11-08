Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E616E606A320
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2026 07:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cB2U8Ysd;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H/22/pGY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kq/pBnPAAVkr3tVitWJ2EsieKSmgkTn09+Ghh1ZSyG0=; b=cB2U8YsdWcQjAi
	CMSo9qpVosvzMurG32KAjQAEfRj+PysVlVw1Lh51IRNb+tMw4uAt5G51HHtVuv74GbU+Z9DNwtwWr
	lDO5DtiR5c7piu0dLzhTm4rUzotb4He9IFzRM5w7ehk5YgC9uLI+imTbGaD2xWu6ypWzzoihz1aNk
	UqJIRx3XIrA61A8pLEVTNY6aY4C61+bNApF/zWIQ7y7725eFI/Zw7I+er6SL3OJrhxnTxc6q3hMvW
	jk82jwDKBf8XWk1saLGtbaz9plJn7gaVchSsdlGFzC37bPp91uAOXipUmVdyvbs4auwMziQaJAEOM
	zSrlvxCAi2Yue8j03gyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPxBr-0000000FmQu-2kR0;
	Sun, 08 Nov 2026 07:19:47 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPxBo-0000000FmQO-3ouk
	for linux-mediatek@lists.infradead.org;
	Sun, 08 Nov 2026 07:19:46 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-1a8cc11ac42so64577c88.0
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Nov 2026 23:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794122384; x=1794727184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kq/pBnPAAVkr3tVitWJ2EsieKSmgkTn09+Ghh1ZSyG0=;
        b=H/22/pGYsT19+ITuiIUqY/mzMHJ1c3R4k73kCYd10gHvtZGXZJTH8Sxs36MzcAjJX5
         S3jBZqAi3RUKz72bwF5CGYfGyuy+OEkEdTay0A/9VBDf3YPQcZctCs2KGVBmrjRRnRJm
         vc3raTgrna1lTBqfAyDY1DRrFJ2tpd0cTKPRmWsTSAbosyRWJN9i42i+nhmpKKkGJja1
         jWNLw9Z+IvrL7ZJrwJ3uqUtmWcTMQp+ZV8XWNcga6Q1c7r+2nq2FsI2JnZ31lFlLJs11
         iI34yzyZwhERAS2YXqhIQVWmBJDTGtXlVJfT4N4aQmJYW7yFKExErm5W/TFTWcFiUWxT
         hfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794122384; x=1794727184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kq/pBnPAAVkr3tVitWJ2EsieKSmgkTn09+Ghh1ZSyG0=;
        b=anOfiP0HpnobNx30+Z4N1YENwlynG814uJEA+4Ey4r4GeRxX3iCR8sa8lL6etGm6UO
         CAQGUUMZdqnEkV4C4/VyOIt2Cxod1WaoyGr7Sg/FWB6uSdHn4QNgu8hKPbjIRqNSGghf
         QUlmRZG/mXWDzgvvFiEkwxc0SAr1QXawY4TVW6koDeDR6psyC/6QHVMoIWaYnLpYSwai
         Bc1oZmJTdYSOnWwsaDGdyPHqfE3f0W4I+NyckNnIQP5xaazjkC3xjkgklaF2q90pB0bM
         1ERI377idzDnep4V3k0f7GFFgrTGdsc5CiY0PTQBlnyXbUGyUaP5TxEbnFpP0ayHK6dI
         gHdg==
X-Forwarded-Encrypted: i=1; AL+hErEMT+ttIrodmZSnRZZO2lRwrmz37GJFTUMBCcJ5INq7jd7vXx58ZmFDx3AbPgfAknp4wJmUnqLYrpeD/Pj63Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z8qKnGgpFZjXwYBQi0Kmb1uOtIjMFWbRJC1OqVN1ZIrphjjjK6f
	5JB1EoHDmT38AF+eiWBPeldrzzvRyyOzw1QuxDtv7eF4qmLVPZ1tqTTz
X-Gm-Gg: AYBFou11D5lZ4sQg90tqvYR+sl6jI9ajnY3N93dB/vTAWxAeEdvIjsC+8JfSpukGJ/k
	gAxeEwJggnQecpxsJDw5C5LfjYXgg3iiLYNsVT/3Yt/4iZ2Uu22OIFCRqYoioubDmWxACtum8tH
	RlawEvl7PdRRU1wP32CR3TaRrZbSI3InNsFC91Npq/SHyKrRy0aiEwWq8+ozQknAKQVHPwDFXPD
	4FAYWpXoYdTMg93j4jARdquGXkz+YVMBVddsQeDHg7nHpLOGqoBWCfmMzq3xobrmI5Mhi8HeAiQ
	mrxZmZLEclHEoivptoFTmsjidT3MWgTI3k/DfRDfwS0L0EhuFrag6dJXidebj6aS0CEXpgQz59b
	GN73o3NFCIzbKdPKYgn5khr4OVF3FL1MEtU4KQEdX8/3mR/M8Gxi5EpW7Upz45EpnMvEgjGwsMW
	hkqcW4X/4CGE/O2O1mUGmHoC2AoARymtKBtBG1UimXQ8fLY944eQ100tVwyZHGv8CF+Whrp5YpF
	LoUOAyJB0mpBGeT0pEA7FoqXCxxYJEs40VzRb1jg9mh9p1eb03LLVaZ/uQRucF+Mm8ycFc5m84Y
	buF8Xm3zmuzVncJpYNJfAw1thuHajEOxdy8PR/UuU8cMDwk=
X-Received: by 2002:a05:701b:20ce:10b0:1b2:3b5b:b80b with SMTP id a92af1059eb24-1b39fe87af9mr1150003c88.8.1794122383860;
        Sat, 07 Nov 2026 23:19:43 -0800 (PST)
Received: from cachyos-x8664.nitc.ac.in ([61.1.180.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8911sm4207262c88.5.2026.11.07.23.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 23:19:43 -0800 (PST)
From: John Robin <johnrobin044@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: kuba@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	John Robin <johnrobin044@gmail.com>
Subject: [PATCH v2 2/4] wifi: mt7601u: enable AP and Wi-Fi Direct interface modes
Date: Sun,  8 Nov 2026 12:47:44 +0530
Message-ID: <20261108071820.35303-3-johnrobin044@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108071820.35303-1-johnrobin044@gmail.com>
References: <7ededd2f-98d0-41ac-91b4-2977963c4637@gmail.com>
 <20261108071820.35303-1-johnrobin044@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_231944_955644_09CFAD18 
X-CRM114-Status: GOOD (  11.22  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Register the AP, P2P_GO, P2P_CLIENT, and ADHOC interface modes in
mac80211 to allow for concurrent Station and AP operation. This
defines an interface combination supporting up to 2 concurrent modes
and sets NEEDS_UNIQUE_STA_ADDR so mac80211 can automatically generate
MAC addresses for the virtual interfaces.

Signed-off-by: John Robin <johnrobin044@gmail.com>
---
 drivers/net/wireless/mediatek/mt7601u/init.c | 31 ++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/init.c b/drivers/net/wireless/mediatek/mt7601u/init.c
index 5d9e952b29664..e871f7b63cb35 100644
--- a/drivers/net/wireless/mediatek/mt7601u/init.c
+++ b/drivers/net/wireless/mediatek/mt7601u/init.c
@@ -12,6 +12,25 @@
 
 #include "initvals.h"
 
+static const struct ieee80211_iface_limit if_limits[] = {
+	{ .max = 1, .types = BIT(NL80211_IFTYPE_ADHOC) },
+	{ .max = 8,
+	  .types = BIT(NL80211_IFTYPE_STATION) |
+#ifdef CONFIG_MAC80211_MESH
+		   BIT(NL80211_IFTYPE_MESH_POINT) |
+#endif
+		   BIT(NL80211_IFTYPE_P2P_CLIENT) | BIT(NL80211_IFTYPE_P2P_GO) |
+		   BIT(NL80211_IFTYPE_AP) },
+};
+
+static const struct ieee80211_iface_combination if_comb[] = { {
+	.limits = if_limits,
+	.n_limits = ARRAY_SIZE(if_limits),
+	.max_interfaces = 2,
+	.num_different_channels = 1,
+	.beacon_int_infra_match = true,
+} };
+
 static void
 mt7601u_set_wlan_state(struct mt7601u_dev *dev, u32 val, bool enable)
 {
@@ -599,6 +618,7 @@ int mt7601u_register_device(struct mt7601u_dev *dev)
 	ieee80211_hw_set(hw, AMPDU_AGGREGATION);
 	ieee80211_hw_set(hw, SUPPORTS_RC_TABLE);
 	ieee80211_hw_set(hw, MFP_CAPABLE);
+	ieee80211_hw_set(hw, NEEDS_UNIQUE_STA_ADDR);
 	hw->max_rates = 1;
 	hw->max_report_rates = 7;
 	hw->max_rate_tries = 1;
@@ -607,9 +627,16 @@ int mt7601u_register_device(struct mt7601u_dev *dev)
 	hw->vif_data_size = sizeof(struct mt76_vif);
 
 	SET_IEEE80211_PERM_ADDR(hw, dev->macaddr);
-
+	wiphy->interface_modes =
+		BIT(NL80211_IFTYPE_STATION) | BIT(NL80211_IFTYPE_AP) |
+#ifdef CONFIG_MAC80211_MESH
+		BIT(NL80211_IFTYPE_MESH_POINT) |
+#endif
+		BIT(NL80211_IFTYPE_P2P_CLIENT) | BIT(NL80211_IFTYPE_P2P_GO) |
+		BIT(NL80211_IFTYPE_ADHOC);
+	wiphy->iface_combinations = if_comb;
+	wiphy->n_iface_combinations = ARRAY_SIZE(if_comb);
 	wiphy->features |= NL80211_FEATURE_ACTIVE_MONITOR;
-	wiphy->interface_modes = BIT(NL80211_IFTYPE_STATION);
 	wiphy->flags |= WIPHY_FLAG_SUPPORTS_TDLS;
 
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
-- 
2.56.0


