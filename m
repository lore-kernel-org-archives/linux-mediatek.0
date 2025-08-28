Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A11CA0EED
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Aug 2025 19:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5cgLuuNEHZ/uYnDNb6dxgb48v4u6axzoTiam4WWN7C4=; b=xUcNVoG3tvCjACLurl3p0nn2uz
	Ju3dHuN9Z80P1w4h3fzkU3BQqpYi+Bhz+OvIPvvE79UbMpbXqIljZwilQQMYoeGfop+tqJsKIImj9
	Eyz19nroPCqwbO8C65S45E/YYfG39n/LkbzgI8ZaORXVOGX8uYYFmuBTQNHUf7ujWyTJblU/mARlC
	W/6TK+hxZUK0BVrSrTfWvmkKZ3yuGmbE5Th9Ijz7VsW0YvVWlDSuLIMgU6+QiIXWElG9cWuHj229W
	cnTAA+4LEb570KK6jQdscN1xPw1AZvfhtgOjfvSX8zIPf079OqmbKHiEIXucib4RqdFiET5/prTSZ
	z5pA2tLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhvB-00000002vGa-3Ez8;
	Thu, 28 Aug 2025 19:04:29 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urf3J-00000002BRJ-0z4E
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Aug 2025 16:00:42 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45b618e067eso15724975e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Aug 2025 09:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756396840; x=1757001640; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5cgLuuNEHZ/uYnDNb6dxgb48v4u6axzoTiam4WWN7C4=;
        b=D4v+ELKm07iZsoVGf7l/eNOslKonX1XGUYd1iN1gtnIb+cFvoF0VB6bxUP8pGqrqkW
         MdY9sHwzedurcEYXRu4KlD9TQlqCg41M8BI6R0Av/V/z8wYaC+23AB/eXjshjNU+Jq70
         /0F/edLlcGmrhkU3y778HcdDLYbA6xROWrJOcQpGuDHW1c5wl1/ODlO8UdwW7uYCRknM
         Jt6ho9m0VL9LyiOG5icGVP77UDOIYXVYGa0TlaOLzmsbyy3JYihDKrnANAwtZG+uGAGJ
         g4hgnlcNlE38xoAbfccWWgrtVieLR8ttTiXaW2Uht2zA3H3rEXilNbGrKzS42Sj4j19I
         Bbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756396840; x=1757001640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5cgLuuNEHZ/uYnDNb6dxgb48v4u6axzoTiam4WWN7C4=;
        b=d0eTTP8zrUSWQtwDMNohYZexLllYXz90C7MAbjbiAdUfe6sku5mOLgpMDccW+Nk1D0
         uptLUHCoN+rlg25NybCyjXJ9KEXD4dtHi0f2kmlai9Txi25UJ8JgJupZV8fuoW2d5BJ5
         iaXh+TvY2rLaAfKe4LnMhGraV053PcgCk8XvAM7yJ8kgQK8fnUKftYS+fJf8EXdYwhvw
         4a2AUyB0wHYFXKN8qBebvRF9nsBCMVOQUIW4hiKboK4ezYs8f9RE5zdhhLlXPtRdCxEk
         Sw6fEjFdUgq2PEc1xx8fgbUBYUQiI1Tcab1PzGG/otQ/gNOKdwT75OGKLBT6hJOpdH3u
         aYow==
X-Forwarded-Encrypted: i=1; AJvYcCUyx5IjMuzQ65Y87vpNuZL43LaLaYpSP/7zzOEBe3dYoR8RGMQOfecTj+b8apqKOQAtdYPhx8yEyZPov4SRdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/TPXFle4A08pFKnI9bvOXajX7x7H8Jqxz+qO6Xb0naXscAe3S
	4wyvT+Z/dgmh/hWQhZ765ISIW9v3yg7A4ox/BI9i6uPG7qhmTIx1/cJDdNd4LP/fi0k=
