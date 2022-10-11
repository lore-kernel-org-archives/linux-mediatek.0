Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C291C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 22:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fh3v3yhN+2E5ygCgfV0BTHYUwG2aM97Wp0EcHi2gxlg=; b=eqaDbNRKerfpCtTaXp13FSH1BU
	6sIV965pW8P+eAqXSzu+u0sLcDqNuUoGaPTCuXxAGc8uVVEhombcQ+sRdbrhKRVvvVxyqreMK+27B
	U+ZCpeGeb6clnFzuh7yhngdJL0ocPaVPtLMXEITWK/3cFV7TAR58BEkt7RAwbVcVIUj2si4KUaExK
	mc9apKvEl7V+YuwTt+EeClpixS9kODBkmyJKSspx0baFN6fRiwoK7mMbw5sbirSUTo2tIDICqMB0o
	sGezR0GNkV5a95+zvqfCUiHtp9FXjSwa3tqX2fk8EKEgHUBn6nE9qzi6YUjDsYljSPYBpOL0lhMoK
	5Mbd4S4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiNcY-006122-V6; Tue, 11 Oct 2022 22:21:06 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiNbJ-0060OM-Vr; Tue, 11 Oct 2022 22:19:51 +0000
Received: by mail-pl1-x632.google.com with SMTP id l1so14499615pld.13;
        Tue, 11 Oct 2022 15:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fh3v3yhN+2E5ygCgfV0BTHYUwG2aM97Wp0EcHi2gxlg=;
        b=O51pSS8/2qIEK3GhD0my1EHHUGlySin6EdmCRqCNr0sJOYKtpeXbjdAguScQCm9F8L
         jCBKghQYusOrqscaGpmphibwIrx9cSaxtm86FOg9U9kfLOD2Vy0YTSCPZEE59X/cPviB
         wJiYxhqtnfbBe3gzk02/jGzcdReijX3pm28iLyy8rHd/R3MLL94GhL/KnVvIFeDDYKac
         JOssavR2Xi7QXNbTVDX4txQNWE+xr4C/jRnEkXblJYAL85yTIeNPt9C1NE4PHJI/EvBq
         mpVB/W4kGp4erxK4iWcOWwNeEFK5jJZ0mEBVhuvchBKLhUDD9F15AfDX/Q+zRQdWSXkG
         6abA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fh3v3yhN+2E5ygCgfV0BTHYUwG2aM97Wp0EcHi2gxlg=;
        b=TYqw8Lz2QuUQII21CklEbkX0lK3k1py3/JwJLaC0WsCWkuUcHSjIEtK47QteIYNVu7
         f7QQcKn4p8MNWuZ3E679lmq8gU3tn8ZRdjiZjJ/y7TNz9nMtPmcqwuR4CcFbhwqIGmmH
         jJPf/GFwvgisLNApOgUDjDyr6oFUCZ4/jpDgXVdhjw/9YLweBB38AR6qncJ58zI7dUKE
         0Fdj1FxEQFjftvv99Knnlgbhe3pgvVGqmpXqohLaySlQz+wGEuhoaISOt19XEra29Oei
         jf1uwtcRr+7xaG95IIi0h8HL+kRm9KCTUFkOQPfllgXkNpVO4egutnBLqQ5gt/iWuoio
         ZxXw==
X-Gm-Message-State: ACrzQf37LeN2j22hVkW2Aif17EuJsDlHw50T6rN//S7UDHTi1ktaxPSy
	RWRaDv6na10CdRnOKv21d6U=
X-Google-Smtp-Source: AMsMyM5MwcBpgl/QmYTxnPgIwc8Ka6MfCq+pFUcwBI+LjlTQ/Qeb+hLI8u+4VZU7BazFQ98PYUkatw==
X-Received: by 2002:a17:902:f689:b0:179:fdac:c4e2 with SMTP id l9-20020a170902f68900b00179fdacc4e2mr26995320plg.119.1665526789337;
        Tue, 11 Oct 2022 15:19:49 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:becc:db10:eb45:dc35])
        by smtp.gmail.com with ESMTPSA id l6-20020a17090ab70600b0020d39ffe987sm60151pjr.50.2022.10.11.15.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 15:19:48 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH 6/7] gpiolib: of: factor out code overriding gpio line polarity
