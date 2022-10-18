Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C11FC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 05:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4G7tl3tu203DyVK2JSTYCp8XTOzlUsDNSnxbzKDtrDc=; b=r1R7/VLIK2O2U7lJpaDGcJS7Tx
	W3ZZwTs+mNUmNqsBZOb4SgPtxutQdQLii4WuWMZyrg2oNh85jkwdQeAHhEZ59uAdIrffILWAlAIJb
	GiCvOqTezt3GNJUcDim2rANtAYEyklvx8wTQyIAQGwgcJQWJctoRjlN+lbp0txwHU9Fn2+76Fufay
	LhXEmOQTqre9D+vB2+1xchIVlTwmAXPoqJQu7sngUA0ocUKo/L/kzuIpGBMb4XLeIFi+1hqE7meCT
	IONWton0uca+6mI/2dw/dyNAy/x32a2hAmy+nq0pLo8ikdkPAeLa1qL//7CJ6jdvVKweUAWJ5OFNg
	KZci+bRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okfPx-002tN2-Eb; Tue, 18 Oct 2022 05:45:33 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okfM6-002qRf-N7; Tue, 18 Oct 2022 05:41:35 +0000
Received: by mail-pl1-x630.google.com with SMTP id b2so12825527plc.7;
        Mon, 17 Oct 2022 22:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4G7tl3tu203DyVK2JSTYCp8XTOzlUsDNSnxbzKDtrDc=;
        b=DY8rsTzt3XFTA3ilefLgkcsB8eFjSt+06weMni51hOasFmIa7Jotx4YgXvtmEAbbDx
         UPbF2b01JU/WPhhYVVgi7BdTUOk0oJ5LlzsyQb6967vDVgogm+zZwTUawXfemy0JCcSU
         2jplFegk3aDg4yURx0rzogEtqpYN2xZh/8kYwB297rEnsQzASNl19AuUJiDFQ9svKcub
         rAcoQ++Y1eKWirRU5LruBEIcYZLfwu6zso0C7oogfa/o/vGd4cr05NBVUL2Jsg8mOI9i
         MncnVg6O8Uj4+AqllFDOgKhdPwVIH09TmVo2O62iPN7KoLh4EGoQUb0hXT7aPtibgcCt
         CZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4G7tl3tu203DyVK2JSTYCp8XTOzlUsDNSnxbzKDtrDc=;
        b=geIe+qKJTqcCU1CSP690IjjB0IlJREzze8B7AgingFW3NVRm3shqsbPlG7ippPfRlL
         KeW0D+z8nGpwmctWWBYx9ZXW+oUHbds0jgJL55MxZ+i3XwKp0SlwGEwLHuVtP3oY5idi
         vzvRVM2Ae/Kiq70YjiH7A1jZxl7e1jdpzcKZ2DkRbpFQGmi6Og3tR+d5OvYhQRRFsWWl
         7FOC5MErRoYgTLLczN4+UXkigpt9lAuDGehMO/wY6EF7uumyDeXhoFnTuC284YgN0gMh
         H073aQyfCvxJ/zV/+kqpzqrNV02iAmQbf3jHmGvdcaG4ACWOIWYqrmwYLKkMICbgfncP
         v5rw==
X-Gm-Message-State: ACrzQf2twRKfzO5t6iq6QFWDEq2pQRyMYFhaRKi1Gofph2avUUrjhgRA
	2hjZPwFPnRmRhB5XcXbOGVZ54Wk5dTtFGQ==
X-Google-Smtp-Source: AMsMyM5aCgV2chNKlAxGvAIPaU6HYil84zewpav+AIFvUMP05smKopj/ebnWwPFQRHb0YwRVY+VLQw==
X-Received: by 2002:a17:90b:4f4e:b0:20d:9f5b:abbf with SMTP id pj14-20020a17090b4f4e00b0020d9f5babbfmr1748885pjb.148.1666071694222;
        Mon, 17 Oct 2022 22:41:34 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:f7bc:1bb5:e0b1:92cb])
        by smtp.gmail.com with ESMTPSA id z7-20020a1709027e8700b00172f4835f53sm7597435pla.192.2022.10.17.22.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 22:41:33 -0700 (PDT)
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
Subject: [PATCH v3 10/10] gpiolib: of: add a quirk for reset line polarity for Himax LCDs
Date: Mon, 17 Oct 2022 22:41:11 -0700
Message-Id: <20221011-gpiolib-quirks-v3-10-eae9cc2ed0a1@gmail.com>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
In-Reply-To: <20221011-gpiolib-quirks-v3-0-eae9cc2ed0a1@gmail.com>
References: <20221011-gpiolib-quirks-v3-0-eae9cc2ed0a1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_224134_773462_E7A9E19A 
X-CRM114-Status: GOOD (  15.21  )
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

Existing DTS that use legacy (non-standard) property name for the reset
line "gpios-reset" also specify incorrect polarity (0 which maps to
"active high"). Add a quirk to force polarity to "active low" so that
once driver is converted to gpiod API that pays attention to line
polarity it will work properly.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index c2a55ffb2b20..52616848a37c 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -152,11 +152,47 @@ static void of_gpio_quirk_polarity(const struct device_node *np,
 	}
 }
 
+/*
+ * This quirk does static polarity overrides in cases where existing
+ * DTS specified incorrect polarity.
+ */
+static void of_gpio_try_fixup_polarity(const struct device_node *np,
+				       const char *propname,
+				       enum of_gpio_flags *flags)
+{
+	static const struct {
+		const char *compatible;
+		const char *propname;
+		bool active_high;
+	} gpios[] = {
+#if !IS_ENABLED(CONFIG_LCD_HX8357)
+		/*
+		 * Himax LCD controllers used incorrectly named
+		 * "gpios-reset" property and also specified wrong
+		 * polarity.
+		 */
+		{ "himax,hx8357",	"gpios-reset",	false },
+		{ "himax,hx8369",	"gpios-reset",	false },
+#endif
+	};
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(gpios); i++) {
+		if (of_device_is_compatible(np, gpios[i].compatible) &&
+		    !strcmp(propname, gpios[i].propname)) {
+			of_gpio_quirk_polarity(np, gpios[i].active_high, flags);
+			break;
+		}
+	}
+}
+
 static void of_gpio_flags_quirks(const struct device_node *np,
 				 const char *propname,
 				 enum of_gpio_flags *flags,
 				 int index)
 {
+	of_gpio_try_fixup_polarity(np, propname, flags);
+
 	/*
 	 * Some GPIO fixed regulator quirks.
 	 * Note that active low is the default.

-- 
b4 0.11.0-dev-5166b

