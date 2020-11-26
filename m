Return-Path: <SRS0=o4uA=FA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57715C56202
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 11:53:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D465A20678
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 11:53:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QgHFEomn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pDVDNLUE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D465A20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CNuuPXG8iuSVCSGA7fJLSw2wGZTAwJlaggi5++5JGeo=; b=QgHFEomn4ycAFQNENFkD5IGR33
	8ZLrGcXutBZlTaJrbl1PDJLdOjf5i3fJ7h8hjfHBVd3NGNkusLSOVEWiSBeL9s74IJK18IJtWA3kO
	6RDUbmIV//QeuyDtALAWLX0w6HyeM8sQlk/X08Vu/rjJ/JtQ1xMyVkYYCI2DA5keKs1DD0i9DP2Fb
	oy16AopVt5FmS3hw57yVmFyF/jbmqapID1CXBwYSCvghfH+bKdZXNg6S58hqIvO5iurJRcYh6bGdA
	kvucrARE3Yw9S91nFldVLeqTckdlmxJiHEM8Yf434ViGVZV7quQ4WxbyRD/qPxQRNHYLURmHPusiG
	aU9k0P6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiFq0-0003cm-Cx; Thu, 26 Nov 2020 11:53:26 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiFpm-0003ZO-HZ; Thu, 26 Nov 2020 11:53:11 +0000
Received: by mail-pg1-x543.google.com with SMTP id t21so1575496pgl.3;
 Thu, 26 Nov 2020 03:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=oEeUSW72/UraPj3Y97BxSpWwyxMnnt499YGisi4BDys=;
 b=pDVDNLUEvsldJ9njbjYI6V9CjC3KkCVdi7Ufrrr7R/rUs33hIAE4bk6Mc4ciixfagQ
 8DPRCX6vVW4/3iBfPh9GXD8CbGtYAk0m0Rbo5og0ecGhYDQ8UPiqNgubaJ25+q+N/j4c
 kN7k4y9lTOjTDtxZ5khDodGsZ/gsQs6Ia5oB+pe74kywYYdaKwJmi3qmHVS/xk6lgzpb
 RbuCdOcWCsypeyRPlHn8kFccgP8GoVrk36QPAm8hSh2oYRvtz73yDUPyAEovDffdCzXX
 7o2WWIl5Gnrnf/FVGdq4KY2gjajN/XHTIPZ8WCb51UVOez2Flylc0AYLQCBiIeu59BtO
 x6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=oEeUSW72/UraPj3Y97BxSpWwyxMnnt499YGisi4BDys=;
 b=aRMlkkAVKCCQu9uDxqdO3Lj3eXtCeGxu7D75GoGr7Am0DSNiATzHerJY58HXX+vsCY
 iLeFSo9mBDYdTtoEP9uLAwE+rVM8Z9YAkyhYhfHm7OF/spo23yD2Bc4IwnMGfT2euYsh
 zuk7iD9Iu4MfDfxTjO7SGJC6dJq6Oy+jftf3wQEVRcAX7Qfu3apNLpahQW+bittJ79v5
 LcobO1lyDpkKDXcmL/CwGgQtkACj7nQbtd2oGy6YqcOgaRDY97j/Y7YkughjBBPQF0u5
 eYwuOTTULgfO5Xv7O89Yb8Qh8alw0tZFGn/4Et/qnq3mfgKf0zUj7kenVH6AEohWNHps
 Vcnw==
X-Gm-Message-State: AOAM530w0kNcWGr7PrBeRTCXozDf9yRcYG21Ke/VHHy4dm2+R0917Ur+
 b+iRVvAJMtPL6jed3OexecY=
X-Google-Smtp-Source: ABdhPJxblqZsNJ9Xe5ePQ8D0+uIMbnCdhZlBnqF99L+HdvMAEuCFbcMgozJpakEMCcp5oRYUcjmFaQ==
X-Received: by 2002:a65:6896:: with SMTP id e22mr2293865pgt.318.1606391588608; 
 Thu, 26 Nov 2020 03:53:08 -0800 (PST)
Received: from localhost.localdomain ([101.10.31.14])
 by smtp.gmail.com with ESMTPSA id r4sm4721617pgs.54.2020.11.26.03.53.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Nov 2020 03:53:08 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v9 1/6] leds: flash: Add flash registration with undefined
 CONFIG_LEDS_CLASS_FLASH
Date: Thu, 26 Nov 2020 19:37:29 +0800
Message-Id: <1606390654-6075-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606390654-6075-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606390654-6075-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_065310_824855_D71358A0 
X-CRM114-Status: GOOD (  14.12  )
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

Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH

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
