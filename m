Return-Path: <SRS0=zmqO=NU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB19C432BE
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Aug 2021 20:55:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F30C60F46
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Aug 2021 20:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F30C60F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vanguardiasur.com.ar
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=800itZmzcnR/XYikrKt1ABPuc1RgnQGJzjhUGCHvm2c=; b=O5hjZupcrmtfc7
	ZhKlI/tsEMcmPCF1bLd+DZ+LNLcBdeATI9D2rzy3h+i5pnE1wK07+r9J/5hw+Mp46AL56Vq4SuZrb
	l6k4/mCUSY4eZsvA5edN+Y1cHw4A+aJu1uj7CgmH3mnJpNhXY0BXkyFR2pvlLB/07Q68FiinvQKVU
	osOJ8Yk3pdHJoXzHin9UU4w7lilww0nikZqhk3WzBbQJno8jbE9mGWfvpOZyTur4suhZueg/FMrGF
	kwlh3zTo7uutgjWc42rdTzyb6gVgcy0TjOCOAHFhNB/AIPr8nDjK9aUzl7/Hstbv7WRXR+o4g2b/r
	q61gunDVDLhspC6Sj8ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKRpp-00G1OJ-Gb; Sun, 29 Aug 2021 20:55:21 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKRpZ-00G1LM-9n
 for linux-mediatek@lists.infradead.org; Sun, 29 Aug 2021 20:55:12 +0000
Received: by mail-ed1-x536.google.com with SMTP id g21so18561815edw.4
 for <linux-mediatek@lists.infradead.org>; Sun, 29 Aug 2021 13:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AqtMNiioIDL4ACYgjDdzLfylmCCKYY7rQn1WqTkUY6Y=;
 b=rmfs+0kqWuZFMMLTXE8SLLVEW9bJ1Rp4S64dAmsmAVdh59PY5jk/DK0MSCunjolYQX
 8b/c1VqVPdZQIu3k2T9myVQUKLpndM9dnvvunRH1i2J20WnlMAkV46DD38xdGvGERsBm
 JFyjObQobsdg18+I9xZ57Q4u4HLVmTx9FWz9umwcWHZwM0oV7c8a+OCJV68fx//7yWG0
 sIUwHbfL8JWpeBVEzaojdjQoZ07u0nuaxWqDBZuZFZrh+otrbHBqfuBKcdt+dtuyiqXv
 OVE3dWC8lDS/dDbO5qb5OVybSWRDQ38elFgPGDKfqm9cQE/JT1VG0xqjaNSZLeKxNsVY
 oulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AqtMNiioIDL4ACYgjDdzLfylmCCKYY7rQn1WqTkUY6Y=;
 b=q9rxryz+mnFz6JVp7iS/37HYPv8vWCxm4wKfAeLD5DnNwoMwklW5bAgxolIu9vECim
 Z20mLuui0g4Qamrr8fWKxRPKd1fNjfwx5QnabHgTBWXjaLpb/kZ53+NiU/9JzxDvoEmB
 MsA5BzwbchtGsZ3vNpcvBUJVWqeFTuuLAZoi1jfuP/AE86g4WMpZtFf9KEwLbeaLBLM0
 cIKZmZwV7ZgtJ9rBmx4m14WnTMWtsSXIVsyGzBtv0zEq2og994ciONJ4thEHkk43p3UK
 FtkQJua0ubYwk/zB41Hw3GhxKJhQ+iFoIi4us+yOA12BuiMAlpn+Jes62MXHQPILD7Zc
 MrEw==
X-Gm-Message-State: AOAM532YbKrH9Bj0VqDDriguE3QiLGSKBVpQwwyvzzwWgDiPVrzuGcdh
 3qjrHB8qfATa2YiTrK/mew2sqi+h72bCNn4A3kP6NA==
