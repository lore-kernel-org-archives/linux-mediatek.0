Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4907DC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Mar 2022 20:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8PyZ6PEDFb5+XaOQvIV8GT1Opuqtx0w+QtvqNtSwdYs=; b=ETp6aEyNh0e83i
	gT2tHuDpt4nM5Bik8irqypchQL4AtXJxT6GuEbLGcpSMNMYw336BZkEQk3Eri+nMEsmOWIzCCCVsQ
	cXS8lOPdveOYeIwkyu/fITpaZx3Be5cnSx/QK4nabutaA8bEJkdROPsJllSrRPJ9n6YbjxhwwX4ng
	1E6RlSZtZrxb4UHOLEE0WiyWD0yHUqMHt2wBrWw6KdLwo9Ak8/wdheTrnCNrPKD2TaOm/J1HLCJQL
	vDm/s6ONqEuD5ubQOXob/Qk1X6cHYRy8xUjHYIDNaT9xQW5vPcgTFNr0Sp1JW7pVPPLhpsVc/opCo
	MkQlaPFHmCXJP7SL06WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXr0d-003GoC-Rg; Fri, 25 Mar 2022 20:58:11 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXr0R-003Gly-60; Fri, 25 Mar 2022 20:58:01 +0000
Received: by mail-oi1-f179.google.com with SMTP id o64so9456728oib.7;
 Fri, 25 Mar 2022 13:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z3+VYS4xPKT3Sdf1b5joxnxd0SFj54uCndKadNW/2TQ=;
 b=xUIB4La62QHdoF8H7lsOqFhRe8W34VYLQAAntxUId7ZCwoi29/4FFKG8hQoOvg/8V6
 oH/v3XsWW6qDip1NFFSkRrfH7cP8m5eulGLj4nztF3FI2PuCxtmvtEUsNj5Yxi8C0JfT
 R6N76H1JPUj3uyMdSxmoW0Yg3i7XUoIEuvOu1tIqXFaWt7S/+6DpP7dafhr7xHr5j/hw
 2H3n/IbEeY2jqp+MdcrkvRFe4PDxbtYQ7PITXlX1/sdCEhusfXkB4Nkq9cXXst9XUzgM
 gEdniGPqB0m9Xmf4FEmx0e2H45MS/UyXQ78fGdf8d+oHltK1L/o97YQGREL9j0iFVDHf
 2xgw==
X-Gm-Message-State: AOAM532zfjQIRt3cKAyfURMDCjllK815JyUUtw2yFKY2J1KqqIByTm3k
 YzrVhol+9TUo2iTB0p2Clg==
X-Google-Smtp-Source: ABdhPJwLuU1JxQeKfah2HDqtMt+U2DBPVvJlDyCn8tEkegt99JV81lgo622mxvcu3Tz1W8W7/F0Z4Q==
X-Received: by 2002:a05:6808:10cb:b0:2da:88e4:e352 with SMTP id
 s11-20020a05680810cb00b002da88e4e352mr10265878ois.159.1648241877400; 
 Fri, 25 Mar 2022 13:57:57 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 u16-20020a056808151000b002f734da0881sm857728oiw.57.2022.03.25.13.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 13:57:56 -0700 (PDT)
Received: (nullmailer pid 437457 invoked by uid 1000);
 Fri, 25 Mar 2022 20:57:55 -0000
Date: Fri, 25 Mar 2022 15:57:55 -0500
From: Rob Herring <robh@kernel.org>
To: Irui Wang <irui.wang@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Alexandre Courbot <acourbot@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>,
 angelogioacchino.delregno@collabora.com, Yong Wu <yong.wu@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Maoguang Meng <maoguang.meng@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Fritz Koenig <frkoenig@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3, 03/10] dt-bindings: media: mtk-vcodec: Adds encoder
 cores dt-bindings for mt8195
Message-ID: <Yj4s0zcHxz3U3wlc@robh.at.kernel.org>
References: <20220317082230.23622-1-irui.wang@mediatek.com>
 <20220317082230.23622-4-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220317082230.23622-4-irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_135759_278034_45761A64 
X-CRM114-Status: GOOD (  22.93  )
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

On Thu, Mar 17, 2022 at 04:22:23PM +0800, Irui Wang wrote:
> Adds encoder cores dt-bindings for mt8195.

Why?

> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  .../media/mediatek,vcodec-encoder-core.yaml   | 181 ++++++++++++++++++
>  .../media/mediatek,vcodec-encoder.yaml        |   1 -
>  2 files changed, 181 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-core.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-core.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-core.yaml
> new file mode 100644
> index 000000000000..fcfb48900c76
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-core.yaml
> @@ -0,0 +1,181 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/media/mediatek,vcodec-encoder-core.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Mediatek Video Encoder Accelerator With Multi Core
> +
> +maintainers:
> +  - Irui Wang <irui.wang@mediatek.com>
> +
> +description: |
> +  Mediatek Video Encode is the video encode hardware present in Mediatek
> +  SoCs which supports high resolution encoding functionalities. Required
> +  parent and child device node.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8195-vcodec-enc
> +
> +  mediatek,scp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      The node of system control processor (SCP), using
> +      the remoteproc & rpmsg framework.
> +
> +  mediatek,venc-multi-core:
> +    type: boolean
> +    description: |
> +      Indicates whether the encoder has multiple cores or not.

Isn't this implied by how many child nodes you have?

> +
> +  iommus:
> +    minItems: 1
> +    maxItems: 32

You really have up to 32 IOMMUs?

> +    description: |
> +      List of the hardware port in respective IOMMU block for current Socs.
> +      Refer to bindings/iommu/mediatek,iommu.yaml.
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
> +    type: object
> +    description: |
> +      The video encoder core device node which should be added as subnodes to
> +      the main venc node.
> +
> +    properties:
> +      compatible:
> +        items:
> +         - const: mediatek,mtk-venc-core
> +
> +      reg:
> +        maxItems: 1
> +
> +      mediatek,core-id:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: |
> +          Current encoder core id.

What is this for and what does its value correspond to in the h/w. We 
generally don't do made up indices in DT.

> +
> +      iommus:
> +        minItems: 1
> +        maxItems: 32
> +        description: |
> +          List of the hardware port in respective IOMMU block for current Socs.
> +          Refer to bindings/iommu/mediatek,iommu.yaml.
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
> +      - mediatek,core-id
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
> +  - mediatek,scp
> +  - iommus
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
> +        venc {
> +            compatible = "mediatek,mt8195-vcodec-enc";
> +            mediatek,scp = <&scp>;
> +            mediatek,venc-multi-core;
> +            iommus = <&iommu_vdo M4U_PORT_L19_VENC_RCPU>;
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +            ranges;
> +            dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> +
> +            venc-core@1a020000 {
> +                compatible = "mediatek,mtk-venc-core";
> +                reg = <0 0x1a020000 0 0x10000>;
> +                mediatek,core-id = <0>;
> +                iommus = <&iommu_vdo M4U_PORT_L19_VENC_RCPU>,
> +                         <&iommu_vdo M4U_PORT_L19_VENC_REC>,
> +                         <&iommu_vdo M4U_PORT_L19_VENC_BSDMA>,
> +                         <&iommu_vdo M4U_PORT_L19_VENC_SV_COMV>,
> +                         <&iommu_vdo M4U_PORT_L19_VENC_RD_COMV>,
> +                         <&iommu_vdo M4U_PORT_L19_VENC_CUR_LUMA>,
> +                         <&iommu_vdo M4U_PORT_L19_VENC_CUR_CHROMA>,
> +                         <&iommu_vdo M4U_PORT_L19_VENC_REF_LUMA>,
> +                         <&iommu_vdo M4U_PORT_L19_VENC_REF_CHROMA>;
> +                interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH 0>;
> +                clocks = <&vencsys CLK_VENC_VENC>;
> +                clock-names = "clk_venc";
> +                assigned-clocks = <&topckgen CLK_TOP_VENC>;
> +                assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D4>;
> +                power-domains = <&spm MT8195_POWER_DOMAIN_VENC>;
> +            };
> +
> +            venc-core@1b020000 {
> +                compatible = "mediatek,mtk-venc-core";
> +                reg = <0 0x1b020000 0 0x10000>;
> +                mediatek,core-id = <1>;
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
> index e7b65a91c92c..0530a694bcbe 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> @@ -21,7 +21,6 @@ properties:
>        - mediatek,mt8173-vcodec-enc
>        - mediatek,mt8183-vcodec-enc
>        - mediatek,mt8192-vcodec-enc
> -      - mediatek,mt8195-vcodec-enc
>  
>    reg:
>      maxItems: 1
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
