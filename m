Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C820DC5478C
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 03:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YnhjCqHLFxHzCoP56tcAkpXqMN7ULXn2w3/bj8hdCI8=; b=UcDA54kZse2f6SgUQUbn4H5Ghs
	4s2gIcm0I/QoHpi5wOwHE0UFkHo3VXz99r2Z+t1dvrk1sKCoVu7LBbK7oOMoOTl7gUt1eOiM8Kq0H
	jwB1yrI7a2kLJxuvsK1WAj+i1DJotf0q8WVqpge2uu3/pd/7uEY3OwXofARA0URMh89xHcwKmbp0B
	6W1y+au0hWkiGRYKu0Ue53mU9Ih5JjpPC+wgPGJdxtXxB7X/Ll0O5ggmaqrTenBT/obMJ04gxuBth
	FmY1A6SUl/nFOdjTLwX3/vIIiPUsTQdRGiNvEhfxDP9QNg+4Qnkx4xkw67Qc+6glHul3xOgVry8/N
	qArdcAqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfX1O-0000000BsPp-0ZJ7;
	Thu, 29 Feb 2024 03:23:46 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfX1K-0000000BsMy-3AjQ
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Feb 2024 03:23:44 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-512bde3d197so352024e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Feb 2024 19:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709177019; x=1709781819; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YnhjCqHLFxHzCoP56tcAkpXqMN7ULXn2w3/bj8hdCI8=;
        b=IKIdY2jJLLIa02zpdYNtRO2lL9IY4iMdijNoP6IeOVmAw5ChUFQsHrivTOVXH7OIi3
         o5MG5b2KfXyI+30rje4lgZnY3PgciUFTxyaXXZWsfREl+pXzDaGoie39L6zPz1Auw8HL
         iMMcHUS9wGIWVxak4bo5rZI3MfmN4o771YpKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709177019; x=1709781819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YnhjCqHLFxHzCoP56tcAkpXqMN7ULXn2w3/bj8hdCI8=;
        b=XppHctTlNhWCC6TguKjeheG2G0GBm+qM9H5nDdOE7Gvw1Yu5sdksmNGYuOzFImzKvL
         NjntqQ9Uk1p5fj1Knm+oE5UuHbgYTobX//lvh7UFoX8pM/f5cqTj9ozssmOamjI5KNaw
         T644CpS3x+pQVD3ocZXLIWDFACuC4tBJS9tg652FXMIvExMmNs+FCH93mXf0mK36Mq53
         +rbdvnCb4sF01e52M8K21hbfHsnyTAYgQde6ZvN6kjaVpxORglcj7f57BPC6/HfkSEwQ
         Nb0P9eg8K94RsaL0ex5tTn9n0ePSUBew9q8AlR9QAQfEtOv3BCaRHlLecqeUnh6GpVCS
         9FtA==
X-Forwarded-Encrypted: i=1; AJvYcCV6oqsh7kkokfsx8IzvB9B3S8iAQIJbuqpKhF7Jm2h+kcDSZb+jiyfE4viu54aA/xS7mF6MT26SBkbGa64q/sd+Gu1Ui0pMvS6Ay8eLbTV0auiO
X-Gm-Message-State: AOJu0YyS0VBjNEcFf9FJxaJsOX/5mwwlCbMFSTJ0qdgP0hS1ke5fsvlT
	OKxn3Iabriwi49sgejAvgFN7G4pMxWV8MYgLn3UpJgH4eb0Iag5vIJdAaGNJGA8Sj0ec4M+QWIs
	hqYZjHEom+XouPXqPvIEy/A1zUC4KypOpq9Z4
X-Google-Smtp-Source: AGHT+IGoyjlA5d3MJxIU0XjajX2pLjnv5bjpGNpsYoZpp5aPB53ISOzz1U7B/7xmRxLHgmDVXHiCd+RpSMsLvGtFTsY=
X-Received: by 2002:a05:6512:3d04:b0:513:25b9:6cf8 with SMTP id
 d4-20020a0565123d0400b0051325b96cf8mr294868lfv.19.1709177019347; Wed, 28 Feb
 2024 19:23:39 -0800 (PST)
MIME-Version: 1.0
References: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com> <20240227120939.290143-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240227120939.290143-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 29 Feb 2024 11:23:28 +0800
Message-ID: <CAGXv+5Edk5tCmE87DCOjVmMsiMcKeRw50=mx8=z1ZacJYd6L1Q@mail.gmail.com>
Subject: Re: [PATCH 01/22] ASoC: mediatek: mt8192-afe-pcm: Convert to devm_pm_runtime_enable()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com, 
	trevor.wu@mediatek.com, maso.huang@mediatek.com, 
	xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de, 
	kuninori.morimoto.gx@renesas.com, shraash@google.com, amergnat@baylibre.com, 
	nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de, 
	dianders@chromium.org, frank.li@vivo.com, allen-kh.cheng@mediatek.com, 
	eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev, 
	jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com, alpernebiyasak@gmail.com, 
	ckeepax@opensource.cirrus.com, zhourui@huaqin.corp-partner.google.com, 
	nfraprado@collabora.com, alsa-devel@alsa-project.org, 
	shane.chien@mediatek.com, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_192342_811955_6D6C7B08 
X-CRM114-Status: GOOD (  19.88  )
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

On Tue, Feb 27, 2024 at 8:10=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Switch from pm_runtime_enable() to devm_pm_runtime_enable(), allowing
> to remove all gotos from the probe function.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

This also fixes the unwinding order during driver unbinding.


