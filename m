Return-Path: <SRS0=UFSY=QB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D65C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Nov 2021 21:57:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAB1061104
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Nov 2021 21:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AAB1061104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vanguardiasur.com.ar
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D4VHfe4IXiq5ti0bckWCGoF81iGLh9EsTZ3GqOpsO/Y=; b=CDlcz6COJXixDP
	4WP6DjQPGJRv23DHOwN3U3aPs4YPcc6T6dJ5P7jZhvEW/KZOiERHyfeM9aU9h8GLwWrkjDxu2n7wx
	pppMIYwVjPQf9+7WjcL5O3RgfO6qJETMnhOx+RqZxaxG3zI4x1SaUk11jQNmh88KdFFcrBUbsZTFf
	bZy2J+coCJbtjlEPkWeCdf+RU5act4CIXS6pCWRhHB/QgQYrby9BT2K2C8pCxIrp19uVi6DDuPr7E
	DbYBwBB6uTFv3nXHpeZ0P4iTjKhbuEkSlecd9jwCb2gBC93utDo00cOEeP4ZOtdGtNQUJTt1LewJ9
	WjSAr8YZFu1vg+j904LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmNUe-00E6b7-5O; Sun, 14 Nov 2021 21:56:56 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmNUb-00E6Zg-0r
 for linux-mediatek@lists.infradead.org; Sun, 14 Nov 2021 21:56:55 +0000
Received: by mail-ed1-x52b.google.com with SMTP id r12so63054796edt.6
 for <linux-mediatek@lists.infradead.org>; Sun, 14 Nov 2021 13:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z+a45scJUghbWle9ZBsDg+s+2wzuH5GEQRWeFAD8t7E=;
 b=AKBJYmPfyiaYmwd7oyncnL6zw9NtPWAJSbT7wJ9CoM5XRX4y7lYR4azZmAWJhnkbx3
 wApEFEVRRFjCRlk8LcnF6jhjQwm5wv7r4B6Skyc7KmZmOOftQeLeqyS9W4PEM5aCIXOK
 3C2t8LKXJCZlA74FYaRzy+O2yuqZGrD9mvi+IO33lc7L6Yucfzu+gveGnyIDEh2HehQo
 GXFDuQDrEVz3+SlIQXV7z/Scjb381zZkmaPcGnIu7xzfs3l25xVRGofL7jjsWciVrfFx
 LQ7c+cenNltzXc/rnPZhVahuvpT8J2ioVmkhvGdpu+lB9nG1RnYh946IZT2OyC/m7P+O
 T77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z+a45scJUghbWle9ZBsDg+s+2wzuH5GEQRWeFAD8t7E=;
 b=TymhJp4E4iUYsQpHdgEfmEp7rGud9lIJ/TlBs7iZkY5/o8oc26PdzPbZE4JbxbpMmm
 IMbKuDyozcku43hMeQ2tkUuUMKt/XPHnjta3bGi4KKc1UGaY23vQrGVPVulsY5lCCToV
 +bV1HZ4CMYvkI32kdjz9Oc3l5i6ztev+3ePjrFPixuOJJV3G/NOpRJkasu+kKkMptCO7
 pxPN0ekNeCbunj2UMBRjVlJpm2IC80VPVrdpAuArlzbC1QspwTJEdN5I0QWsrEwTk0bV
 B37vD4+CYROGyLWYngP0oMjsFtysix3Ey94keGbQ98tRE9UfZQ5ciAzo9GptrY9y9Juc
 2Shg==
X-Gm-Message-State: AOAM533aI93d8Kh8xCBKB18nmq4wWxr3JJX3At36ERLT3DAOgVjV80Q4
 MMY7REi7mS5Syp/alc0gk49ArOtJEFSPce9GWRHbiA==
X-Google-Smtp-Source: ABdhPJyomQczgvwHG7w6id4jh3N0ebh0Ihr1LveJ55TvN/g341+OWtesIcRAQSmVB1tvezeAr3cMSOUbMM62omekLG0=
X-Received: by 2002:a05:6402:190d:: with SMTP id
 e13mr47552746edz.339.1636927009693; 
 Sun, 14 Nov 2021 13:56:49 -0800 (PST)
MIME-Version: 1.0
References: <20211111041500.17363-1-yunfei.dong@mediatek.com>
 <20211111041500.17363-16-yunfei.dong@mediatek.com>
