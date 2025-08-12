Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FA9CA0EC4
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Aug 2025 12:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EnhxaXfLWBAe5wxXyN7EB4a4qBStRGqZ5wQqNK1Gqy0=; b=y4v3mtp4uY34dhilbDTbA3GjJE
	clzv6AJ6o6Cy53hwxL/Nigjaaml9kEC8299Clu/0JdhjSCqtZweY8m7HmQnQ6bC8UKZpYHdiEGexb
	++NV+jZfCx6JJrGtCwB501pIW/rLtV8M3ESNr4yNBSz+BtyO/w395+D8YYbx2AJenRDmCj1FSFKoc
	lamnGiCAICGEnn+0Pm3oXg2ntAdKKyhsKJhvFhrxj/NUKl8h2ld2y0NjO/10NRODJaEUjQm83QT72
	h6Wi3OFueM2S+hX/rOfN4yBO7mSJOEf40yE8JCXgXZG8FAbKE98sdmObHTBNjgoLYGDEf6gR7XlsK
	xKbDBzQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloFB-0000000AiUU-3BHe;
	Tue, 12 Aug 2025 12:36:45 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkLo-0000000AEgn-2MWt
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Aug 2025 08:27:21 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-459fdc391c6so24268155e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Aug 2025 01:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987239; x=1755592039; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnhxaXfLWBAe5wxXyN7EB4a4qBStRGqZ5wQqNK1Gqy0=;
        b=tuZiq6nXHMbr3YON/kXuffsqEPPYJpKOEehnWLr940DsSt97WqNiXTTh54hIrCNsL7
         9EFf6xOH1p05eYT3AUfU+C3hF2MNbmpTo3xvKA16xbpvTK0odeFf2U9Ee6omM1gg1o0i
         tAbtul4O1kuERTOr2IjPapwsqvS2lfS98KlSrPg9oasCdLjaYLu+IY2uc+T3HQJEWJNT
         nHGosa7ugbrO9PMKauo6ODhrJqa37Iph/x1gzx9iasfgak1WukD6PGJC0tI6myOquwzE
         kV6FnqOO3K4HZGPjgTXt2dJ2uPcat2vyBYWu3CjvLWamRjCG2iCvIfLNBNk0/NjIcIH9
         rEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987239; x=1755592039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnhxaXfLWBAe5wxXyN7EB4a4qBStRGqZ5wQqNK1Gqy0=;
        b=k9YUxnhJFMdmF9UULZeVAXpD+fbIl1aEpgtw6Swz5mTKmFF5lFmtHUXK5e9ihqML65
         y1bWV50PRBXKBvmvx7Sn1Gtdd11L4zn4Pjr+Dn8B3Jx8W+7MAIPBZeIHfTmkPaDbCnIr
         SnbOiGBsStvARcWgziHNO/kZEaCfw1IN8i68OKZUXQKkduyKSbaVMZust6dLABa8jSuv
         rcfQDrd/zx/TP1OV84Hom0q/RLAYkL/zuaD8fsGefI+UbRldO1/b/StJJ/RHU6HV/xk3
         39kWdnkiNWB6kmsFl2RtcSKtiZS0uO6OqFLS5VBPw4SPrX6yqQEXNu5zMcsMA1VlzHsT
         hTyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcoa8xfUsk23dk5xZSVTY7H0+3yzvIZ1yTv8Xr0GBrtvYt1u3qX9QmszvB1QbAKnZNwrBt9fr/dCl/4qH/Cw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFkwrJESpdJyzayhB9DP8iOw/i8N66oNFdGYbEy2BJjR7eVK69
	Y753w5LTIJDTw1YGwndrIDESrA9wDizJz8/00mTos8m9y10TIflXw90j0UB5/3gOLp4=
