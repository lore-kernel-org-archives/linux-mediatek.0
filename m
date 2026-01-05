Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B327C2A062
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jan 2026 00:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9pZM3lVItBOVq5Rc4FqhGypr50RN8XCw42MqeJlzrY=; b=3HETJZ8mkmFxvsxlxops642kna
	d77yMAL07lzvS7h9OGlHg4dkS8peYrkU7IvJMSb6HftVgCNke9Ma74mTPz/hheBrWt9KB8tSsAjav
	ptaR3TcYR41B1COGZDyGJLP4HZWQ6ZL7OcFH1WZDuEEk6NfWw/Y46xjn8Z0TlRxBRWC771xpyD1AD
	zrSTFHcwRUqf5L9ii1wfeZ7ZK3Lw6hyVh1dF47kf5yU+svG+nGcERxJBjAzl+cAXIyzsSbDZs/fBX
	RpOy5BKDXS8B2tzGqzxW2wHN7DtZxdIhrD3UdQNIi2derz5nGe5ttdCRLgM3z8RlGpFSku6DuN7SW
	yypUupVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYRH-0000000AaBP-09rd;
	Mon, 05 Jan 2026 00:27:15 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYRC-0000000Aa6g-0J9s
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jan 2026 00:27:11 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-bd1ce1b35e7so9401855a12.0
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Jan 2026 16:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767572829; x=1768177629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9pZM3lVItBOVq5Rc4FqhGypr50RN8XCw42MqeJlzrY=;
        b=LbzuaDzeXMiH/IAmVGpNpm5kiWNpe73+w69qC+aXBS+BL0PBmGLWbBpmmEfxrWUH2y
         gXKR9z03ue9JHwipjGP5vgJ6eh8lSN3WpTX1DTpx+iEWRVVLr8MzWQYykf8FP4bTlBt+
         sOQ0EYcTXYPh0gkPNvOjodNDgD9eoqXke2qhDAHRNwBU+RrVxAbqBBbfqw1T687VAjgi
         Z+fSi87kAvOboSVXq7gZmvjzsvIMBCfvWFUAdgBgHVxP4GTCNsaTn0Jhh6+89mIOBCQK
         qPNE8DHX7YPy/Wjo2PUUM5qL/3zecyhO3lzXyyYxZBCytUg9gVLSiQGEpFmgWcZs3qtf
         tWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767572829; x=1768177629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F9pZM3lVItBOVq5Rc4FqhGypr50RN8XCw42MqeJlzrY=;
        b=mIE+Ttqt4lzoFOjGFLgMytlkjQ+PAqxpkNNqpzv8jLDulocvp4cpjHYO1FkrDbqNkG
         V4dT1nZR9IcHc2v+DIg+gQuthmWY699KGYPsio3fgG3M3kMTP1rR9JHy86bRzO1TIOq9
         bq58l9TwZ3U0+hN9k+ZuzkUAxmcoaTBeaQueC+ix6X45U9AztbrRc+9wnIQbmAorPnLL
         yN87DTew1AnzlJV73wha6lp+5Ver4f7wEjAeFdJXb8cSF1QJb2jw39Op1oBh4S/ATyvV
         hSg0tt+eUNEXshyyNX+pJyr0PCbngrokKBY6NdxDIk7+sQEk/wEXgfBcGBaRZ7BoDSLi
         ueXA==
X-Forwarded-Encrypted: i=1; AJvYcCVotjff07uKGY9EwXyIDTCkCmra5P9BRCY6W6kZ40y/AJ7iaTMJEFedrAmW6GkRxrLjO1R+pHGPr7Rlyofoyg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxF5GKvI10NW7ggiX4zMbWzaV+h9cLGWt4EGRRNBWpr+W/xkTQm
	jYSUqYAHGrVjWwF2puA1suEUHQ2oJWf4rkAeZ+8Y/Du4+92aCHLSOLB7
