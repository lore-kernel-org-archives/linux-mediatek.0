Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B51C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 09:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dI1tKCG644Qtf5LntQ1LK72Maeql6LrYPDDFsKa9Kfk=; b=m7cYNI0ynPqEdK0atxVFYzKp9u
	KeWNcJzJ4NFJASsA6j/1Q0aehMcGcOJxHl1Odf7BgTadnEd6OiGOHboeK3HwnYAhCq9Ly4kHMTZm+
	opQRb+J8zAzmPlGJFYpo0CUizGFM2VFR+2bQ/qCXXOvW8tZeYX8OIS/UEcok23/ogczUv7QXhKvJN
	z6L36+QuXPXyilJ3K6j08bboBBW2Fk5M5RoY/QWKzXldJg2dmC3MdkDZMqTkiot6kaPEyDQsBotG0
	t7bAZR0rkHikqvbQIANVSrXZo28ggSc0rPjYdb+S0AWHH7FboTv25njiwWFKLn5UI5N8R55eIckr2
	ipCXCiyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7DQM-003yQK-JS; Fri, 01 Jul 2022 09:58:54 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7DQB-003yJx-9F
	for linux-mediatek@lists.infradead.org; Fri, 01 Jul 2022 09:58:44 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-31c1d580e4bso18576537b3.3
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Jul 2022 02:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dI1tKCG644Qtf5LntQ1LK72Maeql6LrYPDDFsKa9Kfk=;
        b=ih6uUxJfo8YJ/xXLIZzLhzeMfMKi+SRTBsaKFKc7Z2Gbc4LAZtWtojXTnfkjBR46o3
         fPrqefwqXLU4ITauDJZmBx5/3sg2HdGnkNQNcZM+jZ2Hl8UmZl1VFSMPM7TlD1FUB6F/
         19tkUcC9xzeL1fOqBK9OjDbf3q2xP0OonEzoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dI1tKCG644Qtf5LntQ1LK72Maeql6LrYPDDFsKa9Kfk=;
        b=i0nsk9Ei8Z5J8NjsSlv5aQyH4y5uPXts7FTQGi5vFELCIKfX3WJ/U04wspKwVI212H
         z6AH8Uk+u8HI1u8N9SMabHS8j+W3R0bkO1h2vdaftEqC6n+++oOn0ylFtklfNgXWXY83
         b2VwtNYRwy+pdAAMRwQIfaNZ0pT1rQgWnXbUi/sXcbd87t9i9lbwu3ndP9CeYgfEqKfP
         XN/JaWtTBn29uFkxqLCH4jBEBgjwcqLIOroGtfugew1Aj3MmV4GvU4AYf6bA5kKMQ5HX
         xshyaEX19hHjNDbeqZZyKcrzDNCJ6nsa9fhVUtqycnpnP4wdhtEiQa4UeCv5vIGbHq2T
         zSyQ==
X-Gm-Message-State: AJIora/TzzWo68zQ2UaqLYcMmNSpwasLPtf3NhRqEBFV9rOlS8Z72od/
	QLDztp4GFettwUt4t5cov0uKAZGopCSt+Iu+8bjhIw==
X-Google-Smtp-Source: AGRyM1uMYF5aMdLc4pr9cq9nWKk1j3E3Jn6EiTDtabFYLwv3IbGN1vatZaX1epvXyaSslqTAx13hROWNtucbivHxe8o=
X-Received: by 2002:a0d:ff02:0:b0:318:41fd:6b1f with SMTP id
 p2-20020a0dff02000000b0031841fd6b1fmr15083848ywf.354.1656669520663; Fri, 01
 Jul 2022 02:58:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220701090547.21429-1-allen-kh.cheng@mediatek.com> <20220701090547.21429-7-allen-kh.cheng@mediatek.com>
In-Reply-To: <20220701090547.21429-7-allen-kh.cheng@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 1 Jul 2022 17:58:29 +0800
Message-ID: <CAGXv+5Hp87TPasfD1Jx8bsVu9ApF7rsPkXHNb92aH65ny=pajA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] arm64: dts: mt8192: Add vcodec lat and core nodes
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_025843_438102_98A45A9E 
X-CRM114-Status: GOOD (  16.00  )
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

