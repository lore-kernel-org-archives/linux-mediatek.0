Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862B9C02185
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2025 02:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Z5nZ9Qy6TBKcXoruppicIm/anRrncBfElUKQXmiVQU=; b=znICQBrkL7Hpaweivh//YuXVUZ
	dnCjxmTmkDbZ2hgIlIoyKCnivk1dDVyYyGnDtgaWloV5kblaRjPXxv7SMHlN6AULjNMmJEz7mSNI6
	0GmT4IJwB+gL7MheZ/buIvsFrm8KSmxch+aw/z8XWjv/xchBepOXSRVES2TnHUjwfPlD9YsukP/tE
	6g69PAWMaCW1LOpSWe4S8yPpFepkhEYyh75S6E66uvQi40ow6Xhng56jqcPbSwi35afVsqL04SuZl
	X6B+uwZqNq9gmxy62QBvMKuDgGpnk8dkqVhbqrHiSnKFJyPNiVPJypeUbDi6qjasOn+/vtFVjlIK9
	Me6rsZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXWLh-00000007D3Y-2h0o;
	Tue, 14 Jan 2025 02:08:09 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXWL2-00000007Cz8-0sRE
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Jan 2025 02:07:29 +0000
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3eb7ecc3c54so2595476b6e.0
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Jan 2025 18:07:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736820447; x=1737425247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Z5nZ9Qy6TBKcXoruppicIm/anRrncBfElUKQXmiVQU=;
        b=Rj+QRpPGdeHpiEHVaDhI+JWryakArjC1fLlMAYO/dnhU85atNuf3yroYeFi24dBBZz
         DW7zLeugE/E2sORmPlWNN7TUQTBQ8mYVFpFjdvuu8Kt2wFvyksie0soSiid87jL7JZv0
         rmhq/xScOLE5byuIWGwmd5ZABiO3omDYH21ClibORjNLG98Fysb3cdofh+Sjaga8AMQZ
         Kxn74LGcBJAXBvwRhGc14Snvgh/v/O49hVtYS+BaZofnh6Nj+7xTxUXHi8yS0BeWp1uR
         UA3LG5rywXV9lYbw+1in5AuEVG1Viuh16VkpMPxNehR/wdUPrMOamABG+PWNv22l1VsH
         IYyA==
X-Forwarded-Encrypted: i=1; AJvYcCWr4OL0U4f5WrJ2FBwRU1gzrc7WEgbdpIsauXfb/qMU3P7bORoxTq2K22dhM5VeLXC6AeUwjCDsvcYdsFt9AA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKPqKnGwiGko+0RB8o+DSTafr+A/3JEs0jvVdUob1HXWIQBgPk
	E3bA2WLJyfxl4QOMYqt3DgNrKQXhn5RQaoXwOjVyMYjJ1+9CtFwIONzkzuri
X-Gm-Gg: ASbGncuaAQCSigugw8mFbk6Xwrdo2LirhHfnlQONFbWVgh5EpM08YyAqTWCHBvoY/8F
	b34GVbJOUydXj0dRScYoHZZHAFPqziiwbNAKS4NaQsOpXpyMJbt7QFansEMFesdKDc083kb0s02
	UoeIx5qYgO5TJp9pT3o15hQ+YEWd+y31ek5Zyqhb/OgX2UcsV6ImNTbaAs2WJ0GmYzUPIuGQQid
	vIiY9iA40/qgoKYoop3XLIApvAPPye5iMNemCYNTbFBIRzNf2ixDSkXKN6EsrzUqult0oAuvA==
X-Google-Smtp-Source: AGHT+IFPnxxgbKjlJbwdgjkdDZ23zr97Zrq/9q+Ux+jFcDA4w58GsYGswXUPdk/KqYG0HgtKz1Q0yw==
X-Received: by 2002:a05:6808:350b:b0:3e8:1f5d:b804 with SMTP id 5614622812f47-3ef2ec96cdcmr12856369b6e.15.1736820447188;
        Mon, 13 Jan 2025 18:07:27 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f882755172sm3915340eaf.27.2025.01.13.18.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 18:07:25 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 4/6] wifi: mt76: mt7925: adjust rm BSS flow to prevent next connection failure
