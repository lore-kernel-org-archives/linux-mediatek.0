Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A24E7718E
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2024 15:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHNh6xaotAcDhMoavkjLsKkfYgn6RRMW6uLTCVB7138=; b=GHEXSZ6envoogOav8ItgEmHWIZ
	n2tztKjccI99MSxBGhSsY+S5d4tTd+9z31sM40SYIFGg/TdcuJp4EsovsKNSapNRNJXJKPHEEg8zU
	9A+cUYaESh1qaitIT0NS0P3X81QipXj7jwtvtStKRSbUXESNCwFrVsPeDy3ePLaD3TYC91a5ZFeEe
	EvIV/9tto80PF7CQ+6bd9OPv98xbgArtEtO/tV0dpE2RWXnFTXWp+bCKjGIir438pOWB3UjfaoyIH
	w4nBPm2E01YeuybbHAmlB0JRzidSADAyluJlxQrf1Em+Bkj+Vl+hR7kPQhgSXeN/+mprrkj76aoHZ
	hm9KlMVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPkoA-0000000AK6Q-2Fw8;
	Mon, 23 Dec 2024 15:57:26 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPko8-0000000AK5C-03bB
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Dec 2024 15:57:25 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-53f757134cdso4789983e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Dec 2024 07:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734969442; x=1735574242; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHNh6xaotAcDhMoavkjLsKkfYgn6RRMW6uLTCVB7138=;
        b=mVtMx8v2bemdLFYtsEvWWkm2ieBnAy7Tqp+qDdxMIASOsvQ7XSU5BXgVRzfIDD/h/y
         Iwn+OOTno+GTgb1zJ45UgUfWmJ6V0PBtB4qy3W84pGC24fCgxis8Q2x0hWXyz4nhk/5M
         y8/gUxjoR7u15kTnhBvOzkHatiToigRC/FuGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734969442; x=1735574242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHNh6xaotAcDhMoavkjLsKkfYgn6RRMW6uLTCVB7138=;
        b=wXnmccGBOImqZudhlQl4JHbbMd/IOKpIXwz1Uyka6lDET/t2A/9XMGBU2rToPFwlPa
         9XRJjqTrFHMTKR1neEqc4MP9O4vSlE6iDlGOGgpBwPQbnq/s3eqVoozK+hw5DQY9ghBU
         ljV3o/l/BXQS1lujMygRgI5/CDZVMwBBeZ41CTHZx8KtguIXJGagb7+0GTn+Ozlw6Tfa
         1cOZu0F18Sk16F3KlbP1vz3VGgk0UgJ1al/0488a1kU3yQkfbt+VvudK4B9+M1YqVcwN
         r8BD43ytoYT85GyQKqwAL+xTmFh4nPVfGnKKCfj2APAWgNzYQSM0RYhn9V7s6r5BL7X3
         +v9A==
X-Forwarded-Encrypted: i=1; AJvYcCWDbbbCaidFCgnbk7nQ9so5vOq1S4fV6keNRHhc0aSzgO6tqjlVwpjWfDeph6arWHO19jBXcE0q1K72fS3xqA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzun9DqERAndS7jgHEcNl8ExDHgWDsIUkF1pFFdMB56SWo9jgGU
	J757f6YbKKaDUqZc7vrbXJTAIK+X64qiMOSWvzh8wFz3qao9rJ5UUNCXnPx/7JswMX1Kll2/xTf
	BGbcEM/gYluyvg9LkZO+FV3UEK0pKImXAe2gU
X-Gm-Gg: ASbGnctmlzvSkB5DHCftJDJFaCGLBWeiJTX4GgL1X2K9jApGuEW6OFsVryFBA9P9Pd6
	1eP8C6cKfYB1jHhxBmKfKH4RlLQUL4Yh5MzV9GVkI5AJCWnysqYeGgIaz2g+UEdl4TBjy
X-Google-Smtp-Source: AGHT+IHTk73CF3J9qpxOzp/CqtNyBOpJFRPOv7NC03ghiS4H+MWUanEiEeuA9ExDqorhspKiS3iAgAIzB0xD0pfy6TY=
X-Received: by 2002:a05:6512:33cd:b0:540:358d:d9b7 with SMTP id
 2adb3069b0e04-5422957ac6cmr4243801e87.52.1734969442045; Mon, 23 Dec 2024
 07:57:22 -0800 (PST)