X-Gm-Gg: ASbGncsY0is6w0mFIhLWoh2Sb2M/y8hQYBaMCfZkEK50lyUTDNkkX9Ek6OSwKgPQUgo
	sqkzFEON5aoWKqk0ED7OMtumXWzfq+NhGc7rCHa9dQjqsqu3mhuwd5yeGLQN6+x3SWm9YgDEdKY
	xdcdtcq7b0X0GPUBnebNMzL9A3mJ0hdna7fyJM6SOxbV2xp0hDTJwE9NN9auX13qwud7zq822t+
	+9Sq/Wf+l4VAI0R3uLl0Kp1lll+lp9gIus18/XlNfLQhaJgkPQAYB4Uw7Z/9M1XO//mghhVxZcN
	7nOIPKT6fXNI3Wf57C9UIKRmYqs1P+Qf2UtYJn8lWfiSZgW4YtlsOL5GtrQJkY3MI+pDEt5zUgE
	Xm1z/lA8iCAWdWGk=
X-Google-Smtp-Source: AGHT+IHCxxphw0C1ysWW25fo60uK0xUciNoK6/brqWeyF0IqKEcM+9QCTW7mxqYhhnP5CYPiuHCuHA==
X-Received: by 2002:a05:600c:4753:b0:43c:fc04:6d35 with SMTP id 5b1f17b1804b1-45a10b95677mr23101005e9.4.1754987238810;
        Tue, 12 Aug 2025 01:27:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 10:27:05 +0200
Subject: [PATCH v4 06/15] pinctrl: imx: don't access the pin function radix
 tree directly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-6-bb3906c55e64@linaro.org>
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
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
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3088;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FuPiesxsrAA0Rn9DkOactcvX9/BHBoNthgyhyXGEhH0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrXvfSwc1aR/VkXuzCwVe/jTr/RkVSkQok9/
 6ZfT3vraKiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr61wAKCRARpy6gFHHX
 crU/D/47WmiHhr1jD4X7MX23IkaKdqa8H3X1+A1yMibQlOZwva+m91uzbA5E1KqKisV1OFMTrwM
 qQw8JodqYSC7dGdkQzBqDTIPr8qzRWzoSvMRK4SEMSkWN6JmzLvQkjkT0QFqmMWrU29Eu7a0K1F
 Dajot6d2+kAVgD6I14MGW8cJyorpzlsoHipAlEw12RWTEeduUUSmBSgSdFriSRaQ59MJPBKp8hZ
 kVe4zp0J0g84ajKZ+DnhXBhaHIQym7fLJR57ngkJWPemTobyqxz2105/iqorzBrO2YC4Y2pX36z
 cuDpKjunZLGwb4w0loqgMygcLK/bV/U5ML167wppqGTE781xJw8gTclK0ECkF06V9mMriWr5qog
 w0Iiq+SbqD84+qFscPmKzsUrqqSX0Ih35IZdHkB2+uOuY9wKhFsFauO5KIiHmPkgPvd1VHClNqm
 ItFa/4pd+kPjurFIxcHWHYyEQ5xM2PYjHpH1qPVzaQNzL0f+rZPoifcD1zBil+ildZtDLwNHbLj
 9bGuk4x45L/2ysZqyTqShL9pN8TnHn3mQrsZpHh+PUIe5e3hgaZi+P7oiTmtPmifDRFb/rJlKSM
 l7mYoB8Nx9U1KflhK7GPr2sCxhy436TecxSTqnjxs3nFe0iqlGJPyQMvKZURsDe/JEiBZVGu0+n
 KZOvfyXmKWunFeA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_012720_613012_78555180 
X-CRM114-Status: GOOD (  18.75  )
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
 drivers/pinctrl/freescale/pinctrl-imx.c | 38 +++++++++++----------------------
 1 file changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 18de31328540458b7f7e8e2e539a39d61829deb9..d5d42c9ad5fe9dcf7c25ad393688e714b02db678 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -580,33 +580,34 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
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
 
 	i = 0;
 	for_each_child_of_node_scoped(np, child) {
@@ -614,10 +615,9 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 		if (!grp)
 			return -ENOMEM;
 
-		mutex_lock(&ipctl->mutex);
-		radix_tree_insert(&pctl->pin_group_tree,
-				  ipctl->group_index++, grp);
-		mutex_unlock(&ipctl->mutex);
+		ret = pinmux_generic_add_pinfunction(pctl, func, NULL);
+		if (ret < 0)
+			return ret;
 
 		imx_pinctrl_parse_groups(child, grp, ipctl, i++);
 	}
@@ -669,18 +669,6 @@ static int imx_pinctrl_probe_dt(struct platform_device *pdev,
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


