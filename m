Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE074C71133
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 15:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:Mime-Version:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bELfz3w2j893PNHUaLtbdQ42P6gz+Z983PYtPwmORCE=; b=YUkf71BRvMbUN8R3RfwQz9U84t
	pj+6pjMQfH5xDQCAJSBZ4xjtAsypFWdSxjZwFHhK/4q7ygzr1bu1l7aBdoQbyQVsKyv9HVGMmZ07d
	CvL2C+/uFDSmhjJz+zRMqF+MkmGijtccisr4isjlWrDbd3me7zGdGg8CagGs7y7qKki54t22W46z8
	baWIWLDrPkcTXTluQ7oS6n9uPwbg9HA4Ewv2KplLWCAYTK4u+yM++mt4Cm9wAQuAKDYVvCaD1hgma
	/vJP4ygjpeLTzeP7FvUFe7X3AInCNo9aRYMgHrsT3DYafy0NSQdod5o2nR95aaoL/jwlz+rZeN02A
	y1wKn5SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNoz-0000000AW6d-3BpU;
	Wed, 11 Jun 2025 15:57:02 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKtC-00000009sUI-3KCJ
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Jun 2025 12:49:12 +0000
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 434804470E
	for <linux-mediatek@lists.infradead.org>; Wed, 11 Jun 2025 12:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1749646142;
	bh=bELfz3w2j893PNHUaLtbdQ42P6gz+Z983PYtPwmORCE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=JYquwUhtQeRO7wC/pNOwwKJCfHk+jwK/ae8GUsyqRV3FPtkBFOnnIMggHlU4DTQnt
	 dEk8Hla11cnNX2yHTe5ejju1iiHefQJQzePsMW9ZTPXx3cYX1v+wpNE633atfazEgJ
	 gr4Az8oOTKZ5UNZZhlmhP1shrqVNvy58uMxufejPQQLXYbZS4LZLAHCKm++XBqNctB
	 wYAGXbeUxmiwSEUswyY1Y9Rc6+y9L7UYa14ddrxvslPOycgPI0ZilGhg7wafSTFc7m
	 asTvht5EhQpXn8BtC6+MR4peaOO5LGuejHK2jvdELmiGSFuSHyauuxCTMmPXhNLcbP
	 KaiCXTLhiDEmQ==
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-2e922a13d49so6024935fac.2
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Jun 2025 05:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646139; x=1750250939;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bELfz3w2j893PNHUaLtbdQ42P6gz+Z983PYtPwmORCE=;
        b=qMYlT6mYVIJjkaTJysewsfasKQ2xSFpFB8id2+d2wJ8igrl3AmzyX1F1E8wU9XyxZR
         CUkjUcoien71hTByLwn7HYELubfef66RBn2GtRnJuTftYmgpzg2MKZw4JP15F9rTQGxs
         B7C++WQ60N4p0JCB5siKdYCs0Lkl9oERhVzQzKqJCUMP5HpDkHiovOOYXZraVGi+AGEM
         3z3K3WnzM0CLo1jzTPr2nIVoACeRR9G40AuulC3swNyXeHxWsl7GFo1MSrAl2+D4r6kS
         NHl7zMAdqX1uxtxI+elw///8cPBOjE7vWeLcShapgNEvERkXpnrLaNRDSy4Pmo/Q6o0s
         AYeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtwj4KOrS25IO1qSFog/lR1/vFh6Y1selE/8MxH8XIjAHngCJwBFiRb0eZOl8nBfuAQ04VZ/5yybgVRufwhg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7s+auei0IY0P+KAx/Z1JW3WVt434/zudalxvyAL4TFA748dTo
	vkE7/94SmiqwyjR0Umn5LywskLbYf7WdlnRjVeFqx+8SF77UGnH89UI0Q3KUk11ayt/K+r09K7X
	HBHCW9XiGALmzw/Utk8ou1deLFjWERn/su8qcwYwJC8IozyaarmxDSrdh/oZYKH9KVjkVpzTQRv
	SrZUW1SPJWG/ln30ED2AEkaa78TFbf0MctNQq9T84RNrzR7O+FWPBDgqTS54MkAAqY
X-Gm-Gg: ASbGncsMPOvkETtTmoVJUBU+fm3SjdBMU9ob68AURdr6K67fTMeY2DodVVxNbVF6dna
	8qGBRnXOkZlDZbPtAim/VMFz3Kwnj9YABiU9dgyBwJ0rZ1/sRIexWT+Cxs0dEjSmOcNNIlahI1N
	xvbg==
X-Received: by 2002:a05:6871:e803:b0:289:2126:6826 with SMTP id 586e51a60fabf-2ea96f18fc2mr1940830fac.30.1749646138932;
        Wed, 11 Jun 2025 05:48:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzhqyM2kCCDhwaEPz02MLETIROTaGu5WeJENkIMCzCu3hfLe4ldyitgFfsfYyGdI6dZNlApiM1ratiR1ypk/k=
X-Received: by 2002:a05:6871:e803:b0:289:2126:6826 with SMTP id
 586e51a60fabf-2ea96f18fc2mr1940818fac.30.1749646138634; Wed, 11 Jun 2025
 05:48:58 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Jun 2025 07:48:57 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250611-pinctrl-const-desc-v2-1-b11c1d650384@linaro.org>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org> <20250611-pinctrl-const-desc-v2-1-b11c1d650384@linaro.org>
Mime-Version: 1.0
Date: Wed, 11 Jun 2025 07:48:57 -0500
X-Gm-Features: AX0GCFuz_RtY5rxDREJdwFYXLGRQkyQfytWb3LifI1_It-SfpAfrMZfWta2TVOY
Message-ID: <CAJM55Z9WzsxWGmQYH05hSisigTRaHuKOn8g3AsLJ9h6Womy2dg@mail.gmail.com>
Subject: Re: [PATCH v2 01/17] pinctrl: starfive: Allow compile testing on
 other platforms
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
	linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_054910_960033_60BE8FA1 
X-CRM114-Status: GOOD (  11.94  )
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

Krzysztof Kozlowski wrote:
> Always descent to drivers/pinctrl/starfive/ because limiting it with
> SOC_STARFIVE is redundant since its Makefile doesn't build anything if
> no Starfive-specific pin control Kconfig options are enabled.  This
> allows compile testing on other architectures with allyesconfig.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  drivers/pinctrl/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index 65dac8e387985ac7f865d13325eb903f64645a2a..de80f3ee52c40f3a817f229a751909c590161594 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -83,7 +83,7 @@ obj-y				+= sophgo/
>  obj-y				+= spacemit/
>  obj-$(CONFIG_PINCTRL_SPEAR)	+= spear/
>  obj-y				+= sprd/
> -obj-$(CONFIG_SOC_STARFIVE)	+= starfive/
> +obj-y				+= starfive/
>  obj-$(CONFIG_PINCTRL_STM32)	+= stm32/
>  obj-y				+= sunplus/
>  obj-$(CONFIG_PINCTRL_SUNXI)	+= sunxi/
>
> --
> 2.45.2
>

