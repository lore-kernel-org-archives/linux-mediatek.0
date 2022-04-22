Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227F3C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 15:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5zfPa7p6DIVEKw64QEvL194/vOhJFMP5ftu99WnZndY=; b=qrTSQY8H91eNev
	OkFED2hyfDovia9ExDt0uDU1hoGAuktsLmmuheqGuIE1PCVYJZOHpol2Ckh0/AFCRPjhsybkPmbX7
	kQkB9PmOGaFk/p6QPGwuemHkqXHnAlaIpBGwqSnZRvkRo1A7TYVP0a00XEcOlTtF8pGlvAsFKmg6u
	ibmvUTVwmLwsW7Ra5amySadEawBuHZI/WNGuyDQZQOvr6CCuuDd2M3uYNEv+xTuXQKfBoa9lRnsXZ
	FRlu0j7G4Rln4mX1iJCeUwWgjaGBC7tSMun5tN1vblEOYiuZy9mqOkhpHsUFmjwGgUzjf7+cKOG1q
	AKUfaMSFod+vJoS9dpvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhvVy-001D7Q-JP; Fri, 22 Apr 2022 15:48:10 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhvSM-001BdG-Qs
 for linux-mediatek@lists.infradead.org; Fri, 22 Apr 2022 15:44:28 +0000
Received: by mail-ej1-x629.google.com with SMTP id g13so17195376ejb.4
 for <linux-mediatek@lists.infradead.org>; Fri, 22 Apr 2022 08:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JemFIsNtCjKL4LPEQBY/hGFmz6ljVMLTFme29Py2nSY=;
 b=kE/4yTd0BeJARbm77TZxpuVTgL9v+x0jEMOVZU0iv8mB4Q/g9GO6hh5+am0qj/rd/t
 u+A52haGAJ/7nt9iC+R4z2XOc/1dpqW3HlNeU65zPR8tscx47q6/cYR3Z/1HkOljee9v
 DCSYOZ88FcIQlkkqV84NK7eQuH9+MiiPF9mlTLCHzkOe5LU8efKWDR9PmW71uAyKYS5R
 EZLNGpjRSttXrn5kv6lyCkk/2jGGYWvN5oqmjFSnZv3JRmbnx692DdN2oUN7TWo2g/Op
 IaUxLeYJ3/Yx1wZ104lFif6x6UO2fQ9tXUQ3C6xP3XuBabvHOw+S7xI3FQ4SWLmPnrdP
 oYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JemFIsNtCjKL4LPEQBY/hGFmz6ljVMLTFme29Py2nSY=;
 b=1LSyE+d3TBbkOFc5tXVe1J68WHdhrjuKoNjLv9Trzz1RPy2MJTFiY46W4Qc2ZK6s8J
 2tVADFvWgkHn5SpwjmTmNSIhdO7SYk5szcu52bM7CG3jeFdkTM7p18cpzEYdsPHUkE2x
 9RqeoCZxjv8toqFTYrtyQH47cAWUp3dXM1uFKa6Lf7LynfDEd2JXaBlcfKp7MgxrPYKJ
 O83Fthy5kEjbSQpfxeNJewXzFXkUl+kdTjzMXeSBupo/1IfJDN2GGuJuKL5rJRf30pPI
 wY2R9Ormuyd6DhdAO+XUpMHCl7aaQgg8DcGmiMjawp2MHNQckqTjAsAMOm2SurxrYLIt
 rKog==
X-Gm-Message-State: AOAM532jd4c2N0DB/pU0GVmLChWiOBgwsaDbb+aSf6ET1/3zBDInz20U
 uaSeZuQo4R1ysxDpCstM7ltEtA==
X-Google-Smtp-Source: ABdhPJxuA+3Y8AE3ukYq9N7qqdw5yx7eXG2giExj/lpkeyAWZqsokfAbfxqRUhRzv4xOHYacE1Cwuw==
X-Received: by 2002:a17:907:3f9e:b0:6f2:b3d8:63c0 with SMTP id
 hr30-20020a1709073f9e00b006f2b3d863c0mr2938068ejc.86.1650642263097; 
 Fri, 22 Apr 2022 08:44:23 -0700 (PDT)
Received: from [192.168.0.232] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 s2-20020a1709066c8200b006e4e1b1f875sm866663ejr.199.2022.04.22.08.44.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 08:44:22 -0700 (PDT)
Message-ID: <e2e4ead0-d8eb-1302-93e9-f330807d811e@linaro.org>
Date: Fri, 22 Apr 2022 17:44:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] dt-bindings: watchdog: mediatek: Convert binding to
 YAML
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 nfraprado@collabora.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, Chen-Yu Tsai <wenst@chromium.org>,
 Ryder Lee <ryder.lee@kernel.org>
