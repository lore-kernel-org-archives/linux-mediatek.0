Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88E2C10F1A
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 May 2024 08:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Wiz5MoTmXNXCF7A/NdDpUQr0zJjTgt8byvzglF4DEc=; b=XmHTEvgswvyrSMOG1lBtEtv0xs
	kjzHZCuw/ivCAysY1iLUm7AlO5aj047KJbENfkH7WCfG6uRGt0bigxB/mMeKk2QCHoZ1UqDwtiK7x
	tDqAWpQSynGQMfm/uOC1yHYcnQ+AowPQp8J0Rmhjqxf4mnO8eSugUzfa4j+YyRKs5GYYtVWNCNWQ+
	a6uae3uypjjMSxYWdCZZvFl9YC7yn8+YZbH1EK2PZFIGg6emeVaS3uEceEzvE5hc0c/Dim6oRXvT+
	vT4e+skhoPBsV2KOlsdySKag0JnloABXPsnuouVniwf0D06sFOWpFnERMRAbZPJVlAC2QxmEKgdnY
	QoKbZb+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4zbp-00000000tlM-2w14;
	Thu, 09 May 2024 08:58:37 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4zbm-00000000tkQ-2nh6
	for linux-mediatek@lists.infradead.org;
	Thu, 09 May 2024 08:58:36 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2e44d32a480so7838391fa.0
        for <linux-mediatek@lists.infradead.org>; Thu, 09 May 2024 01:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715245110; x=1715849910; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Wiz5MoTmXNXCF7A/NdDpUQr0zJjTgt8byvzglF4DEc=;
        b=P89PCndeF7FyJtE+r2GaSTJki28ggzKINkVpScRyy2fEIpjMdFqQpYp4H24ev7CawU
         d4XNsQeWJIYUs7My/KGBXcTi3SvoIfex8cc/ii2J+VJAkIKOzAz4sxLfzy30PSzxlRX4
         3uQsMYD7IZNe17O7EhqLmHQ+j73u6HP8WVmQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715245110; x=1715849910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Wiz5MoTmXNXCF7A/NdDpUQr0zJjTgt8byvzglF4DEc=;
        b=NBn+AlfmvDnzu1+E2C0Gllwn/K81bS+wEcpqujQHoBEAHZbDlLDTmWGA18sdlr4QbJ
         7vHCKNAP6ibOGFiaOCNkMzrITNNwVhOVeyeViRZh4xJc6lnMNo9W3QUKOjeAy+1Ui1JP
         m8Ypadi6SZRKBqQeFTr60T0T8esfG3WpsbcxuQUqdZJ9wFP3OHniRxR6tPpmmfXcpETA
         xWruEGO5+vlVZIWSEpiqu94Mj0/ShN7uN2kB/s7fOneUjIzfe/HqKJz+lwM8X2WZRgnX
         3TqIu7XspizyznpFVPonMyBIP8oR8ggucNa9vnaaLaSVbQGGoDY4QUOYYQlApKn495WT
         KsQw==
X-Forwarded-Encrypted: i=1; AJvYcCUFeRGj9Dv1hyliaJQ3/TAWYuWH1fuZAJrv87iE8sCktFu4xLnNZ7sWQy2u9seAFImJV6/r4oqEeuLU/CLXAzCTUCbjoQpJNjSgI0iltN/K4o4T
X-Gm-Message-State: AOJu0YxAFoocamwBHHlTJRWJeyt+AuvVWqF7/eL3qs+PL/yuAUW/d5eS
	V2J2IGNn3vD42PbptC0V4mo879z67XQo/YDSSeLZofycrJcONR18hUmewoG7KH27kxfls3hmq5/
	tG60K2MDPjCq/VmEMQ45PADMAqi3bQ2OsSyn7
X-Google-Smtp-Source: AGHT+IH9ObFL6J8WFDRyP8J9A5dWQL9UrJwiJ65mOUZ6bLzWBgApqNI6WPFqJ6HGRFDelg160CI2ttiR8RE+Eg7y928=
X-Received: by 2002:a2e:99d4:0:b0:2de:c6b5:2888 with SMTP id
 38308e7fff4ca-2e447194771mr32704081fa.3.1715245110374; Thu, 09 May 2024
 01:58:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240509-8192-tdm-v1-1-530b54645763@chromium.org>
In-Reply-To: <20240509-8192-tdm-v1-1-530b54645763@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 May 2024 16:58:19 +0800
Message-ID: <CAGXv+5HYsKFpHWXE45N+4K1LbKA1Lan8rDHm6=+YvsY0CXKoMg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8192: fix register configuration for tdm
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_015834_754715_A3F5B9F1 
X-CRM114-Status: GOOD (  17.76  )
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

On Thu, May 9, 2024 at 3:31=E2=80=AFPM Hsin-Te Yuan <yuanhsinte@chromium.or=
g> wrote:
>
> For DSP_A, data is a BCK cycle behind LRCK trigger edge. For DSP_B, this
> delay doesn't exist. Fix the delay configuration to match the standard.
>
> Fixes: 52fcd65414abfc ("ASoC: mediatek: mt8192: support tdm in platform d=
river")
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  sound/soc/mediatek/mt8192/mt8192-dai-tdm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c b/sound/soc/media=
tek/mt8192/mt8192-dai-tdm.c
> index 9ce06821c7d0f..49440db370af0 100644
> --- a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
> +++ b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
> @@ -566,10 +566,10 @@ static int mtk_dai_tdm_hw_params(struct snd_pcm_sub=
stream *substream,
>                 tdm_con |=3D 1 << DELAY_DATA_SFT;
>                 tdm_con |=3D get_tdm_lrck_width(format) << LRCK_TDM_WIDTH=
_SFT;
>         } else if (tdm_priv->tdm_out_mode =3D=3D TDM_OUT_DSP_A) {
> -               tdm_con |=3D 0 << DELAY_DATA_SFT;
> +               tdm_con |=3D 1 << DELAY_DATA_SFT;
>                 tdm_con |=3D 0 << LRCK_TDM_WIDTH_SFT;
>         } else if (tdm_priv->tdm_out_mode =3D=3D TDM_OUT_DSP_B) {
> -               tdm_con |=3D 1 << DELAY_DATA_SFT;
> +               tdm_con |=3D 0 << DELAY_DATA_SFT;
>                 tdm_con |=3D 0 << LRCK_TDM_WIDTH_SFT;
>         }
>
>
> ---
> base-commit: 45db3ab70092637967967bfd8e6144017638563c
> change-id: 20240509-8192-tdm-cbf2a73c9dd3
>
> Best regards,
> --
> Hsin-Te Yuan <yuanhsinte@chromium.org>
>
>

