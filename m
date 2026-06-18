Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1189BCD98F6
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2026 03:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WUiLNGPqh5xoaR1mbDbB7mwDPFmDNybYuGD8IeVqIGM=; b=FaoT2fRwEjSkysd+JY2UblWhDN
	62cW33KbIcrxvIoUzWKVejKGLswI+SIdSaQQsBdlVeKs909duoCbVhJmtdisuyI9edE/cU+wnRIG8
	vNFm9lHnJNhsSrzAPJDWr9MzO5C1Kg4XJdvQgwQ/jHNcuDTNiKQqv9CouEXkigMFVYFxufQLXPE6H
	gu8yO9mBRqnUfwsqdkDWAca3M5vqtJfwyxFY3x7UwBGC4YOgEceaZtiPkijL7pVlThooLbkBX0qkA
	qJ/tBn/vwV9qUS7+7DIeWQxHW8wcmqhhVFpgxkYSXsvf60zvQ+0a2mj1ZAIjFNTIPSQNgQulJa52a
	sQ6HoP/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa3CW-00000000YMg-1KWq;
	Thu, 18 Jun 2026 03:13:56 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa3CR-00000000YJv-40QN
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jun 2026 03:13:53 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-84540eb70b2so73520b3a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 20:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781752431; x=1782357231; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUiLNGPqh5xoaR1mbDbB7mwDPFmDNybYuGD8IeVqIGM=;
        b=hi1df22Gd9mIiUa2wYGUmmTRDTkbL1BPmtp+aH2oyLzhpm+JPC4OtbaZzeKMU7RaEC
         qjEi2fI8u2RJpBHvX4JaKTpr8AOi//op8WFDeCet6USyCP1OuvtE0ASvhMjDPzCJppqt
         +5Mb7liVFQ6s/xlcw97uAJbuZxKgi2N40Tzqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781752431; x=1782357231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WUiLNGPqh5xoaR1mbDbB7mwDPFmDNybYuGD8IeVqIGM=;
        b=hA2jhI/QPV3UnkALLNJYe2YqM42CfmkTFFY57m82SP+mqz1qnKjHQv03b7Pbfn8RQw
         n7IRitLV6uxDCPu/eEu0qbDFAPonZJ3WgPB9ttM7LnotG5wy2yNkykX+z548EGKXS7ia
         5EdeWwS50zhZ+ENERycI+/d6ckSjQwxdoROzqpy53mHKdulPhFLlTja++eG7HV7kZLOI
         oae6sdEF5ATnk0tMnX0nIe6tiCiBcNDOrMjFH3/RH4fVqMNDsSHVT+CSeE/Y09fPNRNl
         d2Dt0m1yBLgITU1BTME8NRCeVhq8TgBGFt+l7J96+GAFesj587oylE1i8yuSHVuI4xtG
         LsFA==
X-Forwarded-Encrypted: i=1; AFNElJ8dxcwdKAboI2bmONDRNHf84Qx7DRU64rIecHX00+yasM66ssBAdH6oGMOqXIvqhPf8yD6FVBFaWlB7ZcKt8Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHmHpBDgdh6YOzp4aTsYuPISESTEpgOBN4ugAjlO6DaEWO760Q
	GPhpcXdSOgZSk0hXdwPIdwJbgb2xtXJhi0tMGdI1cGNX9tgSZjasDYGlSaYDEL10rQ==
X-Gm-Gg: AfdE7cn4m5EIGpgF2PmRW9SUsTeeAMPLwW4Fbu/KUjYhnn+gI2fVtEBXBgvo3+C+pin
	g5oe4rfId6wJy1bRPqtWpwfCpA4idIbe/6XZqeT8HCHbVqGq2FBcVqjNwhUT4IpRXKjEyWW/vn2
	EliKeb00gw1I/ZChfZU7csveRZZfk1n/F2RGO7oh7Bu1JCqTAv72D7hzfVfHRIveRvtTwaVnjwM
	zaYu9RNv3h7YjS26YBVdPNqbla0rmZhlwVl8B5l77q0FuIVGijwOf4srLr+Qa84y+GyPJVOs78b
	nnfGR+m4Qs8E7AWEuFsEbujNn5geFPp5RdXf8LqV+O1j4fhT/ooxIFxV6pZEk/miZIluOyI7Nb1
	5ZW1slsPdVHxhaK9cmWwKumHunW8YvV/lhet/iYkHq+EIvLsrTKePKcAjEbQAGUxYr8qPfwCPtE
	tVzYZhi6NVlBhrxx9qItwjgmLnVNeAtY+kTHf0Tzab6oH+6SN2vCB7dc2qUsqMolExckEnQgfqs
	lY=
X-Received: by 2002:a05:6a00:10cf:b0:842:708f:39be with SMTP id d2e1a72fcca58-84541991b98mr590884b3a.5.1781752431077;
        Wed, 17 Jun 2026 20:13:51 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2a00:79e0:2031:6:20ef:efdb:f2c9:836f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b046911sm17548232b3a.53.2026.06.17.20.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 20:13:50 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Tomasz Figa <tfiga@chromium.org>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCH v4 2/2] Bluetooth: btmtksdio: call cancel_work_sync() out of host lock scope
Date: Thu, 18 Jun 2026 12:13:22 +0900
Message-ID: <20260618031338.1011410-3-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.54.0.1189.g8c84645362-goog
In-Reply-To: <20260618031338.1011410-1-senozhatsky@chromium.org>
References: <20260618031338.1011410-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_201351_997237_FE5CC874 
X-CRM114-Status: GOOD (  10.53  )
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

CPU0                            CPU1
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
2.54.0.1189.g8c84645362-goog