On Fri, Jul 1, 2022 at 5:06 PM Allen-KH Cheng
<allen-kh.cheng@mediatek.com> wrote:
>
> Add vcodec lat and core nodes for mt8192 SoC.
>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 60 ++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8192.dtsi
> index 6d9164b47bd1..2a1ad3084a01 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1437,6 +1437,66 @@
>                         power-domains =3D <&spm MT8192_POWER_DOMAIN_ISP2>=
;
>                 };
>
> +               vcodec_dec: vcodec-dec@16000000 {
> +                       compatible =3D "mediatek,mt8192-vcodec-dec";
> +                       reg =3D <0 0x16000000 0 0x1000>;
> +                       mediatek,scp =3D <&scp>;
> +                       iommus =3D <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
> +                       dma-ranges =3D <0x1 0x0 0x0 0x40000000 0x0 0xfff0=
0000>;
> +                       #address-cells =3D <2>;
> +                       #size-cells =3D <2>;
> +                       ranges =3D <0 0 0 0x16000000 0 0x26000>;
> +
> +                       vcodec_lat: vcodec-lat@10000 {
> +                               compatible =3D "mediatek,mtk-vcodec-lat";
> +                               reg =3D <0x0 0x10000 0 0x800>;
> +                               interrupts =3D <GIC_SPI 426 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               iommus =3D <&iommu0 M4U_PORT_L5_VDEC_LAT0=
_VLD_EXT>,
> +                                        <&iommu0 M4U_PORT_L5_VDEC_LAT0_V=
LD2_EXT>,
> +                                        <&iommu0 M4U_PORT_L5_VDEC_LAT0_A=
VC_MV_EXT>,
> +                                        <&iommu0 M4U_PORT_L5_VDEC_LAT0_P=
RED_RD_EXT>,
> +                                        <&iommu0 M4U_PORT_L5_VDEC_LAT0_T=
ILE_EXT>,
> +                                        <&iommu0 M4U_PORT_L5_VDEC_LAT0_W=
DMA_EXT>,
> +                                        <&iommu0 M4U_PORT_L5_VDEC_LAT0_R=
G_CTRL_DMA_EXT>,
> +                                        <&iommu0 M4U_PORT_L5_VDEC_UFO_EN=
C_EXT>;
> +                               clocks =3D <&topckgen CLK_TOP_VDEC_SEL>,
> +                                        <&vdecsys_soc CLK_VDEC_SOC_VDEC>=
,
> +                                        <&vdecsys_soc CLK_VDEC_SOC_LAT>,
> +                                        <&vdecsys_soc CLK_VDEC_SOC_LARB1=
>,
> +                                        <&topckgen CLK_TOP_MAINPLL_D4>;
> +                               clock-names =3D "sel", "soc-vdec", "soc-l=
at", "vdec", "top";

sel and top don't make sense. You should not be referencing upper level
clocks.

CLK_VDEC_SOC_LARB1 doesn't make a lot of sense either, since that should
be referenced in the larb. Unless if the clock doesn't get turned on when
the IOMMU is bypassed.

Last, would it work if lat only referenced CLK_VDEC_SOC_LAT, and core only
referenced CLK_VDEC_SOC_VDEC?


Thanks
ChenYu

> +                               assigned-clocks =3D <&topckgen CLK_TOP_VD=
EC_SEL>;
> +                               assigned-clock-parents =3D <&topckgen CLK=
_TOP_MAINPLL_D4>;
> +                               power-domains =3D <&spm MT8192_POWER_DOMA=
IN_VDEC>;
> +                       };
> +
> +                       vcodec_core: vcodec-core@25000 {
> +                               compatible =3D "mediatek,mtk-vcodec-core"=
;
> +                               reg =3D <0 0x25000 0 0x1000>;
> +                               interrupts =3D <GIC_SPI 425 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               iommus =3D <&iommu0 M4U_PORT_L4_VDEC_MC_E=
XT>,
> +                                        <&iommu0 M4U_PORT_L4_VDEC_UFO_EX=
T>,
> +                                        <&iommu0 M4U_PORT_L4_VDEC_PP_EXT=
>,
> +                                        <&iommu0 M4U_PORT_L4_VDEC_PRED_R=
D_EXT>,
> +                                        <&iommu0 M4U_PORT_L4_VDEC_PRED_W=
R_EXT>,
> +                                        <&iommu0 M4U_PORT_L4_VDEC_PPWRAP=
_EXT>,
> +                                        <&iommu0 M4U_PORT_L4_VDEC_TILE_E=
XT>,
> +                                        <&iommu0 M4U_PORT_L4_VDEC_VLD_EX=
T>,
> +                                        <&iommu0 M4U_PORT_L4_VDEC_VLD2_E=
XT>,
> +                                        <&iommu0 M4U_PORT_L4_VDEC_AVC_MV=
_EXT>,
> +                                        <&iommu0 M4U_PORT_L4_VDEC_RG_CTR=
L_DMA_EXT>;
> +                               clocks =3D <&topckgen CLK_TOP_VDEC_SEL>,
> +                                        <&vdecsys CLK_VDEC_VDEC>,
> +                                        <&vdecsys CLK_VDEC_LAT>,
> +                                        <&vdecsys CLK_VDEC_LARB1>,
> +                                        <&topckgen CLK_TOP_MAINPLL_D4>;
> +                               clock-names =3D "sel", "soc-vdec", "soc-l=
at", "vdec", "top";
> +                               assigned-clocks =3D <&topckgen CLK_TOP_VD=
EC_SEL>;
> +                               assigned-clock-parents =3D <&topckgen CLK=
_TOP_MAINPLL_D4>;
> +                               power-domains =3D <&spm MT8192_POWER_DOMA=
IN_VDEC2>;
> +                       };
> +               };
> +
>                 larb5: larb@1600d000 {
>                         compatible =3D "mediatek,mt8192-smi-larb";
>                         reg =3D <0 0x1600d000 0 0x1000>;
> --
> 2.18.0
>

