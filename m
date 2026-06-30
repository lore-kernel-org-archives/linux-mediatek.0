Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF1CC43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 09:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mc8cfwvLT4bAM4tk7++9grOS37/A0u8v1goWlPe04Vo=; b=zBAoIVyoyfPaRO7rtZloaHmyu2
	sg63RptlGoPJ1ONmIVYHl5uyyAa9NXaXB2j0VFuHoYmXWkEP8tEHpDnUNM7FZiKopvImUi+GoYUky
	A1C0zrQpQJyoY9Dw44blst2zU69vBTx3Hd9MRITKkxHSn9Io6Oulzoqe0IMLk+kf2j9jylX2V9Ejo
	OaS6aeBcD4Gm8RKSmycwfC/0uT+pEvlTDh5gAq4FK9Yf1V8dL1HRcMcWL+0m+saWRvLWWc2vGx7rl
	dgnpavRYXyWYY/7QctbJibbnU9NVZrhfGTS99yUzCOjLF+pNFbybrSGvyQj/005LdwFWvDWPN1xfD
	BhFYn6mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUYP-0000000GN8I-2iu1;
	Tue, 30 Jun 2026 09:14:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUYN-0000000GN6V-22fj
	for linux-mediatek@bombadil.infradead.org;
	Tue, 30 Jun 2026 09:14:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mc8cfwvLT4bAM4tk7++9grOS37/A0u8v1goWlPe04Vo=; b=jXTRDYwOEka6RNgze/axnXVecs
	bQNO7cZP6Es5XnVhFWEnjkzIgdf+qHZlMJBsLW9hUflhRQgaYM+A+Ca9ix+v1miTjqIMy8REa0Naz
	dx2tQib/mHHAgmUrnNUBO+k32APbkzC75W0g8x2937j3o8g9B7nJH7EX5JcqaY0TlYyFDszv4cJcP
	sWg9nSztjz5JOXClcs4iPs3Isy+xOkpO/XG83nkIaO7w0XSfiQrOj240PbVT6NFq7Pee6Df/g+S6E
	aUEIvz3Z4/Yz/2pNPNmmcG+ncqp3nPSDgQceWMjwdF5ekpBgtoDU0Yqb869MPfvHP7TxbAPH/tWPR
	kFq+xZeg==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weUYJ-00000001h9J-1nbA
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 09:14:49 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2c74383c93cso39601945ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2026 02:14:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782810885; cv=none;
        d=google.com; s=arc-20260327;
        b=qu2Qgdua4hx8Zvsupimz6RfnZyTn0rBFluFFP45QaEMXL96fBH/bOH1bv0HiKhZcm2
         ZHbZHiPHVOds42v2HETwck4ZOsQxzgA5H/gNPucgOUiYLiQB+IChakTu5Jbrt8FSbc7o
         YXubRPXj4GrBWQRVyFMXa47cvr2mpH7kMnhURhk34uO0tLh2j/bZLY5Arp+Lqwgqsba5
         XBiQo86CsNqnnY84f2YlQJ63ELHJ6f7WKWLN0xaQoS8HT1hcShF+Td8rCtqTj72qYQym
         WxsP80NICrhADNsSPg9FmYzHuvDuko2jD9Y1KTHElI+653jvmb7AtrY2g1TF+aWdPxgB
         44ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mc8cfwvLT4bAM4tk7++9grOS37/A0u8v1goWlPe04Vo=;
        fh=PKEO8zUceNvtog/QeBDx2EXhnDscTw5iMVW5Y1VK5j4=;
        b=CgJGduqARmZ5ayXPuT6rNE5zlKXmG3hP3zzhj4/0+USzpxu++6s+/OwDnJIT+jl9BB
         krknHualGLkxJgp2189h+wth8i8dGO5+rhtS3dcFjFE+fWGaYWYIbln/kyjNCVTWgH/g
         Ca/tJgw50SR8c6+x1toMXZS2m5glatSStTKu667IOjw6YaDTW24CCGZH9jnL+G6leFjK
         nPIPM6bzErM2xJSRYseroUZP9pSA4F1EIrdPDkonCVCp3siaUSC/4QbWP3muiRbFSjNE
         pKgtpfudoXAOFCCTmfzEHn5x7tKRCzq3qqlSCgP/T2Ha4JXJ0Q3O3D8pkzgSMglCjGEP
         yHvg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782810885; x=1783415685; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mc8cfwvLT4bAM4tk7++9grOS37/A0u8v1goWlPe04Vo=;
        b=PtpXDbDtdjq0391tEKvPG4p7uLRz40nQsdKURCNnmNxYBEqgJ1TDg3MtEMBmCLd8rf
         1u6p+oiDyrXljMyr3gAEGLI0L3x39TLhmypn3h9oItiY0A625CQmRXKlFw9u1D6VYbK9
         umlwPh4aThEUNU5k5PAiqJfDFi7cBR0+aGM/ja+hjskBzzJ6QPLP+2bmqVcKLmvSGDr4
         6Ijvw5zNKCG9AAUXftjqjYx3T0FhOi0iG+w523NU50Ut2TWqbxrTlBzAp8BpwEG/3M6A
         PVJwkOuXir0YYvU+4Ni2fK2QtRQ8IJSKMxFPqYMUCed9qwJ7uL9OGbxHmB3w+p4kzBux
         ZUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782810885; x=1783415685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mc8cfwvLT4bAM4tk7++9grOS37/A0u8v1goWlPe04Vo=;
        b=CsBv9c4gFatsjdKp0Xpi2gXOtGIbwGv9Wz511rZsu9AqlahYt48Po88ldELpmNHKKu
         CJ1m2fxold785t86sNwm1FH01BtJh769t4d57/oHPHpzmrt38Lys0Mdl43KM78uZj7qq
         j+ZfY9iyx+/GNW8cNHTSQZJheSGYjmdsQHFLr+OlSrxPFdmp21kx+OSRoU3WPV+uMPab
         JQbVAPy/5DDSi2X+hWLH60LuIta6fMphhKdm9f7zqNoLBe9LwO4cO2T1bZeamkXdZRwt
         Gq3SIH/GZpSW8Yd9NmbW7pQS32Aowi28725Bo+pu7+ovVtOcsYsHshvgxqT/cytBZaF0
         usMQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro1ICRKIB8kh8mapvt6SFDBhtNG+LDPfbABq582G9edp150CKQoaFD8m6D5NbWy8ESTjJ+5B4L5yM6j95l0oA==@lists.infradead.org
