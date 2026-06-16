Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CF2CD98E6
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2026 11:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=on8hqRmuM/Ky2/WGRUWRuZiJutnnNXtBaovb+8l2mm4=; b=Lf1c/Stqtoo9DB9qIb/cYYPqrh
	WetixLwfXGQjNAxihJJecrMzLrQ0R10BYUeJAV2JFW/bqvNY/q83lXus6OUxAIQL7gQQdPKVa419N
	LXZL3dRZ2Izh6mnSkAK1K7YynhEYJutnEbrfvfiwb4Dd+xaISUZnmlgNJUAofWJxjyeukM3cKph8/
	GaVdA+QiIJ8xaRswi4whKIaUvFVkC98zlnOBxK0tGuproI1GXeBT81gVyvwdlomNfAUswt1E+P3xx
	LvpnCyTa+oKerTEQWl3s6gAK+DQWS6yQnecSBVMuxbHJQJrzvVSNOyRmLP8JqPvSHhA0zygTh73Cg
	6KM8PVGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRiz-0000000Ff1c-3yoC;
	Tue, 16 Jun 2026 11:12:57 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRit-0000000FexJ-0RlZ
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Jun 2026 11:12:52 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-84229481d44so2173280b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 04:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781608370; x=1782213170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=on8hqRmuM/Ky2/WGRUWRuZiJutnnNXtBaovb+8l2mm4=;
        b=Rlaa/1SC7V25CJDohuWbBazfpYbE/s3fdSL08wCDveCcFsUwCz/wjP/q8AjyckiQfW
         Yjbzi0O9WfRF7D1tz1CQrudwfPrfe71MSXKed+cFitgLNa6Y1TbJALt6Va+2nT5uuP4h
         og56xydn+kSna3PYQLTX2O/6voNBLoQtLYozY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781608370; x=1782213170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=on8hqRmuM/Ky2/WGRUWRuZiJutnnNXtBaovb+8l2mm4=;
        b=F4M/1lsi6m23QFQM7OURzLfRj8baxGfLKd5nrpNb0U4cTIbp8tPXmwbPb5CQiedf6A
         RU/fkBvdxlxrlk1kXsM7PidXr3GA7onqugekoPmXDkkVk3QYZVW1vyMbmYjo5XX04Yxq
         cfYLxuB6mPPs12plw1xX1okFO94Nny7QtMZJ3olNDYBdiek0GB6GVlQz9R2XnmU5NL3h
         O8l3RayXdQS+suQuhUsMPUkOikHLTqgMraKqtFHXGwF+bkj1PhGvgtX9l9innvnwbiQg
         nkR/XkiuCVD/vpK23J1AnYtzAQ9+oBgzFBbKeizT+5VfnY1kQ+DK3pIWljuXih5x4H82
         alLA==
X-Forwarded-Encrypted: i=1; AFNElJ8Aa3AS8woHMv85rN0cPBOR9IX0hBhi3yhAXBVwXxhZs+8AFgMTUXfsJQ06yNlSBeARC+OWJk7kiaYOnzMocw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUzMMAPXhUq5clrT4ISZtAKWrsfxdL7t/O2wC/ve9OWZHT+gBa
	Wigu5nBXtIuJPuvj8k3hTpcCA1UHxCWh00WqkPxiAUtxjuG0g5L6RCWXfGdnIm/ljQ==
X-Gm-Gg: Acq92OGmC3Cw+51KE3M9IVvxfwYaWQBeeLxsOvFpUY9KUlwmCkSraYueJVCz1oBz8Pg
	4UUgvPSSGNVikj6kF0cUCAz7GPm3NxjUfd71iPNFdiF7so22DoZ7Zs4hRuaZVs8yfA2UC2Jb89G
	Xnnol+kiLP0zCJ+UIBBMY2sj2Onki6L0HwY5WEOyjl8bxoHIIBcHgY0Q7wPQQMff42OEnsr8tbV
	Xl6NWT/vBKMsgQa9zxhCZS7qeNNj3jMw3hIwJ0Zr3GrxCtI9atQ2j5bqUGqe4oBLJ0792/FPv8h
	T5gaXTUsRQD/uf4QsGyH3PAJCspoYBX4X1lI+sf0CrrenJVVtrbuTZnlmdPBnP66EgbFzUE3Rzz
	6RPgiKkrY2IX515zQe6Z4GPcsLf1Rsy5mW3ioeWNgEjTrWax70J8J5K0K6jwg0JdO8qZbT43jx6
	w4zHNzq9i843BxBYrTvkis5lBqxZE1H0IysbBPZ81zBd2db7LVCDokh0/hgxqig8xPH0rmrgsXL
	LOncKKoQpot
X-Received: by 2002:a05:6a00:9285:b0:82f:abc8:ae0 with SMTP id d2e1a72fcca58-844e19879d5mr16162588b3a.17.1781608370193;
        Tue, 16 Jun 2026 04:12:50 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2a00:79e0:2031:6:a0b:fabb:5b62:b85b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b05921bsm12906321b3a.59.2026.06.16.04.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 04:12:49 -0700 (PDT)
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
Subject: [PATCH v2 1/3] Bluetooth: btmtksdio: correct btmtksdio_txrx_work() loop timeout check
Date: Tue, 16 Jun 2026 20:12:06 +0900
Message-ID: <20260616111224.152140-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
In-Reply-To: <20260616111224.152140-1-senozhatsky@chromium.org>
References: <20260616111224.152140-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_041251_161086_C2737089 
X-CRM114-Status: GOOD (  12.76  )
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

The btmtksdio_txrx_work() loop is expected to be terminated if running
for longer than 5*HZ.  However the timeout check is reversed:
time_is_before_jiffies(old_jiffies + 5*HZ) evaluates to true when
old_jiffies + 5*HZ is in the past i.e. when a timeout has occurred.
Using OR with time_is_before_jiffies(txrx_timeout) means that:
- before the 5-second timeout: the condition is `int_status || false`,
  so it loops as long as there are pending interrupts.
- after the 5-second timeout: the condition becomes `int_status || true`,
  which is always true.

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
2.54.0.1136.gdb2ca164c4-goog


