Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0889CC021B2
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2025 00:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayoJc34UIWYK6NpCJGDdzAahc3IY6eGe3fENEO1SMvY=; b=aFHuBuz5okApc6x2+TEjJVj2tU
	Qq627RpmnFsGAgQEc115uRDb33tR6J/+InHN0pQpVFOX2FZrk4sTMhxs4ciWGRRB68U5LB//wU5G2
	XtG1GypUKc75hLtiocDgyIB0Wq5C3N3XwWE+FH77QHJXt7qLr+a2wTwNAsc7wrJtlEGgJtl9lZQNM
	mQ7UyfRsrFIpg6DeuKRP4Ad7sbHCZNZuFJLIvlx+snp8TC/IDXGK09e4xLYlyZL5Aeydp/enmcdxN
	7nzB1ocO2otdqimcKoANfZ9EeQoN1u7eu5DoBZZ5ZzHhsddtQkEwPJgC93qgt0HQJ2oVavHtLawwZ
	om4yl1gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn5PZ-00000001szp-0URr;
	Wed, 26 Feb 2025 00:36:29 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn5PW-00000001syT-3EEr
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Feb 2025 00:36:27 +0000
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-72732ef2d9cso237507a34.1
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Feb 2025 16:36:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740530186; x=1741134986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ayoJc34UIWYK6NpCJGDdzAahc3IY6eGe3fENEO1SMvY=;
        b=eEdmBTNjOLv8BLF3PGiD7iUznQcdW73Z2C5mDjMfgSjrbvrdioAS/Q2dPgp/JIcloL
         TJn5IBN5puXucR7NaJTvN+FhiVDFgbe6Tf0BjsAAcC0XkU23JBhtfYHSDrFgN0oF2FNJ
         hMJ/ZtFEf9rgLScY+BTw3ozBqj4nmYUNRCBTQpOppqDwkYGKyDCVkbEEHeum4oxoZd7e
         sVs0Zmobm/tMM2iJigyWpfNSU3mckIc11i8MrEAdob+ePDYMFubJ+1aD/jG7yfhH/Y9C
         D8EfewphY/VrYgeRMSIkSBmlz/BHGrY9SjpOklvgC7lPPitIJDzbkNT/rCHHr61IJIZb
         yLuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLL2Z6XxLYzGmCnATk/kOqvCyJkkUHzDJxXDWcRYuwOWq4z7WKTDzoYCQT9XA2I9XF9J9AnMmkZVilquO9TA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyrpoBYWK0rc8mZVhjp4I47scQAjW8tVdl1ltPHXUn0XsP6981P
	XVOlhZ6W/q/ZcdUWSPc/Rkd5NAWWyRI/LIrsK3Xfakf3yJM4i7OX7M+Zbpps
X-Gm-Gg: ASbGncuGg0YAQzNGzzs5DR7zSva3k6/5tACaYUshZNPjayKQgFqM6QTldgkS3s+r5sB
	6KtYWDWM4BhwIPcK8tDORMnR0LbS505Y5HfDCtBV5GoCb/yqecrP4BzDcLBdPDp+NBqMu26UZc4
	o5uiGCNRjrEab9jIZc0b1QVGKA3MEDgVF+6cuYqjMe1RDQ1phmSTTn9U7wxhoeIxxLP0UwmSukt
	XiGacYMoCF+awDSCM74T0XSUolbOrZSZz/bN2RDyj1XEVeyMxSgDEd8ileiozUUQ3ro6pufpZj8
	nbc4wGpYTHZN5Ox4zMAvxuSOdPEThsONAU2plXCgCbQ=
X-Google-Smtp-Source: AGHT+IF9Q3Wtccm0vIiquLaIV2JCZFN8QqcgomXkW2A+AmAXU11HEtu0EQ8MdBNN82ZRLpq9VKc3cg==
X-Received: by 2002:a05:6830:4858:b0:728:a42c:a503 with SMTP id 46e09a7af769-728a42ca9a5mr1149633a34.14.1740530185762;
        Tue, 25 Feb 2025 16:36:25 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7289dedfcd8sm507149a34.16.2025.02.25.16.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 16:36:25 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH v3 4/6] wifi: mt76: mt7925: adjust rm BSS flow to prevent next connection failure
Date: Tue, 25 Feb 2025 16:35:54 -0800
Message-Id: <20250226003556.82644-4-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226003556.82644-1-sean.wang@kernel.org>
References: <20250226003556.82644-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_163626_811223_CB33BCC7 
X-CRM114-Status: GOOD (  13.84  )
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
Cc: stable@vger.kernel.org
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2, v3: generate the patch based on the latest mt76 tree
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 45 +++++++++++++++----
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 604f771af68e..4a9f393b45ba 100644
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


