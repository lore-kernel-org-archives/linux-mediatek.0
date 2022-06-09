Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34AAFCCA473
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 18:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H3iJYExmBhm1B47Rl65ixOsh3xQVUKYkN3et9I8R110=; b=LsHzv1+D34HktG
	FLIt9pdtbmNa6P7ZgvPUj8Nm6PTLVWIEBjOadBqiCfvV0gM1SBkOuCqx03V4RX8fky+S0FBIvzBOn
	nuAy9kWaqb+PO/5uXIOeCIA0Q/f62s0wXXWdNibFQdMSVg/9xhk9H7nwLMjuGz23weVSaz3fTiB1s
	2F6lMa9Lgv7URQywyoxrGwF88MKv4qAgHQcpVCHkB3G3iMHydwZSfhNLZVzGV/tHYLmgLaOvH/mYF
	rSGRxPvmMliAwq07d9FQzOxmbbg+Y5bgDbzoGC/dAFJ+Fdd/3VG5JM+7C1tes+y54Xe8sWSxBsT1P
	HrSRe1bLW+dtMFVOj7tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzMr1-003YtL-SP; Thu, 09 Jun 2022 18:25:59 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzMqq-003Ynx-1s; Thu, 09 Jun 2022 18:25:49 +0000
Received: from notapiano (unknown [169.150.201.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 34BE266017A8;
	Thu,  9 Jun 2022 19:25:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654799144;
	bh=wjYwbyy4txNdLBUZYKXoH1LINavwCoVlNaaWI8BLCAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S3X604uAwDGo1mcYXm1Peo7/dNqEnhkV2oWvy8T8SZEadRJhtWLJbHclNkl61Vr+n
	 PL4RaC7q2vzIqM1hL+DJ5aWo9oRSvDgfcdv9ThWyuMghbfzudQkHIg3eXAvIFYEDRh
	 DtCVaiprK/t3xRctX6/Yd2wU1bCCPnEQ7gNT93mlXaHM4fauVKI4a6RKnvpaA9Ssdy
	 giKgCZs+OJ8FsnnTBd18RLqgoimezvQ8A4XYleCsmg9IVdYrfz53/WSUHvnYZgz1Yv
	 yktvQM9qr0zRzF/zVrSMQCJZKNppxa6FEN3+fiSrTlyq/AXD0wkNHL6GWnKLhKVIKK
	 8AJJu9HWZ/ktA==
Date: Thu, 9 Jun 2022 14:25:37 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Guodong Liu <guodong.liu@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v1 2/4] pinctrl: add drive for I2C related pins on mt8192
Message-ID: <20220609182537.zbqk7gqsyscayv7b@notapiano>
References: <20220608053909.1252-1-guodong.liu@mediatek.com>
 <20220608053909.1252-3-guodong.liu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220608053909.1252-3-guodong.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_112548_309581_BDA1E3C6 
X-CRM114-Status: GOOD (  18.32  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Guodong,

thank you for the patch. Please see some suggestions below.

On Wed, Jun 08, 2022 at 01:39:07PM +0800, Guodong Liu wrote:
> This patch provides the advanced drive raw data setting version
> for I2C used pins on mt8192

Please add "mediatek:" on the commit title for this patch and patch 1, like=
 you
did for 3 and 4.

> =

> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mt8192.c | 31 +++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8192.c b/drivers/pinctrl/=
mediatek/pinctrl-mt8192.c
> index 9faf7001369d..d11ff5519e1e 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt8192.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8192.c
> @@ -1259,6 +1259,32 @@ static const struct mtk_pin_field_calc mt8192_pin_=
r1_range[] =3D {
>  	PIN_FIELD_BASE(205, 205, 8, 0x0070, 0x10, 5, 1),
>  };
>  =

> +static const struct mtk_pin_field_calc mt8192_pin_drv_adv_range[] =3D {
> +	PIN_FIELD_BASE(89, 89, 2, 0x0040, 0x10, 0, 5),
> +	PIN_FIELD_BASE(90, 90, 2, 0x0040, 0x10, 5, 5),
> +
> +	PIN_FIELD_BASE(118, 118, 4, 0x0040, 0x10, 0, 3),
> +	PIN_FIELD_BASE(119, 119, 4, 0x0040, 0x10, 18, 3),
> +	PIN_FIELD_BASE(120, 120, 4, 0x0040, 0x10, 15, 3),
> +	PIN_FIELD_BASE(121, 121, 4, 0x0050, 0x10, 3, 3),
> +	PIN_FIELD_BASE(122, 122, 4, 0x0040, 0x10, 12, 3),
> +	PIN_FIELD_BASE(123, 123, 4, 0x0050, 0x10, 0, 3),
> +	PIN_FIELD_BASE(124, 124, 4, 0x0040, 0x10, 9, 3),
> +	PIN_FIELD_BASE(125, 125, 4, 0x0040, 0x10, 27, 3),
> +	PIN_FIELD_BASE(139, 139, 4, 0x0040, 0x10, 6, 3),
> +	PIN_FIELD_BASE(140, 140, 4, 0x0040, 0x10, 24, 3),
> +	PIN_FIELD_BASE(141, 141, 4, 0x0040, 0x10, 3, 3),
> +	PIN_FIELD_BASE(142, 142, 4, 0x0040, 0x10, 21, 3),
> +	PIN_FIELD_BASE(160, 160, 7, 0x0030, 0x10, 0, 3),
> +	PIN_FIELD_BASE(161, 161, 7, 0x0030, 0x10, 3, 3),
> +	PIN_FIELD_BASE(200, 200, 8, 0x0010, 0x10, 3, 3),
> +	PIN_FIELD_BASE(201, 201, 8, 0x0010, 0x10, 9, 3),
> +	PIN_FIELD_BASE(202, 202, 5, 0x0020, 0x10, 0, 3),
> +	PIN_FIELD_BASE(203, 203, 5, 0x0020, 0x10, 3, 3),
> +	PIN_FIELD_BASE(204, 204, 8, 0x0010, 0x10, 0, 3),
> +	PIN_FIELD_BASE(205, 205, 8, 0x0010, 0x10, 6, 3),
> +};
> +
>  static const struct mtk_pin_field_calc mt8192_pin_e1e0en_range[] =3D {
>  	PIN_FIELD_BASE(118, 118, 4, 0x0040, 0x10, 0, 1),
>  	PIN_FIELD_BASE(119, 119, 4, 0x0040, 0x10, 18, 1),
> @@ -1357,6 +1383,7 @@ static const struct mtk_pin_reg_calc mt8192_reg_cal=
s[PINCTRL_PIN_REG_MAX] =3D {
>  	[PINCTRL_PIN_REG_R1] =3D MTK_RANGE(mt8192_pin_r1_range),
>  	[PINCTRL_PIN_REG_DRV_EN] =3D MTK_RANGE(mt8192_pin_e1e0en_range),
>  	[PINCTRL_PIN_REG_DRV_E0] =3D MTK_RANGE(mt8192_pin_e0_range),
> +	[PINCTRL_PIN_REG_DRV_ADV]	=3D MTK_RANGE(mt8192_pin_drv_adv_range),

Nit: use space instead of tab before the =3D.

Thanks,
N=EDcolas

>  	[PINCTRL_PIN_REG_DRV_E1] =3D MTK_RANGE(mt8192_pin_e1_range),
>  };
>  =

> @@ -1376,8 +1403,8 @@ static const struct mtk_pin_soc mt8192_data =3D {
>  	.drive_get	=3D mtk_pinconf_drive_get_rev1,
>  	.adv_pull_get =3D mtk_pinconf_adv_pull_get,
>  	.adv_pull_set =3D mtk_pinconf_adv_pull_set,
> -	.adv_drive_get =3D mtk_pinconf_adv_drive_get,
> -	.adv_drive_set =3D mtk_pinconf_adv_drive_set,
> +	.adv_drive_get	=3D mtk_pinconf_adv_drive_get_raw,
> +	.adv_drive_set	=3D mtk_pinconf_adv_drive_set_raw,
>  };
>  =

>  static const struct of_device_id mt8192_pinctrl_of_match[] =3D {
> -- =

> 2.25.5
> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
