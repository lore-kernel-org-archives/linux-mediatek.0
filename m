Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DD1C25B76
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jun 2024 08:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LBJGp2n7Qi8iczry8F3rJYPAUsV9sny6tREW8YboOY4=; b=yV3GGtC1Qypty/WQZlxHB4HXsy
	Dsp0pXGZbx3qUuH5QmMODuQFl0QX9hj5nKAviBar34+QteIaoSTxX3Vn9oZ2DZM3NFLAX+y0v3Go/
	KmI2cnfSww6rIDXgZ6WCYHpY5Cxr+8om2l3VC5+T6bqyAwkItsZPVB1Lhf+rm5Wcamh14zHOHA4rE
	lj5nJhP61X2FQBM7HWLHC3XWMAcSkbNaMZuBf3FcdxMVY0bae2uiyFz/U8Gcyvb7lzBpTKQ0Mgy52
	sZ0IxTc+aWUcPpqbXiD0kZRd6ZTf0jB3VxZ4zymUM8f3khGX3edHwz7cxX0s2xE+pvxnVx7maj4cB
	f6Zjxk9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEloE-000000058PN-41rv;
	Wed, 05 Jun 2024 08:15:50 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEloC-000000058KH-0rBj
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Jun 2024 08:15:49 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-52b894021cbso6241263e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Jun 2024 01:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717575339; x=1718180139; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LBJGp2n7Qi8iczry8F3rJYPAUsV9sny6tREW8YboOY4=;
        b=keJxt1/F7RupcnoXOC2z8FgBsYpfBJsE6llPDvqecpxVHZDYK7WsyEhjgAlJdFRR5j
         38lkUlJHqHx5Vr6mMOAxCuIXon6DYfUaWfr9Q1qPH06gKBm1Noq5mX5I30GtwTsHPouH
         EeGoNuKWhoZYjMzOYtt1NSbTzYT/PisQeqziA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717575339; x=1718180139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBJGp2n7Qi8iczry8F3rJYPAUsV9sny6tREW8YboOY4=;
        b=Ez2mx+2NXdt1yyGe/4IIOVsOvk+JAwEP8VBKamkE/fxoQYEblNrBBKM+UR2EqLO83l
         u+2Co5K2ZV0cXhj06l7JW9YOaQNf2uLvnT992oDXl95hfsNyVhTB0KqhPyElR5HCrCc6
         qgkK6DL2rmOSCo50Qqt8tYtVsuPnfm6augyQjCBMPSXYUCOKf2g0Ra1oKi1tQ0EqboTS
         oiGC8D16PaTJe0MQjQdb9N7EhNcX0JC/J6EJKQZVdBgtQSyvzqoVtEVvsJILNP5HHugT
         14WFCptGOhqA7Oyt4cAhcEFe6LA3Ky7VXFotoP7ZjijlzdYtIDNvuEgQCttINhQLXwxI
         vYyA==
X-Forwarded-Encrypted: i=1; AJvYcCXqDxrcrH0/nbLkNCWAEsdeAF1/s9gx+hGcZt3Fc+FzjkvptWU93kMWrWXg0qutsCKzgQx1wZtpQKX6hgGvVtwsu2cwjt622k2LmBHRkm2rWrJy
X-Gm-Message-State: AOJu0YxXu6hh1tu+PNRSWcamW6OqoHeEU+UAeXBITizPkr2fefp/Nw9X
	S/XxbYJ92nvOgTfR69NDkkARt4TJc5Awifnx6wcxk2hZKKMJMwohg66uPAv022U0NLK+CFIm1n8
	oTDcUQNAbHyppzE/lVFQo+UJB8vprkrFgzcBV
X-Google-Smtp-Source: AGHT+IFv2EhtdnevSPCvIeqSgMPmgn2c2ifR+LCf/RGmcOYSAbDEQu2piNDxPs8NQh7dFB09wa+cSR9ks7fS+1w/wzo=
X-Received: by 2002:ac2:4c92:0:b0:52b:84bd:344f with SMTP id
 2adb3069b0e04-52bab4fa611mr941691e87.53.1717575331623; Wed, 05 Jun 2024
 01:15:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240531-da7219-v1-1-ac3343f3ae6a@chromium.org>
In-Reply-To: <20240531-da7219-v1-1-ac3343f3ae6a@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 5 Jun 2024 16:15:20 +0800
Message-ID: <CAGXv+5G3RjUOyGR2kqd1V-keQZLvBPaMmiW8BZgLGw6jcZe0nA@mail.gmail.com>
Subject: Re: [PATCH RFT] ASoC: mediatek: mt8183-da7219-max98357: Fix kcontrol
 name collision
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alper Nebi Yasak <alpernebiyasak@gmail.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_011548_259696_BA42EEAF 
X-CRM114-Status: GOOD (  23.33  )
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

