Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3324BC43217
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 17:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wmd4wvJqpqY60zoqrpnViqbsnHydL7TwQT2l6YcLmqI=; b=5C2ZxT78KRQ5aJ4IBKk3rcPpEs
	VH5gST4V9qqFOzemHgfzu1QcaWXx9U5AFkbGVsvH6r1FOrXpzDRbVx8HC1pLITLdXcQTXomE8RaSq
	zXgHD0Yc4sKZLtuTubdZqnaTT3p3NUPWx7xDaXknMnos/K3L2a+SeS13AFNEkljFRoVw7maeuiwai
	hPj3hdT4C39DKojIakoPpU2yRYHn81SCGSEplj9U/cXIQQW+UASHdPWRloo18niw6N7r9JXUfO4ug
	PKi4ID+bXKrd+fmUe5EceZ2DLkuqq2ntF3ci6HyScFCoozVKpb+OWYPBi6qrn8jMdvqpY2kjox62a
	TEmTnc5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojOtZ-00FX4u-T9; Fri, 14 Oct 2022 17:54:53 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojOtO-00FWza-EZ; Fri, 14 Oct 2022 17:54:43 +0000
Received: by mail-pj1-x1035.google.com with SMTP id a6-20020a17090abe0600b0020d7c0c6650so8626251pjs.0;
        Fri, 14 Oct 2022 10:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wmd4wvJqpqY60zoqrpnViqbsnHydL7TwQT2l6YcLmqI=;
        b=iB41m4KyiYjsuc0dggnZ35JbaHLv98PAwYo8Dm1EjKVq8/SmkHlFEq5GwQxCep3pyP
         /4w9dg8LhXRLtkK/0zUurv/wXpJ3m4Rl9xWVRpFHMnuQlrTzJKSa2GMOXDUKn0VJlqwZ
         SzEh3cAK2YSOQ60lUJ76mDVN99dTaYgD0YGfMuUS2/T3IMGByqtsM6gCKSuSjoXqKuye
         gzT18bhQSFBO6cOTYzBgCPyoi9oldutWo/xoD2XCrUXFKL0iYocMSLU1BKJfeHZAosPq
         Pg4HxTHPciq3P4bg2XUSoSxupEGZ7JvCr+mamCNfPPN7BvPLvhk4unO8uRKSL9n6iI4W
         ZhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wmd4wvJqpqY60zoqrpnViqbsnHydL7TwQT2l6YcLmqI=;
        b=s7ZC2raTws27OeQIsl8wrohyDHgbWzFT+LbfyapIIi99X+WZnOez8Osc4fsm8VoJgW
         wF4QHJnJy8FAlh0gKEpkt7LZkQhiZm7VRx2XbQlMwmxtP6C7ANHAVUXeagD1h8WEYXUm
         dHiPVI8EcynL9i1AJ+317wWOtIf8qvqxT7ZlZzbWSBXOmfNGqDIm84cjvSxF/MIjzVzM
         BXuDCcqY54g7tSyACBymvm9+5Yauv9zCduh1KRTgxWFweBcXZ4Opqs/oHCjQoTQ5y6Hu
         i61mGx+UOiKGEES5ak6lpoPlEeKelfAy1JluFM6MT9hRVCbplgT5XhTOVYMM+2jNFqq6
         geAw==
X-Gm-Message-State: ACrzQf3ZGbvtLLoZ1vl7UHNfJ1blqUkqwwdVzCwsb6KWCK6MQBRY0iu6
	i5v0LnxD0UGZaoWDguEmBn0=
X-Google-Smtp-Source: AMsMyM7+cfeaKStMmEYIJgtZWE7XxOm7MMWidoPBdz07y9AY5W+pmzz3i8S+tPtip9lhdmoNqWvQRQ==
X-Received: by 2002:a17:90b:180f:b0:20d:4e7f:5f52 with SMTP id lw15-20020a17090b180f00b0020d4e7f5f52mr18916920pjb.119.1665770079544;
        Fri, 14 Oct 2022 10:54:39 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:da06:5604:594f:f6af])
        by smtp.gmail.com with ESMTPSA id jj19-20020a170903049300b0017f7819732dsm2011780plb.77.2022.10.14.10.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 10:54:38 -0700 (PDT)
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
Subject: [PATCH v2 1/9] gpiolib: of: add a quirk for legacy names in Mediatek mt2701-cs42448
Date: Fri, 14 Oct 2022 10:54:25 -0700
Message-Id: <20221011-gpiolib-quirks-v2-1-73cb7176fd94@gmail.com>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
In-Reply-To: <20221011-gpiolib-quirks-v2-0-73cb7176fd94@gmail.com>
References: <20221011-gpiolib-quirks-v2-0-73cb7176fd94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_105442_507552_B953F079 
X-CRM114-Status: GOOD (  14.01  )
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

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
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

