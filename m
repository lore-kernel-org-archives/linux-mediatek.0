Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A83D2629E
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jan 2026 20:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S4eJ97Uk/V3oa3o11cK676DDz0RecUq4tSnmFW3bFfU=; b=A+hQA6g2Ne+NGDOCyDGhFD5+GL
	dEe+HSnQUdaUrfHj0fVMQ8RAurBxowvwO0+s5JbsiAlWy8JOK/1HmfINXmQkPuJPHeTR+FRX+vjZr
	yJMCf/kqH0y01Q1NOT97ojxLygMSsU7F80eeeJZe4rAZt8zms7zjscdQ0W9Nx9O0Qgt8Kc8WtZITh
	1thdaKMyf90p+IeiFE9n2R/yOEaAESddG0nU1vmp1M1cNJBd3e2CMb+YVxXTJe7AyDZYqkYoss4r3
	RhlR6zWIMTcL3JWMga+92sfDmV8uhy4BpNxv4S2N8FcGhF2U/NySbUHsh6ibmihx0OBggDqWQtSqS
	kZ+lXI8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viI3x-00000004Q3Q-14sz;
	Tue, 20 Jan 2026 20:10:53 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viI3u-00000004Q2V-2ku5
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Jan 2026 20:10:51 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-12336f33098so4746359c88.0
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Jan 2026 12:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768939849; x=1769544649; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4eJ97Uk/V3oa3o11cK676DDz0RecUq4tSnmFW3bFfU=;
        b=lBXU7CXytwBWapTK+Ja4DeTbOUkUc76+0T9d6OPtvkTZN2RQDOqfvdMz5TtfKXjuap
         msvv6p2n4hGva0aEVBXX0t/g+ymMJIQVhniOSoK74xxcL6Z9fpoIJG1qIoGlC2gPgFVB
         Gza4zckXTIeOTp0WBK8oyvdl8inqWsUqGW6BW7P+uZ8YXDhMMPJrWQRnX7VCAM7EkPJg
         34rCyHbNVQGB0OJKlvuKH1XNnlbOknAi5C8JmGQ99yptjd8hLPNjqwWq0eAggKfp7bXO
         bD6n0WbTFslfk8qIAh5+AoQThl3Zye0rxJn3XRwbFI+KtA6FLe6nEz1bgegcziWwcdRg
         h0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768939849; x=1769544649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S4eJ97Uk/V3oa3o11cK676DDz0RecUq4tSnmFW3bFfU=;
        b=YrRCFWlgLMLn3ypD2MRZJu1z3lKFpl6MYNtV0273L63YUQdgSNOHVd8nubNTHO4mpC
         YamxR/4ijRvj/HtLRvtAjkfDCOOreCASrCqvM+PYmMzBzqXMhb55vLqYVrr4M3elO7Ly
         AMVnS7QBAcExDl0W+wXVlW5ofFQt72yY4eMr0I+Pd4XsIfSNpYzoPBnNtKBIBtr+KOZa
         qaapwCTONESXd5g7BDm3qBYUI869s17XCSfl/KaZdsxPXzUnpchQUOl8dlSdFjX6B7G+
         m2P13OoP9BhdnMkIAB5FHmTBOYcxm2OuHmqD2kykQNrdtFjaI6/83sZs88krBZXi/o4V
         hF5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVyVY8K/ERJ0oQF4qEe8SlaB13NRU3dmKc5r26dpQxkln6eg0aelaCVpdeuxT/CeuAeL9Fe+Qgkw95fuGqwfg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHvrcsH0oG3puH/Il5O1hGWlEsflMza/CQIR05hHSUaer7eloL
	vwBERCW5TQTR1ubNseUl8Lb6PnR5+SC4SZG8UX1CFQg5VmV27DZn1X9r
X-Gm-Gg: AY/fxX6rY0uhzo371QgfO8FxxgbszLtsWc1XcLtTmIyl4KSY4tDTZ96I/gvDNQ+qUBe
	VdBkf8tJxHYJ6SvkX6OeWJ41M6D0OQskJQWDJ//8AT1N9l2Xc7Q01AbZRcO1/KliCpUAeOxoIUC
	lzBi0zWM+yPZ6pgJWj1MC775fz90vq9nrQqoWWTOjVzDra7PYEC3lKRmEbcrUo2LEv5yyzfX5i5
	0kock/dR38JqjUG5sCe4LfeujkGrOm76y7gsn+gKdQnTXoOmn3hNQgzVKY+VVenj/M8db0lIuCE
	PGRHO1itraiD7SlH6hQ4zlR8obI3eKKCcfgHB6EKFimrlxfiopfM+X6y01rGZSUcmaVCzlqmY51
	a6OrX+HX2OeR2V0MhY/k7gD8LfnM8bPY5J2+D7UXsMngCuwLQ2TfYqwpSG3ILGDFPwvs+eRdYHf
	m8CpwNBkHyizarTx1mxGFKj4aUftufLVrZqQ/nBVsn/oGJ+6TS/RNhRhfgMfzbNQ==
X-Received: by 2002:a05:7022:1289:b0:11a:51a8:eca with SMTP id a92af1059eb24-1244b32e446mr9126176c88.18.1768939849233;
        Tue, 20 Jan 2026 12:10:49 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:4a3c:9f7c:8037:90c1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad7201fsm21982990c88.7.2026.01.20.12.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 12:10:46 -0800 (PST)
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
	zbowling@gmail.com,
	Quan Zhou <quan.zhou@mediatek.com>
Subject: [PATCH 01/13] wifi: mt76: mt7925: fix potential deadlock in mt7925_roc_abort_sync
Date: Tue, 20 Jan 2026 12:10:31 -0800
Message-ID: <20260120201043.38225-2-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120201043.38225-1-zac@zacbowling.com>
References: <CAGp9LzrcvW18xKFL-oF3wxRmb73G6PN59Y2NSA2E5idva1wtKg@mail.gmail.com>
 <20260120201043.38225-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_121050_696465_465D22B2 
X-CRM114-Status: UNSURE (   9.88  )
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
index 2d358a96640c..05990455ee7d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -457,12 +457,16 @@ void mt7925_roc_abort_sync(struct mt792x_dev *dev)
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
2.52.0


