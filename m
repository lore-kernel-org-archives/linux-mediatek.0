Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E3AD5B87D
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Dec 2025 01:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9Lj81YOSEfulTeNkBJglpZnxAwznIMi5NkA9Ofeq2Hc=; b=Rsmh7ka/wGalQC81QMOEBqzrEb
	JDfQWn5c53duXDVXvUo4e/yaVjeDQVc4ZuaVtK6rIglh7/fa7sxSpxvHNjLvz36tKX9CWkn4gyxxp
	6QlR6S0ZvUbAJflwRvFJmSi+udqCb4T8QeDZ3aDK/jPxmentyAKBBOxk+eggDAJbVHHAQX8BBE+gX
	ZH8uCYF2S3VIpPt+VZj+r7/IygdvFieP8ftBL3Xu1N8MSODpLPWYjqcGuNrOnpqx9joz9U2+6KRR1
	KaBx6DyhwzrxuBa+0VTx0gniFdT4SOS/gLMkhjzNDpQrED49ShhR7jmjL5GstTwIb44zqp8JlEnvh
	idEb/y6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVK1e-00000004VIu-2TqX;
	Tue, 16 Dec 2025 01:38:54 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVK1c-00000004VIT-2egx
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Dec 2025 01:38:53 +0000
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7c7aee74dceso1686413a34.2
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Dec 2025 17:38:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765849131; x=1766453931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Lj81YOSEfulTeNkBJglpZnxAwznIMi5NkA9Ofeq2Hc=;
        b=sDXhd8yd+FMQ2xnQJcr0RmhloQwZVfsy8eK6PIbyxAfnUKo2DUUkV0ToW6/zN9zS5H
         IeA+fC33mpzKFU0wsq/MQltB1A4QU2+5iOCI1X4W7/Z22+IovLC867lH0PhTFxj3AT5k
         WdF6IuCZIF7RaQjy7BIwCjDmCo2WeHnmNFMMEpjFulXd2kV2nM60cfyBWTnNnC8OGWfR
         +wyFgrr3mZ3hEs9U60XhxQK1MPoACehJrdlsLEPnd/iNy0jbjWNvgxm6E9Kdj6GpUUVh
         5xaP4NFusc9bjuLLYSfB+M9oPnm5vnRa7EOEh2CtnNXvXgBNFtxRlQUZdcdmMBtLonU+
         6pQA==
X-Forwarded-Encrypted: i=1; AJvYcCUej0Gkvq0tnpQQorJnz8Xf1gFmNf96mnO1xRB9bE1CTv8i5iYZNsIqNYv2iwgUPDhPaYVrkVy2jkD2bP0jqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCpMYeERBsXZHainis7wd5lRnMpV9U1P5mGIIkHk9MZLd2TN4A
	qFOVHpAtONC5JXx0gt2RxfrIZOxopGfx+g8Ohxul4iF9xvk5wYtzirYsvclBiA==
X-Gm-Gg: AY/fxX6xqVcsRwzbAtB0fMfyn6fsn74gs4tnnfRMIvfVTj9P6Xzb619lmBIYO2bCfiW
	Fx8Wft4VMVxfvVk0h+euoPalCC54D7xXzfbSjp/SdHpK4Y1BFyU1RDP80zY8fItSoEG4peQvb/u
	5viDANAQE3CGRjYl0Cc8g9GYFrRimJTwn3PIn7TR2qKHx9Ne5Gn0Faab+s9w+UvRZnNxsldvQ4U
	zEKNzMj0/axvgzBuwEMvqRHdeBc+qHrz+4BekLQJBnOUPxFuifIE0fdrBQcG0PK4isQQaW4N/+S
	Vc9Pgd/+Vm4NZ9eBOZn+z+p9Q4Vg8ca8gLehr89gbaEA7PoQvq7yC6t1sATT5R1U8skhTjl9ukO
	kYJzLnMkhXoZTReA0IJ8lsJKyxMsTsEHdez8LoN9sJQ+nOGYAOYJsYhDJiDyJlpAffiDQ1iwy5w
	zz8IKAjTBeIbx9JJnZBIaMF+B+/4E5opkHhK68UyAJxMmktA==
X-Google-Smtp-Source: AGHT+IG+YBuaqZS//xUlJYuIXroK6xy+Si9MeuUheCN9NI9oRVBHDenS8dshqBPVtG5aDNNVk/sgRA==
X-Received: by 2002:a05:6830:4487:b0:7c7:565c:4ce0 with SMTP id 46e09a7af769-7cae82e9a30mr6041699a34.1.1765849131449;
        Mon, 15 Dec 2025 17:38:51 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cadb34577dsm10574104a34.30.2025.12.15.17.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 17:38:51 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@kernel.org
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: fix potential deadlock in mt7925_roc_abort_sync
Date: Mon, 15 Dec 2025 19:38:49 -0600
Message-ID: <20251216013849.17976-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_173852_695417_B9C63402 
X-CRM114-Status: UNSURE (   9.10  )
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

roc_abort_sync() can deadlock with roc_work(). roc_work() holds
dev->mt76.mutex, while cancel_work_sync() waits for roc_work()
to finish. If the caller already owns the same mutex, both
sides block and no progress is possible.

This deadlock can occur during station removal when
mt76_sta_state() -> mt76_sta_remove() ->
mt7925_mac_sta_remove_link() -> mt7925_mac_link_sta_remove() ->
mt7925_roc_abort_sync() invokes cancel_work_sync() while
roc_work() is still running and holding dev->mt76.mutex.

This avoids the mutex deadlock and preserves exactly-once
work ownership.

Fixes: 45064d19fd3a ("wifi: mt76: mt7925: fix a potential association failure upon resuming")
Co-developed-by: Quan Zhou <quan.zhou@mediatek.com>
Signed-off-by: Quan Zhou <quan.zhou@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index ac3d485a2f78..11f551dea2f1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -449,12 +449,16 @@ void mt7925_roc_abort_sync(struct mt792x_dev *dev)
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
-					     mt7925_roc_iter, (void *)phy);
+
+	cancel_work(&phy->roc_work);
+
+	ieee80211_iterate_interfaces(mt76_hw(dev),
+				     IEEE80211_IFACE_ITER_RESUME_ALL,
+				     mt7925_roc_iter, (void *)phy);
 }
 EXPORT_SYMBOL_GPL(mt7925_roc_abort_sync);
 
-- 
2.43.0


