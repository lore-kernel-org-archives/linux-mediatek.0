Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C12C83F0A
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jul 2025 16:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnZLud9yO6zOA+K6EV0Zq/kEr3WEEyX9xKA6hhGjpKg=; b=zbDPwZ3tsPPi+dKcEix06+OyA6
	xD4hwskXIGj2rgY2sl4KhhSYSIRFZUQ6w3/O75v+4bNzBVAN68k+lTxW0g7o0xqCh2ORte510AULL
	aKe5HqFSVp2seuPD5T/639s7G/oL5YZR0+jwCKbXBNh/h8cMcHptP9dTRhrFQH2HTjya/qbWnAyws
	swUYHTNoRWa0XqkKCwRB2VidpE/uk2d+VFOoQGcvQkg0t9cCwm/eFKPqwKBx8dPq/rn0PRxIvEeRv
	dXui5Wq6MOw4wV7w8hWfLMFr7brMCx5oL98EOwaygE1zTQTDdXdQAyKXEKa97Fon5fjLWYthnXr2s
	z2GCs4CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZY8h-00000009NTT-1kRw;
	Wed, 09 Jul 2025 16:59:23 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVx7-000000090gq-1xSH
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Jul 2025 14:39:18 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4537deebb01so33495755e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Jul 2025 07:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071956; x=1752676756; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UnZLud9yO6zOA+K6EV0Zq/kEr3WEEyX9xKA6hhGjpKg=;
        b=l+zspEL/iXRZafcP5LluTlHMgRYN88kc1VUSewmVWikBhGOy0spX09H5a9ecnMV4xZ
         bKFpZDSfODhSvx13jp2Ep//z9Ut2q1X0uR/987G9153siwf0u6HI7A8rlnoyGooTXZLD
         XhOLf9wEDDals2ZWoTmw85X00ccHgUhNToBxQD2aEPBUoezt7nlR1ZReraQw4rzrGC6L
         pF4jU+oNdSF/JLPmW2bZ90JInOtPXIgIoE9rlo7iK+kGaizMGN695fXIQaj4Ydk6mHpT
         f+IXehQROdnhVBxUho55cZW+QJuGf5yKua8ZJAPeNUOimxMKiR2NMsBzsey7oe0GKbSS
         JdGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071956; x=1752676756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnZLud9yO6zOA+K6EV0Zq/kEr3WEEyX9xKA6hhGjpKg=;
        b=jzbYUcfq1YE1aVf/FVdMOIeNdMDZCzjgLiSiCMf4o/mSz4z+qSybB3DrWrrG8q0EG8
         jsilvdDxOhkeY7EsYOE5WuMFNED6gQY4A22s9fTaQBzUlZD0QL6KLlSww9oKaEiHZezN
         Vsv5CxEccEYpsBB3mtv+7H4cK55ImshfY0DmvaZOyc61B9HGOdQwzmsZf7VenKPp/tcx
         BrZeslOe3UlH+pSV/HD8n32PKEwv2SXWfwzRk0YKcw2cIxHKY4AuA2M7IrP9n1S//XOF
         hrYWYqv95hqLOc2r4AAi799RvNagMGWOIZHF226LLBoi+Od2iklB7cFQnZxcMQeDNvzf
         Bo2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxv4TDKAf14n9zhJ/ORc4BsD6f8pbCQsOVA4QlKSLnckfU2UG3ihxqR2RuMMUqGQEld20M7cQ9cIBnfdzbkA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLNQU1Cwk3TXjrUVUfi/W+0UkULuGogGlbyMepDZQbEgt6olmy
	SATxHkDcHZLFZ1CY4mu0u1Ip/u/7NHknzpkh+cWhy3JsvN9mfxDR3tcNu8nS8FCUqK4=
X-Gm-Gg: ASbGnctB/iZmP6ltWA6yHkBIjnpJCX+hf7BJVUfzHKkZCCxFfKg7KJiZCw+3jCD2/8o
	akxnDyckdaUFsWfy/g+RwMjDRWS/TUS/iyxsWF41XiBSfl/y3JarYRvY/lQdfckq9YQfRSEPqDm
	LXlwkf5AYLf0Hu/cFpWeFhj5w80pHY3h8l5NDZSxBY7NieLfo571JXaupjDpD5UAdJpxWCbnmxu
	fZi3hDAyLgHYr/AwqnrtPdTv9KPjORIEaeasDXcWLgHlsnCTwKrZ6xdX9PgwdRfSBYTICdpNvru
	mXojZ5IcV2KywcnOXmhR+6iznTzSgaCriqo464A2pNqf8TaQAv8/PDg=
