Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AF8CA100B
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Sep 2025 15:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1JFPtEwOFWxLJ4pevnsYlgpYZW/QvB5ELLnfLsEVFI=; b=ySUnhIrE344QMWN71cXKryOpi+
	V0fBw8xmJqx/yDHwzZv5+ezLoi7nry5LG2FepJeg5IEnYG3oix79gUDQd3V8ButqPYjNmxH/XAOuS
	73DMHG/81l3V/ErJmKADmz6ClhTM9JX0c+/TyxTcQwQEwt8xRRp/ViDbMt6zuOHH+/zV2DDTkUxvy
	yVwYH6+lIM9GAWtO6XeAY8Z1rzIBn0aY4iHSQ4I2bP0/qKj1gx60aUxYoAsQw3JuUfroK6Q8F8aSE
	L6e3yG+m/I2eLQqSEonMe1NUUyH8wnF3Cb25Mz2lIjzuV2Gncy6x56WK49lVPmn5zXctjpu37UFXa
	pk+sdRjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utSyR-00000000gad-2dTU;
	Tue, 02 Sep 2025 15:31:07 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPfv-0000000H4dL-2W7p
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Sep 2025 11:59:48 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45b7d87b90fso35892485e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Sep 2025 04:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756814386; x=1757419186; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P1JFPtEwOFWxLJ4pevnsYlgpYZW/QvB5ELLnfLsEVFI=;
        b=kYYoChq749si1Zt/bJhIb50lNec/ObDfuNbOBFrl8efBzHMUGwIK4SUUF3kV9LaMYg
         bzhYtojjZW8+iOcyCfr7GnWez22YPXyDgUjF0rk3ZxbKT3IlnL5eEcq3Ir6p2eP3iTFP
         VU5gMpdgws486xUKPJ70aPNHc8HMNj/2vUmGrj9tYY4+GczfKhB8aIKpK+hxXcO6MauG
         SqhlIejoH+hRG3uGzxQqqwtdTcET1Xf3I9ZUxnchhvb81R4/zs+hQPbL7Qd7YbFKTHwC
         eM+V2R6cM+RYW1lGAP8ZCE1+VFFS2E73ucxlEKKyOX55ji2c9JV9rCBrHw4qgbFcXXYD
         cHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814386; x=1757419186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1JFPtEwOFWxLJ4pevnsYlgpYZW/QvB5ELLnfLsEVFI=;
        b=bxZkfI2TtidtIKbFfC+aovANxQyw5QTgAyfvjBJlfkj0uRUuDLXqaacMVo6mjvyOwq
         RkTkMfA53cSXKGrJAu5gB+Fa4QVzx9nQt+iCOZvokBPT+rwctZtswufP+vJkKKeMztXZ
         Fl4EsYWA9k016ZizZ5jXCTnOeZyHZI7TazDem8rvSrpkloxObomKe6qa+gQusLLl+lMf
         Y3G0j7Bt/JOOMY1GwKqr4kMDWaj9WQv2LlaGa4iDm+MwDo0EsnAr4OYecZpYabLQZJ5R
         xxPGpvJb2oIsimJjjl/Fizpz+UiDaDduKGUqZh2ASRb90xkdts007dkRFvZmjguTUvX2
         uVJw==
X-Forwarded-Encrypted: i=1; AJvYcCU9dnEVsy6CQ+l7BUxrJMq5V+whRU50k5+lj65OWpK12g8WoyeoJDrDFBlF0Lz9TZk9YHKMCN5UNSu4VDnLwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxS7uVRC81PvVqHlzmYBOKVpPa0EIaE94/1E4Hrf2h7h4l0w+qv
	wCmHDAcYU5mYsH6cXDxRnIitbb+rjaX4wU3wPIJ24a90nW+bI3vFFOoM9wFA4YQJB2Q=
