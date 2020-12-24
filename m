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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB11BC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 01:48:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 504C32256F
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 01:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 504C32256F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZ6jLJU2QsKeoLD+qOU+O5B42ez1m+Ewy6SihjKCgI4=; b=wpB0A0XNUK2PB3s0Irh+FQpsL8
	S8em+atNQm0relhusFhDD2MKPCe1bgyPAU1mwSNsPa50XjYaOQkVNZNdtcBBfHwIYFME6BBycBkVF
	CAOVI1n+hUK8UE032e3dp0KmqxI3wVDbe47Ob82dkhFhJeAYd2D3w+QJlmUPUDM9OlgS+N6JRfx7+
	7EGiJcNvxTQP7VDcyfylZTlhvvrMvj5tfMgsR2sjaa0SMRVeMQSpDWm63s+wenVss5gIeaulxyXv6
	BxsxiMf1DVc+O2s3CInkDDLr6YvzxyMMrWnuy/T2+VN8hOE1Q4GWQszJAZw86Pad8x7gTtCR1CqPG
	cgYPUqCg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksFjQ-0006Fo-SR; Thu, 24 Dec 2020 01:47:56 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksFjB-0006At-4i; Thu, 24 Dec 2020 01:47:42 +0000
Received: by mail-pg1-x52a.google.com with SMTP id v19so655964pgj.12;
 Wed, 23 Dec 2020 17:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=p0JP7C0xlsVyWNi+wA1zhFtAvLDEH/NgpOed0jz9w0E=;
 b=eBgxRBB0KRgn8u7GYCIB0UCfgreqvLGU/UL4FLCxZeCRQ/LtTC/4AdEO7TmR7b02U8
 K3FJK80AKQ9N87H5pNyBHwojP1KPuKxSdlnfBa1bKTfY2bf7ZKw9+AY7A5sLt8+wLUmY
 oImuWUKb4EDYCwIvA8++SaG+291y1UhN8h6uNnvecsJF2gCr8Hd4YSsHzEViMz45/42D
 QMXYJQGE3/V6LCi/Q3RxXHtxkfZP7guFiNerw0xEwfwoBCiUA/QqrXc5vKBcmy83GqeL
 baIYMZREt1xRqJeTpi8VrmaPAhmhkE3KgwBs4gUtMVlwKCAaxoATh31CNlA/A2scaO6m
 +wSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=p0JP7C0xlsVyWNi+wA1zhFtAvLDEH/NgpOed0jz9w0E=;
 b=eMP9J7PU4CodaKnlUIM1BYndAyF+kwbBeUmmVhkQL2zXSbg7XcQTYGbQni7G3Hr947
 p3I1k/fh7f8sXBZHJGgCtziwQz9gjv3FdWuCUzjCOYNNhyNlKafTNUUYmO/C+aAGFhak
 xOB1swd/ZjFLzudcgVCxzeHkvBcUofGoZ2IlD60phnVaEQ08wSQpOYtKJWN8bjpoYY8N
 QmrpHkdptziQ4SqIiUscOJR0XUFYmIDYwW0eGGEY+1duTS8R/bIuFf4LpL8bSlfOf354
 90GWFGi9oeabeMrZEa2FZ0U93I/wXuiLJe11PRgvRl6Y4QTSkvPpxE1QYVh3vZpRqXKe
 dHiQ==
X-Gm-Message-State: AOAM530+ebwRUJVkTOeBvz3icSmf/LS+52JJp/GHIv5e0D19cRQlWSwR
 xQ+7pgRBoClO6ZtYRHo7xO4=
X-Google-Smtp-Source: ABdhPJx62bVe82WYr6hgjMs1G6eeoXDGGKeKDFiRTGKlweti7hgXQmHETwa5vmTDCxJX9NiciZKc3g==
X-Received: by 2002:a63:4c52:: with SMTP id m18mr19470746pgl.280.1608774459106; 
 Wed, 23 Dec 2020 17:47:39 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:492:86cf:7e4a:b265:b394:eefd])
 by smtp.gmail.com with ESMTPSA id h16sm26604516pgd.62.2020.12.23.17.47.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Dec 2020 17:47:38 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH resend v13 2/5] leds: flash: Fix multicolor no-ops
 registration by return 0
