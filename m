Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F27FC432BE
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 17:41:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D4A260560
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 17:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D4A260560
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x+OCWcXgYJh8rflf+tZRXAqueo0nZsqXirAY8ms08tI=; b=MpPWrS4QgY2rwW
	UnGQV+ZzTDTtTw4L1K6S1WrTbvEqAfAoS4KHbELWMVT/3/xEHWoYLTnH5YFsq7+2Ge0gzlcFFEtku
	iedxxPw+RjYSKSZlKYW/2bDsJXAvY1RoH5NRrcXDZ7a6bkerMAYyifJoHDoSNLGj5HhqiO1zi1TcD
	58TnI3zwqluUaOl9zXBtjXTsjth0UTSWPvXszwfRsdXe8letsnyba4Vp5Yb7nAzy7kMYB34WGde1r
	cdUL681Iajf8vfpRDVBJ3c5qgiaYKqmo+XX7LlH98mnhlkYyuF0xMpv9/lcZmg5hW83ez5rYNe8Jf
	bXhdAmw9v7DZmPGvbImA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDsER-007oNk-ID; Wed, 11 Aug 2021 17:41:35 +0000
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDsEC-007oLm-DV; Wed, 11 Aug 2021 17:41:24 +0000
Received: by mail-pl1-f182.google.com with SMTP id e15so3612257plh.8;
 Wed, 11 Aug 2021 10:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SKwYFo8dYv0QNS156XTY/lU7jm4l1+2FwbKLknPJvfU=;
 b=Shv+IMUIKcThUNTCLhAy7YWY7DLykoBfdOkgytzVyJKvMEtTQfE/xPHcmbah5SU60Y
 ZiPQTHoHVD1P3IkD8buwzojItfzHj+z+teWNchVLpXkXqAjsB21MTwkepP65DtuA0YxK
 K+EqJC2ig6T2ifHCHsYeCJ8i6jIJ+bFysWcB2KGZs6Zfrs6VCK/PUl0MFFMLa0GVIKpB
 q8djSb8uQHcSOGm56yHrnp0aB5zdMMwysXdbPSzZE3y1qDySyalYQ6OXn2LEvMUHL2HG
 /B3PjW+fR2ALKVez1ugoglQqulTeejqbpPkh6XrMGBaAfmTuwM9jnxe7+Tqu2PwqMEGE
 JJ9w==
X-Gm-Message-State: AOAM532beyutdfFWS+kKPGzkQCM+4fsd4PEsiQcBabhdTi2TlXd5uj0r
 vKlue8/5SDYxB7pKCTTn5Q==
X-Google-Smtp-Source: ABdhPJzd0Rv9z9sTfwYP6BWh5jwSA3kbD4w+MhfZ0jc+4Oh8j0z36V1h4a362NG4HRXAo2xErhqfqw==
X-Received: by 2002:a63:d044:: with SMTP id s4mr1391317pgi.32.1628703679422;
 Wed, 11 Aug 2021 10:41:19 -0700 (PDT)
Received: from robh.at.kernel.org ([208.184.162.215])
 by smtp.gmail.com with ESMTPSA id e13sm95836pfi.210.2021.08.11.10.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 10:41:18 -0700 (PDT)
Received: (nullmailer pid 4130314 invoked by uid 1000);
 Wed, 11 Aug 2021 17:41:09 -0000
Date: Wed, 11 Aug 2021 11:41:09 -0600
From: Rob Herring <robh@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Irui Wang <irui.wang@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 George Sun <george.sun@mediatek.com>
Subject: Re: [PATCH v5, 13/15] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for mt8192
Message-ID: <YRQLtd+IyISzlreI@robh.at.kernel.org>
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
 <20210811025801.21597-14-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210811025801.21597-14-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_104120_506244_1BFD2D86 
X-CRM114-Status: GOOD (  21.76  )
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

