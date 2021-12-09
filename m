Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68928C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 10:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KEuTzYHzIgacFrZ/0XCjgDEFyr8DYsc5zX0evlsDh4U=; b=Uu8seWDG9rwvtm
	pKBjAIycZZcqbrKkuWePok3HomZFB2b9LdkHA+v+OvubRSxgTMjEi2tRZ1DTtzK/nFRBdqwEaVwP5
	fzx0B+HcfQPJOjWbV6BoA5zzAgK0k+vZ+aMhbSqxliEsRmPln3XHLPUpe8ov2FiFzTRwWYnPZEFo8
	P/8XYXJs8fLhxg9M6QayDFNVjiK4RVOTN2EN9AjWBCJPykz6pimdbPD1Yvt5pQqAuO2Jyy1pJ73HW
	sSo370TbBv8NHbCzAfYWftNxTN8UcSymmZYdTR3qPLx9vFlyivKjKW41SAb0CLIhCNjTKHML5Q9+B
	RL2VFFu0LUMSHO/aGzWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvGJb-00FWbU-RZ; Thu, 09 Dec 2021 10:06:15 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvGJY-00FWZe-Jn
 for linux-mediatek@lists.infradead.org; Thu, 09 Dec 2021 10:06:14 +0000
Received: by mail-lf1-x134.google.com with SMTP id z21so10948901lfu.8
 for <linux-mediatek@lists.infradead.org>; Thu, 09 Dec 2021 02:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F1owymgiCbwjtMOY3GwDKTTRv4aRJ4ddqlYjVacAxeY=;
 b=IEAlki6D4NihEbGixc0ZB8q1mWKYeVyBm450yjRD6H+nFTePjftgbNP1DSbjKJC/wn
 aA6G1S7zyTmWIk2wnFu1f0vt67RzKqsiulULcMDgUC+z69q+XtVhP3Eu0UC0yezAwjNB
 vX82i6L0vOPMOqpqTVSvYYCMeFCK7iTHxJMGDkkT5ZH+GnHs9SODYR5MYMhq1DGi4GzO
 jzkp592RVDVKnCu1VIpNL7vqWdE78LfoQ/N7ed/l18v1uQfKPEjZBRH2eRUjtNTKCBPA
 nWa9O+uPUfVM+lsrddwkRKNoYhpf4nu+XyMW4JWKq2CaEyoOmsYKC8jQgxIh6QFH8/oT
 jcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F1owymgiCbwjtMOY3GwDKTTRv4aRJ4ddqlYjVacAxeY=;
 b=BxK1da9ZPB/CanZgDxCr9vcqkPB44WlFe6apCDSItSHwFPp64Rf7lUc8lWopCOKtST
 uIYt3pmOskHivRvh5Gve+jdXbUKtGR1xXB7SYiT1E15NzPAwyYQ+xQs8oY5vtosmlIw5
 uTpcpTqiLVmi4GRskWYxd3f8zDmtqMyzF4cj0fAiMFUHOuaYvKDgA/U6hIIdjCt9bxuY
 Hn4ICUeZgMTP4wZcpvCsJ/ckb7fqBYDvzlTGX9pW+i1D0D1VxUDSYXW8GDfdW1xNC7Vo
 emYH/8tvmp3Cwa52nIi7xnRPfWAQzHEHPUxbGfzwCw2NYEvKURwFIlVE0jxSKDj94H6w
 QoZg==
X-Gm-Message-State: AOAM533JvItT43QwloawDFl7ep+JRiMEGWGIF1KNvsl7Vk6bOgQaiHYm
 Sxd5fzB37NCQHz36f4u6fbwa1vuu+eJFHCPhJYvIdQ==
X-Google-Smtp-Source: ABdhPJwOXRN/8lU2AYgTrJejBXDpm4hFI6pejaLy27VCQ/luFqzDGRy/0PN4sedVg8qGNEQznzbU3QCdxNwh1mp0znQ=
X-Received: by 2002:a05:6512:10c4:: with SMTP id
 k4mr4875603lfg.373.1639044369640; 
 Thu, 09 Dec 2021 02:06:09 -0800 (PST)
MIME-Version: 1.0
References: <20211206174201.2297265-1-robh@kernel.org>
In-Reply-To: <20211206174201.2297265-1-robh@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 9 Dec 2021 11:05:33 +0100
Message-ID: <CAPDyKFpd=bdMOCe2cScdLjhr97bZ+VLFr7yn8j48d4KCcHaqtw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: Add missing properties used in examples
To: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <Kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 NXP Linux Team <linux-imx@nxp.com>, Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org, 
 Thierry Reding <thierry.reding@gmail.com>, linux-mmc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_020612_665598_B3D9FAA0 
