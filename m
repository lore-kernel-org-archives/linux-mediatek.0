Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE239C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Dec 2022 23:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cEYS3+SeMpcBY4O/Wjc+N2LOG79qPTE7AugfR9b27QU=; b=RrPfWhHnGDoI8GNEZgxmTPb29j
	jYRvsqxAB6KZ41d8HgNB+N71//PnNLpj3Ga7GPkfkIEs8Opx/BS4ADSL2WZONVPKoUg4L2OsemLFx
	UHpMsu0zAuFcFJ+nEXuGr2t7F4z87oCXnxZ8SoMN91cAbCU+fLDr9teKTUx4SanpYhuvQFvFhay5P
	hHMn0SxdwMrTCnrvQlVFXCpQ7juPShzs+lghSBhn/D5fRCDy5mu/B73ds1xta+zf6DsjSv8GFOGhm
	zavafUYv2EaJS2OC3AtoPOVEdNfNdtsBz9zDaM7GqrWipqTEkszx8ivvZ2v3bwkCWCopAjnHrp5Oz
	MahU7O+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9wpe-008Epw-N1; Mon, 26 Dec 2022 23:24:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9wpM-008ElP-Rc; Mon, 26 Dec 2022 23:24:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 28057B80DDA;
	Mon, 26 Dec 2022 23:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D06C433F0;
	Mon, 26 Dec 2022 23:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672097053;
	bh=v6viXWqJLtgdVCsT8WioCv141t0R7HSm3K+PSsKwpaw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GK0epgS1Ers4zbwL57238/q9L+oyQtrMSw/KZJ4fA4lQKommEoZqUDp1Rpbbh75JM
	 PU2TLmkJD8UYwSkE4L8zRqdS5a6wHj8LVu/0C8WFEwX8lJxqltylq6mUUGr1sisbii
	 L2cEJVpHfeO6a9G2U4S80eUU5LJMld3+pk4oq2VFEi8YALgn2AJo+Cnv+gSbqHzhRB
	 TrROC6oGiaBRBAL0pvzLHBJjo2LAS1BxDizT6JaCc7b64/4mC7mI2Xive3jQfhtjcb
	 uJUpjJJ+Sd47SaXvE4fmc/ZB840wc4AITArd39mjFwfb7Ui8YDdxE4dTH1Q0V2A2rG
	 0SspRME1BPi3w==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-14fe0e9ed11so4051217fac.2;
        Mon, 26 Dec 2022 15:24:13 -0800 (PST)
X-Gm-Message-State: AFqh2kodP25h/c0QfzDhpO4LdXXr0t3ZlcCUuj9urYUbu7zScvPBR/wt
	Kbfm84P9U6qvj5ZmVtsRiamM+riI7HJF9w52lg==
X-Google-Smtp-Source: AMrXdXsHnWvDat7uvkQgV/C1gjXoyop6LVYr8CKo/bj64WxskbyZPKTkitNcv+cfe0/msG1fTgxhY+2Epr2yzkSFGlI=
X-Received: by 2002:a05:6870:5312:b0:14f:97f2:1717 with SMTP id
 j18-20020a056870531200b0014f97f21717mr666516oan.69.1672097052981; Mon, 26 Dec
 2022 15:24:12 -0800 (PST)
MIME-Version: 1.0
References: <1666577099-3859-1-git-send-email-xinlei.lee@mediatek.com> <1666577099-3859-4-git-send-email-xinlei.lee@mediatek.com>
In-Reply-To: <1666577099-3859-4-git-send-email-xinlei.lee@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 27 Dec 2022 07:24:02 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-zjX7ZJrwm_BsoFZcqfGW5+P7G_bgn1VrK0i3VLptvvg@mail.gmail.com>
Message-ID: <CAAOTY_-zjX7ZJrwm_BsoFZcqfGW5+P7G_bgn1VrK0i3VLptvvg@mail.gmail.com>
Subject: Re: [PATCH v13,3/3] drm: mediatek: Add mt8186 dpi compatibles and
 platform data
To: xinlei.lee@mediatek.com
Cc: matthias.bgg@gmail.com, rex-bc.chen@mediatek.com, 
	angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com, 
	nfraprado@collabora.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
	airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_152417_242161_62549610 
X-CRM114-Status: GOOD (  15.14  )
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

<xinlei.lee@mediatek.com> =E6=96=BC 2022=E5=B9=B410=E6=9C=8824=E6=97=A5 =E9=
=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=8810:05=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: Xinlei Lee <xinlei.lee@mediatek.com>
>
> Add the compatible because use edge_cfg_in_mmsys in mt8186.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c     | 21 +++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c |  2 ++
>  2 files changed, 23 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index ad87ecddf58d..325032fd5343 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -941,6 +941,24 @@ static const struct mtk_dpi_conf mt8183_conf =3D {
>         .csc_enable_bit =3D CSC_ENABLE,
>  };
>
> +static const struct mtk_dpi_conf mt8186_conf =3D {
> +       .cal_factor =3D mt8183_calculate_factor,
> +       .reg_h_fre_con =3D 0xe0,
> +       .max_clock_khz =3D 150000,
> +       .output_fmts =3D mt8183_output_fmts,
> +       .num_output_fmts =3D ARRAY_SIZE(mt8183_output_fmts),
> +       .edge_cfg_in_mmsys =3D true,
> +       .pixels_per_iter =3D 1,
> +       .is_ck_de_pol =3D true,
> +       .swap_input_support =3D true,
> +       .support_direct_pin =3D true,
> +       .dimension_mask =3D HPW_MASK,
> +       .hvsize_mask =3D HSIZE_MASK,
> +       .channel_swap_shift =3D CH_SWAP,
> +       .yuv422_en_bit =3D YUV422_EN,
> +       .csc_enable_bit =3D CSC_ENABLE,
> +};
> +
>  static const struct mtk_dpi_conf mt8192_conf =3D {
>         .cal_factor =3D mt8183_calculate_factor,
>         .reg_h_fre_con =3D 0xe0,
> @@ -1091,6 +1109,9 @@ static const struct of_device_id mtk_dpi_of_ids[] =
=3D {
>         { .compatible =3D "mediatek,mt8183-dpi",
>           .data =3D &mt8183_conf,
>         },
> +       { .compatible =3D "mediatek,mt8186-dpi",
> +         .data =3D &mt8186_conf,
> +       },
>         { .compatible =3D "mediatek,mt8192-dpi",
>           .data =3D &mt8192_conf,
>         },
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 546b79412815..3d32fbc66ac1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -646,6 +646,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[=
] =3D {
>           .data =3D (void *)MTK_DPI },
>         { .compatible =3D "mediatek,mt8183-dpi",
>           .data =3D (void *)MTK_DPI },
> +       { .compatible =3D "mediatek,mt8186-dpi",
> +         .data =3D (void *)MTK_DPI },
>         { .compatible =3D "mediatek,mt8192-dpi",
>           .data =3D (void *)MTK_DPI },
>         { .compatible =3D "mediatek,mt8195-dp-intf",
> --
> 2.18.0
>

