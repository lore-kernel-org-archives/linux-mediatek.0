Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5C3C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 22:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZwnaXCxUHw/pDFGM82u7rAsDp6VoYC273VUZqkeLBvA=; b=oNGexE5t4FkGdEK6m/tU6zfqs2
	wlZHLCMjV+Ve4E8xntH+W/YpdrEXVfqVtRPHz+1TFRxPbcw247O/m0yJ2iRYu/NtlkmVEWdSdhXVG
	ecwDHJk9+6uUHgrynU5kT8Vv8tkR7MoqrNZj7W1WJw1+HqO5YO1JniQCILNHDpr44BKtw9Wvm5BM+
	EufM5CondIjaN2RfXbzHqqwJpdeWdqCJeWgtSesyY9FUR7C4K3rz/ikqbwgENsGtdGpG89ehdv3BY
	t+CTNU+wU5ivsA7AOqyDwniK69zkJkuzzd3A6lkvuRnTrMOec5UZw1gs59viWrz5O4X5x0xqjBOVG
	fcHqWLJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiNbZ-0060V5-Vb; Tue, 11 Oct 2022 22:20:05 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiNbF-0060LL-Q9; Tue, 11 Oct 2022 22:19:47 +0000
Received: by mail-pl1-x632.google.com with SMTP id c24so14514682pls.9;
        Tue, 11 Oct 2022 15:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZwnaXCxUHw/pDFGM82u7rAsDp6VoYC273VUZqkeLBvA=;
        b=JqiV2UsuEvzkU3JGSCFbS7pqYjkpSPMJtXpHwIAYCTLBflCoLy5Bgwe/LLzpTe1oou
         iGKUUo7edg3rs028AofuMh6Inia6fDJjjBzpt7ZEAgCyTFt5Z2G1cUk4UD4+cPQUMKcy
         CCgfumGrjzcSRwElNYDQuCR+f7HvJCG8oC8Uuv2R+hdLLYsZGJQxwLjv5MDcoSRbBuC5
         IVSdC65ngzuHLeiMVqdVLbt2ETY0GzMlmPho1fOFgW35LpC2o55Fas55vH22g9uTQyMc
         g9U1ifp573wWd5TBGGQFQk6aITak1nPDESWfe2lIK/EcdSHalTsKV2KIhHhDVdRrlI0x
         pj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZwnaXCxUHw/pDFGM82u7rAsDp6VoYC273VUZqkeLBvA=;
        b=KwOzJNBIqS+xUR9+wesIR6V00Kb5lQFliXDIXZ/osDr9THrEPbH9RrM58ErbrCNBpa
         vPi9Zcwuo8g120FkoBrSUfGzq1HxrQOGTCDNIEW/ut2Lp7HqjtowuOeemFingB9G31w6
         vTNH2B6aikDRkzdHAw/aR9+NF6XxrN0hVNDYKPHSWfeHJOCQwlAPzF1EyfbnWl8LCopm
         mA6hLinNAbN1ENY6r/1RMVg4gCUWKaYHZAlDRkdyD2y2RHKj1zV76ceFr14TRVZdsrH2
         tWHnMLfQJBAmJxe69UKie+TIEsmybb/ToKMcFnRInOpUqqnFkDdzblajVsAwqVZRIBdO
         Gb/A==
X-Gm-Message-State: ACrzQf3ezrzEuv/QNrEl7uZbWBF4h1Xw/06C7ioEYkJ1n8kOzQn17Bx8
	pDWCVcfy7yXNryU2zZHzHo/0UNoVrXQ=
X-Google-Smtp-Source: AMsMyM6CBhzwUNnE45hKHUnLSlf6DbALwhzI18cG3CaCg7Kl/0eFPEfjbq96yDq7vJQPYCC2vkLVqQ==
X-Received: by 2002:a17:902:70c4:b0:178:54cf:d397 with SMTP id l4-20020a17090270c400b0017854cfd397mr25533511plt.24.1665526782811;
        Tue, 11 Oct 2022 15:19:42 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:becc:db10:eb45:dc35])
        by smtp.gmail.com with ESMTPSA id l6-20020a17090ab70600b0020d39ffe987sm60151pjr.50.2022.10.11.15.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 15:19:42 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH 2/7] gpiolib: of: consolidate simple renames into a single quirk
Date: Tue, 11 Oct 2022 15:19:30 -0700
Message-Id: <20221011-gpiolib-quirks-v1-2-e01d9d3e7b29@gmail.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com>
References: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_151945_873057_1630FE9A 
X-CRM114-Status: GOOD (  21.55  )
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

