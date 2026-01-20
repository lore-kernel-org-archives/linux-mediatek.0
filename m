Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED9AD2629F
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jan 2026 20:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZqhvQUqHyPjd5YwFiryR+es7m9UdWSAqM9hdcVMAYY=; b=080GuEMF2bD8B+XFr+Uc7CG1XL
	J8/Zsz2EQvRwwe0kznZgQvnrM87GyCwGeJPb/BdWRsqAlOrYSN/epDB9OrtlENEqcOL5j6e/3+V8V
	Q4PG3i2D2yLPRKVQR0eyK8pZ+Jhoi2vtwodXzCvFDnR37nNUnC9hnn27ybUaHP0RPTvbnSR+3fJQF
	sELnSJjwwUuBM1SCP1JK3u0scLA1gL/u4iadhvTfMPC0alI9/shjYlCU/1kYRIifk5wQbFclpW8L8
	oftkmm+M+rKAcxiCQfLUQJVhVEd8pOmJgS40ZHzdWP2bsgallu1F8MuvKpIZipAk6OM7B5Z0NuMaK
	xtEU7DHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viI40-00000004Q53-27Qr;
	Tue, 20 Jan 2026 20:10:56 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viI3x-00000004Q3P-3jEt
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Jan 2026 20:10:55 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-1233bb90317so194132c88.1
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Jan 2026 12:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768939853; x=1769544653; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZqhvQUqHyPjd5YwFiryR+es7m9UdWSAqM9hdcVMAYY=;
        b=eBXyw6BGhFJOiKQMNoYiPTvpHAvjw6CG+uegboHKaypUe208ogdTK19+TWEG9x52Eg
         KSBOF0gowuLcpLPjBkwLKvyOkYNxx0WBDertBEbjkYtndGELkhVZ62iZyMPNp16uyDAM
         WVFB7tNrRdd0EPzNZvWSt+VxGjyLCC5vcjx8VV4F6JIRdEmfEs7ghXxaNMDv3ZHtQ52Y
         ISKBCNzpEZ6JBNrvVsGKk5ysHYA4iVjQsVUo5spkAePVeRj2XgwP1M2DTFcWbrBy/MkJ
         GQQjLk+4Cpp8BmBpatJIGiJRXmfuNdyf9Nu+KqY3nyNAKWH7nHrTKIt33g9gjtVJo2wY
         ayPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768939853; x=1769544653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hZqhvQUqHyPjd5YwFiryR+es7m9UdWSAqM9hdcVMAYY=;
        b=PN9CPQbsbBbL7/qOUSOF1ZKHMWyg/VqlboFv9rGf5ra7rV2wzHLSGFDi0Jhyaia/un
         IVUnWu8K5Ydvq4/1y9/TldvukQ0lT9u6q6OkjU/RVT3/bGcocRoY499d3oVIlNaCHAkc
         nu8GLy0kZR6JXdjE+LEBzANNcmQfKqjSda5z8ly7/kRcDMVGHzUMZpRRjPigR7W0zLlH
         Bsnj0YSxwp/u+bD9iSxswLEY089GfCjaZr7AQS3D+cMjHdQ9jIB1yMsrX77YhJ/hB2J4
         zQ1+i6Ou0gwNJv+G5dZPQEn9G3uUbxE7YoJIqkZZGL1Ap08v5yoHd98K9KZ5I3VA2/nL
         ha+g==
X-Forwarded-Encrypted: i=1; AJvYcCUCHjGtS1SUwH2mCpvCNfJ3xFy2dS1DZTJxJqH/zW7a708ClieZC808Mb506Mf/PzBMgBbR2xSgLJKg6rl7xQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ2ZAXM9Bbgztn90OG5kv4dIN9e4mRORNOJYSLJroyfPGuuBb7
	yyOhUWozUK4elWzyE75XUlHHN4C4ngWLsBp3yrKXwOUSIrl6IyqyUnQb
X-Gm-Gg: AY/fxX6OvFE1ahtaw0mhb0bZVcw1E9mWcpVO+mBfls0Oz1sFcSkyclwKeejzOh8juJP
	i74jyO6S1wyvPWs+470QepnFeQ8lHoaL0SThNCsOBghxiW9fLBGjIkmJQsbKiY4+9VrmMbrkTuw
	ocNyLkOb/YOemrPqRjPYKFyDXbLijHqhNga/FCiKfBO6bgBi2JAIshCiBIwniAvRf5gGsTdat/D
	u44LslrPlUiSPpA7JJIfbBmQ5TRi33n98j/19CphCFXKKUj2uiKb5oqUuwtXXs5bwF1RnoXNfLl
	alZTP5KZxoKIFgfQNDcl/hErsxlN/oeJHovIUQ0BEsVmGxWDnheqUeX6rRUwVsl8kmLkdebIyuY
	jZ2DDYQ/P7D0r6c2ORNeUUy0sS5iEFhWgm9QDHVbfY+hSnKhBLOxmo+wBZbueaE7kEw4UploEZ6
	jmvmFO/3CptmDslTtYQCo5yAZmfviN//msG2uishYHK0i862tbCpguq+eacEpCrg==
X-Received: by 2002:a05:7022:ea30:b0:124:5760:1e18 with SMTP id a92af1059eb24-12457602302mr7361158c88.14.1768939852393;
        Tue, 20 Jan 2026 12:10:52 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:4a3c:9f7c:8037:90c1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad7201fsm21982990c88.7.2026.01.20.12.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 12:10:50 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: sean.wang@kernel.org
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux@frame.work,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	zac@zacbowling.com,
	zbowling@gmail.com
Subject: [PATCH 02/13] wifi: mt76: fix list corruption in mt76_wcid_cleanup
Date: Tue, 20 Jan 2026 12:10:32 -0800
Message-ID: <20260120201043.38225-3-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120201043.38225-1-zac@zacbowling.com>
References: <CAGp9LzrcvW18xKFL-oF3wxRmb73G6PN59Y2NSA2E5idva1wtKg@mail.gmail.com>
 <20260120201043.38225-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_121053_943380_200BDD89 
X-CRM114-Status: GOOD (  10.03  )
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

From: Zac Bowling <zac@zacbowling.com>

mt76_wcid_cleanup() was not removing wcid entries from sta_poll_list
before mt76_reset_device() reinitializes the master list. This leaves
stale pointers in wcid->poll_list, causing list corruption when
mt76_wcid_add_poll() later checks list_empty() and tries to add the
entry back.

The fix adds proper cleanup of poll_list in mt76_wcid_cleanup(),
matching how tx_list is already handled. This is similar to what
mt7996_mac_sta_deinit_link() already does correctly.

Fixes list corruption warnings like:
  list_add corruption. prev->next should be next (ffffffff...)

Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 75772979f438..d0c522909e98 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -1716,6 +1716,16 @@ void mt76_wcid_cleanup(struct mt76_dev *dev, struct mt76_wcid *wcid)
 
 	idr_destroy(&wcid->pktid);
 
+	/* Remove from sta_poll_list to prevent list corruption after reset.
+	 * Without this, mt76_reset_device() reinitializes sta_poll_list but
+	 * leaves wcid->poll_list with stale pointers, causing list corruption
+	 * when mt76_wcid_add_poll() checks list_empty().
+	 */
+	spin_lock_bh(&dev->sta_poll_lock);
+	if (!list_empty(&wcid->poll_list))
+		list_del_init(&wcid->poll_list);
+	spin_unlock_bh(&dev->sta_poll_lock);
+
 	spin_lock_bh(&phy->tx_lock);
 
 	if (!list_empty(&wcid->tx_list))
-- 
2.52.0


