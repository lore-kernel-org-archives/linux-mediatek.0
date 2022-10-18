Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2118C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 05:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wp1cBpWUY30jjN2J7CcGdlUhYOxMYiDZ9klcTi4agnU=; b=boXrE31xd8tcVm7Z72XBCBkpdc
	+OgqB73QrZTEjYm/Sz4hLiEHXGadcGr+SsJCXBZroy1dqZpptGinHqZ0CG3s1DVsY96cKqhk3iNVF
	5bQj7xM7sNmdQ5LwUpYA/ayhbRT/CNhpYVu8YSgWPyHRipvKG6GlPBxhTnS4XRENBAV4O6qw8DrVn
	X7y9aBgopV3Ywh62U6DM0Xf0Qb/rs21ibRGKAgUH1MBFOQ2p0xKXX2OFsFvPOE5ZOkG88pBOO7Mck
	1y00pY/+78S1Vzj2vA1ue94g43QoR3a534ZOww6ZI4EKUe09kOLkue64Cq2MJWqX4+FhVG7HUPzPa
	AjPxpaSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okfOc-002sFG-0u; Tue, 18 Oct 2022 05:44:10 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okfM1-002qVr-F6; Tue, 18 Oct 2022 05:41:30 +0000
Received: by mail-pl1-x630.google.com with SMTP id f23so12826177plr.6;
        Mon, 17 Oct 2022 22:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wp1cBpWUY30jjN2J7CcGdlUhYOxMYiDZ9klcTi4agnU=;
        b=ee8rh4QG2mAL7Ri/3NtGm/AHCynx43fRJ5aRgRJR/rvsR5wTw4Tw04fE+heq/NH2gx
         /NCfeGqVp/p+aj2pS+E4ujKOQDA/DuV1KoEDSx48yWFOBP4lWUBkErwbCzXplrX/Fscq
         WLqvn0iEEYZRmuu1zbIs9qhbKBpA1xS6lu+PpOaNnOuwBQ7/GzH6Lb+xk0jPVWMZDiZ3
         iyZ9K+RNP185XOSck/dWYS+W7gQAdVcUXzK0PbXoNrQU9H7iuxQ0ulYD7NNfHkkaMeMI
         jF6tjXA6BCcJcasknRWtW5KPX6IPeyTYUerhW0kq9hSLwOfAPo+YqXXr/x5w79zKhVfV
         NURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wp1cBpWUY30jjN2J7CcGdlUhYOxMYiDZ9klcTi4agnU=;
        b=alMaw5wDN32LFmCnvRuko3/4oZH33C+YylmS7e23tlvhLaMR8ncKqET6P8CDr4an0P
         tQpKXCRUGl9j9cUhH4Q5PZeYqOCVN158cv3Ob7/ssFPk2CkCaRpzZC/GYveUOtJrJ5Jq
         e/zehwPz9kHI3X/DiAu9eohwdM05/lrfGYbOv4+FEZAzEbfxOdrkE6poqRyi7toEkD/o
         +B07bns+6oZfwcTPL3N8aIGlRqM3LABvAcMqDLxtowoopOsd0z6yGExuBoTHO8Ru6ysh
         bkBsuaXvi3vxiQOz9zqtTc5r3ObXU/MMQtilZyumTWIaahZC8eKWtGRwuPJX/RVvknvH
         GnaA==
X-Gm-Message-State: ACrzQf0RXehxMRE6QYbSNJFiynHi7wxRkpKH6qsvWL6xcpK656VOITsA
	L3RZSBl0kSrv8nKjn6QWR1KUSxtwe/g2kg==
X-Google-Smtp-Source: AMsMyM72OZc8jyvkubedFterjeulwVvYQX/Vfc+Prm+hEtd0voYoAJr9Lpg4D227RLB7V7esYmNEag==
X-Received: by 2002:a17:90b:1e0b:b0:20d:7ddf:9b08 with SMTP id pg11-20020a17090b1e0b00b0020d7ddf9b08mr1665378pjb.187.1666071688833;
        Mon, 17 Oct 2022 22:41:28 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:f7bc:1bb5:e0b1:92cb])
        by smtp.gmail.com with ESMTPSA id z7-20020a1709027e8700b00172f4835f53sm7597435pla.192.2022.10.17.22.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 22:41:28 -0700 (PDT)
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
Subject: [PATCH v3 07/10] gpiolib: of: add a quirk for legacy names in MOXA ART RTC
Date: Mon, 17 Oct 2022 22:41:08 -0700
Message-Id: <20221011-gpiolib-quirks-v3-7-eae9cc2ed0a1@gmail.com>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
In-Reply-To: <20221011-gpiolib-quirks-v3-0-eae9cc2ed0a1@gmail.com>
References: <20221011-gpiolib-quirks-v3-0-eae9cc2ed0a1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_224129_525313_588EE234 
X-CRM114-Status: GOOD (  11.29  )
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

The driver is using non-standard "gpio-rtc-data", "gpio-rtc-sclk", and
"gpio-rtc-reset" names for properties describing its gpios. In
preparation to converting to the standard naming ("rtc-*-gpios") and
switching the driver to gpiod API add a quirk to gpiolib to keep
compatibility with existing DTSes.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index ffdbac2eeaa6..d22498c72a67 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -390,6 +390,11 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
 #if IS_ENABLED(CONFIG_MFD_ARIZONA)
 		{ "wlf,reset",	NULL,		NULL },
 #endif
+#if IS_ENABLED(CONFIG_RTC_DRV_MOXART)
+		{ "rtc-data",	"gpio-rtc-data",	"moxa,moxart-rtc" },
+		{ "rtc-sclk",	"gpio-rtc-sclk",	"moxa,moxart-rtc" },
+		{ "rtc-reset",	"gpio-rtc-reset",	"moxa,moxart-rtc" },
+#endif
 #if IS_ENABLED(CONFIG_NFC_MRVL_I2C)
 		{ "reset",	"reset-n-io",	"marvell,nfc-i2c" },
 #endif

-- 
b4 0.11.0-dev-5166b