Date: Tue, 11 Oct 2022 15:19:34 -0700
Message-Id: <20221011-gpiolib-quirks-v1-6-e01d9d3e7b29@gmail.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com>
References: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_151950_058899_A546054C 
X-CRM114-Status: GOOD (  14.54  )
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

There are several instances where we use a separate property to
override polarity specified in gpio property. Factor it out into
a separate function.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 48 +++++++++++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 953d1c23950a..3200d705fbe3 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -130,6 +130,28 @@ bool of_gpio_need_valid_mask(const struct gpio_chip *gc)
 	return false;
 }
 
+/*
+ * Overrides stated polarity of a gpio line and warns when there is a
+ * discrepancy.
+ */
+static void of_gpio_quirk_polarity(const struct device_node *np,
+				   bool active_high,
+				   enum of_gpio_flags *flags)
+{
+	if (active_high) {
+		if (*flags & OF_GPIO_ACTIVE_LOW) {
+			pr_warn("%s GPIO handle specifies active low - ignored\n",
+				of_node_full_name(np));
+			*flags &= ~OF_GPIO_ACTIVE_LOW;
+		}
+	} else {
+		if (!(*flags & OF_GPIO_ACTIVE_LOW))
+			pr_info("%s enforce active low on GPIO handle\n",
+				of_node_full_name(np));
+		*flags |= OF_GPIO_ACTIVE_LOW;
+	}
+}
+
 static void of_gpio_flags_quirks(const struct device_node *np,
 				 const char *propname,
 				 enum of_gpio_flags *flags,
@@ -145,7 +167,7 @@ static void of_gpio_flags_quirks(const struct device_node *np,
 	     (!(strcmp(propname, "enable-gpio") &&
 		strcmp(propname, "enable-gpios")) &&
 	      of_device_is_compatible(np, "regulator-gpio")))) {
-		bool active_low = !of_property_read_bool(np,
+		bool active_high = of_property_read_bool(np,
 							 "enable-active-high");
 		/*
 		 * The regulator GPIO handles are specified such that the
@@ -153,13 +175,7 @@ static void of_gpio_flags_quirks(const struct device_node *np,
 		 * the polarity of the GPIO line. Any phandle flags must
 		 * be actively ignored.
 		 */
-		if ((*flags & OF_GPIO_ACTIVE_LOW) && !active_low) {
-			pr_warn("%s GPIO handle specifies active low - ignored\n",
-				of_node_full_name(np));
-			*flags &= ~OF_GPIO_ACTIVE_LOW;
-		}
-		if (active_low)
-			*flags |= OF_GPIO_ACTIVE_LOW;
+		of_gpio_quirk_polarity(np, active_high, flags);
 	}
 	/*
 	 * Legacy open drain handling for fixed voltage regulators.
@@ -200,18 +216,10 @@ static void of_gpio_flags_quirks(const struct device_node *np,
 				 * conflict and the "spi-cs-high" flag will
 				 * take precedence.
 				 */
-				if (of_property_read_bool(child, "spi-cs-high")) {
-					if (*flags & OF_GPIO_ACTIVE_LOW) {
-						pr_warn("%s GPIO handle specifies active low - ignored\n",
-							of_node_full_name(child));
-						*flags &= ~OF_GPIO_ACTIVE_LOW;
-					}
-				} else {
-					if (!(*flags & OF_GPIO_ACTIVE_LOW))
-						pr_info("%s enforce active low on chipselect handle\n",
-							of_node_full_name(child));
-					*flags |= OF_GPIO_ACTIVE_LOW;
-				}
+				bool active_high = of_property_read_bool(child,
+								"spi-cs-high");
+				of_gpio_quirk_polarity(child, active_high,
+						       flags);
 				of_node_put(child);
 				break;
 			}

-- 
b4 0.11.0-dev-5166b