X-CRM114-Status: GOOD (  22.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 6 Dec 2021 at 18:42, Rob Herring <robh@kernel.org> wrote:
>
> When 'unevaluatedProperties' support is enabled, the following warnings
> are generated in the mmc bindings:
>
> Documentation/devicetree/bindings/mmc/mtk-sd.example.dt.yaml: mmc@11230000: Unevaluated properties are not allowed ('reg', 'interrupts' were unexpected)
> Documentation/devicetree/bindings/mmc/sdhci-am654.example.dt.yaml: mmc@4f80000: Unevaluated properties are not allowed ('sdhci-caps-mask' was unexpected)
> Documentation/devicetree/bindings/mmc/socionext,uniphier-sd.example.dt.yaml: mmc@5a400000: Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
> Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@80126000: Unevaluated properties are not allowed ('dmas', 'dma-names' were unexpected)
> Documentation/devicetree/bindings/mmc/arasan,sdhci.example.dt.yaml: mmc@80420000: Unevaluated properties are not allowed ('resets' was unexpected)
> Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@52007000: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
> Documentation/devicetree/bindings/clock/imx8qxp-lpcg.example.dt.yaml: mmc@5b010000: Unevaluated properties are not allowed ('power-domains' was unexpected)
>
> Add the missing properties as necessary. For pl18x, drop interrupt-names
> as there isn't any use of it when there are 2 interrupts.
>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Chaotian Jing <chaotian.jing@mediatek.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Adrian Hunter <adrian.hunter@intel.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Wenbin Mei <wenbin.mei@mediatek.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml  | 3 +++
>  Documentation/devicetree/bindings/mmc/arm,pl18x.yaml     | 9 ++++++++-
>  Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml | 3 +++
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml        | 6 ++++++
>  Documentation/devicetree/bindings/mmc/sdhci-am654.yaml   | 2 ++
>  .../devicetree/bindings/mmc/socionext,uniphier-sd.yaml   | 6 ++++++
>  6 files changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml b/Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml
> index de6f076e0ece..83be9e93d221 100644
> --- a/Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml
> @@ -118,6 +118,9 @@ properties:
>    phy-names:
>      const: phy_arasan
>
> +  resets:
> +    maxItems: 1
> +
>    arasan,soc-ctl-syscon:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> diff --git a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> index 47595cb483be..fbc866d9bb2f 100644
> --- a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> +++ b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> @@ -60,6 +60,14 @@ properties:
>      minItems: 1
>      maxItems: 2
>
> +  dmas:
> +    maxItems: 2
> +
> +  dma-names:
> +    items:
> +      - const: rx
> +      - const: tx
> +
>    power-domains: true
>
>    resets:
> @@ -213,7 +221,6 @@ examples:
>        arm,primecell-periphid = <0x10153180>;
>        reg = <0x52007000 0x1000>;
>        interrupts = <49>;
> -      interrupt-names = "cmd_irq";
>        clocks = <&rcc 0>;
>        clock-names = "apb_pclk";
>        resets = <&rcc 1>;
> diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> index 19621a2f8beb..8d5cef0d3039 100644
> --- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> @@ -116,6 +116,9 @@ properties:
>        - const: ahb
>        - const: per
>
> +  power-domains:
> +    maxItems: 1
> +
>    pinctrl-names:
>      oneOf:
>        - minItems: 3
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index 82768a807294..faf89b0c918f 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -36,6 +36,9 @@ properties:
>            - const: mediatek,mt8195-mmc
>            - const: mediatek,mt8183-mmc
>
> +  reg:
> +    maxItems: 1
> +
>    clocks:
>      description:
>        Should contain phandle for the clock feeding the MMC controller.
> @@ -62,6 +65,9 @@ properties:
>        - const: axi_cg
>        - const: ahb_cg
>
> +  interrupts:
> +    maxItems: 1
> +
>    pinctrl-names:
>      items:
>        - const: default
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml b/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml
> index 224303f5b913..9fbf16b3bc8d 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml
> @@ -48,6 +48,8 @@ properties:
>        - const: clk_ahb
>        - const: clk_xin
>
> +  sdhci-caps-mask: true
> +
>    # PHY output tap delays:
>    # Used to delay the data valid window and align it to the sampling clock.
>    # Binding needs to be provided for each supported speed mode otherwise the
> diff --git a/Documentation/devicetree/bindings/mmc/socionext,uniphier-sd.yaml b/Documentation/devicetree/bindings/mmc/socionext,uniphier-sd.yaml
> index 56f9ff12742d..a586fad0a46b 100644
> --- a/Documentation/devicetree/bindings/mmc/socionext,uniphier-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/socionext,uniphier-sd.yaml
> @@ -26,6 +26,12 @@ properties:
>    clocks:
>      maxItems: 1
>
> +  dmas:
> +    maxItems: 1
> +
> +  dma-names:
> +    const: rx-tx
> +
>    reset-names:
>      description: |
>        There are three reset signals at maximum
> --
> 2.32.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