X-Gm-Gg: ASbGncusTHi9p05x28QAJ4y84KanXaXsjHB34eaOw2NLnXqekShzxnZbVt0PhlYlaU7
	Yhr1pk5f0YPIsWIaDqKUe2rUCCdFdW4xOPrJX5jMb08yiiJriDlKB2CaAOmSwB3u7XD2x4Dxb9k
	hPrCB4Fp8wO9Fbd6R1vRK6GKlmIt6V+5vrfM8z+e5u4s4BRFAjLcfxLr4ywG/hlPrHnfI2mAOjw
	c8GEk/vgX2Lxd4JIYVK4qDkDXJUE0ee+U6LpBk8LG+OoOqJv5Eqj5raNPVkHsdCo+mNup1pOmXP
	lnWffGEfOwaSuH5ugqQjNPnIHb4BwrBJXe+XuDdNznamTYTP8nLY18m+6v/8wte63XYTZn5SGBK
	TfDLDQY0crtHaPLdZ
X-Google-Smtp-Source: AGHT+IERkhZoQX1HV3fDYiEzCgaqV6JXpD5DtzyBRIwQQg9LLBsXxUh/GkJb42UUw5J8EFKuniHI6w==
X-Received: by 2002:a05:600c:4f83:b0:45b:7deb:3f0f with SMTP id 5b1f17b1804b1-45b84c2256bmr102158145e9.2.1756814386175;
        Tue, 02 Sep 2025 04:59:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3327:447f:34e9:44f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9c234b24sm10224195e9.16.2025.09.02.04.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:59:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 02 Sep 2025 13:59:25 +0200
Subject: [PATCH v7 16/16] pinctrl: qcom: make the pinmuxing strict
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-pinctrl-gpio-pinfuncs-v7-16-bb091daedc52@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1197;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=bNcWH7RYmKxieWZj+11TmEo7Y2F52BicXtYvQjacVVo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBottwVYBNAIqxX+GTdprLN1KmCRP+T0cr4zPnb7
 WAB05uVr4mJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLbcFQAKCRARpy6gFHHX
 cm3gD/4gfdNCgi/L1crd3spjH2BfsVhCz8jK0iuHKflwRrBglJW+yuaaNcsIES0+sEg4mbRdkvB
 1Ww04kOvSuLFZauF0IjgNjcsXM9Y4+a0omjT6JjzrxF4wH11ZUipW6gaRbg5cWC5eo3rgddQEsn
 kwbd/DgAjJie0IMEsgOrpRxSoSPgtiB28j56D9mQlqkaav0Un0XGqHAf52wzHJKASG5FIcLEqk3
 qIM2zlotBfSbMMrimUgMUuracaiWXAgUZEUnTEvPcEqzGxwmGN7aUT3In4gU+ZIAMIA66uGPNE+
 irYNdb4rfWdNdq7+XjiId4yoaKduyzu5Qc/jnjzOGWFHMO2C/qillgL5/et3jIT1GjeUzbUIINn
 CxvwKST8T1S2cPmHe4pwcwmXVDVTneQtdl42O5qh3vP+1L2/R2k4qf2Nl2kX0gqEEV3lZZo9eki
 Ft8oIUThEPJqYpsD0+9gXrBi9I1lYZsOnzBK7tbaaPfJb/rpibcVpT+BJ76HUywsb2N5YPPscbC
 s7dzSCMl03nWf/7ur92d3WElyVXj0DwD7mA0bhE7Qm+yF5en8ldGU3WMcg9FbVS9+hCDk4xtc+s
 aMN2oTM1Lo+DyGbfSI+GpIAarry7nR5402siiOB0KaRWE+zrsWXHk9HH0n2Vu1wv5iSFoFplf5q
 nx4+sTuoQi8FoEg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_045947_673171_4B7958DA 
X-CRM114-Status: GOOD (  11.63  )
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

The strict flag in struct pinmux_ops disallows the usage of the same pin
as a GPIO and for another function. Without it, a rouge user-space
process with enough privileges (or even a buggy driver) can request a
used pin as GPIO and drive it, potentially confusing devices or even
crashing the system. Set it globally for all pinctrl-msm users.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index a5f69464827119dfe2a7781b558094b283fca215..1751d838ce95d6138c824b90098f74891dec7656 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -268,6 +268,7 @@ static const struct pinmux_ops msm_pinmux_ops = {
 	.function_is_gpio	= pinmux_generic_function_is_gpio,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
+	.strict			= true,
 };
 
 static int msm_config_reg(struct msm_pinctrl *pctrl,

-- 
2.48.1


