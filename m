Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07D5CA0FFE
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Sep 2025 15:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tEWsVeKHUC/dAllw2aDUrg7lMLZ7DefoZuk24jUoBho=; b=Y95r5ThhmZfMR0mms11MJGVZ1i
	jiuFBG6UK/tMxFIoPnNcb7VsDBFCoMCuvEzWnz7lucH6KCcY6lKbD8xj8bxAGDllpql8bYqzw0tQ0
	KLITfoVnDIrHZyPUk7A8YadEW7PtS36jXmpOsQJWBz6TvkmVyadNnp74heBRPHNHkhMNYGc4xaNW4
	hOs2qvzOJGC0+yvif8bwFwvHmZdWT8S7TlTbQCdei4xsyXd2SorZ98t2VVGJPmDIUx/DbQTXHfy/X
	7IGVug1cQf+mqIH2M4HaXNuE12U8lPZfD1HQ/wTajEUMFgjePXPSFRlCluDvAb/Mh2BOkF9yaD/Me
	wk1cnkGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utSt4-00000000fH5-2Sdp;
	Tue, 02 Sep 2025 15:25:34 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPfp-0000000H4Xg-03y8
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Sep 2025 11:59:42 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3ce4ed7a73fso2728359f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Sep 2025 04:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756814379; x=1757419179; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tEWsVeKHUC/dAllw2aDUrg7lMLZ7DefoZuk24jUoBho=;
        b=GojQ+Ve8TfddTM6yFQk7rPZbDtVOSyp3amMQE7uSfwY0AfaHACzDwKfF4lKZyiZOlI
         Dx2pfsICrdNyzLtOqd3BhZBaqXZB4TUujpYT4AbGy/Bn6zk70ajAC09/C/nbdVQR1ecD
         In4W/5Euj3h4nSLvkgC79N0f6tgSvL/ZhYDafvjW1xs335OS+lYtka9BtmaZPt7TtbJ7
         mTWee3sXY1l5F4obO9CPUiAg0JE78jxwkoovZ7xuZ+cHpoFgCeAJ/yjEzDh2W982Cd1Z
         PJb8kKv64I0mXEvQEp1smS9UsP0NqFuCv69tXYT1o5TVIvXTBAlb3w1PYlmiAnq+nvE+
         TWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814379; x=1757419179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEWsVeKHUC/dAllw2aDUrg7lMLZ7DefoZuk24jUoBho=;
        b=bCKkuWIqqQvaqU7VtU0VEdR5+B48bkerfJipm5VrAcAriU1bQROLxG0S3gvV2YH/kL
         V6RjrnkeGPCCd7C+pJS4eiaA4+RVeXTwGWBSJI7SRZYq8PLMXXz3i39GNkIBYSSrB5kI
         yp7m0BAZJEW88a174+GfwQu/xjXgqTkTy8OxayvoTgzhd4BbY47r6bMVIq55Bcv6UiJN
         Jl4hCn94J0imPXrLdDzmNBqlgl3FhKA9edam1oHh7ceypChWmES4USrgPAUiAWP3Pb7B
         dFD7x0dETG0DNU85QohKaUA9PqUWxlR/eVYvTQV94a2JwcPZNc9dNpBzr1su88QQVZkJ
         Mq5w==
X-Forwarded-Encrypted: i=1; AJvYcCU0gFLGQmGv7MXBoKrkI2jtMDz3FWpfLC0jH1eEFgVBSpn3fcHu9NO5Nu+UGoCoENR16meUxUSg5jx5cbBi7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOIcad0EYGfbRh8kuXfgNl8XuzPwlaIR4Wca7F3dZUI/sfPwvg
	U3LGBvdjibAowsMsvcGCMQ1pzzV4OXSwOICibhazrnxDdv5D2wq1gNQS+lyf3TUeJvo=
X-Gm-Gg: ASbGnctez8T5+X0z84hUG9Z2GojStnaaHEmfLxIzJHpWUS/7An2OVlSGJYw8WMeMaWC
	1cbTeD0ACVEQArENDOzsGRIK0I+XBtyaUzPpFfSHngt7SvEWwsleT7mkCpSGUE/q1clE6oMKlWN
	lmywThhGvntCiP7QZHe8FDQOcRkMuviNgyOeoZIqUlczA3uOKpvzzTMRkVwPHVHyiiQuA/8gT0S
	iRDYwh+wUHODobCLLskXMaTUzgIddO6lAvkmchk7ZeYgQFXF8geAmvhsA9mS+Ryrxarn+csUrOp
	Tlybph6WhpGZhpgD1A8qyA/HnOMcuspNHa3arv0l56mJAoTOsgWvU1oUH5f48EDeIZVQwFbdUMG
	aFcuteHlM+Hac8mjohdrsEbJywjI=
X-Google-Smtp-Source: AGHT+IFbemdBZVr4cSqFDknoZOXx6G9gv7/Y0ZwIrtmRmycK6XluzE7F7aIjOJthCpOln2BXwIsUdA==
X-Received: by 2002:a5d:5c84:0:b0:3d1:6d7a:ab19 with SMTP id ffacd0b85a97d-3d1de2c6bc9mr8102151f8f.20.1756814379349;
        Tue, 02 Sep 2025 04:59:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3327:447f:34e9:44f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9c234b24sm10224195e9.16.2025.09.02.04.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:59:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 02 Sep 2025 13:59:21 +0200
