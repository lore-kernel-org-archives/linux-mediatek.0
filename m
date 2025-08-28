Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38911CA0EED
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Aug 2025 19:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JThKrLTPuFVwzCwJhKd4fJmIEtCxHnGrNzSYzGU4KrU=; b=bmaFukxR6ZN7wv0pUxo5RP11Xz
	AOb5Ieo0S4Z2s/9b++VDQDsa+lpAmdsF1ygPgAoR0YXXY3nL9uSSXeo2yweA0ifH5L7rk56ZkWbCn
	Jo75Jr+Z5j5suW4US2ac8lc8AOsbOTJB7JJew0Vdt5MQoMSCtjEhyIBAyF5M1sG9qRA6vI8eH14Q8
	9E3HzXRcAc0ir4+1EGny4Jys+XqmkhanRglNZDF0Xpa/dkNQPTVSZT7pMk2hWSUpzjskRSTItgtA5
	39+oggj68lodwTbA7om0paRyOoYTHSfeOlNG6G7/Q7gbZ5DapEqj7Xy8VgcGfJk9Us5XOZEz6w7TD
	VLSJ84Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhvM-00000002vPL-1mhT;
	Thu, 28 Aug 2025 19:04:40 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urf3L-00000002BSN-0PT3
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Aug 2025 16:00:44 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45a1b05ac1eso6096975e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Aug 2025 09:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756396841; x=1757001641; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JThKrLTPuFVwzCwJhKd4fJmIEtCxHnGrNzSYzGU4KrU=;
        b=2wV7IXT7FAx1HUv02HX1kCw8/zo/0t3YfYrTT63F0ngMojdudtRmzjmCUitzk4vxEX
         cCRaFpsp+3p79+qDOVl3pe9xCrBomoU1V5Z4UbzbnwYLo2gSFidIfpxaiu0wnZMUtzp1
         CmN7Oyb6N7BExA0D+2z5OHDKicudQwSKGa3qoQ9YOV2Kad2jI0iczfZBfNwGElW3TEg9
         NYkRq1nWkFpTmoJYxjpUvXV8MP+ohCQ55WcEqXE/X+eFSGzYr9tS8vBbDx0c5Yh3FaqZ
         f35UgSEwJbNkubN2Of8axp/HZeFfurDmIyjzCEMZ+wA0QgxHEqX9i2Ekq34HCfKSzQLI
         +5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756396841; x=1757001641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JThKrLTPuFVwzCwJhKd4fJmIEtCxHnGrNzSYzGU4KrU=;
        b=NPJYD6gwZpHtQDreXZSr023x4ENnGV4T0sv7j1SFLtIFL7zbCX0p/DFtRYHz7We4bF
         NzEuLu7TC6qZmbQ7xsc1952La0MTz7Z6M2TUXpeueio0QZ0rk3f9+xjjuola9hGw7jCm
         Yc5npjGb6LWnfUvH9AH/odRGc7FAOLE6UHoQdAjuL41xML5h0aCe/8AV6vEEEpxf9rjk
         Axq+xMARapBi1LD2gxAV2d8BATRS8Xt/ulTDsQHr/a69edxzbTZe+StDUD0hZIm1Bhio
         8mFF4K11xIBgTlAzd3fDpdVAiZyeE+bpt4ROnygtaA9R7eDZ67qR/oI0lRPste66pDbP
         z3vA==
X-Forwarded-Encrypted: i=1; AJvYcCWJc67DjXKd7a78Aod6emHWGX2z8FUfpRMXmu9zHMczcuaYDJzuTWWujBb77ucrDQYPhBbhUFEkya99wrRh5g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn4BOHBdsCLYYq0OzLZcin2T3tofF3Z4YQBsvsr537Fc4uIsNr
	0Fg80ZWPOqkcjDnNExhDPZSPz2kUDEV3x/yxOkQhL9ki82qwPtMqT1tjpvU5LtYTaIs=
