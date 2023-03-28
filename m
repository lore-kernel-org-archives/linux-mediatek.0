Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64200C76195
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 00:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ur7NIQoa070I3QbTGHVSJTh/lYDXQH2ttPIVgZAO/N0=; b=IcZqKkvCyOxtkci8I1PoZsP4Pb
	vwFX34cWGMsD3Sx1HxlzDhRaPw0HfEmZi9EP4x5sFnX/E7PozspO9+01827piZe0J8WTnCOvkq9hB
	R+YKX0Xx5gXi8YPFDZic6JaF0cUA8hN0wTZk9CiFA8rNQdPJwbcUvKnSLJoK9MydZGOVgbSzsjvM4
	Y6LT8pSH74TNyQY30S80E3VdieoGoR8Uu8KPlwDYacad9sR26hflveHKGoqpGN1SPePl8itWkDAWo
	NyBpCsnB00b2VOjv9fvZ3KqEZR6Kn6X8BqFyuNwKR5qYTIo4NoCycYKCO/XNZdW+x3/0iWW7TkcDl
	8Wsf7Ndg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgwtY-00ChHg-2F;
	Tue, 28 Mar 2023 00:09:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgwtV-00ChGp-1V;
	Tue, 28 Mar 2023 00:08:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E55AFB80D20;
	Tue, 28 Mar 2023 00:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B06BCC433EF;
	Tue, 28 Mar 2023 00:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679962134;
	bh=a31qX3NPls8wS2xJkkUjJbLbCkTAHR0yJQrhzHN95uQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ELOsIYVzr3dlf8MLwTWo+T+RusazaiiuHRDol9TXBh4fbDBJK+GNKWSE1LC+/9VrM
	 LcCcltI4oWxtVPZJ+HtgeZC1BIPt6LaYnTOJ7R1PuRJ3wDbEoB6LBpC63d+Y+EXcdE
	 U5TX5gYCtIYzDN7fyYckFePfFs8o+MmVxwC2G/wh/ZQmOZmYCPhhFjdg4l3DH6dEqB
	 POOznS6kg0BqdLl4BzSP7W2+B1DrlMUMF9ChcjpLb1BAqYIixadQNsuhPMT7+fa1PH
	 IcuP/muA+NfGtQ1ilYvQBo5sgZnlQyzEgSoz2sbcOGophPfAcDHifHLhLuOfgUPluP
	 AhRwFbWsGOKEg==
Received: by mail-lf1-f46.google.com with SMTP id br6so13612496lfb.11;
        Mon, 27 Mar 2023 17:08:54 -0700 (PDT)
X-Gm-Message-State: AAQBX9eJuCUiMrgwQQdG3i7ZalKRnA/FwrIhexEQbpe1VLVUJK7kRBd0
	uBi8yXZerzSTQcd0b3Xd+jf8cGZJbQDSPtIfog==
X-Google-Smtp-Source: AKy350av9yZ1UX2KgeS/t4F1MQbA9AYH8XTj7NFPLZQKNqahnuiPNmwDXnSuMi0m/W4u7+bF7CY8qSEaKUT25OBRpTA=
X-Received: by 2002:ac2:596a:0:b0:4e8:6261:58c2 with SMTP id
 h10-20020ac2596a000000b004e8626158c2mr3860399lfp.7.1679962132705; Mon, 27 Mar
 2023 17:08:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230324100553.13719-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20230324100553.13719-1-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 28 Mar 2023 08:08:40 +0800
X-Gmail-Original-Message-ID: <CAAOTY__tPtvdf+CEdnzY09Cu2PT0tmfdH_a9MD8UWnxZEu-v_A@mail.gmail.com>
Message-ID: <CAAOTY__tPtvdf+CEdnzY09Cu2PT0tmfdH_a9MD8UWnxZEu-v_A@mail.gmail.com>
Subject: Re: [PATCH v6] drm/mediatek: add mediatek-drm of vdosys0 support for mt8188
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, 
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	Nathan Lu <nathan.lu@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	amy zhang <Amy.Zhang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_170857_794020_60D55FA8 
X-CRM114-Status: GOOD (  17.24  )
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

Hi, Jason:

Jason-JH.Lin <jason-jh.lin@mediatek.com> =E6=96=BC 2023=E5=B9=B43=E6=9C=882=
4=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:06=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> From: Nathan Lu <nathan.lu@mediatek.com>
>
> add driver data of mt8188 vdosys0 to mediatek-drm and the sub driver.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

>
> Signed-off-by: amy zhang <Amy.Zhang@mediatek.com>
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
> Rebase on maintainer's tree[1]
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.gi=
t/log/?h=3Dmediatek-drm-next
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index dce2d86df6d9..6dcb4ba2466c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -176,6 +176,18 @@ static const unsigned int mt8186_mtk_ddp_ext[] =3D {
>         DDP_COMPONENT_DPI0,
>  };
>
> +static const unsigned int mt8188_mtk_ddp_main[] =3D {
> +       DDP_COMPONENT_OVL0,
> +       DDP_COMPONENT_RDMA0,
> +       DDP_COMPONENT_COLOR0,
> +       DDP_COMPONENT_CCORR,
> +       DDP_COMPONENT_AAL0,
> +       DDP_COMPONENT_GAMMA,
> +       DDP_COMPONENT_POSTMASK0,
> +       DDP_COMPONENT_DITHER0,
> +       DDP_COMPONENT_DP_INTF0,
> +};
> +
>  static const unsigned int mt8192_mtk_ddp_main[] =3D {
>         DDP_COMPONENT_OVL0,
>         DDP_COMPONENT_OVL_2L0,
> @@ -272,6 +284,11 @@ static const struct mtk_mmsys_driver_data mt8186_mms=
ys_driver_data =3D {
>         .mmsys_dev_num =3D 1,
>  };
>
> +static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data =3D=
 {
> +       .main_path =3D mt8188_mtk_ddp_main,
> +       .main_len =3D ARRAY_SIZE(mt8188_mtk_ddp_main),
> +};
> +
>  static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data =3D {
>         .main_path =3D mt8192_mtk_ddp_main,
>         .main_len =3D ARRAY_SIZE(mt8192_mtk_ddp_main),
> @@ -308,6 +325,8 @@ static const struct of_device_id mtk_drm_of_ids[] =3D=
 {
>           .data =3D &mt8183_mmsys_driver_data},
>         { .compatible =3D "mediatek,mt8186-mmsys",
>           .data =3D &mt8186_mmsys_driver_data},
> +       { .compatible =3D "mediatek,mt8188-vdosys0",
> +         .data =3D &mt8188_vdosys0_driver_data},
>         { .compatible =3D "mediatek,mt8192-mmsys",
>           .data =3D &mt8192_mmsys_driver_data},
>         { .compatible =3D "mediatek,mt8195-mmsys",
> @@ -677,6 +696,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[=
] =3D {
>           .data =3D (void *)MTK_DISP_MUTEX },
>         { .compatible =3D "mediatek,mt8186-disp-mutex",
>           .data =3D (void *)MTK_DISP_MUTEX },
> +       { .compatible =3D "mediatek,mt8188-disp-mutex",
> +         .data =3D (void *)MTK_DISP_MUTEX },
>         { .compatible =3D "mediatek,mt8192-disp-mutex",
>           .data =3D (void *)MTK_DISP_MUTEX },
>         { .compatible =3D "mediatek,mt8195-disp-mutex",
> --
> 2.18.0
>