In-Reply-To: <20211111041500.17363-16-yunfei.dong@mediatek.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sun, 14 Nov 2021 18:56:37 -0300
Message-ID: <CAAEAJfBWgP1fMsEQQEa=2Rk810oHzDo609TzicYgwPbU8AMunQ@mail.gmail.com>
Subject: Re: [PATCH v10, 15/19] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for mt8192
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>, Irui Wang <irui.wang@mediatek.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 srv_heupstream <srv_heupstream@mediatek.com>,
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 linux-media <linux-media@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211114_135653_077612_44C58A74 
X-CRM114-Status: GOOD (  21.47  )
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

Yunfei,

On Thu, 11 Nov 2021 at 01:15, Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> Adds decoder dt-bindings for mt8192.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 261 ++++++++++++++++++
>  1 file changed, 261 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> new file mode 100644
> index 000000000000..1886fae6e39d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> @@ -0,0 +1,261 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/media/mediatek,vcodec-subdev-decoder.yaml#"
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
> +  main and subdev device node.
> +
> +  About the Decoder Hardware Block Diagram, please check below:
> +
> +    +---------------------------------+------------------------------------+
> +    |                                 |                                    |
> +    | input -> lat HW -> lat buffer --|--> lat buffer -> core HW -> output
 |

To be completely honest, I can't really understand what is the meaning
of the blocks
with input -> lat hw -> lat buffer, and how this means lat- and core-
are children of some parent.

> +    |            ||                   |                     ||             |
> +    +------------||-------------------+---------------------||-------------+
> +                 ||       lat thread  |  core thread        ||     <parent>
> +    -------------||-----------------------------------------||----------------
> +                 ||                                         ||     <child>
> +                 \/ <----------------HW index-------------->\/
> +           +------------------------------------------------------+
> +           |                    enable/disable                    |
> +           |           clk     power    irq    iommu port         |
> +           |                 (lat/lat soc/core0/core1)            |
> +           +------------------------------------------------------+
> +
> +  As above, <parent> mean in main device, <child> mean in subdev device. The information
> +  of each hardware will be stored in subdev device. There are two workqueues in main device:
> +  lat and core. Enable/disable the lat clk/power/irq when lat need to work through hardware
> +  index, core is the same.
> +
> +  Normally the smi common may not the same for each hardware, can't combine all hardware in
> +  one node, or leading to iommu fault when access dram data.
> +

To what extent the lat- and core- devices are really "children"
or "subdevices" of the  video-codec@16000000 device?

I.e. what resources do they share? What are the details of
their bus topology?

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/memory/mt8192-larb-port.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/mt8192-clk.h>
> +    #include <dt-bindings/power/mt8192-power.h>
> +
> +    video-codec@16000000 {
> +        compatible = "mediatek,mt8192-vcodec-dec";
> +        reg = <0x16000000 0x1000>;             /* VDEC_SYS */
> +        mediatek,scp = <&scp>;
> +        iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
> +        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +        vcodec-lat@16010000 {
> +            compatible = "mediatek,mtk-vcodec-lat";
> +            reg = <0x16010000 0x800>;
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
> +            clock-names = "sel", "soc-vdec", "soc-lat", "vdec", "top";
> +            assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> +            assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
> +            power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
> +        };
> +
> +        vcodec-core@16025000 {
> +            compatible = "mediatek,mtk-vcodec-core";
> +            reg = <0x16025000 0x1000>;

The children address space might need some thinking.
In other words,

video-codec@16000000 {

  vcodec-lat@16010000 {
  }

  vcodec-core@16025000 {
  }
}

Your proposal has vcodec-lat as children of video-codec, but its address space
are really on the same level, instead of children being contained in
the parent address space:

video-codec@16000000 {

  vcodec-lat@10000 {
  }

  vcodec-core@25000 {
  }
}

I think this last tree makes more sense from a device-tree point of view.
The ranges property allows you to put the right translation information,
so the device driver itself will get the correct address 0x16000000 + 0x25000.

You might find that the ranges property is tricky to understand at first.

Thanks,
Ezequiel


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
> +            clock-names = "sel", "soc-vdec", "soc-lat", "vdec", "top";
> +            assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> +            assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
> +            power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
> +        };
> +    };
> --
> 2.25.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
