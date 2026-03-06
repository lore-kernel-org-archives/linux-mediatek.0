Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F43FC9EC1
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 23:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZWeFiCnrk6APXuKyptiq4X50TlocyQfsSTuqJwSQAA=; b=UuUZ3tBlq3LP0ukeWHhh+uB+DA
	aS7N0FwCSB8QdlZWtIjc6eH6+rmUOcglVRqrb+x1FSdWUGP5LjF8RO/pYMtl9I3DpwJQnm5XS/Syj
	QR4YTUabNATyQiMM2HOlPIIOovQ30mUxKLjaFa9egU+6fordebFrLe+WmZCclDhh5DIcMd6N3IniV
	Tm+3xeblw14+FHLQgRVNNHYy7Aszj3SS7bdJFgwLwirAIBa2D1mkH5mYukX/g4EMTWn1Zjk23ZA05
	jD9FMXLC02Hi4e8U/mv5yq0TpTk+p9KasIpsN9jz9eUALTrTuYdF77iuOGTFq0f1GcjA4cEwyiFtO
	jDfMIegA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeWI-00000004dg2-20FU;
	Fri, 06 Mar 2026 23:23:46 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeWD-00000004dd3-0irY
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 23:23:42 +0000
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4645dde00a7so10010328b6e.1
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 15:23:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839420; x=1773444220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yZWeFiCnrk6APXuKyptiq4X50TlocyQfsSTuqJwSQAA=;
        b=UnqadP8wpGhjMptIUwKG2pRs/9UwPpxDhkRL3TfiAmSKrWuZjCOSKbBwqImpF4narr
         HDxFvjtbmapJjgRYR5yMFdeQmanlMTsNUMab6TlIcmgDrtvh/sGoQTE3/cqvBN5z5Rju
         WVSfMZi2Y9AjCQMuJpTQm+IMDqTkElPk/chY2Nf+V5X9Cyuq1UNvSeR2VSnmJirav/O1
         LLLCDqpvWRJE1/pBwkmzzRJ0TKeODMNXbpWl46cYyf+adiMBgQk2lLZWLSrORsMN4Ae4
         1kVo7vR1lj+oJBgprdywP9Tz1B3o0EwbulEeF/XWbQ5scsBPBgiMoPLInBPQy2vDK5ss
         0j4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSrFadWm32OwkzsEt9HT39GUqNCuaj2GAIPbeqHoCCLOfbm9zZ3RHN2xrZ08zSd99bq0nMwZBGsnySGytjuA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwvLZdG0nNlkMaVWAAOfGgyLCvywZU20cr9Aw9lGduF2iBgWDy9
	ZZXUG6R+tVL1LyvhPJOyzCKo5N6zktLTVEqi9xXEgNDN7YUd1DHFLZi/
X-Gm-Gg: ATEYQzzzRzNDD2aOMpsUA4KcKS7zKb0pp9xHC9KTMeStdNIZQgFLoLrbNuQ/cInGsf+
	bAWHbBjcq5tbo8nRWeun6epSeOfiBPhiYxsBw7YQlUCHQfAJjQpQYghJF2Ew93/i1HbYmyN7c8t
	qpjoRgrDL2YogJ/dPVDPDnUcopBY0t1qOtqAMejra4ffMUZg536zijPMTp/09xrDAlsS6q1MdJC
	UDNy45EnxWC/YDEvUnQbsUOVeevHS8YUm95FcJeUCrXnRnya1GYBnWS6JqLGHOQXPLaF+eQ6rhV
	ZnSAuh5jD5LDTbP3z2JxJSZ1SFS5Iu3RrScw3CO6cw5EK17C1DMKz/GNHf4BS7QqWwzFRL39vkL
	eKWFjNbvilIWbAAWsGUmpVfoHdxC/0x+mF9pnLkr5DSoWX8t8X+06W74whPQczotiYOWcM8dq7P
	TzRYFLBD5zSOTc3bMWcGWXFZh6GQlKtclGKz1o5pnChcY3T1M=
X-Received: by 2002:a05:6808:2394:b0:455:e5c2:a6f9 with SMTP id 5614622812f47-466cd097d9fmr4666819b6e.14.1772839420166;
        Fri, 06 Mar 2026 15:23:40 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-416e65b1c82sm2572344fac.5.2026.03.06.15.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:23:38 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 11/19] wifi: mt76: mt7925: resolve link after acquiring mt76 mutex
Date: Fri,  6 Mar 2026 17:22:30 -0600
Message-ID: <20260306232238.2039675-12-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306232238.2039675-1-sean.wang@kernel.org>
References: <20260306232238.2039675-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_152341_210771_F6891B86 
X-CRM114-Status: GOOD (  10.00  )
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

mt792x_sta_to_link() uses rcu_dereference_protected() and therefore
expects mt76.mutex to be held. Move the lookup after
mt792x_mutex_acquire() to make the locking explicit and correct.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 68f168a093f2..135a803b4382 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1071,11 +1071,11 @@ static void mt7925_mac_link_sta_assoc(struct mt76_dev *mdev,
 	struct mt792x_link_sta *mlink;
 	struct mt792x_sta *msta;
 
+	mt792x_mutex_acquire(dev);
+
 	msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
 	mlink = mt792x_sta_to_link(msta, link_sta->link_id);
 
-	mt792x_mutex_acquire(dev);
-
 	if (ieee80211_vif_is_mld(vif)) {
 		link_conf = mt792x_vif_to_bss_conf(vif, msta->deflink_id);
 	} else {
-- 
2.43.0