X-Gm-Gg: AY/fxX5KaAZZnHr2dRoIIJimvDCeGb1BWKYmx27t5d0VZD5er9E8oT1vB+klxOKOQD+
	fwApCXsjdKB0WM5K4cFMAb1U7pCDn8wbp39YmA2cXe+/+1esnSV1xYuaLBFfRi9I5AInUvU66ar
	bcLntfODI+UBI+HyICw2cbXYwFUBdIm+mzHc3UDV38qdSBxGleP0hzIX0OYSGIdth07sDYnnuS6
	KA9aSiYXiBqqL+KRF+IQDFyJTzc7gBO0IoqecMWiAg/lfSph6MUqSg81uqIcSRk0q7ZecIRixnd
	TmzGHQiXHWZkG7CqDOnoeyF51DBjYU1QB/vzrlNyuW7g6y4PLS6Sy1oBaezP3kT1ywY0H0tlmsS
	tCKgLIz8g0MjiBIrdLwBvmTBHjid3AK5WYVlw5UYunWdzl7HhMJOVQdqZu0CC6OiJYY04KoRtMW
	eHFjxP69K/UnEftkm9rloyQLOUnApGzh6t3pRftdZwgXhLNyV+LxZ/WeTwslJkios=
X-Google-Smtp-Source: AGHT+IG7x1Ymdyvu9lCiNZWjm0VKOPz4jnCYI4WRlVDYrDXMAI2/7wPYk6ox4CoZIXyf7ZKZ1JhkhQ==
X-Received: by 2002:a05:7022:218:b0:119:e56c:18a9 with SMTP id a92af1059eb24-121722b4f87mr46583592c88.17.1767572829297;
        Sun, 04 Jan 2026 16:27:09 -0800 (PST)
Received: from zubuntu.bengal-mercat.ts.net ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724de268sm133378109c88.8.2026.01.04.16.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 16:27:08 -0800 (PST)
From: Zac Bowling <zbowling@gmail.com>
To: zbowling@gmail.com
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com
Subject: [PATCH 17/17] wifi: mt76: mt7925: add NULL checks in link station and TX queue setup
Date: Sun,  4 Jan 2026 16:26:38 -0800
Message-ID: <20260105002638.668723-18-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105002638.668723-1-zbowling@gmail.com>
References: <20260102200524.290779-1-zbowling@gmail.com>
 <20260105002638.668723-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_162710_125715_6BFE9F0C 
X-CRM114-Status: GOOD (  10.58  )
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

Add NULL pointer checks for mt792x_sta_to_link() and mt792x_vif_to_link()
results in critical paths to prevent kernel crashes during MLO operations.

Functions fixed:
- mt7925_mac_link_sta_add(): Check mlink and mconf before dereferencing
- mt7925_conf_tx(): Check mconf before accessing queue_params

These can be NULL during MLO link setup/teardown when mac80211 state
may not be fully synchronized with driver state.

Found through static analysis and pattern matching.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 7cf6faa1f6f4..81373e479abd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -871,12 +871,17 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 
 	msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
 	mlink = mt792x_sta_to_link(msta, link_id);
+	if (!mlink)
+		return -EINVAL;
 
 	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT792x_WTBL_STA - 1);
 	if (idx < 0)
 		return -ENOSPC;
 
 	mconf = mt792x_vif_to_link(mvif, link_id);
+	if (!mconf)
+		return -EINVAL;
+
 	mt76_wcid_init(&mlink->wcid, 0);
 	mlink->wcid.sta = 1;
 	mlink->wcid.idx = idx;
@@ -1735,6 +1740,9 @@ mt7925_conf_tx(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		    [IEEE80211_AC_BK] = 1,
 	};
 
+	if (!mconf)
+		return -EINVAL;
+
 	/* firmware uses access class index */
 	mconf->queue_params[mq_to_aci[queue]] = *params;
 
-- 
2.51.0


