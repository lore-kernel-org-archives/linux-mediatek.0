Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F6EE7717F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 01:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEOr7ZXlRapM92LTTZWIPUw2bm7p3TbC4/klzbIn6U4=; b=DGwgnUxygSlHUPVptd32cajHdI
	/nSRMzm1dkoWJlF9yju+ags9SWTVj0flhTliXFkTZaysgCArSPhQX0O9zeEQZo4MOXwqL/wB/L8LM
	nbi0IE62h0VJCXPFyl4M0X44IKQ2/Q5ReKt7PiHcQh2xBkOBOlsTJ9URxMkVUuDG8We2XeaTT+NuJ
	rGIzi51TbVRHSp1lJhrBmrMej8JiCcit9+Vo4QqYpUoUZOTEhZF2A9tantj6ZQNVP/uDOf4usicFX
	56+iQXfEbAxmdC5YDNqT3+9Bk0RUDNN+tRSgSgIoRjH28Y2xse+fKJrlcU60dKwE5sVrdzeC9lrkg
	uQ95DvGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBOI-0000000DOfB-0Mc3;
	Wed, 11 Dec 2024 01:19:50 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBOF-0000000DOeC-2mQs
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Dec 2024 01:19:48 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-29ff8053384so749259fac.3
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 17:19:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733879986; x=1734484786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hEOr7ZXlRapM92LTTZWIPUw2bm7p3TbC4/klzbIn6U4=;
        b=LFR8Mb0p6TswmQdSkqTGt3utw4WV5soXv1N70DLci8xg+dLoRdQuEh3VX18vC92crE
         6/bqhxvedO84z9WjD3ieAP7TcY7+CfKtpw4SSEYMC3bj4UeOfSKt9BdNy0L5RyRsK2EU
         YGgSNgCcmDWpTJ7FF8qpO4YnGoZxNUZy+JgiMUddx0DlAXnIBsoU3O8hicjzP05iQLB4
         cMsjWrL9Wcvxctix83apB4dBE/s5maznRLTXce6FYvGmx4Gesemd1QIDpNtDTUTpM3eb
         B7d4RRdNnskAUR5nTswaUtnz36e76zNqdLYD7u3bARGVQnhAwHBUvW1vm5SfUff8P23U
         So3g==
X-Forwarded-Encrypted: i=1; AJvYcCW/zzSpUNldbw2g3osqtLbZEhznvx4u0D9fk722lofQ+JTddtwzM5OViKf/6cmOQseWC0xVeKI2vQzoEuChGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhqBQUjl433ebKuvzWaZBjRJaVIP3c4uj62RMTwMLCBd8Hhf+l
	WJVbiDI7qLiocd24KxUJg8NaQitPfx5ELKAc6dHdcdOM0uaJUOnD
X-Gm-Gg: ASbGnctSzubmuxRRAZj+bdfQ2pisGAFKFotoHj/4tDNbFJo5mf/SiNdFosT0NPR7p56
	G5/WoVJKWHM/rtloqg2gRWQ2Mfwh4oW2tZilBiH14OJMj1lecDJY1OxHeNORZXo1uPS7wHl4fUg
	FT+ntLOXwxzySkshz0ec7RjGPCLaXSQYVZsPxqfRTxzR+b9WX0MkQC0hX9tYW5pfWVrGaG2yW4e
	sV3OA+BDR0oPXTWcl0BQLh/257ZssqW/2EwrufJd/cQUIvUf+KtSI5rdxEVGiREIYNimDo=
X-Google-Smtp-Source: AGHT+IHyTyMIudqQQAHm8Avp4jqbQUHuxB2LXIFJRrOoiknpoI5ToKmsSgg7GyvDzpOHcwl3dttvug==
X-Received: by 2002:a05:6870:2887:b0:29e:569a:f90d with SMTP id 586e51a60fabf-2a012f3f948mr555637fac.32.1733879986473;
        Tue, 10 Dec 2024 17:19:46 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29f93552d34sm2705701fac.24.2024.12.10.17.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 17:19:45 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 03/17] wifi: mt76: mt7925: Fix incorrect WCID assignment for MLO
Date: Tue, 10 Dec 2024 17:19:12 -0800
Message-Id: <20241211011926.5002-3-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241211011926.5002-1-sean.wang@kernel.org>
References: <20241211011926.5002-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_171947_703741_72972448 
X-CRM114-Status: GOOD (  11.56  )
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

For MLO, each link must have a corresponding WCID.

Fixes: 86c051f2c418 ("wifi: mt76: mt7925: enabling MLO when the firmware supports it")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mac.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 19 ++++++++++---------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index ddd406969061..a095fb31e391 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -49,7 +49,7 @@ static void mt7925_mac_sta_poll(struct mt792x_dev *dev)
 			break;
 		mlink = list_first_entry(&sta_poll_list,
 					 struct mt792x_link_sta, wcid.poll_list);
-		msta = container_of(mlink, struct mt792x_sta, deflink);
+		msta = mlink->sta;
 		spin_lock_bh(&dev->mt76.sta_poll_lock);
 		list_del_init(&mlink->wcid.poll_list);
 		spin_unlock_bh(&dev->mt76.sta_poll_lock);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 22a9437236c0..6823187f406b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -837,6 +837,7 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	u8 link_id = link_sta->link_id;
 	struct mt792x_link_sta *mlink;
 	struct mt792x_sta *msta;
+	struct mt76_wcid *wcid;
 	int ret, idx;
 
 	msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
@@ -855,6 +856,15 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	mlink->last_txs = jiffies;
 	mlink->wcid.link_id = link_sta->link_id;
 	mlink->wcid.link_valid = !!link_sta->sta->valid_links;
+	mlink->sta = msta;
+
+	wcid = &mlink->wcid;
+	ewma_signal_init(&wcid->rssi);
+	rcu_assign_pointer(dev->mt76.wcid[wcid->idx], wcid);
+	mt76_wcid_init(wcid);
+	ewma_avg_signal_init(&mlink->avg_ack_signal);
+	memset(mlink->airtime_ac, 0,
+	       sizeof(msta->deflink.airtime_ac));
 
 	ret = mt76_connac_pm_wake(&dev->mphy, &dev->pm);
 	if (ret)
@@ -904,7 +914,6 @@ mt7925_mac_sta_add_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 			 struct ieee80211_sta *sta, unsigned long new_links)
 {
 	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
-	struct mt76_wcid *wcid;
 	unsigned int link_id;
 	int err = 0;
 
@@ -921,14 +930,6 @@ mt7925_mac_sta_add_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 				err = -ENOMEM;
 				break;
 			}
-
-			wcid = &mlink->wcid;
-			ewma_signal_init(&wcid->rssi);
-			rcu_assign_pointer(dev->mt76.wcid[wcid->idx], wcid);
-			mt76_wcid_init(wcid);
-			ewma_avg_signal_init(&mlink->avg_ack_signal);
-			memset(mlink->airtime_ac, 0,
-			       sizeof(msta->deflink.airtime_ac));
 		}
 
 		msta->valid_links |= BIT(link_id);
-- 
2.25.1


