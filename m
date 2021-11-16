Return-Path: <SRS0=fhAu=QD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C47BC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 12:05:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0156761414
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 12:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0156761414
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r/9vXjUHMho/HZAU9vXK/bXAcyad61+1m3Nmktx47ow=; b=dyUQjoAeiMQ3vo
	MxnW4quCb7cxGAqRhK6wwqwSkeNRzlCxcElqhDH1ohhMR/BOTCGHX0JkmE7yZ3NVijZVNPVzVdTlw
	7QULIpqvEdc/aDhtYeCACcQm2MvSwePqOSZELW9q7RQCfgmQsD9j3HVMyCi5pD2duqZhBCNOC4xsn
	J+W6zN77AeAQkXmTeupL83mPvFT2O148t9TH+lKIpSlvK+NMKZ82LozHuvvPhFy/LaYRuTGLvKcik
	Av0+P5kJn1YyfG4OyD1vfvOkh6XlSNt3H/LAIEOVKEKM3iwu77l67Tgww9toYtUWiTwThaLSYAPw4
	PtFtxFbTw0UsSzO2iiLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmxD8-001dwV-GA; Tue, 16 Nov 2021 12:05:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmxD4-001duj-Lg; Tue, 16 Nov 2021 12:05:12 +0000
X-UUID: 2528020115b7496e83f66597b5da079d-20211116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Ya/WGYXOkqE+jebPD6tyVEujeE5LL4XzlDlRj81I3bc=; 
 b=jhwr1SRtfN7Sk6zD2Axv0oZOIm74aUL5L7Su/w3iLLVVPpjAn4/qd8WtWEUiT1LFeJt4lsZPMSaBvXo0Q/YeGv76e8o/k/iH6R/+FlogbAywSN9O2pfux7ICUwGONC19ZBGHpRolfkpGfIxaR2p3OfJEMIOWarvyl2NC1n3wBnQ=;
X-UUID: 2528020115b7496e83f66597b5da079d-20211116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 229469514; Tue, 16 Nov 2021 05:05:08 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Nov 2021 04:05:06 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 16 Nov 2021 20:05:05 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Nov 2021 20:05:03 +0800
Message-ID: <bf72f620071c3bfe7c3dea3eec6464afce3e7f4f.camel@mediatek.com>
Subject: Re: [PATCH v10, 15/19] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for mt8192
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
CC: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Irui Wang <irui.wang@mediatek.com>, "Benjamin
 Gaignard" <benjamin.gaignard@collabora.com>, srv_heupstream
 <srv_heupstream@mediatek.com>, devicetree <devicetree@vger.kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "Hsin-Yi
 Wang" <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, "Dafna
 Hirschfeld" <dafna.hirschfeld@collabora.com>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, linux-media
 <linux-media@vger.kernel.org>
Date: Tue, 16 Nov 2021 20:05:03 +0800
In-Reply-To: <CAAEAJfBWgP1fMsEQQEa=2Rk810oHzDo609TzicYgwPbU8AMunQ@mail.gmail.com>
References: <20211111041500.17363-1-yunfei.dong@mediatek.com>
 <20211111041500.17363-16-yunfei.dong@mediatek.com>
 <CAAEAJfBWgP1fMsEQQEa=2Rk810oHzDo609TzicYgwPbU8AMunQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_040510_750763_2D64AA37 
X-CRM114-Status: GOOD (  34.69  )
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

Hi Ezequiel,

Thanks for your suggestion.
On Sun, 2021-11-14 at 18:56 -0300, Ezequiel Garcia wrote:
> Yunfei,
> 
> On Thu, 11 Nov 2021 at 01:15, Yunfei Dong <yunfei.dong@mediatek.com>
> wrote:
> > 
> > Adds decoder dt-bindings for mt8192.
> > 
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> >  .../media/mediatek,vcodec-subdev-decoder.yaml | 261
> > ++++++++++++++++++
> >  1 file changed, 261 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-
> > decoder.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-
> > decoder.yaml
> > b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-
> > decoder.yaml
> > new file mode 100644
> > index 000000000000..1886fae6e39d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > subdev-decoder.yaml
> > @@ -0,0 +1,261 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +
> > +%YAML 1.2
> > +---
> > +$id: "
> > http://devicetree.org/schemas/media/mediatek,vcodec-subdev-decoder.yaml#
> > "
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Mediatek Video Decode Accelerator With Multi Hardware
> > +
> > +maintainers:
> > +  - Yunfei Dong <yunfei.dong@mediatek.com>
> > +
> > +description: |
> > +  Mediatek Video Decode is the video decode hardware present in
> > Mediatek
> > +  SoCs which supports high resolution decoding functionalities.
> > Required
> > +  main and subdev device node.
> > +
> > +  About the Decoder Hardware Block Diagram, please check below:
> > +
> > +    +---------------------------------+---------------------------
> > ---------+
> > +    |                                 |                           
> >          |
> > +    | input -> lat HW -> lat buffer --|--> lat buffer -> core HW
> > -> output
> 
>  |
> 
> To be completely honest, I can't really understand what is the
> meaning
> of the blocks
> with input -> lat hw -> lat buffer, and how this means lat- and core-
> are children of some parent.
> 
I will add more detail information as below:
The block diagram is data flow, need two or more hardwares to decode
for each picture. input is input bitstream, lat hardware need input
bitstream and lat buffer to decode, will write temp information to lat
buffer when lat decode done. lat buffer is used to share lat buffer
information for lat hardware and core hardware. core hardware need
frame buffer and lat buffer to decode, will write decode result to
frame buffer.