References: <20220422121017.23920-1-allen-kh.cheng@mediatek.com>
 <20220422121017.23920-3-allen-kh.cheng@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422121017.23920-3-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_084427_014333_3EDCAF5B 
X-CRM114-Status: GOOD (  20.73  )
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

On 22/04/2022 14:10, Allen-KH Cheng wrote:
> Convert Mediatek watchdog devicetree binding to YAML.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  .../devicetree/bindings/watchdog/mtk-wdt.txt  | 42 ----------
>  .../devicetree/bindings/watchdog/mtk-wdt.yaml | 76 +++++++++++++++++++
>  2 files changed, 76 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/mtk-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> deleted file mode 100644
> index 762c62e428ef..000000000000
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -Mediatek SoCs Watchdog timer
> -
> -The watchdog supports a pre-timeout interrupt that fires timeout-sec/2
> -before the expiry.
> -
> -Required properties:
> -
> -- compatible should contain:
> -	"mediatek,mt2701-wdt", "mediatek,mt6589-wdt": for MT2701
> -	"mediatek,mt2712-wdt": for MT2712
> -	"mediatek,mt6582-wdt", "mediatek,mt6589-wdt": for MT6582
> -	"mediatek,mt6589-wdt": for MT6589
> -	"mediatek,mt6797-wdt", "mediatek,mt6589-wdt": for MT6797
> -	"mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
> -	"mediatek,mt7623-wdt", "mediatek,mt6589-wdt": for MT7623
> -	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
> -	"mediatek,mt7986-wdt", "mediatek,mt6589-wdt": for MT7986
> -	"mediatek,mt8183-wdt": for MT8183
> -	"mediatek,mt8186-wdt", "mediatek,mt6589-wdt": for MT8186
> -	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
> -	"mediatek,mt8192-wdt": for MT8192
> -	"mediatek,mt8195-wdt", "mediatek,mt6589-wdt": for MT8195
> -
> -- reg : Specifies base physical address and size of the registers.
> -
> -Optional properties:
> -- mediatek,disable-extrst: disable send output reset signal
> -- interrupts: Watchdog pre-timeout (bark) interrupt.
> -- timeout-sec: contains the watchdog timeout in seconds.
> -- #reset-cells: Should be 1.
> -
> -Example:
> -
> -watchdog: watchdog@10007000 {
> -	compatible = "mediatek,mt8183-wdt",
> -		     "mediatek,mt6589-wdt";
> -	mediatek,disable-extrst;
> -	reg = <0 0x10007000 0 0x100>;
> -	interrupts = <GIC_SPI 139 IRQ_TYPE_NONE>;
> -	timeout-sec = <10>;
> -	#reset-cells = <1>;
> -};
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mtk-wdt.yaml
> new file mode 100644
> index 000000000000..5788617027c8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/mtk-wdt.yaml#

File name: mtk,wdt.yaml

I assume all future MediaTek watchdogs (even these unpublished and
developed in some years) will fit into this schema. :) If not, then
maybe better to name the file by the compatible... but it's not a must.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek SoCs Watchdog timer
> +
> +maintainers:
> +  - Runyang Chen <runyang.chen@mediatek.com>
> +  - Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> +
> +description: |+
> +  The watchdog supports a pre-timeout interrupt that fires timeout-sec/2
> +  before the expiry.
> +
> +allOf:
> +  - $ref: "watchdog.yaml#"
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: mediatek,mt2712-wdt
> +      - const: mediatek,mt6589-wdt
> +      - const: mediatek,mt8183-wdt
> +      - const: mediatek,mt8192-wdt

All these four entries should be an enum.

> +
> +      - items:
> +          - enum:
> +              - mediatek,mt2701-wdt
> +              - mediatek,mt6582-wdt
> +              - mediatek,mt6797-wdt
> +              - mediatek,mt7622-wdt
> +              - mediatek,mt7623-wdt
> +              - mediatek,mt7629-wdt
> +              - mediatek,mt7986-wdt
> +              - mediatek,mt8173-wdt
> +              - mediatek,mt8183-wdt
> +              - mediatek,mt8186-wdt
> +              - mediatek,mt8192-wdt
> +              - mediatek,mt8195-wdt
> +              - mediatek,mt8516-wdt
> +          - const: mediatek,mt6589-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  timeout-sec: true

You do not need this, it's coming from watchdog schema.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    watchdog@10007000 {
> +        compatible = "mediatek,mt8183-wdt",
> +                     "mediatek,mt6589-wdt";
> +        mediatek,disable-extrst;

Did you test your bindings? Does not look like. Please run
dt_binding_check (see writing-schema for instructions).

> +        reg = <0x10007000 0x100>;
> +        interrupts = <GIC_SPI 139 IRQ_TYPE_NONE>;

Wrong interrupt flag.

> +        timeout-sec = <10>;
> +        #reset-cells = <1>;
> +    };
> +
> +...


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
