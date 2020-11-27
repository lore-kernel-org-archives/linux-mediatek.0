Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8CEFC63697
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 03:29:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 774FB20782
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 03:29:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GdyD42Su";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n+VrhTbd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 774FB20782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n672u02t7a35gPYH1tR/uOvshFT6zPuKFe9+kivsTV0=; b=GdyD42Su538Co0X8Kg3k9nymCY
	w2jc4e6hI50b4yVpuw3jo51oJ2BA0yjIHYdR+0CLjU8oJmZ8leeI4t8osPIRcIKphJ6kG19U++TOG
	SJ4N6f/SjULLtWY2NRNeMEzVWXjZuZ/0haFuSsIEflFa/Pu4W46U9EB6LVNqYafaHPj6WEcMRhpam
	vNy4kctL8Ari8oCdwgT2Lf2KhfFb7+wPjjdcufFRiPR4MosOen3QRbhG8FG4Z9rf46y+I2I1lIwaC
	dDHeYLdw66S7CljTKnh2LedejzTN9XckxQ+oISLesuO06XC6wwufSLYgjK09sP+cEzGOU/0MQRwQB
	4LcayZcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiURw-0001uA-Gh; Fri, 27 Nov 2020 03:29:32 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiURb-0001oM-K9; Fri, 27 Nov 2020 03:29:12 +0000
Received: by mail-pg1-x542.google.com with SMTP id 34so3195421pgp.10;
 Thu, 26 Nov 2020 19:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=COEm4ghbDKgbcUxg3aR1shfZUSf7tqGokicggJyh/18=;
 b=n+VrhTbdq6A1PHfZrcp3AriHw/pLkqG4tG9zWOzJLIcivAWhAxsgyC6quVBksFkFYO
 AeMOo+TA8ffNW6TQryGgIaszq1zkbbd3feMwx//mC1RiiN6L4Js5NrXdW+wGMasIMYH3
 LMJcqLOhOXIH2H7OfvFg7oj9ZwNqiNqs/sVSiIHToyUY+VCvdTTrdLhSCMqe/G4wMQaO
 3srAqKN3yJ0QRbVhgkgkRNNF1lrwnH6Oqf8BsgVczCRMYlUuAmZCfiH+VAiBPZaL7np8
 4Kx0eO1cfuUok0lzMEk79wi0bhRJPqtWfkmQmE4z8ifzxPrF3k+qoaC1EC1hYFXymSlJ
 PlFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=COEm4ghbDKgbcUxg3aR1shfZUSf7tqGokicggJyh/18=;
 b=nTlT84jkrdJE++yM1/aTiPneT2DBMDdzFQgpdwGsth1eCxaKdvxa2mSFPQS+1vrKYl
 LKEY3O9E9uXfYlBfEDM2MhcwS/qEDEIvkEVXUCPukja6ApekcXhh6viHuWbUIHc6V7tP
 FJmqFidogR2J4Xx8FCKafRbK0r14y3po4BWQ3AWYMBtfZUIPudZ0QHhkfg5AupPlsrcz
 2pZ71lc6DiSif7yUaIxn74ZkjagH8QTDn1hmFXgz0lFgipuy/rSBWIiZzHgjWVK01cg3
 khF/rh5m7JvbomKs3HNEg2CbaCjNq4jkD89nLP3kpZ84r6OXZ7bIe7Xo05Vj2EZYUh8f
 LgpQ==
X-Gm-Message-State: AOAM531fAo8H7shnf5zfCtHiABAhmHDmYUAFmrtEyiP/umVyD7ZkT9L+
 wqpI/rAIsbvCxk1GWBmTNjb+sfIfW+elsw==
X-Google-Smtp-Source: ABdhPJweoiNIUMUSj5R2uDgHAMqootGvrX3+C8pyaYEEyNjxrTVhF3OvyhH9niCWzgZ3EfsA/aNZKQ==
X-Received: by 2002:aa7:93bb:0:b029:198:2fb2:43d5 with SMTP id
 x27-20020aa793bb0000b02901982fb243d5mr5208244pff.27.1606447749627; 
 Thu, 26 Nov 2020 19:29:09 -0800 (PST)
Received: from localhost.localdomain ([101.12.27.127])
 by smtp.gmail.com with ESMTPSA id m73sm6063962pfd.106.2020.11.26.19.29.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Nov 2020 19:29:09 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v10 1/6] leds: flash: Add flash registration with undefined
 CONFIG_LEDS_CLASS_FLASH
Date: Fri, 27 Nov 2020 11:28:51 +0800
Message-Id: <1606447736-7944-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606447736-7944-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606447736-7944-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_222911_836057_9FBBF557 
X-CRM114-Status: GOOD (  14.21  )
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
and reuse same registration functions no matter flash class exist or not.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
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
