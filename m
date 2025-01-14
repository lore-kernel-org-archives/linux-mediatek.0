Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0CCC02184
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2025 02:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YtFuvbzeBTNVOBWO3ySJleq1Z7QhqifLZ+UmNMZ8jrQ=; b=M6ZVVu0rM5d2QXgLIYkTpDvRWs
	T1KhCz3AbQVmUsmG/ibEeZIuwNsMqkRtymqikKaqcZyuWsgOyciLeueQt+wzSfLOu/lZVrtCULLf5
	54NVVuTEnO32f+wt4bOW2imWXGrr+QEWwL45O2e/QTpVMNU3oWR+mFzmJqQ8CTZrR8RIqr7kSWCv/
	PUSyryRDNAgE+6D2TAUwdkrzgRG8SrP9D95/byja9xNc31Yd+c1Ckz+P8Azb0tZpQ0lver6oiUayw
	ruwFrLfZz55w3s7e5aKuH4OpPKCady5JIl1b6NETSODupETcCQ5SOqHIfEMP2sN8DIEIXiyGknhes
	Zgoissew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXWLg-00000007D2n-466F;
	Tue, 14 Jan 2025 02:08:08 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXWKw-00000007Cxl-2RQr
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Jan 2025 02:07:23 +0000
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-71e15d9629bso1533469a34.1
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Jan 2025 18:07:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736820441; x=1737425241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YtFuvbzeBTNVOBWO3ySJleq1Z7QhqifLZ+UmNMZ8jrQ=;
        b=EoqQofZ3vf3hEbWvWNj95qfSumBdFfP7AbhgI1heGbEUuPaGbXCSyLa9DcYHw7QY/D
         tEwSB5O6qyY6zqT2Eu7ulIpPSggkGhq4NqiGk6RMHHIBPXO3OlcxbSyfPIM0Ei+vQ7nm
         pCrHk4tcj3JEbEXxEINulrWYZY0WlAXjbdet1NFQKo7uCyOPTxI0ksZfaBGPXzcc82FB
         2ugbuBo01U/lD84q4W8Y5mLJ5Wt8JjnU9wcjgQG6TwGw0aWIw4s65DO9wKhgNXEakCru
         unHQtKpqNGDValrhVkZmeibiP7G9Kupn2wB46v/bdpW1d1dIcOQSpAoUjDuwfNnX9mlB
         uYKA==
X-Forwarded-Encrypted: i=1; AJvYcCX04reVGz6wDDUNs49V1/2QiGqmLeFC6DoG2b56VvqWsM0n1cL0GiS0zKTSggvI6ioZGbaA55I7W6iXI46laQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywbr9etpWNxr0cuCfJM/avKT4T2iBQgQIwB9NUAyVfprNJB2jYx
	Y1vtOVkF9mK+6VctMaI6Qo8QtAS7H5ys1IdXBGY+1r3vaTsfNH6k
X-Gm-Gg: ASbGncuTwLnml+otVk3asjfFGtPyWLVZlCNs9o8+cQj6e2OsXlHacDJt/FhMc7Ky3hN
	MuQW3YQiKdnULx2fRIXzqgjMuGuKKWXAM8mJW6ICydBWDKufP5L0frEZHFPcXTUyQWrENo7iy2R
	NNOkBvOi6yqiicKWvHnvjyFyXQuqy9mwIkRxPnZRe8JLEv0DZqnJm2jSqed43gv1W4lNtmQ5a1p
	sWG6UFyKRSINh/xnjQf2yQPYTP7VhEnPhI/zo6/b2r5gVPBFRDnqERm++XK26mNp8S9B0RQ9A==
X-Google-Smtp-Source: AGHT+IHd5Kld9d0+YVuyqDqLcd2oa2ia62Q6ta0zrOvMzrIgUFpRMWwtfoHQSwdMtTatTt9OkenVdA==
X-Received: by 2002:a05:6830:61c2:b0:71d:5f22:aff5 with SMTP id 46e09a7af769-721e2e23192mr15792855a34.10.1736820441541;
        Mon, 13 Jan 2025 18:07:21 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f882755172sm3915340eaf.27.2025.01.13.18.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 18:07:20 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/6] wifi: mt76: mt7925: fix the wrong link_idx when has p2p_device
Date: Mon, 13 Jan 2025 18:07:08 -0800
Message-Id: <20250114020712.704254-2-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250114020712.704254-1-sean.wang@kernel.org>
References: <20250114020712.704254-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_180722_622146_6BF96E9B 
X-CRM114-Status: GOOD (  13.92  )
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
v2: generate the patch based on the latest mt76 tree
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
index 2082e3904d76..502b76a40ca8 100644
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


