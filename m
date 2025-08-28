Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA788CA0FF7
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Aug 2025 19:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jR/UQSU1rnoJqXet1GHMjYE6RZmBJb0DIB3rVaGeplw=; b=N9wlRI6xy/LGeFJ400M+ys9TP6
	b0xdRp3GtRk2hvmFDacM2uKxO55bfAZW/eKg9/3TXXAQa6Rl3eHW0voMAwTmRu8AV5DTr25IEL+ba
	PYlSO7wyyS2wJj0knxxOFKhxFW5La2Pg09ZwbafgeMuoiZDbNuqiFutLds/AeqfUjReYx5fr6J9OX
	sF6jHnk4Sqn4LPyeNGHVVXv7X6NdrD7yoixjXfNVFKYDjYDCUwMQKKEa4xDyTve6WIGSj5UoCBYTG
	cSjZzspO0Uuksm2QoWYcCiXFoecTXYKNHYD56fTGZkAD5OlyTkAAAlm8V3db5W/+yDX1aE5ImpTOI
	zRJM0E4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhu1-00000002ugz-0Jgv;
	Thu, 28 Aug 2025 19:03:17 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urf38-00000002BJw-1PTn
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Aug 2025 16:00:31 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3c79f0a604aso713547f8f.2
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Aug 2025 09:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756396829; x=1757001629; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jR/UQSU1rnoJqXet1GHMjYE6RZmBJb0DIB3rVaGeplw=;
        b=O8E2lrUFQhP341u3SRorLNQAasH5vByqDo0x+u9GLg72Tq7tqy9gmWN/5DKknEZBhN
         E6hI0Q9xVcw7bNIK0okb4w3GkRGxwceN49bz7/Pb7FzMHnwUYy/l/iWZt+PwnumVw3RZ
         T8dxShjaJLVGrydHDeEP4o/FQMd70Jr0Q5vQnyEYKxSmzlLb9gZxDDYZA9xbSCIKHkA2
         rNpP9PGtlblu30oan+neE4dNyAi47p9LWfF/rA5AQ1OzMsz0aRh0Xt0qwJxd94eQ+A5W
         bas36s2Yx/AVpc7bKBp3YajEf6op5qsbuSpG9BrzYi5DAtA1iwVpnjYVCLQ0Qk8ZDKV3
         ebkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756396829; x=1757001629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jR/UQSU1rnoJqXet1GHMjYE6RZmBJb0DIB3rVaGeplw=;
        b=VUJl+Dy1MpUd4+wQ1P+35P+WY223MWtk2Nn0szTGGNBslbZZGsxZP5YaQunfpeO0Ab
         kSXKBoJy42IMDxI4D5KoKAUufgxwDml2cftpJ6DM8d1+7eEEbkxNVArs13pxAOHeI44F
         fW+zFI+2km8ngtyLYxac6lnEqhcZ/SCJURVfejVtCetXKZTK720szWH9F5clHeZrSekv
         FxDFAC9EqbUwPdRbAWKLX7BK1OzYyGXqPLwUmXMeIW+83YfHJKIQk+4taRqBd7wWanFY
         tdfxKhzJomzWZ+FArpTmc5gfEhuNhZkJoIJx/43CKZeIw+sqi3L1sDAwHErE9hgbPpN8
         C/gw==
X-Forwarded-Encrypted: i=1; AJvYcCVZfYg5QBu5IaUEXRIIzZEOVrofQZL8Q/dt70TPLlNsMp4kd/EYviDbWW6siCL7kcPTk7KONKZQXcoqKN3JVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwB09MfOft7omgBbpkOZle4++pMKt08dFUHUcZlkVITypYQi7PD
	T5mH1O+9g3DODkXQpf3GrGO1815hByylZs6rs9RBiN1M4AX28/7kxnnc6Ty+gBIaxZ0=
X-Gm-Gg: ASbGncu6bQ/hRNV9M5DFbz28JZEN4CD13VHVvq6PY+OVAZM5Ypug33d/hYcDxWVyqkK
	DwYO7dVf8ulUNAOFsYr2eKz1VUEDMdD4acI9RSQS8eIezZxdSJbhBryWVEZ48WvBqDe4Adp8xyp
	j0FDgnA9yLN/F8IwvDZNQn1P+1YpgUGZWR4qcM36VUUYHJQe/fOENxbSj38SHnUJWQEmdUZWkEw
	N/d9Csletab52yapkFzzYUJNQqLU3iXphWEWIXbhG9/RyPowUVUy355s6AElGOxjg0x6Hsfq5xU
	FX2MXTdjCRLOzytI3HHb51husxJ6/Uykix0SNuTYlABR25QWJY5dxFX9kcQdr0CnJNE8f05DcPF
	1taCoHzblh6hgWK2sWQ==
X-Google-Smtp-Source: AGHT+IHpa7seq9vvwG4pSrNyoWglcHVRKIa3k9MGizj9olBncMjomjsG4dZCZ0gf35TjhrILqQH5rw==
X-Received: by 2002:a05:6000:4029:b0:3c3:806c:b82f with SMTP id ffacd0b85a97d-3c5dd0ecf8amr20776060f8f.58.1756396828557;
        Thu, 28 Aug 2025 09:00:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm80211675e9.5.2025.08.28.09.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:00:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 18:00:14 +0200