On Fri, May 31, 2024 at 4:38=E2=80=AFPM Hsin-Te Yuan <yuanhsinte@chromium.o=
rg> wrote:
>
> Since "Headphone Switch" kcontrol name has already been used by da7219,
> rename the control name from "Headphone" to "Headphones" to prevent the
> colision. Also, this change makes kcontrol name align with the one in

  ^ collision

> mt8186-mt6366-da7219-max98357.c.
>
> Fixes: 9c7388baa2053 ("ASoC: mediatek: mt8183-da7219-max98357: Map missin=
g jack kcontrols")
> Change-Id: I9ae69a4673cd04786b247cc514fdd20f878ef009
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
> This patch fix the kcontrol name collision in mt8183-da7219-max98357.c.
> Originally, the "Headphone" kcontrol is added to meet PulseAudio's and
> PipeWire's needs, but that patch was untested. Since I don't have
> either setup, I wonder if someone can test this patch.
> ---
>  sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/s=
oc/mediatek/mt8183/mt8183-da7219-max98357.c
> index acaf81fd6c9b..f848e14b091a 100644
> --- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
> +++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
> @@ -31,7 +31,7 @@ struct mt8183_da7219_max98357_priv {
>
>  static struct snd_soc_jack_pin mt8183_da7219_max98357_jack_pins[] =3D {
>         {
> -               .pin    =3D "Headphone",
> +               .pin    =3D "Headphones",
>                 .mask   =3D SND_JACK_HEADPHONE,
>         },
>         {
> @@ -626,7 +626,7 @@ static struct snd_soc_codec_conf mt6358_codec_conf[] =
=3D {
>  };
>
>  static const struct snd_kcontrol_new mt8183_da7219_max98357_snd_controls=
[] =3D {
> -       SOC_DAPM_PIN_SWITCH("Headphone"),
> +       SOC_DAPM_PIN_SWITCH("Headphones"),
>         SOC_DAPM_PIN_SWITCH("Headset Mic"),
>         SOC_DAPM_PIN_SWITCH("Speakers"),
>         SOC_DAPM_PIN_SWITCH("Line Out"),
> @@ -634,7 +634,7 @@ static const struct snd_kcontrol_new mt8183_da7219_ma=
x98357_snd_controls[] =3D {
>
>  static const
>  struct snd_soc_dapm_widget mt8183_da7219_max98357_dapm_widgets[] =3D {
> -       SND_SOC_DAPM_HP("Headphone", NULL),
> +       SND_SOC_DAPM_HP("Headphones", NULL),
>         SND_SOC_DAPM_MIC("Headset Mic", NULL),
>         SND_SOC_DAPM_SPK("Speakers", NULL),
>         SND_SOC_DAPM_SPK("Line Out", NULL),
> @@ -680,7 +680,7 @@ static struct snd_soc_codec_conf mt8183_da7219_rt1015=
_codec_conf[] =3D {
>  };
>
>  static const struct snd_kcontrol_new mt8183_da7219_rt1015_snd_controls[]=
 =3D {
> -       SOC_DAPM_PIN_SWITCH("Headphone"),
> +       SOC_DAPM_PIN_SWITCH("Headphones"),
>         SOC_DAPM_PIN_SWITCH("Headset Mic"),
>         SOC_DAPM_PIN_SWITCH("Left Spk"),
>         SOC_DAPM_PIN_SWITCH("Right Spk"),
> @@ -689,7 +689,7 @@ static const struct snd_kcontrol_new mt8183_da7219_rt=
1015_snd_controls[] =3D {
>
>  static const
>  struct snd_soc_dapm_widget mt8183_da7219_rt1015_dapm_widgets[] =3D {
> -       SND_SOC_DAPM_HP("Headphone", NULL),
> +       SND_SOC_DAPM_HP("Headphones", NULL),
>         SND_SOC_DAPM_MIC("Headset Mic", NULL),
>         SND_SOC_DAPM_SPK("Left Spk", NULL),
>         SND_SOC_DAPM_SPK("Right Spk", NULL),
>
> ---
> base-commit: 4a4be1ad3a6efea16c56615f31117590fd881358
> change-id: 20240531-da7219-2281085838a5
>
> Best regards,
> --
> Hsin-Te Yuan <yuanhsinte@chromium.org>
>
>

