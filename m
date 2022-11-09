Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137C5C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 22:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UB7db5XhVLteVue/y4fRr6KOu5yTU0vk8xjG6P+z0hw=; b=kmt2xIZDoqoF1rzQg5+9Zo7C3L
	KX2PDu1+n3iJSO50z76nIDO7/cL0Vf4LudhkvvBbaD1M1wllACdpaN64ZXZUXCOwNaj1AlVdLv/aQ
	ROmk0vuIejg+bdJmHb54nFPBSyMkJONZgv1hbfk0QudNDUc3n/+k9eGbYVBcbOfdutQUOcO+iUcwi
	CINU93vCH1Jx0VXRuGA7gXMe2/FOJRfOjHkQb7ZEXP4UEaRFW3abd/EKydnujKZuE2UZW973etSXH
	LfOaXVg5Kko/Itq4jFA4sY5gW7cDOQwm0q0T35zLiD54tpFc7VABIeJys7KfTQr94Jvxt4E7EomUE
	liVyun+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ostaC-000FTC-Od; Wed, 09 Nov 2022 22:30:08 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ostZN-000F06-8U; Wed, 09 Nov 2022 22:29:18 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-13b23e29e36so365083fac.8;
        Wed, 09 Nov 2022 14:29:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UB7db5XhVLteVue/y4fRr6KOu5yTU0vk8xjG6P+z0hw=;
        b=r3WVrITYHfyfCL2RkrahBFDZUOb63ryMiz4kVuNzsmlMHRzAjllY8TDnKdhf7hAmBD
         YahzXJJNZZqbZiXVqksTUsdIObI2rUeqvnskszJuqIUbakgerXJMaFrcT02c6qB5AOHo
         pLOxG21yu6PSOQj0zEs5htAEONJUyrb/2m744lbn8VEMoS1GHZfNXqof5FQInO24UrNM
         EXIRZP9UrflnTooDl8DU03xfaxSxI9P8HqwjbQBv5HnEDL1hYQs+YKsuIdXrd5AiB2QT
         ZBE12c5JWBg5l5xyIRvIIUmg/GAs2mX9ZsZfyfrDnQ6a5+kCBlPkkct+Jc2Skto1Yfnp
         YhiQ==
X-Gm-Message-State: ACrzQf2RttgYrrtDa6ub4hWIN9jVclHWXd6GKVJhn7/+0doz3Nd8o4CT
	v02B4r9Ygdn5fx/LSpEBvQ==
X-Google-Smtp-Source: AMsMyM5XTaVj88TTJ/YSmUbz++qS30jO8NLEsM469GDD8snWToOwoGaV4ijLSqhIbURwc+n/mRCQ+g==
X-Received: by 2002:a05:6870:41cb:b0:131:9656:cc30 with SMTP id z11-20020a05687041cb00b001319656cc30mr47491998oac.51.1668032955859;
        Wed, 09 Nov 2022 14:29:15 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m26-20020a0568301e7a00b0066c2e241a4csm5811632otr.20.2022.11.09.14.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 14:29:15 -0800 (PST)
Received: (nullmailer pid 2988684 invoked by uid 1000);
	Wed, 09 Nov 2022 22:29:16 -0000
Date: Wed, 9 Nov 2022 16:29:16 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Fabien Parent <fabien.parent@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sean Wang <sean.wang@mediatek.com>, Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>, Chen Zhong <chen.zhong@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>, Pavel Machek <pavel@ucw.cz>, Liam Girdwood <lgirdwood@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fabien Parent <fparent@baylibre.com>, linux-rtc@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: Re: [PATCH v4 2/9] dt-bindings: rtc: mediatek: convert MT6397 rtc
 documentation
Message-ID: <20221109222916.GA2985917-robh@kernel.org>
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
 <20221005-mt6357-support-v4-2-5d2bb58e6087@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005-mt6357-support-v4-2-5d2bb58e6087@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_142917_349745_725B6D35 
X-CRM114-Status: GOOD (  21.86  )
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

On Tue, Nov 08, 2022 at 07:43:37PM +0100, Alexandre Mergnat wrote:
> - Convert rtc/rtc-mt6397.txt to rtc/mt6397-rtc.yaml
> - Add mediatek,mt6357-rtc compatible.
> - Add maintainer
> - Remove the .txt binding file
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt   |  2 +-
>  .../bindings/rtc/mediatek,mt6397-rtc.yaml          | 40 ++++++++++++++++++++++
>  .../devicetree/bindings/rtc/rtc-mt6397.txt         | 31 -----------------
>  3 files changed, 41 insertions(+), 32 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
> index 0088442efca1..79aaf21af8e9 100644
> --- a/Documentation/devicetree/bindings/mfd/mt6397.txt
> +++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
> @@ -33,7 +33,7 @@ Optional subnodes:
>  		- compatible: "mediatek,mt6331-rtc"
>  		- compatible: "mediatek,mt6358-rtc"
>  		- compatible: "mediatek,mt6397-rtc"
> -	For details, see ../rtc/rtc-mt6397.txt
> +	For details, see ../rtc/mediatek,mt6397-rtc.yaml
>  - regulators
>  	Required properties:
>  		- compatible: "mediatek,mt6323-regulator"
> diff --git a/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml b/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml
> new file mode 100644
> index 000000000000..bb48c0150f95
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml
> @@ -0,0 +1,40 @@
> + # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/mediatek,mt6397-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6397/MT6366/MT6358/MT6357/MT6323 RTC
> +
> +maintainers:
> +  - Alexandre Mergnat <amergnat@baylibre.com>
> +
> +description: |
> +  MediaTek PMIC based RTC is an independent function of MediaTek PMIC that works
> +  as a type of multi-function device (MFD). The RTC can be configured and set up
> +  with PMIC wrapper bus which is a common resource shared with the other
> +  functions found on the same PMIC.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt6323-rtc
> +      - mediatek,mt6357-rtc
> +      - mediatek,mt6358-rtc
> +      - mediatek,mt6366-rtc
> +      - mediatek,mt6397-rtc

As this is only a compatible string, just fold this into the MFD schema 
doc.

> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +
> +examples:
> +  - |
> +    pmic {
> +        compatible = "mediatek,mt6397";
> +
> +        rtc {
> +               compatible = "mediatek,mt6397-rtc";
> +        };
> +    };

