Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C7DC83F0A
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jul 2025 16:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyQR7nMIaqJhvjojyZVdCfat6irNE82iu33KzL+Vh5k=; b=jCdqjJ2TTeLLo+jrdhCji09P7+
	0nAImNb6zrOJNwKE01WsDjoPPOZ9vsC0uL00GxJhGVIqkQKCAlOhQbdOUhsuWVWM1AMo9wOsTwK+A
	mwtToJAyIId6PynXQGiFYwtKzh0rV529NS/6X90BtKTtwnaNPAerhABXVOOqzOmyVop2/NryU3BN2
	48t27kW8gtjluNcrY9+J+Y5lMmmXY6PCyGHM7PBZdUyEx/5A0X5IAITwq7DpdIeaM5wIfNZdc+XEm
	PeJ0eVe4w0hI7R4MuWfuFBpHLfQAEEusBWojcylRrXbxocOXTKoaf1mYVcFZTlfFwC9RjrX7Cqr7x
	NIHfp+nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZY46-00000009My8-0EA2;
	Wed, 09 Jul 2025 16:54:38 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVx5-000000090f5-16bo
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Jul 2025 14:39:16 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4537deebb01so33495415e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Jul 2025 07:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071954; x=1752676754; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vyQR7nMIaqJhvjojyZVdCfat6irNE82iu33KzL+Vh5k=;
        b=LbvslkiyqLvh0A2c6pigkrOGN8bqWQ9rUGBKrXiJFUMHwgQLVDKDu264vhIhMkqWGS
         A2zcXZnN9TxJG6bIlonDZGxbrh7PJPnBd+8amhRy35EU6l3b+AyYtYKC+31y8yDqbkeA
         tcxtNYqgjuBOm7uTH3GYyFRUhaYqDoRpqCdOKsKW9VPC6uCZpNAzp0evCZzDoCeSJkMK
         ohzYu0qooh/GdcHbwPec8jkRKaWS+rJMuOOVQ4GoAC2Lb/9A9cKjXZrrAILjfuF6odGg
         tyzrB9BKlqN4SrmG4f2xjB3mZWrigvK4/CwrExKbKwugWJ/FYAOvs21uhgWGMiUj2wsb
         Y3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071954; x=1752676754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vyQR7nMIaqJhvjojyZVdCfat6irNE82iu33KzL+Vh5k=;
        b=aiNaxu39zWJqKS3UztQKaGNIgnm3kfymnIuaOvRc9wVC/yAVwwBbxnW1z8VSknsWWw
         7IXthmHWkTN3oTYASBVd6pKmmRr+ABU0ZCm663Jpx1oV+Jr99cr2IFAQOYFXk10mriSg
         mUzECtlK2qqjGR+XXn1oBo1mquduLHYN7/3yExMHx2XMl+rqrXX2Rukc+fFjt5RLNvG6
         kdzUpAuB99Qt9u9fXWMj1Bo730Egf60ueXstSA4d9y0WsIu7ffRorZaWdAMAkMCQvkiA
         mnTJeGv5bnEtC8qp4/aN9y47F63xRlTP80OpO1dxMm4ttKOTALogI+JBsvEqL8P8Uo1Z
         kUfw==
X-Forwarded-Encrypted: i=1; AJvYcCXCpQmyKPFQAra7t9MoGnaJmMhGMQqOZxHC2Phy7PDM0u7vWyB8U8Al95lxzIuKkX5BKgXZUf3a6m8si8glBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaBxLP5TjUFCgjSmaxrEBnoFbLzqxsiXiKJ0mOvKLgtOaKhjaX
	yXeKMz6Bud50u/SqwmDP0TOIyJkDw7pJe0Wg2UzCX0jwCTgQEvM8JfRbmN3LmPWB4YE=
X-Gm-Gg: ASbGncuDLdt2l9jVJk83+AAXnSaZWd94cpEmqXJG+RaGUEK2+ZPVnfv4uas/ytQUJY2
	ttj/HnlbWDpmsgrZ1B0c/hDodQ4nrdJ0EMABs3BxJcVBbqnN96wlrGjfyhAI2+HI5siNrh2uqDi
	PQuGFHyMXdmcyrJeRkYPmeetIcSZks2AEMCYmQ7Tdxh/MLWkUe+85bwo2T2iOTTJboNEbx10k9y
	JZzbP68eCjCsFGZlwailwPq7zoGmR3LuAoXDm4zC32MdWC/vvOBXCi+T40GuCKYQaN/Ouucri5k
	tRNlEPb8gGK16Xt0s4GzrpVDMDpi5qMt1PD+Outty1uCgxKZNWfral8=
X-Google-Smtp-Source: AGHT+IGsHwl5+rMjFVilVGS4uZ9wBps6vIXNpmci7apkTHJjRa6NtZeF0fWAhzC6zphVIGoh9yt5ag==
X-Received: by 2002:a05:600c:601:b0:43d:abd:ad1c with SMTP id 5b1f17b1804b1-454d558720fmr19496665e9.6.1752071953726;
        Wed, 09 Jul 2025 07:39:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:39:04 +0200
Subject: [PATCH v2 08/12] pinctrl: qcom: use generic pin function helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3084;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=X9Ki+5EzRPJP9Qn3Qvwbtr2ISnwV85fgPGCpNBHhMQ4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8HFeMyI3D1Dqv2tlHQAY2Z38HnGvNZfdCo6
 FBcXb4w/zKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BwAKCRARpy6gFHHX
 cubfD/9US7MCY9XLoATZecFIFEpWPf0Uefyye79X1KjQbCS07kHwcGgfH29AFrNvz/x7bWA1zaQ
 j0tbicl/uEJT9H2rS9VI0wDfPs0Lp/jNv3kwL31mLZ5zrr3liqjA1SiWHdyvY3uJqL1WH75P2+T
 eGGET8T0GYpCbuS9ptjobR/lbIDAMAlpddosYHOTPxrv0jcwM8tQW0foOgj0biOm++Exqw04hE3
 lAxop7qj+e99fPMbaq2xxY+fPQDyhHDE+TLJk5rINgIzsoit0/fH2nQDW0ODRcdF34NLaGnJPjx
 KGwSupH2Mt4yw1yZnXBiAJOLOYMiuwwH1zIgy7393NLrdGEKE77UsiGEIe790H0qOryEeXPl5KV
 icLIoiQ5+fWHCwiLeEzdNycAmwN7WUCCKiQbt7rGm+XkhdzVYeFtM178q7tjRXqUTy/XeLHF86V
 gB5mDG0RP0tAc+2vIAsYPaZcNvMlbTtNx8Gs80NVJfnyFLZZUgkqEUXzMNCNnKDGUNxm7ThNvKr
 4CFo6uZG38y7BgdfFnuKMzQCjCQzXuaw7yT2vUolD6aZXlRTeZGwKmgp/AL8++3l7FXG0egh13Z
 TEZkDQdE/c0CUDcQgNfWaYCm2/c3uj45Zh/w+8K1Oimrzad/wNJH4iwwtyZ5/bek9McTHfuZW2U
 zL6jyCz1pu8lcNg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_073915_294480_F60C37EC 
X-CRM114-Status: GOOD (  14.11  )
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

Use the existing infrastructure for storing and looking up pin functions
in pinctrl core. Remove hand-crafted callbacks.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 43 ++++++++++++--------------------------
 1 file changed, 13 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index f713c80d7f3eda06de027cd539e8decd4412876a..965f0cceac56697bc4cdb851c8201db7508c042e 100644
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


