Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4042CE77197
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2025 02:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5poZd8Omf8mHChDNYxqQRYDNiHz9Uqz2gbs5vpo4Wko=; b=BveHKlt1UObvC26cqTaJAz1a6J
	VyVzl3X2+U8vGhpNQ8lWrozfdlBtnyZJZCMyth+r7VSvVe30hB/9v5flYbgc+xlato2RfTDZpa7F+
	KtXMGsatTq00V/UPRjkcldpV/vL6qVrCcbfnIJ2gr1xTRuFQJKaIkFNyjOcHQa6Ko+GGv60CKWSzT
	islyJrWCC53HDJFHINmB1BShVf9Y/E1ExDr6VF+tuB9XyMlztJ+QSDs2x38jZKyc7fD3Mx9BYhG7P
	gFrXi1kmy8Ixbu/ieWnwvv67UnGZKgwCqBo4A3Ap9NrOZ+gLyswSUjKdzYXLGLH8g4cvIJRNfAY6R
	/B+2LwgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVLqx-00000006usT-1sUb;
	Wed, 08 Jan 2025 02:31:27 +0000
Received: from mail-oo1-f44.google.com ([209.85.161.44])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVLl1-00000006tFg-10KR
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jan 2025 02:25:20 +0000
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5f4cc48ab37so4519907eaf.1
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jan 2025 18:25:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736303118; x=1736907918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5poZd8Omf8mHChDNYxqQRYDNiHz9Uqz2gbs5vpo4Wko=;
        b=lWKHabJpkLYZ2DaQDFg85iQjxcmcCSEO0/I8Do8Uk9PIl8s46oO9yIB3xPCGPW8HM8
         SD2D6Bs9RQbztDQOPiR3Ov8rEERYLqzVOGoZJqQ2Pi72SXxmd5ffTUI/Hz4cRmfWLBkv
         n2whw15QNmYqA1oYYVml5E+rtS85Hy8MH77IimoXKCFzpV9zgC5AXTsO+tZTkOICXfT/
         /S9dLpMYpDLQYnaooV4SH5v/xPQ7pm8EuHZnOFjmyf4RMY83YrG23xHrSYw1rSiWpxBt
         L1URu/WcVfVwGlpdVlAU4q8HkJVsL1d0zVzp/yMJL/8rD7jhWcSVcLDZJraIEOYsrR9I
         DLAg==
X-Forwarded-Encrypted: i=1; AJvYcCX4zj+qPC70RCAoxp8wwTeGvW9svBAQbBK87xA1Ud/DuFn3BYOxuZ8gudxDkU2X8uSXr2UyB0sbN/y6xaHBVg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGS7h01zwbk3DI4Z4pztsrencpe6S+/hbexZ3tlsm2GPgN6fTz
	zEJW8/WiNm8Kx2q/qYVBqTYkYsD60EJcPzlU7vlTkD108uJ3cgl4
X-Gm-Gg: ASbGncsBgBV3+w4am8hUzxfilhQEYU9/HB6hfqYFCw593dwTmbvkOijkyXjeLEcSuCT
	Q+XGAuGpc33T/IiryEy7l78WbuRRtO9DkCN+FIbnKaa++hV2VcSbJA1+JV4oRVCeZeJ89UVuob3
	a40BpQ9EXG8R1xs3sVPRCKPPP16yUTeeg+x7JoxSyQYFk1nciS/RRPWbJpI4Gj77deH5vI3XQhK
	IpcoSBD5Siu7dqlfU45aTb4srYlyLzr9RAY19HAvq3Roxus/yQPGbXWKL2iO4rHpMDXRF4cow==
X-Google-Smtp-Source: AGHT+IG1BSmYd4o29NQKBDCMXyMov8UepAnYwvWRgzA22SOmjxDtFJ2VtJgIvbRKdY+vAbn4xOmQhA==
X-Received: by 2002:a05:6871:800f:b0:29e:3701:47c3 with SMTP id 586e51a60fabf-2aa069c550fmr609205fac.42.1736303118142;
        Tue, 07 Jan 2025 18:25:18 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2a7d77f6340sm13072862fac.48.2025.01.07.18.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 18:25:16 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/6] wifi: mt76: mt7925: fix the wrong link_idx when has p2p_device
Date: Tue,  7 Jan 2025 18:25:05 -0800
Message-Id: <20250108022509.217803-2-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250108022509.217803-1-sean.wang@kernel.org>
References: <20250108022509.217803-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_182519_284214_8A4AED26 
X-CRM114-Status: GOOD (  13.24  )
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
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h          |  1 +
 .../net/wireless/mediatek/mt76/mt76_connac_mcu.c   |  4 ++--
 drivers/net/wireless/mediatek/mt76/mt7925/main.c   | 14 ++++++++++----
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 34b6b094b8eb..a131d671ed56 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -756,6 +756,7 @@ struct mt76_testmode_data {
 
 struct mt76_vif {
 	u8 idx;
+	u8 link_idx;
 	u8 omac_idx;
 	u8 band_idx;
 	u8 wmm_idx;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 4171710d645c..f95ae7a2eb0e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1164,7 +1164,7 @@ int mt76_connac_mcu_uni_add_dev(struct mt76_phy *phy,
 			.tag = cpu_to_le16(DEV_INFO_ACTIVE),
 			.len = cpu_to_le16(sizeof(struct req_tlv)),
 			.active = enable,
-			.link_idx = mvif->idx,
+			.link_idx = mvif->link_idx,
 		},
 	};
 	struct {
@@ -1187,7 +1187,7 @@ int mt76_connac_mcu_uni_add_dev(struct mt76_phy *phy,
 			.bmc_tx_wlan_idx = cpu_to_le16(wcid->idx),
 			.sta_idx = cpu_to_le16(wcid->idx),
 			.conn_state = 1,
-			.link_idx = mvif->idx,
+			.link_idx = mvif->link_idx,
 		},
 	};
 	int err, idx, cmd, len;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 0904d8f109b3..6c8a9ebfbe5b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -356,10 +356,15 @@ static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
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
@@ -367,6 +372,7 @@ static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 	mconf->mt76.band_idx = 0xff;
 	mconf->mt76.wmm_idx = ieee80211_vif_is_mld(vif) ?
 			      0 : mconf->mt76.idx % MT76_CONNAC_MAX_WMM_SETS;
+	mconf->mt76.link_idx = hweight16(mvif->valid_links);
 
 	if (mvif->phy->mt76->chandef.chan->band != NL80211_BAND_2GHZ)
 		mconf->mt76.basic_rates_idx = MT792x_BASIC_RATES_TBL + 4;
-- 
2.25.1


