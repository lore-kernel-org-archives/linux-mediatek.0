Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F0AC3DA40
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6JgbGlLloDOsdCpCL/NF0E12c2AZhS/thZxd2FKNmc=; b=Qnuds9/hwvz8amw0QzqNHkrMTQ
	Ylfi+A6pGJsOzCrSsRbsk9DuCBjuSyaB0tpaZaNIojhEdyeIEk5TlatixpIwRmWK1AJIHEYG4EA5A
	lt2qjhdEJCed0hFQ/ztGorLK184xVlWH2+SQb6wp0gfVxAF0SeKK9J11C5if8vLfbO7hew8NuG5Br
	7maX9BrqnhtMAkm5pzZ+fEmGOicSnE/0Jh6gXznqthQ7hhKO0AEwpP/1QSmeQ4s7eVfiyFgyS+Mvt
	uCyOjad30ytMcwmArfzE3/4FIfp4HrNH71o5OyvVLh6swPJR70+4+G+CMdlbGyP7lCvJzjIgBkUt7
	Z7m5myyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0n2-0000000HY64-3BSJ;
	Sat, 06 Jul 2024 08:29:05 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0n0-0000000HY3p-0ztL
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:29:03 +0000
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-24c5ec50da1so284893fac.3
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254541; x=1720859341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6JgbGlLloDOsdCpCL/NF0E12c2AZhS/thZxd2FKNmc=;
        b=wFFdOsRA46ZraYWhh51LPlitBUeuz42wQp5JrWocs7V0GMjxjZeLj8Hgowp4J2AAOB
         nsQ58eewmTqtT3v+1dQd8jzjT++qnGhKCWMeJ/bZbjoooSEGb1ZlKK4zCKDkC20gn14v
         XfGbBEbGPtx/POasNJvBLE+GBUi+K0Rjx8Tq3xoWO1yEbKzCYhoMqjhtOF0kxMnF1ooz
         vo+Ex8Q9ot17p3ANDyHKoDcD2XasZNHFSmquqerotSr6I7emKYC9XyxBY3Qng6RaY8aQ
         ipYFGTY6e1bOHfZvqpfisK9AZNBdPw+lqXKkAVO7eIuk/3fx9bD+tOY4aQUSqoQ37h2Z
         NJtg==
X-Forwarded-Encrypted: i=1; AJvYcCUK091af38ffD3m0ddOlliA4ewdsHI8r7BjpZprr5+9B7vdJtvJBz13FUvMx6PurT80uOSFVeTnkSyd6hY2xSRd17DJ8ufIXHz64EwhhkwoUgYj
X-Gm-Message-State: AOJu0Yxmuc1TVakSIwUn5BWWbWXxBodOj6a/HX4PrtLHz1/AmEYtUrv/
	Avj1HhCaiRe7oSr/SEeMlOoTW+VgjcIHOSnkafdWA0Kd8ThCXRhC7jvMW3p1
X-Google-Smtp-Source: AGHT+IEfuTTj9gDVp9lM/598TllXNNPv45c5rNz254+YfkdsEpTbczD8iLScDxGA1PCnoOpkitpzCw==
X-Received: by 2002:a05:6871:54a:b0:25d:f237:e108 with SMTP id 586e51a60fabf-25e2b5a1bfcmr6904185fac.0.1720254541141;
        Sat, 06 Jul 2024 01:29:01 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:28:59 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 23/37] wifi: mt76: mt7925: report link information in rx status
Date: Sat,  6 Jul 2024 01:28:03 -0700
Message-Id: <c7cdc17d94375a76802a5c4a825ea3e51cdb53af.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012902_328510_0E62F087 
X-CRM114-Status: GOOD (  10.33  )
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
index daf1e43e304e..e1d30326f5af 100644
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
index e1af5b4179b0..1a6a0b56a23e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -811,6 +811,7 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	mlink->wcid.tx_info |= MT_WCID_TX_INFO_SET;
 	mlink->last_txs = jiffies;
 	mlink->wcid.link_id = link_sta->link_id;
+	mlink->wcid.link_valid = !!link_sta->sta->valid_links;
 
 	ret = mt76_connac_pm_wake(&dev->mphy, &dev->pm);
 	if (ret)
@@ -1898,6 +1899,7 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		mconf->link_id = link_id;
 		mconf->vif = mvif;
 		mlink->wcid.link_id = link_id;
+		mlink->wcid.link_valid = !!vif->valid_links;
 	}
 
 	if (hweight16(mvif->valid_links) == 0)
-- 
2.25.1


