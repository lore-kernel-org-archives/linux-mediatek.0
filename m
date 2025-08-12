Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927BACA0EDB
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Aug 2025 12:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+YbWc4IE0U5a+ObdUmLxRXb/F+0HhyYqNMK8nrf3mHI=; b=a0cb/CJAGTl0U8Ve9ShE8JYWBL
	VmRoHDZ7ipZBCiwy49x5nNlYdIPxI4vU+aXUC3vN6bUaXzL0+/gDetMBhutDjZdR5tn59c9hirteI
	UPhUhxhwJal/+0Z3fa+Zpb2DW3uxTkaxwjkIyBXpyanoy96jSUrxmrjYQ48nl2179jTDScBea30qu
	IOuvte767BHBpNyhMEDu8GV/zxcUMYa6IrpCGdDV3Dnah75uAitr4NlqMgHJnDkvkV6970Vl9L9fL
	Fasd6OuhULq70CLX8ZQ/+4ixwr9Kw+RIhYXv73gtZcq6kJf8XBtDAL7rhTNOmL3tHQVPWOM2kRWwd
	Rq+Ji2CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloFT-0000000AisY-1DaS;
	Tue, 12 Aug 2025 12:37:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkLy-0000000AEnG-1zH7
	for linux-mediatek@bombadil.infradead.org;
	Tue, 12 Aug 2025 08:27:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+YbWc4IE0U5a+ObdUmLxRXb/F+0HhyYqNMK8nrf3mHI=; b=EH95fnxIMVJy4yYe3ISyNnNJ5B
	sBaiN2nVPQW+7mKG5XHS7shXAfm6mcPFC/7Jai+bW4u6kHIRn+5Gj6cCmKmxHRrdIw+e2uJHPbwKJ
	t3Nv91IrnckTAf4UCi1uXsaNL90RWfBGL9m5QFUhMwvbXXZ7ukYkL2EOML1QlVKHU478ahxh/SZLu
	vPzh4eoCu69IxEmOUpJXCZAzQPxEXpx1dEiGh6dtG7rdB3d+Jow1I69qzLpfozggCEGvOTOYxeONA
	MNqM1KzPr+Ru9CVCy0qFWhby3HWvz+ZB+hsizRikStwoXM0Y4GxRbMlhdvH7wrwjK9VrywZD7hWBI
	9P0radYg==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkLv-0000000FktL-0yDj
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Aug 2025 08:27:29 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-458aee6e86aso34147835e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Aug 2025 01:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987245; x=1755592045; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+YbWc4IE0U5a+ObdUmLxRXb/F+0HhyYqNMK8nrf3mHI=;
        b=IcQ+mctbDnx57cke4VeTTVdnZoDC1xLHOiPQVnd72cArUPXn9birPtux4T7X+QkmOk
         tjNKCDRv0oQ1CsqOkKSGzHI9vmdpei/1t+zAhaDc/cx2aeBknrZt7hO85flsotFOZZh1
         PClkCitERkVzA4ShEgurPXMPTZWMfQVAbel/WNaAw2QU2a85CBrm90AAj0VhgsU7e7Bc
         p2OSjiTxNXBMLNeSjvULokMTFyffLEpmzfipOkfno+Uub4g+odTzaVmNt/K7a/UdLuo6
         4vG/rpQpzLMBpOgjLlCUp8oXW2imIdSdHHuUpUXmrEjk+d7B5BQitFjt/H1X8n2lSFVf
         b9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987246; x=1755592046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+YbWc4IE0U5a+ObdUmLxRXb/F+0HhyYqNMK8nrf3mHI=;
        b=xS86UIbqOApS8h8EguU2ZBssw90h5dBetEggbLW+6yuX8Uajyvdu9vzecvBtC6y6zf
         pdLBsOYZ/SNBa1r6+xnysskg/8I4NgbHvG6ax4kaeUecGxWPSceziwv3mqrjNKGcMILo
         KP+9mMLX1whCYcpyazLi8fWqfbVYfk2fXFJzPxFUu3MqH9wl7kbcCoWHnZ114mrkb1F7
         eIxswYhK87ZV9b2guxFC6tF/OUpz4ke274oQPyYFw+AVGFs+P5QFXKfctWW317JF+nRd
         NndS20Q0svEP4uoMMD+zLacpNNGxvObJiYJ8W40ifbqaE6ZHZbYTVxgw6dZ4LvkBHKc6
         OhKg==
