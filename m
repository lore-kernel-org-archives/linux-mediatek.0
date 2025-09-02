Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA58ACA0FFE
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Sep 2025 15:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZoRwAWe6yFgH80j8Guyt3bkXloByFSMSyop0nIDEao=; b=wCxc+RDR/B1w9J5Qrofl0awtXN
	LYAm+hvZZrP+KJ0z0ayrhGquEON9e4ct/jeezv7Ikw08buqIv6Don/HB/4I5BqdKVr4R/FQh6suWG
	voEinNhf+VMSLcyxsOhPwJHJVEqaBnTb4w1xUaNPUXXn8jVANTUiPVJVWmx1Ig2Mp1kqxoh80WJ4d
	UAAatrgfcp8t6jxi0vzkIh5zbgC1tqNhswBaz6Vhz7zIpH1mFIdLmv1FKmEWh2FWpZv2S+3e54xT6
	bMOxCSNc9dL6IcAjvwYE3pegBzfiI9Ba8nQ4Algm54BE2SFb7O8Zji2FbbcxAFurbfCFesAXrhG6K
	tU9x0VQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utSyQ-00000000gZu-3xaX;
	Tue, 02 Sep 2025 15:31:06 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPfs-0000000H4ad-0vrQ
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Sep 2025 11:59:45 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso4535699f8f.3
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Sep 2025 04:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756814383; x=1757419183; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZoRwAWe6yFgH80j8Guyt3bkXloByFSMSyop0nIDEao=;
        b=I9gKixwcW2qdAbr3Lfv7NtxBW9CyturUFBuX74yBMWFLNAHH0xpT5sEUTy4g0OIulO
         tivlgZmthmFcfQ7muFZcpOIhsr/d0cRQ4ZZq5JD40jv74U6fm2zTi6hnXJdkKSbXD4eW
         UxUFnvbYFQx8b9dr/ifiey7G3Dm+LO36pVa3FaC1r2ckb1HUqdE1kNazsJsZSPTgCpwe
         6vr9w0HsGoCbnFhpW6U0SzdAyvze+BVtnDnRBmWXWzdh47YnRlubeaqfq8It7IjjsJ+Z
         xO1DbWknYW0ij3RHHWeir07C+PujK3PC5vPIFAWImLdIvichWiYUOiae2VV/mTm26B5k
         QmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814383; x=1757419183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZoRwAWe6yFgH80j8Guyt3bkXloByFSMSyop0nIDEao=;
        b=R7rEWxh+O0RBgoL53KSMGF0fLV4Y1eVLCUFORSucNVxMPbsawKVVoMoaew+PkpJNoU
         V208N5EWFasL+MPu/6sEIUrScvePKd65YKJVDdyTD1kI4KSRNTvkUja0xuizoCjaMRYI
         khWl3egRiwRzUfl7K8TD0X71fc6Nhj0ij5SKQDSZSTvWrI7NGxLHh3xRONViSXFa6thM
         dtVIZBjhgW6ouDYc8djzlaX9TMgL2H3xbl8sBNJ2V7tuTdxVDPwhJH40KRYONEGzue6W
         Cp/6cUkj1B/p6FP+6kZXDfhy1qm5NlauRsrxhDsCtd9Wja1xAUd5rXuf+pJli6rKBw/e
         rZzw==
X-Forwarded-Encrypted: i=1; AJvYcCXrzmUE9FAWWSZP4DclMv8AvNBp0ULFJTlUErNLLDW9zybJSLRq4WMDHtdGg3m6pbwLY2ngyHNp/xZKhJzP+A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9od5ElXnyp2YFWypKr9HLuwMTmcxmbrtLydaZCPdaZj2Uf5xP
	CI/Aax8xzLv/ERVafnsKz8owEcI3HCVEJOTyqz5r15X47KHSvOwjisFm56uuFIKpndw=
