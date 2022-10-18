Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B038C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 05:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QaKCpTaQOM7oy+irhSb/L7sMiah4MLH0I+sgYpZFdYA=; b=dJ8osVolsvDsJgmShwM1JAEONR
	IsvFd4CC7WdGQ2NdnB8dZofkT9s9ZiBHNpoeXaAhN6oZhDzl93xvAX2OXgr9lShJRlCTnnCXEMKC9
	UNoQJyfNWgRV2yFsbgTi0k0duoEqifHZXUE66QCgt4ChYCTWgIkktvq/cC+ubCXCHppFrnqeKuw8W
	h0OmZOJH8cmW0LM/mz08tINB/NWRCqlc2S1MwcvqDsxvxJfSxdrLrdPs56l7D8xOBTy6dgCTJEQM0
	ne/ua2FKndAuWsysav0/uGMrm0FyL89IFdGp9MAzADDMQqO71C6V6N3y1FqjXXETCjqh0ciZIpxsc
	S25dZHRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okfQa-002trg-H1; Tue, 18 Oct 2022 05:46:12 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okfM8-002qWs-9f; Tue, 18 Oct 2022 05:41:37 +0000
Received: by mail-pl1-x632.google.com with SMTP id c24so12849978plo.3;
        Mon, 17 Oct 2022 22:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QaKCpTaQOM7oy+irhSb/L7sMiah4MLH0I+sgYpZFdYA=;
        b=YZNP16yD09yoREPsWOruNPclr4jdwc2OvyEtL+Q/xMqzBvIrpr3WxzzAwOPLbp4e7L
         eefS9hRfZcfgMrZP47TIwnO/C0aOPslNe5DPDfWxS37bzccir2OFPHNwGgZUIubcIFnc
         nhjGKqgSpnJDGy8rKC8bpolKaHqfT6o71TCXMnmidh1JJCpdyTBhrsBENtuqWLh6Ud6g
         4u5D4nG/JVx003mINsDiyaBR1LH2OpOl35AeNOJ7Qismy8SixfjVhmeUxBOtTIwViKBE
         njHD2kw4FHEoWZwjYBCs7xmHJoF/5xkglS+/xto323zYrhBpzTYsQztXVDK3xasTeb/c
         t3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QaKCpTaQOM7oy+irhSb/L7sMiah4MLH0I+sgYpZFdYA=;
        b=ZxsFdSporJNnc0nwUdf0AlAEb2vrALxK3kfxRVrCr4qi0qfI2VnkkQh1S0kzZiA7qy
         XCjlZx+FD2RF1GM1f9X0BtXmc5Myc5dhj8cPYUz7xJQau8Ch0kN7GB+tssHrCfkOee+m
         oBUaiArsJNq+Ce3syB9GPJgyy+TBp+6JdKd/ck+n3Ji3OFb2LemqohKlWNmTx142YeZA
         ixZBV8MiD98u/3RC4zB1zvBNVKfh2ZQfkByYAzhShyCNtqg7XMlEq/Iv5YrNXsacBB24
         KzbyOIVj5OV9qVQGJ2+cM+dcMekCK+2gJ/aQDYJwbE0Gw1NqArDwXht+oKFmsqdE81Ky
         hecQ==
X-Gm-Message-State: ACrzQf1uMmflkH14UvO6DClD0zVprF8MV+J6+zkyVuTkpQRZxuxNkKSo
	/0Q3ez+J1fnwt5KbIluGnu0=
X-Google-Smtp-Source: AMsMyM5fllnPD7r8O0aTtwSrfbMe9atjxB7xfGjnHWOFmMUSWnF5KjSvkJlnzTVHw09BY7+BGejjcw==
X-Received: by 2002:a17:903:200a:b0:184:1881:bfd1 with SMTP id s10-20020a170903200a00b001841881bfd1mr1545243pla.95.1666071692411;
        Mon, 17 Oct 2022 22:41:32 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:f7bc:1bb5:e0b1:92cb])
        by smtp.gmail.com with ESMTPSA id z7-20020a1709027e8700b00172f4835f53sm7597435pla.192.2022.10.17.22.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 22:41:31 -0700 (PDT)
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
Subject: [PATCH v3 09/10] gpiolib: of: add quirk for phy reset polarity for Freescale Ethernet
Date: Mon, 17 Oct 2022 22:41:10 -0700
Message-Id: <20221011-gpiolib-quirks-v3-9-eae9cc2ed0a1@gmail.com>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
In-Reply-To: <20221011-gpiolib-quirks-v3-0-eae9cc2ed0a1@gmail.com>
References: <20221011-gpiolib-quirks-v3-0-eae9cc2ed0a1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_224136_361614_41D10C29 
X-CRM114-Status: GOOD (  12.32  )
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

Bindings for Freescale Fast Ethernet Controller use a separate
property "phy-reset-active-high" to specify polarity of its phy
gpio line. To allow converting the driver to gpiod API we need
to add this quirk to gpiolib.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 6faf0dc7bc31..c2a55ffb2b20 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -231,6 +231,33 @@ static void of_gpio_flags_quirks(const struct device_node *np,
 	    !strcmp(propname, "snps,reset-gpio") &&
 	    of_property_read_bool(np, "snps,reset-active-low"))
 		*flags |= OF_GPIO_ACTIVE_LOW;
+
+	/*
+	 * Freescale Fast Ethernet Controller uses a separate property to
+	 * describe polarity of the phy reset line.
+	 */
+	if (IS_ENABLED(CONFIG_FEC)) {
+		static const char * const fec_devices[] = {
+			"fsl,imx25-fec",
+			"fsl,imx27-fec",
+			"fsl,imx28-fec",
+			"fsl,imx6q-fec",
+			"fsl,mvf600-fec",
+			"fsl,imx6sx-fec",
+			"fsl,imx6ul-fec",
+			"fsl,imx8mq-fec",
+			"fsl,imx8qm-fec",
+			"fsl,s32v234-fec",
+			NULL
+		};
+
+		if (!strcmp(propname, "phy-reset-gpios") &&
+		    of_device_compatible_match(np, fec_devices)) {
+			bool active_high = of_property_read_bool(np,
+						"phy-reset-active-high");
+			of_gpio_quirk_polarity(np, active_high, flags);
+		}
+	}
 }
 
 /**

-- 
b4 0.11.0-dev-5166b

