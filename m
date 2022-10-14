Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305AEC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 17:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YV6Nxa393Zempvv48DGSX3qqsS8tBZ+cvvfhAdg2hN8=; b=qFfnrr4ZM+pD57Yn7GPPMe6sxp
	jVb3cJ5w+tVMDwO7O/QrZ8Me9ntzqhbypEECjNK6GTLkUm/3htB19vNteWmm6SQkQZLB6fj8vNbYr
	DoGeol0luLSMQ9iVmMSAGmR7eY7PnL3tW5ra2b+FkuMxYaouGwGnRPZSjOD6eVX5gWf70E2FbJSyb
	FLioO0EtX1yf/xkROBy05zykAOV3DcG1OXH8DfWC892EGM9cXVO2p/GGzbAnEW/wBoWXDvAqNOezl
	oQWj98c2msc1KRegTLv0QOcIWRdt8HcYbGQ/OyTAehU60/JMSJ4hZg30zFFdF7aski5Rljg9v1PKw
	d8O+ByZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojOuD-00FXOC-4o; Fri, 14 Oct 2022 17:55:33 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojOtR-00FWzL-6N; Fri, 14 Oct 2022 17:54:47 +0000
Received: by mail-pl1-x62a.google.com with SMTP id l1so5396410pld.13;
        Fri, 14 Oct 2022 10:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YV6Nxa393Zempvv48DGSX3qqsS8tBZ+cvvfhAdg2hN8=;
        b=hwC+mpYbil+uUfrrGEvi6q5Oh8PUE3JdtPxYi+K/8CTb842BUQ8RKXbwcPRmk6LcLE
         06fqPcitEvEnh1os3P0z6agizAe9Deq4xAZ30T2wH647kIPkjh5I44n16FDPadB1H1rD
         w5MaAbTRkAi8LbHFtGq/8NUJl4plyS2YhyMaVepHko7xDpJljO6CyjzDS73F4tHyDCUL
         Lq6XZJGEC0IKVDNqAfBksg8iZwwj8AI4F9UehOCtO3lNFWrbxthPLbiknRH9Fq+wwsXQ
         QK4GxMso3gnnhY9NLG/v9bnDG+eqNEHjut2fJPEVCvczUSc/EcJsFwVGCzV8RFhgpD4e
         6NCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YV6Nxa393Zempvv48DGSX3qqsS8tBZ+cvvfhAdg2hN8=;
        b=U6aVCHat/v/NC87/mWsWzDoT6Yb1YjQYARvwAmLsDWRTZWzk+7nyHyhiScCFahAWF8
         Kg+K53k8KzjZSGG6S9hszNA5AWNnZr+pi7NbD9hqPJfg7fACffKukS2jXYkhRLVOVI/Z
         jq60hOdSeX9v3lMQOyM0r1uUwRvoguBMaHmLGQ+84pkYCHnYpCfs0TQWz4dB9qaQqbUF
         nBgcySQuocsvi9oi5RybSSof2hgXjSLZUIhxSZlkVm67XunYxVfCo+mjPA4ng0uvMA4I
         jeZiGdtUT7Q7QiG1qnQXmnyduOtHEn26pxsJEL+pjH17wBCho7rczBTvDqhv4REO5Wd+
         qd1g==
X-Gm-Message-State: ACrzQf3zNKupWlx4x4IQiN9QszmS0GaomQQ1Qpa5G/VIK9DiXkYU3gHW
	KsdS9zyRuiayJzUDA4OuP8M=
X-Google-Smtp-Source: AMsMyM4UJN/MfIJhz+fb45nTKPD8eMsnAGrApUkaCX+Tmu1QtkZTx79R7xkFMxVviLuT0TKQANgcvQ==
X-Received: by 2002:a17:902:ec81:b0:185:3cea:6326 with SMTP id x1-20020a170902ec8100b001853cea6326mr6596411plg.24.1665770084657;
        Fri, 14 Oct 2022 10:54:44 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:da06:5604:594f:f6af])
        by smtp.gmail.com with ESMTPSA id jj19-20020a170903049300b0017f7819732dsm2011780plb.77.2022.10.14.10.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 10:54:44 -0700 (PDT)
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
Subject: [PATCH v2 4/9] gpiolib: of: add quirk for locating reset lines with legacy bindings
Date: Fri, 14 Oct 2022 10:54:28 -0700
Message-Id: <20221011-gpiolib-quirks-v2-4-73cb7176fd94@gmail.com>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
In-Reply-To: <20221011-gpiolib-quirks-v2-0-73cb7176fd94@gmail.com>
References: <20221011-gpiolib-quirks-v2-0-73cb7176fd94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_105445_301337_397832F6 
X-CRM114-Status: GOOD (  10.43  )
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

Some legacy mappings used "gpio[s]-reset" instead of "reset-gpios",
add a quirk so that gpiod API will still work on unmodified DTSes.

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 7d4bbf6484bc..2b5d1b3095c7 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -382,9 +382,18 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
 		 */
 		const char *compatible;
 	} gpios[] = {
+#if !IS_ENABLED(CONFIG_LCD_HX8357)
+		/* Himax LCD controllers used "gpios-reset" */
+		{ "reset",	"gpios-reset",	"himax,hx8357" },
+		{ "reset",	"gpios-reset",	"himax,hx8369" },
+#endif
 #if IS_ENABLED(CONFIG_MFD_ARIZONA)
 		{ "wlf,reset",	NULL,		NULL },
 #endif
+#if !IS_ENABLED(CONFIG_PCI_LANTIQ)
+		/* MIPS Lantiq PCI */
+		{ "reset",	"gpios-reset",	"lantiq,pci-xway" },
+#endif
 
 		/*
 		 * Some regulator bindings happened before we managed to
@@ -399,6 +408,13 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
 		{ "wlf,ldo2ena", NULL,		NULL }, /* WM8994 */
 #endif
 
+#if IS_ENABLED(CONFIG_SND_SOC_TLV320AIC3X)
+		{ "reset",	"gpio-reset",	"ti,tlv320aic3x" },
+		{ "reset",	"gpio-reset",	"ti,tlv320aic33" },
+		{ "reset",	"gpio-reset",	"ti,tlv320aic3007" },
+		{ "reset",	"gpio-reset",	"ti,tlv320aic3104" },
+		{ "reset",	"gpio-reset",	"ti,tlv320aic3106" },
+#endif
 #if IS_ENABLED(CONFIG_SPI_GPIO)
 		/*
 		 * The SPI GPIO bindings happened before we managed to

-- 
b4 0.11.0-dev-5166b

