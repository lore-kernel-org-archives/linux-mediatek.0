Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F318BC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 23:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ocSDv0KbLxR8Foonu4dTQCyLR9CdgrTx1ewUehoAImk=; b=Y5qAGGdXswzz8v8fCaBDYazT8T
	GOv+DZmegXPUV+mFjTjGR7Lr3KBQOZ1jWOpp11jkBoWvZn9cR40phCrer5beEf0PrC7PNP6sIlzgW
	rqVhWKOTvxQcme71Z1uVpxTbooZ+BaLAUIoHYg3m5LlDfyOtiu/0KW2I6pSTbA0A17m5HK/rLy0J3
	wQvJ/2vnb2/U/43cyDOu31KU/tnpgGNcXnyuunud6P4oVU0Jm3BxcOsLMVrHvFDvrU0B2yDCVM33h
	Ns6CJhiIeYBtvHcReZazuTQu1i34bbqB8yPgtqWPBEtTutkL5zsDK9FgklpmZwNjp1izr5xSA23g6
	aneSU4Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2L89-009XuL-Aq; Fri, 17 Jun 2022 23:11:57 +0000
Received: from mail-io1-f41.google.com ([209.85.166.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2L7v-009XqZ-GH; Fri, 17 Jun 2022 23:11:45 +0000
Received: by mail-io1-f41.google.com with SMTP id a10so5946035ioe.9;
        Fri, 17 Jun 2022 16:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ocSDv0KbLxR8Foonu4dTQCyLR9CdgrTx1ewUehoAImk=;
        b=Ttagvc36RXSqLJ/jFlZYxDaxy2wEu4ZN/pveQLJ/ZHrGhu4LfW/tOJflm7KaHfCc26
         JSj2tfx6BAVoCPmY4kbgbXRMt1FIpllQHJr4Qs1uoalvdVYEH1IEljY292YMLnn8OwxG
         lFgkNuT5vZZB/RPB7C0xCZ5v3wPzWv5DM0YjuD+LtoW+snsBJyl/003mKqS/9kXxriex
         dzl+MbBdK7bNnOfdMKAkrnOnz9VWBCVhBkNA5/CNGZAp2kyVgN4QVNzNyg5eiO3hXRAe
         rnahqHjCWQ3ZzUHwHYycKUjGgDREKVb9iNndJiykMFL43m7sdIZLCrMn+cXvZIELEK5+
         5GSw==
X-Gm-Message-State: AJIora9wFzILymmdVU5Iml5mTDyThJxsFi3cLPcfFMsyzbu9RvuaiLCe
	Z4bsWg8exIjc8la2xdXgAA==
X-Google-Smtp-Source: AGRyM1u/VBMhTIF5VYeYK/B6h2IXUlXNo6UGJ2e9kLLlnK2XJcQKAGLVeLDCBOfHHOTs2DPhDBiHvg==
X-Received: by 2002:a05:6638:3389:b0:331:f5e7:7dda with SMTP id h9-20020a056638338900b00331f5e77ddamr6686415jav.93.1655507501367;
        Fri, 17 Jun 2022 16:11:41 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id z25-20020a05663803b900b00335d838f40bsm2402913jap.138.2022.06.17.16.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 16:11:41 -0700 (PDT)
Received: (nullmailer pid 2613068 invoked by uid 1000);
	Fri, 17 Jun 2022 23:11:39 -0000
Date: Fri, 17 Jun 2022 17:11:39 -0600
From: Rob Herring <robh@kernel.org>
To: Irui Wang <irui.wang@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>, angelogioacchino.delregno@collabora.com, nicolas.dufresne@collabora.com, wenst@chromium.org, Project_Global_Chrome_Upstream_Group@mediatek.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Tomasz Figa <tfiga@chromium.org>, xia.jiang@mediatek.com, maoguang.meng@mediatek.com, kyrie wu <kyrie.wu@mediatek.com>, srv_heupstream@mediatek.com
Subject: Re: [RESEND V9,1/7] dt-bindings: mediatek: Add mediatek,
 mt8195-jpgenc compatible
Message-ID: <20220617231139.GA2610098-robh@kernel.org>
References: <20220614121024.31667-1-irui.wang@mediatek.com>
 <20220614121024.31667-2-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220614121024.31667-2-irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_161143_591258_5CE62233 
X-CRM114-Status: GOOD (  21.74  )
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

On Tue, Jun 14, 2022 at 08:10:18PM +0800, Irui Wang wrote:
> From: kyrie wu <kyrie.wu@mediatek.com>
> 
> Add mediatek,mt8195-jpgenc compatible to binding document.
> 
> Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
> ---
>  .../media/mediatek,mt8195-jpegenc.yaml        | 153 ++++++++++++++++++
>  1 file changed, 153 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
> new file mode 100644
> index 000000000000..a7f9f723d5db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
> @@ -0,0 +1,153 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek JPEG Encoder Device Tree Bindings
> +
> +maintainers:
> +  - kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>
> +
> +description: |-
> +  MediaTek JPEG Encoder is the JPEG encode hardware present in MediaTek SoCs
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: mediatek,mt8195-jpgenc
> +
> +  mediatek,jpegenc-multi-core:
> +    type: boolean
> +    description: |
> +      Indicates whether the jpeg encoder has multiple cores or not.
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 4
> +    description: |
> +      Points to the respective IOMMU block with master port as argument, see
> +      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
> +      Ports are according to the HW.
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
> +  "^jpgenc@[0-9a-f]+$":
> +    type: object
> +    description: |
> +      The jpeg encoder hardware device node which should be added as subnodes to
> +      the main jpeg node.
> +
> +    properties:
> +      compatible:
> +        const: mediatek,mt8195-jpgenc-hw
> +
> +      reg:
> +        maxItems: 1
> +
> +      hw_id:
> +        description: |
> +          Current jpegenc hw id.

Same question here. Surely, I asked sometime in the last 8 versions, but 
no explanation here and I'm not going to go look for it.

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
> +        items:
> +          - const: jpgenc
> +
> +      power-domains:
> +        maxItems: 1
> +
> +    required:
> +      - compatible
> +      - reg
> +      - hw_id
> +      - iommus
> +      - interrupts
> +      - clocks
> +      - clock-names
> +      - power-domains
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - power-domains
> +  - iommus
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
> +        jpgenc_master {
> +                compatible = "mediatek,mt8195-jpgenc";
> +                mediatek,jpegenc-multi-core;
> +                power-domains = <&spm MT8195_POWER_DOMAIN_VENC_CORE1>;
> +                iommus = <&iommu_vpp M4U_PORT_L20_JPGENC_Y_RDMA>,
> +                <&iommu_vpp M4U_PORT_L20_JPGENC_C_RDMA>,
> +                <&iommu_vpp M4U_PORT_L20_JPGENC_Q_TABLE>,
> +                <&iommu_vpp M4U_PORT_L20_JPGENC_BSDMA>;
> +                #address-cells = <2>;
> +                #size-cells = <2>;
> +                ranges;
> +
> +                jpgenc@1a030000 {
> +                        compatible = "mediatek,mt8195-jpgenc-hw";
> +                        reg = <0 0x1a030000 0 0x10000>;
> +                        hw_id = <0>;
> +                        iommus = <&iommu_vdo M4U_PORT_L19_JPGENC_Y_RDMA>,
> +                        <&iommu_vdo M4U_PORT_L19_JPGENC_C_RDMA>,
> +                        <&iommu_vdo M4U_PORT_L19_JPGENC_Q_TABLE>,
> +                        <&iommu_vdo M4U_PORT_L19_JPGENC_BSDMA>;
> +                        interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH 0>;
> +                        clocks = <&vencsys CLK_VENC_JPGENC>;
> +                        clock-names = "jpgenc";
> +                        power-domains = <&spm MT8195_POWER_DOMAIN_VENC>;
> +                };
> +
> +                jpgenc@1b030000 {
> +                        compatible = "mediatek,mt8195-jpgenc-hw";
> +                        reg = <0 0x1b030000 0 0x10000>;
> +                        hw_id = <1>;
> +                        iommus = <&iommu_vpp M4U_PORT_L20_JPGENC_Y_RDMA>,
> +                        <&iommu_vpp M4U_PORT_L20_JPGENC_C_RDMA>,
> +                        <&iommu_vpp M4U_PORT_L20_JPGENC_Q_TABLE>,
> +                        <&iommu_vpp M4U_PORT_L20_JPGENC_BSDMA>;
> +                        interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH 0>;
> +                        clocks = <&vencsys_core1 CLK_VENC_CORE1_JPGENC>;
> +                        clock-names = "jpgenc";
> +                        power-domains = <&spm MT8195_POWER_DOMAIN_VENC_CORE1>;
> +                };
> +        };
> +    };
> -- 
> 2.18.0
> 
> 

