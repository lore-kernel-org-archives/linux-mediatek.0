Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CDBFC9EC1
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 23:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3R5QDZUhULiTl/yEuN8UleTD/KcNOdRgdU7r70FJACI=; b=oRtza6hm9B5xiSISanMZ2T8SNw
	A2U0JBhVcjEDDhrjLWiPqAO0TFKE5Vd0UVp1Dfbll+fXeLWXWK7eTK39dBsxhKmKBZ3FK/R26CyWX
	ttHroyoTsSofdJ3Pp7VKiVlSndNhXWaUWxgG6fPg/SQXkv5RZXS1rQ3WqhN6OX05SYdRBzJ741Kqf
	FkPZtSCSvG6MkXfaBM6U7k9lHqkjY1H+8rkgOvAoA3pkPQmmDrgTu2Ih5W5VsGGe4iRsk+iW8PkhK
	6FIcmeWb02S6qNNxm4WmuNL1XU1rydv7z35K3FgvVAAfy9ZEhkiIYWwz1wFYmoeY3MzMPHQE8aJe6
	Ymo3PjsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeWU-00000004doN-15bn;
	Fri, 06 Mar 2026 23:23:58 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeWR-00000004dmM-3P8h
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 23:23:56 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4152698e745so1843878fac.1
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 15:23:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839435; x=1773444235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3R5QDZUhULiTl/yEuN8UleTD/KcNOdRgdU7r70FJACI=;
        b=a+qXlUnHv0+enUJZTTcMDse2WGikvOCTESnvCBP5R4h8Y8pOAGeds9k6ZfRdN8rWC1
         1K73pyL33J9AFafqM2g0dHP02ODH2Rb6LdNQBVSwvCt71y1hifrW4tuDujgKWG5gO6Zn
         n92hNkxCZJxGQbti1OitmEytvncnd+PE1CFUGgryFFo+URBEDdFhSQraFV5seiHXfS4T
         gq98joDRGEzzRiJgvAJFgKJYeguWoohQwqX2w9Z7moxsblRz25WtiiJqPWxXQierMFNS
         veUQ5tEayb7shtKWppOpBxWCpy3oqz9AiZjX7nGFYt7s6QxOHZ2YHIyoqYJe0qJ1jHiT
         9OYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxANqYFMNIAq4p1NPRcTEduOPfE8hwUG6xoCzs038OQOD2SXZfzhjyXnRmHwUXn+/sTREHPcMVeHy4aunG2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQWY1zxfa4smj8oQohh+9P+ksUapC/zuQauXpvvMOHtgzVr4BN
	an5xoPVaeDEso4bZfIsE6UK6g2y4MqO/+dUGffc6nYh6qUb7RCj+zxUu
X-Gm-Gg: ATEYQzzjlhLPoc1tOEeJ91bN3IxsDv9k51449ZQyUBVjExhQcH8rS6Hht7mYu1VfC5Y
	mD9qs9MMud5eGI7HuxWpB7riGg3TUTauPnCZ4RXuG39we4UIL5wucCwOTbnvtGDp0BV8kTnga6d
	FlesChPPatM/Zc47Fkas7AqACxIzGxtQ5HKTU0vJpTmYklAIDyCiH9nqh0E7bhl0g2hufej5w03
	RlX3PINJb6pzcfcnnpSmAPffRM4U/s+tEqY/XhlOauCqXQdyfZZO518P7jPj89UfxTUpEElyW/K
	q0Dhj87+/bnc+uidXTRZx4a65APaAAdbF8tSmwIru4gZ1AadE66gB39ub7O1snoMUjmL/z2ZdMN
	vL8W9AijV5HkCiUxd45s8iGcUrQSCH/pIq6Y3LO6g922/N6Ge4GIhDZAIss2B2Y7Ncx5fjgb44B
	BvP790wDhKkXDYe/Z+FJaLorNmF5M94Ve2NmM1q5LqvEG+7V0=
X-Received: by 2002:a05:6871:7993:b0:409:47c2:bea with SMTP id 586e51a60fabf-416e43f6484mr2249906fac.41.1772839434703;
        Fri, 06 Mar 2026 15:23:54 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-416e65b1c82sm2572344fac.5.2026.03.06.15.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:23:54 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 17/19] wifi: mt76: mt7925: switch link STA allocation to RCU lifetime
Date: Fri,  6 Mar 2026 17:22:36 -0600
Message-ID: <20260306232238.2039675-18-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306232238.2039675-1-sean.wang@kernel.org>
References: <20260306232238.2039675-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_152355_854569_5CF1604D 
X-CRM114-Status: GOOD (  13.27  )
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

Allocate mt792x_link_sta with kzalloc() and free it with kfree_rcu()
instead of devm-managed memory.

msta->link[] is published via RCU, so the link STA must remain valid
until readers have quiesced after teardown. Manage the object lifetime
with kfree_rcu() to match its RCU-visible publication.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 10 +++++++---
 drivers/net/wireless/mediatek/mt76/mt792x.h      |  1 +
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 9e3f3874d0b3..eb16c4683100 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1005,7 +1005,7 @@ mt7925_mac_sta_add_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 			mlink = &msta->deflink;
 			msta->deflink_id = link_id;
 		} else {
-			mlink = devm_kzalloc(dev->mt76.dev, sizeof(*mlink), GFP_KERNEL);
+			mlink = kzalloc(sizeof(*mlink), GFP_KERNEL);
 			if (!mlink) {
 				err = -ENOMEM;
 				break;
@@ -1197,6 +1197,7 @@ mt7925_mac_sta_remove_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 			    struct ieee80211_sta *sta, unsigned long old_links)
 {
 	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
+	struct mt76_dev *mdev = &dev->mt76;
 	unsigned int link_id;
 
 	/* clean up bss before starec */
@@ -1235,17 +1236,20 @@ mt7925_mac_sta_remove_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 		if (!link_sta)
 			continue;
 
-		mlink = mt792x_sta_to_link(msta, link_id);
+		mlink = rcu_replace_pointer(msta->link[link_id], NULL,
+					    lockdep_is_held(&mdev->mutex));
 		if (!mlink)
 			continue;
 
-		rcu_assign_pointer(msta->link[link_id], NULL);
 		msta->valid_links &= ~BIT(link_id);
 		mlink->sta = NULL;
 		mlink->pri_link = NULL;
 
 		mt7925_mac_link_sta_remove(&dev->mt76, vif, link_sta, mlink);
 
+		if (mlink != &msta->deflink)
+			kfree_rcu(mlink, rcu_head);
+
 		if (msta->deflink_id == link_id)
 			msta->deflink_id = IEEE80211_LINK_UNSPECIFIED;
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 1f381ab356bc..4ff93f2cd624 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -97,6 +97,7 @@ DECLARE_EWMA(avg_signal, 10, 8)
 
 struct mt792x_link_sta {
 	struct mt76_wcid wcid; /* must be first */
+	struct rcu_head rcu_head;
 
 	u32 airtime_ac[8];
 
-- 
2.43.0


