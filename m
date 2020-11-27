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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F94C63777
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 03:29:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08E1420782
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 03:29:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2JVj5xBh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGT7XCmS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08E1420782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZ2LZJplXCxrVc0ScoUvRWEuRzxVCS8Gzr+ClM/nja4=; b=2JVj5xBhJoXY7KD8oT7rIls5+4
	IYoUfLzSFc8G1XXe1xS+2s2MjNuyhvfvVh2UPWgLoUo7cf7P6MKEVJXRdHYkjhgm1ie0tE8L0m2lA
	fSmCoQ00LB/mZ/FH6GiVReooCNU4qXyyNBwWptG/DM65dmAYQ7PAAARRh7vCk2YSwzuhDoIN+xr3X
	RsC174SIT/3jioFpwheclMCEh5d58psLsfWoL1qijUa6dm+cO/K0rukUydsZ1kES/ZlaKmtEGIKVz
	gdrXssfZ3otLz7nqfenYgtU64vA9urgjRTeqPCVRwg3uduTYDG+nnSx4x4eSnAFV1RIRljlDWXld/
	U7+FWg1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiUS3-0001ww-Qa; Fri, 27 Nov 2020 03:29:40 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiURg-0001qD-Fm; Fri, 27 Nov 2020 03:29:18 +0000
Received: by mail-pf1-x433.google.com with SMTP id e8so3287740pfh.2;
 Thu, 26 Nov 2020 19:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=enRX+fjbiOGGszFGSnN0VRhBHLDbLaaj7qo38qYIjAI=;
 b=EGT7XCmS5lTUdHmeqfrZIO4IWmxjObU5czb2nM/R7RBir8E4r9Za6wL5CcugTpAXLi
 LjF7zfgU+FK8lz2FDQVuc4KBaH0NjRHglL5/5iXifoj6DGMpG7YPuFmRXfBpBMNVBHez
 XUn7v9fD1Jo+WgTmuB2XHLPfgAYAyeyJ8XhTCEMBvQdfBniuel2rR/NuoKzwjSTdZB88
 FKndA49/ITSdIKBgyckfe6NEz4Ypq2/9AUPvKbFSPWTg1nreyj7v3irpTXCkNOJuIupZ
 wQvsaIgdJcH7r29+R3chdJ5iRUhANEkHkLHSSyd+ELQ1vUBF5mo+ypTYwD+TelMrLG/D
 LMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=enRX+fjbiOGGszFGSnN0VRhBHLDbLaaj7qo38qYIjAI=;
 b=tpWYsmepAkjoA8Pw9IfYl3XCUHxaq+IyTMnYlegfDzBQYhI3EH3Be0na5VuQFvqEjQ
 z+BNpCq10yed1G+63GyyFlnc5sH4ANln0M7bdOzEY0Qfi8ugZV8K00s/+kgkm1ovKUdZ
 PMLE+3svYyn1/YWMHsNGFfQsIVETqtv239gTREi/4H7+y2XaN1PInDvXXJcwmV3IGINA
 1lmHkC2RiT9yiYwmovxZAucZNwri/B2wYullNJOHp2IPs2kzyBdRt9k4E2HtIkkLyV/2
 izibeDzil3I6+xIKzE5xMJO533JdqSQUgouhUSfHh2Gq9fgfhR+YXbi4I3MeecTV64aj
 P3ig==
X-Gm-Message-State: AOAM5313llHauGLjLZESnZZdWczIqqGH7W/Fr4aZnaui7CMLDzyoIH3f
 OkL5ri2h/Zi3PEg5ecaxPvg=
X-Google-Smtp-Source: ABdhPJw35Au4zu5W5qUVCPqy6Zw1EA84mDfVySoW4hNMOu+dCTgJjNxqibYGG06/mf3drvVZttLFag==
X-Received: by 2002:a17:90a:3d48:: with SMTP id
 o8mr7298488pjf.103.1606447754456; 
 Thu, 26 Nov 2020 19:29:14 -0800 (PST)
Received: from localhost.localdomain ([101.12.27.127])
 by smtp.gmail.com with ESMTPSA id m73sm6063962pfd.106.2020.11.26.19.29.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Nov 2020 19:29:14 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v10 2/6] leds: flash: Fix multicolor no-ops registration by
 return 0
Date: Fri, 27 Nov 2020 11:28:52 +0800
Message-Id: <1606447736-7944-3-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606447736-7944-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606447736-7944-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_222916_900919_EC2F067E 
X-CRM114-Status: GOOD (  15.58  )
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
and reuse same registration functions no matter multicolor class exist or not.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
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
