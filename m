Return-Path: <SRS0=eBCQ=PV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DFCBC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 13:52:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 539AA610E5
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 13:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 539AA610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8sHL6rDTpEJXTDumqgctv8tAlWk6Vp4acczrFZvX38s=; b=FqDtrHysvsturQ
	rDAikT8+qIw5yOmQ8wg1VfdFEl9pfcw3FfFKltA0c2kNswfnkWoMLdx/plAy/fdqitbq2pyeKY2Ki
	1VwoNNosYDVsyQ7MRW+NWxqFZW57zzkZGlPJkWqKGB2Z2HaKSYd0cFFKvyZPB6k9BV0JSxxebSUDL
	mz2ivP64mcDVjYFONSPl9DB5Ql2RjCADeT+Wv5XYNao2Mbpp2fbFf+voQBZO9bBdCRHiEMjtJxIDe
	3hINDPiq6iFWCI7v5yDChCRNOa5yJt9z+IqNBjbDhpUbt+ujx4JhgI0J4LVMXgbwwiZQbHhwB8PpD
	AO+5q3TGGcRRghK9u+2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhuCf-001r5u-AZ; Tue, 02 Nov 2021 13:51:53 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhuCS-001r3b-0Z; Tue, 02 Nov 2021 13:51:42 +0000
Received: by mail-ot1-f52.google.com with SMTP id
 n13-20020a9d710d000000b005558709b70fso23608787otj.10; 
 Tue, 02 Nov 2021 06:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XpVdRouFdaAwA7SuTkxvVAfzf38XTZnlT5W12MFMumo=;
 b=l3AQzUmk0Fpc6Aa0hlyj0IJ86Usz7t0sn52lcJReoj+8ev8s4wDfTM4HHBN047yT7k
 VtkGrCuPs8wQMjEnTLi33/eSFQvZqS+yHpYrx2DjBHUEFZ8Fdlt2irwGPvEDNAi9UEL7
 58gpgxCaLAk2DNWnKkdPJXQDAUwlO9aUx1JLJ9YTO5LKxdL/Mcmu/SvVuff0gL67bT7H
 ffNidS2FBZM1iwdrK/G3jOIIXOcw/R1qzz8Hgw6K5HI+R/srKvu84FpAqxqQNuTa9Mlj
 4ZaYFnYiGbpBkdkiDsNlLgTFZdZA/xGUze4B+j7d7lpPe4gIcf4QgoMvEIMNm5Uu1Jfc
 bq5A==
X-Gm-Message-State: AOAM530rJd3nl7TqCiymITc8W9PnG1LHLG/Koc5JHFRtmYVdNy1QbIkU
 DSBQY1bky5VQyp4mZCbMJw==
X-Google-Smtp-Source: ABdhPJyXYK0bH/5cyUilPJ+LyLIhOVaNej7ZknJgC1RMseweL5eKVOB8xNTTYf38hN9eyjDIury2mA==
X-Received: by 2002:a9d:470d:: with SMTP id a13mr26745698otf.75.1635861098494; 
 Tue, 02 Nov 2021 06:51:38 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id z25sm35974oic.1.2021.11.02.06.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:51:37 -0700 (PDT)
Received: (nullmailer pid 2767023 invoked by uid 1000);
 Tue, 02 Nov 2021 13:51:36 -0000
Date: Tue, 2 Nov 2021 08:51:36 -0500
From: Rob Herring <robh@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v8, 15/17] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for mt8192
Message-ID: <YYFCaHI/DASUz+Vu@robh.at.kernel.org>
References: <20211029035527.454-1-yunfei.dong@mediatek.com>
 <20211029035527.454-16-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211029035527.454-16-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_065140_097606_03868C8D 
X-CRM114-Status: GOOD (  24.27  )
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

On Fri, Oct 29, 2021 at 11:55:25AM +0800, Yunfei Dong wrote:
> Adds decoder dt-bindings for mt8192.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> v8: fix yaml file check fail
> ---
>  .../media/mediatek,vcodec-comp-decoder.yaml   | 273 ++++++++++++++++++
>  1 file changed, 273 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
> new file mode 100644
> index 000000000000..40a076756439
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
> @@ -0,0 +1,273 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/media/mediatek,vcodec-comp-decoder.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Mediatek Video Decode Accelerator With Multi Hardware
> +
> +maintainers:
> +  - Yunfei Dong <yunfei.dong@mediatek.com>
> +
> +description: |
> +  Mediatek Video Decode is the video decode hardware present in Mediatek
> +  SoCs which supports high resolution decoding functionalities. Required
> +  master and component node.
> +
> +  About the Decoder Hardware Block Diagram, please check below:
> +
> +    +---------------------------------+------------------------------------+
> +    |                                 |                                    |
> +    | input -> lat HW -> lat buffer --|--> lat buffer -> core HW -> output |
> +    |            ||                   |                     ||             |
> +    +------------||-------------------+---------------------||-------------+
> +                 ||       lat thread  |  core thread        ||     <master>
> +    -------------||-----------------------------------------||----------------
> +                 ||                                         ||     <component>
> +                 \/ <----------------HW index-------------->\/
> +           +------------------------------------------------------+
> +           |                    enable/disable                    |
> +           |           clk     power    irq    iommu port         |
> +           |                 (lat/lat soc/core0/core1)            |
> +           +------------------------------------------------------+
> +
> +  As above, <master> mean in master device, <component> mean in component device.
> +  The information of each hardware will be stored in each component device. There
> +  are two workqueue in master device: lat and core. Enable/disable the lat clk/power/irq
> +  when lat hardware need to work through hardware index, core is the same.
> +
> +  Normally the smi common may not the same for each hardware, can't combine all
> +  hardware in one node, or leading to iommu fault when access dram data.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8192-vcodec-dec
> +
> +  reg:
> +    maxItems: 1
> +
> +  iommus:
> +    minItems: 1
> +    maxItems: 32
> +    description: |
> +      List of the hardware port in respective IOMMU block for current Socs.
> +      Refer to bindings/iommu/mediatek,iommu.yaml.
> +
> +  mediatek,scp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    maxItems: 1
> +    description: |
> +      The node of system control processor (SCP), using
> +      the remoteproc & rpmsg framework.
> +      $ref: /schemas/remoteproc/mtk,scp.yaml
> +
> +  dma-ranges:
> +    maxItems: 1
> +    description: |
> +      Describes the physical address space of IOMMU maps to memory.
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
> +# Required child node:
> +patternProperties:
> +  vcodec-lat:
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: mediatek,mtk-vcodec-lat
> +
> +      reg:
> +        maxItems: 1
> +
> +      reg-names:
> +        maxItems: 1

