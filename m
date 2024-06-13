Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04999C27C6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDdCS5wTSvZ4XBL7ZL9EjuprlNu9A2pnAl8ILdhp1NM=; b=sWDYJD8ZdiDYs8GHZZSehilvQw
	1GFLz1mwiBo7JJOu0Z4ecrBkWk4/7xo+zqUDzCPjIKRw9k4AQXyuzT/8MV70eB6f7iY2zyVB3ST2U
	MgdQ2+WpYSm+XruYURO7aG5NfhmLrqpH/rOkBYqxAp4eGjUtd8nXYCHSiFzNZp7gnUj2XwEhgofQB
	gT/SUojcR/u2ECOaClKteQ5/sZM/TNEWxASLQbx7TJH54NGeppjeH2yxxQ1fPHtOEMMmHPNxENXPi
	ZfQf/K4MfB2rbYKO35dseYuvj3W2oz9gWgCSVCbtbPHkZGzKS+Eh2wtFnlTAT8A5Ed65U9pYQhRjf
	xDs3qCVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHaku-0000000EwBl-2iAF;
	Thu, 13 Jun 2024 03:04:05 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHako-0000000Ew7D-3Cwt
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:04:02 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-254e7bdfac1so83257fac.0
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:03:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247837; x=1718852637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDdCS5wTSvZ4XBL7ZL9EjuprlNu9A2pnAl8ILdhp1NM=;
        b=dMyjqWtJ1+tvr8Xbb+7GddxX1wW4OYt8D6/kWEh2jOPqndaMVYUjFTsv6/lU6jjJOQ
         HdZ3wAJ5KkeNpQOLYLF6Ajr1oDJOiwqLMJck4jwPxhgoN/t8Jvtn/Gb86z8oGoABfLE4
         b6rGFHUJOZcy5hGzYOz/lpzFPDHoOJbwiuo4ekZV41X0Ot9POtRYTgi3zZS8ZI0UAKZI
         ITs/eBnK7L6h4eWskL3tfLIgSx/2g3Q/2ffNipBPBpoQaEIFYQIQ4rlbv1slR7mrz5Cy
         AvfWuTcUMcKw8KxXT+LBSUs7xDQcbn+mXE54TccQRC0QeDzzfFf2105T0be10gy7PbpY
         liPw==
X-Forwarded-Encrypted: i=1; AJvYcCVA5XtXALZKSr2UT7bdTHGDFobZz1msrKLk/tnUemhTzAnu6U3liENlfcoRmJvqbjRm4cqNli7ylBwyfrO5QmtveyjPKPdaeM+oFw7RNu9PLC+A
X-Gm-Message-State: AOJu0Yyuyak020Kq5QyAgiJ2nKppd2ne7OG4jFM+knhYjgfaAYO5B2v4
	/9WAjJUQATGciUPi7qk+PrL2vfL0Tu7LecUQyLnLtaUYJYlv+aDC
X-Google-Smtp-Source: AGHT+IGYteeIl0hbP50uC7mXetKY9ae07NNSA+90LC4OT/5TPcu7XyaM2tMVgvkcaDY43dbLLtudjA==
X-Received: by 2002:a4a:8552:0:b0:5ba:ca86:a025 with SMTP id 006d021491bc7-5bb3b7a9135mr3997317eaf.0.1718247837460;
        Wed, 12 Jun 2024 20:03:57 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:03:56 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 34/47] wifi: mt76: mt7925: extend mt7925_get_phy_mode_ext for per-link STA
Date: Wed, 12 Jun 2024 20:02:28 -0700
Message-Id: <20240613030241.5771-35-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200358_964727_FB3BF810 
X-CRM114-Status: GOOD (  12.02  )
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

Extend mt7925_get_phy_mode_ext with the per-link STA configuration.

The patch we created is a prerequisite to enable the MLO function in the
driver. It is purely a refactoring patch so the functionality should
remain unchanged.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index a0fd02dd9551..32ea71128280 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2035,16 +2035,17 @@ int mt7925_mcu_set_chctx(struct mt76_phy *phy, struct mt76_vif *mvif,
 
 static u8
 mt7925_get_phy_mode_ext(struct mt76_phy *phy, struct ieee80211_vif *vif,
-			enum nl80211_band band, struct ieee80211_sta *sta)
+			enum nl80211_band band,
+			struct ieee80211_link_sta *link_sta)
 {
 	struct ieee80211_he_6ghz_capa *he_6ghz_capa;
 	const struct ieee80211_sta_eht_cap *eht_cap;
 	__le16 capa = 0;
 	u8 mode = 0;
 
-	if (sta) {
-		he_6ghz_capa = &sta->deflink.he_6ghz_capa;
-		eht_cap = &sta->deflink.eht_cap;
+	if (link_sta) {
+		he_6ghz_capa = &link_sta->he_6ghz_capa;
+		eht_cap = &link_sta->eht_cap;
 	} else {
 		struct ieee80211_supported_band *sband;
 
@@ -2104,7 +2105,8 @@ mt7925_mcu_bss_basic_tlv(struct sk_buff *skb,
 						      mconf->mt76.omac_idx;
 	basic_req->hw_bss_idx = idx;
 
-	basic_req->phymode_ext = mt7925_get_phy_mode_ext(phy, vif, band, sta);
+	basic_req->phymode_ext = mt7925_get_phy_mode_ext(phy, vif, band,
+							 &sta->deflink);
 
 	if (band == NL80211_BAND_2GHZ)
 		basic_req->nonht_basic_phy = cpu_to_le16(PHY_TYPE_ERP_INDEX);
-- 
2.34.1


