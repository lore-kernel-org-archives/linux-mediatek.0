Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B36CD98E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2026 11:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yx01qzHYL7zapV7JT7OmgAtxcHhwEqISMkYtU1aw3M4=; b=hRm7Kr6OiJt4eADseMofnDMhxQ
	MfYUwNCGe5+oznxD7OoYjc5moAa7PY1ja3th51mYtdPF2trOH4f1BcXiNJ7ui5w8KvdJMvUbgbozM
	GID0fa77VLLHe/8lIw3A6jvTTPqh3PlXKtOBWlQlMd2/DlhdnS3wQeh+rR6G3kuQo89E0L3Y5I2if
	DEL9HPWrKFDE54b7Iz42ARRS8+PZulL8Q34CyUR3KBAV83F1g8ZLSaWAYfNPVeI5UxdPAElfSyqxA
	XXAa3iw5ENAe2c2HynVD5U7A1lMk+IuBexCccuWcSuHNlKq3aqG46yR43p7+zIeWji+KzzcXsTsTD
	RMmQb4UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRj0-0000000Ff1u-15X8;
	Tue, 16 Jun 2026 11:12:58 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRiv-0000000FeyA-1k0x
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Jun 2026 11:12:55 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-842264dde84so2747952b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 04:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781608372; x=1782213172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yx01qzHYL7zapV7JT7OmgAtxcHhwEqISMkYtU1aw3M4=;
        b=AMGRRILt5Mo1rOcSpnf35SAzSATzfD9Q7TNg0piiAySVdjzdOFQjrVyPFruQJQfiC0
         bZ+b3JL9QlvEbjKJn04SYdXGqd74A3En51ts68WHjN+CiB60LlvLym/QwLwRTI5C+Ddu
         KDdB9BJI1ux3Y3AHN4f2xlS9knWIToubLSWAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781608372; x=1782213172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yx01qzHYL7zapV7JT7OmgAtxcHhwEqISMkYtU1aw3M4=;
        b=pDHRuGxNUt6AfNiJ45gwLwMmAiPYkBMvRjSz9K4JN+em9ISxSAXXOqT87u67bqjnET
         TQ9Pk8iako5r9YWdiTfZeY+5IV0Qb6kMOfsD5rQtAAY7RgbHqLtEm5W3f5hi9DlTyRqH
         4JXvuE7QnClmzmMf9JhDwQsYlIHlDPaqtFbuUAfE6HZQeS46wk1GlEcuu4sxTBKChBts
         OcXjqYAZUIO0ZVlB/1mdlrjfCEF/zT5+tmPJIiFBNjaQfxFcaiRyumo9KMCm40xaW3lw
         v/ok9iyd9ajWhHGIlKo/YSSK8hc9T7mRSbGTknVHzHECJPGSvnFgI6CkGaMM0KV2LvX9
         DZMg==
X-Forwarded-Encrypted: i=1; AFNElJ9IwkEd0FkNsQvAi/tA5cIGe/YuGBaxWTOddj67lNNOVMmSMlOkGwCEVE/mCcQJrRceVx6n7jHVwBaDiO0VRg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAUsH8wPBXEnCVGJsp2E9C7TBzL9c+EcykNKNCMfX0HY92iNY3
	Tqco8MuRH/oKyD+4Hn08ald+c0DTq5GezBxsExuMi7i0qKSCWcQINiOtuAzQOJIwWw==
X-Gm-Gg: Acq92OHuklUSJPUMd+nbHGppKEloXTO+flBQqseP4bLDQKeGgdokZmX+DKHQVXend3f
	FUoL5Xsbwamds9ATpbTP/88wcAt6i38maKV7cDFGGFwmUwCRMYwvD9G0zeqSgT4QiAAJ4l7gVfT
	FcQa9a5dv2q6H5QGNBt/v2kMuy7Zsbg32NCJBHB3Z25yyu6Czl0WzbFESIsXdf4eFWyjUcpk2vJ
	ow9GmwqzLZaSnu0N1DhlegHy0cJGf7f9/jk8plXfObA8W/CE56vXVqCf56J2rlvMEDDGKKCQ/9y
	U+Op2t+BOK6GFu7SgfSo2lMZa6jcoBtPYJl37oJ5aI+SkcIy5Ug0y++S1i8ymo4EgR1foBI4gnl
	zrMl3S3nFjiLJJGKujlJabGv4oJEUOMXUsuJV/493Pf5zjfWJz5hzKOsM7ga7xdHw07Tji65r+/
	qyg+hixNQayP7QoXfwBvuThF6yDhsardWOb2tLSSCEG0GjBBUa49xvDfEZczTi2LqEV4oidUGbo
	kBS7/+wlKFR
X-Received: by 2002:a05:6a00:6f55:b0:842:6344:f33a with SMTP id d2e1a72fcca58-84513e1747fmr2470656b3a.3.1781608372537;
        Tue, 16 Jun 2026 04:12:52 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2a00:79e0:2031:6:a0b:fabb:5b62:b85b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b05921bsm12906321b3a.59.2026.06.16.04.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 04:12:52 -0700 (PDT)
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
Subject: [PATCH v2 2/3] Bluetooth: btmtksdio: test for bug IO errors in btmtksdio_txrx_work()
Date: Tue, 16 Jun 2026 20:12:07 +0900
Message-ID: <20260616111224.152140-3-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
In-Reply-To: <20260616111224.152140-1-senozhatsky@chromium.org>
References: <20260616111224.152140-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_041253_487975_3BF4029A 
X-CRM114-Status: GOOD (  10.63  )
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

btmtksdio_txrx_work() loop termination condition checks for
int_status being non-zero, however, this evaluates to true
even when sdio_readl() encounters BUS I/O error (in which
case int_status is 0xffffffff).  Break out of the loop if
sdio_readl() errors out.

Fixes: 26270bc189ea4 ("Bluetooth: btmtksdio: move interrupt service to work")
Cc: stable@vger.kernel.org
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/bluetooth/btmtksdio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index c6f80c419e90..d8c8d2857527 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -574,7 +574,9 @@ static void btmtksdio_txrx_work(struct work_struct *work)
 	txrx_timeout = jiffies + 5 * HZ;
 
 	do {
-		int_status = sdio_readl(bdev->func, MTK_REG_CHISR, NULL);
+		int_status = sdio_readl(bdev->func, MTK_REG_CHISR, &err);
+		if (err < 0 || int_status == 0xffffffff)
+			break;
 
 		/* Ack an interrupt as soon as possible before any operation on
 		 * hardware.
-- 
2.54.0.1136.gdb2ca164c4-goog


