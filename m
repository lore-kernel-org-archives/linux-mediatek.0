Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AB6CD98EE
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 06:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OjucF5goefZfuxikv7tCuZJMVpoPtgqO36vnpR26lfo=; b=zsxHh65CyptEn2IPVIk4kdsuHU
	p5hky450QZY2+6uwgsFA48kMrzuirN3k9O0uKkqnGFJKFfxOpm4OzIOnMU1f+joB2EzB2BL/cHoEE
	Qdtv3FcEPuGu67E5ktxJvx0RLB36cZgMEx63a397B0mMvHqZ7NZ8ZZHZdmriyFxRqfy8ATHZlTzFH
	c1Z2w6qyPUk+V6H3vB36dkE+Iaesta9SK+oZBbdNMJAzpcnfbJP4J/mdK5lHtTN1MTHnznun6PAqV
	JTE24gBStqn9ByiHSfKQv930XDIG00ehe7bahWzqA5hL/+kAUw15dXHTZDoS6FOa09/TDeAK0UAcx
	5YGDBD5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZk2E-0000000GjbI-0DDt;
	Wed, 17 Jun 2026 06:46:02 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZk2B-0000000GjYF-1OSH
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 06:46:00 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-36b8d414666so3277397a91.3
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 23:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781678758; x=1782283558; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjucF5goefZfuxikv7tCuZJMVpoPtgqO36vnpR26lfo=;
        b=GFrwR0CCeA7jfl1KqWtM3wbMAHY97KOuPCkGKkuaTSGkld5jUCe6DShEGeXcWu/UbR
         2p0QJsc15Bwjm4vwruqWmCcOHVNFO7gPDJrkDaLyGa+6eFIyOVn35fVraC1frOw2867y
         NTw/kNtLqUNh4L1X9eO146Fb0JBmRcHKIN8Ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781678758; x=1782283558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OjucF5goefZfuxikv7tCuZJMVpoPtgqO36vnpR26lfo=;
        b=dZ4qAhFJmgheNImRpX8jbth7CX3QMRrMH6HkEv6lCGW9uZICmNp3yyKFraNm4pvMct
         bM3eQgVhjlL3fbDUXXqfoZzHs+AJc3as9KinZuukmeGy/Xo3OBKVmq10Q2payds9QL/y
         Du+EcFaKC/Z2Hhu6wUxz0wmiPuqZe/7JNY5EGMzOB0Qhn6Sg/8niFI+WMX2HWw5vT2YN
         +qcEngMfLN7dK1EGef3oSRwup3wHC5ww0/lvx1h9IBYklp3KHyoA6wYH5g9R586yhGIs
         ZBQAPl0AVJ5qjz0kVTVVunqBZ6in698E9coEW4x4/gk6Pew6lyrzgtFaorPGxQHmUJm5
         KD5Q==
X-Forwarded-Encrypted: i=1; AFNElJ9B3IoQI+moPkHIS1dmVX84FRG2bZikMjFJMGbTcuJTnWqX3MpKIrKdrILozEU2aY3XUE2y3xqVrz3wbNBKmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzIcBVVpwIknSFyZ9afvidxcHMuoatpvgD+jdRTxH7teaGl6D8P
	YnoCdTW+gd1fJ5xe/qQD6J91svSY/Qvry3BHW1iLfO1tU1shqbz2gmern2p9hUbdQw==
X-Gm-Gg: AfdE7cljAStTPfgV0D+JSAmwIgD13fkdN6Rfjoy26rKsc23GyvUnMi82HY+c2dqP2D3
	bpPVZlQqMntqbOZvQieNl8ve80/FCuL34xWEOsBTc8fwhprcO0MQGL7Lxu+A7w6JwGgR0mbcPcq
	kj/YXz1h6X5LOaBUnG8m+xWz0HkVX3sQJgncbEX9nMb/647f+v9VgkX/3UiYshLEKQWOidPYZPg
	DlktSFuFZnGFJ0ZzpiHdxaDfQJ1hH9/MTAKzivxjdnSatpUa+jlvBHwDm29Intlku/w/14Ar+w0
	JBx/VNKXbqQVkEbWRKtFBEIPRyIg9gVM90CskUpo5bVbUX6cUG6Hf1kJZGIDMzt3rmuF8uRI251
	D40ffbTIf7gp7qxU0KffVym7VsxXhdmKwaqEZ7MDTI7GUY9tjXsjbb9rOlmIcq2TaBGDsAs3Z2+
	bzbZHIgwTTO3W2ME2TjK54xq0vrbsnU60h7EL25PnaJaEHvD9UOPJZ0a/Vyj6nYrZjlEzMnbR6+
	oLZ6YuubPnU+w==
