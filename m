Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01A1C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Oct 2022 02:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5CsfMItzKX6acLzl11vwpPmN1BA6KZvOi/g9HYGupc=; b=GtCcWXN4t8iJzOUZpLVyy3T97p
	67LRyvkTWiAMIRrE5jI5oNxp0y+b2fWlH41nnKYA9tBJUMmt9ZQzTTvmXJMH7xiksvEtgu5OSONMP
	C9SFxs7pC98schtP7AWzno3RRRl6q7MOfPq6B40OWXObYzUKaYARF478tIpnJO6D24bHcAtY6pL5L
	WJpuDKZoDAY53buM9vvj7OpfUOqdj2FqCAOzbsBjtJfgtC906S1c/lqj5lTR3mCh0vOUCPX8pR9ov
	Bm9JWprMnVc7zgkaYT9sY8x75gnL46UtzVhCjszu87TJh6L2vIxTR3hRyLRVWYs0oN9T1QviqQrLY
	iWCzo5SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okyjb-00DZSG-9j; Wed, 19 Oct 2022 02:23:07 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okyjK-00DZO0-1k
	for linux-mediatek@lists.infradead.org; Wed, 19 Oct 2022 02:22:57 +0000
Received: by mail-qk1-x731.google.com with SMTP id a5so9913117qkl.6
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Oct 2022 19:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f5CsfMItzKX6acLzl11vwpPmN1BA6KZvOi/g9HYGupc=;
        b=kMc5LprrewGysF1s2VpBZcvnjphOAwA7+kybpYRcFEWYm54blGw1G8STnbfC55Crzl
         2yK2ON7K6AqR9Kja/8wxEk3Xxs8fgGI3GhkM4Et0CfIfa31enUuAbDJ2PgVPlnaktL3U
         JcZsNbCEsOXV89/UUcgrWr3r4uXkc0WvJQsew7pK56f+BMne9GiuyceamCdqcKtYZp2h
         LXh785ZBLib+vrqBd2RXE/rtlbLf/39YYCb3JuLpRm2+WPkhIhFcgyQr3mrnVIQhJnFX
         N6XFOf+0ssJUsjL1Ad7bBxWz6SeRO+b//8JzhXEEC1pwo6twYG56eBY5GvpLsnQQf8K+
         1lqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f5CsfMItzKX6acLzl11vwpPmN1BA6KZvOi/g9HYGupc=;
        b=t3b/JqEnG+7YnCf3i6Ywlj23IFIYZLKwDYBBVKRI7jAPCpO2iKRH1G8uJKyS3P+f3V
         xAghyZcQYn0i/TUH9VqF/iOICAMj3bVsYAuk1YrVkKjKLHN8gH/bL2DNyg0AqKqnzxzW
         8lzKeWBOJiS2V9OB8XN0PfAo4UKvACaLBReNPPflOb4OIJZrUhiZNbfw+TT5+pwUxj5E
         KUkHpLROlhrQFcz5+VX6uoUgJANFJMK+Bi+rV4E08LcGTlaSykScdvz6Xw8QlYWFSZZ7
         GIFPfFMj3zOFK2hLxqtsWvvtdqZLUas3+BeaHxJ95wmlYdE6L0O/DtYxSbbQe0jlbBgg
         EElw==
X-Gm-Message-State: ACrzQf0AFosPpn1AIqKlWEt0CJbs2XpxvRKzZTwMLhvtcfQOgPyCgeo0
	+r/CsWUZen78ROSg64lnptwZXA==
X-Google-Smtp-Source: AMsMyM6uVdKLG4NIIPMBI98DpCK7zNjCjvx2I/NLmYcUwGs9TcIY9oeuihKO/MG7smwrBx0tumL4jQ==
X-Received: by 2002:a05:620a:17a9:b0:6ee:d5b6:e35c with SMTP id ay41-20020a05620a17a900b006eed5b6e35cmr3929738qkb.728.1666146166621;
        Tue, 18 Oct 2022 19:22:46 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id b14-20020ac844ce000000b003434d3b5938sm3082694qto.2.2022.10.18.19.22.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 19:22:45 -0700 (PDT)
Message-ID: <7e05ad85-9887-75b6-f96d-c3ef02d9b717@linaro.org>
Date: Tue, 18 Oct 2022 22:22:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v6, 1/8] dt-bindings: media: mediatek: vcodec: Adds
 encoder cores dt-bindings for mt8195
