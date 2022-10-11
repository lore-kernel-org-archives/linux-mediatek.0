Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57807C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 22:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gDfnfolyPIiLoZMfrzrbPqoZrA52wx7/qfIWAlJm1I=; b=h5k8QgPCqoTS1hDV+6+WzltyJN
	jf9i7iPnS/QVgwnG6jLvf7rpE9cg1xbHMchzWeJ0tlVmjUtnSa4o+MzwCgSj5ZV+W6mWfBk4jqfWP
	YWjim6XZNO3R9QZMiS2x6S7NcOymB5G9fTw3dLPtGU0gsCNvpvuXiHsznwswcE7uaJOz7hAsM4cun
	X2WKW63aTbzTyOUfvNjOgcHqO1egy9AmirXzYno8h+p50YNrBl2LdTIZQQqP6I5FcVWWKCTUDAOAw
	mDCpvkwztsQcOJHjNtdr+eYJvV011kWbNeib9fRM/tI+Uaux/Cg3hIocBVjUFVKhGVzTbeoQy2Thx
	gxSx/7sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiNcC-0060of-Hn; Tue, 11 Oct 2022 22:20:44 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiNbJ-0060Nj-O3; Tue, 11 Oct 2022 22:19:51 +0000
Received: by mail-pl1-x62c.google.com with SMTP id c24so14551048plo.3;
        Tue, 11 Oct 2022 15:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gDfnfolyPIiLoZMfrzrbPqoZrA52wx7/qfIWAlJm1I=;
        b=IwSJt27h8PVkrQYaH8qScEO9APBnjLfs46Cz1k15mBQMKZ7yOOzw0B8AA7LGRkpHKR
         LONSMzjFDbYkfvh8t6F1XJyZDo0UkJZYG1kYGMKNC76J7Ol2BwcOxjo1JNChA9KJwymy
         GVbCcD4HGQcEX/V9InKcFZOso7iCfLJUNYY7Cvt2mbClIqVvbp+BMC6ewUqjCRmGLMCi
         SKb4hXI/DuMbjB9SgIhMbEI9KfOKyBKJYBqBlxSESjDMTFooIQHm2Wt88DewR619vwgI
         ar8Aw7Qeme/yhGs5UWzeQL5SGD8xyNuOi/rgit/xD16Zslz2Y2FqnFxdZPXByX5vpixF
         v04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9gDfnfolyPIiLoZMfrzrbPqoZrA52wx7/qfIWAlJm1I=;
        b=RXp8+nyL0n9ztwyrivPNWgCXVLuegkU3XIS6pvIOzXLh/G7AwqqlRfp4E4JuesMZwO
         v1U+PL1/N8ghFPWEMsG9sK/GdxzStNYa3aK7zx6Y4Tpvly2zH6duMjDoogVuQjaq1MQT
         TKM7hGudRy8+m4mLtvZND7LcAfE5DKRYCMAn+0yTrOnDQ7sBtxbvTkrRolYByUISyGZy
         Y74v5HlluCSzMm27IbXdU3Uv9MwDfgO8pz6hR43jbsRidHUQWWBmdgrObNupu3wrsrjh
         Mp5FMI6hb1f8eaCjaN5ZqGu1sOIOObX7IgEb/HPfNGW66t3Zdo2pzqKKFpmvNtQw+QxB
         InBA==
X-Gm-Message-State: ACrzQf0TGPu8ib5ho5p9sKtJc4yDxHf59ZaCH2pwFkLM1Ahx6xWY6hAf
	s+oat5v4EKabmLKOTypdvdE=
X-Google-Smtp-Source: AMsMyM43bMnQePWNIYfL+kjn2ma7R4LVxExmEkZSq5CfjI94HAHswoD0kp04cKyT4G6RRD3P1ITxNA==
X-Received: by 2002:a17:90b:3ec6:b0:20a:eb6b:c832 with SMTP id rm6-20020a17090b3ec600b0020aeb6bc832mr1526920pjb.22.1665526787668;
        Tue, 11 Oct 2022 15:19:47 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:becc:db10:eb45:dc35])
        by smtp.gmail.com with ESMTPSA id l6-20020a17090ab70600b0020d39ffe987sm60151pjr.50.2022.10.11.15.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 15:19:47 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH 5/7] gpiolib: of: add a quirk for reset line for Cirrus CS42L56 codec
Date: Tue, 11 Oct 2022 15:19:33 -0700
Message-Id: <20221011-gpiolib-quirks-v1-5-e01d9d3e7b29@gmail.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com>
References: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_151949_810608_DD6187A0 
X-CRM114-Status: GOOD (  11.46  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The controller is using non-standard "cirrus,gpio-nreset" name for its
reset gpio property, whereas gpiod API expects "<name>-gpios".
Add a quirk so that gpiod API will still work on unmodified DTSes.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 7d4193fe36e5..953d1c23950a 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -407,6 +407,9 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
 		{ "wlf,ldo1ena", NULL,		NULL }, /* WM8994 */
 		{ "wlf,ldo2ena", NULL,		NULL }, /* WM8994 */
 #endif
+#if IS_ENABLED(CONFIG_SND_SOC_CS42L56)
+		{ "reset",	"cirrus,gpio-nreset",	"cirrus,cs42l56" },
+#endif
 #if IS_ENABLED(CONFIG_SND_SOC_TLV320AIC3X)
 		{ "reset",	"gpio-reset",	"ti,tlv320aic3x" },
 		{ "reset",	"gpio-reset",	"ti,tlv320aic33" },

-- 
b4 0.11.0-dev-5166b

