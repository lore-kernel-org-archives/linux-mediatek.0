Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE01BC021BF
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2025 02:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijn9Zs6TtjyptoPH/X9sgnzFhdzKOSXw5uRjIenFZHg=; b=o3pO8me4iViCHTwEClpAMbmJMu
	I/bWAeEuLK8zNZESPQg6KDF8tdyQTpvnZYWzwlrhEafcQQMP7ohVayQ4QRJ7n2xG9zUJAQ/9Mlvcp
	hz3rQ3XDkK4pFIm4GtpJhGQEhvNqNi67PS/SrPkKXin/dePQ2RD0IehxAURZWc0DrAr+TT/rygIwb
	TCjbs8TJK5uPwAc8OfNeU4XtEadsrvx8CEMGH9lI6AOLRx89+BhfUEhn5CgHb1ZgVLG4AQQ/5PTq7
	3Dlo2Z1IzT7DWLAKcZIJn4wNraF4ZS2EX4kcHt3e75KqEbFCQpn0+ydsOxaRdYP/BM76tkGkzPCjb
	C2yl1z+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn7bo-00000002ESo-3F9G;
	Wed, 26 Feb 2025 02:57:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn7bn-00000002ERY-20av
	for linux-mediatek@bombadil.infradead.org;
	Wed, 26 Feb 2025 02:57:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ijn9Zs6TtjyptoPH/X9sgnzFhdzKOSXw5uRjIenFZHg=; b=pGvPRWUyO1zjY8OQyBELs0V2Y9
	eLNrbVYG1koemAbcnze6A1zFUbDh9++AocluZdlF6bzEVNxHYLSqT/dqJLx62me2iEbiSLen7qXw5
	BkwodCy5VAMqXkywEhRMNAACaobHbnM6kGH710l17mElHtpuUhwEIBrhPXf+PREq7oCRihHvfQagE
	0KkzNB66wvK0s/it9OK+Swld1WQcPAopc+BiMNJ8JBcmblvqYhBTyQXWPfHtYyIrA1e9639nrsnD4
	9phqalXfsCT3/ztcXbQs3Op+h+WeUwGrw3F1bYbxtHW4pdBNSaJKaEFg7VKkuTRL6eUP3PsICTxyT
	xj6wtviw==;
Received: from mail-ot1-f51.google.com ([209.85.210.51])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn7bX-00000003UzL-1DXR
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Feb 2025 02:57:03 +0000
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-728a433ec30so442228a34.1
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Feb 2025 18:56:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740538616; x=1741143416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ijn9Zs6TtjyptoPH/X9sgnzFhdzKOSXw5uRjIenFZHg=;
        b=PWxDOgoU4ng4WRKTXhKnl+ccWgbNyO7S6pLNmInnlecTuDn0sEx9j1Hf6CcyT/+pxm
         VTyrqCNtioiunNbC9F2v3ejANjyRJab+7DlDwlYZLCjjlCNvoFHC5+CfRf0WoWR/Th+S
         URVg68R/x8vxbjlgduaKf4YrFqc5XUlyzqu2nJvQTte9ctcaioy1K0YfJrKf1RySqkxP
         7wtKaOzhJlhhOgJiJVfVmioD4CFZ/a+rMamtMwi0EC8s3wEsC+qYD/zbhBl5jak5AB0q
         QY6E1u3VSKNwoYjGlY6XmJ0qDoOOSDARcKrQlE1UwoFMeM0apD75Qyq5JAmky4h7U3fM
         hpxg==
X-Forwarded-Encrypted: i=1; AJvYcCV3Z/cD60e0GhRiYXLAs6J9BfePtXZtA6E2LOqmoB9jQibhxR/P8HxkgA/yuaIxoEbNVh5DUfUw7eRmNFSZpg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJK8PAjmjp1fmcqAgZ/en7RvgeV7uzifn6HjWGuUczr9zp94Kg
	sXLM3nHc5ECjOLEcFuEPE8Zxfqc3hlXX8Tq1VdnnCqB+jEKCL+LG
X-Gm-Gg: ASbGncsM9pwTGiK82Su2xvxJvFcWPuPBD+5bCs9k1Px/VISr3L7YDheN+mlXb865QuN
	tlryr6ZqI0aIU7geQZZblYzi8d8Po415Rit/yoQ5XE7pGUDT0NBIciLpQgb9nfluIm87+3zD/XT
	GUIr57mD5wUGLj5MfiuXwsMhR8wohrUid8C2KCHMKqbeocpkYE8wZH+mD/9esEE8Iw53NynZAVN
	s3AH2B1OUlIbo7tdKouFNv6fu9kazB4L6xO0r5zRzSEkdYBzd9z5kYdYKdusXNu/GDi4v7cLfNz
	FGeiJQlLVWc9/BcPMskYW3r1QNBgxszRegjxg2q4NBE=
