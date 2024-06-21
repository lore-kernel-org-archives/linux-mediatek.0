Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8CBC2BA1A
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jun 2024 15:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RIzMW8l42buSkmAMQqepmd7LzccT5GWfnLdkAVo7Jro=; b=Wl89cwKdXcF7J1Zd61WrC/7Nq2
	aNiv0MpUY8N14FJX9BNqbscQ1YU2nA0gA7JgasShsJLcJpP8ZaNdpMUJtRwoe+vrAKRsBSfvdQlO9
	eVCahf7CCqaQKp2UL3JFIys5GlycSVenqD8Ats9HmtsVdyqefxH09t0rqDWjg5nNfvyqdu6ZTBAb3
	IMhXgwYZIGpc9QqYohFH0X7kuTcJHebXy5DTOjgAlrgJrQlJngBkxfEBt3keGn0Fd3lGaKax7NTFJ
	ZZAN6JJdVfEtB4dbKBTX/dpdNZXeSpOm+cOtre01XBmYzB6t3AqXRtDdVGArUTxpiBFnqRc8i8qF2
	JO30mCUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKg7l-00000009jNb-3Tmz;
	Fri, 21 Jun 2024 15:24:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKg7b-00000009jJD-18xG;
	Fri, 21 Jun 2024 15:24:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6DA3C6271A;
	Fri, 21 Jun 2024 15:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FC88C4AF0F;
	Fri, 21 Jun 2024 15:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718983454;
	bh=Ff9EA/QpmNbx6stJ+wK7SetR4F+aGIuV8L9De81Il+E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qc9/4CZbIp5EKUk+F/AKUwoQ0aHLAq+2Pj44DNsskp5QnjGqRURlmL1ze/hDM0a7j
	 iMOp0Vpp+GM5Qh8dkZVv/IW4Ylx4kc3LAoYEYLEeDAlmBBl5hj8F41tgaKvHCtUsu8
	 bfoLgYmQWN9/+IyIrAwn2DUjhnD3OoDXp/Obg5f9VNFIyMfdAuk7sD9q9ZU2ehiv5Y
	 V4RAiz8enzz6rhWcPCnLQuw7I2r6iMy7V4TaW3XutG+sOWkq7n0m1tCk0P0N1S0J5Q
	 mTk9m+HVV60FOicQZNtK0Q3mPlRcDgPM++ilW4XWKorfAGToycanfiZV9qJWw+Komn
	 2em0GAWyG//NQ==
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-681bc7f50d0so2350449a12.0;
        Fri, 21 Jun 2024 08:24:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2wa6YiuNwklli6ldFQ2fiimaRMuOL/pu8BXR0sT+2w4Isj95apYktcEKVg14G19ggM60eITtGV+7q+OBWqsvB5ot1YBbKH0iMZsAxcdpVoX+CAuynY3ZfAvAQr4tO/ocqblaavptE9ZKOLUdI7gAGS+Ogh/PmdB0=
X-Gm-Message-State: AOJu0YzZvyI1H9986sSUJ0t0OA6qQyf9dGglnzDG6iHOwGPBdc5vnp/c
	0ZAqAuJtJgGZd0q23yYmEM9Q/tVZyc9/1J6+iayPJtmfJL32/zh3bZceqLBGURyequ8rUqWj1GJ
	pN5aiaVnGxP/iZX2asyIVQCrfKQ==
X-Google-Smtp-Source: AGHT+IGQ+sY96q+fAXo/8wcMlUkQMzFLEU6NhVSDTBlzTx/VszhL+gr2xWg/am131E2fodn2RmM1MK7LQCnq1VLk1pE=
X-Received: by 2002:a17:90a:2c07:b0:2c7:b392:8f02 with SMTP id
 98e67ed59e1d1-2c83c2dc0fbmr115615a91.23.1718983453637; Fri, 21 Jun 2024
 08:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com> <20231023-display-support-v4-12-ed82eb168fb1@baylibre.com>
In-Reply-To: <20231023-display-support-v4-12-ed82eb168fb1@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 21 Jun 2024 23:24:19 +0800
X-Gmail-Original-Message-ID: <CAAOTY__ZLjuJHnGsVLvGkFK0WhJJ6r=miqewRHsPCJhqO=8qoA@mail.gmail.com>
Message-ID: <CAAOTY__ZLjuJHnGsVLvGkFK0WhJJ6r=miqewRHsPCJhqO=8qoA@mail.gmail.com>
Subject: Re: [PATCH v4 12/15] drm/mediatek: add MT8365 SoC support
To: amergnat@baylibre.com
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_082415_469716_2F30987A 
X-CRM114-Status: GOOD (  15.97  )
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

Hi, Alexandre:

<amergnat@baylibre.com> =E6=96=BC 2024=E5=B9=B45=E6=9C=8823=E6=97=A5 =E9=80=
=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:49=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: Fabien Parent <fparent@baylibre.com>
>
> Add DRM support for MT8365 SoC.
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index ce8f3cc6e853..e1c3281651ae 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -318,6 +318,10 @@ static const struct mtk_mmsys_driver_data mt8195_vdo=
sys1_driver_data =3D {
>         .mmsys_dev_num =3D 2,
>  };
>
> +static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data =3D {
> +       .mmsys_dev_num =3D 1,

You do not describe the pipeline information here. I think display
function would not work.

Regards,
Chun-Kuang.

> +};
> +
>  static const struct of_device_id mtk_drm_of_ids[] =3D {
>         { .compatible =3D "mediatek,mt2701-mmsys",
>           .data =3D &mt2701_mmsys_driver_data},
> @@ -345,6 +349,8 @@ static const struct of_device_id mtk_drm_of_ids[] =3D=
 {
>           .data =3D &mt8195_vdosys0_driver_data},
>         { .compatible =3D "mediatek,mt8195-vdosys1",
>           .data =3D &mt8195_vdosys1_driver_data},
> +       { .compatible =3D "mediatek,mt8365-mmsys",
> +         .data =3D &mt8365_mmsys_driver_data},
>         { }
>  };
>  MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
> @@ -732,6 +738,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[=
] =3D {
>           .data =3D (void *)MTK_DISP_MUTEX },
>         { .compatible =3D "mediatek,mt8195-disp-mutex",
>           .data =3D (void *)MTK_DISP_MUTEX },
> +       { .compatible =3D "mediatek,mt8365-disp-mutex",
> +         .data =3D (void *)MTK_DISP_MUTEX },
>         { .compatible =3D "mediatek,mt8173-disp-od",
>           .data =3D (void *)MTK_DISP_OD },
>         { .compatible =3D "mediatek,mt2701-disp-ovl",
>
> --
> 2.25.1
>

