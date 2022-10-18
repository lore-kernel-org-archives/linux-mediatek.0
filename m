Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C29C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 05:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTn1dphwNOkdUyNvDetLqqezFlO3LTymy8eZ70ptOU4=; b=KOyBnyNeqfQuBrvGJzjgEhdLsr
	GSWPSCOFbhBbQQcsCKvDk/KQ4YyG7NurSnh7tMj+SMxhhAsQ5cttrKETbwNhd7Ce5lBwbmQHgH7fV
	8ANG4O1eNk29nJSgz7zP8AH46+aw9SCWavJDayZ7aoMphigjbkYeKJXXiUPMypWx3J+v+KhcHcccC
	p74xlk/ZSa6czTCG3fTPMBLeQ3AN3e9GjaVRoqgC2Nzex1Qo/SHIsXFOFqnYnFWv/6tgunWAJxiGc
	kJ8cBvuS5UZNc6+8VHiCLSwO1b6R9wEHIUGs+p/eMJEP4QF0xdZ9nLKEyML58+uLdYV0ZFtIDr/qv
	V7Ehhz3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okfMF-002qaY-2X; Tue, 18 Oct 2022 05:41:43 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okfLs-002qRk-Tp; Tue, 18 Oct 2022 05:41:22 +0000
Received: by mail-pj1-x1030.google.com with SMTP id a5-20020a17090aa50500b002008eeb040eso662326pjq.1;
        Mon, 17 Oct 2022 22:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jTn1dphwNOkdUyNvDetLqqezFlO3LTymy8eZ70ptOU4=;
        b=lz0HD8RW5uepcDP4ExPxobkGeybyVM1a/aLHa5C8LHvYddXJ4DPGBq5N3gTF0xUkdT
         5r+Y/MijFhpqdp9ZYE5yZJGylo3K+DSYD69+IuGZnJni/FEyqZe9sO79SZmNUCSPO1L7
         VXglj6d4U3yuIqtRjTnzn/KYrpjkL4fG6yRwUN3mbojj3elf0Wtr/vELfeGOYgbAF+3B
         nKDRrddxLyXbKnN92Cw09Z8lDqxi4s5Kxmi48bGQWeWrqsTpB7m/iFg8qRjp2gbiaVSd
         lsdjBpgKqsmTW51CbYyK2OOZi888FUKFR9KT4555diSCxYJPobkBmP4kY4mlJWaOKXtr
         lpJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jTn1dphwNOkdUyNvDetLqqezFlO3LTymy8eZ70ptOU4=;
        b=QRqNCcXPNSclEceMHXXXxQfi10y750CWllhqMunq+39dTUSDAGVwEoLA2oMSNhuMDG
         nd7XXi3vSmtqMFowbTG1jTqwVkTaF8YL2rkoWamBr/YTYwTI/79Bwp1aSCpabKXq5iH5
         rgt3xu0MH0Z0r0md0jIoCdmOtBPtZKyQ+jLt40tIh3t8xau+td+hGmid4YNtDwT5fOwb
         z/Lr/G5jtFxAwTr57R00a5uRBZBkCZSrLb9HkOvsNrhy/J6p4xbs+7vZNMb9BakIMxmw
         jFexq0hskE7QWhKmEjS82ZDp6Sag2uTaUF/7xki63R709IfIPcybqUYPAS2KvmMoN1PS
         ay0w==
X-Gm-Message-State: ACrzQf1fD980+Zj4LGmkYDPAwkkYR286kOvMGT8MAOoep86KEv+mnMxa
	TDuxfSlGO398pHElT2wvSUg=
X-Google-Smtp-Source: AMsMyM5rs1kB4rFeIfAfMs/wl4emcwgpOJcxfI8D4+foneG1Oqh62ltVnNeCS1hPaOOZKRp3wXqlkA==
X-Received: by 2002:a17:90b:48c9:b0:20a:e225:1afd with SMTP id li9-20020a17090b48c900b0020ae2251afdmr36387992pjb.21.1666071677837;
        Mon, 17 Oct 2022 22:41:17 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:f7bc:1bb5:e0b1:92cb])
        by smtp.gmail.com with ESMTPSA id z7-20020a1709027e8700b00172f4835f53sm7597435pla.192.2022.10.17.22.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 22:41:17 -0700 (PDT)
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
Subject: [PATCH v3 01/10] gpiolib: of: add a quirk for legacy names in Mediatek mt2701-cs42448
Date: Mon, 17 Oct 2022 22:41:02 -0700
Message-Id: <20221011-gpiolib-quirks-v3-1-eae9cc2ed0a1@gmail.com>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
In-Reply-To: <20221011-gpiolib-quirks-v3-0-eae9cc2ed0a1@gmail.com>
References: <20221011-gpiolib-quirks-v3-0-eae9cc2ed0a1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_224120_978736_2A36740D 
X-CRM114-Status: GOOD (  14.21  )
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

The driver is using non-standard "i2s1-in-sel-gpio1" and
"i2s1-in-sel-gpio2" names to describe its gpios. In preparation to
converting to the standard naming (i2s1-in-sel-gpios) and switching the
driver to gpiod API add a quirk to gpiolib to keep compatibility with
existing DTSes.

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 0e4e1291604d..cef4f6634125 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -488,6 +488,38 @@ static struct gpio_desc *of_find_usb_gpio(struct device_node *np,
 	return of_get_named_gpiod_flags(np, con_id, idx, of_flags);
 }
 
+static struct gpio_desc *of_find_mt2701_gpio(struct device_node *np,
+					     const char *con_id,
+					     unsigned int idx,
+					     enum of_gpio_flags *of_flags)
+{
+	struct gpio_desc *desc;
+	const char *legacy_id;
+
+	if (!IS_ENABLED(CONFIG_SND_SOC_MT2701_CS42448))
+		return ERR_PTR(-ENOENT);
+
+	if (!of_device_is_compatible(np, "mediatek,mt2701-cs42448-machine"))
+		return ERR_PTR(-ENOENT);
+
+	if (!con_id || strcmp(con_id, "i2s1-in-sel"))
+		return ERR_PTR(-ENOENT);
+
+	if (idx == 0)
+		legacy_id = "i2s1-in-sel-gpio1";
+	else if (idx == 1)
+		legacy_id = "i2s1-in-sel-gpio2";
+	else
+		return ERR_PTR(-ENOENT);
+
+	desc = of_get_named_gpiod_flags(np, legacy_id, 0, of_flags);
+	if (!gpiod_not_found(desc))
+		pr_info("%s is using legacy gpio name '%s' instead of '%s-gpios'\n",
+			of_node_full_name(np), legacy_id, con_id);
+
+	return desc;
+}
+
 typedef struct gpio_desc *(*of_find_gpio_quirk)(struct device_node *np,
 						const char *con_id,
 						unsigned int idx,
@@ -498,6 +530,7 @@ static const of_find_gpio_quirk of_find_gpio_quirks[] = {
 	of_find_regulator_gpio,
 	of_find_arizona_gpio,
 	of_find_usb_gpio,
+	of_find_mt2701_gpio,
 	NULL
 };
 

-- 
b4 0.11.0-dev-5166b