X-Google-Smtp-Source: ABdhPJxigLoyQLS8ZtoXqPvF+AjahKw1yZIoMxRbzGTNv9xpSOeNeo6pCPyZ5XLu0Kp4T/DC4Ul/kgsSkSWC7NJopcI=
X-Received: by 2002:a05:6402:11c9:: with SMTP id
 j9mr20372184edw.134.1630270502889; 
 Sun, 29 Aug 2021 13:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
 <20210811025801.21597-14-yunfei.dong@mediatek.com>
 <YRQQBL8AN0925zj9@pendragon.ideasonboard.com>
 <952c219de7595f7f814d3006fbe25b8089a35212.camel@mediatek.com>
In-Reply-To: <952c219de7595f7f814d3006fbe25b8089a35212.camel@mediatek.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sun, 29 Aug 2021 17:54:50 -0300
Message-ID: <CAAEAJfB_qZtVpxk8P=26GkZ1j66v+RzzJTqf3UrfMkWNJ1fmFg@mail.gmail.com>
Subject: Re: [PATCH v5, 13/15] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for mt8192
To: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>, 
 linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 srv_heupstream <srv_heupstream@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 George Sun <george.sun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210829_135505_387921_72C48FEE 
X-CRM114-Status: GOOD (  40.83  )
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

