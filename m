Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777D0C4707C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 08:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLUoJHH9vL1bZ2GgbR3YmRRkEoCjkjm9bBOPWHQDlGA=; b=wILHaxggAYWv0Cj1ZjC/r9pFU4
	pldBP6HxfwEqFyy+W8rgWtyQTa77c0c3E9WRNVCTWfdcXsjHMZUcVxzIbw9sRxxkeZEbf6CU4epdy
	lNm95SafLhX0AkXW9yv5aq/S4VkOU3k60LL1WEqIx5kpegSqVaq6us6JvmyOPvJehyp3HdwogafNx
	7BeC4yqarn6XzIFIMtWUxsT2F0W+zmMgU5z8Ti6YadkcKEqPpeYHoUzpCoi+jP6UrmzcN1/85+kkc
	65OfbLcA5XmO3+Z/XdwCPb3qEkk6Vy9OqJJXhhTJxg3tBx8XY7jfaqsL546h2leeLiEuDuXqj14r9
	W5qw8VFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOCjl-002BfM-10;
	Fri, 12 Jan 2024 08:17:57 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOCji-002Bdy-0W
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jan 2024 08:17:55 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2cd0f4f306fso73232191fa.0
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Jan 2024 00:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705047471; x=1705652271; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLUoJHH9vL1bZ2GgbR3YmRRkEoCjkjm9bBOPWHQDlGA=;
        b=W+b4HKnNSF8sQ2BtSs8gjfs1ubxOaENurvKzstcOsegbcjjevC3g9vWQ4F2yqx8TFE
         NI9/L7JUz4oDyUt6K60OBP8oASIC7CpAjhzVylZNTuqWKUDh/nMiL1hnRDRaBJVEoEQp
         hT+VgeRLttYSD8VULc4NH2I21UanQgdNf5Z2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705047471; x=1705652271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLUoJHH9vL1bZ2GgbR3YmRRkEoCjkjm9bBOPWHQDlGA=;
        b=GTa/YTeFByesbjNSQ63+ygls5eaNPRxfUoQnCD9lOtEP8ILIkXUIxOewuV9vEDhxrg
         tpzsIXDveQ63MB2xri0JzqIXIn2ITXW3foTOKYlfFteEZekfkYRjsv4mGvsCjIF9mDl+
         +da7ZqaJxujYOyXohO6JK2iyPOhq7LlJ6Pi0OSBBA+lt2ol79oTYja8O9WVPPztJ1J6Z
         O9sFTzAg4yoHKTQExBhRDj7Yc1rCewjbJ45i8xbG+BnJzzP9Otgb8ZSSEK1NVNEOBb8V
         98fpGeI+xGfufrsPvGc9z6H8iI8DeP4kE3PIcupqDJCm5hf39Z6++0Zdm9o5VekfaEK2
         utXA==
X-Gm-Message-State: AOJu0YyCQOUxCtb35alzSWH5+Bboqanhf8J0Itt8I5oo0VdvEBet01xS
	IYFe5lIU2//tiQWZcv2UwfsWKJQ+fxXFL3R+fkszvD2NkTSm
X-Google-Smtp-Source: AGHT+IFnPq0abOqgKKGI/Lb7ZpqZ+iFRv9oNGRxuG8trKPUudrojUe1vsbrgqwS0pyK/Y0QND6YXPHJynUU7wm90eOs=
X-Received: by 2002:a2e:8346:0:b0:2cc:e9de:3905 with SMTP id
 l6-20020a2e8346000000b002cce9de3905mr412718ljh.68.1705047471044; Fri, 12 Jan
 2024 00:17:51 -0800 (PST)
MIME-Version: 1.0
References: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com> <20240111105247.117766-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240111105247.117766-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jan 2024 16:17:40 +0800
Message-ID: <CAGXv+5Grq8XrpP9yssduXtetxWBb3PB1z7O6rvvaW=CcSPB8Dg@mail.gmail.com>
Subject: Re: [PATCH 2/7] ASoC: mediatek: mt8173-afe-pcm: Use devm_snd_soc_register_component()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	matthias.bgg@gmail.com, ribalda@chromium.org, nicolas.ferre@microchip.com, 
	u.kleine-koenig@pengutronix.de, kuninori.morimoto.gx@renesas.com, 
	nfraprado@collabora.com, alsa-devel@alsa-project.org, trevor.wu@mediatek.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_001754_198246_7D3FCC01 
X-CRM114-Status: GOOD (  21.86  )
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