This consolidates all quirks doing simple renames (either allowing
suffix-less names or trivial renames, when index changes are not
required) into a single quirk.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 176 +++++++++++++++++-----------------------------
 1 file changed, 64 insertions(+), 112 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index cef4f6634125..619aae0c5476 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -365,127 +365,83 @@ struct gpio_desc *gpiod_get_from_of_node(const struct device_node *node,
 }
 EXPORT_SYMBOL_GPL(gpiod_get_from_of_node);
 
-/*
- * The SPI GPIO bindings happened before we managed to establish that GPIO
- * properties should be named "foo-gpios" so we have this special kludge for
- * them.
- */
-static struct gpio_desc *of_find_spi_gpio(struct device_node *np,
-					  const char *con_id,
-					  unsigned int idx,
-					  enum of_gpio_flags *of_flags)
-{
-	char prop_name[32]; /* 32 is max size of property name */
-
-	/*
-	 * Hopefully the compiler stubs the rest of the function if this
-	 * is false.
-	 */
-	if (!IS_ENABLED(CONFIG_SPI_MASTER))
-		return ERR_PTR(-ENOENT);
-
-	/* Allow this specifically for "spi-gpio" devices */
-	if (!of_device_is_compatible(np, "spi-gpio") || !con_id)
-		return ERR_PTR(-ENOENT);
-
-	/* Will be "gpio-sck", "gpio-mosi" or "gpio-miso" */
-	snprintf(prop_name, sizeof(prop_name), "%s-%s", "gpio", con_id);
-
-	return of_get_named_gpiod_flags(np, prop_name, idx, of_flags);
-}
-
-/*
- * The old Freescale bindings use simply "gpios" as name for the chip select
- * lines rather than "cs-gpios" like all other SPI hardware. Account for this
- * with a special quirk.
- */
-static struct gpio_desc *of_find_spi_cs_gpio(struct device_node *np,
+static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
 					     const char *con_id,
 					     unsigned int idx,
 					     enum of_gpio_flags *of_flags)
 {
-	if (!IS_ENABLED(CONFIG_SPI_MASTER))
-		return ERR_PTR(-ENOENT);
-
-	/* Allow this specifically for Freescale and PPC devices */
-	if (!of_device_is_compatible(np, "fsl,spi") &&
-	    !of_device_is_compatible(np, "aeroflexgaisler,spictrl") &&
-	    !of_device_is_compatible(np, "ibm,ppc4xx-spi"))
-		return ERR_PTR(-ENOENT);
-	/* Allow only if asking for "cs-gpios" */
-	if (!con_id || strcmp(con_id, "cs"))
-		return ERR_PTR(-ENOENT);
+	static const struct of_rename_gpio {
+		const char *con_id;
+		const char *legacy_id;	/* NULL - same as con_id */
+		const char *compatible; /* NULL - don't check */
+	} gpios[] = {
+#if IS_ENABLED(CONFIG_MFD_ARIZONA)
+		{ "wlf,reset",	NULL,		NULL },
+#endif
+#if IS_ENABLED(CONFIG_REGULATOR)
+		/*
+		 * Some regulator bindings happened before we managed to
+		 * establish that GPIO properties should be named
+		 * "foo-gpios" so we have this special kludge for them.
+		 */
+		{ "wlf,ldoena",  NULL,		NULL }, /* Arizona */
+		{ "wlf,ldo1ena", NULL,		NULL }, /* WM8994 */
+		{ "wlf,ldo2ena", NULL,		NULL }, /* WM8994 */
+#endif
+#if IS_ENABLED(CONFIG_SPI_MASTER)
 
-	/*
-	 * While all other SPI controllers use "cs-gpios" the Freescale
-	 * uses just "gpios" so translate to that when "cs-gpios" is
-	 * requested.
-	 */
-	return of_get_named_gpiod_flags(np, "gpios", idx, of_flags);
-}
+		/*
+		 * The SPI GPIO bindings happened before we managed to
+		 * establish that GPIO properties should be named
+		 * "foo-gpios" so we have this special kludge for them.
+		 */
+		{ "miso",	"gpio-miso",	"spi-gpio" },
+		{ "mosi",	"gpio-mosi",	"spi-gpio" },
+		{ "sck",	"gpio-sck",	"spi-gpio" },
 
-/*
- * Some regulator bindings happened before we managed to establish that GPIO
- * properties should be named "foo-gpios" so we have this special kludge for
- * them.
- */
-static struct gpio_desc *of_find_regulator_gpio(struct device_node *np,
-						const char *con_id,
-						unsigned int idx,
-						enum of_gpio_flags *of_flags)
-{
-	/* These are the connection IDs we accept as legacy GPIO phandles */
-	const char *whitelist[] = {
-		"wlf,ldoena", /* Arizona */
-		"wlf,ldo1ena", /* WM8994 */
-		"wlf,ldo2ena", /* WM8994 */
+		/*
+		 * The old Freescale bindings use simply "gpios" as name
+		 * for the chip select lines rather than "cs-gpios" like
+		 * all other SPI hardware. Allow this specifically for
+		 * Freescale and PPC devices.
+		 */
+		{ "cs",		"gpios",	"fsl,spi" },
+		{ "cs",		"gpios",	"aeroflexgaisler,spictrl" },
+		{ "cs",		"gpios",	"ibm,ppc4xx-spi" },
+#endif
+#if IS_ENABLED(CONFIG_TYPEC_FUSB302)
+		/*
+		 * Fairchild FUSB302 host is using undocumented "fcs,int_n"
+		 * property without the compulsory "-gpios" suffix.
+		 */
+		{ "fcs,int_n",	NULL,		"fcs,fusb302" },
+#endif
 	};
-	int i;
-
-	if (!IS_ENABLED(CONFIG_REGULATOR))
-		return ERR_PTR(-ENOENT);
+	struct gpio_desc *desc;
+	const char *legacy_id;
+	unsigned int i;
 
 	if (!con_id)
 		return ERR_PTR(-ENOENT);
 
-	i = match_string(whitelist, ARRAY_SIZE(whitelist), con_id);
-	if (i < 0)
-		return ERR_PTR(-ENOENT);
-
-	return of_get_named_gpiod_flags(np, con_id, idx, of_flags);
-}
-
-static struct gpio_desc *of_find_arizona_gpio(struct device_node *np,
-					      const char *con_id,
-					      unsigned int idx,
-					      enum of_gpio_flags *of_flags)
-{
-	if (!IS_ENABLED(CONFIG_MFD_ARIZONA))
-		return ERR_PTR(-ENOENT);
-
-	if (!con_id || strcmp(con_id, "wlf,reset"))
-		return ERR_PTR(-ENOENT);
-
-	return of_get_named_gpiod_flags(np, con_id, idx, of_flags);
-}
+	for (i = 0; i < ARRAY_SIZE(gpios); i++) {
+		if (strcmp(con_id, gpios[i].con_id))
+			continue;
 
-static struct gpio_desc *of_find_usb_gpio(struct device_node *np,
-					  const char *con_id,
-					  unsigned int idx,
-					  enum of_gpio_flags *of_flags)
-{
-	/*
-	 * Currently this USB quirk is only for the Fairchild FUSB302 host
-	 * which is using an undocumented DT GPIO line named "fcs,int_n"
-	 * without the compulsory "-gpios" suffix.
-	 */
-	if (!IS_ENABLED(CONFIG_TYPEC_FUSB302))
-		return ERR_PTR(-ENOENT);
+		if (gpios[i].compatible &&
+		    !of_device_is_compatible(np, gpios[i].compatible))
+			continue;
 
-	if (!con_id || strcmp(con_id, "fcs,int_n"))
-		return ERR_PTR(-ENOENT);
+		legacy_id = gpios[i].legacy_id ?: gpios[i].con_id;
+		desc = of_get_named_gpiod_flags(np, legacy_id, idx, of_flags);
+		if (!gpiod_not_found(desc)) {
+			pr_info("%s uses legacy gpio name '%s' instead of '%s-gpios'\n",
+				of_node_full_name(np), legacy_id, con_id);
+			return desc;
+		}
+	}
 
-	return of_get_named_gpiod_flags(np, con_id, idx, of_flags);
+	return ERR_PTR(-ENOENT);
 }
 
 static struct gpio_desc *of_find_mt2701_gpio(struct device_node *np,
@@ -525,11 +481,7 @@ typedef struct gpio_desc *(*of_find_gpio_quirk)(struct device_node *np,
 						unsigned int idx,
 						enum of_gpio_flags *of_flags);
 static const of_find_gpio_quirk of_find_gpio_quirks[] = {
-	of_find_spi_gpio,
-	of_find_spi_cs_gpio,
-	of_find_regulator_gpio,
-	of_find_arizona_gpio,
-	of_find_usb_gpio,
+	of_find_gpio_rename,
 	of_find_mt2701_gpio,
 	NULL
 };

-- 
b4 0.11.0-dev-5166b

