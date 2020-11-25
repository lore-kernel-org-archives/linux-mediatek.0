Return-Path: <SRS0=wG/x=E7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB1FC56202
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 10:51:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E9BD20678
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 10:51:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BY3EaV3n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s5pJC6u7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E9BD20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=53M+AYfiqdR9Glm99DFatjEAYnv4mJjONWA86dv4Xk0=; b=BY3EaV3nlWfy8a/qrCbHpuqPv7
	trX5gkI7PcGHmCjyL4r7rFp35s0EXTT//o91yRvpf8+v1zHlby3h8my++VjdiWskEogNF0GfQs0yj
	qWgvHHioogunz1LOdpVr1fil+j6Dz9U1dtWS2tXgtOiplCmzWPeKodJO34q4zkBQSUqh0M3wTFdpy
	h18S/YsNgKiKE7f+jRnOprEOf0xtePd18CXm2VOQyI+4M/htItbKX09zSohIc/7cjJQGHBS4rimDE
	mBlq4rHh6TZBj5o870W4DDfDhKRaMWaHE11CHUPIanzrQfhWDSH2DhO2ARSZOXkLGXMWHXudMLN7q
	w1UzA+EQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khsOr-0003q0-Bp; Wed, 25 Nov 2020 10:51:49 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khsOb-0003jM-PV; Wed, 25 Nov 2020 10:51:34 +0000
Received: by mail-pl1-x631.google.com with SMTP id 18so908311pli.13;
 Wed, 25 Nov 2020 02:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vKuoXfSjmlab1b9KLwliC6EIUs6pDBR6RvujvSzTHXI=;
 b=s5pJC6u76IHIcIW+3vghtp7beSwJPEAu3vWsiPuzmNtndNaEnWLLAu8HgTqFZi4t0/
 incmpH7aLGfxucVeunw4FT/sWoaXr4F9yOdNV7iipC7K8WnqhFGSljbqXNei9XzFyISo
 aEPUlJHwGftgl1skytPCLvFdd2lYM1lbsq6cjvLTwhfB4SzcRqZayrHSZB7K9Qix7vCg
 OufoAlpgi5qPNQIZwNs3SZoVDOWUagAPqpQtiaT41PuNieal5xAB9MtNQM1lc4Mp/V5t
 RX8F/Oo0EWFYSuQIdZL+UpEbgXvdTaJ05ENEzNR6WtbXCvW2XD2m45RSyRwMWYFbsal8
 fcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vKuoXfSjmlab1b9KLwliC6EIUs6pDBR6RvujvSzTHXI=;
 b=L1si5YCPwFm4B9MH/QyeTfaOyfKjS/z8mLpjYsCiARge6TAC6yJIC3YnLTBJ6ITewV
 S3sW7CBciI/TELEtmNmGbQIE/JZjDntnmGkK54x2mybVLN4y+Ejwwj0wwneJMPEyP8C6
 WW0eJR7iXuLKfLd0wH0+SjErpN+i7MweaOHB6yZslpkwe8c3VdUP7B//2h9x2wY4LBKm
 ByfMjvuA97TN4IqEltzZE0N9eJ/QOJr/R+4GQI2Kd3BY8INs/v6QO0vXMZtiV6M0ZU7J
 /rS9Rj5ZaIts7cNYpIffY0cdkpirSO/1fKS7JzpXgEaySrOJEahJWnxXddrJCoNYdXIU
 eq4A==
X-Gm-Message-State: AOAM531pH8/BgfM9+kAonxA8/2Q90nQ6AIGFUM90uKgd2DG73+qD5FYX
 tlt8e0ZQVy5SPsQqYztcsH0=
X-Google-Smtp-Source: ABdhPJzgWtL4JcZhK3GJoCWvYsE/dDwzlsM4pjaOlCRdRsHUYX3FbFsKQsJJmKajI3FCO54GGsriKQ==
X-Received: by 2002:a17:902:469:b029:da:17d0:e755 with SMTP id
 96-20020a1709020469b02900da17d0e755mr2535168ple.53.1606301491875; 
 Wed, 25 Nov 2020 02:51:31 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:48b:4d7:7339:ae2d:114e:3859])
 by smtp.gmail.com with ESMTPSA id
 j10sm2049520pgc.85.2020.11.25.02.51.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Nov 2020 02:51:31 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v8 2/6] leds: flash: Fix multicolor registration no-ops by
 return 0
Date: Wed, 25 Nov 2020 18:51:11 +0800
Message-Id: <1606301475-7030-3-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606301475-7030-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606301475-7030-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_055133_915059_C2C90BE0 
X-CRM114-Status: GOOD (  13.26  )
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

Fix multicolor registration no-ops by return 0

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 include/linux/led-class-multicolor.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/led-class-multicolor.h b/include/linux/led-class-multicolor.h
index 5116f9a..dbf3832 100644
--- a/include/linux/led-class-multicolor.h
+++ b/include/linux/led-class-multicolor.h
@@ -83,7 +83,7 @@ static inline int led_classdev_multicolor_register_ext(struct device *parent,
 					    struct led_classdev_mc *mcled_cdev,
 					    struct led_init_data *init_data)
 {
-	return -EINVAL;
+	return 0;
 }
 
 static inline int led_classdev_multicolor_register(struct device *parent,
@@ -96,14 +96,14 @@ static inline void led_classdev_multicolor_unregister(struct led_classdev_mc *mc
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
 }
 
 static inline int devm_led_classdev_multicolor_register(struct device *parent,
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