> ---
>  sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 46 ++++++++--------------
>  1 file changed, 17 insertions(+), 29 deletions(-)
>
> diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/media=
tek/mt8192/mt8192-afe-pcm.c
> index bdd1e91824d9..794419d16b01 100644
> --- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
> @@ -2217,21 +2217,20 @@ static int mt8192_afe_pcm_dev_probe(struct platfo=
rm_device *pdev)
>                 return ret;
>         }
>
> -       pm_runtime_enable(&pdev->dev);
> -       if (!pm_runtime_enabled(&pdev->dev))
> -               goto err_pm_disable;
> +       ret =3D devm_pm_runtime_enable(&pdev->dev);
> +       if (ret)
> +               return ret;
>
>         /* regmap init */
>         afe->regmap =3D syscon_node_to_regmap(dev->parent->of_node);
>         if (IS_ERR(afe->regmap)) {
>                 dev_err(dev, "could not get regmap from parent\n");
> -               ret =3D PTR_ERR(afe->regmap);
> -               goto err_pm_disable;
> +               return PTR_ERR(afe->regmap);
>         }
>         ret =3D regmap_attach_dev(dev, afe->regmap, &mt8192_afe_regmap_co=
nfig);
>         if (ret) {
>                 dev_warn(dev, "regmap_attach_dev fail, ret %d\n", ret);
> -               goto err_pm_disable;
> +               return ret;
>         }
>
>         /* enable clock for regcache get default value from hw */
> @@ -2241,7 +2240,7 @@ static int mt8192_afe_pcm_dev_probe(struct platform=
_device *pdev)
>         ret =3D regmap_reinit_cache(afe->regmap, &mt8192_afe_regmap_confi=
g);
>         if (ret) {
>                 dev_err(dev, "regmap_reinit_cache fail, ret %d\n", ret);
> -               goto err_pm_disable;
> +               return ret;
>         }
>
>         pm_runtime_put_sync(&pdev->dev);
> @@ -2254,10 +2253,8 @@ static int mt8192_afe_pcm_dev_probe(struct platfor=
m_device *pdev)
>         afe->memif_size =3D MT8192_MEMIF_NUM;
>         afe->memif =3D devm_kcalloc(dev, afe->memif_size, sizeof(*afe->me=
mif),
>                                   GFP_KERNEL);
> -       if (!afe->memif) {
> -               ret =3D -ENOMEM;
> -               goto err_pm_disable;
> -       }
> +       if (!afe->memif)
> +               return -ENOMEM;
>
>         for (i =3D 0; i < afe->memif_size; i++) {
>                 afe->memif[i].data =3D &memif_data[i];
> @@ -2271,26 +2268,22 @@ static int mt8192_afe_pcm_dev_probe(struct platfo=
rm_device *pdev)
>         afe->irqs_size =3D MT8192_IRQ_NUM;
>         afe->irqs =3D devm_kcalloc(dev, afe->irqs_size, sizeof(*afe->irqs=
),
>                                  GFP_KERNEL);
> -       if (!afe->irqs) {
> -               ret =3D -ENOMEM;
> -               goto err_pm_disable;
> -       }
> +       if (!afe->irqs)
> +               return -ENOMEM;
>
>         for (i =3D 0; i < afe->irqs_size; i++)
>                 afe->irqs[i].irq_data =3D &irq_data[i];
>
>         /* request irq */
>         irq_id =3D platform_get_irq(pdev, 0);
> -       if (irq_id < 0) {
> -               ret =3D irq_id;
> -               goto err_pm_disable;
> -       }
> +       if (irq_id < 0)
> +               return irq_id;
>
>         ret =3D devm_request_irq(dev, irq_id, mt8192_afe_irq_handler,
>                                IRQF_TRIGGER_NONE, "asys-isr", (void *)afe=
);
>         if (ret) {
>                 dev_err(dev, "could not request_irq for Afe_ISR_Handle\n"=
);
> -               goto err_pm_disable;
> +               return ret;
>         }
>
>         /* init sub_dais */
> @@ -2301,7 +2294,7 @@ static int mt8192_afe_pcm_dev_probe(struct platform=
_device *pdev)
>                 if (ret) {
>                         dev_warn(afe->dev, "dai register i %d fail, ret %=
d\n",
>                                  i, ret);
> -                       goto err_pm_disable;
> +                       return ret;
>                 }
>         }
>
> @@ -2310,7 +2303,7 @@ static int mt8192_afe_pcm_dev_probe(struct platform=
_device *pdev)
>         if (ret) {
>                 dev_warn(afe->dev, "mtk_afe_combine_sub_dai fail, ret %d\=
n",
>                          ret);
> -               goto err_pm_disable;
> +               return ret;
>         }
>
>         /* others */
> @@ -2329,7 +2322,7 @@ static int mt8192_afe_pcm_dev_probe(struct platform=
_device *pdev)
>                                               &mt8192_afe_component, NULL=
, 0);
>         if (ret) {
>                 dev_warn(dev, "err_platform\n");
> -               goto err_pm_disable;
> +               return ret;
>         }
>
>         ret =3D devm_snd_soc_register_component(&pdev->dev,
> @@ -2338,15 +2331,10 @@ static int mt8192_afe_pcm_dev_probe(struct platfo=
rm_device *pdev)
>                                               afe->num_dai_drivers);
>         if (ret) {
>                 dev_warn(dev, "err_dai_component\n");
> -               goto err_pm_disable;
> +               return ret;
>         }
>
>         return 0;
> -
> -err_pm_disable:
> -       pm_runtime_disable(&pdev->dev);
> -
> -       return ret;
>  }
>
>  static void mt8192_afe_pcm_dev_remove(struct platform_device *pdev)
> --
> 2.44.0
>

