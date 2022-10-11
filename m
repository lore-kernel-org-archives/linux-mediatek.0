Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36235C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 22:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i1NwOj/1yvWDq1i4eyj2xHmv/XFz6FaWZBWaVM7wyu0=; b=wBqbCRoOO/3b7AEPiTqTlSyjp6
	PKB/mk9v2gk7ESFrUdKQMA9Z5uk5+Yw6eC8SYDvySisRnNlRcvsytPBCFSuO+MxOe/Ew+kYhBrkNH
	zbSr+K+19UDk4X9z2wOOYIwrs6tnJa0jy9koNF0vf0iBOOrw0W+d0zf8EiieOqUIKxNgSHtMby7E6
	yFxTNlY7zm3/YR0wjw7FBI4/KuikHZB0p5KAlSM5uZcYB/WGSVUwr1If35taQMw9MzVJX02a5o72o
	B4XSaLIldPJbnFm/RTYRWxWvvGLhbDeXFfqQ/cYqBcjJNjFShubyCo++Rna7KMiaIBuPit2LT4gQn
	LjfJpKNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiNbu-0060ed-BX; Tue, 11 Oct 2022 22:20:26 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiNbH-0060Lr-BB; Tue, 11 Oct 2022 22:19:49 +0000
Received: by mail-pl1-x630.google.com with SMTP id b2so14513622plc.7;
        Tue, 11 Oct 2022 15:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1NwOj/1yvWDq1i4eyj2xHmv/XFz6FaWZBWaVM7wyu0=;
        b=QnJ3DkOqZb9+TAxfrrY/yJZgX9BlizlN23aZk0peWJQqkfSjwVYTilHLwwz7eotgFD
         pLfAIPuEbODQpFNZsGYpKFM+/imh52QZn4ifSgqOX0ZsbSBUHoE/7aq6UkFHB22bJ/tk
         QGtuYF6dQO1UNw8I3BiH3OBnrcg3N/oZwx01p6yX/uwbyOM8qfhj0BxpqESpbyyj/p9R
         7KrvKjUyZuGhKyXNttL3he42d3+LE4smfpiw9NY8ycWBFcWJFGGtvq6rE0FDVY0Mm3R6
         vFvAdEwJgP4bRnHkHjsm5Dj0iJNv/WQyAvkCDi/Q/VhTO/ViNodqPd1fKcBjJEhA+Iqi
         LDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i1NwOj/1yvWDq1i4eyj2xHmv/XFz6FaWZBWaVM7wyu0=;
        b=uDf5U0AGjN4wJnTC2xySDdD0bl8zSasoYckkDCqaZV/aPIOy/LJbuDsogqnSsKokC8
         LxeSMlerXB1v4IR9zAdtQP2gs+CrdJwhnnlT+WOfSVstoeOIFjXc8CSnKrLWvlmOO7D2
         X30JCzWSl7zWSw3b0/tMQNU72W22C554MuHHJ+BdTJUCeKnhdpq8/lFbA4CLF1qPkLnU
         IkCebdQ1fXe9GRrzB9yUfSAU9Qe3khOgnjT4xxBZUbReR7UDgHpq+wXWIn7DUobFSRLD
         y//FYxZlF43IfuCgpiFsup54gOkB0CAZLVG1VRZbsNOk4KOcuUydyEV5leP1/cIYyWNd
         Sm/w==
X-Gm-Message-State: ACrzQf1gE563YSQoEbhMlLWb2LiG0Cmf0m5nXY+A3VkPBJOeKn210zu8
	GU7X8mAZFDOUGkYUoal44mw=
X-Google-Smtp-Source: AMsMyM67VBVHeAxNNooJjkK0PyaA6elXhQFtVi8kxrLNLHJe9zDpYIGxr6dY/4+x2BRZV8n5mJwFrA==
X-Received: by 2002:a17:902:d4ce:b0:178:1e39:3218 with SMTP id o14-20020a170902d4ce00b001781e393218mr26303122plg.144.1665526784393;
        Tue, 11 Oct 2022 15:19:44 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:becc:db10:eb45:dc35])
        by smtp.gmail.com with ESMTPSA id l6-20020a17090ab70600b0020d39ffe987sm60151pjr.50.2022.10.11.15.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 15:19:43 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH 3/7] gpiolib: of: add quirk for locating reset lines with legacy bindings
Date: Tue, 11 Oct 2022 15:19:31 -0700
Message-Id: <20221011-gpiolib-quirks-v1-3-e01d9d3e7b29@gmail.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com>
References: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_151947_415883_C385CC1C 
X-CRM114-Status: GOOD (  11.88  )
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

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 619aae0c5476..576f2f0c3432 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -375,9 +375,18 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
 		const char *legacy_id;	/* NULL - same as con_id */
 		const char *compatible; /* NULL - don't check */
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
 #if IS_ENABLED(CONFIG_REGULATOR)
 		/*
 		 * Some regulator bindings happened before we managed to
@@ -388,8 +397,14 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
 		{ "wlf,ldo1ena", NULL,		NULL }, /* WM8994 */
 		{ "wlf,ldo2ena", NULL,		NULL }, /* WM8994 */
 #endif
+#if IS_ENABLED(CONFIG_SND_SOC_TLV320AIC3X)
+		{ "reset",	"gpio-reset",	"ti,tlv320aic3x" },
+		{ "reset",	"gpio-reset",	"ti,tlv320aic33" },
+		{ "reset",	"gpio-reset",	"ti,tlv320aic3007" },
+		{ "reset",	"gpio-reset",	"ti,tlv320aic3104" },
+		{ "reset",	"gpio-reset",	"ti,tlv320aic3106" },
+#endif
 #if IS_ENABLED(CONFIG_SPI_MASTER)
-
 		/*
 		 * The SPI GPIO bindings happened before we managed to
 		 * establish that GPIO properties should be named

-- 
b4 0.11.0-dev-5166b

