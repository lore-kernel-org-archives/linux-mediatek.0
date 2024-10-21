Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559FAD3C93F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 05:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M9zNYRiu9uknolFzwLlq15Mi6j/Tjr3sPHN/TktoqH0=; b=cO+iBcb7XXabsy
	GbIA8MArVHwckVji5Ij4/DGo2K5cnw+XrofqPwkkvFeylhcJrCOr/8DudEu3Mj6ndbg94FAlLp7s9
	2jvWzF/B2+rDdTSc2xna9Ir90/P3bDfX1BiT1CQsL3xku4H2t7BOW0Uzu6lUjIpEJGLRbrVRCwwwa
	BlkctOMp6v6UUTCYXNubz0p5zzJ5MO8kl/4TSwbShqDgzOinGvaLBXS9zUQLfwGySLKOlNbCkVgtQ
	fAQYhFXLfTWH4tNRJyUlElQnEytskyv4C+Y7j0Xw6K+vQlwvU7YkyehFxyeDX/zQGmm+ItATXDZJW
	Z9O9uzVWFfLspkfTeYUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2l8D-000000065mJ-0q2m;
	Mon, 21 Oct 2024 05:39:05 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2l89-000000065lW-0IDd
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Oct 2024 05:39:02 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2fb5be4381dso39265611fa.2
        for <linux-mediatek@lists.infradead.org>; Sun, 20 Oct 2024 22:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729489138; x=1730093938; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9zNYRiu9uknolFzwLlq15Mi6j/Tjr3sPHN/TktoqH0=;
        b=FfM20CuCiCdORFklNa5gmKFp7gJe7FQ5hU7otn0TXsfsh9Itx+H0Xdx5+yX2a+Woxa
         S/b9yM6bTgmPSia0pJ2HCIKYjAz5vF4w/naOgisG2i/JUIUGu+jUe229L7l1c7N+ZQwH
         XgCR9eTQgTPKAClIlDwKoCFdWvIpO/U+rau5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729489138; x=1730093938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M9zNYRiu9uknolFzwLlq15Mi6j/Tjr3sPHN/TktoqH0=;
        b=rFLS4NlGicsuOS0LNpcXltiVp5vZsiYDiVV5r7Saa/FLUt8gLRHhtd2HdGhaWBYyq1
         t4gD2tzb2N8j4i7sIFfHqdC4uiaXm/13L3/SICzhE9yxGrDoF3CsMYlwkRWnri1hHfXJ
         B/Trm8vXZdB5lkpe1OWo7frS1OgRKDLJJNqFo5Bt8t8Np/QqvDx8/GzuHpCgfcNGi/99
         AFV5PR7kBdCTktLNjaOgqts0hZBC4qxBbjDnXcriVLPKiVQHcsfda8rveyXKRouTcQi+
         OEkDd3h453gVE/cAlQBi9DWU2IQYaRG+H3mgvz0C6tzjC9v7PxFUrZqbhiSIYM4GZVhN
         nDfA==
X-Forwarded-Encrypted: i=1; AJvYcCU5pOZDNJhc28131cp02WCTUPE+rR+6NeHLojuLBRj6ygbkru3R2fLr/wFwiD2jMMXt+SiiyRn9SXPWoA7X9A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLq8GHv+gz0G2Xi6Xk+JwcFuKEN1qGuwZBesSsBkYGmrfbVzFA
	mMerz+ieyZIRWo3Ppg+R+nEB/N+23a0kdEjiH/zadqDGh7zHJC/MvdF7CdO7T9lCi1yWKTJQDzA
	=
X-Google-Smtp-Source: AGHT+IGqV8qT58kN5BqrIYq5Wid+c8BWehJ46XYg7S3xLr2KcUa58JJHeCovA8ucCOC4xMkXKe2ViQ==
X-Received: by 2002:a05:6512:128d:b0:534:543e:1895 with SMTP id 2adb3069b0e04-53a1544aaa4mr4655193e87.39.1729489137499;
        Sun, 20 Oct 2024 22:38:57 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a2243137asm384736e87.186.2024.10.20.22.38.56
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Oct 2024 22:38:56 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539e59dadebso5123146e87.0
        for <linux-mediatek@lists.infradead.org>; Sun, 20 Oct 2024 22:38:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXSfPMdc9JDtmNA1WIbhcwEW19d7+K9cnjjkxG5bQaz3+kgjIQNEabq72OC017cz3PWZ8BJJLiqVV+dNngxcg==@lists.infradead.org
X-Received: by 2002:a05:6512:1315:b0:52e:76d5:9504 with SMTP id
 2adb3069b0e04-53a1520bd38mr5443903e87.3.1729489135981; Sun, 20 Oct 2024
 22:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <20241018152127.3958436-1-arnd@kernel.org>
In-Reply-To: <20241018152127.3958436-1-arnd@kernel.org>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Mon, 21 Oct 2024 14:38:42 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXgv1sHy+F1psxiN0wu0ryg5shX_u7orzgLz9+-hU59jA@mail.gmail.com>
Message-ID: <CAPBb6MXgv1sHy+F1psxiN0wu0ryg5shX_u7orzgLz9+-hU59jA@mail.gmail.com>
Subject: Re: [PATCH] media: mtk-vcodec: venc: avoid -Wenum-compare-conditional warning
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_223901_162489_F809777B 
X-CRM114-Status: GOOD (  17.62  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, Yunfei Dong <yunfei.dong@mediatek.com>, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, linux-mediatek@lists.infradead.org, Bill Wendling <morbo@google.com>, Hans Verkuil <hverkuil@xs4all.nl>, Justin Stitt <justinstitt@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Oct 19, 2024 at 12:21=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wr=
ote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> This is one of three clang warnings about incompatible enum types
> in a conditional expression:
>
> drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c:597:29=
: error: conditional expression between different enumeration types ('enum =
scp_ipi_id' and 'enum ipi_id') [-Werror,-Wenum-compare-conditional]
>   597 |         inst->vpu_inst.id =3D is_ext ? SCP_IPI_VENC_H264 : IPI_VE=
NC_H264;
>       |                                    ^ ~~~~~~~~~~~~~~~~~   ~~~~~~~~=
~~~~~
>
> The code is correct, so just rework it to avoid the warning.
>
> Fixes: 0dc4b3286125 ("media: mtk-vcodec: venc: support SCP firmware")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Alexandre Courbot <acourbot@google.com>

> ---
>  .../platform/mediatek/vcodec/encoder/venc/venc_h264_if.c    | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h26=
4_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> index f8145998fcaf..8522f71fc901 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> @@ -594,7 +594,11 @@ static int h264_enc_init(struct mtk_vcodec_enc_ctx *=
ctx)
>
>         inst->ctx =3D ctx;
>         inst->vpu_inst.ctx =3D ctx;
> -       inst->vpu_inst.id =3D is_ext ? SCP_IPI_VENC_H264 : IPI_VENC_H264;
> +       if (is_ext)
> +               inst->vpu_inst.id =3D SCP_IPI_VENC_H264;
> +       else
> +               inst->vpu_inst.id =3D IPI_VENC_H264;
> +
>         inst->hw_base =3D mtk_vcodec_get_reg_addr(inst->ctx->dev->reg_bas=
e, VENC_SYS);
>
>         ret =3D vpu_enc_init(&inst->vpu_inst);
> --
> 2.39.5
>