Subject: [PATCH v6 06/15] pinctrl: imx: don't access the pin function radix
 tree directly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-pinctrl-gpio-pinfuncs-v6-6-c9abb6bdb689@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3140;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=64CEOM/GWFRZVaWr+uKwrz1KsAW3NNZpIdWvwWCf200=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosH0NaAPsNFFrpH1CGMcLygHSJdcPneCN6Unyj
 uWMtG9dPUOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLB9DQAKCRARpy6gFHHX
 csz2D/9MgJP+ectOeSj5tPh3IRoQSIVu4AU0U2BIk9qLJsstYn5YRISv7Lr58AGRakRZh0m8/iL
 nNYJSQ98/gglKMupuS/yKusX9iGKVWnw8cqQtR2qBPGmRcImx2/9e7HLfz7CCVT/iDAjPPeMjUg
 YyeBqbeDoAKR72CednspSFx12VxQ7Ja4n65O2y2fjtejtwiGFuNvud6b8+pa/eKxHeIkigHEh5/
 T71+1u33HaK5IxJVGK5qUbh7pJm+lSgmHzuPOJN9R8CcQO6lPBSWP9VXM63VfHNUfkyoPokJSyz
 Sxf/B6Qkyzd49YG3csk8gtZiCCKGeJeBgbEt5oY7bbuS4sOICYGYc42MEa1akallSWRvGv6LRxt
 VSBbX2tu/t5fI8EdOgROdf0H+VFhKPpz5Nytk6raLEJDU0dwyqO+Gnj8gGhHxOb8i3xBVJAN3+e
 oE6PlAYq1yoX/GSVH5H4ADkWHVGM922imRvR15JI7TpVxnLWaGZ0chIV87cWv3rtvcLtI5mW2Fr
 B+7CeIdbYV9gHFjqLi6dmVbK4CJXBZS8z/5DqhmeKNRvDwYkxvZBUfHoz6MdXw3oLpMfA7kO2Ar
 g9WkATffjdMY9P7gz7AyeDLdWVlb4LSx5uyzu3rOuNrmxYeEg//XgZ5loqLh0eTb8Oth0yRUqaa
 tb3/62Fap1QUnSg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_090030_407214_D3285241 
X-CRM114-Status: GOOD (  19.17  )
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

The radix tree containing pin function descriptors should not be
accessed directly by drivers. There are dedicated functions for it. I
suppose this driver does it so that the memory containing the function
description is not duplicated but we're going to address that shortly so
convert it to using generic pinctrl APIs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 39 +++++++++++++++------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 18de31328540458b7f7e8e2e539a39d61829deb9..3d626d8c9ae9ebd5f7eb76216924c46b34233749 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -580,33 +580,38 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 				       u32 index)
 {
 	struct pinctrl_dev *pctl = ipctl->pctl;
-	struct function_desc *func;
+	struct pinfunction *func;
 	struct group_desc *grp;
 	const char **group_names;
+	int ret;
 	u32 i;
 
 	dev_dbg(pctl->dev, "parse function(%d): %pOFn\n", index, np);
 
-	func = pinmux_generic_get_function(pctl, index);
+	func = devm_kzalloc(ipctl->dev, sizeof(*func), GFP_KERNEL);
 	if (!func)
-		return -EINVAL;
+		return -ENOMEM;
 
 	/* Initialise function */
-	func->func.name = np->name;
-	func->func.ngroups = of_get_child_count(np);
-	if (func->func.ngroups == 0) {
+	func->name = np->name;
+	func->ngroups = of_get_child_count(np);
+	if (func->ngroups == 0) {
 		dev_info(ipctl->dev, "no groups defined in %pOF\n", np);
 		return -EINVAL;
 	}
 
-	group_names = devm_kcalloc(ipctl->dev, func->func.ngroups,
-				   sizeof(*func->func.groups), GFP_KERNEL);
+	group_names = devm_kcalloc(ipctl->dev, func->ngroups,
+				   sizeof(*func->groups), GFP_KERNEL);
 	if (!group_names)
 		return -ENOMEM;
 	i = 0;
 	for_each_child_of_node_scoped(np, child)
 		group_names[i++] = child->name;
-	func->func.groups = group_names;
+	func->groups = group_names;
+
+	ret = pinmux_generic_add_pinfunction(pctl, func, NULL);
+	if (ret < 0)
+		return ret;
 
 	i = 0;
 	for_each_child_of_node_scoped(np, child) {
@@ -615,6 +620,10 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 			return -ENOMEM;
 
 		mutex_lock(&ipctl->mutex);
+		/*
+		 * FIXME: This should use pinctrl_generic_add_group() and not
+		 * access the private radix tree directly.
+		 */
 		radix_tree_insert(&pctl->pin_group_tree,
 				  ipctl->group_index++, grp);
 		mutex_unlock(&ipctl->mutex);
@@ -669,18 +678,6 @@ static int imx_pinctrl_probe_dt(struct platform_device *pdev,
 		}
 	}
 
-	for (i = 0; i < nfuncs; i++) {
-		struct function_desc *function;
-
-		function = devm_kzalloc(&pdev->dev, sizeof(*function),
-					GFP_KERNEL);
-		if (!function)
-			return -ENOMEM;
-
-		mutex_lock(&ipctl->mutex);
-		radix_tree_insert(&pctl->pin_function_tree, i, function);
-		mutex_unlock(&ipctl->mutex);
-	}
 	pctl->num_functions = nfuncs;
 
 	ipctl->group_index = 0;

-- 
2.48.1


