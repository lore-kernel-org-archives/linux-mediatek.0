Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624C2C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 15:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jM4V3HsCT7rorlCWcJ+dqKKOi0VzU8rHkgsnq8OiKN8=; b=VNOaPEN0OCD+2IeAcgptclmhXz
	3aEvzOwcXXtRQ6wJ7f6C0FFw3iL36VfBbhPG9UA6T+DfGaQmNLyvymT22orD2yw4JkvErRngMsNvI
	b16kW+9mIS/kIrKyV9JahorXPw27LDs2INgSGfdo02Qe6QW2ZR98Y6y/L2tPEd+5H+Kg8oF0xNGSS
	itlP1uiYeRBlAHznx8mZVXLdPIdXFFqGVTnZm+xB5UkFwhKFXaVNbGPoUVpbCg1l1rUw2Vg/cKmlj
	NCLgeYeopg7rSqQqO1Ni+uXUyq78p5PLPaZGYcwXdl8rz3coWxuTTYfMBOVGk9fTq9tZFdNCalyJL
	c6n/jMNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0OtD-00HLhg-3o; Wed, 30 Nov 2022 15:20:47 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0OtA-00HLgC-DJ; Wed, 30 Nov 2022 15:20:45 +0000
Received: by mail-oi1-f174.google.com with SMTP id t62so19037122oib.12;
        Wed, 30 Nov 2022 07:20:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jM4V3HsCT7rorlCWcJ+dqKKOi0VzU8rHkgsnq8OiKN8=;
        b=VKlLv7g1fCjIH8RL6o1pe4+LBqOmRAjRwc3trsxVX+hcziFgtCyyqVoNdWlr1AG3e0
         1Mvh0mgvNJUQrO8slMrNxmZpg1w5ubwN4I1D3A0fH02ATBNLoc72vdz1BpqTjVEhBeXV
         lD3jQkHr+71wH1kcl5E35VEhBu2OBWYy1Ad2b3hd+2Wf2Wt3njtj+pPgrduDf5APnmbt
         hNnqVYE3WvN1wcIOs4GwygEqKAOHQWFMH/XOgEWR7oY2Kl6czo6Gi9obdErqTXfd4aML
         yBltnNOp25jget79L/nnDgH2SvADuoj5NZd20JrM3wtKtmOt3QM+hVF6zB3Wt9M+GgVX
         PkDA==
X-Gm-Message-State: ANoB5pmds511pRRU+vwzSEktNWX6K2HsyPlglQ6do30zqpTTvjZs1Fv0
	WfWotvrg3l51crTG41YibppUcoaU5Q==
X-Google-Smtp-Source: AA0mqf7ApQ5kvzIDzKBVe+cAtlPGoe5vVxWFF49PaZMb322Wqs6APaQzCb6e5snjskmEj/P1TDyBzA==
X-Received: by 2002:a05:6808:1592:b0:35a:e1a7:c3b2 with SMTP id t18-20020a056808159200b0035ae1a7c3b2mr19792205oiw.223.1669821643133;
        Wed, 30 Nov 2022 07:20:43 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t32-20020a05687063a000b00132784a3a1fsm1245231oap.46.2022.11.30.07.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 07:20:42 -0800 (PST)
Received: (nullmailer pid 2187928 invoked by uid 1000);
	Wed, 30 Nov 2022 15:20:41 -0000
Date: Wed, 30 Nov 2022 09:20:41 -0600
From: Rob Herring <robh@kernel.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, Andy Teng <andy.teng@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yassine Oudjana <y.oudjana@protonmail.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/7] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Pull pinctrl node changes from MT6795 document
Message-ID: <20221130152041.GA2183918-robh@kernel.org>
References: <20221118113028.145348-1-y.oudjana@protonmail.com>
 <20221118113028.145348-2-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118113028.145348-2-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_072044_478098_4CECA3E4 
X-CRM114-Status: GOOD (  22.79  )
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

On Fri, Nov 18, 2022 at 02:30:22PM +0300, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> mediatek,pinctrl-mt6795.yaml has different node name patterns which match
> bindings of other MediaTek pin controllers, ref for pinmux-node.yaml which
> has a description of the pinmux property, as well as some additional
> descriptions for some pin configuration properties. Pull those changes
> into mediatek,mt6779-pinctrl.yaml and adjust the example DTS to match in
> preparation to combine the MT6795 document into it.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 38 ++++++++++++++-----
>  1 file changed, 28 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> index a2141eb0854e..d6231d11e949 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> @@ -111,19 +111,21 @@ allOf:
>          - "#interrupt-cells"
>  
>  patternProperties:
> -  '-[0-9]*$':
> +  '-pins$':
>      type: object
>      additionalProperties: false
>  
>      patternProperties:
> -      '-pins*$':
> +      '^pins':
>          type: object
>          description: |
>            A pinctrl node should contain at least one subnodes representing the
>            pinctrl groups available on the machine. Each subnode will list the
>            pins it needs, and how they should be configured, with regard to muxer
>            configuration, pullups, drive strength, input enable/disable and input schmitt.
> -        $ref: "/schemas/pinctrl/pincfg-node.yaml"
> +        allOf:
> +          - $ref: pinmux-node.yaml
> +          - $ref: pincfg-node.yaml
>  
>          properties:
>            pinmux:
> @@ -134,9 +136,25 @@ patternProperties:
>  
>            bias-disable: true
>  
> -          bias-pull-up: true
> -
> -          bias-pull-down: true
> +          bias-pull-up:
> +            oneOf:
> +              - type: boolean
> +              - enum: [100, 101, 102, 103]
> +                description: Pull up PUPD/R0/R1 type define value.
> +            description: |
> +              For normal pull up type, it is not necessary to specify R1R0
> +              values; When pull up type is PUPD/R0/R1, adding R1R0 defines
> +              will set different resistance values.
> +
> +          bias-pull-down:
> +            oneOf:
> +              - type: boolean
> +              - enum: [100, 101, 102, 103]

'bias-pull-down' is defined to be in Ohms. This doesn't look like it's 
Ohms.

> +                description: Pull down PUPD/R0/R1 type define value.
> +            description: |
> +              For normal pull down type, it is not necessary to specify R1R0
> +              values; When pull down type is PUPD/R0/R1, adding R1R0 defines
> +              will set different resistance values.
>  
>            input-enable: true
>  
> @@ -218,8 +236,8 @@ examples:
>              #interrupt-cells = <2>;
>              interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
>  
> -            mmc0_pins_default: mmc0-0 {
> -                cmd-dat-pins {
> +            mmc0_pins_default: mmc0-pins {
> +                pins-cmd-dat {
>                      pinmux = <PINMUX_GPIO168__FUNC_MSDC0_DAT0>,
>                          <PINMUX_GPIO172__FUNC_MSDC0_DAT1>,
>                          <PINMUX_GPIO169__FUNC_MSDC0_DAT2>,
> @@ -232,11 +250,11 @@ examples:
>                      input-enable;
>                      mediatek,pull-up-adv = <1>;
>                  };
> -                clk-pins {
> +                pins-clk {
>                      pinmux = <PINMUX_GPIO176__FUNC_MSDC0_CLK>;
>                      mediatek,pull-down-adv = <2>;
>                  };
> -                rst-pins {
> +                pins-rst {
>                      pinmux = <PINMUX_GPIO178__FUNC_MSDC0_RSTB>;
>                      mediatek,pull-up-adv = <0>;
>                  };
> -- 
> 2.38.1
> 
> 