Subject: [PATCH v7 12/16] pinctrl: qcom: use generic pin function helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-pinctrl-gpio-pinfuncs-v7-12-bb091daedc52@linaro.org>
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
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3806;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=32Zcb9hfB+ZeJyoy3uwQecPB9Xyi4ZVd3B+L7ZvFZiY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBottwUCgQZBmoTxlTrj8gjD6XedHkrbIupwH0/A
 aWSRMyfc9OJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLbcFAAKCRARpy6gFHHX
 ciHxEACSn9uq6GCoE4OW0AyeoZN7IZ7Lwnvcc5CVALJn3LNwLkXQJla95ogJxXNn6INZUSqnzyZ
 sAv2J4r1nBu6cWS1jCNcbRwgOsUxCD7DOij9DTVk8vVeuUiyb3/nBCtlDSiKX+I+EJ6UBXABrJP
 2ulvPkXnmvHPxoFGDEuoV7ZOvRno5o2gmZUIT0hafWB6etSbvtGLzxA4akcilCxSVle3PTU7OoZ
 rJ8ecXISPikzFtKVSa8iwGbopUmzdfdyaqHjdni8ExsDN8TyDcZLKAkiWHxe+Wn+ovT37ULrXwY
 URy0PXM8ZdNugKFa87z/9zRKbtpRbfznmQOJUMdHJRA/3Ws1XTiF3r7m1C3mAvhJJki+yp8n8ns
 eekmGbBOSMUH+0H6ap2CxYRgxlOFFIARsBHSIK1O4ci5efShHfePBz1yk0YTqE0lMMxwIMBS9OW
 2ww1g3NSRKBROCGTk2V6dGLcOIKnRJgSX6OYWcbmQaifc54U1l44/0nmUnQFfIW8yZepxvX5WZr
 TMbqscKrQY9wJyUsRY/9W7iq0Cs9ZRlfqGO/8OWJ8flLXdJXpeZsEkmsdB6GYbixZ1cdyNpfVd7
 6AZzJLar5yCrsfEiPgfaRWSe/izLz5B8B2bE7q4Js+qhiJKPopM8A0/rJP6mJC4aBWYqvqM/qXZ
 qANi8Fe+TNoz+zA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_045941_087164_9F8DC25F 
X-CRM114-Status: GOOD (  17.22  )
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

With the pinmux core no longer duplicating memory used to store the
struct pinfunction objects in .rodata, we can now use the existing
infrastructure for storing and looking up pin functions in qualcomm
drivers. Remove hand-crafted callbacks.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/Kconfig       |  1 +
 drivers/pinctrl/qcom/pinctrl-msm.c | 43 ++++++++++++--------------------------
 2 files changed, 14 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index dd9bbe8f3e11c37418d2143b33c21eeea10d456b..f7594de4b1e9b95458c2c817e1158026a8006f64 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -8,6 +8,7 @@ config PINCTRL_MSM
 	depends on OF
 	select QCOM_SCM
 	select PINMUX
+	select GENERIC_PINMUX_FUNCTIONS
 	select PINCONF
 	select GENERIC_PINCONF
 	select GPIOLIB_IRQCHIP
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 83eb075b6bfa1728137e47741740fda78046514b..96e40c2342bdedb8857629e503897f171a80e579 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -31,6 +31,7 @@
 #include "../core.h"
 #include "../pinconf.h"
 #include "../pinctrl-utils.h"
+#include "../pinmux.h"
 
 #include "pinctrl-msm.h"
 
@@ -150,33 +151,6 @@ static int msm_pinmux_request(struct pinctrl_dev *pctldev, unsigned offset)
 	return gpiochip_line_is_valid(chip, offset) ? 0 : -EINVAL;
 }
 
-static int msm_get_functions_count(struct pinctrl_dev *pctldev)
-{
-	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-
-	return pctrl->soc->nfunctions;
-}
-
-static const char *msm_get_function_name(struct pinctrl_dev *pctldev,
-					 unsigned function)
-{
-	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-
-	return pctrl->soc->functions[function].name;
-}
-
-static int msm_get_function_groups(struct pinctrl_dev *pctldev,
-				   unsigned function,
-				   const char * const **groups,
-				   unsigned * const num_groups)
-{
-	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-
-	*groups = pctrl->soc->functions[function].groups;
-	*num_groups = pctrl->soc->functions[function].ngroups;
-	return 0;
-}
-
 static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
 			      unsigned function,
 			      unsigned group)
@@ -288,9 +262,9 @@ static int msm_pinmux_request_gpio(struct pinctrl_dev *pctldev,
 
 static const struct pinmux_ops msm_pinmux_ops = {
 	.request		= msm_pinmux_request,
-	.get_functions_count	= msm_get_functions_count,
-	.get_function_name	= msm_get_function_name,
-	.get_function_groups	= msm_get_function_groups,
+	.get_functions_count	= pinmux_generic_get_function_count,
+	.get_function_name	= pinmux_generic_get_function_name,
+	.get_function_groups	= pinmux_generic_get_function_groups,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
 };
@@ -1552,6 +1526,7 @@ EXPORT_SYMBOL(msm_pinctrl_dev_pm_ops);
 int msm_pinctrl_probe(struct platform_device *pdev,
 		      const struct msm_pinctrl_soc_data *soc_data)
 {
+	const struct pinfunction *func;
 	struct msm_pinctrl *pctrl;
 	struct resource *res;
 	int ret;
@@ -1606,6 +1581,14 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 		return PTR_ERR(pctrl->pctrl);
 	}
 
+	for (i = 0; i < soc_data->nfunctions; i++) {
+		func = &soc_data->functions[i];
+
+		ret = pinmux_generic_add_pinfunction(pctrl->pctrl, func, NULL);
+		if (ret < 0)
+			return ret;
+	}
+
 	ret = msm_gpio_init(pctrl);
 	if (ret)
 		return ret;

-- 
2.48.1