Content-Language: en-US
To: Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 angelogioacchino.delregno@collabora.com, nicolas.dufresne@collabora.com,
 Tiffany Lin <tiffany.lin@mediatek.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20221001031737.18266-1-irui.wang@mediatek.com>
 <20221001031737.18266-2-irui.wang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221001031737.18266-2-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_192254_953806_40D120EE 
X-CRM114-Status: GOOD (  29.98  )
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

On 30/09/2022 23:17, Irui Wang wrote:
> mt8195 has two H264 encoder hardware, which are named core0 and core1.
> The two encoder cores are independent, we can just enable one core to
> do encoding or enable both of them to achieve higher performance. We
> pick core0 as main device and core1 as its subdevice, it just a way to
> to manage the two encoder hardware, because they are two equal encoder
> hardware with the same function.
> 

You have redundant dt-bindings (second one) in the subject. Drop it.

> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  .../media/mediatek,vcodec-encoder-core.yaml   | 217 ++++++++++++++++++
>  .../media/mediatek,vcodec-encoder.yaml        |   1 -
>  2 files changed, 217 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-core.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-core.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-core.yaml
> new file mode 100644
> index 000000000000..1dda7d7908da
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-core.yaml
> @@ -0,0 +1,217 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/media/mediatek,vcodec-encoder-core.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MediaTek Video Encoder Accelerator With Multi Core
> +
> +maintainers:
> +  - Irui Wang <irui.wang@mediatek.com>
> +
> +description: |
> +  MediaTek Video Encoder is the video encoder hardware present in MediaTek
> +  SoCs which supports high resolution encoding functionalities. To meet higher
> +  encoder performance, there will be one or more encoder hardware inside SoC,
> +  which named core0, core1, etc.. For example, mt8195 has two encoder hardware,
> +  the two encoder cores block diagram, can check below.
> +  --------------------------------------------------------------
> +  Input frame  0     1     2     3     4     5     6
> +               |     |     |     |     |     |     |
> +               v     |     v     |     v     |     v
> +           +-------+ | +-------+ | +-------+ | +-------+
> +           | core0 | | | core0 | | | core0 | | | core0 |
> +           +-------+ | +-------+ | +-------+ | +-------+
> +               |     |     |     |     |     |     |
> +               |     v     |     v     |     v     |
> +               | +-------+ | +-------+ | +-------+ |
> +               | | core1 | | | core1 | | | core1 | |
> +               | +-------+ | +-------+ | +-------+ |
> +               |     |     |     |     |     |     |
> +               v     v     v     v     v     v     v    <parent>
> +  --------------------------------------------------------------
> +                            core || index               <child>
> +                                 \/
> +       +--------------------------------------------------+
> +       |                     core0/core1                  |
> +       |             enable/disable power/clk/irq         |
> +       +--------------------------------------------------+
> +  --------------------------------------------------------------
> +  As above, there are two cores child devices, they are two encoder hardware
> +  which can encode input frames in order. When start encoding, input frame 0
> +  will be encoded by core0, and input frame 1 can be encoded by core1 even if
> +  frame 0 has not been encoded done yet, after frame 0 encoded done, frame 2
> +  will be encoded by core0, even input frames are encoded by core0 and odd
> +  input frames are encoded by core1, these two encoder cores encode ench input
> +  frames in this overlapping manner.
> +
> +properties:
> +  compatible:
> +    items:

Drop items (you have only one item).

> +      - enum:
> +          - mediatek,mt8195-vcodec-enc
> +
> +  reg:
> +    maxItems: 1
> +
> +  mediatek,scp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      The node of system control processor (SCP), using
> +      the remoteproc & rpmsg framework.
> +
> +  iommus:
> +    minItems: 1
> +    maxItems: 32
> +    description: |
> +      List of the hardware port in respective IOMMU block for current Socs.
> +      Refer to bindings/iommu/mediatek,iommu.yaml.

Drop the path, is rather obvious (and actually not correct, because it
misses include).

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  dma-ranges:
> +    maxItems: 1
> +    description: |
> +      Describes the physical address space of IOMMU maps to memory.
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2
> +
> +  ranges: true
> +
> +# Required child node:
> +patternProperties:
> +  "^venc-core@[0-9a-f]+$":

Didn't we have a big discussion that these should be called differently?
Maybe the hardware is different... but maybe not.

https://lore.kernel.org/all/20220930112237.14411-2-allen-kh.cheng@mediatek.com/

