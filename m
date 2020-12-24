Return-Path: <SRS0=bfHw=F4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B06C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 01:48:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 036382256F
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 01:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 036382256F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65MYLlVCvkDzODEEyEAL5Aa2Kvz4KM6OA+fBPoLDSQk=; b=mdF8VLxnpH/vOU9/giXCfs3e1z
	KAMdAr4MOrfdgJXLCVwGi+FjyxfIc33QNSLEH5MBdXe+nekaEfG++cBTwUe90OuBT5IS4h+3tZpTX
	5TBnCtc5k0bcrZ9mcWlja9tL7jkWrnxzFWzglTrl2mo22fsFE69E+7FAN0zQjqAK2Ybrg91vRO+3w
	H17RJKYbGOcwbR9slol6EECNc8LEepg8UfxT549ypXDEDXjNdyi8qqVcUJnS4T3H1dNRtFIfolRV3
	15j+Wrn7eaXC0dP2oz86QD0uNqB2Q2m+hZU7nWDju55HaOS8hoBhEFWziqH4g7AzTHHZMY9nuVwIl
	7zakBR8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksFjL-0006EE-JT; Thu, 24 Dec 2020 01:47:51 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksFj6-00068i-PI; Thu, 24 Dec 2020 01:47:38 +0000
Received: by mail-pf1-x42c.google.com with SMTP id q22so432607pfk.12;
 Wed, 23 Dec 2020 17:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4grD7Th+x9uvL3+IHonwI2oI5c9zZZYb+5MfV4KDZ/E=;
 b=EjL5E9kMWETqsHTZwHEYdtXlpcGPHPRCvH1PjtnZpcSJsl5yoCyi89KVo/05rxUmqv
 gtvqq7uGkTwDlpqLNPsY/FOZ37aXh7Hefgm7iVocDBtzfv6YA7gaccGgAO6VqqAAznJM
 LBbQc2YINXB7NbsaDiZlVHY7dfvdndjNDsxCu7GqjYwijLEywo7cefYi7Kc/OAxdqbOV
 l0O2ylM39Dqc8UXuyirMpxNC9wKAXuecWww4fXaa4ez4Yf09diP7wosUqdUbxsbRb9Di
 Zbj0tJiG6a1nxSsD1V2UwIDzi8gAYVuBW0HcDCFea++zwJSp1zj0i1ruz8Kc0aQJao/D
 kb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4grD7Th+x9uvL3+IHonwI2oI5c9zZZYb+5MfV4KDZ/E=;
 b=iAzWI7ZwAkpeqslnumfReko8hRPDj646A2MM/IZubFBTVG6EWTYcRiAN3EJ8qFOO5R
 V6uybCPYwTzHWcjGKokugkrMYNmB9cPFTB7VkQLYbKWs8SYUg38qalo4NyAn6dKzE3Ya
 2FrTW6v/XhiKyczjTd6Kd2Cd7MbFuHSclfsZZzcNwIlBuKwNw08/EJolTjnKaj6rpbMX
 w/YEPvyt1iLrpRp6SBDXYthbsrU00fhiHr7m3wt7KqOyzX8+zQKY83siAe45SRXyzPKR
 98DMb1T0d2UmxaIMglb+cKLrNwvtl5iSCSlI+722nBK7P3f3B/LEWtVBy64i3vuqRLqI
 Y4SQ==
X-Gm-Message-State: AOAM532OMk+oY8aCqvR5eYgZslkhmBxxdEvF7pSmEcAe/PpNzzcxmNtr
 efAn0sxjRLTqZB/dT1Sr100=
X-Google-Smtp-Source: ABdhPJyByxxF0CjtLO9FmSSx8jJR9wTpt4c1zuxKIyqJsXUfOOUS4jcQAexO8WWWB6K/6Cwo8djkvQ==
X-Received: by 2002:a63:445a:: with SMTP id t26mr26780548pgk.402.1608774454681; 
 Wed, 23 Dec 2020 17:47:34 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:492:86cf:7e4a:b265:b394:eefd])
 by smtp.gmail.com with ESMTPSA id h16sm26604516pgd.62.2020.12.23.17.47.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Dec 2020 17:47:34 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH resend v13 1/5] leds: flash: Add flash registration with
 undefined CONFIG_LEDS_CLASS_FLASH
Date: Thu, 24 Dec 2020 09:47:16 +0800
Message-Id: <1608774440-21655-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608774440-21655-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1608774440-21655-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_204736_929146_BB96041D 
X-CRM114-Status: GOOD (  13.39  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, dmurphy@ti.com, linux-leds@vger.kernel.org,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH,
and move the same registration functions outside of #ifdef block.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
---
 include/linux/led-class-flash.h | 42 ++++++++++++++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/include/linux/led-class-flash.h b/include/linux/led-class-flash.h
index 21a3358..612b4ca 100644
--- a/include/linux/led-class-flash.h
+++ b/include/linux/led-class-flash.h
@@ -85,6 +85,7 @@ static inline struct led_classdev_flash *lcdev_to_flcdev(
 	return container_of(lcdev, struct led_classdev_flash, led_cdev);
 }
 
+#if IS_ENABLED(CONFIG_LEDS_CLASS_FLASH)
 /**
  * led_classdev_flash_register_ext - register a new object of LED class with
  *				     init data and with support for flash LEDs
@@ -98,12 +99,6 @@ int led_classdev_flash_register_ext(struct device *parent,
 				    struct led_classdev_flash *fled_cdev,
 				    struct led_init_data *init_data);
 
-static inline int led_classdev_flash_register(struct device *parent,
-					   struct led_classdev_flash *fled_cdev)
-{
-	return led_classdev_flash_register_ext(parent, fled_cdev, NULL);
-}
-
 /**
  * led_classdev_flash_unregister - unregisters an object of led_classdev class
  *				   with support for flash LEDs
@@ -118,15 +113,44 @@ int devm_led_classdev_flash_register_ext(struct device *parent,
 				     struct led_init_data *init_data);
 
 
+void devm_led_classdev_flash_unregister(struct device *parent,
+					struct led_classdev_flash *fled_cdev);
+
+#else
+
+static inline int led_classdev_flash_register_ext(struct device *parent,
+				    struct led_classdev_flash *fled_cdev,
+				    struct led_init_data *init_data)
+{
+	return 0;
+}
+
+static inline void led_classdev_flash_unregister(struct led_classdev_flash *fled_cdev) {};
+static inline int devm_led_classdev_flash_register_ext(struct device *parent,
+				     struct led_classdev_flash *fled_cdev,
+				     struct led_init_data *init_data)
+{
+	return 0;
+}
+
+static inline void devm_led_classdev_flash_unregister(struct device *parent,
+					struct led_classdev_flash *fled_cdev)
+{};
+
+#endif  /* IS_ENABLED(CONFIG_LEDS_CLASS_FLASH) */
+
+static inline int led_classdev_flash_register(struct device *parent,
+					   struct led_classdev_flash *fled_cdev)
+{
+	return led_classdev_flash_register_ext(parent, fled_cdev, NULL);
+}
+
 static inline int devm_led_classdev_flash_register(struct device *parent,
 				     struct led_classdev_flash *fled_cdev)
 {
 	return devm_led_classdev_flash_register_ext(parent, fled_cdev, NULL);
 }
 
-void devm_led_classdev_flash_unregister(struct device *parent,
-					struct led_classdev_flash *fled_cdev);
-
 /**
  * led_set_flash_strobe - setup flash strobe
  * @fled_cdev: the flash LED to set strobe on
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