X-Gm-Gg: ASbGncs2zc+d7zpkUtqe7ZIYmwIEX8ymkLRkTaC2yomLbbfsexgbEvgRsCdVgTpOPg5
	KKe6KZIPUhTPhgN1HPEcnELWOfgAwtwrti0wb3HrWai3QP+zbaQwAiGpw3aWLOGaVcdiQjleKye
	Q03ypYCGzu7X0XNpqP+nBqVEHx9trBjURTodmNWIwxAJn3JlsS5XU4H2ex0lrjQjZQ5gcYIgJjp
	Cb7c1xLTvgeK2D7ZKeaIWp5UgB8PPddYGMx5WJX4DEhfBvyQ9O/2ebhiGxaP4c2hRIBDYVVenRN
	OSfJMu/aKT4g8garslLW3M9rxy91O5lrNuBAdMsBQqyxr0c5j710r+8VZl3/mc4MWGhfe7qFHZj
	biJXJfnMQjq+w98j8F+LlukdEjeNz
X-Google-Smtp-Source: AGHT+IHY93xJicIhLfSdUidEzVpKHtPobrQXprg+Ck+5hE5qf9qNEqu57kxQutrcB+RtoXUB4WrEqA==
X-Received: by 2002:a05:600c:5246:b0:458:6f13:aa4a with SMTP id 5b1f17b1804b1-45b68b79262mr97078985e9.6.1756396839658;
        Thu, 28 Aug 2025 09:00:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm80211675e9.5.2025.08.28.09.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:00:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 18:00:20 +0200
Subject: [PATCH v6 12/15] pinctrl: allow to mark pin functions as
 requestable GPIOs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-pinctrl-gpio-pinfuncs-v6-12-c9abb6bdb689@linaro.org>
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
In-Reply-To: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7248;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=cNbq67lYy5x2lWhqKySAtFll26hPMdSh5sE8Ox6iL2Q=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosH0PNGB6avixd0d4STpVF8wM5h87O2Lo5z2Kz
 bDbg4b/QXaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLB9DwAKCRARpy6gFHHX
 cqwYEACp9WcPOcy4gcfDh/LJJl3cXfpEoQwSAP1WBDPryd/nzyb+k1ROOY9B4LpM+IlXz7zoD5m
 4enSFZkdcYJf5OO80aWnvZN+c3oWCigs7WrMSdDoZ2wdPT/iHo8o0otbFvuk0WUlO9iOZPsZ430
 zWyy8AjRs5AxBwxee/C+MI/MsHcTmJxftuxqn/QZSUzjO4HdsYvSRORiDo9LG0IR+XKDC7rIAW6
 Hy2KsGziEum8j+RtK8udciPRz8b4Jrh/d3Ln1xTmqrCL4QhxGKjNiQG9vDHM2ufPi6ZHlWEtGuu
 w0fiUIG8vrnfMwAVz37LYjiYiVuaz3LTNKFy22jcPW/4msoW66y3NBn23pMqkuHVhIqf5BtCPeg
 n6zXZEFx7QbhvYIM7xhxgGciQAlKz2E9WONdxT4V/40OMzQzSHOjnJ0lVi4777IFfOoL2nE2KEL
 W48IdClDet9yldUS/sDS5N/LMmy9SpHdIH25+Q1gdX60QAQCN+NY5yvPMCrzzeaiBRcQGS7ufoK
 3ldEFyHY8UA6PKuNdsK4Ikns5jS/8E+37Jw0lYI+RsahMEx0txavgZA46S6nxj/8gMaD5IK4I3w
 ax66JFhNeIfXBqRZnEfpOh68bNIdhR6i+nG9FUJv4YXhIKoXfbtkJDBO71lKwsBsDHe6v9ZGXct
 OzAWs5aoyt5lRYg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_090041_397854_456A288A 
