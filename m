Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745A7CD8C92
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2026 12:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=md0oLfExsjhQ5s9zgCStyVmZOOcuKHtb2pCgbVaO+NY=; b=mFaIDYI5OrsvnlAHl7Ja9zUWhx
	yYy7B4yBalY9c0/BWACHKNmW4458FB4zrFQad48WrugQFY0Yn62l+TVEzDhIzaTUpC6QIg1naBeWp
	1MeYTPO025COrlt/r4NGSnA6cGjXXWzWNTayAzWOP+YTeqSKUKlwIBqK1tGA/Oh3qOtCw1eEt7RF0
	Ynp779w//J6StyVwuJ+VtQ017jnBuv+BfptCMrUiZwJexbnxiu2mGFsFUpQ70FAfAZOevJfGWapRs
	KgIeabiqRP+OAOY++dkT2VGJ6Z1fAaso7+KsDbr0dy29olLoufJ6YZtxkq8XO6qGfoe/XdbMuLTdM
	+TGUmF6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvL5-00000005VEs-1gkc;
	Tue, 09 Jun 2026 12:13:51 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvL3-00000005VEB-0UbI
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Jun 2026 12:13:50 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2c0c32f6ce1so36846525ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Jun 2026 05:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781007227; x=1781612027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=md0oLfExsjhQ5s9zgCStyVmZOOcuKHtb2pCgbVaO+NY=;
        b=aXBuRPlWfP5qqTqi9w2+i/+HnIy84dGugLEa6sYEXCseEFij5rbMt26tOYnmk87CU+
         z0YQSfdsWmm+URtI4OOAAV4bxaOJx/8kki3ZczNQKze2ad2EOkNGjfRylA5RYg9OowTP
         HLU2MnNclqJfWHMWEOkl/RFQrbW+htrMPZUE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781007227; x=1781612027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=md0oLfExsjhQ5s9zgCStyVmZOOcuKHtb2pCgbVaO+NY=;
        b=LzfQ3e5z2YF8W6CfYZ+UIGhu7FI45sSPgC8rOgAx/4MZ8hESBoku1MfUkIW6+qypRK
         uuyhC021+aG3SDrPGwDF79KKPSAKtfJOROgj9PmKOkiigJIPsJHRMwZHjCBXwEeeKUgj
         Qk0avcNWV4lH+G0CxmDrjn+nigIP/jjI4nyOVR3lM9FPE9QUwrOn/E4dMf5SGtQQJkew
         jOIFxuLSW3vdE3knds7iKSIiriGKnls+pjX9KAvBEZ6333In6/LBgR6YB28or6Ip2CjL
         jPBySMXsv4MPNI4mupE8CYV//fBnzHCnXo2UAJRa2AQKAW+wmai5b95ZI41RX3aSu0Vw
         f+RQ==
X-Forwarded-Encrypted: i=1; AFNElJ+yF+Y2LP1jUcshFmZAqQlTUCa5N56rOK0qTfB4cvwRHSOanvq6kq0F+u/misj/MHRCy4nQCZP7/U91uyGl3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0+cBpgx7KgzRWD5dUqIvDYjxJzx0xHTEYV7ybvIt+MMfxpLUR
	IZHMLedMVYelZuWD5M1p/maCk85f6RiAgTix7Hodt9peddp1+9Tm8Udugw2ZMAkwNA==
X-Gm-Gg: Acq92OHmrXbk7zNdkAPJj0neGdeaiavbzXac5hy2fa6G+q2JfFQyEZnPm6R6FBaqC2n
	BlQQQGhSG4nFAkpTW9e1KGigLpC/iUc4v3D2Ddd6MERdW6VRMTPHXyRto9CQoP/0IlDlENq9Cuv
	OAhfA1OrBj7t2Q6EGo2qc2H+RwIZ6g+AIUzU/Lp8SYezhQl64SDPRlpYLUQ65rRa6mZZODUe3zs
	dSqekFfFghWQWK2XmxvM8/p4A38GV/4tiELL/+RzB8gZUKCJNFAm3yssUCWljE6Vlme6o6L+jrk
	z+eE7sSKxk+tm+LPtCpsrl2vHfwzkjxtP1y9yVP/oCXZuFx7sFd+NwP1CA1c6EG/tihh3KFHWPz
	5wLo8DuzXQjyYPJnSaZWUMCMKKusEvqKkh8ngFhFIIfGp+Qr1HvHxl9AO9BRv+cjUniCKdujrar
	2Kc3CuW79itQO5jVv/Hxvio5yU1/8rZIWMCvbMX8jMytVsoYDmW5i/5Vo8tTQUzKBTBO+1LLtlN
	7/Qdvthw6VtwlM7mIwiruAz
X-Received: by 2002:a17:903:fad:b0:2b2:ebed:7af5 with SMTP id d9443c01a7336-2c1e7b13addmr221626095ad.13.1781007227564;
        Tue, 09 Jun 2026 05:13:47 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2a00:79e0:2031:6:62ce:f303:81a5:1cce])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm279998175ad.9.2026.06.09.05.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:13:45 -0700 (PDT)
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
Subject: [PATCH] Bluetooth: btmtksdio: fix infinite loop in btmtksdio_txrx_work()
Date: Tue,  9 Jun 2026 21:10:06 +0900
Message-ID: <20260609121329.1262170-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.54.0.1064.gd145956f57-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_051349_448529_808E1771 
X-CRM114-Status: GOOD (  13.12  )
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

Every once in a while we see a hung btmtksdio_flush() task:

 INFO: task kworker/u17:0:189 blocked for more than 122 seconds.
 __cancel_work_timer+0x3f4/0x460
 cancel_work_sync+0x1c/0x2c
 btmtksdio_flush+0x2c/0x40
 hci_dev_open_sync+0x10c4/0x2190
 [..]

It all boils down to incorrect time_is_before_jiffies() usage in
btmtksdio_txrx_work().  The btmtksdio_txrx_work() loop is expected
to be terminated if running for longer than 5*HZ.  However the
timeout check is twisted:  time_is_before_jiffies(old_jiffies + 5*HZ)
evaluates to true when old_jiffies + 5*HZ is in the past i.e. when a
timeout has occurred.  Using OR with time_is_before_jiffies(txrx_timeout)
means that:
- before the 5-second timeout: the condition is `int_status || false`,
  so it loops as long as there are pending interrupts.
- after the 5-second timeout: the condition becomes `int_status || true`,
  which is always true.

When the loop becomes infinite btmtksdio_txrx_work() loop never
terminates and never releases the SDIO host.

Fix loop termination condition to actually enforce a 5*HZ timeout.

Fixes: 26270bc189ea4 ("Bluetooth: btmtksdio: move interrupt service to work")
Cc: stable@vger.kernel.org
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/bluetooth/btmtksdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index 5b0fab7b89b5..c6f80c419e90 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -620,7 +620,7 @@ static void btmtksdio_txrx_work(struct work_struct *work)
 			if (btmtksdio_rx_packet(bdev, rx_size) < 0)
 				bdev->hdev->stat.err_rx++;
 		}
-	} while (int_status || time_is_before_jiffies(txrx_timeout));
+	} while (int_status && time_is_after_jiffies(txrx_timeout));
 
 	/* Enable interrupt */
 	if (bdev->func->irq_handler)
-- 
2.54.0.1064.gd145956f57-goog


