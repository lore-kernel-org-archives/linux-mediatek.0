Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2279C87FCB
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Aug 2025 12:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DLMz5dhvl1HJGifQ8hfDJvvXhldeSDOtxBP6N+/lIpI=; b=rdtK5rcbOc2jOAKrFivrfmZs8a
	CVh2sOyWoazA4fUIylNc2VVFYbtHgj8T081zn7nnJ600bMwNuTmZv8+lNFso0xWMOK0sZH57MDOB9
	JsWY5sqCiHF5pkSNpZZUer8t3nvQ6fmxRvGWxHcxQOfblJPQyhUwpZ7QU6NQQoV/kdtmkSVSeDWI9
	56sIap76uM12S0q/prKWCNv+REfUi0JjlXVyGFvncsGK5MFpNDjTfIkYvgKP8LrEPHHjI+Hehz0aW
	5gaVMWYDvxd5yEXNDnDoEkyVaCR8Qo4drDk7TN1zVwx5cw/QFEj9wCZT7csEZDZFn+lyMXl9ilvEo
	+l6AzFOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloF2-0000000AiEh-1Ylg;
	Tue, 12 Aug 2025 12:36:36 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkLj-0000000AEdu-05r9
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Aug 2025 08:27:16 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3b9141866dcso109378f8f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Aug 2025 01:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987233; x=1755592033; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DLMz5dhvl1HJGifQ8hfDJvvXhldeSDOtxBP6N+/lIpI=;
        b=l4MBt1Ns6/tPwFHBQ525u89PiELofkjjkEJqQtf82mM7KFYrNHMvAuMMszZyYQ5a+l
         r9K6SjBiPcH8yKWnzOnktVLuHGwc+aE2PRlazkTpf5HzlNoIStHI5/hC/A0xn+1/6zSI
         wM/8B3PCjOCZJ4XICu8bIMinnNi/s9E+rVVSQ0N9myPUxVxZWZq7pZdx6uD/wbFabe38
         4hn2g9RJHPsccWViQywNud/+uPzqZF0aGjwYS/uLKuJabZcWoiRBZDoVRzNSccQOUim9
         BcudviIVlGYBni98XVB3XD8NqZQagLbMmBVTWGzi/oGMIL4ykzNYA+X7nWTfrYbW0un0
         6lKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987233; x=1755592033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DLMz5dhvl1HJGifQ8hfDJvvXhldeSDOtxBP6N+/lIpI=;
        b=VxShs4oMIb/9reilG548UAqGbo0kLw2DUUaarFxFKEypZQX9T9MqAb6FyOdivycSci
         B4zIAxoImac3Cqb/4eBjGLZGX8Zao3Df2qYRYcT0ujFkq7Bx7xszKJa1uY83cKBYjz0e
         AmGA2AlZOrslG19YD5GeQJfuG3gvdj0zzCxcgGKJTrQXxfW6FcxZcsNObSUGzeOj9q3Z
         G+4k5zImpwV3wrQ21m+KNOqp/aJ/F65zcndkYDzuZJ+vh6Shtc8OD1CAHfiadv3u/ZW5
         h+b/W+OWmkfmXn/+uPxtBle6Yg66kYm1dlbnw02Ce/dPGS0hG8/aY2HIEkVYltWhIgSe
         WSJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCdl7C2iwqL8jGPDlvxILSpXxr0hADrFMH0xQFoGA86VjEDx15guvc571Y3eNCgzDnyWiKCnzF3KaCMrL6yQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxpc+Ob5pUQZYNOUT0EvXm2L0J7MSpDhXShm809HP/Iv/WqOeNV
	8hvDJEbZnzo55+phdK6ed+SHbX6p02shP0ZIkIIoU9zzaQA6GOksBB7tXoZI4oLcXZg=
X-Gm-Gg: ASbGnct0fuz5/6/o7uPNNJq6V8ogxnqmiVNld4fkODe6w+AjAswEwljnaCIkQp4j+bG
	7TxN3G7oGLSuNSNAEsXxEIS9GZgwGNuHds9D3+Fa+7sePeUat2RwW727tIatnuNEHZnyS+2HAvZ
	A44u//RJO1xz8M052TgV7pUBQUjU9vHKynm1hHvvY03awvuS/ld4vQMt/mCULQCVc/UZdO+MH6Y
	M6Hlj0wHYQnCSL3syWozKEHfLm5LaktKfmu3LX4CLtwCWXNjopt/Zpvvq/KqzM+agQPv6NE+yNN
	E991kDKstc5DSVnI8GndkyyvELBu/QMfbi4672kpULmhGTvGn+HC2LiT4oSD55RJlz08QTaHjnO
	zBxSsD6nxhhLXoOg=
