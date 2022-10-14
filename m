Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A84C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 17:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDr9juWg3u7tqOqaJOOvY3u67HoyFj37SYo8BbenwWk=; b=U0cq53W4fAwL+q2CDcvuvjXFcg
	oPTCLFQyaDq84C+709xAQmzre2rpMBlohn6YBbfxEG7C9wYR+lamXe0qLJfjt/yDvw+X/Ln9njya2
	kuBRvf4cR3U85ci5onVlKv+CQBO3xsWAOUECSIuaQOsI04GM3DGqe7ay3p2jXshh7y763ltlQlYsD
	S74iaSrN7bS+pLn9Ne6/rUuh4icO5oXRQD/3DlYr+z/9dm0Vdu8rb43DEqaSvaPQRaI+Eg81ob9aB
	SI0l8MiKkB6s4wdW9r95aLG76/bUpcl6CmtCPD+sb/+J1d6N7oXD53l+/K92yirvbqt/Wh5LYIgct
	8RtT/Bmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojOwP-00FYZV-T3; Fri, 14 Oct 2022 17:57:49 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojOtc-00FX4e-1D; Fri, 14 Oct 2022 17:54:57 +0000
Received: by mail-pf1-x435.google.com with SMTP id y191so5597861pfb.2;
        Fri, 14 Oct 2022 10:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDr9juWg3u7tqOqaJOOvY3u67HoyFj37SYo8BbenwWk=;
        b=K7/WyOZWPb1Rs6hBURYIqASCfJWT2Ypv8TwWdxwKsLl76h3ZM8LE9cDiE5sYUXXgED
         ypzOhURY5d09mWMjlYXc+SII8+wsHvMD0gUy/765T0ggM48TQeRCi2+CiNUwNMaSdFku
         noZF0GhcUdMc3nnH5TB3bLmnSRcg5QqRVQNtPJi2ZTTQhL0YHsV+H0wnGfopeE+nioAb
         UGmP8/p89sY7HGR6q8RjE92cv/+mU4BSXLJ2ODAfJG8ZlKLXp+F7ni24WTCFu3JqhHn8
         PKB83IW8xGp0+2jZiGDFfWo0PHN41mnnCau1ep5hAiJ0GbxMfviZTW0IF77tiTyxu4Ye
         U92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDr9juWg3u7tqOqaJOOvY3u67HoyFj37SYo8BbenwWk=;
        b=YREThcdIIVGxh5f+WZc7vIvf9vM1pxbyJs6S7wKeQCTxJnOzuF5bdnwSlCwnX5g+8L
         3b2IFZm5KT6N9oaUCT03RbIohUaW05GqDt9L1wzLoPeTBrKl9sFL2hUYDaCNWLb5HYwL
         OJliWlVsGwGfru8/GRAz+MQqoXh7TA50QHzFdCR5xHbh4P2xDjOlFvr0Ex3unV9vRIhx
         jH/qT240fodqvEc6yzZFvwQISpMlqd4ndi+7jY8CSxvLMhcmQCwyGnBBYp28xpongGsF
         0NZLcnbzbR9QNlybupuSlKY2yHLZnSuYnlFCZVl+I+mx8HUinyKHNvpPucwU3KzIYi/Z
         7YHA==
X-Gm-Message-State: ACrzQf3wDRrXT32Ik/vE+p6z1eIw95iKo8UR1RxAloTRMdFUmwRWHA3V
	GsSxNbyjv6ToMS14EyY8/Uk=
X-Google-Smtp-Source: AMsMyM66Ubh6jeHbtdegqbobjzrs9/DILurRSxW9pjZiIKKLcEoBNq3fQp7n84VpA3gI2fuXewHT1A==
X-Received: by 2002:a63:1d22:0:b0:439:3e7c:8af7 with SMTP id d34-20020a631d22000000b004393e7c8af7mr5605142pgd.78.1665770092947;
        Fri, 14 Oct 2022 10:54:52 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:da06:5604:594f:f6af])
        by smtp.gmail.com with ESMTPSA id jj19-20020a170903049300b0017f7819732dsm2011780plb.77.2022.10.14.10.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 10:54:52 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 9/9] gpiolib: of: add a quirk for reset line polarity for Himax LCDs
Date: Fri, 14 Oct 2022 10:54:33 -0700
Message-Id: <20221011-gpiolib-quirks-v2-9-73cb7176fd94@gmail.com>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
In-Reply-To: <20221011-gpiolib-quirks-v2-0-73cb7176fd94@gmail.com>
References: <20221011-gpiolib-quirks-v2-0-73cb7176fd94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_105456_108022_2C880442 
X-CRM114-Status: GOOD (  14.85  )
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

Existing DTS that use legacy (non-standard) property name for the reset
line "gpios-reset" also specify incorrect polarity (0 which maps to
"active high"). Add a quirk to force polarity to "active low" so that
once driver is converted to gpiod API that pays attention to line
polarity it will work properly.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 805222a2e6bc..26d57465fec9 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -152,11 +152,47 @@ static void of_gpio_quirk_polarity(const struct device_node *np,
 	}
 }
 
+/*
+ * This quirk does static polarity overrides in cases where existing
+ * DTS specified incorrect polarity.
+ */
+static void of_gpio_try_fixup_polarity(const struct device_node *np,
+				       const char *propname,
+				       enum of_gpio_flags *flags)
+{
+	static const struct {
+		const char *compatible;
+		const char *propname;
+		bool active_high;
+	} gpios[] = {
+#if !IS_ENABLED(CONFIG_LCD_HX8357)
+		/*
+		 * Himax LCD controllers used incorrectly named
+		 * "gpios-reset" property and also specified wrong
+		 * polarity.
+		 */
+		{ "himax,hx8357",	"gpios-reset",	false },
+		{ "himax,hx8369",	"gpios-reset",	false },
+#endif
+	};
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(gpios); i++) {
+		if (of_device_is_compatible(np, gpios[i].compatible) &&
+		    !strcmp(propname, gpios[i].propname)) {
+			of_gpio_quirk_polarity(np, gpios[i].active_high, flags);
+			break;
+		}
+	}
+}
+
 static void of_gpio_flags_quirks(const struct device_node *np,
 				 const char *propname,
 				 enum of_gpio_flags *flags,
 				 int index)
 {
+	of_gpio_try_fixup_polarity(np, propname, flags);
+
 	/*
 	 * Some GPIO fixed regulator quirks.
 	 * Note that active low is the default.

-- 
b4 0.11.0-dev-5166b

