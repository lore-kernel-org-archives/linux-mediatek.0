Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FF1C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 14:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sTPB435/Dyy1U+JnD/B1SBFnB+98atBPyXV6oN1votk=; b=jTjJy+xftXy0GT
	8hiL76paRx9LnVwPeoqRLQZh2CZ68gjDmNyGZuGq7WWfNDCyh4Q+HHGkcpsFYpgHY93PJUueViUaE
	v3hPCZCaIZJjD1NKJXa09/nBqvGbHoKh9yc2BX51BV0cHvMBbQh/MXLFDAQDYi4/DUuhHCaKYx/lT
	4Lt2HVb6Z9Htzh3WyFAhMLzu8PETVpOl0AevSbZKXS9zc/fWYsarWy+UuNDVNpgZlH0woA9F99CAP
	lFmUSxmpObKOE7t1IT7RhSGT1TpD09qP30nrAA0pHBfKsRWLkMI/YncM+9xBDPkI4Z4t4+xvgAzL1
	+fvbp6lFeqPE2GYh3D1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns43E-00D0lT-9N; Fri, 20 May 2022 14:56:24 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns42s-00D0f9-LK; Fri, 20 May 2022 14:56:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id AACB51F46542
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653058557;
 bh=jxX878QWawgfvMOXk/YfULJcGJes7LLWJjg8hH9kCTI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qp+eGoXC12xS0US+up3AlAeSEDKDGEXAPjch3KWyCwzTClULych8zz0ibHqnTODRR
 G4rG2kxigej4l/KJ0XIgq5nph59Dym7LEXSDLoqZ7WdA9BJL2jAdofZS+0UiB7P7GK
 UQ8hg2zb7DWeq0g/pElSQw1ktp2ekGitloZsfJ0Xzznf7LsGa9zimN5TcwVFR/C7ib
 TI9pOyWzqApc7fhRwNSI815uGNqXDLnXsWajfm93QhDnkksdfKGXkAQtKmGdQ5cvWg
 w8tB+P+d2GF10vgVOHyflekvmgd9D60EqKj1xMxVE7lQjZMcr0rZwYZSJbmUicXt0W
 T5nUb3G2ru02w==
Date: Fri, 20 May 2022 10:55:51 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
 chun-jie.chen@mediatek.com, wenst@chromium.org,
 runyang.chen@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v7 04/19] clk: mediatek: reset: Extract common drivers to
 update function
Message-ID: <20220520145551.b2sqheaizkegna3n@notapiano>
References: <20220519125527.18544-1-rex-bc.chen@mediatek.com>
 <20220519125527.18544-5-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220519125527.18544-5-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_075602_949515_BB762DD3 
X-CRM114-Status: GOOD (  16.73  )
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

On Thu, May 19, 2022 at 08:55:12PM +0800, Rex-BC Chen wrote:
> To make drivers more clear and readable, we extract common code
> within assert and deassert to mtk_reset_update_set_clr() and
> mtk_reset_update().
> =

> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
>  drivers/clk/mediatek/reset.c | 38 +++++++++++++++++++++---------------
>  1 file changed, 22 insertions(+), 16 deletions(-)
> =

> diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
> index 5cbbcc22a4fc..22fa9f09752c 100644
> --- a/drivers/clk/mediatek/reset.c
> +++ b/drivers/clk/mediatek/reset.c
> @@ -12,24 +12,27 @@
>  =

>  #include "reset.h"
>  =

> -static int mtk_reset_assert(struct reset_controller_dev *rcdev,
> -			    unsigned long id)
> +static int mtk_reset_update(struct reset_controller_dev *rcdev,
> +			    unsigned long id, bool deassert)

I'd have called the bool 'assert', and then passed true on assert and false=
 on
deassert, as I think that's slightly more intuitive, but that's just person=
al
preference. It's fine like this as well.

Thanks,
N=EDcolas

>  {
>  	struct mtk_reset *data =3D container_of(rcdev, struct mtk_reset, rcdev);
> +	unsigned int val =3D deassert ? 0 : ~0;
>  =

>  	return regmap_update_bits(data->regmap,
>  				  data->regofs + ((id / 32) << 2),
> -				  BIT(id % 32), ~0);
> +				  BIT(id % 32), val);
> +}
> +
> +static int mtk_reset_assert(struct reset_controller_dev *rcdev,
> +			    unsigned long id)
> +{
> +	return mtk_reset_update(rcdev, id, false);
>  }
>  =

>  static int mtk_reset_deassert(struct reset_controller_dev *rcdev,
>  			      unsigned long id)
>  {
> -	struct mtk_reset *data =3D container_of(rcdev, struct mtk_reset, rcdev);
> -
> -	return regmap_update_bits(data->regmap,
> -				  data->regofs + ((id / 32) << 2),
> -				  BIT(id % 32), 0);
> +	return mtk_reset_update(rcdev, id, true);
>  }
>  =

>  static int mtk_reset(struct reset_controller_dev *rcdev, unsigned long i=
d)
> @@ -43,24 +46,27 @@ static int mtk_reset(struct reset_controller_dev *rcd=
ev, unsigned long id)
>  	return mtk_reset_deassert(rcdev, id);
>  }
>  =

> -static int mtk_reset_assert_set_clr(struct reset_controller_dev *rcdev,
> -				    unsigned long id)
> +static int mtk_reset_update_set_clr(struct reset_controller_dev *rcdev,
> +				    unsigned long id, bool deassert)
>  {
>  	struct mtk_reset *data =3D container_of(rcdev, struct mtk_reset, rcdev);
> +	unsigned int deassert_ofs =3D deassert ? 0x4 : 0;
>  =

>  	return regmap_write(data->regmap,
> -			    data->regofs + ((id / 32) << 4),
> +			    data->regofs + ((id / 32) << 4) + deassert_ofs,
>  			    BIT(id % 32));
>  }
>  =

> +static int mtk_reset_assert_set_clr(struct reset_controller_dev *rcdev,
> +				    unsigned long id)
> +{
> +	return mtk_reset_update_set_clr(rcdev, id, false);
> +}
> +
>  static int mtk_reset_deassert_set_clr(struct reset_controller_dev *rcdev,
>  				      unsigned long id)
>  {
> -	struct mtk_reset *data =3D container_of(rcdev, struct mtk_reset, rcdev);
> -
> -	return regmap_write(data->regmap,
> -			    data->regofs + ((id / 32) << 4) + 0x4,
> -			    BIT(id % 32));
> +	return mtk_reset_update_set_clr(rcdev, id, true);
>  }
>  =

>  static int mtk_reset_set_clr(struct reset_controller_dev *rcdev,
> -- =

> 2.18.0
> =

> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
