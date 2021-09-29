Return-Path: <SRS0=h0C2=OT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02062C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 21:48:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE7CD613CE
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 21:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE7CD613CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BVKNpy0SFrnw5StNGoTBrchRD8vjUhQnzY60KIdAAGY=; b=g7Qa7pXXaZC+b2
	6leq3eJlPkKQ8iLc2Vz0BCHDJe6SfytsALpqiNyUC1dyxs+LdUTqXZP7NCe9yGTiQ+OgsXLtN/W1Y
	OtDd2kwR7rB1i0vxMsyLm34oSGP/hGbFoWdpOhhLsvI15fUn5ET6m0em3AYX1ByAru5S0IvqW6j8o
	18nXKlEddrMqXxv+ZcnOxFSmEz8wPtA2korqQzZ3fyQR1xmWBJa0ZwdMerCB2n5VRzVqE3jxT758s
	x+U/B4gz6tymTkLHBFxcUh7iHOPOIaQ76qOoxX4pnTCUk/0cix1JTBl2cTyc9SOV9U7J4HyIAhFsV
	Qri9vq19HCWm+Ec+rZsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVhQz-00CQDz-Cw; Wed, 29 Sep 2021 21:48:13 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVhQl-00CQBs-L5; Wed, 29 Sep 2021 21:48:01 +0000
Received: by mail-ot1-f47.google.com with SMTP id
 97-20020a9d006a000000b00545420bff9eso4701450ota.8; 
 Wed, 29 Sep 2021 14:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9tEAqZNJwDzQEWaGPnZz7mESP4HPQ040E5Y0zkN5TmQ=;
 b=UY7wIgHiEErSrh/FCkGgMyrMm+yi6BhJMu6ywscUvHUnZI1ECHIrkXRQB+QC6oNxJn
 DhBtZfxi83cSzA+IY6bNRxWPWqNfO5bz1YYVM0vu8UMh46maN12QUPbDCA949dobpOrT
 NpG4KcdMQ2bUGV/3GeUU/zMCG80yRdA8eO09tzxbSat9LCNd/VZZnIwjVlRtoDbiuCCx
 8MwVxTtSpT4tQstUsHw+SM9ZvPsPrWKby6NzsGnft2GpjXkDyQanA4ctgz8tgDhLrntn
 MbUpV/ieiuG4pBnXVFGov2wJQDy2FtCgRDJfTa8LYg8plI1nAO+1qJSqyxX9g56Xjgqi
 Tbmg==
X-Gm-Message-State: AOAM5303SfbHpWnBnPf1aTdP1cySmS70O+MVhTimwU4tMDj0HVFrwlwT
 p2cRI06SiYWOg2CE4hWWYg==
X-Google-Smtp-Source: ABdhPJxeKotXQp3Lpf7KBsmo9mOFXTJ0Tf1HvSzbQ8YtUeLGQhbRfEeVPMok4PZOWUk9Jz6nlAyUiQ==
X-Received: by 2002:a9d:192c:: with SMTP id j44mr1972042ota.302.1632952078623; 
 Wed, 29 Sep 2021 14:47:58 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id a3sm191359oie.3.2021.09.29.14.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 14:47:57 -0700 (PDT)
Received: (nullmailer pid 273777 invoked by uid 1000);
 Wed, 29 Sep 2021 21:47:56 -0000
Date: Wed, 29 Sep 2021 16:47:56 -0500
From: Rob Herring <robh@kernel.org>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: linus.walleij@linaro.org, mark.rutland@arm.com, matthias.bgg@gmail.com,
 sean.wang@kernel.org, srv_heupstream@mediatek.com, hui.liu@mediatek.com,
 light.hsieh@mediatek.com, biao.huang@mediatek.com, hongzhou.yang@mediatek.com,
 sean.wang@mediatek.com, seiya.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v14 2/5] dt-bindings: pinctrl: mt8195: change pull
 up/down description
Message-ID: <YVTfDJNW5Pe3iAR/@robh.at.kernel.org>
References: <20210924080632.28410-1-zhiyong.tao@mediatek.com>
 <20210924080632.28410-3-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210924080632.28410-3-zhiyong.tao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_144759_725670_6B77E7DB 
X-CRM114-Status: GOOD (  20.21  )
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

On Fri, Sep 24, 2021 at 04:06:29PM +0800, Zhiyong Tao wrote:
> For supporting SI units in "bias-pull-down" & "bias-pull-up",
> change pull up/down description
> and add "mediatek,rsel_resistance_in_si_unit" description.
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 86 ++++++++++++++++++-
>  1 file changed, 84 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> index 2f12ec59eee5..5f642bef72af 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> @@ -49,6 +49,12 @@ properties:
>      description: The interrupt outputs to sysirq.
>      maxItems: 1
>  
> +  mediatek,rsel_resistance_in_si_unit:

