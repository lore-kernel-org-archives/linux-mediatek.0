Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F63D66BAC
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2024 03:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BwexJOM8Lt6eGEeXs/wFnXLrXF44Ff0XiaeHC8NyObQ=; b=kQ6bjhmYHPyzJ4dmECIsOh9DtU
	7m9/Xr6QFCSVqLgt49GUkGscraKpUT1gIAmdFYydd1bOKnI4sjFrjMPjuiqOlnYhsWGsiY89K755H
	H36GejTGc4CXWs3pJgmovgKm7vJR6OVqzvmFWkF88CrsyvGHKbNDrpm2TG3v+Sc/5yH+L/Kb2okD1
	OqP8hrYxlqceNyV8PuKGTKKpPOvpsOH5PX1WBsi5xo7nFpl7wJ03bV3Hb2h8u7Xm0V5HURLp9CIs+
	CQPLgCeb2pyNWzV7ycauNTXlj+fQMefeRycTTpK6tgQol1m6Pcu4QI3C2qs/mOp4xuGdzNOkGbzTn
	/ZrsuJKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG8I6-0000000C7gA-34eC;
	Wed, 27 Nov 2024 03:00:34 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG8I4-0000000C7fI-1Wlh
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Nov 2024 03:00:33 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-4aad848f2f1so1812504137.2
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Nov 2024 19:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732676430; x=1733281230; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwexJOM8Lt6eGEeXs/wFnXLrXF44Ff0XiaeHC8NyObQ=;
        b=KDaxNkqgfpXsdbrgxlidFxJEmmJX2NnXCF4YT2ylU0+/NiYFrsLU0h/8tDiytTREYT
         qdHwcQ7xNVvKsAE5tHj12IbODmd6fj5PS9lYr1Kw+WcIzoi43tyd5rIy0/RE/aXQe0Bm
         ltgUeA5CgOrfzCT+2CNLSxfr5hzzou2wFLrko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732676430; x=1733281230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwexJOM8Lt6eGEeXs/wFnXLrXF44Ff0XiaeHC8NyObQ=;
        b=iWV7oO9X3eXR9Sh0LAiGHwWVLkJE6b1rD+pGiCR/IFpXbqBZZn0qMPTbs7jpkpz1+Y
         lZA1GZlwDC3ksfkUpd0GoQFEP/W08jcijOYwOW2OlBdWJoNGf/J1iFGLUpmalhesNPPR
         +hfqlMR1nmP/H5n6JigZ/Z2Qf1HkzdJ/s3GrKs3Es4fb9puv/KqoGRT2mOMHFc8w0xpA
         zTBIGpYJJQ86WCRVczfSMGRCbGDjMDBkD25Gr8O2brbYbp4Rp9gMfyYrAAJFMHAfVLmI
         BJoNJlU4F9qJZ0mcEwIVbXHWZUNaJp0P88aGRA9FtJKQFRUSD/4dPsps1CBMqCG+f+BN
         wAOw==
X-Forwarded-Encrypted: i=1; AJvYcCWKT6XFf97xr5wuLKhyostmUa+NNb39gNqQXXb/SV5tzvHMGn2yzs7/p5raXrdY/07dUZbAW6WVK7melbry4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwaJ7R60z4ePdr9kgtAzXKNd+6AyWYVRcwD0/GY2UsZbssHSi/K
	mHQ9Gdptg6GISfb/azEFmw9fTdBUBOMo74f8RLj1bWEY2hAeSOZuLXGwRCQl4nh7avQKHBZjmPg
	=
X-Gm-Gg: ASbGncskxzf4wWnuoCrz9mlN27s3nNc1hqqNfdg1NN8DrMqWQXQGvO0OC2lTMxGDWIz
	TVWRuqs8HV1bP4IsVvJ28B++siIcIQTy7QPUe+bLaQ22S0EF2HOw4N3DUbH6VbAPGZTtzTz2DBQ
	OtKMZdmU7yNmHXdifWZg/jD5iMgM77cqpdRjEiO7ZvM4v46t+1Yh0l7RbtrxYQs3CEZybfbgWZN
	VY/QTxPz5x9499YSlrGi5uDYznwdOUhoxPd/g/IpXr5WbAGwl0pZOzv/Nx7F11AdCp80Yi1k1l0
	3+9psA9G5g==