X-Gm-Message-State: AOJu0YycqnE7vmoU+O/J5lhi6Di1AhNZZfy4Nb+PnUtDefjkILvVwNce
	gZ785jQvCNqoaHKHe99WIy7DeEx/MoBIKRvt6u0Ac7Jp+wcj8XLmv1a1/sXHjPw0h9Xi8lrkCtg
	ucPeLI5H8Y/l1Z6oNbXxdBx0Z0kD8DbM=
X-Gm-Gg: AfdE7ckb1L91wmdp4GNGj0z0faXIKHPD8WTL/tQTNPDEguWt0jUJr+NqjpYQ7BfoEAW
	9AmuniHKkzJMdxb2mICUT6vYvfCNkp66/3lXw8QjQ5nwSMB+h2hGBJ+caTmz1VCkDYgGUxoWJBS
	8ri7jXZ58J3/JKYL4bnLaCrEv2pMp8hMSFq1lqF9JoXTj5T/nBnzEt0BWxCRZPl75hRUTWyQCPF
	r4adD9NU79koClQQkSUa1P+SXL0tinMhiuD7OhrNCUhHnj18OtuFVEd0dgT9uOEGWrMC2NN+AJz
	lBmoGCTuWLBXIm9LGD0Ei5NNnK8=
X-Received: by 2002:a17:902:fd83:b0:2c9:97a7:3276 with SMTP id
 d9443c01a7336-2ca2ea335c2mr19419135ad.39.1782810884946; Tue, 30 Jun 2026
 02:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
 <20260630063449.503996-10-phucduc.bui@gmail.com> <20260630092821.650c30ec@bootlin.com>
