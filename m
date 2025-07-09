Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBCAC83F0F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jul 2025 17:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/0cHEX1WGiZE8mwyI/JPOFvvGfe/GVd0huttz7DYHs=; b=QYw2qFPfR7qIZnOmGfOhSmQ6mG
	B7dbKprXvd/Kq69ShKesIuRDbB4neD3VkLLbjzZusRuUu2pkw3fVdg2rwyCW+PWirw7fW9O70snxr
	fHBt77TYY6ZSWvgAlozouaUhivwEyk+SRBbPZgf7fMW257h3W9ahy5FuTaqTZUPez7VYQObZIvJ6+
	jxnpnQ/AdluF+uIRdOw0/OKG54AIomv+pPHViambstjxProwrSiRQa0B0hEA549uXiUZXAoBOKkWR
	kW6l7x12VtEMf96lPUCmZd5eEQg4bt6PoFkrnGVYMojRY8JuJCumN0BCwoF1S8hueT7LZ3CboilDa
	iwy8zJQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZYDI-00000009NpO-3xYd;
	Wed, 09 Jul 2025 17:04:08 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVx9-000000090iN-3DHG
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Jul 2025 14:39:22 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4537fdec39fso18071005e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Jul 2025 07:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071958; x=1752676758; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/0cHEX1WGiZE8mwyI/JPOFvvGfe/GVd0huttz7DYHs=;
        b=dxaxFHj/XmhZ0FtFEof6FzCYeUfukVvaglPxkEjVOED/XfjuZKiCUfH+qWod02exmp
         Jx7UuqRnE7+ZljNqR8kJcdyiucqTe7HD4a4iYLrPiOlHHZi+87UW3S6jkzV805QpTq31
         E7Saun5AbOjrc516G3w1nHQ564y0/+bjk/doxYSsQImH8U3I5bwTiwvmlybFHmBG0U6i
         t254NV8U4Vp+Q48/jNp6/IFO39CoAB1nov6Ih3L6cwAA0xL7oE4fCYfrfL032zaWUgqF
         4JXmHefD7mTUZfwFC5HQcspNAYtk7hn6cvXOYBImyEIrufQ1KxwKyoUAE83GeMDukrMw
         vyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071958; x=1752676758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/0cHEX1WGiZE8mwyI/JPOFvvGfe/GVd0huttz7DYHs=;
        b=RvGmvJFrBOgVw8fgNDndDDJ8ikoTW385uThWyEaXmjDeW3Jl5FPtoW8TSP7TP6durg
         MlmpW+hyoyf9q+MvTr8XrKmDk5EW7i541ZrycHu5y2my2p/hfAshkNqrAY2wC7oiAvUl
         nJJIL2FIXoFSPG6gDm/nWlV6iudLIo4baC5BrgcUlPVQBom6z8+RMF2o9T98No0JCzLS
         il0dEbMe7wjA2J6lb35cZwF3Bx4qQQXeDYRRHXjwRxBGei6YZ3leVg054Q96vcpxX4Mz
         Hx095eCQr7Dvpdp8bPeRRfIbd2WakZq1XZRC+7UC3MfEZ1/QatsTtEZdMjECnBw2wfkX
         tO6Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9bXwTFp9AKGrAbYnb0G0dejURVlvZlgq+a5a/mlpThUg7MAZDPdPaGPrpsuUmGsmVI+c3CHFYlr0wxHUpuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNaxF+GFAVRh2GgdAGt0mV/e+RpaupBGYY3hvSvCrZb4uDwIpU
	UuKF+kZxMeTLQ+7Jscv4Uenp6xvvqYBx9QVWDJg0APWz3moWCBu9Q2W8IgNYrPIXm4o=
X-Gm-Gg: ASbGnct1tTdxQseepegMxjCDF5FFlSJ+lu0JtHEWFPcI+Bz3Ggzw3g7gvrN47X6wWG9
	a/el0tJq49fColCXupM0IDfiFjb3XGyDozaxAQoAA88lI9JAktDUPG5GhGAo2v+GnP5W3lPK0se
	eq31MuwEMb0FHAXHj4V0mt208WletxsI8tJ4rWdyi/3fJq40CsL/TSQj5C6QQFbFMEpJJYvmwt9
	gausJqUlvE/EXWCQUHFXo0Eg70en1bMqAttyhx4C109hUkv0S3HDdvTYu3LVbppKp9o4XzLTsNz
	stRm9Qnh9/lQsF3l+2gMcvVEBmtoRqdxeLP84QB00/n/JHHtsoUAKQU=
X-Google-Smtp-Source: AGHT+IHJL3AtHw/EonyubylYUgvsAX3aEA1kWb+hfmhi4rwD64AqP18DXBVWa7fZWLEMijUB//O7/Q==
X-Received: by 2002:a05:600d:19:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-454d5c8ae6emr21757475e9.7.1752071958441;
        Wed, 09 Jul 2025 07:39:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:39:08 +0200
Subject: [PATCH v2 12/12] pinctrl: qcom: make the pinmuxing strict
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-12-b6135149c0d9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1081;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=iQ18p+opwS51aj7kQgPPUv5KuYwgsHKMpCHQbdUzIuo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8Hh53vwVwSAhW66U/ZVT3BJ1K+Xx5actm8W
 SIfx8mfLfuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BwAKCRARpy6gFHHX
 coG7EACGCen1sbTZOcLtihqfgfleRvxd76y5gasx5ejhY5jN73Ryz+vjJHtDwd0l8c5SrMksrB6
 t7OuK5xDmCoMqMKP5oOyeqLRRCAkG+Bmb5B2OQB1nzWC9+7adNNl5rNXdk1UlZJum3AJqNI2xaU
 HzQ2ZDMceCyhG/Rb6B4qmWtfdLKiwGQTSjKvy2FoyiKyP1Kkg9mta/0tJcbaoCJ4KIGpY35E1Bz
 vNq+LbVz1VduLsXlH77XQUw5YQApX2JOKQ6E31YI4F6oiDHonqOoshmaQi+J0BEZYUgZEJIgRGe
 U0vwdMdBK4dlY3yHw6HrK2Tnqh8kawBRgh7OeZYoldO7ICasE0MkR1/VRArAynV34jM/THvbj3H
 +plh1jmtOLBgb3t3xLuhkdAjsXU7lLuznLsCsL+cweuriClQTCPwJtO/CuPSxCxQ0O/D4BSRZu5
 cVnckT4XlctODT6EkMNWLvzHgb/PAfHS0ZpGItYuV+nSdQ0nI653/gECD1stS1bkCeVnT/tJ0nJ
 WcFn6s33bTLewA0UiRkRJa3fwOCoP8hZripGucl8phvCVzKI8bI+ueBfR9B0nZzOJjwDDtVTdjj
 Xun95s+UXln6QtpXMasLGtGzUdktTreMUdgPihMF9TwaoN0biXPnFeXfQt2JXn4vWrGO9/mcIM6
 vn/2GgtvVmDuNAw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_073919_831869_0CADA952 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 7010be8d1ace062fcf7743e539d2065d4aed856b..ad572c923e2ab8caed134207ec02c4107d4dc2bd 100644
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


