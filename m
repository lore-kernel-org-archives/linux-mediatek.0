Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA2AC2BD09
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 21:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RxSmN3RyGqtOMcnaemjIRPhc3UORadWI0djDIJjxFRQ=; b=LlK369TuYsuipVKJL326YbQgwW
	Ayssx5AJRiuiY4xPdu9mvqYCLxPeLF3Fvwjo7fi5XDr+KjI4t50AD1Mol7fDjChT6fd++G3TZ0VhP
	/BfSJzp1yZftVm2BLVvf+jL7qlYj7EG1d+4S3uHIWmBLBtkxtXDYCQyXnArYIDndZX/5jIh5g9UKW
	CGvJPLcYpGaIHsVPRYWp+34dTYl15empUNzJE1pnTdRImxs5t8Je9OJ5xqZJxscN1GRtzZMxJdAXw
	HSazh7q1PX1j/jTcVsRf+Jgm99HBckYuHUikqBHmI7WXKcL5blFFtZGch4yWkzYjmmboxcIZMvnB2
	OkiMj1fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7lI-0000000BXM1-3VrI;
	Wed, 03 Jul 2024 21:43:36 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7lF-0000000BXJ8-022K
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 21:43:34 +0000
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-700d29f33a0so89050a34.1
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 14:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720043012; x=1720647812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RxSmN3RyGqtOMcnaemjIRPhc3UORadWI0djDIJjxFRQ=;
        b=eWZJvYcNCPF8GPm9Ty2BmvMM+pxZ3jCow0XiKwDH9gBbGSa5yh1lDMnahVwSgOuCzh
         Ep900b5TbnD4QcXnWndIWgNp8yUfu7ezgeyDCVg6cwfYfFq1rdTT39suAGpkQ6lCctEy
         JThW+wIFWb3O2fnTjwULDSV9dgVtG3Mj7KXVXCmYOphtiIPc0+4R2Hw69hUsUUttEA2d
         MQUk5Lsnb93RKs0dJNog6JMOZisHUhUvJ1SOXs3eTX0s0QpGohaKsIwFMAv+WG4Soguj
         kc9tEGFp/1/AtrJvKiPxvER6KELfjto5nYkHDdYZHv4gtLIuoxgDz2a6NLgK3x1XVb05
         TH4A==
X-Forwarded-Encrypted: i=1; AJvYcCV6sVpWmJKYbjvppGc23c0af/innhvL+ygZFC8vXnWYrqkQ9adCEsTY0ROoB7NNI4buQ5bX2EpBxQkYZL4CMz1kn27FFY98768wuEYqZ871Zmlr
X-Gm-Message-State: AOJu0YyAhd82TlzvedGNfkE2ehVvwHtvSisbYkBbHrBW3RwcRNB/aptx
	nHWdeyuF0gRES5SqOYKJdP4QK7Pdr0lW8lex6GrKHTdhcsgPsRUp
X-Google-Smtp-Source: AGHT+IF/LGon8YWCTWFG30B8KA0KF181GSiy3MGe5Zpy91+M/CxwYtnXKl8o1WBcM0358pYIOT8lnw==
X-Received: by 2002:a9d:7e8a:0:b0:700:e0e8:5e2 with SMTP id 46e09a7af769-70207560e89mr12825062a34.0.1720043012083;
        Wed, 03 Jul 2024 14:43:32 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b20953sm2111417a34.54.2024.07.03.14.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:43:31 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 21/29] wifi: mt76: add def_wcid to struct mt76_wcid
Date: Wed,  3 Jul 2024 14:42:26 -0700
Message-Id: <c453d6b0045ce09fded4e255dc4673defa0dc2ec.1720042294.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720042294.git.sean.wang@kernel.org>
References: <cover.1720042294.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_144333_074423_ED5EC653 
X-CRM114-Status: GOOD (  10.77  )
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

add def_wcid to struct mt76_wcid to allow per-link wcid to retrieve the
struct ieee80211_sta structure.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h        | 5 +++++
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index c0e529d0b3ef..f8431b889c78 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -368,6 +368,8 @@ struct mt76_wcid {
 	struct mt76_sta_stats stats;
 
 	struct list_head poll_list;
+
+	struct mt76_wcid *def_wcid;
 };
 
 struct mt76_txq {
@@ -1258,6 +1260,9 @@ wcid_to_sta(struct mt76_wcid *wcid)
 	if (!wcid || !wcid->sta)
 		return NULL;
 
+	if (wcid->def_wcid)
+		ptr = wcid->def_wcid;
+
 	return container_of(ptr, struct ieee80211_sta, drv_priv);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index c3ce57d36168..339888086076 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -894,6 +894,7 @@ mt7925_mac_sta_add_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 		rcu_assign_pointer(msta->link[link_id], mlink);
 		mlink->sta = msta;
 		mlink->pri_link = &sta->deflink;
+		mlink->wcid.def_wcid = &msta->deflink.wcid;
 
 		link_sta = mt792x_sta_to_link_sta(vif, sta, link_id);
 		mt7925_mac_link_sta_add(&dev->mt76, vif, link_sta);
@@ -1867,6 +1868,7 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		mconf->vif = mvif;
 		mlink->wcid.link_id = link_id;
 		mlink->wcid.link_valid = !!vif->valid_links;
+		mlink->wcid.def_wcid = &mvif->sta.deflink.wcid;
 	}
 
 	if (hweight16(mvif->valid_links) == 0)
-- 
2.25.1


