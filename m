Return-Path: <SRS0=Og7P=FG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF3CC64E7C
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 10:47:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B0A72222A
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 10:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B0A72222A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZ6jLJU2QsKeoLD+qOU+O5B42ez1m+Ewy6SihjKCgI4=; b=qgNaoS+/d8vvj3l/0kdOPhxU1Q
	N/S3vMhwI/FBHlnBzhHLLFIpI7IDrNk0bAM29Qp4ILhLyFsUYmLhlk8jPFI0+HkbfhclibXSdwwu9
	POgc7z/8mDKtLe7NACAsXD7+xFxd/z3GN/+XyjpNXx5FtenuwXSG3SkraB56DtnIqyFoogbO3cF56
	CMYBHiIv4wehgrPDvXHLAOl5DiG8XDPPzgry51jim+oPTwWlvw3LgO2C3N9mbk5+wnspTIX8YPaKa
	f04ZVPkbdnLQYY591BaYBzQL+8H4vjqqptkv+3T4LAXjyLljhwi+pKlMAqf33zWnD5NP2kM4CYX+b
	BM76ekMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkPfI-0006Q7-Hv; Wed, 02 Dec 2020 10:47:16 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkPfA-0006MA-Ot; Wed, 02 Dec 2020 10:47:10 +0000
Received: by mail-pg1-x542.google.com with SMTP id o5so836611pgm.10;
 Wed, 02 Dec 2020 02:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=p0JP7C0xlsVyWNi+wA1zhFtAvLDEH/NgpOed0jz9w0E=;
 b=LuL/ISrlnUyz61vEuqciCm8pEDG2XCpxAW5g/Y2wyQXl8B6Cjgl5MiXtSPZE8K1GVN
 x4jQF8ewGW6ACZ9H9B5rLcTTh4q2s7ar+6RUWxhqWQ1wFsYZY1LQjEMSn9JDR4UgiGNh
 sExYEcHbclUNDkAERBB4DrYD97dmTO6h21PLP4tCSsg5CqRmHCPzTIBQFv5xespkkGsA
 8XSXgpTyY409JILJvmzutm+jKP/G2ymOhwaikjF8QsiIAHu1C50D/ma8UXWRkXt7xpI5
 wJ/Y6QsWZQ5jrhFsoDIHE+JN1mP6pfvZYGHznLWK6hPEBftjon6hgyVOqYXZlI+8Yz3O
 tGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=p0JP7C0xlsVyWNi+wA1zhFtAvLDEH/NgpOed0jz9w0E=;
 b=ZZGH1J468+ydKjH2TSmSsS2K3sjQzRZhCIvoav1l2fXMtkqi7cu9BuJUjnvBlKUjEi
 Xrj0cpD3uLEHTFhwlVy8NIEMBzXPDgflfkuafxm5XQ+6g9EvE1KwporOfvytd3B0W9EQ
 SjUDi9+/HEYgKdSx3b3zt4M8YHy8GVNNuHSi4hIKFvpWfhmYpAbzOYz1NPV1DrIwVRr6
 s4ZewnLNdi0HrOtcEIP5ajNsiGoFRyKJ8CR2OpADCT3NQLyVi9NeWwKlssiXpkNycYEd
 0nHD9gGacaJR9BcH4HE4FYe0Qv38S7YawV40XK7xMKVXDivL7wqLUOZwwckvIPFhuo6T
 tlTA==
X-Gm-Message-State: AOAM530Ub1ihXJfCWnjoKerb9vOMBkhkgPUrtFnNSuNdFX62mOKrquHA
 iUlBJ9125tqEtHG8XQv7REA=
X-Google-Smtp-Source: ABdhPJyeY2WV1nLUcEzBdz84Q6ciSbRyG3hkgQz3aYDs6YblKSXhLv1wGLdo94QUyXRbe4tzOmj+TA==
X-Received: by 2002:a62:e212:0:b029:19d:8cff:f179 with SMTP id
 a18-20020a62e2120000b029019d8cfff179mr1635734pfi.44.1606906026411; 
 Wed, 02 Dec 2020 02:47:06 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:561:5929:abfa:5e69:aaf7:6f59])
 by smtp.gmail.com with ESMTPSA id e14sm1648109pjt.17.2020.12.02.02.47.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Dec 2020 02:47:06 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v11 2/5] leds: flash: Fix multicolor no-ops registration by
 return 0
Date: Wed,  2 Dec 2020 18:46:48 +0800
Message-Id: <1606906011-25633-3-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606906011-25633-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606906011-25633-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_054708_929216_9E235E62 
X-CRM114-Status: GOOD (  15.17  )
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
