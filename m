Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C471C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 22:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nhyRfNRLvXdJqTEKmbHvJb0Krk3UyiSQItTbwFfBY0Q=; b=njk6oIhrQB+Q4SMCAPxh7mrtnm
	Fv8pSN1KuKEcWK2GcaF+Ea38wbb5LqX+8KykITDe+ZolLIthIGPOiYMSpOYC+mD8riksexCNzic8w
	6lkGXIqZctX73HiFq7nkRsmDlZRof/kuu10hpmBLLbqh5cQQs7PmhogTS+UWtTiYtruVDGH9rIYrw
	VUBnQmR2CwA58Xuvtrde5ISKvB789Xq6XMiuwsKgKO3aSbo/OmekYDoCUMxsdu0I2hwOybcVSUrgv
	sun1tjH5BIcF8kvSzqagrTnHQmpxL0qQhFUQxPslTJJljP2C1gzZyK7DA2vtMhF5d0BGvG0xua4a5
	zbStlYDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiNbP-0060Qo-NY; Tue, 11 Oct 2022 22:19:55 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiNbD-0060L7-LB; Tue, 11 Oct 2022 22:19:44 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 128so6230400pga.1;
        Tue, 11 Oct 2022 15:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhyRfNRLvXdJqTEKmbHvJb0Krk3UyiSQItTbwFfBY0Q=;
        b=jekSfU6bSssvmSN6shHkFWzrkqwUP6Dh/I247pcSVjamDvq77Ri2F9VMB/FIyTDdU/
         w0sU/ojt3oZmKldccy4LMbsGFnOzpO5ycXuU3U7Qx+8NMcuNz7qV8uvgzCYxBLr5lnZ0
         kh397lLEPgMfrGz3Gv3JGpMrS5JvyMfMg2xj2KtgWiRelv0vlPbiIZx4W2EDhKe2KeAI
         qQ+t2OUCyW6ZmkjXGirtbFHctLXhqnZlNAx7EwIh/7SKTIs8vwioNVeObW5JcKoXXQBc
         13p8PQBW6YqrxYpNqBSniLLbFiNNcgsCa49FEhitXvBMudkU907TTa+zp87QM1kVNj5X
         cagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nhyRfNRLvXdJqTEKmbHvJb0Krk3UyiSQItTbwFfBY0Q=;
        b=b3g45Sl+YgRjvYBUyHE8DcL7TiAoA/N2ysCegd5Vnty7Q8ELBrAAmUtpXQlhHhhOHJ
         87slUqcA/j5/hSCilqeiSaAQOlbZTktgMtuVHn5vZgNdOjJ3T4T0KQU92EEVWbZdNcWi
         0jZVwpohmuyJBGy2PR3ULxP0nMauaX8xsjtMwi7p9AIqRnf2old6D9FDdilNdKf0n+Ir
         rbyO4stCoY/9GXMIwXj/8i2P/fjiTjQ6tYXZ8nErDMINo8FvyWCG9iK/0mfmwk1BWZnH
         CNi7oItVohkZVZ9T9WXGkHwwHrBxU6Aioivf5/+7x6IQc+8ApViuY3sYvKQtYM9fa5m2
         WLAw==
X-Gm-Message-State: ACrzQf0WW6xgbLbZEtsGaSgjZSNQ4lVtL6zBRGH1441TtTzTPH//ZC9z
	0SeD6UvJwNwOZVbwq9eWocw=
X-Google-Smtp-Source: AMsMyM6LQqmkoRXYQmKJL9XWaaA+rIB+jKj+cYC4OTvZazSGvk1PtVlLhh+08LP/j2Coex+D1iWRHw==
X-Received: by 2002:a05:6a00:2392:b0:549:be0:cd3c with SMTP id f18-20020a056a00239200b005490be0cd3cmr27346862pfc.8.1665526781095;
        Tue, 11 Oct 2022 15:19:41 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:becc:db10:eb45:dc35])
        by smtp.gmail.com with ESMTPSA id l6-20020a17090ab70600b0020d39ffe987sm60151pjr.50.2022.10.11.15.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 15:19:40 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH 1/7] gpiolib: of: add a quirk for legacy names in Mediatek mt2701-cs42448
Date: Tue, 11 Oct 2022 15:19:29 -0700
Message-Id: <20221011-gpiolib-quirks-v1-1-e01d9d3e7b29@gmail.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com>
References: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_151943_711873_A3FF5D34 
X-CRM114-Status: GOOD (  13.88  )
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

The driver is using non-standard "i2s1-in-sel-gpio1" and
"i2s1-in-sel-gpio2" names to describe its gpios. In preparation to
converting to the standard naming (i2s1-in-sel-gpios) and switching the
driver to gpiod API add a quirk to gpiolib to keep compatibility with
existing DTSes.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 0e4e1291604d..cef4f6634125 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -488,6 +488,38 @@ static struct gpio_desc *of_find_usb_gpio(struct device_node *np,
 	return of_get_named_gpiod_flags(np, con_id, idx, of_flags);
 }
 
+static struct gpio_desc *of_find_mt2701_gpio(struct device_node *np,
+					     const char *con_id,
+					     unsigned int idx,
+					     enum of_gpio_flags *of_flags)
+{
+	struct gpio_desc *desc;
+	const char *legacy_id;
+
+	if (!IS_ENABLED(CONFIG_SND_SOC_MT2701_CS42448))
+		return ERR_PTR(-ENOENT);
+
+	if (!of_device_is_compatible(np, "mediatek,mt2701-cs42448-machine"))
+		return ERR_PTR(-ENOENT);
+
+	if (!con_id || strcmp(con_id, "i2s1-in-sel"))
+		return ERR_PTR(-ENOENT);
+
+	if (idx == 0)
+		legacy_id = "i2s1-in-sel-gpio1";
+	else if (idx == 1)
+		legacy_id = "i2s1-in-sel-gpio2";
+	else
+		return ERR_PTR(-ENOENT);
+
+	desc = of_get_named_gpiod_flags(np, legacy_id, 0, of_flags);
+	if (!gpiod_not_found(desc))
+		pr_info("%s is using legacy gpio name '%s' instead of '%s-gpios'\n",
+			of_node_full_name(np), legacy_id, con_id);
+
+	return desc;
+}
+
 typedef struct gpio_desc *(*of_find_gpio_quirk)(struct device_node *np,
 						const char *con_id,
 						unsigned int idx,
@@ -498,6 +530,7 @@ static const of_find_gpio_quirk of_find_gpio_quirks[] = {
 	of_find_regulator_gpio,
 	of_find_arizona_gpio,
 	of_find_usb_gpio,
+	of_find_mt2701_gpio,
 	NULL
 };
 

-- 
b4 0.11.0-dev-5166b