On Thu, Jan 11, 2024 at 6:53=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Function devm_snd_soc_register_component() allocates a new struct
> snd_soc_component, adds components and initializes them; since this
> is also devm, it automatically unregisters components and frees
> memory upon destruction.
>
> That's exactly what we're doing in the probe function of this driver:
> switch to that function instead, allowing to remove the last goto and
> to discard the .remove_new() callback for this driver.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 58 +++-------------------
>  1 file changed, 8 insertions(+), 50 deletions(-)
>
> diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/media=
tek/mt8173/mt8173-afe-pcm.c
> index ea611730de9c..b887e10635fe 100644
> --- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
> @@ -1129,72 +1129,31 @@ static int mt8173_afe_pcm_dev_probe(struct platfo=
rm_device *pdev)
>         afe->runtime_resume =3D mt8173_afe_runtime_resume;
>         afe->runtime_suspend =3D mt8173_afe_runtime_suspend;
>
> -       ret =3D devm_snd_soc_register_component(&pdev->dev,
> -                                        &mtk_afe_pcm_platform,
> -                                        NULL, 0);
> +       ret =3D devm_snd_soc_register_component(&pdev->dev, &mtk_afe_pcm_=
platform, NULL, 0);
>         if (ret)
>                 return ret;
>
> -       comp_pcm =3D devm_kzalloc(&pdev->dev, sizeof(*comp_pcm), GFP_KERN=
EL);
> -       if (!comp_pcm)
> -               return -ENOMEM;
> -
> -       ret =3D snd_soc_component_initialize(comp_pcm,
> -                                          &mt8173_afe_pcm_dai_component,
> -                                          &pdev->dev);
> +       ret =3D devm_snd_soc_register_component(&pdev->dev, &mt8173_afe_p=
cm_dai_component,
> +                                             mt8173_afe_pcm_dais,
> +                                             ARRAY_SIZE(mt8173_afe_pcm_d=
ais));
>         if (ret)
>                 return ret;
>
> -#ifdef CONFIG_DEBUG_FS
> -       comp_pcm->debugfs_prefix =3D "pcm";
> -#endif

To match existing behavior, can you move this to the component driver?
In snd_soc_component_initialize(), component->debugfs_prefix will take
component_driver->debugfs_prefix as default if it is not set.

Same for the HDMI component.

ChenYu

> -
> -       ret =3D snd_soc_add_component(comp_pcm,
> -                                   mt8173_afe_pcm_dais,
> -                                   ARRAY_SIZE(mt8173_afe_pcm_dais));
> +       ret =3D devm_snd_soc_register_component(&pdev->dev, &mt8173_afe_h=
dmi_dai_component,
> +                                             mt8173_afe_hdmi_dais,
> +                                             ARRAY_SIZE(mt8173_afe_hdmi_=
dais));
>         if (ret)
>                 return ret;
>
> -       comp_hdmi =3D devm_kzalloc(&pdev->dev, sizeof(*comp_hdmi), GFP_KE=
RNEL);
> -       if (!comp_hdmi) {
> -               ret =3D -ENOMEM;
> -               goto err_cleanup_components;
> -       }
> -
> -       ret =3D snd_soc_component_initialize(comp_hdmi,
> -                                          &mt8173_afe_hdmi_dai_component=
,
> -                                          &pdev->dev);
> -       if (ret)
> -               goto err_cleanup_components;
> -
> -#ifdef CONFIG_DEBUG_FS
> -       comp_hdmi->debugfs_prefix =3D "hdmi";
> -#endif
> -
> -       ret =3D snd_soc_add_component(comp_hdmi,
> -                                   mt8173_afe_hdmi_dais,
> -                                   ARRAY_SIZE(mt8173_afe_hdmi_dais));
> -       if (ret)
> -               goto err_cleanup_components;
> -
>         ret =3D devm_request_irq(afe->dev, irq_id, mt8173_afe_irq_handler=
,
>                                0, "Afe_ISR_Handle", (void *)afe);
>         if (ret) {
>                 dev_err(afe->dev, "could not request_irq\n");
> -               goto err_cleanup_components;
> +               return ret;
>         }
>
>         dev_info(&pdev->dev, "MT8173 AFE driver initialized.\n");
>         return 0;
> -
> -err_cleanup_components:
> -       snd_soc_unregister_component(&pdev->dev);
> -       return ret;
> -}
> -
> -static void mt8173_afe_pcm_dev_remove(struct platform_device *pdev)
> -{
> -       snd_soc_unregister_component(&pdev->dev);
>  }
>
>  static const struct of_device_id mt8173_afe_pcm_dt_match[] =3D {
> @@ -1215,7 +1174,6 @@ static struct platform_driver mt8173_afe_pcm_driver=
 =3D {
>                    .pm =3D &mt8173_afe_pm_ops,
>         },
>         .probe =3D mt8173_afe_pcm_dev_probe,
> -       .remove_new =3D mt8173_afe_pcm_dev_remove,
>  };
>
>  module_platform_driver(mt8173_afe_pcm_driver);
> --
> 2.43.0
>
>

