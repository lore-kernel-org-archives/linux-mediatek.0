Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D240C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 20:09:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15D12610A8
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 20:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15D12610A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MNDcJ58dk6RPEKatWzcExt9hmiHrz6ycnVVw61SzhHY=; b=eVctn2gR9mwzwY
	Aq5xmWP7y2JsCPcYxi1hQwJ1VXmkXMz9AQU5fT62HW1riO3RBCiAu3CIIAC1avNAaGX8p1RlNo3Mr
	Li1UsmuAUzLyc+z5n7OATtHdc0EthYpQ1qj5WoHfNYHXYa1pvLxrLKwqVoj6lV3okdv2AKov4u47n
	NFAfOhHgb0v2ZVOGSJ5X0GLJDt/6quWO+SVqGbKZiwZcgGct5BChA5KLT4TqYzY494r4ezX1UuxQl
	qZKPuMO9SC7YlaC71qgXSp3jmhhIyXi5S5oVA6MlVcg+6QZ2YAl3GwvMpxGdzkrXoO1xIC1spwmf9
	EK2gGo4v0nNJpLFYByXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAeFV-0007VG-0O; Mon, 02 Aug 2021 20:09:21 +0000
Received: from mail-io1-f47.google.com ([209.85.166.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAeFH-0007TG-4x; Mon, 02 Aug 2021 20:09:09 +0000
Received: by mail-io1-f47.google.com with SMTP id l18so21697926ioh.11;
 Mon, 02 Aug 2021 13:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BktktPufNsyjQ/Qi9h4nbHJ66sBLurNmwSH3l1PGxAo=;
 b=HDOHMuovKK2d089BRiNtPi9fK4Gox1VwpmtvaZqL6RHjFJ1N38coTmAt5ELojD+HV/
 F17fSJvo5fgUDqg+3OBagurl/27KnDs5uUPMYbwBHLEFAnG8LXcStwfcfP2hxeDAuoY1
 3HDkxY5eTAsGPQ/CzAJLO9h1U4fKofG+RVNhB6fMicm7+1qTurgqr2YNWw6laPTF0JDn
 j9zxIwFKXlQFy8bTgcYqCUR23+9FNkVCu4k0UPwDpW2736jYhywqA+y2HA4QBaJmCQXK
 2UaZNjkM/4irbV8OjnhSe5CqJP4mDL8Y9y/cRLUOVlaHdRV+a4aTP+8aY86wPpvBP+In
 hW5w==
X-Gm-Message-State: AOAM532vrGbj1jKyWJDM5uF1vFpcd5zneDT1i+4V3mXMrOlioBjzicNW
 pqMa76lo7H4AuQeMb7g3WA==
X-Google-Smtp-Source: ABdhPJz1wBdnZEQgYHqnBS2FH+Y9xsw60vPPbbiMaOGRxMLXJ6e9o8VJq/e2sPZEjRU+JZeh6k5nFQ==
X-Received: by 2002:a5e:961a:: with SMTP id a26mr951932ioq.90.1627934946165;
 Mon, 02 Aug 2021 13:09:06 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id f3sm7741115iob.30.2021.08.02.13.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 13:09:05 -0700 (PDT)
Received: (nullmailer pid 1520409 invoked by uid 1000);
 Mon, 02 Aug 2021 20:09:03 -0000
Date: Mon, 2 Aug 2021 14:09:03 -0600
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
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3, 05/15] dt-bindings: media: mtk-vcodec: Separate video
 encoder and decoder dt-bindings
Message-ID: <YQhQ3yUQIICmPUDg@robh.at.kernel.org>
References: <20210727101051.24418-1-yunfei.dong@mediatek.com>
 <20210727101051.24418-6-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210727101051.24418-6-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_130907_287160_19AC2A50 
X-CRM114-Status: GOOD (  27.09  )
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

On Tue, Jul 27, 2021 at 06:10:41PM +0800, Yunfei Dong wrote:
> Decoder will use component framework to manage hardware, it is big
> difference with encoder.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> v3: change txt files to yaml.
> ---
>  .../media/mediatek,vcodec-decoder.yaml        | 138 ++++++++++++++++++
>  .../media/mediatek,vcodec-encoder.yaml        | 128 ++++++++++++++++
>  .../bindings/media/mediatek-vcodec.txt        | 130 -----------------
>  3 files changed, 266 insertions(+), 130 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
> new file mode 100644
> index 000000000000..ea44acfeeb9f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
> @@ -0,0 +1,138 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iommu/mediatek,vcodec-encoder.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek Video Decode Accelerator With Component
> +
> +maintainers:
> +  - Yunfei Dong <yunfei.dong@mediatek.com>
> +
> +description: |+
> +  Mediatek Video Decode is the video decode hardware present in Mediatek
> +  SoCs which supports high resolution decoding functionalities.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8173-vcodec-dec
> +      - mediatek,mt8183-vcodec-dec
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 8
> +
> +  clock-names:
> +    items:
> +      - const: vcodecpll
> +      - const: univpll_d2
> +      - const: clk_cci400_sel
> +      - const: vdec_sel
> +      - const: vdecpll
> +      - const: vencpll
> +      - const: venc_lt_sel
> +      - const: vdec_bus_clk_src
> +
> +  assigned-clocks: true
> +
> +  assigned-clock-parents: true
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
> +  mediatek,larb:
> +    maxItems: 1

Needs a type ref. Run 'make dt_binding_check' and it will tell you these 
things instead of me.

> +    description: |
> +      Mmust contain the local arbiters in the current Socs.
> +
> +  mediatek,scp:
> +    maxItems: 1

Needs a type ref. 

> +
> +  mediatek,scp:

Duplicate.

> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - iommus
> +  - assigned-clocks
> +  - assigned-clock-parents
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/memory/mt8173-larb-port.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    vcodec_dec: vcodec@16000000 {
> +      compatible = "mediatek,mt8173-vcodec-dec";
> +      reg = <0 0x16000000 0 0x100>,   /*VDEC_SYS*/
> +          <0 0x16020000 0 0x1000>,  /*VDEC_MISC*/
> +          <0 0x16021000 0 0x800>,   /*VDEC_LD*/
> +          <0 0x16021800 0 0x800>,   /*VDEC_TOP*/
> +          <0 0x16022000 0 0x1000>,  /*VDEC_CM*/
> +          <0 0x16023000 0 0x1000>,  /*VDEC_AD*/
> +          <0 0x16024000 0 0x1000>,  /*VDEC_AV*/
> +          <0 0x16025000 0 0x1000>,  /*VDEC_PP*/
> +          <0 0x16026800 0 0x800>,   /*VP8_VD*/
> +          <0 0x16027000 0 0x800>,   /*VP6_VD*/
> +          <0 0x16027800 0 0x800>,   /*VP8_VL*/
> +          <0 0x16028400 0 0x400>;   /*VP9_VD*/
> +      interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_LOW>;
> +      mediatek,larb = <&larb1>;
> +      iommus = <&iommu M4U_PORT_HW_VDEC_MC_EXT>,
> +             <&iommu M4U_PORT_HW_VDEC_PP_EXT>,
> +             <&iommu M4U_PORT_HW_VDEC_AVC_MV_EXT>,
> +             <&iommu M4U_PORT_HW_VDEC_PRED_RD_EXT>,
> +             <&iommu M4U_PORT_HW_VDEC_PRED_WR_EXT>,
> +             <&iommu M4U_PORT_HW_VDEC_UFO_EXT>,
> +             <&iommu M4U_PORT_HW_VDEC_VLD_EXT>,
> +             <&iommu M4U_PORT_HW_VDEC_VLD2_EXT>;
> +      mediatek,vpu = <&vpu>;
> +      power-domains = <&scpsys MT8173_POWER_DOMAIN_VDEC>;
> +      clocks = <&apmixedsys CLK_APMIXED_VCODECPLL>,
> +             <&topckgen CLK_TOP_UNIVPLL_D2>,
> +             <&topckgen CLK_TOP_CCI400_SEL>,
> +             <&topckgen CLK_TOP_VDEC_SEL>,
> +             <&topckgen CLK_TOP_VCODECPLL>,
> +             <&apmixedsys CLK_APMIXED_VENCPLL>,
> +             <&topckgen CLK_TOP_VENC_LT_SEL>,
> +             <&topckgen CLK_TOP_VCODECPLL_370P5>;
> +      clock-names = "vcodecpll",
> +                  "univpll_d2",
> +                  "clk_cci400_sel",
> +                  "vdec_sel",
> +                  "vdecpll",
> +                  "vencpll",
> +                  "venc_lt_sel",
> +                  "vdec_bus_clk_src";
> +      assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>,
> +                      <&topckgen CLK_TOP_CCI400_SEL>,
> +                      <&topckgen CLK_TOP_VDEC_SEL>,
> +                      <&apmixedsys CLK_APMIXED_VCODECPLL>,
> +                      <&apmixedsys CLK_APMIXED_VENCPLL>;
> +      assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>,
> +                             <&topckgen CLK_TOP_UNIVPLL_D2>,
> +                             <&topckgen CLK_TOP_VCODECPLL>;
> +      assigned-clock-rates = <0>, <0>, <0>, <1482000000>, <800000000>;
> +    };
> \ No newline at end of file
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> new file mode 100644
> index 000000000000..feb0697cf50e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iommu/mediatek,vcodec-encoder.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek Video Encode Accelerator With Component
> +
> +maintainers:
> +  - Yunfei Dong <yunfei.dong@mediatek.com>
> +
> +description: |+
> +  Mediatek Video Encode is the video encode hardware present in Mediatek
> +  SoCs which supports high resolution decoding functionalities.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8173-vcodec-enc-vp8
> +      - mediatek,mt8173-vcodec-enc
> +      - mediatek,mt8183-vcodec-enc
> +      - mediatek,mt8192-vcodec-enc
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
> +      - const: vdec_sel
> +      - const: vdec-soc-vdec
> +      - const: vdec-soc-lat
> +      - const: vdec-vdec
> +      - const: vdec-top
> +
> +  assigned-clocks: true
> +
> +  assigned-clock-parents: true
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
> +  mediatek,larb:
> +    maxItems: 1
> +    description: |
> +      Mmust contain the local arbiters in the current Socs.
> +
> +  mediatek,scp:
> +    maxItems: 1
> +
> +  mediatek,scp:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - iommus
> +  - assigned-clocks
> +  - assigned-clock-parents
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/memory/mt8173-larb-port.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    vcodec_enc_avc: vcodec@18002000 {
> +      compatible = "mediatek,mt8173-vcodec-enc";
> +      reg = <0 0x18002000 0 0x1000>;
> +      interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
> +      iommus = <&iommu M4U_PORT_VENC_RCPU>,
> +             <&iommu M4U_PORT_VENC_REC>,
> +             <&iommu M4U_PORT_VENC_BSDMA>,
> +             <&iommu M4U_PORT_VENC_SV_COMV>,
> +             <&iommu M4U_PORT_VENC_RD_COMV>,
> +             <&iommu M4U_PORT_VENC_CUR_LUMA>,
> +             <&iommu M4U_PORT_VENC_CUR_CHROMA>,
> +             <&iommu M4U_PORT_VENC_REF_LUMA>,
> +             <&iommu M4U_PORT_VENC_REF_CHROMA>,
> +             <&iommu M4U_PORT_VENC_NBM_RDMA>,
> +             <&iommu M4U_PORT_VENC_NBM_WDMA>;
> +      mediatek,larb = <&larb3>;
> +      mediatek,vpu = <&vpu>;
> +      clocks = <&topckgen CLK_TOP_VENC_SEL>;
> +      clock-names = "venc_sel";
> +      assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
> +      assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
> +    };
> +
> +    vcodec_enc_vp8: vcodec@19002000 {
> +      compatible = "mediatek,mt8173-vcodec-enc-vp8";
> +      reg =  <0 0x19002000 0 0x1000>;	/* VENC_LT_SYS */
> +      interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
> +      iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
> +             <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
> +             <&iommu M4U_PORT_VENC_BSDMA_SET2>,
> +             <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
> +             <&iommu M4U_PORT_VENC_RD_COMA_SET2>,
> +             <&iommu M4U_PORT_VENC_CUR_LUMA_SET2>,
> +             <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
> +             <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
> +             <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
> +      mediatek,larb = <&larb5>;
> +      mediatek,vpu = <&vpu>;
> +      clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
> +      clock-names = "venc_lt_sel";
> +      assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
> +      assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>;
> +    };
> \ No newline at end of file

Fix this.

> diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> deleted file mode 100644
> index c44a6e6943af..000000000000
> --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> +++ /dev/null
> @@ -1,130 +0,0 @@
> -Mediatek Video Codec
> -
> -Mediatek Video Codec is the video codec hw present in Mediatek SoCs which
> -supports high resolution encoding and decoding functionalities.
> -
> -Required properties:
> -- compatible : must be one of the following string:
> -  "mediatek,mt8173-vcodec-enc-vp8" for mt8173 vp8 encoder.
> -  "mediatek,mt8173-vcodec-enc" for mt8173 avc encoder.
> -  "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
> -  "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
> -  "mediatek,mt8192-vcodec-enc" for MT8192 encoder.
> -  "mediatek,mt8183-vcodec-dec" for MT8183 decoder.
> -- reg : Physical base address of the video codec registers and length of
> -  memory mapped region.
> -- interrupts : interrupt number to the cpu.
> -- mediatek,larb : must contain the local arbiters in the current Socs.
> -- clocks : list of clock specifiers, corresponding to entries in
> -  the clock-names property.
> -- clock-names: avc encoder must contain "venc_sel", vp8 encoder must
> -  contain "venc_lt_sel", decoder must contain "vcodecpll", "univpll_d2",
> -  "clk_cci400_sel", "vdec_sel", "vdecpll", "vencpll", "venc_lt_sel",
> -  "vdec_bus_clk_src".
> -- iommus : should point to the respective IOMMU block with master port as
> -  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> -  for details.
> -- dma-ranges : describes the dma address range space that the codec hw access.
> -One of the two following nodes:
> -- mediatek,vpu : the node of the video processor unit, if using VPU.
> -- mediatek,scp : the node of the SCP unit, if using SCP.
> -
> -
> -Example:
> -
> -vcodec_dec: vcodec@16000000 {
> -    compatible = "mediatek,mt8173-vcodec-dec";
> -    reg = <0 0x16000000 0 0x100>,   /*VDEC_SYS*/
> -          <0 0x16020000 0 0x1000>,  /*VDEC_MISC*/
> -          <0 0x16021000 0 0x800>,   /*VDEC_LD*/
> -          <0 0x16021800 0 0x800>,   /*VDEC_TOP*/
> -          <0 0x16022000 0 0x1000>,  /*VDEC_CM*/
> -          <0 0x16023000 0 0x1000>,  /*VDEC_AD*/
> -          <0 0x16024000 0 0x1000>,  /*VDEC_AV*/
> -          <0 0x16025000 0 0x1000>,  /*VDEC_PP*/
> -          <0 0x16026800 0 0x800>,   /*VP8_VD*/
> -          <0 0x16027000 0 0x800>,   /*VP6_VD*/
> -          <0 0x16027800 0 0x800>,   /*VP8_VL*/
> -          <0 0x16028400 0 0x400>;   /*VP9_VD*/
> -    interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_LOW>;
> -    mediatek,larb = <&larb1>;
> -    iommus = <&iommu M4U_PORT_HW_VDEC_MC_EXT>,
> -             <&iommu M4U_PORT_HW_VDEC_PP_EXT>,
> -             <&iommu M4U_PORT_HW_VDEC_AVC_MV_EXT>,
> -             <&iommu M4U_PORT_HW_VDEC_PRED_RD_EXT>,
> -             <&iommu M4U_PORT_HW_VDEC_PRED_WR_EXT>,
> -             <&iommu M4U_PORT_HW_VDEC_UFO_EXT>,
> -             <&iommu M4U_PORT_HW_VDEC_VLD_EXT>,
> -             <&iommu M4U_PORT_HW_VDEC_VLD2_EXT>;
> -    mediatek,vpu = <&vpu>;
> -    power-domains = <&scpsys MT8173_POWER_DOMAIN_VDEC>;
> -    clocks = <&apmixedsys CLK_APMIXED_VCODECPLL>,
> -             <&topckgen CLK_TOP_UNIVPLL_D2>,
> -             <&topckgen CLK_TOP_CCI400_SEL>,
> -             <&topckgen CLK_TOP_VDEC_SEL>,
> -             <&topckgen CLK_TOP_VCODECPLL>,
> -             <&apmixedsys CLK_APMIXED_VENCPLL>,
> -             <&topckgen CLK_TOP_VENC_LT_SEL>,
> -             <&topckgen CLK_TOP_VCODECPLL_370P5>;
> -    clock-names = "vcodecpll",
> -                  "univpll_d2",
> -                  "clk_cci400_sel",
> -                  "vdec_sel",
> -                  "vdecpll",
> -                  "vencpll",
> -                  "venc_lt_sel",
> -                  "vdec_bus_clk_src";
> -    assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>,
> -                      <&topckgen CLK_TOP_CCI400_SEL>,
> -                      <&topckgen CLK_TOP_VDEC_SEL>,
> -                      <&apmixedsys CLK_APMIXED_VCODECPLL>,
> -                      <&apmixedsys CLK_APMIXED_VENCPLL>;
> -    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>,
> -                             <&topckgen CLK_TOP_UNIVPLL_D2>,
> -                             <&topckgen CLK_TOP_VCODECPLL>;
> -    assigned-clock-rates = <0>, <0>, <0>, <1482000000>, <800000000>;
> -  };
> -
> -vcodec_enc_avc: vcodec@18002000 {
> -    compatible = "mediatek,mt8173-vcodec-enc";
> -    reg = <0 0x18002000 0 0x1000>;
> -    interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
> -    iommus = <&iommu M4U_PORT_VENC_RCPU>,
> -             <&iommu M4U_PORT_VENC_REC>,
> -             <&iommu M4U_PORT_VENC_BSDMA>,
> -             <&iommu M4U_PORT_VENC_SV_COMV>,
> -             <&iommu M4U_PORT_VENC_RD_COMV>,
> -             <&iommu M4U_PORT_VENC_CUR_LUMA>,
> -             <&iommu M4U_PORT_VENC_CUR_CHROMA>,
> -             <&iommu M4U_PORT_VENC_REF_LUMA>,
> -             <&iommu M4U_PORT_VENC_REF_CHROMA>,
> -             <&iommu M4U_PORT_VENC_NBM_RDMA>,
> -             <&iommu M4U_PORT_VENC_NBM_WDMA>;
> -    mediatek,larb = <&larb3>;
> -    mediatek,vpu = <&vpu>;
> -    clocks = <&topckgen CLK_TOP_VENC_SEL>;
> -    clock-names = "venc_sel";
> -    assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
> -    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
> -  };
> -
> -vcodec_enc_vp8: vcodec@19002000 {
> -    compatible = "mediatek,mt8173-vcodec-enc-vp8";
> -    reg =  <0 0x19002000 0 0x1000>;	/* VENC_LT_SYS */
> -    interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
> -    iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
> -             <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
> -             <&iommu M4U_PORT_VENC_BSDMA_SET2>,
> -             <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
> -             <&iommu M4U_PORT_VENC_RD_COMA_SET2>,
> -             <&iommu M4U_PORT_VENC_CUR_LUMA_SET2>,
> -             <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
> -             <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
> -             <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
> -    mediatek,larb = <&larb5>;
> -    mediatek,vpu = <&vpu>;
> -    clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
> -    clock-names = "venc_lt_sel";
> -    assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
> -    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>;
> -  };
> -- 
> 2.25.1
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