X-Google-Smtp-Source: AGHT+IH/v3xoOO5kFnmYW8uOZZ7ilJPTZbKGNYJW6EP3vASjM841Y2AYzpuzLLNxk+lzIh/mqbbErQ==
X-Received: by 2002:a05:6830:412a:b0:727:2ff3:e046 with SMTP id 46e09a7af769-728a521c06dmr1013357a34.22.1740538615741;
        Tue, 25 Feb 2025 18:56:55 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c1113f0135sm676360fac.27.2025.02.25.18.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 18:56:54 -0800 (PST)
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
Subject: [PATCH v4 2/6] wifi: mt76: mt7925: fix the wrong link_idx when has p2p_device
Date: Tue, 25 Feb 2025 18:56:43 -0800
Message-Id: <20250226025647.102904-2-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226025647.102904-1-sean.wang@kernel.org>
References: <20250226025647.102904-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_025659_669564_061731FE 
X-CRM114-Status: GOOD (  14.64  )
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

When the p2p device and MLO station concurrent, the p2p device
will occupy the wrong link_idx when the MLO secondary link is added.

Fixes: e38a82d25b08 ("wifi: mt76: connac: Extend mt76_connac_mcu_uni_add_dev for MLO")
Cc: stable@vger.kernel.org
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Tested-by: Caleb Jorden <cjorden@gmail.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2:
  1) generate the patch based on the latest mt76 tree
  2) update the commit message
v3:
  1) fixed the merge conflict
v4:
  1) added tested-by tag
  2) removed unrelated files
---
 drivers/net/wireless/mediatek/mt76/mt76.h          |  1 +
 .../net/wireless/mediatek/mt76/mt76_connac_mcu.c   |  4 ++--
 drivers/net/wireless/mediatek/mt76/mt7925/main.c   | 14 ++++++++++----
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 132148f7b107..05651efb549e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -769,6 +769,7 @@ struct mt76_testmode_data {
 
 struct mt76_vif_link {
 	u8 idx;
+	u8 link_idx;
 	u8 omac_idx;
 	u8 band_idx;
 	u8 wmm_idx;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index f30cf9e71610..d0e49d68c5db 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1168,7 +1168,7 @@ int mt76_connac_mcu_uni_add_dev(struct mt76_phy *phy,
 			.tag = cpu_to_le16(DEV_INFO_ACTIVE),
 			.len = cpu_to_le16(sizeof(struct req_tlv)),
 			.active = enable,
-			.link_idx = mvif->idx,
+			.link_idx = mvif->link_idx,
 		},
 	};
 	struct {
@@ -1191,7 +1191,7 @@ int mt76_connac_mcu_uni_add_dev(struct mt76_phy *phy,
 			.bmc_tx_wlan_idx = cpu_to_le16(wcid->idx),
 			.sta_idx = cpu_to_le16(wcid->idx),
 			.conn_state = 1,
-			.link_idx = mvif->idx,
+			.link_idx = mvif->link_idx,
 		},
 	};
 	int err, idx, cmd, len;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 8dba17c8697c..4f35c2f16d0d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -360,10 +360,15 @@ static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 	struct mt76_txq *mtxq;
 	int idx, ret = 0;
 
-	mconf->mt76.idx = __ffs64(~dev->mt76.vif_mask);
-	if (mconf->mt76.idx >= MT792x_MAX_INTERFACES) {
-		ret = -ENOSPC;
-		goto out;
+	if (vif->type == NL80211_IFTYPE_P2P_DEVICE) {
+		mconf->mt76.idx = MT792x_MAX_INTERFACES;
+	} else {
+		mconf->mt76.idx = __ffs64(~dev->mt76.vif_mask);
+
+		if (mconf->mt76.idx >= MT792x_MAX_INTERFACES) {
+			ret = -ENOSPC;
+			goto out;
+		}
 	}
 
 	mconf->mt76.omac_idx = ieee80211_vif_is_mld(vif) ?
@@ -371,6 +376,7 @@ static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 	mconf->mt76.band_idx = 0xff;
 	mconf->mt76.wmm_idx = ieee80211_vif_is_mld(vif) ?
 			      0 : mconf->mt76.idx % MT76_CONNAC_MAX_WMM_SETS;
+	mconf->mt76.link_idx = hweight16(mvif->valid_links);
 
 	if (mvif->phy->mt76->chandef.chan->band != NL80211_BAND_2GHZ)
 		mconf->mt76.basic_rates_idx = MT792x_BASIC_RATES_TBL + 4;
-- 
2.25.1


