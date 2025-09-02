Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F39CA1005
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Sep 2025 15:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HPt8gvlEjpDQTK76H3vkguPR1nz45r4YrgyISuAo6sA=; b=eNRxUWsD7a/Gi6TCEmvlLfnvVK
	Eo3Dql3mbc7la12E9vrt3cuF5IVZ3BXcRZuA8xDxhr1JdQbRVI6S6cTluQBJzlI2IHbXWzKE7CS9P
	MI9zHjWxYxf7XUofVZ1COQAaejO/AoR16R849KGrndGkj9QycQAy4vztCw30mj6DoB7NscbU3sYna
	SQqURmZ7AYf2guPq6ZCcWmgS8wFZGKImhCapJYknf6BULRTTDUgcHuVP9GKak3jccyMGHNvXj4aph
	h9cTLarBs6PYgvAvn4HrIG1w8A3q97TEbar9tlsTs+SuMOl4l0sohSgeeI1yPP01vTc5pk/BuiKiq
	MR8DNMAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utSqO-00000000eWv-0lTz;
	Tue, 02 Sep 2025 15:22:48 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPfn-0000000H4W8-0nVn
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Sep 2025 11:59:40 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45b627ea685so45016965e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Sep 2025 04:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756814378; x=1757419178; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HPt8gvlEjpDQTK76H3vkguPR1nz45r4YrgyISuAo6sA=;
        b=yHNDQxUZXdZoaUEJF9N93pI0D/+tVCNLuBbXSAjUEIzzAOC1BgGSctBmWtRnAZeZ6y
         Vuv16nJ/CF79tqoom2yKKUwyG/VYXaKY4D4fhEpudG6kH/tx7xles2ZopT0AP0iwNI3s
         WuyZHw3Vx6Ewtx6ynA/XS3xLYZGQlIo9Zw6412bHJQ/0OuIXHrRwjpMtWNl9QssYvzlG
         ztT5XvDda75GZESWIINnZW5gmSiarI9kwASubJcyXM4EmqwfCngl7rbFTpbMJ2JNLKgt
         mDCAoWjQVO4OAUBfMGAZLGn92+Bq1d9lyO0b17jOqOg9DMHTn1yJIi29qdqf9z5psZEN
         S/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814378; x=1757419178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPt8gvlEjpDQTK76H3vkguPR1nz45r4YrgyISuAo6sA=;
        b=nunU6hO13EBzf/X1Dmzlv65+JCcRIoby2mMKqHii/eoUMDXzU/zT1Mx2FrMyxX60TN
         gKLOa8e6E0IwWDJK3428WGYvKR+oFdJgOcSM1qsVC484zEd/R0YbJP/GmQhPyuVvfvLJ
         FIxHSiwWmwK9s7jrVAc5YbNc+BQggNts/c+8DaxzSxm6TufPNUOy/Wvq2fcVALRFVzsd
         5kn4cl93L7m20GrpD+IKveCVxU+6aUTTZlUvlbCQM0b6FcWCTH4wV658x3giNz7n0PDz
         m5/7r/HB6brj5D/lfMCJkMZmMiP4FUaMd97GMVeoQib8RIzk1CQk9NQBYSXi1gvhrwM2
         z2eg==
X-Forwarded-Encrypted: i=1; AJvYcCWF939ecGLlFk9vDaOid7bCeS2eG41bj7YYiRGDUi0OEAbpTDuUWg458ZCP1Kj6bieEu6fdy3DcAoIY8YilrA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzW2Ix3MEvnVhH6CcjTyFpb133ivpTeLAf5ZjbEw6UZppygk3q+
	KumdaDXkBD0C7lsqJyhsnPadnv9pkE1XfD5UuPNxpaumVOzJCvOVniRPc93cT5EO9M8=
