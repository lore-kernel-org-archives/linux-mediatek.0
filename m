Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D20C61DA4
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Mar 2023 07:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GezqDX/ePqvpjZIuKIvbpmkWxRTWWY79otLLtVmi4uI=; b=KHjDQ39Fgq4sbc8fMc032xqZnw
	XF4j//HQYg6QiVkMWytCxg29xpzoz5FljAZKI7J8X3r1PzoL+YH58I4jyCbCLBteyznfoUamVLm9z
	lmO2VPd/M73OXW+LjonocHO3Ubw3JvfIOJVUsT7X3FmGYC8fi8HiOZJpXEOa1OtQTaXRGarXcm4gE
	Sm4gm+hYgo9lIZHWQKAi3tO3NLBnBMwmWs0o+vDeOF0lkeQ0erKlBqbLSuSeSr7pe/tcFtZTGnM8T
	04tV6WHQ9TulXKY132KZHW2crtkPwUetYeIQhE1E5fCe8ezGuHx0dWCSeMMYmW7ujtdC43jYr5+bo
	+/KXHWzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdRTD-004NVb-1k;
	Sat, 18 Mar 2023 07:59:19 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdRT5-004NS8-0R;
	Sat, 18 Mar 2023 07:59:15 +0000
Received: by mail-ed1-x52e.google.com with SMTP id eg48so28460902edb.13;
        Sat, 18 Mar 2023 00:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679126348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GezqDX/ePqvpjZIuKIvbpmkWxRTWWY79otLLtVmi4uI=;
        b=MIo4FysqEObPhPrO5ovWEj/Y+fjZ+JHzDeLwvK2p1XLlCl43vYotPoQU5pTbqrDxfO
         cRK5WXQ9/E6U9BOSrRCKrVesqIQxIokI8jXR4Pie7uaeBDSBqAznP6Q64if4WSxEJ2/Q
         uaVGKBSsK5sOOnPS9sxtLbC2d64pZEN5w6OdRlSecJd620C0phrsybcJEqvTR1GIeGXH
         jrvrrIxlcw8pcjROtkJdwn3pzJYizNDhLUUSwmK3KPW2B3ro+jym3U4lB+XNUqHSJAyJ
         jrjd4OKlrIikF7TcfJa3H13regSRB3FGldUrSL21tPAIM7UO29D1CGM30oEb9xKHwwoV
         S1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679126348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GezqDX/ePqvpjZIuKIvbpmkWxRTWWY79otLLtVmi4uI=;
        b=AeMh0EUMlG/ISGhu1V5aw7zW34UggXCh7GjQy+CVU7OqcYtLhYU9lZz+ZwCHd7YEPj
         gy480D44A0DXVDW33iiuZg9mNo+AJWnqxRZdTXuMikCeSeU0JoCIFJFOZmNbQspYCCJJ
         0bdUpS89K15osaZnNVSGtvX20vYwqSFILoqjq/se489+wdqBc6vl3NblVdWkCMDL0ZIa
         ZB6xVwgHYNwEYXpX581FnX3QZao5SzicB1F6FUAtl/zopeebCl+HEJ+Qh6AmpydNpI5K
         mwJ7KHV20siO41qqlvE8xhaDNhYpSt+jXRJLi4NsfzsaA1oljY3N7MllbTm+xojrAxnc
         sNzA==
X-Gm-Message-State: AO0yUKU4aNNlvb1YXHlG6DRsxa1/aus1G4YFl64m2eACnhNjgVDJmCB7
	4zDxZCpIMCnbpOQY8ehyeMM=
X-Google-Smtp-Source: AK7set9nT9qNsfgktXgC9t9HagqTbjcAEspAFTOqh7EcN3bos4Xtz1AewsGVVMnDSG+mVDFOgXgh3g==
X-Received: by 2002:a17:907:20e3:b0:926:8992:4310 with SMTP id rh3-20020a17090720e300b0092689924310mr2058754ejb.38.1679126348548;
        Sat, 18 Mar 2023 00:59:08 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id i6-20020a170906250600b009306be6bed7sm1842624ejb.190.2023.03.18.00.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 00:59:08 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, Damien Le Moal <damien.lemoal@wdc.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>,
 Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] dt-bindings: pinctrl: Drop unneeded quotes
Date: Sat, 18 Mar 2023 08:59:04 +0100
Message-ID: <1846135.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20230317233623.3968172-1-robh@kernel.org>
References: <20230317233623.3968172-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230318_005911_192314_67B5ED45 
X-CRM114-Status: GOOD (  11.31  )
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

Dne sobota, 18. marec 2023 ob 00:36:18 CET je Rob Herring napisal(a):
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/pinctrl/actions,s500-pinctrl.yaml         |  2 +-
>  .../bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml  |  2 +-

