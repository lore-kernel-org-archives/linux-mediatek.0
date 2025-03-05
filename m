Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC446C021B8
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Mar 2025 00:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K29PyePUpk5WVq4lLAdCQNE/othRM+FfI7C3wd/RqYg=; b=CFsfSlDoKJz5aaVmH/eOuNqPa9
	rGangilLzbAt+88BDKHH4wfQMtZJ3pdIGxV7OdLk+lZ9A2BPuLc8N4JZZ09ve0mKtP8Ts1y7CtOUi
	4YS5S7FSjj8SRAPyAN4zg8g32Vsbk13mR0CB6BVtFRCYDrGuVpWC+Qvnoip5z7BX966mpqEPOkWU0
	WglqFsv4IuTOItYaTpDPZ5XxrxUxYeI0HRj3vWp7yxV1+TvRUWhhxoQTRHvBLbrvqTYtBIMbRaTTx
	bIi9t0qjNa0uQaiAMS83TnpYn5ivIUD9m3IAVCp+xy+4gZPimR63zMyNM4KX92xuj45vhYCltf6AQ
	k0IUuajg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpcJs-00000006b24-37WB;
	Wed, 05 Mar 2025 00:09:04 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpcJp-00000006b16-486a
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Mar 2025 00:09:03 +0000
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3f40b12520eso4799778b6e.3
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Mar 2025 16:09:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741133341; x=1741738141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K29PyePUpk5WVq4lLAdCQNE/othRM+FfI7C3wd/RqYg=;
        b=btY/+oxOE+a/u5Bko+rZfyDXTunFvfrV3Ff9pUWFNfPZAD6JZy0ACl5kxUCmUg8F5e
         bgbTZ956HGJDIs+JzxvFptRDYd2aIenG5sS4gwjcfLMXNB46JI7g7i4cGldt32drb7H7
         nGP4t8kpCuqXnECdOwXZv6VLqUvLzTfwU3YL1eyiPxdWskHlTyV1LYYixFWRj4msweG/
         7l6bc3maeSbjJhXGkBaiNx0n+uxIssT7+S364bm+K4n0bpKW4S2vM/odxnrec3Ih4gTS
         RGtM3BWj8RuLva/B1wk4ygMgODiatrjiwAHb2PAp5GkO5a4iO7SCsGm4/KZYZO7YvyXm
         +DfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf0RuHU7Guynfe25IAjRmH46GItCvRTKarAyx+ukZEvztKl79gdXxEAqzJpuZ6WJoSl6+kPljZqRVCGUiu8Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyI+IH2xeHrR5yfT2SoFAG04T0Cc47FZPE4Oq3ZBBCbKqYX0wuh
	eYL0Coe0RyPOEwpQ031bffBa1LMEm/rb3i5o+9Mk+Uh4CvBN35Ga
X-Gm-Gg: ASbGncvR2qGqTspxmqBnzHsfysi2ET4NO535Ut7ZCw8lgRZCH7sdxHU5ZDVmwXYZWg0
	8t0MFtzKF21ozG4KJtSqjfFTZ9eXIMqO3SyHig0toVRWrNnHPDUtUWcH+1LVjY97qL0Et7w3DzV
	X3wx93l32a3x8wdG9Fke5s5hy6hCIbhYtiqCVZvqtsW+nt+jFwmQ6mzyuFKEIcgB5BDUlrCnoVU
	0EMBQadZEi5YYIGblPimYWYDdMVaEuZIYzZflFwFTrW3Pg9WWGjfaAAzetkrB3x0daa23mJcwGe
	0hqDZ+DOvn+rfE1X2dvhAdDk3lZr2JnLLNC2vqY7Zy9IcBtU3SPoCPI+OiaAIQ==
X-Google-Smtp-Source: AGHT+IHk5Z4MAR+2LKqaAWAqGAhbyH341r43aDMKsumqMh5/HkJ+xA7G/KuX0nkkLzZMwaGtSmpJ0w==
X-Received: by 2002:a05:6808:3584:b0:3f6:684f:2f24 with SMTP id 5614622812f47-3f68315d0afmr458666b6e.16.1741133340971;
        Tue, 04 Mar 2025 16:09:00 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f67ee8f479sm299985b6e.40.2025.03.04.16.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 16:08:59 -0800 (PST)
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
Subject: [PATCH v5 2/6] wifi: mt76: mt7925: fix the wrong link_idx when has p2p_device
Date: Tue,  4 Mar 2025 16:08:47 -0800
Message-Id: <20250305000851.493671-2-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250305000851.493671-1-sean.wang@kernel.org>
References: <20250305000851.493671-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_160902_021824_37F5DF63 
X-CRM114-Status: GOOD (  14.31  )
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
  1) added tested-by tag
  2) removed unrelated files
v5:
  1) update co-developed-by tag
  2) rebase to wireless.git
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


