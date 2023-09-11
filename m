Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DA3EE57DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 16:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tn6ORcYdF7wmn9zYudPCVDeUReDbRM6yHR4pM4CXkGQ=; b=SE1FQCQE4JW8Hd+vTbiQKsVynM
	n+yBnk79bhSGUnyInJtFGJYtJirIGqsCRBAnyiDxC7dLMyJmxhG7KkOEPZbbwVQJv7oAyMZluP6UE
	WprxfdT7AYy0Bl8EpHras2cwo3uCoiTR7sBvpUrM9rcoB/u9w246zhnHT6soY6cKL9TD9BFqjhGKk
	mVOTdZiiQ1BR+JkTnZQWoyeM7CWYhOj241xVifqEcr2BYU6VwlqLUlT7YDEud1bQs1/eKSvQQNeBM
	TvUZOPjciNoOvx2jkKnKK5sWpZUSBk8xBrU2dpXoMew/D7mRsBue4j1Im16ghAinng0bFaRRVfGG6
	qJddUBJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfjtj-0010XF-1B;
	Mon, 11 Sep 2023 16:36:27 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfjtf-0010WV-2X;
	Mon, 11 Sep 2023 16:36:25 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9a9f139cd94so500853066b.2;
        Mon, 11 Sep 2023 09:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694450181; x=1695054981; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tn6ORcYdF7wmn9zYudPCVDeUReDbRM6yHR4pM4CXkGQ=;
        b=mW15KGQKDXpCT+E+oTy0XiXoRJzZ1ik5iPY6Qac0MCV/tKAPLlVWnWyqPVR5gvHKuS
         j+0ns8h5gDZ83W53Puu8rcOrhqWLgOGQ8w/rKY7MuC0sixGobzCV34WZdprrMw9GcUpq
         oz/c01NN8Ark5Moct8GNFQcbioSYbfnq5k9UggkoaXUYVVj6FN4daZ8wOlCyjzDw3Jue
         inanlRT8vRvnn+s5kQSmvA47CTkKGWq37OPwg0Ldy1J+SpDI21929tbr7B2cWeT4MxlG
         pkmSCVZTVdU4lX3ZOstNojaUdAgYUuGVTcOX+8w5hU1KGBevguOqtoUPf2mpRW4VBuUE
         nE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694450181; x=1695054981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tn6ORcYdF7wmn9zYudPCVDeUReDbRM6yHR4pM4CXkGQ=;
        b=fLsRFFfc109B4yLE5Dusw3UzaTquV3Ob0pQWqftrAN1nZghstjJHFrvskbvoP8GW2C
         QaC9HLGWXiLyoRRIcjJupPEpqdepY8qOByaGJLDPsMLdD6xsuz8bBANTLIUR0wFSsMGo
         ZZmg9DcqsymkVe01vCcxDqLvZhXVwl33yDklRnqJ6iVKxKtyOYbt6Py+IoHu7OHMhke5
         RyzjEp6NdBPVdCjJ/WITDnNQNp/8b+QopglkUFY/goeuJnJwlNzLM39qJaMnxuJzk/VA
         0oMTarzF2oeMaeMPTpxkDlCW4w9izp63yEkpJ97vEyDDuqIjxyNtl6lccG5DOLLaUiDd
         b/8Q==
X-Gm-Message-State: AOJu0Yx4wOImV6NKD8tyPir1l0tbyr9QRete3BFiYyYaLhDi2pPr5qLj
	ARLx7U5kb83MI6nvehyl/Ow=
X-Google-Smtp-Source: AGHT+IEZkDEwJehDR4fKggLpjoJhnXiAupV9qorq7MLXFhFfk7fRQqvtYUP3Mho6rsQ4juPA6IGloQ==
X-Received: by 2002:a17:906:224a:b0:9a9:e6c3:ad28 with SMTP id 10-20020a170906224a00b009a9e6c3ad28mr9042772ejr.69.1694450181242;
        Mon, 11 Sep 2023 09:36:21 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id h17-20020a170906261100b00999bb1e01dfsm5534149ejc.52.2023.09.11.09.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 09:36:20 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
 ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
 nicolas.dufresne@collabora.com,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
