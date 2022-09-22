Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20708C6FA8B
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 07:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ln6ZeHzfzIh7ZyAvFY4CPd7Whze3jXvv2P2xFSPlMGQ=; b=ezaylPQXw4V4HP1sRhP3VxYDDa
	Mcj/K86EtZwXcPKWEAYBhkcythjHPZK67SqPyo0WffuvPj+xNO79mIXP27V4Wie6n8AgoFUqSYI1l
	BwdwGVf4VVVYzj1RqQBj2NjsgNJxz8hA3R5D5CbE3WBrKYTXLdNsDy+PdJWTLr5/Nl6pWQwQ3udOk
	xdxLN59+oRPvdcH/JVnlLY3F4AUry47LKcq6d1sP2R3QsUM1fXghoNpSsx/WmES/5ITNe7JLoxirp
	arwwpIroVALhBDPVTccUErACNa9tdC2gLWzpcRr67Tbm19/Eatlratd9j7vbf+AyIRbb+tGyEDYQx
	omHME6Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGU3-00Dlr8-Cf; Thu, 22 Sep 2022 07:18:55 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGU0-00DloU-5B
	for linux-mediatek@lists.infradead.org; Thu, 22 Sep 2022 07:18:54 +0000
Received: by mail-lf1-x12a.google.com with SMTP id z25so13218895lfr.2
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Sep 2022 00:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ln6ZeHzfzIh7ZyAvFY4CPd7Whze3jXvv2P2xFSPlMGQ=;
        b=ErecUnfehksu48GfFXY1dB5cjHTxnXqpVDD2eczsRIHNXp0+fJGKID0aaV7oXQ+xM1
         7UzGFYZkEODN1QvfiSBIgr2dlG1gSVGBXkfNyZhTWIky0TloopA9PS41gknISZvJWgdo
         QOK/0CIOeWjFvLaLoww1LRicmQ3cwIddX6Gocz2h7pRmKyxD+qR0Q5uvuys1dFSs+hJk
         XfdKZr+7mkvgKE75usGv6nSPF1edW0PsXbToJ70O5MZXvT51FnFdZcXi9LzwtjvjJlgY
         C8aNoEY+6FTSxr0nEmsUcvgeMg0XhqVHnZF0/zZ3ESBQqElajl9A8qvfwjQvbTWOnYbF
         Hqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ln6ZeHzfzIh7ZyAvFY4CPd7Whze3jXvv2P2xFSPlMGQ=;
        b=Xzv6oPw80c2ZsHLIYsV7XPBhCM4Nd8IUOuoq7g+knDgQ72LyxyP34qj8n3yjrw//5s
         kqch2Ndu2ruGAIGKaeWx+Klaehu4RSGWxWShPZ91o9HTfGIGSxkYSHLnS4KeIBguGpET
         kuJRLvKBLqE2K+xEsBN21EmH9m7QxA7CHELgwxFha9Ut+7P/sqzzI0NYeL1YqlAWAmVc
         MNejNJu7EBJddqvFYhjWsii7ym4aHK8A36xA84RoanM/6sW2g7ZZ/g+We/KPkIx5H+AW
         qR8sCGRDlOUcUkdbzoTy37vfxNFVpaDZoKn5Nyd2t6DID+/LlaMjaepO7OF1sCxXSa8D
         Q9Gg==
X-Gm-Message-State: ACrzQf0Zxk4cJUU+AiVFhLy77X1DAtGKggI/gLmuIferiYyhaAdsfqFZ
	9qK3Dy3zW5AKisilLjs8P77JjQ==
X-Google-Smtp-Source: AMsMyM47YFDCy8AwIT5M8sGMUa+EUaCIIo1zk4WZ+rlWlbFfVtDdWjoBH6LrVg/wiXrtgWAh0UwMAA==
X-Received: by 2002:a05:6512:11e9:b0:49f:d530:9f25 with SMTP id p9-20020a05651211e900b0049fd5309f25mr749322lfs.533.1663831130309;
        Thu, 22 Sep 2022 00:18:50 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a7-20020a19f807000000b0048b256bb005sm804039lff.49.2022.09.22.00.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 00:18:49 -0700 (PDT)