X-Google-Smtp-Source: AGHT+IHfujbKOh9mOWZTBZFpzdpynVQCzxWzsF7Q2R0y8ORYOC0qYP/813RUagWnmY5soN/11VmFmw==
X-Received: by 2002:a05:6102:dcd:b0:4af:3fa2:2bed with SMTP id ada2fe7eead31-4af447f7f26mr2626582137.12.1732676430371;
        Tue, 26 Nov 2024 19:00:30 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85b4e983c55sm509764241.30.2024.11.26.19.00.29
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 19:00:29 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4adc672f2ffso1576359137.3
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Nov 2024 19:00:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVE82UxG3iZorgIIfaM+CzfHvD9Me+nk7LkHMVal6VN4P0B531c6I8TlnvHIHwlSrDhep5nkltcljOHiE5hFA==@lists.infradead.org
X-Received: by 2002:a05:6102:c03:b0:4af:4b03:4b8 with SMTP id
 ada2fe7eead31-4af4b0306b9mr275735137.7.1732676429255; Tue, 26 Nov 2024
 19:00:29 -0800 (PST)
MIME-Version: 1.0
References: <20241126-asoc-mtk-dummy-panic-v1-1-42d53e168d2e@collabora.com>
In-Reply-To: <20241126-asoc-mtk-dummy-panic-v1-1-42d53e168d2e@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 27 Nov 2024 10:59:53 +0800
X-Gmail-Original-Message-ID: <CAC=S1nh6nE1+whLEUcAVG7LyoJ=o7oakR_k6=rjoYYoMSnfS2Q@mail.gmail.com>
Message-ID: <CAC=S1nh6nE1+whLEUcAVG7LyoJ=o7oakR_k6=rjoYYoMSnfS2Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: Check num_codecs is not zero to avoid
 panic during probe
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, kernel@collabora.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_190032_427425_850FBF01 
X-CRM114-Status: GOOD (  21.00  )
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

On Wed, Nov 27, 2024 at 4:10=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Following commit 13f58267cda3 ("ASoC: soc.h: don't create dummy
> Component via COMP_DUMMY()"), COMP_DUMMY() became an array with zero
> length, and only gets populated with the dummy struct after the card is
> registered. Since the sound card driver's probe happens before the card
> registration, accessing any of the members of a dummy component during
> probe will result in undefined behavior.
>
> This can be observed in the mt8188 and mt8195 machine sound drivers. By
> omitting a dai link subnode in the sound card's node in the Devicetree,
> the default uninitialized dummy codec is used, and when its dai_name
> pointer gets passed to strcmp() it results in a null pointer dereference
> and a kernel panic.
>
> In addition to that, set_card_codec_info() in the generic helpers file,
> mtk-soundcard-driver.c, will populate a dai link with a dummy codec when
> a dai link node is present in DT but with no codec property.
>
> The result is that at probe time, a dummy codec can either be
> uninitialized with num_codecs =3D 0, or be an initialized dummy codec,
> with num_codecs =3D 1 and dai_name =3D "snd-soc-dummy-dai". In order to
> accommodate for both situations, check that num_codecs is not zero
> before accessing the codecs' fields but still check for the codec's dai
> name against "snd-soc-dummy-dai" as needed.
>
> While at it, also drop the check that dai_name is not null in the mt8192
> driver, introduced in commit 4d4e1b6319e5 ("ASoC: mediatek: mt8192:
> Check existence of dai_name before dereferencing"), as it is actually
> redundant given the preceding num_codecs !=3D 0 check.
>
> Fixes: 13f58267cda3 ("ASoC: soc.h: don't create dummy Component via COMP_=
DUMMY()")
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

I noticed the same issue on MT8188, so it's really nice to see this
fix. Many thanks!

Regards,
Fei