X-Gm-Gg: ASbGncsE01X6OtMA5s6A3+EKAQzqM+TH6grMA4YlEgDuuGKWbO18BLEP9LSFABxbVNK
	ux9t1fJamEkoDwesAD+SS6dV1MTXaczEPATVhF56fYZID+Wo19y2/MgGhkv3Y2gWHg1eaoauOBb
	DbK5sT87KP2CXT5XyFwX+CQdd7864n2fX5QwkEuL4SnFgmx6ZVGzgCIkDgyChw1odfBpeOxJFLk
	WNrTqug/O4wPldZc2ogfqsrZi9FmO5/U6Phdo+uPdqmEvP6C97Ue5e6s+P8Wb3hoki1QDeNvDt3
	m8/JTL4JsCC9S+um5HOvmnPnbz7hPYWBMEmKf4WLaf8PrF7QmS7EWMNupf7yqDls5z+VqQxwmm3
	CT7iD8J9qyvmbZnmu
X-Google-Smtp-Source: AGHT+IEXxOo4z4yAeoQlkFOtnjlAQNS/tph/UfDFWhMsGtwbVd/rb4cnwy5YUM0kM5fJazYx9xpgkw==
X-Received: by 2002:a05:600c:4687:b0:45b:8e26:5f46 with SMTP id 5b1f17b1804b1-45b8ee17c88mr52018185e9.5.1756814377701;
        Tue, 02 Sep 2025 04:59:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3327:447f:34e9:44f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9c234b24sm10224195e9.16.2025.09.02.04.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:59:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 02 Sep 2025 13:59:20 +0200
Subject: [PATCH v7 11/16] pinctrl: make struct pinfunction a pointer in
 struct function_desc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-pinctrl-gpio-pinfuncs-v7-11-bb091daedc52@linaro.org>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
In-Reply-To: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5299;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=7zPuWJKCi3W/APCCISK85dTCZM4XZbn46J4D4451eVE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBottwUiKOInObUndgch3MKKYY2s4jaFgidDJSCQ
 h6iRThYRN+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLbcFAAKCRARpy6gFHHX
 ciuZEAC4P8XFy/z/dPHBoKdgqbmvJtQw7Hsxiwp7RwIKdmC6w3qd4q+WzFqlyiwDQXnES/qnpC3
 D5cnkNqC7eO8sGZEwg7V4s/DyQn2O5WmTYQiiQ/eGLLoVv+drovg3G4fdjwSCjzJmjatVV51k0R
 bjqrd30zT2cMLegn/Zo1ycMwKRpXHqNJKYs8Ja3yeSJKRxxWCXf8m1jh6c+o4g+eEgJRIJaK/uk
 Z+TOO0HtXrzKa2x8Vmqevg9+6B4FLQRMOuhAgcp59eACh65TASHH9SlG1M1TSHV8t2zoo2Elhr7
 sPdm7j1eJ1paD9KeGRkPOtk1ovdCPAtAY0nHQaaBCyWY4+R7Oi8xZSWsxTWg1OshqP2F104YBay
 leQDYLDVkrnhdU4QJfaJv2+CjoxvbiSk9BQzwSiGB8mCCNd95+b3XbP2jf/BpAKzJMcOMHhVi4N
 H9KleCUWal4+JEQOKMOEtq2Fnxg/0okYVWlJk9jZfRUHBbst4bTrAT2PYz4gW6cq++UCVf7Nsre
 Gky0m4k34pK+ynwTGMGCPLGppT0pqAd8kPU9+VDjpAj0yzC/qt/oyqrYyyCi3yvjzQi0UtGu/EJ
 2D/E3uPP6c7qUebkXHFqc55URWRiYfVvxSTa//SnOFHPX+g0dXooc05xgP88iF+s++rWyHCYUW1
 9d3aGQPVLm4hGGw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_045939_276556_FAA7B81E 
X-CRM114-Status: GOOD (  18.98  )
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

