Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015EFC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Nov 2022 15:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eo1RIqpq3+5pHhNWP701dHJu3bs8+yJk60MclGeBWP0=; b=bhtuQWOgaQT1ONUzx8wr42X3sh
	VCUY5vuysoocQfiD0/LZ/F98FqMHTj+zP3QcEkDleQjZwavD+MmI2Yp3DpwpQVpyWuF7A1Rm69weL
	e9Af57sCoJlm+eoI28/iIlENPjyIs8wEkN1iTGO1qEDNM328Vrppf5QR7oZaGJN/qWdpFASzMcZlF
	uLMSt1XT9ejY27wwCWRleeC0/dBF0DV4lY/vZz1723vtVF94IIgRw7OWi4N00WVI5gxpXRcJqDsPK
	0kdQBRIOce+mzxKTYVPJOkqyJDhwrfr4/m9+TC9lMH40PbrDv9XwrXtCKS5GbFueiaWOVaoWRxqM6
	n+o8qGlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxrdS-000PZB-Mf; Wed, 23 Nov 2022 15:26:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxrcy-000PRn-Oy; Wed, 23 Nov 2022 15:25:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9413F61C67;
	Wed, 23 Nov 2022 15:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 012D1C4347C;
	Wed, 23 Nov 2022 15:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669217131;
	bh=RtxS3m8RidOG39tfzw7d4tVjWi8ImaOggtUBMDmGKOk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oSorEMc2dHiBGtYNXsHTl12w2fVInFgukQW47xG4DnuHpRzcTKx1etSLqVxA6vqSA
	 TDUM6TIDXCPOGEYOUegUztFeCKhCJ7D5AB2WLgvgQodZZxcw43EahjgiLYwJ23PhzV
	 HC0Yl39AFe2iVN2gziTKruIIV3fHzFv+xMkdDDtuZfXPSZFCi1nyIvlz9AgCAxDj2E
	 XSJioyc4k1+SagJVRkJJCkI4kF7ylP/mm8UJnqeJmbiXAUQBPfHKI6Rq/2EybrwxQf
	 ijVZsNtZnWCo3Hc+gUdfTK04/8uswxdt+DilpEgrCSLJ3OAf643WTsZu1vnKRg4xxv
	 th7OBfjaluPoQ==
Received: by mail-ot1-f53.google.com with SMTP id db10-20020a0568306b0a00b0066d43e80118so11428225otb.1;
        Wed, 23 Nov 2022 07:25:30 -0800 (PST)
X-Gm-Message-State: ANoB5pnj/DgyNIFSBGS42F1eT5C3CNm0OgfwQ6jIUnQR+FZTpxiNS01U
	fsIW8X1B0/AKeHncBOA/MIRfXIzpn3RCYhgAIw==
X-Google-Smtp-Source: AA0mqf49fnswLYy6SsiK1Ro9HFjY4CW9aK/5sATEF6GPDJi3Wc2i0C/TiO825btUhwszzmrdBBQ9RzCdpGxBDCNpAIY=
X-Received: by 2002:a05:6830:d87:b0:66d:8b98:683f with SMTP id
 bv7-20020a0568300d8700b0066d8b98683fmr15490045otb.40.1669217130091; Wed, 23
 Nov 2022 07:25:30 -0800 (PST)
MIME-Version: 1.0
References: <1666266353-16670-1-git-send-email-xinlei.lee@mediatek.com> <1666266353-16670-3-git-send-email-xinlei.lee@mediatek.com>
In-Reply-To: <1666266353-16670-3-git-send-email-xinlei.lee@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 23 Nov 2022 23:25:19 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9+VWN3S3=BRMXaEf5A5G_AVaDa=V2v3AVXT=3O-DrJEQ@mail.gmail.com>
Message-ID: <CAAOTY_9+VWN3S3=BRMXaEf5A5G_AVaDa=V2v3AVXT=3O-DrJEQ@mail.gmail.com>
Subject: Re: [PATCH v2,2/2] drm: mediatek: Add mt8188 dpi compatibles and
 platform data
To: xinlei.lee@mediatek.com
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie, 
	daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_072532_911056_7113D2FE 
X-CRM114-Status: GOOD (  16.30  )
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

Hi, Xinlei:

<xinlei.lee@mediatek.com> =E6=96=BC 2022=E5=B9=B410=E6=9C=8820=E6=97=A5 =E9=
=80=B1=E5=9B=9B =E6=99=9A=E4=B8=8A7:46=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: xinlei lee <xinlei.lee@mediatek.com>
>
> For MT8188, the vdosys0 only supports 1T1P mode, so we need to add the co=
mpatible for mt8188 edp-intf.

For this series, applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

>
> Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c     | 17 +++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c |  2 ++
>  2 files changed, 19 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 508a6d9..02c2a00 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -929,6 +929,20 @@ static const struct mtk_dpi_conf mt8183_conf =3D {
>         .csc_enable_bit =3D CSC_ENABLE,
>  };
>
> +static const struct mtk_dpi_conf mt8188_dpintf_conf =3D {
> +       .cal_factor =3D mt8195_dpintf_calculate_factor,
> +       .max_clock_khz =3D 600000,
> +       .output_fmts =3D mt8195_output_fmts,
> +       .num_output_fmts =3D ARRAY_SIZE(mt8195_output_fmts),
> +       .pixels_per_iter =3D 4,
> +       .input_2pixel =3D false,
> +       .dimension_mask =3D DPINTF_HPW_MASK,
> +       .hvsize_mask =3D DPINTF_HSIZE_MASK,
> +       .channel_swap_shift =3D DPINTF_CH_SWAP,
> +       .yuv422_en_bit =3D DPINTF_YUV422_EN,
> +       .csc_enable_bit =3D DPINTF_CSC_ENABLE,
> +};
> +
>  static const struct mtk_dpi_conf mt8192_conf =3D {
>         .cal_factor =3D mt8183_calculate_factor,
>         .reg_h_fre_con =3D 0xe0,
> @@ -1079,6 +1093,9 @@ static const struct of_device_id mtk_dpi_of_ids[] =
=3D {
>         { .compatible =3D "mediatek,mt8183-dpi",
>           .data =3D &mt8183_conf,
>         },
> +       { .compatible =3D "mediatek,mt8188-dp-intf",
> +         .data =3D &mt8188_dpintf_conf,
> +       },
>         { .compatible =3D "mediatek,mt8192-dpi",
>           .data =3D &mt8192_conf,
>         },
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 91f58db..950bd04 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -631,6 +631,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[=
] =3D {
>           .data =3D (void *)MTK_DPI },
>         { .compatible =3D "mediatek,mt8183-dpi",
>           .data =3D (void *)MTK_DPI },
> +       { .compatible =3D "mediatek,mt8188-dp-intf",
> +         .data =3D (void *)MTK_DP_INTF },
>         { .compatible =3D "mediatek,mt8192-dpi",
>           .data =3D (void *)MTK_DPI },
>         { .compatible =3D "mediatek,mt8195-dp-intf",
> --
> 2.6.4
>

