Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5897AC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 17:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BX6I3wxmmC2re4tlQ7azHaY51bTZUH4nJgPdj4ITZq8=; b=mUIW6RmeIE0rLc1NTko6eeuqKI
	cS9AoldNTzdFwFnJuoDorf2px59XVE9Pw+T9FlodK42jD7UVgLCqH7lHmSpIeSkUjWXM2tdq9t8sN
	PcEJyc/FAZXrlZu3/pUnlhYAADQBj0O93JGbc7YMIXWzfWfddWaRpQ2X6ei6c+HW5PTEGCSTg9oy/
	RhIG6SKqZ+CNUyGv0xyziEom4Q8KKaFJr+xNmyAWgXOwxcmw3DlKSY/hl5WsyMKFEfUvkUz7BhRYu
	VzLGwXDeKQs+istPWYDm7bPPAABMrD0kf0gKi3ST9PxmkONWvyiLPZSWQ2bJv3E+cLtwIVJGvIiMU
	3ZoEg7RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojOua-00FXbC-CR; Fri, 14 Oct 2022 17:55:56 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojOtV-00FX1z-7d; Fri, 14 Oct 2022 17:54:50 +0000
Received: by mail-pj1-x102d.google.com with SMTP id o17-20020a17090aac1100b0020d98b0c0f4so7203448pjq.4;
        Fri, 14 Oct 2022 10:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BX6I3wxmmC2re4tlQ7azHaY51bTZUH4nJgPdj4ITZq8=;
        b=cyugA0yHJUN3qAYBEX22+gvLsKzT0Qskj8CNA+ZBQPAmGtgf7tK+Sy7JA8OTpXVWB9
         YXCtr/IhxkTKGg6wXcjDhbXvGxTbLTOZI43n2iC2HOissspE74cppc0sruSR9JwaR+Vz
         Eoc1W/ULVDcc5A7omUhw68ovv7kBCrPWVoPjH4eiFFybdVWKDgTTp/IqST7suQo+y58g
         MeR1NqyDiYNodnBCHIGpogo+vlERi25f/glW2sbIkJC+RsL+O6Dc0JqqixOttVYHuVzn
         hPVgOV7m0N/1sNNDaKuOtKopFleKiT9qgs1E45fHsq6jbfTzWqe69zPvrCMo/fl4TqzN
         DbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BX6I3wxmmC2re4tlQ7azHaY51bTZUH4nJgPdj4ITZq8=;
        b=XlV9jcbqu8xSrki55kZLkyn7rSjbowrgDpu0/9oSPauWV/k/v1zFJRqDRRi4C1bMyz
         MnnAW4eaY3t1K7GRsSx6YN9QbNrArNg0Ek9Lcl7pCjQ/4bnsLi2UU+Q9W3Hcw02aT7oq
         eALuY5K5K3zxxCnhKb4qfUEckXYNZ7vKjX27/2TZGHjuhtVTVyGqpVA8DTNYvVn+wBWs
         P4PTDV/otAEEL9db7tQzLvOfwWR5F0rbRyswtKPXjTJSo81tyEKcZ2oqWL6SwBftG3/O
         aYxADIMLPl0FBID2z83mnym4nIxHOJ9qo9fbiIqzoUCwZzbqJ6vaqvPUz3gwQuYZP6Xz
         7ZfQ==
X-Gm-Message-State: ACrzQf1j4ExGzp//9LMv5u7CVelCqRjj+9JnpH32GqdTLeVcKvJFJzTY
	DSyfLWtQhNvivu3l+8O4aGc=
X-Google-Smtp-Source: AMsMyM6HJMSW8eaOV/L8mdLS4/siuzIHXjCFIiLCzS5TaBfYxq818U8i5HSUDm/flCBDm5MDoy8urA==
X-Received: by 2002:a17:90a:4311:b0:20b:e232:5920 with SMTP id q17-20020a17090a431100b0020be2325920mr7199880pjg.190.1665770086268;
        Fri, 14 Oct 2022 10:54:46 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:da06:5604:594f:f6af])
        by smtp.gmail.com with ESMTPSA id jj19-20020a170903049300b0017f7819732dsm2011780plb.77.2022.10.14.10.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 10:54:45 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 5/9] gpiolib: of: add a quirk for reset line for Marvell NFC controller
Date: Fri, 14 Oct 2022 10:54:29 -0700
Message-Id: <20221011-gpiolib-quirks-v2-5-73cb7176fd94@gmail.com>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
In-Reply-To: <20221011-gpiolib-quirks-v2-0-73cb7176fd94@gmail.com>
References: <20221011-gpiolib-quirks-v2-0-73cb7176fd94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_105449_294959_1B407BFA 
X-CRM114-Status: GOOD (  10.81  )
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
index 2b5d1b3095c7..5c11ee7638d1 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -390,6 +390,16 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
 #if IS_ENABLED(CONFIG_MFD_ARIZONA)
 		{ "wlf,reset",	NULL,		NULL },
 #endif
+
+#if IS_ENABLED(CONFIG_NFC_MRVL_I2C)
+		{ "reset",	"reset-n-io",	"marvell,nfc-i2c" },
+#endif
+#if IS_ENABLED(CONFIG_NFC_MRVL_SPI)
+		{ "reset",	"reset-n-io",	"marvell,nfc-spi" },
+#endif
+#if IS_ENABLED(CONFIG_NFC_MRVL_UART)
+		{ "reset",	"reset-n-io",	"marvell,nfc-uart" },
+#endif
 #if !IS_ENABLED(CONFIG_PCI_LANTIQ)
 		/* MIPS Lantiq PCI */
 		{ "reset",	"gpios-reset",	"lantiq,pci-xway" },

-- 
b4 0.11.0-dev-5166b

