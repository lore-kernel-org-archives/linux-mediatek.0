Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462FCFC9EC0
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 23:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PrlATq/D6VsacUIKx37oVLOAJoVj59zJ+W+tciW1eZM=; b=PmfhhT6xS0qfVoxac5jm1+Putk
	JLjgcOWxi+K4nLTWShos/jYcQQnUOi8DtzfPbrfXXmqj8qKs4h4Q2PJsHys0Ipg2NHAxj9Lk2rKZ2
	IFjGbl+o55CM+ZBZZSXPlNyNkia5CHVZnsrkWYf/mkeND+0F54HqlajUhep4PXk4qq6bNRYxuODrk
	l9zUFDA3I/GlIXCK5M8ZqXRde/bPhN59iu3lJMVYumhtClWVpK/8DAAJNSwOmIUNEqPQAXE9baFro
	H/6Nj/IqyOri3l7LE3eaIL0yIFmP7YOdhEFaMOVyRyaV1hq/ByM5jJ0KcR77RyzaKDcGbzivv3T4f
	8+8SnFvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeWK-00000004diE-48zc;
	Fri, 06 Mar 2026 23:23:48 +0000
Received: from mail-oa1-f53.google.com ([209.85.160.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeWG-00000004ddq-3hlT
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 23:23:46 +0000
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-40efc77933fso3178603fac.3
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 15:23:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839424; x=1773444224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PrlATq/D6VsacUIKx37oVLOAJoVj59zJ+W+tciW1eZM=;
        b=dUF48w/bBTTYMJTESFroxqYRpBNSUY/paFz/uhllwansUYmIDiezA1GTjHMO4F5Nw0
         5sD6NQw8Xo3xelVTPejusZ2+YBTePPJ8O7FeTvOJXWxCnmAU/WFyTquogYjmDVH5Wyii
         OeGq32MNtFj5/3f++qjfzzcWZLAWODY7osZBcSwuYT4da+iDA/GDF7/eyT+W/q+BvXQe
         giF3GUpbBNYPTlUlCKnSjeoL+MJhKUPGITs/yFoJgolBU4iOd3oMh7U8JBv2FL++si9a
         xWGrleagYbYXi0Yg4yzA5YAxlD4D+vSFKPZeyVy6QB4nSufb5klu9fLpP4LPTUw/MWS7
         rQqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyBZEGA6O4SV4mGItP/6cnAV5VeuowwaAHxpFurGpCgegY/4fRK2syHfrzoYyDJd5WXkKknbZPf8oFCS0FtA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ78ssGPDSZ8U0PMO5eIrq5Kly25Xi5Kcw0pQBMdsILFVU8bxa
	OEKQNyCA17V4xEBpv+T0t4eY8LU0C/NYeXlgdfDI/M8UiFWfjSRxPWG/
X-Gm-Gg: ATEYQzxvyqEClmC2VvhqpGy/AqYGdSl3uUAL6Co9YXQ2XXp3GaXlaa4krSf+yjCfUwH
	aDQoZ84oG36pdGOANzw2IdyPaFk1Dd1WrEKLexuJDI7I2rrDl/hG84peKL6rNqTfIYNQ3kUIbiG
	9eN7MpP1dukYdGJ+a6s8vXgvQOQ2CyckKgHPXO6S6BhgF8w7uxKIbH5xTnwCWS9uzogQD+Xa8o5
	a8cmIqFYDjzoAK6SNVg8VHTZo4THrupvY+8gR8e4e1HwDPKn+tlaXtgivsa8qSzu0/9b144gel6
	GM37ZK3jGvy1d6CvsTRISN3LoLXVe44VmTYO7J3SkWlJz1N1imisgo4beI7Hg/L1fphGzynEcUc
	mYJWHYJhBIgZ8JsN0xM2f/YNkyho4dmE7UFp3q5srasGTb5974eMKN6VCMu/vI71tRdjRZuzHij
	Lu8DY6SaJ0SEkDgXryKN6GC7yEXOMFeKl70q4uhtF6mmiTvxc=
X-Received: by 2002:a05:6870:8808:b0:409:57ae:54e4 with SMTP id 586e51a60fabf-416e3ebf34bmr2140349fac.9.1772839424105;
        Fri, 06 Mar 2026 15:23:44 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-416e65b1c82sm2572344fac.5.2026.03.06.15.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:23:43 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 13/19] wifi: mt76: mt7925: make WCID cleanup unconditional in sta_remove_links()
Date: Fri,  6 Mar 2026 17:22:32 -0600
Message-ID: <20260306232238.2039675-14-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306232238.2039675-1-sean.wang@kernel.org>
References: <20260306232238.2039675-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_152345_082325_2A668247 
X-CRM114-Status: UNSURE (   8.55  )
X-CRM114-Notice: Please train this message.
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

Drop the dead pri_link check in mt7925_mac_sta_remove_links() and
perform WCID cleanup unconditionally.

mlink->pri_link is already cleared before the test, making the branch
ineffective. This matches the actual teardown behaviour and simplifies
the remove path.

No functional change intended.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 151dc79f7c12..584d989fb4e8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1221,10 +1221,8 @@ mt7925_mac_sta_remove_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 		mlink->sta = NULL;
 		mlink->pri_link = NULL;
 
-		if (link_sta != mlink->pri_link) {
-			mt76_wcid_cleanup(mdev, wcid);
-			mt76_wcid_mask_clear(mdev->wcid_mask, wcid->idx);
-		}
+		mt76_wcid_cleanup(mdev, wcid);
+		mt76_wcid_mask_clear(mdev->wcid_mask, wcid->idx);
 
 		if (msta->deflink_id == link_id)
 			msta->deflink_id = IEEE80211_LINK_UNSPECIFIED;
-- 
2.43.0


