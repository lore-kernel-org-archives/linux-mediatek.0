Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56717EFCE53
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2026 23:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQJt/N82hxCdQBdnW9TOeW6Hzsl+OXAfpLbBSMq+lAU=; b=3mNqtG7/ldp24AcnO2OrlunvP4
	RPrzHgH9a1SjHpurQ6SEPZfUfsfnbHlPmEjqSxGiidVI2nF/ilR/corBLCRoNwCzM1McVWcubr1rU
	WWrRm67y3tv726Vw3crfGq9XCmR4bxoRvBGTj4lCm23fuLLhMobVtAKCqRb3yOWslKnfcM09j4llW
	gYIHwUedvAMXzH8S/it7hdyf5sHsgcQoeMqZylMtpAEImSKBPWHocPeR2pHroa15QHltfloTCrrV0
	0tKh7AA3DRvx40RqsdbCUHsO8SEQW8mDzTwL2avCnV0MSVBIBL747UjsD6g0+564aviip4r9YG6Zp
	kI/6X7wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxvzZ-00000000eEr-0t2s;
	Wed, 04 Mar 2026 23:51:01 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxvzT-00000000eDG-1jil
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Mar 2026 23:50:59 +0000
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7d1959ba05cso3779040a34.2
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Mar 2026 15:50:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668254; x=1773273054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yQJt/N82hxCdQBdnW9TOeW6Hzsl+OXAfpLbBSMq+lAU=;
        b=odntdzKVXg3n4gxFjWnFethKS78G/MZsc7C2lDVCCCwPpa+qFEKYxsC1y0pywb4sst
         HVDXUKz0qI6McDwabfgDyAGP5f6n/ZITpCz0/yBHrcs1Y6+cI2Ix7tG6/48e4LFM8jE/
         wvmRUKGI3FUktBWYkiXmB3DvUCJTxT05UfJqRiEis3EM3re4bchbIq/8WPTyl+tafWZA
         HZDWdZ8OHwpmD97W5kRwh5VjvrHN+tF14G85R9ueej6INpNBLhmorOXwE13zy3PIXp4z
         0xkdnOKJ7A4/OUxpruVPb4PR6HtKkbiWFsUAqeoRe43b3pSiafY4ifBFejwtP+v79UaG
         vlWA==
X-Forwarded-Encrypted: i=1; AJvYcCUlfxNN2RUEID/0yElRJEzuiCkCX2ydS/jhDQqqCzKC692QjpvBwU3UYawZpjrhDebok8wdxweZmFzI+Jmqcg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwcJ2IpAhe3T/eMxx8PDgKKlIx09tJibSopqxtcfLHtJ6p8o7Gh
	UNM7cwYEiyUA1TkWB1wPiqs22YYASdpP5Ju9fHjk1KfOZjicmn7z33G5
X-Gm-Gg: ATEYQzwS76D0tnmz8s7tOn+NotCKfTJn+UC11SnFM1ydVplyjkrhQAnDzrm7vNEgNWa
	K7mVRjeLsMsSUoh1CCftYSWQWoQoH/0sXF1pSQKYEiMd8EfhTOSYpNhc5Xf7e1nKGpJy6hR1oj8
	K3X+WRH7s7UYYZbtAEWK6s157ohW/bXhuE2pprrFS+PLZcamd8pUoQRV51wekmQ71YMl5cHG1Bs
	A+cqiwZGCpfrM4FuuakMibRlH1ulNWcf1vzt3318Ax7bNd9IXSGaGb/lcgB9MvllWrSalsUmNRT
	kejkD/1wg/YLWgXaK0ErXZjQj8ItuXYZjnFzh33g35ZKPeZPbfd6+fqt2giGGHANiS7wCqIjVuY
	F1OPi37vqVf37fVacWT0olqFlcxkaItUmcxn5dmlhr9+yb+k48msW30CwIj3UjJEOevX1FKzpIA
	55tbMj7HSZKgZkmSxfmIfHwhj1IHCy/QqtccbAj3a0ok8TUmI=
X-Received: by 2002:a05:6820:460d:b0:677:bd4a:8f75 with SMTP id 006d021491bc7-67b1e9033c7mr1661314eaf.61.1772668254388;
        Wed, 04 Mar 2026 15:50:54 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679f2bfee3csm14410687eaf.7.2026.03.04.15.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:50:54 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	yuchi.wang@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 3/7] wifi: mt76: mt7925: guard HE 6 GHz capa lookup by HE iftype caps
Date: Wed,  4 Mar 2026 17:50:16 -0600
Message-ID: <20260304235020.40451-3-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304235020.40451-1-sean.wang@kernel.org>
References: <20260304235020.40451-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_155055_456406_5FF60D0D 
X-CRM114-Status: GOOD (  11.71  )
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

ieee80211_get_he_6ghz_capa() WARNs if the iftype has no sband iftype_data
or lacks HE. Probe HE support first with ieee80211_get_he_iftype_cap()
and only then query the 6 GHz capa. And initialize he_6ghz_capa/eht_cap
to avoid uninitialized use.

Co-developed-by: Stella Liu <yu-ching.liu@mediatek.com>
Signed-off-by: Stella Liu <yu-ching.liu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index e050c2795cb4..261ed6528808 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2436,8 +2436,8 @@ mt7925_get_phy_mode_ext(struct mt76_phy *phy, struct ieee80211_vif *vif,
 			enum nl80211_band band,
 			struct ieee80211_link_sta *link_sta)
 {
-	struct ieee80211_he_6ghz_capa *he_6ghz_capa;
-	const struct ieee80211_sta_eht_cap *eht_cap;
+	struct ieee80211_he_6ghz_capa *he_6ghz_capa = NULL;
+	const struct ieee80211_sta_eht_cap *eht_cap = NULL;
 	__le16 capa = 0;
 	u8 mode = 0;
 
@@ -2445,11 +2445,18 @@ mt7925_get_phy_mode_ext(struct mt76_phy *phy, struct ieee80211_vif *vif,
 		he_6ghz_capa = &link_sta->he_6ghz_capa;
 		eht_cap = &link_sta->eht_cap;
 	} else {
+		const struct ieee80211_sta_he_cap *he_cap;
 		struct ieee80211_supported_band *sband;
 
 		sband = phy->hw->wiphy->bands[band];
-		capa = ieee80211_get_he_6ghz_capa(sband, vif->type);
-		he_6ghz_capa = (struct ieee80211_he_6ghz_capa *)&capa;
+
+		he_cap = (band == NL80211_BAND_6GHZ) ?
+			 ieee80211_get_he_iftype_cap(sband, vif->type) : NULL;
+
+		if (he_cap) {
+			capa = ieee80211_get_he_6ghz_capa(sband, vif->type);
+			he_6ghz_capa = (struct ieee80211_he_6ghz_capa *)&capa;
+		}
 
 		eht_cap = ieee80211_get_eht_iftype_cap(sband, vif->type);
 	}
-- 
2.43.0


