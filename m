Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED1FC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Aug 2024 04:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ZhzJQ+a9Kym4MWHHdIYItKXwrHniaEz0NXbkAmGBpk=; b=4VJ4IUdOHWZUJCD6Neb2o5m+ib
	S6S19yct3XQXAU1HVmNCzd/y3s/Z4JChJghiGp4r9M61LiDMM04URKP1+3xsq1yzm3Me7z6G3hU9j
	Sb+nM0ltcpcLHzwCqOfQq421vTfyyLYyA3YIehuA2kFYRgrQgmyGdrL67DmI468WNDwJJyn+oAVjn
	/1AJEfuI/o8Hvt5mghdDLwsBA4Zm+bZziBWdnb2v+3615+cIh9We7apU8x76+rAoDWlPiTJUMnppk
	bT1RPPeEN7ySBGiWs7ApA2XR4ZGFCdASLDLB53z1BumXg6yETloSN0bcQPOyW93ZpxCgoVI52ohSQ
	LEB/IpVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZN0c-00000003dhP-3R9g;
	Thu, 01 Aug 2024 04:01:46 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZN0Z-00000003dfV-3tVY
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Aug 2024 04:01:45 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-52f008aa351so9452654e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Jul 2024 21:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722484901; x=1723089701; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZhzJQ+a9Kym4MWHHdIYItKXwrHniaEz0NXbkAmGBpk=;
        b=E4DMxMXrIXI3gehkklWUcgdWYDtw5/mfUtvu0a8/Y2qLWjwr2oSTTTDWbRJDYhTe4v
         ub/sMPTUudBif5ls/zzCrCYf2U2SwZ1fqy+iFTvGANMvGu1h+AWKVNEIG2i4dwMderN8
         KIYVVQS1rgaAswK+9UzBWb+F7gp7IbGWdeq34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722484901; x=1723089701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ZhzJQ+a9Kym4MWHHdIYItKXwrHniaEz0NXbkAmGBpk=;
        b=X2st+qc+09nCv32nSwOJBZxBrvPn/3MNOsVd4Fm85l3Bvotar7w0Jc50u2WrymbErx
         aeZCOyEQNRpHXdTejWZ8g22DnO0nrnwDQdrzPXJn2dFL1PrefAyyb6b5jwo9oqENacdn
         fTdOtnuSXbDQMm76FquH8ZQxipSyJFUyXuqvins2ycSI2fzAEXHBzFIP33ak3LsFWHb5
         fm60vQJNpCWKZdz+Lwx0cbppbB1BJrLvRI6qYqiMGv0FugaJKA8PUfXINFmc71AVBxTb
         zvnYptz0IaxmRh44thUKYjdDVhUoOqkk2Pahe6oXnJtHFmCSnTIhsvZc10mZ+t1kOG2V
         3EKQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8kMkYRjewPO3JTFTEfYEO8kasNNJe48oLyOP6ZWEoah7exboC+6aMOCgMVb9quQsyHWd0MMgu6FghOz1zgVPu6Tk/I/+Kt0/BoY7it7ANltR3
X-Gm-Message-State: AOJu0YwPVYXnuRbSzYYGW8U6LLF/jepFANZ4ZhgNWsrchoTUxzCot1nf
	OTPwgb8cZxsHCPgO3nmmSHVZAKb+WFBujV7ruKzyQMB35SKH3FtQ5Rsz5pLyoceaj/6O1PW4Lfr
	KPPk1+I386qSfGaPKA6guGJmeNrvyEhT9r3Mg
X-Google-Smtp-Source: AGHT+IFbtjXGKr6OpFxpL2naXVX3atufbKENiq30EYD5eQDXV5YXSmf+M0f6uFAMeZOGG4Sdlo5YmT711IgA5wFEMPY=
X-Received: by 2002:a05:6512:251f:b0:52e:a60e:3a08 with SMTP id
 2adb3069b0e04-530b61a607fmr640260e87.11.1722484901244; Wed, 31 Jul 2024
 21:01:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240801031030.31114-1-yr.yang@mediatek.com>
In-Reply-To: <20240801031030.31114-1-yr.yang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 1 Aug 2024 12:01:30 +0800
Message-ID: <CAGXv+5EYMgeNnQ3BU8cxy0a5aH8e+GbO=-OFVysU2MqBy+yQFQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] ASoC: mediatek: mt8188: add register to volatile_register
To: "yr.yang" <yr.yang@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_210144_004975_DA6C0369 
X-CRM114-Status: GOOD (  17.89  )
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

Hi,

On Thu, Aug 1, 2024 at 11:11=E2=80=AFAM yr.yang <yr.yang@mediatek.com> wrot=
e:
>
> From: YR Yang <yr.yang@mediatek.com>
>
> Add AFE Control Register 0 to volatile_register.
> AFE_DAC_CON0 can be modified by both SOF and ALSA driver.
> If this register read & write by cache mode,
> the cached value may be not the real value
> when the register modified by other side.
> It will cause playback or capture fail.
> Need add AFE_DAC_CON0 to volatile register.

You should mention this specific register in the patch subject.
Something like:

ASoC: mediatek: mt8188: Mark AFE_DAC_CON0 register as volatile


ChenYu

> Signed-off-by: YR Yang <yr.yang@mediatek.com>
>
> ---
>  sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/media=
tek/mt8188/mt8188-afe-pcm.c
> index ccb6c1f3adc7..73e5c63aeec8 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
> @@ -2748,6 +2748,7 @@ static bool mt8188_is_volatile_reg(struct device *d=
ev, unsigned int reg)
>         case AFE_ASRC12_NEW_CON9:
>         case AFE_LRCK_CNT:
>         case AFE_DAC_MON0:
> +       case AFE_DAC_CON0:
>         case AFE_DL2_CUR:
>         case AFE_DL3_CUR:
>         case AFE_DL6_CUR:
> --
> 2.34.1
>
>