X-Gm-Gg: ASbGnctBLAc6Wiv3Q03BkcvW7ktNwDdpnyimRTUYJ1tsHHPS+WYQmnz7EiHCAkLBrf1
	nZduAj3L+pKvWMjv1d0NeR0Rr0mNfTl5+GNJqi6Y3qzaAvBKAOMwfHTtwmDs8f0Mjh5vIas6Ejg
	PTHSS9rEzi4TdHnYzpi/EUvc3f30teNKjGjl077jnJLdKaEkQT71styp4Dh8jpHBPaIp7b1Yu0K
	1scT77csiW2eAMTg7rGOT8up1WhjLRszzdcc5v8/yxBxWfYDsdOIQVZ71Nd4rP+7ZOGFVKk4sgF
	tT13vj0jSv3jtJajDYrcX/nJ3HCxqW1SObAgxiS2ujl11GfVJRZdQPLtcUPZl8KB3UPtgssB16g
	8BIElIxzHQFIJwwpy5mx5cxBmkqY=
X-Google-Smtp-Source: AGHT+IHihsnMuL05+vqbU1MvgQT0F+2Pejjix+ounk5ux1VyL7KdAqS4iEwvv3M3i/aDvS1YgEbYFw==
X-Received: by 2002:a05:6000:1acd:b0:3cb:46fc:8eaa with SMTP id ffacd0b85a97d-3d1de5b087dmr9071418f8f.31.1756814382749;
        Tue, 02 Sep 2025 04:59:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3327:447f:34e9:44f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9c234b24sm10224195e9.16.2025.09.02.04.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:59:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 02 Sep 2025 13:59:23 +0200
Subject: [PATCH v7 14/16] pinctrl: qcom: add infrastructure for marking pin
 functions as GPIOs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-pinctrl-gpio-pinfuncs-v7-14-bb091daedc52@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=YcrXV+Vw/YHr5QitFviEgvwH6L2clCkUiJkOzNHp++Q=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBottwUt1OLXwkEzKoyV51MgdE+jkRh1wSFrqCYt
 Vx/Yn7dwPyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLbcFAAKCRARpy6gFHHX
 cv6rD/4/T+Qmd60Ccvmhx/iayQBqYuiWX2dIgsN6ptYMZPxH3lMhAjcyUTDe0eLlcA5KhOrzexH
 jqtqCqq/9JjES+aB5QllNPZSkMWARLzm8TbUEJfWBiCUfzW6G3IKJyzPlNTTYqVeIvhsSKfgCmv
 QWdcag5NzqCY6gKbKw7yFlbwX1vSpzMPvHZfThPRU/b7acMqdTixRbX4p82v8yfWBomrf2YPAxF
 HNHiaWoxArt0IuU41K9SrV0bWr7NhN6d8T1lRHbElpUuREWjXUkVZuAmO10agrMYGFKWLa9txPi
 4TASGnIkv6iU+7pbKOnQx93qTnkOyybTQ36jPlfCdSM96g33OctlRbaHJMWgwT9LQcGCeU/SvP+
 XO1yDDk72nuvYW06zU6f56KjqYxpGwPbs6rcWWs5hDDCyZaRsW2hjmhSl74EBy8tFnQZIwWsaF1
 8qNVhRbJpHrHr9QbM7CG9SQ9y8zVRVG0oV4jPqUV0Udf9sLgMaj0lH7n4v8HPpGeTbFSQNy8haB
 FVxnGiavvme6IkSRNMKQYiRTqKVegC/zsQSeUCdMvnPW+GMvQFj4kC+gc21akybe/N7SOsiQ5pB
 /rLl0+WSQVyHKvouXSW9LJKrXGy0cPRzk1A+pSR0ba5zneegrMyjCFbeB+P97W8RfuwxF3Vw69I
 1xsWVkKRbjBpFeA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_045944_253895_76A00108 
X-CRM114-Status: GOOD (  12.25  )
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
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
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