> > +    |            ||                   |                     ||    
> >          |
> > +    +------------||-------------------+---------------------||--
> > -----------+
> > +                 ||       lat thread  |  core
> > thread        ||     <parent>
> > +    -------------||-----------------------------------------||--
> > --------------
> > +                 ||                                         ||    
> >  <child>
> > +                 \/ <----------------HW index-------------->\/
> > +           +----------------------------------------------------
> > --+
> > +           |                    enable/disable                    
> > |
> > +           |           clk     power    irq    iommu
> > port         |
> > +           |                 (lat/lat
> > soc/core0/core1)            |
> > +           +----------------------------------------------------
> > --+
> > +
> > +  As above, <parent> mean in main device, <child> mean in subdev
> > device. The information
> > +  of each hardware will be stored in subdev device. There are two
> > workqueues in main device:
> > +  lat and core. Enable/disable the lat clk/power/irq when lat need
> > to work through hardware
> > +  index, core is the same.
> > +
> > +  Normally the smi common may not the same for each hardware,
> > can't combine all hardware in
> > +  one node, or leading to iommu fault when access dram data.
> > +
> 
There are one parent node, regards it as main device, each child node
as subdevices, one child node mean one hardware.

There are two work queues in main device used for lat and core hardware
to decode.

The information of each hardware will be stored in subdevices.
Enable/disable the lat clk/power/irq when hardware need to work.
> To what extent the lat- and core- devices are really "children"
> or "subdevices" of the  video-codec@16000000 device?
> 
> I.e. what resources do they share? What are the details of
> their bus topology?
> 
The hardware is really very simple, just enable it to work when needed.
But each hardware isn't independent, need lat and core to decode for
every picture. No complex bus topology.
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/memory/mt8192-larb-port.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/clock/mt8192-clk.h>
> > +    #include <dt-bindings/power/mt8192-power.h>
> > +
> > +    video-codec@16000000 {
> > +        compatible = "mediatek,mt8192-vcodec-dec";
> > +        reg = <0x16000000 0x1000>;             /* VDEC_SYS */
> > +        mediatek,scp = <&scp>;
> > +        iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
> > +        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +        ranges;
> > +        vcodec-lat@16010000 {
> > +            compatible = "mediatek,mtk-vcodec-lat";
> > +            reg = <0x16010000 0x800>;
> > +            interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
> > +            iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
> > +                <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
> > +                <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
> > +                <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
> > +                <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
> > +                <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
> > +                <&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
> > +                <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
> > +            clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> > +                <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
> > +                <&vdecsys_soc CLK_VDEC_SOC_LAT>,
> > +                <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
> > +                <&topckgen CLK_TOP_MAINPLL_D4>;
> > +            clock-names = "sel", "soc-vdec", "soc-lat", "vdec",
> > "top";
> > +            assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> > +            assigned-clock-parents = <&topckgen
> > CLK_TOP_MAINPLL_D4>;
> > +            power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
> > +        };
> > +
> > +        vcodec-core@16025000 {
> > +            compatible = "mediatek,mtk-vcodec-core";
> > +            reg = <0x16025000 0x1000>;
> 
> The children address space might need some thinking.
> In other words,
> 
> video-codec@16000000 {
> 
>   vcodec-lat@16010000 {
>   }
> 
>   vcodec-core@16025000 {
>   }
> }
> 
> Your proposal has vcodec-lat as children of video-codec, but its
> address space
> are really on the same level, instead of children being contained in
> the parent address space:
> 
> video-codec@16000000 {
> 
>   vcodec-lat@10000 {
>   }
> 
>   vcodec-core@25000 {
>   }
> }
> 

yes, I will try to fix the dtsi as: vcodec-lat@10000, if it looks much
more reasonable.
> I think this last tree makes more sense from a device-tree point of
> view.
> The ranges property allows you to put the right translation
> information,
> so the device driver itself will get the correct address 0x16000000 +
> 0x25000.
> 
> You might find that the ranges property is tricky to understand at
> first.
> 
> Thanks,
> Ezequiel
> 
Hope to get your feedback.

Thanks,
Yunfei Dong
> 
> > +            interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
> > +            iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
> > +                <&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
> > +                <&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,
> > +                <&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
> > +                <&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
> > +                <&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
> > +                <&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
> > +                <&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
> > +                <&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
> > +                <&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
> > +                <&iommu0 M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
> > +            clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> > +                <&vdecsys CLK_VDEC_VDEC>,
> > +                <&vdecsys CLK_VDEC_LAT>,
> > +                <&vdecsys CLK_VDEC_LARB1>,
> > +                <&topckgen CLK_TOP_MAINPLL_D4>;
> > +            clock-names = "sel", "soc-vdec", "soc-lat", "vdec",
> > "top";
> > +            assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> > +            assigned-clock-parents = <&topckgen
> > CLK_TOP_MAINPLL_D4>;
> > +            power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
> > +        };
> > +    };
> > --
> > 2.25.1
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
