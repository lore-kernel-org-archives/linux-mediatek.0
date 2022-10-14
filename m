Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850EEC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 17:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bWZ+aGOI9zXRffRicNGgT9n+AHk/SzmN5RkqWoKLfug=; b=MLF0Sho9jnLNmXNr0gUpa795wD
	44h8kps5MXd2UNNwiTsbrdAWHenYvP8mAYV3USqDA8lcPy7PBATjVP5Yhi51bI+9Nd/5NQ8eIlsrA
	8uIehw+lSZ/eIGxZiRAUCPdQ/ISEBS9rc2Hi1gmeau8LN/aZM41E15XdO06HnePIdFw9mkIvy5bPn
	SpGX59VWBdQYSItz690P2weqmu3YOf4eJqN9Na+1cm1QkiBiHFuMrilmm5ikE+W2WorNT4BEj69vZ
	OCuLeCtFCKomqXiD6c2QncpPP/wV9elD8te5uzvanGDKUXENAHL5+1kZt/pPM2oqA11mFwu9OCSgh
	vcORb0wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojOtm-00FXBM-I6; Fri, 14 Oct 2022 17:55:06 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojOtQ-00FX0H-Rd; Fri, 14 Oct 2022 17:54:46 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d10so5581184pfh.6;
        Fri, 14 Oct 2022 10:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWZ+aGOI9zXRffRicNGgT9n+AHk/SzmN5RkqWoKLfug=;
        b=fOuoZbM/KjXQtLJpXmlUZdf0h5Nn6/Px2oC5XUiQn9ZydwR3x4nYk6bH+rwzR5dPbm
         SgLxRAhCzrDPIM3ABgllWBkdEDMqpe5P1q/j05LWtiH0IfnlVlLfJHV/CEKctMuVLmBX
         lljNk27Nac8Jm7tB01ebLFIokCWjW11F5iEqF9Zuk+LBAhVz3BCQoeoPTYRVPS66tSoO
         LvzjCgHO1oX1UamlmU1uoelQkiPDHKmsc37EsElMWeAigXtFJivGPnFeO2fgDpAR0byB
         rqNp0sp1B8ZTfSi9hmmlN16nYt5/899wmkZgmqHf4qC65cD5+UsaCrhffmMgJK3cDIa/
         PD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWZ+aGOI9zXRffRicNGgT9n+AHk/SzmN5RkqWoKLfug=;
        b=gkXY88IJXIguX947zC+L2zAcnt+kCKG1K68ihlJjvTG5mB+CNy82R9Y8G09n6kDhES
         G+v01JBgSCkKfL5/TVuCZmLN8LkH6xX8pUlz9S/K01KDx1bcKiwyvOT5hEqQfsOVS9U0
         hcX9omT7QUn/oRAA4/gL9H31HklWNDLl+BI8CM2d5JimtmjSVUvXB0IPy7dMaR8YAfxM
         jxuXz6hw8za6BqUMy5hD+F3v/jlXbfXLfQj7uZT3XogSXX3wLYu8nCvykpvdVfpQduGt
         Dai8Ny7ZIIniD2iTCo22zcSYHb9VORkuDW8qmaEVOcmCosFRLSuVDdJGfgGoJ/Bcmer/
         Kffw==
X-Gm-Message-State: ACrzQf1CAMaPh4y0jzghUATw5vUKXeqOZZFx74oXC3k3xvuMKRUe9pV6
	XXFdOCXM/hozZl1CnKln/z8=
X-Google-Smtp-Source: AMsMyM4bLYjTWsvcYEUC1J7AnVhPw7i51eFEiThG8nor2ElbLxXeKrJsQH1s4tSLb7eLWUt1sd3vtg==
X-Received: by 2002:a63:4e18:0:b0:43c:2fc7:2eea with SMTP id c24-20020a634e18000000b0043c2fc72eeamr5688379pgb.119.1665770082916;
        Fri, 14 Oct 2022 10:54:42 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:da06:5604:594f:f6af])
        by smtp.gmail.com with ESMTPSA id jj19-20020a170903049300b0017f7819732dsm2011780plb.77.2022.10.14.10.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 10:54:42 -0700 (PDT)
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
Subject: [PATCH v2 3/9] gpiolib: of: tighten selection of gpio renaming quirks
Date: Fri, 14 Oct 2022 10:54:27 -0700
Message-Id: <20221011-gpiolib-quirks-v2-3-73cb7176fd94@gmail.com>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
In-Reply-To: <20221011-gpiolib-quirks-v2-0-73cb7176fd94@gmail.com>
References: <20221011-gpiolib-quirks-v2-0-73cb7176fd94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_105444_928757_C0F9B874 
X-CRM114-Status: GOOD (  11.03  )
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