On Tue, 17 Aug 2021 at 00:52, yunfei.dong@mediatek.com
<yunfei.dong@mediatek.com> wrote:
>
> Hi Laurent,
>
> Thanks for your detail suggestion.
>
> On Wed, 2021-08-11 at 20:59 +0300, Laurent Pinchart wrote:
> > Hi Yunfei,
> >
> > Thank you for the patch.
> >
> > On Wed, Aug 11, 2021 at 10:57:59AM +0800, Yunfei Dong wrote:
> > > Adds decoder dt-bindings for mt8192.
> > >
> > > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > > ---
> > > v5: no changes
> > >
> > > This patch depends on "Mediatek MT8192 clock support"[1].
> > >
> > > The definition of decoder clocks are in mt8192-clk.h, need to
> > > include them in case of build fail [1].
> > >
> > > [1]
> > > https://patchwork.kernel.org/project/linux-mediatek/list/?series=511175
> > > ---
> > >  .../media/mediatek,vcodec-comp-decoder.yaml   | 172
> > > ++++++++++++++++++
> > >  1 file changed, 172 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/media/mediatek,vcodec-comp-
> > > decoder.yaml
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-
> > > decoder.yaml
> > > b/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-
> > > decoder.yaml
> > > new file mode 100644
> > > index 000000000000..083c89933917
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-
> > > decoder.yaml
> > > @@ -0,0 +1,172 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id:
> > > http://devicetree.org/schemas/iommu/mediatek,vcodec-comp-decoder.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Mediatek Video Decode Accelerator With Component
> > > +
> > > +maintainers:
> > > +  - Yunfei Dong <yunfei.dong@mediatek.com>
> > > +
> > > +description: |+
> > > +  Mediatek Video Decode is the video decode hardware present in
> > > Mediatek
> > > +  SoCs which supports high resolution decoding functionalities.
> > > Required
> > > +  master and component node.
> >
> > This should explain how the three IP cores relate to each other.
> >
> I will explain it in next patch.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - enum:
> > > +          - mediatek,mt8192-vcodec-dec  # for lat hardware
> > > +          - mediatek,mtk-vcodec-lat     # for core hardware
> > > +          - mediatek,mtk-vcodec-core
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 5
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: vdec-sel
> > > +      - const: vdec-soc-vdec
> > > +      - const: vdec-soc-lat
> > > +      - const: vdec-vdec
> > > +      - const: vdec-top
> > > +
> > > +  assigned-clocks: true
> > > +
> > > +  assigned-clock-parents: true
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  iommus:
> > > +    minItems: 1
> > > +    maxItems: 32
> > > +    description: |
> > > +      List of the hardware port in respective IOMMU block for
> > > current Socs.
> > > +      Refer to bindings/iommu/mediatek,iommu.yaml.
> > > +
> > > +  dma-ranges:
> > > +    maxItems: 1
> > > +    description: |
> > > +      Describes the physical address space of IOMMU maps to
> > > memory.
> > > +
> > > +  mediatek,scp:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    maxItems: 1
> > > +    description:
> > > +      Describes point to scp.
> > > +
> > > +required:
> > > +      - compatible
> > > +      - reg
> > > +      - iommus
> > > +      - dma-ranges
> > > +
> > > +allOf:
> > > +  - if: #master node
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - mediatek,mt8192-vcodec-dec  # for lat hardware
> > > +
> > > +    then:
> > > +      required:
> > > +        - mediatek,scp
> > > +
> > > +  - if: #component node
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - mediatek,mtk-vcodec-lat     # for core hardware
> > > +              - mediatek,mtk-vcodec-core
> > > +
> > > +    then:
> > > +      required:
> > > +        - interrupts
> > > +        - clocks
> > > +        - clock-names
> > > +        - assigned-clocks
> > > +        - assigned-clock-parents
> > > +        - power-domains
> > > +
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +    #include <dt-bindings/memory/mt8192-larb-port.h>
> > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > +    #include <dt-bindings/clock/mt8192-clk.h>
> > > +    #include <dt-bindings/power/mt8192-power.h>
> > > +
> > > +    vcodec_dec: vcodec_dec@16000000 {
> > > +        compatible = "mediatek,mt8192-vcodec-dec";
> > > +        reg = <0 0x16000000 0 0x1000>;             /* VDEC_SYS */
> > > +        mediatek,scp = <&scp>;
> > > +        iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
> > > +        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> > > +    };
> > > +
> > > +    vcodec_lat: vcodec_lat@0x16010000 {
> > > +        compatible = "mediatek,mtk-vcodec-lat";
> > > +        reg = <0 0x16010000 0 0x800>;              /* VDEC_MISC */
> > > +        interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
> > > +        iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
> > > +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
> > > +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
> > > +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
> > > +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
> > > +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
> > > +             <&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
> > > +             <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
> > > +        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> > > +        clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> > > +             <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
> > > +             <&vdecsys_soc CLK_VDEC_SOC_LAT>,
> > > +             <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
> > > +             <&topckgen CLK_TOP_MAINPLL_D4>;
> > > +        clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
> > > +              "vdec-vdec", "vdec-top";
> > > +        assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> > > +        assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
> > > +        power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
> > > +    };
> > > +
> > > +    vcodec_core: vcodec_core@0x16025000 {
> > > +        compatible = "mediatek,mtk-vcodec-core";
> > > +        reg = <0 0x16025000 0 0x1000>;             /*
> > > VDEC_CORE_MISC */
> > > +        interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
> > > +        iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
> > > +             <&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
> > > +             <&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,
> > > +             <&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
> > > +             <&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
> > > +             <&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
> > > +             <&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
> > > +             <&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
> > > +             <&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
> > > +             <&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
> > > +             <&iommu0 M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
> > > +        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> > > +        clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> > > +             <&vdecsys CLK_VDEC_VDEC>,
> > > +             <&vdecsys CLK_VDEC_LAT>,
> > > +             <&vdecsys CLK_VDEC_LARB1>,
> > > +             <&topckgen CLK_TOP_MAINPLL_D4>;
> > > +        clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
> > > +              "vdec-vdec", "vdec-top";
> > > +        assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> > > +        assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
> > > +        power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
> > > +    };
> >
> > I'm a bit late in the game, reviewing v5 only, but I'm wondering if
> > those IP cores need to be modelled in separate nodes. It would be
> > much
> > easier, from a software point of view, to have a single node, with
> > multiple register ranges.
> >
> > Are some of those IP cores used in different SoCs, combined in
> > different
> > ways, that make a modular design better ?
> >
> Different platform has different hardware, for mt8192 only has three
> nodes. but mt8195 will has five nodes. and the clk/power/irq/iommu are
> different. It is not easy to manage all hardware at the same time in
> one node, need to enable different hardware at the same time, the logic
> will be very complex.
> It is much easier to handle different hardware using component, enable
> different hardware when we need it.
>
>

You can still have one device-tree node for each device, which means
you can still manage your resources (clk/power/irq/iommu) easily, but doing
this so that it avoids an async framework to pull the parts together.

I gave you this feedback several times, and you have been objecting it
every time  without even trying to consider a different approach.

Thanks,
Ezequiel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