s/_/-/

> +    type: boolean
> +    description: |
> +      Identifying i2c pins pull up/down type which is RSEL. It can support
> +      RSEL define or si unit value(ohm) to set different resistance.

Aren't the RSEL and ohms disjoint values? 0-207 for RSEL and >1000 for 
ohms. Why is this property even needed.

> +
>  #PIN CONFIGURATION NODES
>  patternProperties:
>    '-pins$':
> @@ -85,9 +91,85 @@ patternProperties:
>            2/4/6/8/10/12/14/16mA in mt8195.
>          enum: [0, 1, 2, 3, 4, 5, 6, 7]
>  
> -      bias-pull-down: true
> +      bias-pull-down:
> +        description: |
> +          For pull down type is normal, it don't need add RSEL & R1R0 define
> +          and resistance value.
> +          For pull down type is PUPD/R0/R1 type, it can add R1R0 define to
> +          set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
> +          "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" & "MTK_PUPD_SET_R1R0_11"
> +          define in mt8195.
> +          For pull down type is RSEL, it can add RSEL define & resistance value(ohm)
> +          to set different resistance by identifying property "mediatek,rsel_resistance_in_si_unit".
> +          It can support "MTK_PULL_SET_RSEL_000" & "MTK_PULL_SET_RSEL_001"
> +          & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" & "MTK_PULL_SET_RSEL_100"
> +          & "MTK_PULL_SET_RSEL_101" & "MTK_PULL_SET_RSEL_110" & "MTK_PULL_SET_RSEL_111"
> +          define in mt8195. It can also support resistance value(ohm) "75000" & "5000" in mt8195.
> +          oneOf:

Because of the indentation, this is all just part of 'description'.

> +            - enum: [100, 101, 102, 103]
> +            - description: mt8195 pull down PUPD/R0/R1 type define value.

This entry is always true.

> +            - enum: [200, 201, 202, 203, 204, 205, 206, 207]

Are these supposed to be hex?

> +            - description: mt8195 pull down RSEL type define value.

And so is this one. That makes 'oneOf' always false.

> +            - enum: [75000, 5000]
> +            - description: mt8195 pull down RSEL type si unit value(ohm).
> +
> +          An example of using RSEL define:
> +          pincontroller {
> +            i2c0_pin {
> +              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> +              bias-pull-down = <MTK_PULL_SET_RSEL_001>;
> +            };
> +          };
> +          An example of using si unit resistance value(ohm):
> +          &pio {
> +            mediatek,rsel_resistance_in_si_unit;
> +          }
> +          pincontroller {
> +            i2c0_pin {
> +              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> +              bias-pull-down = <75000>;
> +            };
> +          };
>  
> -      bias-pull-up: true
> +      bias-pull-up:
> +        description: |
> +          For pull up type is normal, it don't need add RSEL & R1R0 define
> +          and resistance value.
> +          For pull up type is PUPD/R0/R1 type, it can add R1R0 define to
> +          set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
> +          "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" & "MTK_PUPD_SET_R1R0_11"
> +          define in mt8195.
> +          For pull up type is RSEL, it can add RSEL define & resistance value(ohm)
> +          to set different resistance by identifying property "mediatek,rsel_resistance_in_si_unit".
> +          It can support "MTK_PULL_SET_RSEL_000" & "MTK_PULL_SET_RSEL_001"
> +          & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" & "MTK_PULL_SET_RSEL_100"
> +          & "MTK_PULL_SET_RSEL_101" & "MTK_PULL_SET_RSEL_110" & "MTK_PULL_SET_RSEL_111"
> +          define in mt8195. It can also support resistance value(ohm)
> +          "1000" & "1500" & "2000" & "3000" & "4000" & "5000" & "10000" & "75000" in mt8195.
> +          oneOf:
> +            - enum: [100, 101, 102, 103]
> +            - description: mt8195 pull up PUPD/R0/R1 type define value.
> +            - enum: [200, 201, 202, 203, 204, 205, 206, 207]
> +            - description: mt8195 pull up RSEL type define value.
> +            - enum: [1000, 1500, 2000, 3000, 4000, 5000, 10000, 75000]
> +            - description: mt8195 pull up RSEL type si unit value(ohm).

Same issues here.

> +          An example of using RSEL define:
> +          pincontroller {
> +            i2c0_pin {
> +              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> +              bias-pull-up = <MTK_PULL_SET_RSEL_001>;
> +            };
> +          };
> +          An example of using si unit resistance value(ohm):
> +          &pio {
> +            mediatek,rsel_resistance_in_si_unit;
> +          }
> +          pincontroller {
> +            i2c0_pin {
> +              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> +              bias-pull-up = <1000>;
> +            };
> +          };
>  
>        bias-disable: true
>  
> -- 
> 2.25.1
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
