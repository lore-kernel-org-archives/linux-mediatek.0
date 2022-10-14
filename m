Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB91C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 17:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovCPxMNt0i2khQD9ZbKAf0f91ILluT414D5KLsvMtco=; b=KPSpd13wlTKEkdTzzE/3SPhG05
	unfM9INEDew8tQQaeXNNADg9lb3i1e2JTsLngFf+6zm4/oZkK/RbbI4ODn/19YGq8sZsNBzTAMX7k
	j4kV9YXrMg1Qb4ji+8VjUBQubHd5ZFam0iJeDCujXGoRdLJ/+GSd5Q33kPZpJHXC6p4fPLpE2UUgu
	DVLfpL34/oOqdNawqigykFtppxB5bXId5iLXPXjXdUeXpH7YfNJTVjk59Kw4r5YRiBJjmyj5hpRv6
	glffx1tO5jdLAJkICiDYIHDYfiY9hYdaJ/t2XoFNU9WQ+FzpVLS5ugJAyitMmm4zibhnjQ5sTctV4
	fwj//qOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojOuy-00FXom-E9; Fri, 14 Oct 2022 17:56:20 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojOtX-00FX34-Er; Fri, 14 Oct 2022 17:54:52 +0000
Received: by mail-pf1-x42d.google.com with SMTP id g28so5564336pfk.8;
        Fri, 14 Oct 2022 10:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovCPxMNt0i2khQD9ZbKAf0f91ILluT414D5KLsvMtco=;
        b=HFcFHjwS441SSkOj2EJ1i/jFRuzEakkG04P1ZVLhsWdMbttmks0f9yASxRbQ+IxNaE
         ggb3CdzaZiF/gVxcQBPV3QBVIKdyiCHTe/Nly27/svHyG7uLM/9OhOyd+HoZ15xDXlaD
         iBI2BGmq08sbu7um1fTyd/8xp0UtGkVbN0csB9w48mZqveth8tibXU/H5lgv2WUm50sA
         zPbnn5qnr1C6sIsWxG3Nw7728oBpZ6wF2vGQVylCqAou7OxRxyCIVnc7kxkDgW0//+by
         2oG9ckqMUXCWzlxA2cm/wq1N1z/l+MA5/iB6X3lTJj2JA7TU/QxRGA9+38YDJwMLsIJA
         tBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ovCPxMNt0i2khQD9ZbKAf0f91ILluT414D5KLsvMtco=;
        b=Dep+qPVxvvABT9IL3vR9H8VYvshlDSHbDElQEIiBWOoTTXUnxgkuuPJq93pR2R7ocH
         S9uDpZd7Tlf8EnM0WGL3ZJcxpL6dW0KA2dQEDAzKZWCmoqL9YH7ls7GeaGhBopyQoofB
         vjjDyLLhd0EHHGD4DliqclPRPardiniO25iNMe1iKcTZHL7jV4hS3f3vIrW8zXhuTIIl
         Fzat8a2BhSkFUS9q61gBySF7+wky10GlRNsQbDUA3rM6e0MQYt4H22keBDfXgEcFaT4W
         tY9zAe+hMDXDPZJ409skq1nRnK7qGX5uFx//OTxshZAT84g68O/cqLkaBSfIDNvjAYRw
         4ipw==
X-Gm-Message-State: ACrzQf2o8sY1jkrbyf3C6yghkhXZd2WWF/bM7Z1iBsQNNSNMEtredLf8
	PsIWoIv3y5EJyqbq358grfo=
X-Google-Smtp-Source: AMsMyM6YUtWU5/7XIn6e546c/3iIZbpvRvrknueJ+/lzyJPczhtaZQfwcuNJEVFLnkVq/P2M3qeC8w==
X-Received: by 2002:a05:6a02:28b:b0:439:19d6:fad5 with SMTP id bk11-20020a056a02028b00b0043919d6fad5mr5672694pgb.591.1665770089619;
        Fri, 14 Oct 2022 10:54:49 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:da06:5604:594f:f6af])
        by smtp.gmail.com with ESMTPSA id jj19-20020a170903049300b0017f7819732dsm2011780plb.77.2022.10.14.10.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 10:54:49 -0700 (PDT)
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
Subject: [PATCH v2 7/9] gpiolib: of: factor out code overriding gpio line polarity
Date: Fri, 14 Oct 2022 10:54:31 -0700
Message-Id: <20221011-gpiolib-quirks-v2-7-73cb7176fd94@gmail.com>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
In-Reply-To: <20221011-gpiolib-quirks-v2-0-73cb7176fd94@gmail.com>
References: <20221011-gpiolib-quirks-v2-0-73cb7176fd94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_105451_527142_A8D88F5E 
X-CRM114-Status: GOOD (  14.16  )
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
index 77cabcfb2da0..da274d9adcdf 100644
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

