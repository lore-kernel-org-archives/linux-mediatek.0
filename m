Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B22FC9EC0
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 23:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4usbtTpP237Cyh3bnTarmi4Xn7UcGKghpAb4WKVsuwE=; b=mjpfk5laYndpur3ANgDvMVfubd
	T5KcYPOPfhZHZMNUmMWXCHkf0xAEnuZHfGjcjXuMtGO/U3wX0i75Vsv7TIdj3t/okvwlD5dNe1pf6
	MYlEEn3OO3g6cYGbh8sC9XQyzttbB0RQh1QRfNsMRuuVVWEeemPjJ2sYSNPTgC7CAoQeQD5b6tLez
	wungFCNzYPqwntkSmc0MnhNHYb5mVvsit9fsB4O58pjpkpaezyP8rgNvDfPXH6cxAy5MVuVxTSJDJ
	P7jjLuOH2dQ8ggqXzIOExyz6NWLuLwGqFmqTOQMHgFWVtoym4mlcvetdi9UV5MuWGNmgoeznI/+MN
	fiVKyD6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeWZ-00000004drH-09C7;
	Fri, 06 Mar 2026 23:24:03 +0000
Received: from mail-oo1-f44.google.com ([209.85.161.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeWX-00000004dpo-0J7a
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 23:24:02 +0000
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-679f6ee3fb0so4529368eaf.2
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 15:24:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839440; x=1773444240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4usbtTpP237Cyh3bnTarmi4Xn7UcGKghpAb4WKVsuwE=;
        b=O4nR81iP9/JSFHjL7syfDEQ+gzz+ZmggeSNa2VcXJ5HRxD1dCRyqqtITY450d2pERg
         32SqJd3BGcYmOZ9f0oaC96hnGKIYCey/Gv5yTUASnhcQsIL/UKjI01kzan+D5I7NJRDj
         To5e1zHRnSTf38yx+tTRQhnOc3VzQTMwhIdnwdPMVb45RXNm/lWvMvd6615gAGvhlDFT
         eSuYgLtAZavzb8v/QPRSGbDsBs6p9qKcigmPc6qH6jkCYmae50GxMe7EAwCY7mPTYTMj
         O92cE1pnfWFm3kn/UT2yrehL6zulfE0tdTqt4ZVGWEY4YeSGTzQtv6nxxktMmHM7D1Ko
         g4Dw==
X-Forwarded-Encrypted: i=1; AJvYcCWsPz85lLYTB8aOI6mFsYjtvsYgpV94ol4hNY/DEvXcWL0XosgyQsJOMwX+JicUBia4xsLgn65TxigYf7eLMg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8q0bxYeRCRKTapOwmIpTkTxAUqOBO9aRj0eYtS6Nwyqr47mAx
	7ZfSQ6sM3ckCA4hOnJlLfFdtCCcTq41CKLbsa3hAhPK2q8JXHhp623cY
X-Gm-Gg: ATEYQzympcTtXYofUq1Qzj/c0N3IkkMzgGobRQXzU3/j85pKSWzed6fkUWmOKgUs07L
	7j4KnPHdBBSEWbo1oVkgf8jXBFzfaBnvV2UnPlVEkaLSrPhHd+7Se5ibSz3lBxdc+9pIBGD0cJ7
	BK11HIjNpg486NYqfdiIw/36LLVVSkda/sA+8b/cXn9VhUkhPBkdTAGacc2ZOaIJjBNt99B8IIT
	wgAfdDLRYv9MRE7FOBqZjjAxu7hS3E63TYTQaCobF8SxaQyDBrnRUtOQ4eaM4tFZMLZGl/SXf6r
	je/2XDDlpkeShPcC5vpVhhqfXsvthlDWmw1NRZqABicq2uGyVS7F5CpxKMpExgYQnnt9OmLYbro
	Z1PG0nTgezhROKgdIkUmlZLwKr6nua/l8MnDMDKJPo4JoOC5tuighXEgjGvEm4IGpUWh9InVU9m
	BvXl9YGVbpwYrDZ13x8qo8HsZhwNJ7aXQrC2Tjs5l6r5REkJw=
X-Received: by 2002:a05:6820:3103:b0:679:97ac:2cc0 with SMTP id 006d021491bc7-67b9bc96eddmr2546250eaf.24.1772839439571;
        Fri, 06 Mar 2026 15:23:59 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-416e65b1c82sm2572344fac.5.2026.03.06.15.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:23:59 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 19/19] wifi: mt76: mt7925: host-only unwind published links on add failure
Date: Fri,  6 Mar 2026 17:22:38 -0600
Message-ID: <20260306232238.2039675-20-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306232238.2039675-1-sean.wang@kernel.org>
References: <20260306232238.2039675-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_152401_138654_5468AAB3 
X-CRM114-Status: GOOD (  11.58  )
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

Release host link resources when mt7925_mac_sta_add_links() fails after
partial success.

msta->link[] and dev->mt76.wcid[] may already be published, so unwind
the host state to avoid leaving stale links behind.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 95c631b57894..73d3722739d0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -989,11 +989,51 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	return ret;
 }
 
+/*
+ * Host-only unwind for sta_add_links() failures.
+ *
+ * If add_links fail due to MCU/firmware timeouts; calling the full remove
+ * path would send more firmware commands and may hang again. So only rollback
+ * host-published state here (msta->link/valid_links, dev->mt76.wcid[idx]) and
+ * free mlink objects (RCU-safe). Firmware state is left for reset/recovery.
+ */
+static void
+mt7925_mac_sta_unwind_links_host(struct mt792x_dev *dev,
+				 struct ieee80211_sta *sta,
+				 unsigned long links)
+{
+	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
+	unsigned int link_id;
+
+	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
+		struct mt792x_link_sta *mlink;
+		u16 idx;
+
+		mlink = rcu_replace_pointer(msta->link[link_id], NULL,
+					    lockdep_is_held(&dev->mt76.mutex));
+		if (!mlink)
+			continue;
+
+		msta->valid_links &= ~BIT(link_id);
+		if (msta->deflink_id == link_id)
+			msta->deflink_id = IEEE80211_LINK_UNSPECIFIED;
+
+		idx = mlink->wcid.idx;
+		rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
+		mt76_wcid_cleanup(&dev->mt76, &mlink->wcid);
+		mt76_wcid_mask_clear(dev->mt76.wcid_mask, idx);
+
+		if (mlink != &msta->deflink)
+			kfree_rcu(mlink, rcu_head);
+	}
+}
+
 static int
 mt7925_mac_sta_add_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 			 struct ieee80211_sta *sta, unsigned long new_links)
 {
 	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
+	unsigned long added_links = 0;
 	unsigned int link_id;
 	int err = 0;
 
@@ -1030,8 +1070,13 @@ mt7925_mac_sta_add_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 
 		rcu_assign_pointer(msta->link[link_id], mlink);
 		msta->valid_links |= BIT(link_id);
+
+		added_links |= BIT(link_id);
 	}
 
+	if (err && added_links)
+		mt7925_mac_sta_unwind_links_host(dev, sta, added_links);
+
 	return err;
 }
 
-- 
2.43.0