X-CRM114-Status: GOOD (  23.73  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The name of the pin function has no real meaning to pinctrl core and is
there only for human readability of device properties. Some pins are
muxed as GPIOs but for "strict" pinmuxers it's impossible to request
them as GPIOs if they're bound to a devide - even if their function name
explicitly says "gpio". Add a new field to struct pinfunction that
allows to pass additional flags to pinctrl core. While we could go with
a boolean "is_gpio" field, a flags field is more future-proof.

If the PINFUNCTION_FLAG_GPIO is set for a given function, the pin muxed
to it can be requested as GPIO even on strict pin controllers. Add a new
callback to struct pinmux_ops - function_is_gpio() - that allows pinmux
core to inspect a function and see if it's a GPIO one. Provide a generic
implementation of this callback.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinmux.c        | 46 ++++++++++++++++++++++++++++++++++++++---
 drivers/pinctrl/pinmux.h        |  3 +++
 include/linux/pinctrl/pinctrl.h | 14 +++++++++++++
 include/linux/pinctrl/pinmux.h  |  2 ++
 4 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 6f5e3ede972bbfa78e279790df359632e2d63485..c01814b5b7cb43acd748153e08ce65f5ca7a7b9a 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -89,13 +89,20 @@ bool pinmux_can_be_used_for_gpio(struct pinctrl_dev *pctldev, unsigned int pin)
 {
 	struct pin_desc *desc = pin_desc_get(pctldev, pin);
 	const struct pinmux_ops *ops = pctldev->desc->pmxops;
+	const struct pinctrl_setting_mux *mux_setting;
+	bool func_is_gpio = false;
 
 	/* Can't inspect pin, assume it can be used */
 	if (!desc || !ops)
 		return true;
 
+	mux_setting = desc->mux_setting;
+
 	guard(mutex)(&desc->mux_lock);
-	if (ops->strict && desc->mux_usecount)
+	if (mux_setting && ops->function_is_gpio)
+		func_is_gpio = ops->function_is_gpio(pctldev, mux_setting->func);
+
+	if (ops->strict && desc->mux_usecount && !func_is_gpio)
 		return false;
 
 	return !(ops->strict && !!desc->gpio_owner);
@@ -116,7 +123,9 @@ static int pin_request(struct pinctrl_dev *pctldev,
 {
 	struct pin_desc *desc;
 	const struct pinmux_ops *ops = pctldev->desc->pmxops;
+	const struct pinctrl_setting_mux *mux_setting;
 	int status = -EINVAL;
+	bool gpio_ok = false;
 
 	desc = pin_desc_get(pctldev, pin);
 	if (desc == NULL) {
@@ -126,11 +135,21 @@ static int pin_request(struct pinctrl_dev *pctldev,
 		goto out;
 	}
 
+	mux_setting = desc->mux_setting;
+
 	dev_dbg(pctldev->dev, "request pin %d (%s) for %s\n",
 		pin, desc->name, owner);
 
 	scoped_guard(mutex, &desc->mux_lock) {
-		if ((!gpio_range || ops->strict) &&
+		if (mux_setting) {
+			if (ops->function_is_gpio)
+				gpio_ok = ops->function_is_gpio(pctldev,
+								mux_setting->func);
+		} else {
+			gpio_ok = true;
+		}
+
+		if ((!gpio_range || ops->strict) && !gpio_ok &&
 		    desc->mux_usecount && strcmp(desc->mux_owner, owner)) {
 			dev_err(pctldev->dev,
 				"pin %s already requested by %s; cannot claim for %s\n",
@@ -138,7 +157,7 @@ static int pin_request(struct pinctrl_dev *pctldev,
 			goto out;
 		}
 
-		if ((gpio_range || ops->strict) && desc->gpio_owner) {
+		if ((gpio_range || ops->strict) && !gpio_ok && desc->gpio_owner) {
 			dev_err(pctldev->dev,
 				"pin %s already requested by %s; cannot claim for %s\n",
 				desc->name, desc->gpio_owner, owner);
@@ -861,6 +880,27 @@ pinmux_generic_get_function(struct pinctrl_dev *pctldev, unsigned int selector)
 }
 EXPORT_SYMBOL_GPL(pinmux_generic_get_function);
 
+/**
+ * pinmux_generic_function_is_gpio() - returns true if given function is a GPIO
+ * @pctldev: pin controller device
+ * @selector: function number
+ *
+ * Returns:
+ * True if given function is a GPIO, false otherwise.
+ */
+bool pinmux_generic_function_is_gpio(struct pinctrl_dev *pctldev,
+				     unsigned int selector)
+{
+	struct function_desc *function;
+
+	function = radix_tree_lookup(&pctldev->pin_function_tree, selector);
+	if (!function)
+		return false;
+
+	return function->func->flags & PINFUNCTION_FLAG_GPIO;
+}
+EXPORT_SYMBOL_GPL(pinmux_generic_function_is_gpio);
+
 /**
  * pinmux_generic_add_function() - adds a function group
  * @pctldev: pin controller device
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 653684290666d78fd725febb5f8bc987b66a1afb..4e826c1a5246cf8b1ac814c8c0df24c4e036edd2 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -169,6 +169,9 @@ int pinmux_generic_remove_function(struct pinctrl_dev *pctldev,
 
 void pinmux_generic_free_functions(struct pinctrl_dev *pctldev);
 
+bool pinmux_generic_function_is_gpio(struct pinctrl_dev *pctldev,
+				     unsigned int selector);
+
 #else
 
 static inline void pinmux_generic_free_functions(struct pinctrl_dev *pctldev)
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index d138e18156452e008f24ca06358fcab45135632f..1a8084e2940537f8f0862761d3e47c56c8783193 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -11,6 +11,7 @@
 #ifndef __LINUX_PINCTRL_PINCTRL_H
 #define __LINUX_PINCTRL_PINCTRL_H
 
+#include <linux/bits.h>
 #include <linux/types.h>
 
 struct device;
@@ -206,16 +207,20 @@ extern int pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
 				  const char *pin_group, const unsigned int **pins,
 				  unsigned int *num_pins);
 
+#define PINFUNCTION_FLAG_GPIO	BIT(0)
+
 /**
  * struct pinfunction - Description about a function
  * @name: Name of the function
  * @groups: An array of groups for this function
  * @ngroups: Number of groups in @groups
+ * @flags: Additional pin function flags
  */
 struct pinfunction {
 	const char *name;
 	const char * const *groups;
 	size_t ngroups;
+	unsigned long flags;
 };
 
 /* Convenience macro to define a single named pinfunction */
@@ -226,6 +231,15 @@ struct pinfunction {
 		.ngroups = (_ngroups),			\
 	}
 
+/* Same as PINCTRL_PINFUNCTION() but for the GPIO category of functions */
+#define PINCTRL_GPIO_PINFUNCTION(_name, _groups, _ngroups)	\
+(struct pinfunction) {						\
+		.name = (_name),				\
+		.groups = (_groups),				\
+		.ngroups = (_ngroups),				\
+		.flags = PINFUNCTION_FLAG_GPIO,			\
+	}
+
 #if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_PINCTRL)
 extern struct pinctrl_dev *of_pinctrl_get(struct device_node *np);
 #else
diff --git a/include/linux/pinctrl/pinmux.h b/include/linux/pinctrl/pinmux.h
index d6f7b58d6ad0cce421aad80463529c9ccc65d68e..6db6c3e1ccc2249d4b4204e6fc19bf7b4397cc81 100644
--- a/include/linux/pinctrl/pinmux.h
+++ b/include/linux/pinctrl/pinmux.h
@@ -66,6 +66,8 @@ struct pinmux_ops {
 				    unsigned int selector,
 				    const char * const **groups,
 				    unsigned int *num_groups);
+	bool (*function_is_gpio) (struct pinctrl_dev *pctldev,
+				  unsigned int selector);
 	int (*set_mux) (struct pinctrl_dev *pctldev, unsigned int func_selector,
 			unsigned int group_selector);
 	int (*gpio_request_enable) (struct pinctrl_dev *pctldev,

-- 
2.48.1