Date: Thu, 24 Dec 2020 09:47:17 +0800
Message-Id: <1608774440-21655-3-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608774440-21655-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1608774440-21655-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_204741_385240_E02ECF65 
X-CRM114-Status: GOOD (  14.77  )
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

Fix multicolor no-ops registration by return 0,
and move the same registration functions outside of #ifdef block.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
---
 include/linux/led-class-multicolor.h | 42 +++++++++++++-----------------------
 1 file changed, 15 insertions(+), 27 deletions(-)

diff --git a/include/linux/led-class-multicolor.h b/include/linux/led-class-multicolor.h
index 5116f9a..210d57b 100644
--- a/include/linux/led-class-multicolor.h
+++ b/include/linux/led-class-multicolor.h
@@ -44,12 +44,6 @@ int led_classdev_multicolor_register_ext(struct device *parent,
 					    struct led_classdev_mc *mcled_cdev,
 					    struct led_init_data *init_data);
 
-static inline int led_classdev_multicolor_register(struct device *parent,
-					    struct led_classdev_mc *mcled_cdev)
-{
-	return led_classdev_multicolor_register_ext(parent, mcled_cdev, NULL);
-}
-
 /**
  * led_classdev_multicolor_unregister - unregisters an object of led_classdev
  *					class with support for multicolor LEDs
@@ -68,13 +62,6 @@ int devm_led_classdev_multicolor_register_ext(struct device *parent,
 					  struct led_classdev_mc *mcled_cdev,
 					  struct led_init_data *init_data);
 
-static inline int devm_led_classdev_multicolor_register(struct device *parent,
-				     struct led_classdev_mc *mcled_cdev)
-{
-	return devm_led_classdev_multicolor_register_ext(parent, mcled_cdev,
-							 NULL);
-}
-
 void devm_led_classdev_multicolor_unregister(struct device *parent,
 					    struct led_classdev_mc *mcled_cdev);
 #else
@@ -83,27 +70,33 @@ static inline int led_classdev_multicolor_register_ext(struct device *parent,
 					    struct led_classdev_mc *mcled_cdev,
 					    struct led_init_data *init_data)
 {
-	return -EINVAL;
-}
-
-static inline int led_classdev_multicolor_register(struct device *parent,
-					    struct led_classdev_mc *mcled_cdev)
-{
-	return led_classdev_multicolor_register_ext(parent, mcled_cdev, NULL);
+	return 0;
 }
 
 static inline void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cdev) {};
 static inline int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
 					       enum led_brightness brightness)
 {
-	return -EINVAL;
+	return 0;
 }
 
 static inline int devm_led_classdev_multicolor_register_ext(struct device *parent,
 					  struct led_classdev_mc *mcled_cdev,
 					  struct led_init_data *init_data)
 {
-	return -EINVAL;
+	return 0;
+}
+
+static inline void devm_led_classdev_multicolor_unregister(struct device *parent,
+					    struct led_classdev_mc *mcled_cdev)
+{};
+
+#endif  /* IS_ENABLED(CONFIG_LEDS_CLASS_MULTICOLOR) */
+
+static inline int led_classdev_multicolor_register(struct device *parent,
+					    struct led_classdev_mc *mcled_cdev)
+{
+	return led_classdev_multicolor_register_ext(parent, mcled_cdev, NULL);
 }
 
 static inline int devm_led_classdev_multicolor_register(struct device *parent,
@@ -113,9 +106,4 @@ static inline int devm_led_classdev_multicolor_register(struct device *parent,
 							 NULL);
 }
 
-static inline void devm_led_classdev_multicolor_unregister(struct device *parent,
-					    struct led_classdev_mc *mcled_cdev)
-{};
-
-#endif  /* IS_ENABLED(CONFIG_LEDS_CLASS_MULTICOLOR) */
 #endif	/* _LINUX_MULTICOLOR_LEDS_H_INCLUDED */
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