X-Received: by 2002:a17:903:1b4d:b0:2c6:9358:3ad5 with SMTP id d9443c01a7336-2c6bc20f6d4mr26872555ad.17.1781678758360;
        Tue, 16 Jun 2026 23:45:58 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2a00:79e0:2031:6:20ef:efdb:f2c9:836f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6af931f19sm24365675ad.74.2026.06.16.23.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 23:45:57 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Mark-yw Chen <mark-yw.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Tomasz Figa <tfiga@chromium.org>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/2] Bluetooth: btmtksdio: call cancel_work_sync() outside of host lock scope
Date: Wed, 17 Jun 2026 15:45:32 +0900
Message-ID: <20260617064543.574704-3-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
In-Reply-To: <20260617064543.574704-1-senozhatsky@chromium.org>
References: <20260617064543.574704-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_234559_370863_4A813654 
X-CRM114-Status: GOOD (  10.67  )
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

cancel_work_sync() should be called outside of host lock scope
in order to avoid circular locking scenario:

CPU0					CPU1
					close()/reset()
					sdio_claim_host()
txrx_work
  sdio_claim_host() // sleeps
					cancel_work_sync() // sleeps

In addition, when txrx_work() runs concurrently with close()/reset()
it better not to re-enable interrupts by testing for BTMTKSDIO_FUNC_ENABLED
and not BTMTKSDIO_HW_RESET_ACTIVE before C_INT_EN_SET write.  However,
btmtksdio_close() clears the BTMTKSDIO_FUNC_ENABLED too late (after
cancel_work_sync() call).  Move BTMTKSDIO_FUNC_ENABLED bit-clear earlier
so that txrx_work can see concurrent close().

Fixes: 26270bc189ea4 ("Bluetooth: btmtksdio: move interrupt service to work")
Cc: stable@vger.kernel.org
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/bluetooth/btmtksdio.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index d8c8d2857527..207d04cc2282 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -625,7 +625,9 @@ static void btmtksdio_txrx_work(struct work_struct *work)
 	} while (int_status && time_is_after_jiffies(txrx_timeout));
 
 	/* Enable interrupt */
-	if (bdev->func->irq_handler)
+	if (bdev->func->irq_handler &&
+	    test_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state) &&
+	    !test_bit(BTMTKSDIO_HW_RESET_ACTIVE, &bdev->tx_state))
 		sdio_writel(bdev->func, C_INT_EN_SET, MTK_REG_CHLPCR, NULL);
 
 	sdio_release_host(bdev->func);
@@ -741,6 +743,8 @@ static int btmtksdio_close(struct hci_dev *hdev)
 	if (!test_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state))
 		return 0;
 
+	clear_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state);
+
 	sdio_claim_host(bdev->func);
 
 	/* Disable interrupt */
@@ -748,11 +752,12 @@ static int btmtksdio_close(struct hci_dev *hdev)
 
 	sdio_release_irq(bdev->func);
 
+	sdio_release_host(bdev->func);
 	cancel_work_sync(&bdev->txrx_work);
+	sdio_claim_host(bdev->func);
 
 	btmtksdio_fw_pmctrl(bdev);
 
-	clear_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state);
 	sdio_disable_func(bdev->func);
 
 	sdio_release_host(bdev->func);
@@ -1295,7 +1300,10 @@ static void btmtksdio_reset(struct hci_dev *hdev)
 
 	sdio_writel(bdev->func, C_INT_EN_CLR, MTK_REG_CHLPCR, NULL);
 	skb_queue_purge(&bdev->txq);
+
+	sdio_release_host(bdev->func);
 	cancel_work_sync(&bdev->txrx_work);
+	sdio_claim_host(bdev->func);
 
 	gpiod_set_value_cansleep(bdev->reset, 1);
 	msleep(100);
-- 
2.54.0.1136.gdb2ca164c4-goog


