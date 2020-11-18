Return-Path: <SRS0=HQvY=EY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC76C56202
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 10:48:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F34E5206A5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 10:48:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k1Z46n3O";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rx53iFEb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F34E5206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j12pWjUjxXVnbAIY6V9fDO43tZ0glSC3/XiVyupk3co=; b=k1Z46n3O8PdXCJseecWgDQ4EK6
	G4OgSQTpYD7W7mJrDoOPQy5g6k7bnAjAcnPThcES9gqFdt+HAskf/y8qAlVPTWJf77QFaTQf3p9+z
	S4bU7x/kJ1d2HsLTojhMgt2VkdRoIzbUv0Ww0tUF+BllTVSbjm5q++PaPTbdpUtMUvwLMX4N5/Snx
	jGY8KNGgP72A8TRGI8izHswdFU1IBr7KnEaIn3M53px6/A534mYBcL4pFshg0pqY3Rh1OZclG9FH3
	eZn/liVL3Pd0y6uRdhDgq2QsgiGYm9Ye3t6U5psfMJgViZkC/SX3wbtC78GaOj0g5fCJPreEY2nuB
	tiLn9uRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfL0l-0005Pq-SW; Wed, 18 Nov 2020 10:48:27 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfL0i-0005Ow-Kd; Wed, 18 Nov 2020 10:48:25 +0000
Received: by mail-pg1-x542.google.com with SMTP id r18so925646pgu.6;
 Wed, 18 Nov 2020 02:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FV/lAkBucS5LQIPKPYGSp0NZnz+d0fTaTfxhBzUFBmg=;
 b=rx53iFEbW3I/q2gRtazSrThT860eG+V9HPo8HUIDdfrfXp/BYCFjI5ARhOSoTZZQQE
 jTFqM2jjWKuVHzcqw7eKwSMMHi1ir4O/ZcvSQDsvnnT4JyzKEP/ms0IAkDRBeLqKNDV+
 L/xQOUP6usmIzuPcn7gZrAdIR8RpyWtU1oXafS6WyKpipY+MYLAE4STX95klLuyX504H
 j9T3Z7TCVpu17OwuG/G3kHuyNRjPsCBNEaxLPo50Odo1G5l/yattlG0pKBtQXUfPDfwn
 UClU98Fe8qycScNn+Gc+sCit3aWm+ZFszpgYULtwwl787/IcVyk+V6HzxOBT9SVtHRZC
 0A9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FV/lAkBucS5LQIPKPYGSp0NZnz+d0fTaTfxhBzUFBmg=;
 b=mYa7FI5CkEnjcZ7f63oZgQfVFa+fo+xMucLC3x+8weG89F7jiayiqJAhnrWLPOoKex
 0jEaI4oflhujgOCuGgEam0LlotEbwpTnD/DmuAvCAWQ6riV/Vq3c2OiSxIpc8D+LMAFr
 uQnl1HK/sYchdcqNnRadmWiOA5jNtjpSBYE+nYt+5lcWGvfrpqAdnK3l5rQFGCI8REeK
 +gGRNeYesJhRVg6GcA5GWEnhjjKj2e91TzlG1d9IdAHYl0o0m832LuyITKeLlScxMvlJ
 m6iUhZujdURJDR752m/w6HGrH4niedd62b7+w10x/b80yDjNTR5xaBhQZ7kbD8MaBe4U
 TELg==
X-Gm-Message-State: AOAM53325SFFRJbH69fwHlMDRDw2+7HSblkM9/B21b9hzNzvtlrOG8ZH
 rSTZz+Yov+wUn7Cs4uKkp3k=
X-Google-Smtp-Source: ABdhPJzEaEWsY6qbN+SszSro9Y+IgIerXYDSz7bt4XbLz3dBTUtR8LM3Yt/i9pzbl5i4r0TfU3vSyw==
X-Received: by 2002:a63:6305:: with SMTP id x5mr7690356pgb.269.1605696502540; 
 Wed, 18 Nov 2020 02:48:22 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:575:2174:b7aa:599:e762:e486])
 by smtp.gmail.com with ESMTPSA id
 a3sm25345154pfd.58.2020.11.18.02.48.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Nov 2020 02:48:22 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v7 1/5] leds: flash: Add flash registration with undefined
 CONFIG_LEDS_CLASS_FLASH
Date: Wed, 18 Nov 2020 18:47:38 +0800
Message-Id: <1605696462-391-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_054824_684666_F066359D 
X-CRM114-Status: GOOD (  13.11  )
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
 include/linux/led-class-flash.h | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/linux/led-class-flash.h b/include/linux/led-class-flash.h
index 21a3358..4f56c28 100644
--- a/include/linux/led-class-flash.h
+++ b/include/linux/led-class-flash.h
@@ -85,6 +85,7 @@ static inline struct led_classdev_flash *lcdev_to_flcdev(
 	return container_of(lcdev, struct led_classdev_flash, led_cdev);
 }
 
+#if IS_ENABLED(CONFIG_LEDS_CLASS_FLASH)
 /**
  * led_classdev_flash_register_ext - register a new object of LED class with
  *				     init data and with support for flash LEDs
@@ -127,6 +128,41 @@ static inline int devm_led_classdev_flash_register(struct device *parent,
 void devm_led_classdev_flash_unregister(struct device *parent,
 					struct led_classdev_flash *fled_cdev);
 
+#else
+
+static inline int led_classdev_flash_register_ext(struct device *parent,
+				    struct led_classdev_flash *fled_cdev,
+				    struct led_init_data *init_data)
+{
+	return -EINVAL;
+}
+
+static inline int led_classdev_flash_register(struct device *parent,
+					   struct led_classdev_flash *fled_cdev)
+{
+	return led_classdev_flash_register_ext(parent, fled_cdev, NULL);
+}
+
+static inline void led_classdev_flash_unregister(struct led_classdev_flash *fled_cdev) {};
+static inline int devm_led_classdev_flash_register_ext(struct device *parent,
+				     struct led_classdev_flash *fled_cdev,
+				     struct led_init_data *init_data)
+{
+	return -EINVAL;
+}
+
+static inline int devm_led_classdev_flash_register(struct device *parent,
+				     struct led_classdev_flash *fled_cdev)
+{
+	return devm_led_classdev_flash_register_ext(parent, fled_cdev, NULL);
+}
+
+void devm_led_classdev_flash_unregister(struct device *parent,
+					struct led_classdev_flash *fled_cdev)
+{};
+
+#endif  /* IS_ENABLED(CONFIG_LEDS_CLASS_FLASH) */
+
 /**
  * led_set_flash_strobe - setup flash strobe
  * @fled_cdev: the flash LED to set strobe on
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