For Allwinner:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  .../devicetree/bindings/pinctrl/apple,pinctrl.yaml     |  2 +-
>  .../bindings/pinctrl/aspeed,ast2400-pinctrl.yaml       |  4 ++--
>  .../bindings/pinctrl/aspeed,ast2500-pinctrl.yaml       |  4 ++--
>  .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml       |  6 +++---
>  .../bindings/pinctrl/brcm,bcm6318-pinctrl.yaml         |  2 +-
>  .../bindings/pinctrl/brcm,bcm63268-pinctrl.yaml        |  2 +-
>  .../bindings/pinctrl/brcm,bcm6328-pinctrl.yaml         |  2 +-
>  .../bindings/pinctrl/brcm,bcm6358-pinctrl.yaml         |  2 +-
>  .../bindings/pinctrl/brcm,bcm6362-pinctrl.yaml         |  2 +-
>  .../bindings/pinctrl/brcm,bcm6368-pinctrl.yaml         |  2 +-
>  .../devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml    |  2 +-
>  .../devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml |  2 +-
>  .../devicetree/bindings/pinctrl/cirrus,lochnagar.yaml  |  2 +-
>  .../devicetree/bindings/pinctrl/cirrus,madera.yaml     |  4 ++--
>  .../devicetree/bindings/pinctrl/cypress,cy8c95x0.yaml  |  2 +-
>  .../devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml |  2 +-
>  .../devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml |  2 +-
>  .../bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml          |  2 +-
>  .../devicetree/bindings/pinctrl/fsl,imx93-pinctrl.yaml |  2 +-
>  .../devicetree/bindings/pinctrl/ingenic,pinctrl.yaml   |  2 +-
>  .../devicetree/bindings/pinctrl/intel,lgm-io.yaml      |  2 +-
>  .../bindings/pinctrl/marvell,ac5-pinctrl.yaml          |  4 ++--
>  .../bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml      |  4 ++--
>  .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml      |  4 ++--
>  .../bindings/pinctrl/mediatek,mt7622-pinctrl.yaml      |  6 +++---
>  .../bindings/pinctrl/mediatek,mt7986-pinctrl.yaml      |  6 +++---
>  .../bindings/pinctrl/mediatek,mt8183-pinctrl.yaml      |  4 ++--
>  .../bindings/pinctrl/mediatek,mt8188-pinctrl.yaml      |  2 +-
>  .../bindings/pinctrl/mediatek,pinctrl-mt6795.yaml      |  4 ++--
>  .../bindings/pinctrl/mscc,ocelot-pinctrl.yaml          |  6 +++---
>  .../devicetree/bindings/pinctrl/pinctrl-mt8186.yaml    |  2 +-
>  .../devicetree/bindings/pinctrl/pinctrl-mt8192.yaml    |  4 ++--
>  .../devicetree/bindings/pinctrl/pinctrl-mt8195.yaml    |  4 ++--
>  .../devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml    |  4 ++--
>  .../devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml     |  4 ++--
>  .../pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml         |  2 +-
>  .../pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml         |  2 +-
>  .../devicetree/bindings/pinctrl/qcom,tlmm-common.yaml  |  2 +-
>  .../bindings/pinctrl/ralink,mt7620-pinctrl.yaml        |  2 +-
>  .../bindings/pinctrl/ralink,mt7621-pinctrl.yaml        |  2 +-
>  .../bindings/pinctrl/ralink,rt2880-pinctrl.yaml        |  2 +-
>  .../bindings/pinctrl/ralink,rt305x-pinctrl.yaml        |  2 +-
>  .../bindings/pinctrl/ralink,rt3883-pinctrl.yaml        |  2 +-
>  .../devicetree/bindings/pinctrl/renesas,pfc.yaml       |  2 +-
>  .../bindings/pinctrl/renesas,rza1-ports.yaml           |  2 +-
>  .../bindings/pinctrl/renesas,rza2-pinctrl.yaml         |  2 +-
>  .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml        |  2 +-
>  .../bindings/pinctrl/renesas,rzn1-pinctrl.yaml         |  2 +-
>  .../bindings/pinctrl/renesas,rzv2m-pinctrl.yaml        |  2 +-
>  .../devicetree/bindings/pinctrl/rockchip,pinctrl.yaml  | 10 +++++-----
>  .../devicetree/bindings/pinctrl/samsung,pinctrl.yaml   |  2 +-
>  .../devicetree/bindings/pinctrl/semtech,sx1501q.yaml   |  6 +++---
>  .../bindings/pinctrl/socionext,uniphier-pinctrl.yaml   |  2 +-
>  .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml  | 10 +++++-----
>  .../bindings/pinctrl/starfive,jh7100-pinctrl.yaml      |  6 +++---
>  .../bindings/pinctrl/sunplus,sp7021-pinctrl.yaml       |  6 +++---
>  .../bindings/pinctrl/toshiba,visconti-pinctrl.yaml     |  8 ++++----
>  .../devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.yaml |  2 +-
>  60 files changed, 97 insertions(+), 97 deletions(-)