X-Gm-Gg: ASbGncvngU5KQY+iBKEKpAwednzjq1KI3C4cfdT+JfKTbAPGLRS5phZMgflEHJJnaqz
	c+XQBrRotc2uFIjbX1ezQ/bUkRWwRzgQPvh/o4uuTLg1l8HT2kEGWyGAn6OsdK17qbKaoH8v3Oo
	JEW/c8pcKVIWT0GpCL4gj1OAt43mwPHN3V3iWoGN6CmZDNyM9VUGD4hQZ66lyIfcolFwofCXW7b
	yA9Z5F1IbaBkR7JWQbn57mXUJ2dbTlYTzWfmRN+nLJD8ud0Ps4vW/erfLvvNb6rPRD+VpyUobe2
	/U29pfMDl1A/ZrIFMnap9lG2kgbSZ/kbU8yD1TZcsGkBOOPM3hDydawZ/FZH8oaXCP/DZc2+r8X
	9+zU2jWBRuUb99han4A==
X-Google-Smtp-Source: AGHT+IGBclbNO8WGRtJ0uIJ0ka2pGvDxULNrTlJVFv33q7V9H1vL8p1aMqaTfJLA+km5WeyuNutw9Q==
X-Received: by 2002:a05:600c:548d:b0:45b:6f48:9deb with SMTP id 5b1f17b1804b1-45b75858134mr40479305e9.28.1756396841346;
        Thu, 28 Aug 2025 09:00:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm80211675e9.5.2025.08.28.09.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:00:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 18:00:21 +0200
Subject: [PATCH v6 13/15] pinctrl: qcom: add infrastructure for marking pin
 functions as GPIOs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-pinctrl-gpio-pinfuncs-v6-13-c9abb6bdb689@linaro.org>
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
In-Reply-To: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=1TtCXH0c1SnNyHC+v6gZsytFHMfkLN/q6H3Fm9nBNlI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosH0PIg19tb8c/EzOw0dn2/vV0Q2+khf5QKTgm
 oMVFo9hzQuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLB9DwAKCRARpy6gFHHX
 cmqpEACqff+3ib93FI87PuYM4exeofWP28ytmolqFv/JNDSfQlXfjFmYnRfKPTFyBA76ttfOjLm
 ASMPBrH6jm+gDbBK71pqHYmPLR2F3+VbGeBrBP4P+U4KIOoMivjWw3M4zYZw2pqshTxIuzIk8hp
 p7MU2ac3Y9n23iveKbzSAK+EoAmSxL2lQ15yc/7o8ph4+/jCy3aXmdAepBlD2zhWYVn/xEtcAcp
 XMTxIoIzyILFd7r5Z0RbiaGuyI1mT29BWNgpFIRDw954gCvFOYWUrbn2o/Lkg+Qctpz2A4FUeXI
 Diiu3zoutBbFXtO89+FSOyzdmqfSLbrt7rVfKtvvSp1/OoGcglsdJ9T5oWoGjckBb4Zc0Sbj1+U
 /4oXbRes08VCGwU5d0qXt2c2lxgrVlVnKODYUiEPU9qJkPSIX7Q9PAUOzdF6wmMNQBs3xWUDxDv
 PydivI+3iUC103HTAmcWHpervRU6SelZmt3njPpmXzohKb9EzGDwrif+F+FXALOTHaZUARsDhtf
 HPf1uVDdCvVnnIPhwwMrx5l+4F1B21FUAmCe4o6k2r6BZp5mZGL2FBpb+ZIiABfcTzIwxLGjOvn
 04jBAAR9bb5jV1pFoCEljbH/f0c2ullfdb+vvcTGt2JrOg45VcIDDclxo+6Iw2aCGRgUNKNCbPg
 KlIxSfNF/oUQW7Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_090043_133462_08A57813 
X-CRM114-Status: GOOD (  11.85  )
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


