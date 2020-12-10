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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99DCC4361B
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 06:02:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 865EA235F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 06:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 865EA235F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZ6jLJU2QsKeoLD+qOU+O5B42ez1m+Ewy6SihjKCgI4=; b=zW36vqlVKEucX9OU836nGOn5w7
	ZswyKZnShllhzoqZOVzK1toTlv/qXDl8HUId2dLy89Eot/P14DNR2yDXTmSxe9J3/HVFx2rfXOMeT
	uSs5DgivQpwcB1mUIWDmeOdkKKQiMa2uk+MuJy880DgNSqsgWdEwESDn7fd38GqVVcOelpxTCPaOr
	nGRHBKSWWJsltPsLobxYPPci8TFEuiENVVmV0gsGVNKhgJXe6SkysXajAvjoPGpjxwidI/1Wp+V/k
	Vk9lZmY7UOhejP3nCAmjLJMKyZXnJZ0YYMS38EWKq8Mz0PI+h6mKkb+VFq/EsHuigvdrjGRMXgN8Z
	Nm6hjuHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knF1Z-0007F7-Qp; Thu, 10 Dec 2020 06:01:57 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knF1U-0007DD-H3; Thu, 10 Dec 2020 06:01:53 +0000
Received: by mail-pg1-x544.google.com with SMTP id o5so3197476pgm.10;
 Wed, 09 Dec 2020 22:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=p0JP7C0xlsVyWNi+wA1zhFtAvLDEH/NgpOed0jz9w0E=;
 b=cR/JxMMuhbeJcPwCkqBgdDyFnrMKBa0+fG4l1D6nKLGXwLAnP/YUpXmHxiIae+9R2t
 F1naM+jlFHUjf4rvun+WO8r12gxABYEgjSKOH6/H/xqpQO3UsemB/PoRUCV8ili5gERt
 v00GhE1kgrIOmro4IduGfAbyBWAZJK+ZGemOvq43Q/JjMk6QOY/t2bQEqfrv62Li8mPC
 yeT3vjfgJxqM5xa2b3UIu3jEMfYVqN4dMcCaULpup1wHMlrjOugyGvOus8Eev58uKSfP
 RfIzQdCf83TBs4S0Nlz8qQEwqZ14ZuGzEghp70JJl03vBiPkRyz2RnAWlNiLqW/7SVdt
 r/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=p0JP7C0xlsVyWNi+wA1zhFtAvLDEH/NgpOed0jz9w0E=;
 b=LgjGfw+toSVUTu6xD0WdlnDE82dB6GLKtDlNbt9uz6zrnyY3aM573opmJLkieRQs8z
 4su//znQNpm6K0VKVIk9hI5SI/V7srlz06wumtE89mq/hRsVmB1JB3EGkf+7cLd7u0nM
 mTGqkdKyHOmgBk0BvEVmvsDA45P3Dzsh5Oiz1+sGxYNnAipWsq+mWN1MpDF2elc6YL1C
 LTw9FVLwu01jUnmwgTP2PrW+XgPvLrWnOwfS/WEhJW/PF3h+UVBOQpPqGDUUxGGg286V
 ulPJ7POf29VuJnU2SGB3cfeN2yE0/6eABTX0sBQhA/xHBxdeh74VuObgTs6D2x+9yCRH
 fe+Q==
X-Gm-Message-State: AOAM532eozzg02FIGENZoXGSJk0qwnQPq1XvVNDpCWILbgFACWoPamGI
 XlR0LG1girmQHg+dc6QWzZA=
X-Google-Smtp-Source: ABdhPJyodIySalE6+AOcU90QrCtBp+oBtWOZU4KNyH6gmjj0Ts8EWEXN9Ghlh9Hupbb0ZiBMMaDHXA==
X-Received: by 2002:aa7:9af4:0:b029:19d:975a:3ef2 with SMTP id
 y20-20020aa79af40000b029019d975a3ef2mr5228990pfp.5.1607580110404; 
 Wed, 09 Dec 2020 22:01:50 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:568:b3ad:229b:9ee7:b946:7876])
 by smtp.gmail.com with ESMTPSA id j19sm4355377pff.74.2020.12.09.22.01.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Dec 2020 22:01:49 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v12 2/5] leds: flash: Fix multicolor no-ops registration by
 return 0
Date: Thu, 10 Dec 2020 14:00:54 +0800
Message-Id: <1607580057-4408-3-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607580057-4408-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1607580057-4408-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_010152_592750_FCCB3616 
X-CRM114-Status: GOOD (  14.35  )
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
