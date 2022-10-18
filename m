Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD46CC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 05:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAo5oGxoQQ9M35JSkjwS/M3VaYU6KO6LohL0MAi6tfs=; b=QpwDhu83ozrpTnjEXbuxYeYJg6
	wowD+mNuQ03Vh2riDm7VbGattOMTkxFTFJC0i51tYDsaZrKTJDCVVRM1ii8tFnT2tdCagC9uqliTk
	8k2b9AXnzPqDEJ6YccBwAnEzEkoqXItrRsT7JpYhmhs5vsH+LZ9px+xOS8GAj/ZHGWdAtkgTz7AIR
	fLOiP2tyUe27SgLRx/UhtedK25u1y2jdmg6WC7yBHp2xfRBcAApnCTFzjj/IFnIe566YYDOWCpc5Y
	Y/Kj7zNCX9cDDRKsvQSI3Q7deLmtYND9Qy27h1t6UyJOOjP6ASxXF4G1Qp93mUGtUgkGnJlQ5DP2Q
	cZikmHNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okfPE-002so7-LE; Tue, 18 Oct 2022 05:44:48 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okfM4-002qWL-FC; Tue, 18 Oct 2022 05:41:33 +0000
Received: by mail-pj1-x1035.google.com with SMTP id pq16so13005216pjb.2;
        Mon, 17 Oct 2022 22:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aAo5oGxoQQ9M35JSkjwS/M3VaYU6KO6LohL0MAi6tfs=;
        b=Nj7SpUxqGWO/g5w8qtXKXYOgpeXvQWI0giRLoUtM/08fFN1XpvrQ0O30qHx6FrIfIb
         C/CR50B74wIm07MrIzIj6cC9kLGf2G/5cp/sHdMQMrdazlroSc+Biv2BC5VqQWqP8915
         yTXE3pSWpXjhjKFf/yZTiJxImEV4wPYpJPLZAa9RAarPTxWVoo9PbZ6oyL8zH3jeSHOX
         XmTTLNZMCJ01LDAHOhv+hgMcaboEyicpyUtz9Ro8apyzA9Uy5JwauG/RDI/aCe94GHvv
         PpVjGTBmJmx+n+35E9c5u4KL4j2/nut1WZu7AKFv4Gdyfrbkopv6yiB/4Md5dVvGf/vT
         CwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aAo5oGxoQQ9M35JSkjwS/M3VaYU6KO6LohL0MAi6tfs=;
        b=QkOHurl6esf3CwXtrdn3GI2qszrP0Nw/LUihYO6YymA+PXyZiUzh0NTIDyB11fLmRn
         7nHbJzG+dV4IN45LJC/wCNZT9P6h81M6cQKSWsqfEOt4RFjaC+LFb3pc/O3kvAu1OlF/
         iwN5pnZY8yZLv4abaEaV/ejG88XhwZLd2UTLacjBbKlUV4fDzm+rD0crS4GF8XJdtr/k
         weGZNOzrjuwwQvd8mTg8YG8VXFGWMuXJ4Eu9jQY2wWEOferuGXg2cD3AqG+es89wY7QM
         IWmEWfEZfO4xFBQLz8N5xxx/FZ70HL6kNU9ZDzMo3j0NijTYlUcpTQb7Yu60V08tdYPY
         /ZmA==
X-Gm-Message-State: ACrzQf2URiIWRuO1gWwhYJwUbQcF1XhGRdjVDAFBBqjwPXUzAu3ugkFN
	MoFBs5+Ez8PCthikZRkzaR4=
X-Google-Smtp-Source: AMsMyM5psfIakJgMDw/HEqJqCW2SWqB/Y1AAF5bTHufNONjzn9g2OVeIPLHFUev+XHc/9EEpIwa20A==
X-Received: by 2002:a17:902:b606:b0:184:1183:5f9f with SMTP id b6-20020a170902b60600b0018411835f9fmr1431169pls.84.1666071690510;
        Mon, 17 Oct 2022 22:41:30 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:f7bc:1bb5:e0b1:92cb])
        by smtp.gmail.com with ESMTPSA id z7-20020a1709027e8700b00172f4835f53sm7597435pla.192.2022.10.17.22.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 22:41:29 -0700 (PDT)
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
Subject: [PATCH v3 08/10] gpiolib: of: factor out code overriding gpio line polarity
Date: Mon, 17 Oct 2022 22:41:09 -0700
Message-Id: <20221011-gpiolib-quirks-v3-8-eae9cc2ed0a1@gmail.com>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
In-Reply-To: <20221011-gpiolib-quirks-v3-0-eae9cc2ed0a1@gmail.com>
References: <20221011-gpiolib-quirks-v3-0-eae9cc2ed0a1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_224132_525703_AE1B6FBC 
X-CRM114-Status: GOOD (  15.04  )
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 48 +++++++++++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index d22498c72a67..6faf0dc7bc31 100644
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