Subject: Re: [PATCH v6 14/18] media: verisilicon: vp9: Use destination buffer height
 to compute chroma offset
Date: Mon, 11 Sep 2023 18:36:19 +0200
Message-ID: <3248154.aeNJFYEL58@jernej-laptop>
In-Reply-To: <7da0a2ab-032a-9de9-e136-58f973238c5b@collabora.com>
References: <20230901124414.48497-1-benjamin.gaignard@collabora.com>
 <4856958.31r3eYUQgx@jernej-laptop>
 <7da0a2ab-032a-9de9-e136-58f973238c5b@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_093623_850375_613FAEC8 
X-CRM114-Status: GOOD (  23.00  )
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

Dne ponedeljek, 11. september 2023 ob 10:55:02 CEST je Benjamin Gaignard=20
napisal(a):
> Le 10/09/2023 =C3=A0 15:21, Jernej =C5=A0krabec a =C3=A9crit :
> > Hi Benjamin!
> >=20
> > Dne petek, 01. september 2023 ob 14:44:10 CEST je Benjamin Gaignard
> >=20
> > napisal(a):
> >> Source and destination buffer height may not be the same because
> >> alignment constraint are different.
> >> Use destination height to compute chroma offset because we target
> >> this buffer as hardware output.
> >>=20
> >> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> >> Fixes: e2da465455ce ("media: hantro: Support VP9 on the G2 core")
> >> ---
> >>=20
> >>   drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c | 4 +---
> >>   1 file changed, 1 insertion(+), 3 deletions(-)
> >>=20
> >> diff --git a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> >> b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c index
> >> 6db1c32fce4d..1f3f5e7ce978 100644
> >> --- a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> >> +++ b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> >> @@ -93,9 +93,7 @@ static int start_prepare_run(struct hantro_ctx *ctx,
> >> const struct v4l2_ctrl_vp9_ static size_t chroma_offset(const struct
> >> hantro_ctx *ctx,
> >>=20
> >>   			    const struct v4l2_ctrl_vp9_frame
> >=20
> > *dec_params)
> >=20
> >>   {
> >>=20
> >> -	int bytes_per_pixel =3D dec_params->bit_depth =3D=3D 8 ? 1 : 2;
> >> -
> >> -	return ctx->src_fmt.width * ctx->src_fmt.height * bytes_per_pixel;
> >> +	return ctx->dst_fmt.width * ctx->dst_fmt.height * ctx->bit_depth /
> >=20
> > 8;
> >=20
> > Commit message doesn't mention bit_depth change at all. While I think
> > there is no difference between dec_params->bit_depth and ctx->bit_depth,
> > you shouldn't just use ordinary division. If bit_depth is 10, it will be
> > rounded down. And if you decide to use bit_depth from context, please
> > remove dec_params argument.
>=20
> I will change this patch and create a helpers function for chroma and mot=
ion
> vectors offsets that VP9 and HEVC code will use since they are identical.
> I don't see issue with the division. If you have in mind a solution please
> write it so I could test it.

Solution is same as the code that you removed:
int bytes_per_pixel =3D dec_params->bit_depth =3D=3D 8 ? 1 : 2;

Or alternatively:
int bytes_per_pixel =3D DIV_ROUND_UP(dec_params->bit_depth, 8);

Consider bit_depth being 10. With old code you get 2, with yours you get 1.

Best regards,
Jernej

>=20
> Regards,
> Benjamin
>=20
> > Best regards,
> > Jernej
> >=20
> >>   }
> >>  =20
> >>   static size_t mv_offset(const struct hantro_ctx *ctx,





