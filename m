Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD5EC4361B
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 06:01:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82DB3235F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 06:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82DB3235F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65MYLlVCvkDzODEEyEAL5Aa2Kvz4KM6OA+fBPoLDSQk=; b=es8rHpY2n44Bvu9dmpRiDgaqZJ
	bJlSvWAj5Xk4Jez9JRN/8ZaEhh2BmZHtakhYdQPqj0d7mE2kOjCqkdX6w3IfqkdRsBmJmyJVba+G2
	gd8JFR41+XnLLvYXWJJe6rnkm6rR1bDiwJrVExGJ4n1RX9yj82JlVEkRB32RTdhbUnx2LqzDNm9Pq
	Oi7eHhZM2ZrJSmyaZIzt62kKWsSvkDvG3fFdVIhGWdelV86TegnVJYZ5OPDDZKag1p3dLs/wRdiNg
	DGf94Vi/ZTe6RBj89XYPvuXK9LqE3j6YeyaewtzcVE1xBXw+8qvcWSHq9XnkxuxIU7yePWqIm+8yk
	SOWtR7ZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knF1S-0007DA-U7; Thu, 10 Dec 2020 06:01:50 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knF1O-0007Bx-HX; Thu, 10 Dec 2020 06:01:47 +0000
Received: by mail-pf1-x442.google.com with SMTP id 11so3033268pfu.4;
 Wed, 09 Dec 2020 22:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4grD7Th+x9uvL3+IHonwI2oI5c9zZZYb+5MfV4KDZ/E=;
 b=gkGXerWDDA3tvkrgZg4BEvG6viwI789Ynn/xm8OyQRtkugou/GXF3z6jdSCs8NVC/r
 8uRz9LBLxUo5h+hIXOtWHxE4e/6Ur3IR7gBJ4Kf8BIhFHAtbuI82xZdANjhSLZmgtyZq
 zl4I0Hd7TpXPMlAiD01D+NC1oiuQGSdw01MPWXMxG1KGTgQMe024aTf/+YP9LISI9biS
 C7rR64jMWalq2oT+eW2rCCC2r3p0vre11naZkAYNPMp7H45tiODd2yWgyG9+owJ945h0
 UsknU8PBZeeM+binvxaOpN+7JZIq4RUj3Cwvt9grVH3pwUa5SJc9ZJSZfgzOP+nYArsf
 QsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4grD7Th+x9uvL3+IHonwI2oI5c9zZZYb+5MfV4KDZ/E=;
 b=iy3fB7UzVMPcWX/BqlLbPZzeam2Cm+hUVTI4VZg6+6BQa4OmzMaDkZZt0KKxuPuHHt
 qhunREOLEnKJhRixQpF3MWzTdF+Ttl1cXNi5xmZCHZ0nrlJjBk2EzHM6IrxhxBpFY/XQ
 KJuzcXP/CpTN6KeoGD+4FqedUYb4sw7jAGtY1d1h8K9zzL5fm2t6Uuyxpum252tZ4R4C
 czHvjPOXZp0Hrn7Opd/TFhL5/SC1FnxNT9p83iNTeJaffPrkpuYjVgSjIfUDmiVPSGW5
 pifjkLmpuw5GomNVt+79s01HldWtzWWeeEuPyLZMZwx9WoM4IQSDTmK8s2FdrZEpqNgI
 OX6A==
X-Gm-Message-State: AOAM531rDN/WZyjyCRp/YGkrwp/AcNLzPXmjDn9fUOIeow6nDyVKveHB
 ypMy4wdvrLMy5mX4Xli8T6JZaRt/Q9aa8Q==
X-Google-Smtp-Source: ABdhPJylx9gv5wJD+ibbPwIlScTAN+p7MZxuuPn+5hvZpZkpvRzeTP38ph01WnkNv1Ks/6nz1q03Rg==
X-Received: by 2002:a62:1a47:0:b029:19b:c093:2766 with SMTP id
 a68-20020a621a470000b029019bc0932766mr5436901pfa.10.1607580104907; 
 Wed, 09 Dec 2020 22:01:44 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:568:b3ad:229b:9ee7:b946:7876])
 by smtp.gmail.com with ESMTPSA id j19sm4355377pff.74.2020.12.09.22.01.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Dec 2020 22:01:44 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v12 1/5] leds: flash: Add flash registration with undefined
 CONFIG_LEDS_CLASS_FLASH
Date: Thu, 10 Dec 2020 14:00:53 +0800
Message-Id: <1607580057-4408-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607580057-4408-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1607580057-4408-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_010146_769850_718C445F 
X-CRM114-Status: GOOD (  13.10  )
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
