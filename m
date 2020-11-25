Return-Path: <SRS0=wG/x=E7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24625C64E75
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 10:51:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A02D4206E5
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 10:51:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OTSAxsZz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m4UOb7/V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A02D4206E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdnlisdRtTTfl/yF/65Ry08B2d4Vh2eIX0ioyoIbRxQ=; b=OTSAxsZzPRjMiE0mGlhumVqy4A
	Zl5DoKEisT7ig0Ydi5aw6TNo3fANdMZSiqON1qAYXo6Kb9dp69nroyOwdZHmGZG2OLiLkBffwqvUB
	TuQvy4R/7jj571yXmztMqyPZo/GnBY55BAwPyv+qIgkDsc00LqsYG5oy0sg+g1OjIiwg1HI6mbkVG
	avxxl5fRk/mgHLeJAbEX3ypKWzlvminGCTO7dlwErqcBzF4WccQsiyPlsNFfgodsNkDDqX28/Uo4z
	MZBA/EzlLwuJDxz+//XXzx9QmZCNMPUta1sMyhkqsqq8YuhNtGrbobYi/Lrz6E7l5u6YwQriULiD+
	psKniEyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khsOk-0003mv-2r; Wed, 25 Nov 2020 10:51:42 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khsOX-0003i7-Ic; Wed, 25 Nov 2020 10:51:30 +0000
Received: by mail-pl1-x644.google.com with SMTP id 5so914586plj.8;
 Wed, 25 Nov 2020 02:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HdfyyrxnElJwDt41ZW/Dyzf78ymH1BXPai7vmDeW4Ts=;
 b=m4UOb7/VuH/ZpMia0pBkb2WT64Ij3iHzjUmoXIe0t8RPFuQEDl0r7AyTk0NcMWm6Dt
 h/P9kYiwx9872GvQe7T8PQlVevCi6IhnYBVrhDly1rWST+s7gxzRU6QL/6Gf1Dr+Hd93
 DT7DAMZrp+RYNU244figNQnEYOdHMa9aokj81lSMrs1q4fnuYEDs/Bl9kp3plKUz1X4U
 CbvvaO6KReoAl2Lrtz0Mj9mnuoBMRI7XrLPib3mIkYtKPjrE6uk86TGiISEuvqMlstsS
 ixRXUnEMf5vfUKl9DbNzEVnxEYMpH42F27vO/TF2rEmJ2DZD9euD+jRhxAqPEoD3Cjs4
 4Clw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HdfyyrxnElJwDt41ZW/Dyzf78ymH1BXPai7vmDeW4Ts=;
 b=ZtZyEqJfgBVcrIhp17jWlfVtbQ/hR6BbGK6EDhwTmZnhf3/5FWoTyt07MsllOoAjfR
 K3T0IJjXP8iunsL1/ywXcwt+4/P1nq+2JdbjBP/VBNdyPVVgsaxcuxHanNsr667lb6QM
 GYTNWJMz7O5NwbR+X52d3VbbzdXGbWg1R1XUmBOLU1d88XdvET2FiDa174Ian+ALZOnJ
 P/AVOsM1e6fnLGsz4x0fgFglbYSzVIaQuJqBeRhHYz9OUsNAsyycKJhy8KXbIFvFZu48
 FrzqJE9CUxoCHsmSRt1YSYC/mtBEjDJJumUyGRCuNC5Nf7pbHNMCyxHcgY1wl+76lzuG
 OmBQ==
X-Gm-Message-State: AOAM532ggo5+joAR77oLQvt8SaUIjKfJX/jfle+HFBv+uQnWKDdlHXQJ
 uu3zi97E5Z2Ej3PYOx1y5tKRudNGxcY=
X-Google-Smtp-Source: ABdhPJwynFK/qp9LVcEP18rNXNCg2T/QIUC6iHWSoWqS09knnetHnfVquPSLM9sLRlkCqggDKFoUvQ==
X-Received: by 2002:a17:902:b283:b029:d6:b2a7:3913 with SMTP id
 u3-20020a170902b283b02900d6b2a73913mr2706376plr.54.1606301487900; 
 Wed, 25 Nov 2020 02:51:27 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:48b:4d7:7339:ae2d:114e:3859])
 by smtp.gmail.com with ESMTPSA id
 j10sm2049520pgc.85.2020.11.25.02.51.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Nov 2020 02:51:27 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v8 1/6] leds: flash: Add flash registration with undefined
 CONFIG_LEDS_CLASS_FLASH
Date: Wed, 25 Nov 2020 18:51:10 +0800
Message-Id: <1606301475-7030-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606301475-7030-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606301475-7030-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_055129_706284_F2CB10EF 
X-CRM114-Status: GOOD (  13.41  )
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
index 21a3358..5f36eae 100644
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
+	return 0;
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
+	return 0;
+}
+
+static inline int devm_led_classdev_flash_register(struct device *parent,
+				     struct led_classdev_flash *fled_cdev)
+{
+	return devm_led_classdev_flash_register_ext(parent, fled_cdev, NULL);
+}
+
+static inline void devm_led_classdev_flash_unregister(struct device *parent,
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