MIME-Version: 1.0
References: <20241223100648.2166754-1-wenst@chromium.org> <481a6eec-c428-45cd-98a6-5a91f3ceb187@collabora.com>
 <CAGXv+5Fj5s9FUyaxmEkGimxjEcS6OEfm4_5Zso+YocSi+Vt4pg@mail.gmail.com> <bbc6aa2a-fe48-4e06-b070-fd66dbd00e15@collabora.com>
In-Reply-To: <bbc6aa2a-fe48-4e06-b070-fd66dbd00e15@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 23 Dec 2024 23:57:10 +0800
Message-ID: <CAGXv+5FoOM=ZUCWigdCaPbc4FCBtLVX2xnUJnVnVsBH=7yoZ=Q@mail.gmail.com>
Subject: Re: [PATCH] nvmem: mtk-efuse: Enable GPU speed bin post-processing
 for MT8188
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_075724_083862_6044F0A1 
X-CRM114-Status: GOOD (  21.88  )
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

On Mon, Dec 23, 2024 at 7:43=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 23/12/24 12:24, Chen-Yu Tsai ha scritto:
> > On Mon, Dec 23, 2024 at 7:11=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 23/12/24 11:06, Chen-Yu Tsai ha scritto:
> >>> Like the MT8186, the MT8188 stores GPU speed binning data in its efus=
e.
> >>> The data needs post-processing into a format that the OPP framework c=
an
> >>> use.
> >>>
> >>> Add a compatible match for MT8188 efuse with post-processing enabled.
> >>>
> >>
> >> Let's just change the MT8188 compatible list to
> >>
> >> compatible =3D "mediatek,mt8188-efuse", "mediatek,mt8186-efuse";
> >
> > That would be "mediatek,mt8188-efuse", "mediatek,mt8186-efuse", "mediat=
ek,efuse"
> > then?
> >
>
> No, we're dropping the generic "mediatek,efuse".

That means we also drop it for MT8186?

Thinking about it more, I think it's stretching things a bit. The hardware
is clearly backwards compatible, or we wouldn't even be reading values
out correctly. The only difference now with MT8186 and MT8188 is that
they have a speed-bin field with a value that we want passed to the OPP
framework, and the interpretation of that value is not really part of
the efuse's hardware. We chose to do the conversion in the efuse driver,
but we could also have done it in the GPU driver.

What I'm saying is that we should not need to change the compatible strings
to make this work.


ChenYu

> Cheers!
>
> > Fine by me. :D
> >
> > ChenYu
> >
> >> instead :-)
> >>
> >> Cheers,
> >> Angelo
> >>
> >>> Cc: <stable@vger.kernel.org>
> >>> Fixes: ff1df1886f43 ("dt-bindings: nvmem: mediatek: efuse: Add suppor=
t for MT8188")
> >>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >>> ---
> >>>
> >>> I'm not exactly sure about pointing to the dt bindings commit for the
> >>> fixes tag.
> >>> ---
> >>>    drivers/nvmem/mtk-efuse.c | 1 +
> >>>    1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> >>> index af953e1d9230..e8409e1e7fac 100644
> >>> --- a/drivers/nvmem/mtk-efuse.c
> >>> +++ b/drivers/nvmem/mtk-efuse.c
> >>> @@ -112,6 +112,7 @@ static const struct mtk_efuse_pdata mtk_efuse_pda=
ta =3D {
> >>>    static const struct of_device_id mtk_efuse_of_match[] =3D {
> >>>        { .compatible =3D "mediatek,mt8173-efuse", .data =3D &mtk_efus=
e_pdata },
> >>>        { .compatible =3D "mediatek,mt8186-efuse", .data =3D &mtk_mt81=
86_efuse_pdata },
> >>> +     { .compatible =3D "mediatek,mt8188-efuse", .data =3D &mtk_mt818=
6_efuse_pdata },
> >>>        { .compatible =3D "mediatek,efuse", .data =3D &mtk_efuse_pdata=
 },
> >>>        {/* sentinel */},
> >>>    };
> >>
>
>