Date: Mon, 13 Jan 2025 18:07:10 -0800
Message-Id: <20250114020712.704254-4-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250114020712.704254-1-sean.wang@kernel.org>
References: <20250114020712.704254-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_180728_247683_8B98F374 
X-CRM114-Status: GOOD (  13.30  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

Removing BSS without removing STAREC first will cause firmware
abnormal and next connection fail.

Fixes: f8797298565e ("wifi: mt76: mt7925: Cleanup MLO settings post-disconnection")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2: generate the patch based on the latest mt76 tree
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 45 +++++++++++++++----
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 90a6d62aa816..07e5c1a6d5d5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1155,7 +1155,12 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 		struct mt792x_bss_conf *mconf;
 
 		mconf = mt792x_link_conf_to_mconf(link_conf);
-		mt792x_mac_link_bss_remove(dev, mconf, mlink);
+
+		if (ieee80211_vif_is_mld(vif))
+			mt792x_mac_link_bss_remove(dev, mconf, mlink);
+		else
+			mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx, link_conf,
+						link_sta, false);
 	}
 
 	spin_lock_bh(&mdev->sta_poll_lock);
@@ -1175,6 +1180,31 @@ mt7925_mac_sta_remove_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 	struct mt76_wcid *wcid;
 	unsigned int link_id;
 
+	/* clean up bss before starec */
+	for_each_set_bit(link_id, &old_links, IEEE80211_MLD_MAX_NUM_LINKS) {
+		struct ieee80211_link_sta *link_sta;
+		struct ieee80211_bss_conf *link_conf;
+		struct mt792x_bss_conf *mconf;
+		struct mt792x_link_sta *mlink;
+
+		link_sta = mt792x_sta_to_link_sta(vif, sta, link_id);
+		if (!link_sta)
+			continue;
+
+		mlink = mt792x_sta_to_link(msta, link_id);
+		if (!mlink)
+			continue;
+
+		link_conf = mt792x_vif_to_bss_conf(vif, link_id);
+		if (!link_conf)
+			continue;
+
+		mconf = mt792x_link_conf_to_mconf(link_conf);
+
+		mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx, link_conf,
+					link_sta, false);
+	}
+
 	for_each_set_bit(link_id, &old_links, IEEE80211_MLD_MAX_NUM_LINKS) {
 		struct ieee80211_link_sta *link_sta;
 		struct mt792x_link_sta *mlink;
@@ -1212,6 +1242,7 @@ void mt7925_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 {
 	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
 	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct {
 		struct {
 			u8 omac_idx;
@@ -1242,14 +1273,10 @@ void mt7925_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 
 	mt7925_mac_sta_remove_links(dev, vif, sta, rem);
 
-	if (ieee80211_vif_is_mld(vif)) {
-		mt7925_mcu_set_dbdc(&dev->mphy, false);
-
-		/* recovery omac address for the legacy interface */
-		memcpy(dev_req.tlv.omac_addr, vif->addr, ETH_ALEN);
-		mt76_mcu_send_msg(mdev, MCU_UNI_CMD(DEV_INFO_UPDATE),
-				  &dev_req, sizeof(dev_req), true);
-	}
+	/* recovery omac address for the legacy interface */
+	memcpy(dev_req.tlv.omac_addr, vif->addr, ETH_ALEN);
+	mt76_mcu_send_msg(mdev, MCU_UNI_CMD(DEV_INFO_UPDATE),
+			  &dev_req, sizeof(dev_req), true);
 
 	if (vif->type == NL80211_IFTYPE_STATION) {
 		struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-- 
2.25.1


