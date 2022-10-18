Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E233C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 05:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fg1dNJF1vhKWQF5OI6LtaWfps2s1BCKrpVH4Il7rIdQ=; b=3+lgzYugPxCoTLZxf4pEheqSXv
	UjZyyWsi3c1TVZvbGRefF+4/tBeuc/Sbo78KZJ3oBrYeUcQDonKqH9hFVV/hcLF7GpXr2SZMdYzZY
	rHibzEzGOR/oHm7PTs/WCg2C00P2K77QYEua4gqGMqM+jUCc2KEdPfhH8RgJbaDcEKgPEgXOPT+lQ
	m5h7FRBcw0CThs8ECftmlN8kdVLvKknAc5HPthN2dix9wn3Jstzgl0cTf7qUbSwIqaU/fCzJNvT7W
	Cpoepe9101xcMMA3LYB6JWNJsjrtJwtcr6q0Qq9tEEo8Qt1ZUpjEpPFIBZ1HSO5HiRX/FFAEUb9HB
	ISDXSnRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okfNX-002rGL-Gs; Tue, 18 Oct 2022 05:43:03 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okfLy-002qTR-Ge; Tue, 18 Oct 2022 05:41:27 +0000
Received: by mail-pj1-x102b.google.com with SMTP id q10-20020a17090a304a00b0020b1d5f6975so13043869pjl.0;
        Mon, 17 Oct 2022 22:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fg1dNJF1vhKWQF5OI6LtaWfps2s1BCKrpVH4Il7rIdQ=;
        b=O95+mzHEcle2Ir6v0uacACuy02++l9p0omhzJtlOZhaUOCfzfMRpr6PHgmTCaPrP73
         RiNvXFopkCF0RpH6YTipn9qSU4snxvXBTBFdNA6j7qaMS04d3MRn6cR+iTO8OT6sKuSk
         0p1W2NWPkEdxkQ7eL02U9TTLZI53eI+pHjHcRv3xL8gTEehwI0J/2gcZiOIULLBot69c
         eN3YERgjVVeNVoDXFUBCu6XAncWUaOMkPZ2TK+dAIGNKpGpIgh2yn2u7fgaGHIHO5+hs
         H4acQX76HiAl87hNKkf858IFZiMj79BzLi7P6ENsdjmhKnl8iCrDr6vgAYtVQ5p9vlb8
         VTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fg1dNJF1vhKWQF5OI6LtaWfps2s1BCKrpVH4Il7rIdQ=;
        b=2z/0zctVYMqCO3ZYlgKBUhz0Em7iqoGK5RUxVNL/UY7XJa7Wlh/ltxnWgq09Vl3gOK
         PXJYhR3sP+746r2b4f6cMbGWCCQy60mrCi8h1pMtTSxqnSm5TRtov3u9P6bdng3W6WuI
         9DBujpdeOhcBL15ARo9OBMJDuK4Os5GBvrKD2K631IPcfygmcjBsqhp4ZDblyfVKEP4I
         cDQR0oGvMkF7mxNNvF33rt5KNB9QK/o48/dbuhaksaxVlaYU8PlWNGouh6dwy/syKiOl
         k97gl7DqBTf2WuvcnZvSGia4PbqHgjouSMfE/13XXFqUsU/tIx3p8PXGOFZqKmAw4VFN
         xL7A==
X-Gm-Message-State: ACrzQf0Cg2Z5iS1F2juvJ9wwLLhlfg9cx5IESyyeu5slre10ysjIKFMh
	W9Hrj+SaYN7w4bnkppAVKL8=
X-Google-Smtp-Source: AMsMyM5TXIErFU1qFPq8kS0hh969nSm3FNAZmi0hgmHSHZ9HOAFSf5JXBUNzhXCfwoX9Fw7Hni8JZg==
X-Received: by 2002:a17:90b:2691:b0:20c:d655:c67d with SMTP id pl17-20020a17090b269100b0020cd655c67dmr37605795pjb.36.1666071683285;
        Mon, 17 Oct 2022 22:41:23 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:f7bc:1bb5:e0b1:92cb])
        by smtp.gmail.com with ESMTPSA id z7-20020a1709027e8700b00172f4835f53sm7597435pla.192.2022.10.17.22.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 22:41:22 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 04/10] gpiolib: of: add quirk for locating reset lines with legacy bindings
Date: Mon, 17 Oct 2022 22:41:05 -0700
Message-Id: <20221011-gpiolib-quirks-v3-4-eae9cc2ed0a1@gmail.com>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
In-Reply-To: <20221011-gpiolib-quirks-v3-0-eae9cc2ed0a1@gmail.com>
References: <20221011-gpiolib-quirks-v3-0-eae9cc2ed0a1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_224126_572413_DDA7AB17 
X-CRM114-Status: GOOD (  10.83  )
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

Some legacy mappings used "gpio[s]-reset" instead of "reset-gpios",
add a quirk so that gpiod API will still work on unmodified DTSes.

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 7d4bbf6484bc..2b5d1b3095c7 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -382,9 +382,18 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
 		 */
 		const char *compatible;
 	} gpios[] = {
+#if !IS_ENABLED(CONFIG_LCD_HX8357)
+		/* Himax LCD controllers used "gpios-reset" */
+		{ "reset",	"gpios-reset",	"himax,hx8357" },
+		{ "reset",	"gpios-reset",	"himax,hx8369" },
+#endif
 #if IS_ENABLED(CONFIG_MFD_ARIZONA)
 		{ "wlf,reset",	NULL,		NULL },
 #endif
+#if !IS_ENABLED(CONFIG_PCI_LANTIQ)
+		/* MIPS Lantiq PCI */
+		{ "reset",	"gpios-reset",	"lantiq,pci-xway" },
+#endif
 
 		/*
 		 * Some regulator bindings happened before we managed to
@@ -399,6 +408,13 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
 		{ "wlf,ldo2ena", NULL,		NULL }, /* WM8994 */
 #endif
 
+#if IS_ENABLED(CONFIG_SND_SOC_TLV320AIC3X)
+		{ "reset",	"gpio-reset",	"ti,tlv320aic3x" },
+		{ "reset",	"gpio-reset",	"ti,tlv320aic33" },
+		{ "reset",	"gpio-reset",	"ti,tlv320aic3007" },
+		{ "reset",	"gpio-reset",	"ti,tlv320aic3104" },
+		{ "reset",	"gpio-reset",	"ti,tlv320aic3106" },
+#endif
 #if IS_ENABLED(CONFIG_SPI_GPIO)
 		/*
 		 * The SPI GPIO bindings happened before we managed to

-- 
b4 0.11.0-dev-5166b

