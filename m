Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED5AC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 17:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ItwD3cs9eKU04Q3Z4ewr71YmDkGz4wd+DL/2Fjg5hWk=; b=1CZIniXl9Y2/JhsF40Bk+K/0/y
	8vSNqkVtH7OWeH8Wu+Nn032mfS0c+Ddkzpr9VSPExgaap1w40rHPYqlbky+x31qzA1u5U4bgshpN/
	k5HiZ2cx+LZhYp4uNN28wlUWKMGWR8xAjaTmX4XbcIGH/WIJLjHnBrvCRZwFeNymF4QPElAhtvPL2
	a7m6aSb1FSG/qUOyDGWXz9mLd6Sxz1IJbuvd51QvX5GBseDXO5MPZKS5gehZp7ImsN6YKd6bdGJ3+
	HivMHr+wIGDHBCRQQPSStql2ED+R57UiR+XxCvONhbnFJDCl6UT4nltJmwVJFl1noYu+kISkrUIZK
	gzTzy+8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojOvm-00FYEq-8m; Fri, 14 Oct 2022 17:57:10 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojOta-00FX41-DD; Fri, 14 Oct 2022 17:54:55 +0000
Received: by mail-pl1-x62f.google.com with SMTP id c24so5413601pls.9;
        Fri, 14 Oct 2022 10:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItwD3cs9eKU04Q3Z4ewr71YmDkGz4wd+DL/2Fjg5hWk=;
        b=qrN4P68onQDZsUtaXu/yhnboZR61v4aI0p4hv6B8PSm6Qxn0fOoSKoWHQxyw+tbOpf
         fmCFR20jX80FgTYk1BJSbrGyTxEoKkwt1SD/FyN2jTj1YWZqpLu6GW42zQjYb6xdcWe/
         tsNA2gGGmbJW+SsAdU3tq5p40BmHJZSxcgQObb6bQQothniQbLmsMn4ia0nvyZmVJRWK
         NHCQgAGBG+zOwUYxO9181oLcE0KCcM+si+09N8pLU5yrX+LkEcCY/8kMe4ymQdJcywIP
         eEZf8ToJR0AA0yLP6uz6Fz3vqlZVg4/xWhPK1mzsIqofcqFTn3cz/zYmjok2MhzEEx6F
         JHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ItwD3cs9eKU04Q3Z4ewr71YmDkGz4wd+DL/2Fjg5hWk=;
        b=wHg83bf63RtRjl6OQ00AUt2SeLQONFktZrDj6f15T3w+g+raiCb3XcpwNiZdEEj0gK
         hXuKVIR/IcFwnwxkfVjjG4Q7QhniDnwgFbZEQsttpGHkN+4pPV23c+MyzYi5mhOEEFP/
         Jq65cVHY7UovqG2myJjk1iskIgjx17kD+jn5jj7Ho15DuYe4/e/Mi8/evLHRQnf4Vj0J
         2oAwlNm//n7PLVmjANCkhkJWbSAgyyGcnqE0Z9Sq0tyV8hzQKaFoCeaO0M5KPUhlybI6
         5EAtfRdLam3ofS4USkAyWp9YBOkFj5ALT/4C578Na0xH+CRcpXGbfNJ3V6PmSij7HxZU
         aPAg==
X-Gm-Message-State: ACrzQf318GuVTXuNcjJYBXHVwuISfJB3UBagbaKICaUBZbzo+DwDdJFQ
	jwHhKpJktO5OjGmjYPcx9e8=
X-Google-Smtp-Source: AMsMyM7G6avsisY9dI9QyeETgZIog9Vw/1K3JMS6R5u6NAboiuA4lkzcXvuoyaM2vIsJndlNcEyA7Q==
X-Received: by 2002:a17:902:ced2:b0:17f:5eb2:cd72 with SMTP id d18-20020a170902ced200b0017f5eb2cd72mr6277520plg.162.1665770091373;
        Fri, 14 Oct 2022 10:54:51 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:da06:5604:594f:f6af])
        by smtp.gmail.com with ESMTPSA id jj19-20020a170903049300b0017f7819732dsm2011780plb.77.2022.10.14.10.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 10:54:50 -0700 (PDT)
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
Subject: [PATCH v2 8/9] gpiolib: of: add quirk for phy reset polarity for Freescale Ethernet
Date: Fri, 14 Oct 2022 10:54:32 -0700
Message-Id: <20221011-gpiolib-quirks-v2-8-73cb7176fd94@gmail.com>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
In-Reply-To: <20221011-gpiolib-quirks-v2-0-73cb7176fd94@gmail.com>
References: <20221011-gpiolib-quirks-v2-0-73cb7176fd94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_105454_473746_A9070CC3 
X-CRM114-Status: GOOD (  12.06  )
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

Bindings for Freescale Fast Ethernet Controller use a separate
property "phy-reset-active-high" to specify polarity of its phy
gpio line. To allow converting the driver to gpiod API we need
to add this quirk to gpiolib.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index da274d9adcdf..805222a2e6bc 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -231,6 +231,33 @@ static void of_gpio_flags_quirks(const struct device_node *np,
 	    !strcmp(propname, "snps,reset-gpio") &&
 	    of_property_read_bool(np, "snps,reset-active-low"))
 		*flags |= OF_GPIO_ACTIVE_LOW;
+
+	/*
+	 * Freescale Fast Ethernet Controller uses a separate property to
+	 * describe polarity of the phy reset line.
+	 */
+	if (IS_ENABLED(CONFIG_FEC)) {
+		static const char * const fec_devices[] = {
+			"fsl,imx25-fec",
+			"fsl,imx27-fec",
+			"fsl,imx28-fec",
+			"fsl,imx6q-fec",
+			"fsl,mvf600-fec",
+			"fsl,imx6sx-fec",
+			"fsl,imx6ul-fec",
+			"fsl,imx8mq-fec",
+			"fsl,imx8qm-fec",
+			"fsl,s32v234-fec",
+			NULL
+		};
+
+		if (!strcmp(propname, "phy-reset-gpios") &&
+		    of_device_compatible_match(np, fec_devices)) {
+			bool active_high = of_property_read_bool(np,
+						"phy-reset-active-high");
+			of_gpio_quirk_polarity(np, active_high, flags);
+		}
+	}
 }
 
 /**

-- 
b4 0.11.0-dev-5166b