X-Google-Smtp-Source: AGHT+IGq6DlUYoApEugH6cDhO6AeupjgahOv4gDk9/vuNfa2ylaW/Guo/o9ndLeOYxtCCVeM7IgCyA==
X-Received: by 2002:a05:600c:4692:b0:44b:1f5b:8c85 with SMTP id 5b1f17b1804b1-454d56af9e0mr29208915e9.13.1752071955911;
        Wed, 09 Jul 2025 07:39:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:39:06 +0200
Subject: [PATCH v2 10/12] pinctrl: qcom: add infrastructure for marking pin
 functions as GPIOs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-10-b6135149c0d9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1694;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=UdZ2DBMT7xZXebRXGSH+ALcw7tXi9xCLUU0Hy5OPvAw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8HRwoShqLTGfiStGORsuza7OvA2QrMSBi9l
 ChFmBizpqSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BwAKCRARpy6gFHHX
 cnosEACh6WbaTtFBq2fxmhuAoGjSt+Q6E5srezOcew+EQXK6B0xtC2/jrAK0kyIdTlCiI2Jpb3k
 muui8bz+61HhIfL3xVRg9x7DZmxPMEGBTLX0wgxKYWLoabpwPGZAEVTrRFObmGV0EF0Rcxdgqq8
 DO6+GW9hWm/5CFmta27hfXEkgVFGnBgWwOkdgCXjd7IqVBT9cHAFtwK0/7y4QakKJLNfOhHEcEB
 dz6FfKO18xUZ7x9h5Azd2WQPtOc9qC3zN1SqrF4iZfKL7gba49XoNAKSX2l+osa6BDjbL6nKInQ
 RsAckjuQxY3jcwhZoIdcsUpW4Br9HhwpeAsU57wYPkbp4V3K4D+ZJ36Lr422MaOevqy6GTmMOKO
 W7apzN2klYF6JSOjzeynE9221HkqjqEqSCLPAq/K2z6xzjDYDpjzvX+yG6UlMgCHuz5qretJjIY
 P9v4eiNvHWbfTnBNIkNvI0aw0kWzP/qJsenuHmmpR5l1XaV6O+ruecKbv9jpi47XhDD5N2gKVQA
 Ibq/uYr4pIV5r1VCgSDZ5Mq4JIialrRhxOSdKjWJZ7CLdkVuVnYNbj9f00oZ67TF8yghNdx/OzA
 Lw5AXW6E6RqHHrZwuRu88iGvgV0/k4Mgp7AIsiLAorpNJ8tIa02LLZe5E+sOzH53zortWOVYjQF
 /LwuyRHibnzRGZg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_073917_501425_FD78FA11 
X-CRM114-Status: GOOD (  10.53  )
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

Add a helper macro that wraps PINCTRL_GPIO_PINFUNCTION() for pinctrl-msm
pin functions and assign the .function_is_gpio() callback in pinmux_ops.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
 drivers/pinctrl/qcom/pinctrl-msm.h | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 965f0cceac56697bc4cdb851c8201db7508c042e..7010be8d1ace062fcf7743e539d2065d4aed856b 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -265,6 +265,7 @@ static const struct pinmux_ops msm_pinmux_ops = {
 	.get_functions_count	= pinmux_generic_get_function_count,
 	.get_function_name	= pinmux_generic_get_function_name,
 	.get_function_groups	= pinmux_generic_get_function_groups,
+	.function_is_gpio	= pinmux_generic_function_is_gpio,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
 };
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index d7dc0947bb161868c8f433dc2536719b8afc8bd8..4625fa5320a95a4d24e3a0c98a249e4f163dd4c7 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -29,6 +29,11 @@ struct pinctrl_pin_desc;
 					fname##_groups,		\
 					ARRAY_SIZE(fname##_groups))
 
+#define MSM_GPIO_PIN_FUNCTION(fname)				\
+	[msm_mux_##fname] = PINCTRL_GPIO_PINFUNCTION(#fname,	\
+					fname##_groups,		\
+					ARRAY_SIZE(fname##_groups))
+
 #define QCA_PIN_FUNCTION(fname)					\
 	[qca_mux_##fname] = PINCTRL_PINFUNCTION(#fname,		\
 					fname##_groups,		\

-- 
2.48.1


