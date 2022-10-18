Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140C6C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 05:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ch1kkg4DviDr6cISnBueqNw+RVHy+3iDkYpvZ9QTu+8=; b=cDroJNaGn7nPJuTGliBOu2k0D+
	pwe+e5Kp25TU3aZOF37C1eFunz9EuVUwZRDm19T5BYga1JU8+x2u78MM1p/Afy8pLYEKfXBxuh5qO
	9w9o9tcVkdwayOH7jon9aSKc6GCwOFwqBW81jJK4eFTjj+sM+l04xZOnEE5BrAt0pPg8mbn3RNh3m
	jEfrrQUF9TO2IXLpMaJ3OBxaVlqKM+YbvEb2JHJhWi5CMt7Goa81IDlHBcxXGPRk3wmTCakmtBH7V
	WyZ/nBChIUGKKpR0KBxZEVRQCM2RzqLfmEaVtZpeuZFkEDIBXFYjTLZYm3TB+H2aBNZdM+Mrk9Dsu
	NCS3ptAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okfMo-002qsN-7z; Tue, 18 Oct 2022 05:42:18 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okfLw-002qSr-HP; Tue, 18 Oct 2022 05:41:25 +0000
Received: by mail-pj1-x102c.google.com with SMTP id o9-20020a17090a0a0900b0020ad4e758b3so12983244pjo.4;
        Mon, 17 Oct 2022 22:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ch1kkg4DviDr6cISnBueqNw+RVHy+3iDkYpvZ9QTu+8=;
        b=mHve54bc7ls4cCd6C+WM3vdDSNGdw+8I7tX818Y+FQd+0A1EfGoZp1Cu9SjKAkb8s3
         Mz6bLG0nCRdSFm8PoxRktOPdBxTSH/1gJ+psd/3tNwGufenYlwBHOHRkanuiFHnkpNbi
         qKTDWws9xj62X8nQs4UY3tIbcymrjuUmf4ng7BiDtgNfN/5CNBFnDncwzG+tmQfasCo8
         EMOl9ry8ZHYazcKg0NtcFqpURBiE/IcwXyv8od3GcSZ50/ViCKHX4Hv5ukC0a5reOb+Y
         EBu8Ag4Up1LyZ87fjL4Y/Qg9Hic/ClAL2eYp5ytA96PKAALHcXOMXHT+Xf1Vr8VqLTbg
         bVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ch1kkg4DviDr6cISnBueqNw+RVHy+3iDkYpvZ9QTu+8=;
        b=eL7GTaiDCYlk9Tt8evSYwC5I7IeSR1nLYg4RaWHBLXQ9ymv2ls02IBRYnHznV6uB0b
         4tvGffbzA4DZyqIEsVoOfo+VB6gpsC+SLyaJy4CV3KSaONWf48KYJSEwj2wtSVw5h8AN
         j5O4wAkJUxK95ErFOWIyyFLfChmauVFbJreD56prrMGUrNZhGzPgkiEh9liHpUWP7p0r
         ISytWWn+Svi+rSzassGOhAYMH4sqxqqxMVOIAib5BI5zk4viMlXybNTYcitPNPY28Yah
         ZjHzmWZNIh720uU2e+Tajbd7wjWdzU/LK/KlarW1TrROp0Hz/9W5UHNPSYgQTssPU8sa
         2FBw==
X-Gm-Message-State: ACrzQf3RzTzcmDGY+t6XdG22A/g3sFM6YY9n4INpSxaipUMAOwnBbpGX
	ywx6BM0MIHk53vxygwzslYg=
X-Google-Smtp-Source: AMsMyM7d59XGsjP6DygOpdlJU+BHF6POz0TjgtvZCukR/4f2RTioIXZcjn/vo/jVJHpfY2p3ENJHbA==
X-Received: by 2002:a17:903:11c3:b0:17a:e62:16e8 with SMTP id q3-20020a17090311c300b0017a0e6216e8mr1354374plh.137.1666071681430;
        Mon, 17 Oct 2022 22:41:21 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:f7bc:1bb5:e0b1:92cb])
        by smtp.gmail.com with ESMTPSA id z7-20020a1709027e8700b00172f4835f53sm7597435pla.192.2022.10.17.22.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 22:41:20 -0700 (PDT)
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
Subject: [PATCH v3 03/10] gpiolib: of: tighten selection of gpio renaming quirks
Date: Mon, 17 Oct 2022 22:41:04 -0700
Message-Id: <20221011-gpiolib-quirks-v3-3-eae9cc2ed0a1@gmail.com>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
In-Reply-To: <20221011-gpiolib-quirks-v3-0-eae9cc2ed0a1@gmail.com>
References: <20221011-gpiolib-quirks-v3-0-eae9cc2ed0a1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_224124_626448_B8003A2F 
X-CRM114-Status: GOOD (  11.31  )
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

Tighten selection of legacy gpio renaming quirks so that they only
considered on more relevant configurations.

Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 63c6fa3086f3..7d4bbf6484bc 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -385,18 +385,21 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
 #if IS_ENABLED(CONFIG_MFD_ARIZONA)
 		{ "wlf,reset",	NULL,		NULL },
 #endif
-#if IS_ENABLED(CONFIG_REGULATOR)
+
 		/*
 		 * Some regulator bindings happened before we managed to
 		 * establish that GPIO properties should be named
 		 * "foo-gpios" so we have this special kludge for them.
 		 */
+#if IS_ENABLED(CONFIG_REGULATOR_ARIZONA_LDO1)
 		{ "wlf,ldoena",  NULL,		NULL }, /* Arizona */
+#endif
+#if IS_ENABLED(CONFIG_REGULATOR_WM8994)
 		{ "wlf,ldo1ena", NULL,		NULL }, /* WM8994 */
 		{ "wlf,ldo2ena", NULL,		NULL }, /* WM8994 */
 #endif
-#if IS_ENABLED(CONFIG_SPI_MASTER)
 
+#if IS_ENABLED(CONFIG_SPI_GPIO)
 		/*
 		 * The SPI GPIO bindings happened before we managed to
 		 * establish that GPIO properties should be named
@@ -405,6 +408,7 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
 		{ "miso",	"gpio-miso",	"spi-gpio" },
 		{ "mosi",	"gpio-mosi",	"spi-gpio" },
 		{ "sck",	"gpio-sck",	"spi-gpio" },
+#endif
 
 		/*
 		 * The old Freescale bindings use simply "gpios" as name
@@ -412,10 +416,14 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
 		 * all other SPI hardware. Allow this specifically for
 		 * Freescale and PPC devices.
 		 */
+#if IS_ENABLED(CONFIG_SPI_FSL_SPI)
 		{ "cs",		"gpios",	"fsl,spi" },
 		{ "cs",		"gpios",	"aeroflexgaisler,spictrl" },
+#endif
+#if IS_ENABLED(CONFIG_SPI_PPC4xx)
 		{ "cs",		"gpios",	"ibm,ppc4xx-spi" },
 #endif
+
 #if IS_ENABLED(CONFIG_TYPEC_FUSB302)
 		/*
 		 * Fairchild FUSB302 host is using undocumented "fcs,int_n"

-- 
b4 0.11.0-dev-5166b