On Wed, Aug 11, 2021 at 10:57:59AM +0800, Yunfei Dong wrote:
> Adds decoder dt-bindings for mt8192.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> v5: no changes
> 
> This patch depends on "Mediatek MT8192 clock support"[1].
> 
> The definition of decoder clocks are in mt8192-clk.h, need to include them in case of build fail [1].
> 
> [1]https://patchwork.kernel.org/project/linux-mediatek/list/?series=511175
> ---
>  .../media/mediatek,vcodec-comp-decoder.yaml   | 172 ++++++++++++++++++
>  1 file changed, 172 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
> new file mode 100644
> index 000000000000..083c89933917
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
> @@ -0,0 +1,172 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iommu/mediatek,vcodec-comp-decoder.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek Video Decode Accelerator With Component
> +
> +maintainers:
> +  - Yunfei Dong <yunfei.dong@mediatek.com>
> +
> +description: |+
> +  Mediatek Video Decode is the video decode hardware present in Mediatek
> +  SoCs which supports high resolution decoding functionalities. Required
> +  master and component node.
> +
> +properties:
> +  compatible:
> +    oneOf:

Don't need 'oneOf' when only one entry.

> +      - enum:
> +          - mediatek,mt8192-vcodec-dec  # for lat hardware
> +          - mediatek,mtk-vcodec-lat     # for core hardware
> +          - mediatek,mtk-vcodec-core
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 5
> +
> +  clock-names:
> +    items:
> +      - const: vdec-sel
> +      - const: vdec-soc-vdec
> +      - const: vdec-soc-lat
> +      - const: vdec-vdec
> +      - const: vdec-top
> +

> +  assigned-clocks: true
> +
> +  assigned-clock-parents: true

Don't need these 2. Always valid if 'clocks' is present.

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    minItems: 1
> +    maxItems: 32
> +    description: |
> +      List of the hardware port in respective IOMMU block for current Socs.
> +      Refer to bindings/iommu/mediatek,iommu.yaml.
> +
> +  dma-ranges:
> +    maxItems: 1
> +    description: |
> +      Describes the physical address space of IOMMU maps to memory.
> +
> +  mediatek,scp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    maxItems: 1
> +    description:
> +      Describes point to scp.
> +
> +required:
> +      - compatible
> +      - reg
> +      - iommus
> +      - dma-ranges
> +
> +allOf:
> +  - if: #master node
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8192-vcodec-dec  # for lat hardware
> +
> +    then:
> +      required:
> +        - mediatek,scp
> +
> +  - if: #component node
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mtk-vcodec-lat     # for core hardware
> +              - mediatek,mtk-vcodec-core
> +
> +    then:
> +      required:
> +        - interrupts
> +        - clocks
> +        - clock-names
> +        - assigned-clocks
> +        - assigned-clock-parents
> +        - power-domains
> +
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
> +        compatible = "mediatek,mt8192-vcodec-dec";
> +        reg = <0 0x16000000 0 0x1000>;		/* VDEC_SYS */
> +        mediatek,scp = <&scp>;
> +        iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
> +        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> +    };
> +
> +    vcodec_lat: vcodec_lat@0x16010000 {
> +        compatible = "mediatek,mtk-vcodec-lat";
> +        reg = <0 0x16010000 0 0x800>;		/* VDEC_MISC */
> +        interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
> +        iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
> +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
> +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
> +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
> +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
> +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
> +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
> +             <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
> +        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> +        clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> +             <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
> +             <&vdecsys_soc CLK_VDEC_SOC_LAT>,
> +             <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
> +             <&topckgen CLK_TOP_MAINPLL_D4>;
> +        clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
> +              "vdec-vdec", "vdec-top";
> +        assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> +        assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
> +        power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
> +    };
> +
> +    vcodec_core: vcodec_core@0x16025000 {
> +        compatible = "mediatek,mtk-vcodec-core";
> +        reg = <0 0x16025000 0 0x1000>;		/* VDEC_CORE_MISC */
> +        interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
> +        iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
> +             <&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
> +             <&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,
> +             <&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
> +             <&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
> +             <&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
> +             <&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
> +             <&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
> +             <&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
> +             <&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
> +             <&iommu0 M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
> +        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> +        clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> +             <&vdecsys CLK_VDEC_VDEC>,
> +             <&vdecsys CLK_VDEC_LAT>,
> +             <&vdecsys CLK_VDEC_LARB1>,
> +             <&topckgen CLK_TOP_MAINPLL_D4>;
> +        clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
> +              "vdec-vdec", "vdec-top";
> +        assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> +        assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
> +        power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
> +    };
> -- 
> 2.25.1
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