X-Forwarded-Encrypted: i=1; AJvYcCX4O/18vGD+KCBMt8FWBq3rVbVxg+mXtGrN8tfwAdL8FBRn6b/0NoUhlHe+GU4l08SAvDYCEll9S8hKxc436g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+vUrMErAqQtA7oYsABLHjkELNv0M7EAX6teqmMIJygXnILZSv
	LTtiuNIACLSLjiMAgSAIDE2khUL/ULQJ3xK9L9jgVoYd6xBSY5D5uwEbVVvAQgmD2FE=
X-Gm-Gg: ASbGncu2gDGa87oRnFIZqPqvWzuzXeWws7hwIRRCa2lBbggwlTe5m3eUW0ho19UHaNw
	vAtc2KTJNirkirJV5MMvt+L22HepR4hh/qkIyhBaXf0z2r9l6gtRh27X7/gagf1u1TNa7GcvUFQ
	8KXLhkpBfmTdN7xV5GQwgCZdFenJ3swYao8+XIeaFkoqjFCpG5K55sB/3JwdPGfdKbHLNUnqs/3
	EQ6NKlKQN29F4HzB/LSGwUTzG2YHoHd83dVl8eVovJ+2g5ok2B/1bWnESzSrlZtyMx+8EYiSBW1
	7CKU3UV/GLgm3vwA8VbKcu8VEnFUL46QwojZgBasSkY4i4hjAQUp1siIxhnqmDNQNRhUCdCbvE2
	mR9EA6J+aC6edl8I=
X-Google-Smtp-Source: AGHT+IGi/j7vvT//K1tjjQhALtCZbmyRmQbp5AQVO+ecrZR25VCoPGpFE1cdkaigLNYXu36RBE9/0w==
X-Received: by 2002:a05:6000:2f86:b0:3b8:d79a:6a60 with SMTP id ffacd0b85a97d-3b910fd0192mr2025994f8f.3.1754987245402;
        Tue, 12 Aug 2025 01:27:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 10:27:09 +0200
Subject: [PATCH v4 10/15] pinctrl: make struct pinfunction a pointer in
 struct function_desc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-10-bb3906c55e64@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5244;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=eGspcjc2EAjWh0rFUcHzIQ10C9gfQYuw/lhLS4OYQVY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrYMe2y4vEPLm1kTppjWmg41eG4qsgyU3HfC
 0ktdKcA63iJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr62AAKCRARpy6gFHHX
 cgKuD/wL8IqveDOLws25gTN8uwaorjKGDFIvwi7VZNqVZ/hIyoeWKzjAK50/Voty9yhKi4Ld4Wv
 oWFw87sa48nxfIJnwVS8gzTcvWdSjcaR84jX0VpuIVa+fjyLzgnU0dcOwTV8zQhMg2Jc6lSkycy
 MOiQbuAZkcFQDmWe7xCQsUv0TYotfNPfHAw1HxytCwGs4ye1aDqiWacHAfizNJQT6WYRM8OOFwz
 Q+WtQHuM+3Eo6sGbj6kItR2CNMUg02Oal6VkreWZ8UhJ7lcHwrsGLPw9PCynOHmMo4WxvY3mDPh
 GtriQxOgBOxNLQPICuDdryD40vO8u/Bn1nmchxgo7skPK0/AC2SHreltuLzoaD+lkM/87au5j1h
 pTsqBZQBiGWfsfJYGS6jZWsLms9hmtVfrNyI3jQtX9IYmDBjpf/HcJN0gNyevodIPVMCtcNhycA
 E+MpTrh9F+daADG/PwKcNtDduobVUoJBLy22CdiL4i4+elQlNAdtzTmDFX7TAUODSArn2uLI7is
 uE6vdK4NKaVbHe6vEuZfKxzyf86wy+yuMU1m/rcWIN2Euey0LR197WJkHtSiB4x3fYMJlx6u4U6
 0OR+My49drC5JYj3Ac0HX392d1wUcLysY9U4dsYnqySzLVVuTRHU3oyz6+Oo+csnKugonlolxPw
 00T8opFSZuQHT2Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_092727_524941_554954E9 
X-CRM114-Status: GOOD (  19.09  )
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
index 9ed84479a5b43871861f46fe1326f1dfadc7f63c..0df7eba8ccd3209fbc4b2e67ffdea12b77b90858 100644
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
index 61aecc3555837ddada3bab9d7f28a6af7afdd3b3..33421dabaaac597382e75c4e5ab009390a2eb1e4 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -2459,7 +2459,7 @@ static int airoha_pinmux_set_mux(struct pinctrl_dev *pctrl_dev,
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
index 62bd4aa53b2b22cb09eacfb05398205f2fe391b9..6f5e3ede972bbfa78e279790df359632e2d63485 100644
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