> +    type: object
> +    description: |
> +      The video encoder core device node which should be added as subnodes to
> +      the main venc node, it represents a encoder hardware.
> +
> +    properties:
> +      compatible:
> +        const: mediatek,mtk-venc-hw
> +
> +      reg:
> +        maxItems: 1
> +
> +      mediatek,hw-id:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: |
> +          Current encoder core id. We use it to pick which one encoder core
> +          will be used to encoding current input frame.

Isn't this coming from unit address? Why do you need some ID?

> +
> +      iommus:
> +        minItems: 1
> +        maxItems: 32
> +        description: |
> +          List of the hardware port in respective IOMMU block for current Socs.
> +          Refer to bindings/iommu/mediatek,iommu.yaml.

Also drop last line.

> +
> +      interrupts:
> +        maxItems: 1
> +
> +      clocks:
> +        maxItems: 1
> +
> +      clock-names:
> +        maxItems: 1
> +
> +      power-domains:
> +        maxItems: 1
> +
> +    required:
> +      - compatible
> +      - reg
> +      - mediatek,hw-id
> +      - iommus
> +      - interrupts
> +      - clocks
> +      - clock-names
> +      - assigned-clocks
> +      - assigned-clock-parents
> +      - power-domains
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - mediatek,scp
> +  - iommus
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - dma-ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/memory/mt8195-memory-port.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/power/mt8195-power.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        venc: venc@1a020000 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +            compatible = "mediatek,mt8195-vcodec-enc";
> +            reg = <0 0x1a020000 0 0x10000>;
> +            mediatek,scp = <&scp>;
> +            iommus = <&iommu_vdo M4U_PORT_L19_VENC_RCPU>,
> +                     <&iommu_vdo M4U_PORT_L19_VENC_REC>,
> +                     <&iommu_vdo M4U_PORT_L19_VENC_BSDMA>,
> +                     <&iommu_vdo M4U_PORT_L19_VENC_SV_COMV>,
> +                     <&iommu_vdo M4U_PORT_L19_VENC_RD_COMV>,
> +                     <&iommu_vdo M4U_PORT_L19_VENC_CUR_LUMA>,
> +                     <&iommu_vdo M4U_PORT_L19_VENC_CUR_CHROMA>,
> +                     <&iommu_vdo M4U_PORT_L19_VENC_REF_LUMA>,
> +                     <&iommu_vdo M4U_PORT_L19_VENC_REF_CHROMA>;
> +            interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH 0>;
> +            clocks = <&vencsys CLK_VENC_VENC>;
> +            clock-names = "clk_venc";
> +            power-domains = <&spm MT8195_POWER_DOMAIN_VENC>;
> +            dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +            ranges;
> +
> +            venc-core@1b020000 {
> +                compatible = "mediatek,mtk-venc-hw";
> +                reg = <0 0x1b020000 0 0x10000>;
> +                mediatek,hw-id = <1>;
> +                iommus = <&iommu_vpp M4U_PORT_L20_VENC_RCPU>,
> +                         <&iommu_vpp M4U_PORT_L20_VENC_REC>,
> +                         <&iommu_vpp M4U_PORT_L20_VENC_BSDMA>,
> +                         <&iommu_vpp M4U_PORT_L20_VENC_SV_COMV>,
> +                         <&iommu_vpp M4U_PORT_L20_VENC_RD_COMV>,
> +                         <&iommu_vpp M4U_PORT_L20_VENC_CUR_LUMA>,
> +                         <&iommu_vpp M4U_PORT_L20_VENC_CUR_CHROMA>,
> +                         <&iommu_vpp M4U_PORT_L20_VENC_REF_LUMA>,
> +                         <&iommu_vpp M4U_PORT_L20_VENC_REF_CHROMA>;
> +                interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH 0>;
> +                clocks = <&vencsys_core1 CLK_VENC_CORE1_VENC>;
> +                clock-names = "clk_venc_core1";
> +                assigned-clocks = <&topckgen CLK_TOP_VENC>;
> +                assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D4>;
> +                power-domains = <&spm MT8195_POWER_DOMAIN_VENC_CORE1>;
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> index 32aee09aea33..f5f79efe3ba3 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> @@ -22,7 +22,6 @@ properties:
>        - mediatek,mt8183-vcodec-enc
>        - mediatek,mt8188-vcodec-enc
>        - mediatek,mt8192-vcodec-enc
> -      - mediatek,mt8195-vcodec-enc

Why? Commit msg did not explain this to me.

>  
>    reg:
>      maxItems: 1

Best regards,
Krzysztof


