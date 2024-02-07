Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B502C4828F
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Feb 2024 13:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w1RihZit+1vSgq9G8FoQ/W9gis9ZTbZPo3dwEeqShqE=; b=El4fOKZsoAmT2LQoBU+Kxxiuk5
	6bjtZKejR2Qc8zf32JF4Yt5Z2u6G4dYNYn4RS7Z99KyB1mmG38qckLyIdvWlpQM0CplEB1M+UAc9z
	0drn8pw+c2Z2NeW+iC2BzHl0dmUZutLzQqzsepn1onGfeAsnRDcZaxHLX9epEvOYmuCa0ALMR9EPP
	hVTRLCDl27WxcZ7qyM0ECOjr/Rsa/g7b3BPJqikuhm7GHxuREw9w1XpTwIM+rF6S+Jnll5VRAR11E
	xjgrvcc/xElYEoiw4qPI4Lx7wwA6o5eJKZnhH8Vr3v3Nd/3XxHpMJONLB7ll9J1oUJygyYO1dXV0U
	TMhwEUyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXhhw-0000000Aihg-0Wum;
	Wed, 07 Feb 2024 13:11:20 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXhht-0000000Aifw-0b9G;
	Wed, 07 Feb 2024 13:11:18 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-339289fead2so480901f8f.3;
        Wed, 07 Feb 2024 05:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707311475; x=1707916275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w1RihZit+1vSgq9G8FoQ/W9gis9ZTbZPo3dwEeqShqE=;
        b=bKOQMMWXOAfEdbskQNx/xH4gbiV4immdBCj35zKGDeGTkUnfAssJYbVPBddaDmAyDb
         15Q/egMa5NeTKteeQ1aBv7H9szyDYBs3LCLYFgVLGYHl9fX5qNysJO7eATE0hswz9Sxj
         G1qVDN6uYHggpFJ3Yr+BhMVQLwodmjZwQYhOTqGnZFWq6SsUCGdkaXue39+27ouyOn3d
         K+Q1WTpEfribqMM+3QvKD1AGZS9cfBu6lnCJjx0zzah9hpe7qaVXeWd3d/EfAL1r9Ztx
         hPXW1ZCAYabJQTzrCvK+U8bN5eLdltMe+qZ4EbXlOCIRZpEsNrjUrI9ilw1h4NVA7tHx
         Drpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707311475; x=1707916275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w1RihZit+1vSgq9G8FoQ/W9gis9ZTbZPo3dwEeqShqE=;
        b=FjZg4FwaMvy4lfPH54hll26jeD0pWGRiqiVse94Z79XHa5VTTef6tyzTZYWfG31ODc
         JEr3+m+m4Z6MJVzPGUOwlQTy/q7nVltyfcd0bTp3Z+DQ0qD1X5dF3YY2nK+zYUtdHw+k
         La8nWCheD/zXfZdtkB6TldccO/i8NDpdyelZal8PxuVOprXkCEI00I7BTmeYB0nkcPT0
         eTME2egWUczGzWRp6V4sJNpoSGHCfh4rh9YthYyW7DJTj16LJ+Bw2nlQjrI4l1yr+aHX
         WN+++eHsY4H53OAy8EqWZVC4OzukGtPQVYFksFJsQZwrH9f2x+3gj5O/etgvB06gpG3X
         XgBg==
X-Gm-Message-State: AOJu0YxJmTpxdD2zoI5Yvvoup9Ir0ygWQv6KCm74T1Iwd7QJrwG23VLK
	v7y+MjHiyG8UqIbxsxTlgn8cwm0M5MzEHN0bWPKWtBvXzjoRZLGn
X-Google-Smtp-Source: AGHT+IHLRqhcd11KsozD0d9k4SiStaKrBqSgCjQkcM99WIB8aENFVx+5vi0yiVtlNyO+oDye/aqZRg==
X-Received: by 2002:a5d:42ce:0:b0:33b:159d:8222 with SMTP id t14-20020a5d42ce000000b0033b159d8222mr3226920wrr.23.1707311474773;
        Wed, 07 Feb 2024 05:11:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWxT+EHwt8qDaK324BHNX1CyyMnptoy+k5D9JtRhhA1qtfS43fAC/uTJ4azFCLjq6qUy7yHXJqptwncrq6Zz30BIraarUAAg4aCZvz8doOJrrFc5vzzMwjOj9mm50yrQ35CXxMmE+zI6uqz26O5PO4Iwgc0A14U40+jvVkCVgqgkHMS4CbNz1SOSgEAMkT1smp5i76gFJPdxvh+S9uH9/f6FaY6F//7fwAYg0UqJKzHnUBzPGYYh26PWt0iFjZTb7cXphqLsimqqMcaa/Mv0CpuAaCGmp9KwvDIx7Sx56P+aCSMSwYcGy+jKgK/Qz9FQL05rZXZto2cecoNE0g0VGzFl7aNCjiSDZQrU/5I+rdUp8xbIAYqTqxYPzLOvvkRKBMWia/ao53w/Y4WIFtUzAE41q2tlsdpV716qgD09uwXllHFl1cnfwPIqQCg+VsLxCOsOrQ0SGaFI6R2oxXwLW30rIL5/ZurvigKqxEyghfWT6K3KHcjJKafjyRsesv8YA==
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id n10-20020a5d67ca000000b0033b4b165aa0sm1525798wrw.74.2024.02.07.05.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 05:11:14 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH][next] mt76: Remove redundant assignment to variable tidno
Date: Wed,  7 Feb 2024 13:11:13 +0000
Message-Id: <20240207131113.2450297-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_051117_203585_0C5A45CF 
X-CRM114-Status: GOOD (  11.52  )
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

The variable tidno is being assigned a value that is not being read
and is being re-assigned a new value a few statements later.
The assignment is redundant and can be removed.

Cleans up clang scan warning:
drivers/net/wireless/mediatek/mt76/agg-rx.c:125:5: warning: Value stored
to 'tidno' during its initialization is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/agg-rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/agg-rx.c b/drivers/net/wireless/mediatek/mt76/agg-rx.c
index 10cbd9e560e7..07c386c7b4d0 100644
--- a/drivers/net/wireless/mediatek/mt76/agg-rx.c
+++ b/drivers/net/wireless/mediatek/mt76/agg-rx.c
@@ -122,7 +122,7 @@ mt76_rx_aggr_check_ctl(struct sk_buff *skb, struct sk_buff_head *frames)
 	struct ieee80211_bar *bar = mt76_skb_get_hdr(skb);
 	struct mt76_wcid *wcid = status->wcid;
 	struct mt76_rx_tid *tid;
-	u8 tidno = status->qos_ctl & IEEE80211_QOS_CTL_TID_MASK;
+	u8 tidno;
 	u16 seqno;
 
 	if (!ieee80211_is_ctl(bar->frame_control))
-- 
2.39.2


