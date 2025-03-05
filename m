Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96411C021B8
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Mar 2025 00:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5KmCyNELJJemcnmUYppjmKqqpaAMRTnfnaa6QXbepoU=; b=tDCz32xHWJj+o387YpaE0NiiC0
	VgO0Q67WT5G4/83bpiPtbs5b2U5gnL+v0m1FRPr9uHdiZcZ2bhugvMK+weIBx2x9sDsytFppZ23sP
	/PxcAR6vq/27AmYjGJPE9/ezrhFm8qi6WGBAZqWEyt1vEabm5AxiIo/kQ8c1HPyJEOz4keMbGJy++
	wT7dMF2BvrrQdQ3r2mPzcGKRO1nyNqvwVsegBczjVV19tulPASNh8amKSvydYW0x+3ilKWFTDiAgO
	FVOSv0sMfEQeMdfPo5SGcD/fe4FYvR2098kCDlys2eRIWyFm7aO5XhmSlaFUFsovmzvofpzN66shY
	mmMSATUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpcK0-00000006b5T-2inT;
	Wed, 05 Mar 2025 00:09:12 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpcJy-00000006b4h-17FX
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Mar 2025 00:09:11 +0000
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3f6740963b4so1268840b6e.3
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Mar 2025 16:09:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741133349; x=1741738149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5KmCyNELJJemcnmUYppjmKqqpaAMRTnfnaa6QXbepoU=;
        b=rCafN7u9fXRaht4KVDBJb+wfCJ4w80hstqnnxvC1p/9I31f+NWQdtZcCZUpu2ngEdG
         W+0FJCnkB/TFS6wwrXAV17w3M3ROP4GCktrooiCd0Y9Y8cTJjDBsMEsht0ONFrUvdGM7
         jIvVSClEFlcQ2EG1wx5rnzEWF8PXzAnqxlOKJ8N1OmmzQq8d34A0EjFRG40o4JiQNFtr
         aEwZi7ZKTh2NF6h8D+Vfdr+CXKFogpHB/J+Pbh3P45LwGf62kFsO6C86S8V5sAtFaeLY
         HXxJuW86JqbMrAVo2kZTXo+5z24J/NSZm4IpPJczCAj2YeEronK9MYfagc33rdt2g98W
         FFsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoqIIP/2eVk/umeTNcruQXShQp++4wh+9zxD0IjRBoff59PAqvUtJi4MR+KrH9hEPEu2d+dnort9bJAy0Lgw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3nLf/Z568xZ560VUWkSK/UvvWqypTeldJvAELqzo6tGEdpChI
	Q83tO92FFQw87LF1IRLoco9xw+/lzEsmFVLjNF/VM7wM9zv04NzT
X-Gm-Gg: ASbGnctc9AQ9FBLcKtEIAQgQOu6nZJUK61fOjPH/6HiFoVv9PdjDj7J800VknSJ15YD
	Yq5PQwf2r9/E08FRbu+ViXcDMuR9/W/18xhVvD9aeCb/qv6sdGoubwyvcizGYjYT/EYQlmuOUHa
	s0GneoyKUZJ/8bMDasdARGi0Ndq2QjYxwbrqdw4r1pC4BLIwmvujrb3+GMzlYBNDt7KF2z8wsI+
	6jP8GexVQ6z1RPPdbBbFHTFg84r5BA7PMJarVK0dKn0AxT67X/aY0bYjPK87h0FaqEW1J/oYso2
	lHttJydCNwa9YIGAp7KY9jXe0FvLX0OHgOf32zBv6+JG0tJSetfgEqYAIyV9ZQ==
X-Google-Smtp-Source: AGHT+IHWNG2Yylm4c0/Jpo3YYVB+/tZtr02EkH0F6DG8CID8z8g+0y3pM7nC7o413CB1rGVMvbBteA==
X-Received: by 2002:a05:6808:1825:b0:3f6:786c:cb9a with SMTP id 5614622812f47-3f6831f35e0mr485321b6e.37.1741133349420;
        Tue, 04 Mar 2025 16:09:09 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f67ee8f479sm299985b6e.40.2025.03.04.16.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 16:09:07 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org,
	Caleb Jorden <cjorden@gmail.com>
Subject: [PATCH v5 4/6] wifi: mt76: mt7925: adjust rm BSS flow to prevent next connection failure
Date: Tue,  4 Mar 2025 16:08:49 -0800
Message-Id: <20250305000851.493671-4-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250305000851.493671-1-sean.wang@kernel.org>
References: <20250305000851.493671-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_160910_305792_2A8DC3DA 
X-CRM114-Status: GOOD (  13.28  )
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
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Tested-by: Caleb Jorden <cjorden@gmail.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
v2:
  1) generate the patch based on the latest mt76 tree
  2) update the commit message
v3:
  1) fixed the merge conflict
v4:
  1)  add tested-by tag
v5:
  1) fixed mt7925/main.c:1245:28: warning: unused variable "mvif" [-Wunused-variable]
  2) update co-developed-by tag
  3) rebase to wireless.git
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 44 +++++++++++++++----
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 604f771af68e..a7464839318e 100644
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
@@ -1242,14 +1272,10 @@ void mt7925_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 
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


