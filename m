Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55C7C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 05:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8DMgKUA1ndW99FtkgK7fFtqDLzR447NcQVyF5tYxkvo=; b=wtZbjNw1Dilx8Y07Lh0bW9vyk0
	UJehPElTk6tX+DQnmGg6e4bKlWpeOgnF0RupWpcbunXDUJhgwdrJR6Dh4IAkJls9i3bgTXr6LOzxG
	cirifKsIIXGnBdyhsd066ehujcbsJ4hCBWbKiG8a4ZBH48ea+I+G/1ytcUzgIpNFaySkW8wm8aPK8
	Idj8gkw0JXBAE6kdVIaTt/8Tig8AdBvh20fQvaqfZRSoFUdWMMLjK5yt7XMPCazb3QHXz8LGoHaxY
	lYMEhb1fCK5XarRmWEjY81mdyg1uBZaHI/t1rIRQ201K6Fy0fKtMkcw8u7BT+t0DR/m97xX5oY4Zv
	XwzeQinQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okfN9-002r4L-7h; Tue, 18 Oct 2022 05:42:39 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okfLx-002qU4-Qz; Tue, 18 Oct 2022 05:41:27 +0000
Received: by mail-pl1-x630.google.com with SMTP id c24so12815841pls.9;
        Mon, 17 Oct 2022 22:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DMgKUA1ndW99FtkgK7fFtqDLzR447NcQVyF5tYxkvo=;
        b=Mlfgrqkvj70vbejMKTCGMp9GJ3gaaUYU2AlqRY+VhyqGg6D1JLN0HUd/z3p1RhbjYA
         qKTm6/8A7q0//QibXBHZ/htlvYzCq4TaldEc4XHw7CViZCvb8xbfGIIkQTFt648ancWP
         ApQ5j5FmpBzZ/HcXdZigRmLted9Ydib9kYLTdgTYfiaHLXEGhlUpp0Zvfhj85HfaSJii
         GRlbrM+XZHKiQUgHKBrwMovQuWt7uncd3+kDmAn6fJgoyUD/k6I/GLLP8z6YuKkj13zS
         LNrkr2xF/J1ZwPe06l0GZlJGBysiHgLQvDhLFXZ3o1wUoFXpaYhGJaV2wykb62sZnjyv
         4+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8DMgKUA1ndW99FtkgK7fFtqDLzR447NcQVyF5tYxkvo=;
        b=1kfnlHS2QV+KVxEX33wRLmxbfrcfEEpvv9Kf2JIHfNEtozV3BulU7zS7GYrCGK8s3v
         Q5UgQWVd1NibiYLPnP1sLuSzNPxvy4VF8BUoFKCESaAEGSHx1QfT6VIFV3dFjut/yxBh
         8PlYaG7kYnISnriMNfmSxbLkwy5hioTYwRlQsj4ychEYUzFXlU9NOV0Zs2gjWj72XqLE
         Nf33I5V+e35/g5apNZ/ZJ0IImm7JKmONQFLkZoJgaQwaItoyrK0UcJIIl7KkyzzXYKCK
         lCOWajUonGXBM3B1P/96uQ8zgCofuYlATShuVjM9ZiBBjPePvdIOQDo+VX/yrnZXOPp1
         d+mA==
X-Gm-Message-State: ACrzQf3qqyu9/u9oXpWjmQ9Ic4CA9+eyiR3+m+JR+RczI6B2URNteft9
	LAxZiHhHSTJCXtHQBIuOYnU=
X-Google-Smtp-Source: AMsMyM4APqjmpfE8dbaBzrp0RzRGgW+hybGoL45HKLrtC/NaYxPDQ1SgvY67ey1Va7pYiWzVz1nvvg==
X-Received: by 2002:a17:90b:4c04:b0:20d:4ef6:aacc with SMTP id na4-20020a17090b4c0400b0020d4ef6aaccmr37879621pjb.199.1666071685218;
        Mon, 17 Oct 2022 22:41:25 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:f7bc:1bb5:e0b1:92cb])
        by smtp.gmail.com with ESMTPSA id z7-20020a1709027e8700b00172f4835f53sm7597435pla.192.2022.10.17.22.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 22:41:24 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 05/10] gpiolib: of: add a quirk for reset line for Marvell NFC controller
Date: Mon, 17 Oct 2022 22:41:06 -0700
Message-Id: <20221011-gpiolib-quirks-v3-5-eae9cc2ed0a1@gmail.com>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
In-Reply-To: <20221011-gpiolib-quirks-v3-0-eae9cc2ed0a1@gmail.com>
References: <20221011-gpiolib-quirks-v3-0-eae9cc2ed0a1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_224125_894592_7E5F969F 
X-CRM114-Status: GOOD (  11.16  )
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

The controller is using non-standard "reset-n-io" name for its reset
gpio property, whereas gpiod API expects "<name>-gpios". Add a quirk
so that gpiod API will still work on unmodified DTSes.

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 2b5d1b3095c7..a9cedc39a245 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -390,6 +390,16 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
 #if IS_ENABLED(CONFIG_MFD_ARIZONA)
 		{ "wlf,reset",	NULL,		NULL },
 #endif
+#if IS_ENABLED(CONFIG_NFC_MRVL_I2C)
+		{ "reset",	"reset-n-io",	"marvell,nfc-i2c" },
+#endif
+#if IS_ENABLED(CONFIG_NFC_MRVL_SPI)
+		{ "reset",	"reset-n-io",	"marvell,nfc-spi" },
+#endif
+#if IS_ENABLED(CONFIG_NFC_MRVL_UART)
+		{ "reset",	"reset-n-io",	"marvell,nfc-uart" },
+		{ "reset",	"reset-n-io",	"mrvl,nfc-uart" },
+#endif
 #if !IS_ENABLED(CONFIG_PCI_LANTIQ)
 		/* MIPS Lantiq PCI */
 		{ "reset",	"gpios-reset",	"lantiq,pci-xway" },

-- 
b4 0.11.0-dev-5166b