You have to document what the names are. But 'misc' is isn't really 
specific and you don't need -names when there is only 1, so I'd just 
drop it.

> +
> +      interrupts:
> +        maxItems: 1
> +
> +      iommus:
> +        minItems: 1
> +        maxItems: 32
> +        description: |
> +          List of the hardware port in respective IOMMU block for current Socs.
> +          Refer to bindings/iommu/mediatek,iommu.yaml.
> +
> +      clocks:
> +        maxItems: 5
> +
> +      clock-names:
> +        items:
> +          - const: vdec-sel
> +          - const: vdec-soc-vdec
> +          - const: vdec-soc-lat
> +          - const: vdec-vdec
> +          - const: vdec-top

'vdec-' is redundant. Names are local to the node.

> +
> +      assigned-clocks:
> +        maxItems: 1
> +
> +      assigned-clock-parents:
> +        maxItems: 1
> +
> +      power-domains:
> +        maxItems: 1
> +
> +    required:
> +      - compatible
> +      - reg
> +      - reg-names
> +      - interrupts
> +      - iommus
> +      - clocks
> +      - clock-names
> +      - assigned-clocks
> +      - assigned-clock-parents
> +      - power-domains
> +
> +    additionalProperties: false
> +
> +  vcodec-core:
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: mediatek,mtk-vcodec-core
> +
> +      reg:
> +        maxItems: 1
> +
> +      reg-names:
> +        maxItems: 1
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      iommus:
> +        minItems: 1
> +        maxItems: 32
> +        description: |
> +          List of the hardware port in respective IOMMU block for current Socs.
> +          Refer to bindings/iommu/mediatek,iommu.yaml.
> +
> +      clocks:
> +        maxItems: 5
> +
> +      clock-names:
> +        items:
> +          - const: vdec-sel
> +          - const: vdec-soc-vdec
> +          - const: vdec-soc-lat
> +          - const: vdec-vdec
> +          - const: vdec-top
> +
> +      assigned-clocks:
> +        maxItems: 1
> +
> +      assigned-clock-parents:
> +        maxItems: 1
> +
> +      power-domains:
> +        maxItems: 1
> +
> +    required:
> +      - compatible
> +      - reg
> +      - reg-names
> +      - interrupts
> +      - iommus
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
> +  - iommus
> +  - mediatek,scp
> +  - dma-ranges
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/memory/mt8192-larb-port.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/mt8192-clk.h>
> +    #include <dt-bindings/power/mt8192-power.h>
> +
> +    vcodec_dec: vcodec_dec@16000000 {

video-codec@...

> +        compatible = "mediatek,mt8192-vcodec-dec";
> +        reg = <0x16000000 0x1000>;		/* VDEC_SYS */
> +        mediatek,scp = <&scp>;
> +        iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
> +        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +        lat: vcodec-lat@16010000 {
> +            compatible = "mediatek,mtk-vcodec-lat";
> +            reg = <0x16010000 0x800>;
> +            reg-names = "misc";
> +            interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
> +            iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
> +                <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
> +                <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
> +                <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
> +                <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
> +                <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
> +                <&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
> +                <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
> +            clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> +                <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
> +                <&vdecsys_soc CLK_VDEC_SOC_LAT>,
> +                <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
> +                <&topckgen CLK_TOP_MAINPLL_D4>;
> +            clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
> +                "vdec-vdec", "vdec-top";
> +            assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> +            assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
> +            power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
> +        };
> +
> +        core: vcodec-core@16025000 {
> +            compatible = "mediatek,mtk-vcodec-core";
> +            reg = <0x16025000 0x1000>;
> +            reg-names = "misc";
> +            interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
> +            iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
> +                <&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
> +                <&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,
> +                <&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
> +                <&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
> +                <&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
> +                <&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
> +                <&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
> +                <&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
> +                <&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
> +                <&iommu0 M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
> +            clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> +                <&vdecsys CLK_VDEC_VDEC>,
> +                <&vdecsys CLK_VDEC_LAT>,
> +                <&vdecsys CLK_VDEC_LARB1>,
> +                <&topckgen CLK_TOP_MAINPLL_D4>;
> +            clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
> +                "vdec-vdec", "vdec-top";
> +            assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> +            assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
> +            power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
> +        };
> +    };
> -- 
> 2.25.1
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