We currently duplicate the entire struct pinfunction object in
pinmux_generic_add_pinfunction(). While this is inevitable when the
arguments come in split through pinmux_generic_add_function(), users of
pinmux_generic_add_pinfunction() will typically pass addresses of
structures in .rodata, meaning we can try to avoid the duplication with
the help from kmemdup_const(). To that end: don't wrap the entire struct
pinfunction in struct function_desc but rather just store the address.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/freescale/pinctrl-imx.c   |  2 +-
 drivers/pinctrl/mediatek/pinctrl-airoha.c |  2 +-
 drivers/pinctrl/mediatek/pinctrl-moore.c  |  2 +-
 drivers/pinctrl/pinctrl-ingenic.c         |  2 +-
 drivers/pinctrl/pinmux.c                  | 18 ++++++++++++++----
 drivers/pinctrl/pinmux.h                  |  2 +-
 6 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 39c582a25d8fe9ff24cc2b7d8b5a4d4e9fe982cb..731c58ad43eea98ba65de5d05755f9d33dd51951 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -266,7 +266,7 @@ static int imx_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 	npins = grp->grp.npins;
 
 	dev_dbg(ipctl->dev, "enable function %s group %s\n",
-		func->func.name, grp->grp.name);
+		func->func->name, grp->grp.name);
 
 	for (i = 0; i < npins; i++) {
 		/*
diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 954435f74f8c128577ef23da8248368e5c145f6e..76639643ed3f2f3582d5402367064684bc5bdac4 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -2456,7 +2456,7 @@ static int airoha_pinmux_set_mux(struct pinctrl_dev *pctrl_dev,
 		return -EINVAL;
 
 	dev_dbg(pctrl_dev->dev, "enable function %s group %s\n",
-		desc->func.name, grp->grp.name);
+		desc->func->name, grp->grp.name);
 
 	func = desc->data;
 	for (i = 0; i < func->group_size; i++) {
diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 17a08c73423fd089066e4894d2307c852bbbb661..11dc525eb3a2dc8ceabf2278ee1a2abaa425eec1 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -56,7 +56,7 @@ static int mtk_pinmux_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	dev_dbg(pctldev->dev, "enable function %s group %s\n",
-		func->func.name, grp->grp.name);
+		func->func->name, grp->grp.name);
 
 	for (i = 0; i < grp->grp.npins; i++) {
 		const struct mtk_pin_desc *desc;
diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index e13ef07850386e70cffc83011589ceaf70a70a41..e5b24fab12e11e443df25ffeb7b70d7c1a03c6bc 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -4015,7 +4015,7 @@ static int ingenic_pinmux_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	dev_dbg(pctldev->dev, "enable function %s group %s\n",
-		func->func.name, grp->grp.name);
+		func->func->name, grp->grp.name);
 
 	mode = (uintptr_t)grp->data;
 	if (mode <= 3) {
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 1529d7b6c6657eed23dd1f3daac1fd7444efd1f7..07ec93f09334f8ba8f8cbde4c54fd6a894025ae6 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -810,7 +810,7 @@ pinmux_generic_get_function_name(struct pinctrl_dev *pctldev,
 	if (!function)
 		return NULL;
 
-	return function->func.name;
+	return function->func->name;
 }
 EXPORT_SYMBOL_GPL(pinmux_generic_get_function_name);
 
@@ -835,8 +835,8 @@ int pinmux_generic_get_function_groups(struct pinctrl_dev *pctldev,
 			__func__, selector);
 		return -EINVAL;
 	}
-	*groups = function->func.groups;
-	*ngroups = function->func.ngroups;
+	*groups = function->func->groups;
+	*ngroups = function->func->ngroups;
 
 	return 0;
 }
@@ -903,7 +903,17 @@ int pinmux_generic_add_pinfunction(struct pinctrl_dev *pctldev,
 	if (!function)
 		return -ENOMEM;
 
-	function->func = *func;
+	/*
+	 * FIXME: It's generally a bad idea to use devres in subsystem core
+	 * code - managed interfaces are aimed at drivers - but pinctrl already
+	 * uses it all over the place so it's a larger piece of technical debt
+	 * to fix.
+	 */
+	function->func = devm_kmemdup_const(pctldev->dev, func,
+					    sizeof(*func), GFP_KERNEL);
+	if (!function->func)
+		return -ENOMEM;
+
 	function->data = data;
 
 	error = radix_tree_insert(&pctldev->pin_function_tree, selector, function);
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 549ab10f7afbda32fadf4ad151401180bed2064f..653684290666d78fd725febb5f8bc987b66a1afb 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -137,7 +137,7 @@ static inline void pinmux_init_device_debugfs(struct dentry *devroot,
  * @data: pin controller driver specific data
  */
 struct function_desc {
-	struct pinfunction func;
+	const struct pinfunction *func;
 	void *data;
 };
 

-- 
2.48.1