X-Google-Smtp-Source: AGHT+IHxf1Gheje5mkFJXNbYPspDezEy1ZvwMcDlFzSmLC9pvu7f4uHAGhCZoZHeWbKRH8nD1ty+QA==
X-Received: by 2002:a05:6000:22c2:b0:3b8:d893:5230 with SMTP id ffacd0b85a97d-3b91100ef7amr2091026f8f.47.1754987233320;
        Tue, 12 Aug 2025 01:27:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 10:27:02 +0200
Subject: [PATCH v4 03/15] pinctrl: airoha: replace struct function_desc
 with struct pinfunction
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-3-bb3906c55e64@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2037;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=8m+uO2wFoz45np2OTah2daZeJ2sZYqJ85l0WVEHKDas=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrX9RRoKDbA/ltwtuJ4EyG2WO60DQb8Pb1vS
 coNAXS4U0iJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr61wAKCRARpy6gFHHX
 cg6XEAC8rNYcNrLRmViE7ypL62cxemJNiwcylZUk/EbB2LmSFdtxh5OdHOiPKfnWYC2WoqdsLeE
 dH7HsjwJepgfYk1itBu8siO7U3geQZasJ159uTbiAa9YW6PHmUFNLgxnltfj37gLl6FVIOgFscW
 mUASI9HQ5leJNQixSLwfniGqS39RegE+Z7Bf85pFZsDV6WOJINocubMK3rhzQecaeIKy+/YhWa6
 VuPszRdtOp16D8969UfaKprxgn5khsdU635KHvTI+cvzk9e+6La7xoXXGoRhTc0TBKf+Ig+hm07
 GPeEeW9mi+drhU3gfbjLHSY0SmdXerDgW9+3wPuV/BgVkVxDtYFYA2jznaWzg/wpFE/WUB8XKi4
 G2aLL8E+K2i512j9KQKBZU6YA6neVMBqab2iwlDJAK+IxaTqeDUx6e+X1cVnsbHv3rrnRLaWCwq
 eLi0qlNEU72l4DXrBAj+KdwVRQlEJ6WOTi+9VzcGlzb1VXu9bSzPS3A9H8hLGs9CZ9dDFjroEPF
 yOavvyND8j+CsN0tdDP9o0bTzuzZFXnJRJJgGXE7W27j9qIsrdDcyec13EvXbDNpFueJ6ERKv40
 g6XWI9ymS8TjdvJf5M6VlxYn8IqVcpF7TYMtLPDn5GPcl+DJqqJAcSFzv6pevX+qiAnP94PLErN
 ARW881PRppyAVwg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_012715_066468_486E1CC0 
X-CRM114-Status: GOOD (  16.12  )
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

struct function_desc is a wrapper around struct pinfunction with an
additional void *data pointer. This driver doesn't use the data pointer.
We're also working towards reducing the usage of struct function_desc in
pinctrl drivers - they should only be created by pinmux core and
accessed by drivers using pinmux_generic_get_function(). Replace the
struct function_desc objects in this driver with smaller struct
pinfunction instances.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 5f1ec9e0de213d587b68f41d3458cf504ee1b21f..51cd0cdc2f5170d024fe984ce8882ed9b3ce6563 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -36,11 +36,9 @@
 #define PINCTRL_FUNC_DESC(id)						\
 	{								\
 		.desc = {						\
-			.func = {					\
-				.name = #id,				\
-				.groups = id##_groups,			\
-				.ngroups = ARRAY_SIZE(id##_groups),	\
-			}						\
+			.name = #id,					\
+			.groups = id##_groups,				\
+			.ngroups = ARRAY_SIZE(id##_groups),		\
 		},							\
 		.groups = id##_func_group,				\
 		.group_size = ARRAY_SIZE(id##_func_group),		\
@@ -334,7 +332,7 @@ struct airoha_pinctrl_func_group {
 };
 
 struct airoha_pinctrl_func {
-	const struct function_desc desc;
+	const struct pinfunction desc;
 	const struct airoha_pinctrl_func_group *groups;
 	u8 group_size;
 };
@@ -2908,11 +2906,11 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
 
 		func = &airoha_pinctrl_funcs[i];
 		err = pinmux_generic_add_pinfunction(pinctrl->ctrl,
-						     &func->desc.func,
+						     &func->desc,
 						     (void *)func);
 		if (err < 0) {
 			dev_err(dev, "Failed to register function %s\n",
-				func->desc.func.name);
+				func->desc.name);
 			return err;
 		}
 	}

-- 
2.48.1


