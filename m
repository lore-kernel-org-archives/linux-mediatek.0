Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2D8D19502
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jan 2026 18:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MtP8Go2M3C9++DiSDULRDE+5Pn2l5CFyfesMiTCa6/g=; b=lOiJWKY1hupB0+1dzfsItlVHla
	qXk+kEaTg5TJ7bWVHpwFQ8mQ/StsK2iDbvVik7sjK52PS9MTMwpNhOV/+zO3tGllb42AONI+xhdyR
	ksDJ7Xixwj0gUgLGweRpuioEeuqY3xeo8XRljmUwYHn/GriRLbktL+2mcrKoluEqDBU7tS6ZjpKqn
	RN/j5D0qAG91DdreJInHR9I+i8wPdaLkFtoclkOKfvleG2FfQ+edi4D5oOPgNBJAnmooSeYe/OoeZ
	OKTvoTVwLTu6g4wSA1g5s4QG/LLET7Sg+BKR3iLwdm9CvpecVbUkMlLEnkg0dSEhBRurOqFf2qDle
	Rt/hlyLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQsw-0000000D1hF-3dce;
	Mon, 26 Jan 2026 18:00:22 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQsv-0000000D1gc-0M5N
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Jan 2026 18:00:22 +0000
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7cfd2423793so1739262a34.2
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Jan 2026 10:00:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769450419; x=1770055219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MtP8Go2M3C9++DiSDULRDE+5Pn2l5CFyfesMiTCa6/g=;
        b=rih8VdOZ4sESbZQHE6IlcM4jI8UU5vDPSKtpaQz6AxLsIJN0SHtJcsGiYyhXp4BYOM
         OUdJYsSeLjEx9VaNmmK43EvcYHZHiSszoXSqqu1yBM/qqXLKkF6l/DnTmp+SV3r+ni1S
         Wu0/v0NJvWpUK3Zp2tzojwYBLUwSrmg4DvXUGILw92UYnEJxmOc6bS4fLfHciCemtORR
         sTfrDxUyiz9AQ8zi/S8sw3/81NKnbilJs/AodYDy0J84Jy49L69IA4CbmvaoNoHkfkA+
         N18EazbaSdV97kOWkLtNVQj90qp0lODZwLDSJcBpF39oJDQSp3UvspaJV0YVFiUNkw2P
         E3Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXMIMW6/rmIyPMeD5Z7z+08zeRlk+Wc2hcxdV5/nBPq4PeNzT+onogHKlSHFxGvX/mPpe1XVe3VCxHollO5Iw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwvhKvelMNtqzQZbVu+oNScx72V2vziiVlFn4rPrQLIBNbdlbgE
	n34cRP5FZvoaIGtNgLmNVDmdCBdzTM5ZH3hxFmhH/ZppgR+E3a9lbkTD
X-Gm-Gg: AZuq6aKRrL+ZyDC8bWEfgwyH1JLypvdM3f3E/E6bVaN1XofEbU4cv9izM1NKxc2Kti9
	SZpRhicWvNvclM0DpxhCLXjfapYi7In3EUKpBgyfnJNcj94Cscdnj04g2lpNPDLHPslz8GfTGj0
	yia7FcvSo60aUgTorvxpx9nUyEbom5YNlIOhgk4/ZQAIdsJNv+VEZtNr30Cjx9jrUPHBq1C/0nE
	nmwKSg5hyHVFSQxlw21IaCV0SAr6c5HiGVxcsxjQi62LU9ao4m3eCz953TjZGPUrcXUKM4qmQDs
	QBbKK1h38/7ocvUMnKyZ5cI07TncY9VTqMONX5xi3hVGI9uyxgUbVamyRYMGbPS10c7bLT7iq4x
	YdUtZkvsNlqxRxQBwqCK8D9zScqZipapt6LOoSlXzx/QOnN3bbDQ1Co459W2+J7h2+bGJdEtCfi
	Hw9JS/rdswLNvxy2kLPKN1hvpOj2r1qfWgXbUwJD4bSZEx7MaRtDm9txaAo01rkyejDBifW+wZ7
	Y9EQO6k2Q==
X-Received: by 2002:a05:6830:3143:b0:7c6:d0b2:8eb6 with SMTP id 46e09a7af769-7d1701d7c73mr2647850a34.15.1769450419085;
        Mon, 26 Jan 2026 10:00:19 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.. (65-36-108-159.dyn.grandenetworks.net. [65.36.108.159])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d15b3d31d4sm8173838a34.21.2026.01.26.10.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 10:00:18 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo@kernel.org
Cc: allan.wang@mediatek.com,
	quan.zhou@mediatek.com,
	leon.yen@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7921: fix potential deadlock in mt7921_roc_abort_sync
Date: Mon, 26 Jan 2026 12:00:13 -0600
Message-ID: <20260126180013.8167-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_100021_123980_4CC05DCD 
X-CRM114-Status: GOOD (  10.19  )
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

roc_abort_sync() can deadlock with roc_work(). roc_work() holds
dev->mt76.mutex, while cancel_work_sync() waits for roc_work()
to finish. If the caller already owns the same mutex, both
sides block and no progress is possible.

This deadlock can occur during station removal when
mt76_sta_state() -> mt76_sta_remove() -> mt7921_mac_sta_remove() ->
mt7921_roc_abort_sync() invokes cancel_work_sync() while
roc_work() is still running and holding dev->mt76.mutex.

This avoids the mutex deadlock and preserves exactly-once
work ownership.

Fixes: 352d966126e6 ("wifi: mt76: mt7921: fix a potential association failure upon resuming")
Co-developed-by: Quan Zhou <quan.zhou@mediatek.com>
Signed-off-by: Quan Zhou <quan.zhou@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 05793a786644..ddb81ca6bda0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -371,12 +371,15 @@ void mt7921_roc_abort_sync(struct mt792x_dev *dev)
 {
 	struct mt792x_phy *phy = &dev->phy;
 
+	if (!test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
+		return;
+
 	timer_delete_sync(&phy->roc_timer);
-	cancel_work_sync(&phy->roc_work);
-	if (test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
-		ieee80211_iterate_interfaces(mt76_hw(dev),
-					     IEEE80211_IFACE_ITER_RESUME_ALL,
-					     mt7921_roc_iter, (void *)phy);
+	cancel_work(&phy->roc_work);
+
+	ieee80211_iterate_interfaces(mt76_hw(dev),
+				     IEEE80211_IFACE_ITER_RESUME_ALL,
+				     mt7921_roc_iter, (void *)phy);
 }
 EXPORT_SYMBOL_GPL(mt7921_roc_abort_sync);
 
-- 
2.43.0