Message-ID: <260bb17f-efc8-1287-3e03-f9b8e79a6e31@linaro.org>
Date: Thu, 22 Sep 2022 09:18:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 04/17] dt-bindings: display: mediatek: add MT8195 hdmi
 bindings
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mattijs Korpershoek
 <mkorpershoek@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-4-4844816c9808@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919-v1-4-4844816c9808@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_001852_296239_FE216CAD 
X-CRM114-Status: GOOD (  18.04  )
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

On 19/09/2022 18:56, Guillaume Ranquet wrote:
> Add mt8195 SoC bindings for hdmi and hdmi-ddc
> 
> Make port1 optional for mt8195 as it only supports HDMI tx for now.
> Requires a ddc-i2c-bus phandle.
> Requires a power-domains phandle.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
> index bdaf0b51e68c..abb231a0694b 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
> @@ -21,6 +21,10 @@ properties:
>        - mediatek,mt7623-hdmi
>        - mediatek,mt8167-hdmi
>        - mediatek,mt8173-hdmi
> +      - mediatek,mt8195-hdmi
> +
> +  clocks: true
> +  clock-names: true

????
Why is this moved?

>  
>    reg:
>      maxItems: 1
> @@ -28,20 +32,6 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> -  clocks:
> -    items:
> -      - description: Pixel Clock
> -      - description: HDMI PLL
> -      - description: Bit Clock
> -      - description: S/PDIF Clock
> -
> -  clock-names:
> -    items:
> -      - const: pixel
> -      - const: pll
> -      - const: bclk
> -      - const: spdif

Clock definition with constraints should stay here. You just customize
it per variant.

> -
>    phys:
>      maxItems: 1
>  
> @@ -58,6 +48,16 @@ properties:
>      description: |
>        phandle link and register offset to the system configuration registers.
>  
> +  ddc-i2c-bus:
> +    $ref: '/schemas/types.yaml#/definitions/phandle'

Drop quotes

> +    description: Phandle to the ddc-i2c device

Isn't this property of panel?

> +
> +  power-domains:
> +    description:
> +      A phandle and PM domain specifier as defined by bindings
> +      of the power controller specified by phandle. See
> +      Documentation/devicetree/bindings/power/power-domain.yaml for details.

No need for this text. This is standard property. You miss maxItems.


> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  
> @@ -76,7 +76,6 @@ properties:
>  
>      required:
>        - port@0
> -      - port@1
>  
>  required:
>    - compatible
> @@ -86,9 +85,55 @@ required:
>    - clock-names
>    - phys
>    - phy-names
> -  - mediatek,syscon-hdmi
>    - ports
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8195-hdmi
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: APB
> +            - description: HDCP
> +            - description: HDCP 24M
> +            - description: Split HDMI
> +        clock-names:
> +          items:
> +            - const: hdmi_apb_sel
> +            - const: hdcp_sel
> +            - const: hdcp24_sel
> +            - const: split_hdmi

Clocks are entirely different. I am not sure there is benefit in keeping
these devices in one bindings.

> +
> +      required:
> +        - power-domains
> +        - ddc-i2c-bus

Blank line,

> +    else:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Pixel Clock
> +            - description: HDMI PLL
> +            - description: Bit Clock
> +            - description: S/PDIF Clock
> +
> +        clock-names:
> +          items:
> +            - const: pixel
> +            - const: pll
> +            - const: bclk
> +            - const: spdif
> +
> +        ports:
> +          required:
> +            - port@1
> +
> +      required:
> +        - mediatek,syscon-hdmi
> +
>  additionalProperties: false
>  
>  examples:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
> new file mode 100644
> index 000000000000..3c80bcebe6d3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek HDMI DDC Device Tree Bindings for mt8195

Drop Device Tree Bindings

> +
> +maintainers:
> +  - CK Hu <ck.hu@mediatek.com>
> +  - Jitao shi <jitao.shi@mediatek.com>
> +
> +description: |
> +  The HDMI DDC i2c controller is used to interface with the HDMI DDC pins.

Why is this different than existing ddc bindings?

> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8195-hdmi-ddc
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: ddc-i2c
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    hdmiddc0: ddc_i2c {

No underscores in node names. Generic node names.


Best regards,
Krzysztof


