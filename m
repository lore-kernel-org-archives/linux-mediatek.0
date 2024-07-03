Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44549C2BD09
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 21:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ffWOmyzGdQmn/1ElFIgBjJf1v30KLPcOBR1pd24Nq7I=; b=A0WpAoSuGh9mrVuoB/H8+NSTOC
	ZDctrYsgwyzGEbiOcbbM+VTBCz0SB5PAej2Eu3pw2Z/iY5kTSSl3kNWXA00VB90X7WRpzjmjaBuYc
	RZ7bF8/8G0W5c7PVtLVbXFAoXOtCh8jxOY8TG/FzcUpubLIViN3FaUMgi5T5grXUPRMBNuVaTTQ3t
	2aQX0UTt56xNK6ECsJUsVUgYB8yZcsYYYOiGp2tCXC7n+/0V+CWcdKvPYN8NDG3mJ6dHehI927iWC
	BYnIQfklJ2CqqvZvlwH1qOb7vTrx1jSCPcGo9w3Qc/6U66pq8ph6QhNSSf6DMtVVCAUw2rt664PZq
	4AuTl4ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7lF-0000000BXK9-3tKS;
	Wed, 03 Jul 2024 21:43:33 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7lD-0000000BXIE-24UN
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 21:43:32 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-25d0f8d79ebso8178fac.0
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 14:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720043010; x=1720647810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ffWOmyzGdQmn/1ElFIgBjJf1v30KLPcOBR1pd24Nq7I=;
        b=a3I0r1mf6uNyM+mR57UOkjEJ1+7LzrS4FXxzFuQIClVwSPqMVZQ7u+tyXJ7gSUJDgc
         2m7yNnnWODwqkFLqkKtUoJzRGp3lTOb/X/BKGPiPgz453JRN8ARuSnemiT7opbnO7w7m
         wtEbJpmbCebqKbDwuRl69Q1cCwPOtUKGJ9bd6zULiq8BaKMV70Uc2/OU96oB0Ho4Z2iL
         LTK9g7nVOBYniBeZGfxRFASwxNgU7uz06a5n221pF9PUWhGLLDVQtvR6Oqy4wHrgDEIA
         dG60RUFi8SNfgF5ZoQE7phOBbRdAvpyla3XbcZ5JIdZA+cA4eEh/SQ/uwxS8jBSvpB+Z
         6MiA==
X-Forwarded-Encrypted: i=1; AJvYcCW+QNRPO9fcOMkH4yL8iN/HRSkYJJAVDLudeV+U8nIczrAgIn6Mly98wBcKftz9vUyvB5Z8vhliuNuPZpjHLRtlXhGAHyJaASSo7StFMszJqvFb
X-Gm-Message-State: AOJu0YyrxO0lWC//z3gceslxxvGm1DRMJLxijY2GYM/hkLwIvPXVbZEq
	MO2x02upHtglYVsGMIlZ4PrMV/dzJmxxt3P72S/1xsmkXz7aAeLV
X-Google-Smtp-Source: AGHT+IEg9up3tNNH6BCf3a0LDbIZh3GhmduGK33TP3hQf2RrI2NvFjW6FtNxtHICn/l6idPmrPoZVw==
X-Received: by 2002:a05:6830:8c5:b0:6f9:7373:9421 with SMTP id 46e09a7af769-7020774aa24mr11940398a34.3.1720043010569;
        Wed, 03 Jul 2024 14:43:30 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b20953sm2111417a34.54.2024.07.03.14.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:43:29 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 20/29] wifi: mt76: mt7925: report link information in rx status
Date: Wed,  3 Jul 2024 14:42:25 -0700
Message-Id: <b3322836779900612adf2e4ffb409c62ac25c627.1720042294.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720042294.git.sean.wang@kernel.org>
References: <cover.1720042294.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_144331_573620_5B0D1AAC 
X-CRM114-Status: GOOD (  10.86  )
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

report link information in rx status

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c    | 5 +++++
 drivers/net/wireless/mediatek/mt76/mt76.h        | 1 +
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index e8ba2e4e8484..bb291fe314fb 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -1125,6 +1125,11 @@ mt76_rx_convert(struct mt76_dev *dev, struct sk_buff *skb,
 	memcpy(status->chain_signal, mstat.chain_signal,
 	       sizeof(mstat.chain_signal));
 
+	if (mstat.wcid) {
+		status->link_valid = mstat.wcid->link_valid;
+		status->link_id = mstat.wcid->link_id;
+	}
+
 	*sta = wcid_to_sta(mstat.wcid);
 	*hw = mt76_phy_hw(dev, mstat.phy_idx);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 01646538087a..c0e529d0b3ef 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -350,6 +350,7 @@ struct mt76_wcid {
 	u8 amsdu:1;
 	u8 phy_idx:2;
 	u8 link_id:4;
+	bool link_valid;
 
 	u8 rx_check_pn;
 	u8 rx_key_pn[IEEE80211_NUM_TIDS + 1][6];
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 173934ec1e71..c3ce57d36168 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -809,6 +809,7 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	mlink->wcid.tx_info |= MT_WCID_TX_INFO_SET;
 	mlink->last_txs = jiffies;
 	mlink->wcid.link_id = link_sta->link_id;
+	mlink->wcid.link_valid = !!link_sta->sta->valid_links;
 
 	ret = mt76_connac_pm_wake(&dev->mphy, &dev->pm);
 	if (ret)
@@ -1865,6 +1866,7 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		mconf->link_id = link_id;
 		mconf->vif = mvif;
 		mlink->wcid.link_id = link_id;
+		mlink->wcid.link_valid = !!vif->valid_links;
 	}
 
 	if (hweight16(mvif->valid_links) == 0)
-- 
2.25.1


