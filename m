Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EDFCA0EDE
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Aug 2025 12:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JThKrLTPuFVwzCwJhKd4fJmIEtCxHnGrNzSYzGU4KrU=; b=H7DK3xMMH1vCDo/F5+GkNA0yyT
	JUjd5UpoTjNiEBmzUIG/gRVPlbXAGuDPi1vH8DDHcZH+lxqn1ZbYsrhuaOm2CvTLiUf7T4XKTh9ya
	SKCkJvRDBFRK1X5I7WoDMoJLh2oisNR6xIZ+n/RDZnPWztXMvslJE8xYJ2guON2Z8JGjKe4m/dKYh
	Hhn2qXjTbioJAB06bhWdKnOLFJvkcZBu6BmHNkShI97Pv685K5n513dOYdAJMMXqp9Y59INcIv1EJ
	901FaAs04e6GFk42RdSKL+FP9pUj+/9CUmXw0un299dEufDwRMKB1wH+AijBcOHNfyXBcT/nabMYA
	EWtYYMnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloFU-0000000Aiuk-24BO;
	Tue, 12 Aug 2025 12:37:04 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkM0-0000000AEo7-0hIt
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Aug 2025 08:27:33 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-455b00339c8so33167565e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Aug 2025 01:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987250; x=1755592050; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JThKrLTPuFVwzCwJhKd4fJmIEtCxHnGrNzSYzGU4KrU=;
        b=K6bwqFxy2d2D2LOG+4IE/QV5VJYLBAhpdsLhyfB8t71v6YffqN8pWxMhnANTsmnX2h
         879W2mya1muOlP6WLhlwgeSNSEqvCyufmk1ZEyaXn0j5V8hkJPKQtNoq2xVNFbkjV3xc
         /kFJYlvebnjDp9IOjKF3kwYv4O2Ku+8bo1upz++Ep+TxwzNc4LrYdzNsFNDx1AoEByW/
         XtJ1Zdd0O6Z8EBZVugQ/Y2BjnDwz/dPR50x3r6WMwqeZly9Va6tzeYaKA1kqEulWvwfJ
         YXqxlJqJvBJ15FNWeK7EidwSRw6f0toCpacjtk6mUy7uH2ksY/7mJP0jSsKs/aC05Emp
         M4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987250; x=1755592050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JThKrLTPuFVwzCwJhKd4fJmIEtCxHnGrNzSYzGU4KrU=;
        b=RGF6Ca0OUVM8d6pIj9VpxzS6TspHFXEOXDqMZwdkmF8xRerZiqi9mLle0611eLJs0s
         K/dD7qLGVI6t3QT8Ohm6NuyQI5N9vjdX+9GhHgGaMYC77FbHiDodyewaGgIWvrWlRAl4
         31I/THP7E4ZOHViWyuoImgoAJPy+uz3UcfcjYAwGFs2xxcoTMIe6OoU8pFkN77AwpCev
         NCyPuFMNMBDuuRPqUf54aym/G3CuMygCXTVDDEhyxc3Rxz7pt0hC3e505k+LloPM+OtV
         bJUqTv/FDr9ATcRIFObl4A7zOQFvoJkBMbvbYxKwcXW2XQfXa5OoHsZojtyu5YRue8/H
         vcoA==
X-Forwarded-Encrypted: i=1; AJvYcCVN5UPqpupfrP4+6iuo4r9cQ4k60bENg2YCcX0pXV7IRIPj6fWl45gG/mfAiBlmmHlVw4taOmK3v4HDsQr97A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3tQqRJvDP3P9EcbH4IxpVq23KgSx8YTdlinvNKgog75WEr6us
	+fvwHpGotnJjIlws+A78FszOMuYTAY4/obSTokO133RiYThbhDdRM7fJx8LcmfognWk=
X-Gm-Gg: ASbGncvDKqtbOOowx5K/XBBOPsA2hlJfj598uWaCWzuNc2m1lmg88b2hLjUAkFlgWqL
	Rz3dKZvD1qncyje/QEOPH3N7QwJ1XlWBrUaCTwzLD/6F08koybFpvcvag+f169vTJONi/gZC8ei
	u49pePR51t5qrlNLoun1qa9gq+9cSLZvbVjIVfneLu85d24dVlZDs0MSQrjat1/iK1GU0ApEoMR
	Kt8Im8qH1v9OXEifcM2kTPEhdrHYnerne9/pTN71m7470WLMH59fDLlX3AtrqZ0Ika2wJrjbteI
	yXqF0Ut6N1IfsIOO37VAtYVHPvCms9LzfkabhpWAUVirPOPmet5AQQh1K3uMrCWr4rG/wwX8NU/
	X0ha8a6Q2HaM6Omg=
X-Google-Smtp-Source: AGHT+IFshlOvFK729Q2HiNSttBuhYGO5t1MHAK8R1Tl8WnDbe/OVg6KL0Aon7hXzH1skJVAbXFREsA==
X-Received: by 2002:a5d:64ce:0:b0:3b7:8473:31bd with SMTP id ffacd0b85a97d-3b910f9ab5emr2145237f8f.0.1754987250520;
        Tue, 12 Aug 2025 01:27:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 10:27:12 +0200
Subject: [PATCH v4 13/15] pinctrl: qcom: add infrastructure for marking pin
 functions as GPIOs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-13-bb3906c55e64@linaro.org>
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
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=1TtCXH0c1SnNyHC+v6gZsytFHMfkLN/q6H3Fm9nBNlI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrZ/VR1c42/G4TctgjID2K26TyPL0+Vrg6x4
 9ryMo61KYWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr62QAKCRARpy6gFHHX
 cvCLEACYvBW59+M3gJi5bBpvwd53LIDA7Fi09bh7cf6sZQwrhnc+q7Z7XDWdo3gOU7A4yZx8nrE
 lf5eZ6c3y4GemvfNQDbmd0gu0FBsb/49YwP4k87d87Cdt8fNQd/08Gh/u32vbVpO16l2Je9VuY8
 3WZS7KC5/KJQPKXbmxUpP5C2z8mULdzAb4PKQT3dZ3s7f2T+hMUUwinrZx5u1klaFQrlOXkNTTE
 ba1l7tJFuZ8cxCTDfvpt3YSkOLMkDNM5HWjtfxL/gfiQ11OM42MAVw/QrrA0hu0Ez37gjOlTBx8
 ZfQwmRq7Gx7f8H5yXUyG7PrHQL+qjkqv673/8cqJFGcqwAse7K8jlSiu5yAKyPafqYT3neO/k4u
 APj8e2LBEwVjTBl0IhJdS6/+3AlWncZFxd6E60ROpK0huq9Ds5Fv1bIjzPvmGW2GKpF9MFCbdd/
 LX+uj8t8HrERHsIxj8Mov/RLEFgf1ECdyKINeMXsW0lLsbYkkDL62TYt2+/nXHkr6BSKZ1JX3gQ
 HmqI5/Ni9xR1d9/yvtzD91OFmakZA9BucAoum0WdD/tWCaF24vSjO/wdUntMJqmkxYWMM4CY0ro
 B/bQkovAcHO+am85u11GmUCv0se9FwLnggtnVe9u5hXKsKp22bC+38tNUX6xqHYV+hSPyXCLYu8
 hN8vLrtlGpDakqA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_012732_214985_C40152F2 
X-CRM114-Status: GOOD (  12.08  )
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
 drivers/pinctrl/qcom/pinctrl-msm.h | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 96e40c2342bdedb8857629e503897f171a80e579..a5f69464827119dfe2a7781b558094b283fca215 100644
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