In-Reply-To: <20260630092821.650c30ec@bootlin.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 30 Jun 2026 16:14:33 +0700
X-Gm-Features: AVVi8CdpcGsQO7j2elPBPz0Nft0JM37FEMmCfPqP7T8On5LblxvKpA_DrRSwZCQ
Message-ID: <CAABR9nG5Wo1Wb+2_T6dR+6XTw8Vs9awSpQrSZ+k6=jp_ogoGCw@mail.gmail.com>
Subject: Re: [PATCH 09/27] ASoC: codecs: idt821034: Use guard() for mutex locks
To: Herve Codina <herve.codina@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>, 
	Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Srinivas Kandagatla <srini@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, u.kleine-koenig@baylibre.com, 
	Zhang Yi <zhangyi@everest-semi.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_101448_272191_07294AEF 
X-CRM114-Status: GOOD (  25.74  )
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

On Tue, Jun 30, 2026 at 2:28=E2=80=AFPM Herve Codina <herve.codina@bootlin.=
com> wrote:
>
> Hi,
>
> On Tue, 30 Jun 2026 13:34:31 +0700
> phucduc.bui@gmail.com wrote:
>
> > From: bui duc phuc <phucduc.bui@gmail.com>
> >
> > Clean up the code using guard() for mutex locks.
> > Merely code refactoring, and no behavior change.
> >
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> > ---
> >  sound/soc/codecs/idt821034.c | 121 +++++++++++++++--------------------
> >  1 file changed, 51 insertions(+), 70 deletions(-)
> >
> > diff --git a/sound/soc/codecs/idt821034.c b/sound/soc/codecs/idt821034.=
c
> > index 084090ccef77..078de6c9c395 100644
> > --- a/sound/soc/codecs/idt821034.c
> > +++ b/sound/soc/codecs/idt821034.c
> > @@ -6,6 +6,7 @@
> >  //
> >  // Author: Herve Codina <herve.codina@bootlin.com>
> >
> > +#include <linux/cleanup.h>
> >  #include <linux/bitrev.h>
> >  #include <linux/gpio/driver.h>
> >  #include <linux/module.h>
>
> Alphabetic order. Move <linux/cleanup.h> after <linux/bitrev.h>.
>
> ...
>
> > @@ -456,7 +457,7 @@ static int idt821034_kctrl_gain_put(struct snd_kcon=
trol *kcontrol,
> >
> >       ch =3D IDT821034_ID_GET_CHAN(mc->reg);
> >
> > -     mutex_lock(&idt821034->mutex);
> > +     guard(mutex)(&idt821034->mutex);
> >
> >       if (IDT821034_ID_IS_OUT(mc->reg)) {
> >               amp =3D &idt821034->amps.ch[ch].amp_out;
> > @@ -466,21 +467,18 @@ static int idt821034_kctrl_gain_put(struct snd_kc=
ontrol *kcontrol,
> >               gain_type =3D IDT821034_GAIN_TX;
> >       }
> >
> > -     if (amp->gain =3D=3D val) {
> > -             ret =3D 0;
> > -             goto end;
> > -     }
> > +     if (amp->gain =3D=3D val)
> > +             return 0;
> >
> >       if (!amp->is_muted) {
> >               ret =3D idt821034_set_gain_channel(idt821034, ch, gain_ty=
pe, val);
> >               if (ret)
> > -                     goto end;
> > +                     return ret;
> >       }
> >
> >       amp->gain =3D val;
> >       ret =3D 1; /* The value changed */
> > -end:
> > -     mutex_unlock(&idt821034->mutex);
> > +
> >       return ret;
>
> Instead of
>         ret =3D 1; /* The value changed */
>         return ret;
>
> Call directly
>         return 1; /* The value changed */
>
> >  }
>
> ...
> > @@ -521,7 +519,7 @@ static int idt821034_kctrl_mute_put(struct snd_kcon=
trol *kcontrol,
> >       ch =3D IDT821034_ID_GET_CHAN(id);
> >       is_mute =3D !ucontrol->value.integer.value[0];
> >
> > -     mutex_lock(&idt821034->mutex);
> > +     guard(mutex)(&idt821034->mutex);
> >
> >       if (IDT821034_ID_IS_OUT(id)) {
> >               amp =3D &idt821034->amps.ch[ch].amp_out;
> > @@ -531,20 +529,17 @@ static int idt821034_kctrl_mute_put(struct snd_kc=
ontrol *kcontrol,
> >               gain_type =3D IDT821034_GAIN_TX;
> >       }
> >
> > -     if (amp->is_muted =3D=3D is_mute) {
> > -             ret =3D 0;
> > -             goto end;
> > -     }
> > +     if (amp->is_muted =3D=3D is_mute)
> > +             return 0;
> >
> >       ret =3D idt821034_set_gain_channel(idt821034, ch, gain_type,
> >                                        is_mute ? 0 : amp->gain);
> >       if (ret)
> > -             goto end;
> > +             return ret;
> >
> >       amp->is_muted =3D is_mute;
> >       ret =3D 1; /* The value changed */
> > -end:
> > -     mutex_unlock(&idt821034->mutex);
> > +
> >       return ret;
>
> Instead of
>         ret =3D 1; /* The value changed */
>         return ret;
>
> Call directly
>         return 1; /* The value changed */
>
> >  }
> >
> > @@ -629,7 +624,7 @@ static int idt821034_power_event(struct snd_soc_dap=
m_widget *w,
> >       ch =3D IDT821034_ID_GET_CHAN(id);
> >       mask =3D IDT821034_ID_IS_OUT(id) ? IDT821034_CONF_PWRUP_RX : IDT8=
21034_CONF_PWRUP_TX;
> >
> > -     mutex_lock(&idt821034->mutex);
> > +     guard(mutex)(&idt821034->mutex);
> >
> >       power =3D idt821034_get_channel_power(idt821034, ch);
> >       if (SND_SOC_DAPM_EVENT_ON(event))
> > @@ -638,8 +633,6 @@ static int idt821034_power_event(struct snd_soc_dap=
m_widget *w,
> >               power &=3D ~mask;
> >       ret =3D idt821034_set_channel_power(idt821034, ch, power);
> >
> > -     mutex_unlock(&idt821034->mutex);
> > -
> >       return ret;
>
> Instead of
>         ret =3D idt821034_set_channel_power(idt821034, ch, power);
>         return ret;
>
> return directly:
>
>         return idt821034_set_channel_power(idt821034, ch, power);
>
> and remove the 'ret' variable (no more used)
>
> >  }
> >
>
> ...
> > @@ -771,7 +764,7 @@ static int idt821034_dai_set_fmt(struct snd_soc_dai=
 *dai, unsigned int fmt)
> >       u8 conf;
> >       int ret;
> >
> > -     mutex_lock(&idt821034->mutex);
> > +     guard(mutex)(&idt821034->mutex);
> >
> >       conf =3D idt821034_get_codec_conf(idt821034);
> >
> > @@ -785,12 +778,10 @@ static int idt821034_dai_set_fmt(struct snd_soc_d=
ai *dai, unsigned int fmt)
> >       default:
> >               dev_err(dai->dev, "Unsupported DAI format 0x%x\n",
> >                       fmt & SND_SOC_DAIFMT_FORMAT_MASK);
> > -             ret =3D -EINVAL;
> > -             goto end;
> > +             return -EINVAL;
> >       }
> >       ret =3D idt821034_set_codec_conf(idt821034, conf);
> > -end:
> > -     mutex_unlock(&idt821034->mutex);
> > +
> >       return ret;
>
> Instead of
>         ret =3D idt821034_set_codec_conf(idt821034, conf);
>         return ret;
>
> return directly:
>         return idt821034_set_codec_conf(idt821034, conf);
>
> and remove the 'ret' variable.
>
> >  }
> >
> > @@ -802,7 +793,7 @@ static int idt821034_dai_hw_params(struct snd_pcm_s=
ubstream *substream,
> >       u8 conf;
> >       int ret;
> >
> > -     mutex_lock(&idt821034->mutex);
> > +     guard(mutex)(&idt821034->mutex);
> >
> >       conf =3D idt821034_get_codec_conf(idt821034);
> >
> > @@ -816,12 +807,10 @@ static int idt821034_dai_hw_params(struct snd_pcm=
_substream *substream,
> >       default:
> >               dev_err(dai->dev, "Unsupported PCM format 0x%x\n",
> >                       params_format(params));
> > -             ret =3D -EINVAL;
> > -             goto end;
> > +             return -EINVAL;
> >       }
> >       ret =3D idt821034_set_codec_conf(idt821034, conf);
> > -end:
> > -     mutex_unlock(&idt821034->mutex);
> > +
> >       return ret;
>
> Idem here:
>         return idt821034_set_codec_conf(idt821034, conf);
>
> and remove 'ret'.
>
>
> >  }
> >
> > @@ -897,11 +886,11 @@ static int idt821034_reset_audio(struct idt821034=
 *idt821034)
> >       int ret;
> >       u8 i;
> >
> > -     mutex_lock(&idt821034->mutex);
> > +     guard(mutex)(&idt821034->mutex);
> >
> >       ret =3D idt821034_set_codec_conf(idt821034, 0);
> >       if (ret)
> > -             goto end;
> > +             return ret;
> >
> >       for (i =3D 0; i < IDT821034_NB_CHANNEL; i++) {
> >               idt821034->amps.ch[i].amp_out.gain =3D IDT821034_GAIN_OUT=
_INIT_RAW;
> > @@ -909,23 +898,22 @@ static int idt821034_reset_audio(struct idt821034=
 *idt821034)
> >               ret =3D idt821034_set_gain_channel(idt821034, i, IDT82103=
4_GAIN_RX,
> >                                                idt821034->amps.ch[i].am=
p_out.gain);
> >               if (ret)
> > -                     goto end;
> > +                     return ret;
> >
> >               idt821034->amps.ch[i].amp_in.gain =3D IDT821034_GAIN_IN_I=
NIT_RAW;
> >               idt821034->amps.ch[i].amp_in.is_muted =3D false;
> >               ret =3D idt821034_set_gain_channel(idt821034, i, IDT82103=
4_GAIN_TX,
> >                                                idt821034->amps.ch[i].am=
p_in.gain);
> >               if (ret)
> > -                     goto end;
> > +                     return ret;
> >
> >               ret =3D idt821034_set_channel_power(idt821034, i, 0);
> >               if (ret)
> > -                     goto end;
> > +                     return ret;
> >       }
> >
> >       ret =3D 0;
> > -end:
> > -     mutex_unlock(&idt821034->mutex);
> > +
> >       return ret;
>
> Instead of
>         ret =3D 0;
>         return ret;
>
> return directly
>         return 0;
>
> >  }
> >
> ...
>
> >
> > @@ -1079,23 +1061,22 @@ static int idt821034_reset_gpio(struct idt82103=
4 *idt821034)
> >       int ret;
> >       u8 i;
> >
> > -     mutex_lock(&idt821034->mutex);
> > +     guard(mutex)(&idt821034->mutex);
> >
> >       /* IO0 and IO1 as input for all channels and output IO set to 0 *=
/
> >       for (i =3D 0; i < IDT821034_NB_CHANNEL; i++) {
> >               ret =3D idt821034_set_slic_conf(idt821034, i,
> >                                             IDT821034_SLIC_IO1_IN | IDT=
821034_SLIC_IO0_IN);
> >               if (ret)
> > -                     goto end;
> > +                     return ret;
> >
> >               ret =3D idt821034_write_slic_raw(idt821034, i, 0);
> >               if (ret)
> > -                     goto end;
> > +                     return ret;
> >
> >       }
> >       ret =3D 0;
> > -end:
> > -     mutex_unlock(&idt821034->mutex);
> > +
> >       return ret;
>
> return 0;
>
> >  }
> >
>
> Best regards,
> Herv=C3=A9
>

Hi Herv=C3=A9,

Thank you for the very detailed review.
I hadn't realized I had missed so many issues.
I'll fix them all and include the updates in v2.

Best regards,
Phuc

