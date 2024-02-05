Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C967C4828D
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Feb 2024 16:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jWR3pEGZO6v+mTFVY3DLgK4dPi2tH10vXkils1uXoOQ=; b=MN22rW3icTbFlzHEUM1Nrf8PG8
	BVUU5eKFlWPvDJM7ngnuUlSTrgm6MMhVAdfViSUtXwHKJhllHRhdj2krbxCcdhGxchqoHAJTotjm5
	hOffaVZ0DEqC1UAcfgrXaxLEEjxqvTMDpQk4kl5otJys5aZ//uHX779M0ZFV/A9pm76atHxEZQIFU
	qd1xV8wQAKVZ7CdwSz+6iwT2gud4PiaPNtmPUSWU14OjmC87LU03Nn6L61wesiODQgReqJnpKx7fx
	8KZ2xWyhsfdRvlxJoI9kA9C8DhWXr8RtfdCGNEYERk0h/f/hfveR2mArwgMQ8uBbGp0w0CssfjF/1
	GD4hETRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX1tA-00000003zeR-07nD;
	Mon, 05 Feb 2024 16:32:08 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX1sp-00000003zZ3-0qOn;
	Mon, 05 Feb 2024 16:31:59 +0000
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3bb9d54575cso3445833b6e.2;
        Mon, 05 Feb 2024 08:31:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707150699; x=1707755499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jWR3pEGZO6v+mTFVY3DLgK4dPi2tH10vXkils1uXoOQ=;
        b=ff31WB7FT/88Pf1Fc5U6CqluUOY0ko2l4uMYFEtG0CRAJxu2u2tIkfUmL5aqW5J6+e
         pMrvF79iQbJACJRGvx7i+pL2ajkih7OZFZbXbiagAm8v6tu0WIQHIUWNpY9Ux4kg+sVX
         VGxv6pEhms23Pzx3EW6ad1heV49N+ukKPgb2iVofaWlVqjOdldeogr3/6z1+T93b8tjd
         /qK3ZQDrF2CT7bkrYjufoUlVQ3GdE+8oIFQG/HQ+8KW4seiNkb3TRMIrRH1y77JDhQgq
         +nDrq7OK9kt7DaTOYlSY1tg01gh8X3rtniCC9AyaEkqqhWiepyWDjb0BbRRENbRBmu8x
         a71g==
X-Gm-Message-State: AOJu0YwOpAcQo9JtOwez5k6duMeqQ5BuYcsQTix6PdXmUt3v7KcOFCqk
	+A3MTcrMtqLuFk4q0Cm77K6ZhyqaKPUm8cJDGmltFVXoCShdSM7pbmA1vzQVa/c=
X-Google-Smtp-Source: AGHT+IH/Y8Bu4v9GpF6IXqZGOpT6n49T3FIWxYdWr6pkrw+ZlQ62I6iBjTqzUUkC3dT6WfUHLFl8sQ==
X-Received: by 2002:a05:6358:e49e:b0:176:a5f5:d266 with SMTP id by30-20020a056358e49e00b00176a5f5d266mr349294rwb.6.1707150699431;
        Mon, 05 Feb 2024 08:31:39 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCURg/dekUfKNN8K+Ya7upB/LXMUh6EzFUSsNENQRd/JWR2tplnXDJsEN6dm11vyPjrEHB0b6q1wOIN+6NLkULqVqceF1N72IpQko5CffIX5yNi5HYo=
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id e79-20020a25d352000000b00dc36ad3af97sm25193ybf.50.2024.02.05.08.31.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 08:31:38 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-60412f65124so42523627b3.3;
        Mon, 05 Feb 2024 08:31:38 -0800 (PST)
X-Received: by 2002:a81:57d0:0:b0:603:e86b:cd81 with SMTP id
 l199-20020a8157d0000000b00603e86bcd81mr61909ywb.31.1707150698427; Mon, 05 Feb
 2024 08:31:38 -0800 (PST)
MIME-Version: 1.0
References: <da6af483-5ee9-45cd-922e-d9d5364674dc@web.de>
In-Reply-To: <da6af483-5ee9-45cd-922e-d9d5364674dc@web.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Feb 2024 17:31:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUxn4Ne7kmEfONz8Uk3Why3m9r83GdM5RzTxm_4Gj_a6g@mail.gmail.com>
Message-ID: <CAMuHMdUxn4Ne7kmEfONz8Uk3Why3m9r83GdM5RzTxm_4Gj_a6g@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: Use devm_platform_get_and_ioremap_resource()
 in init_scp()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Rob Herring <robh@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_083150_306675_7994DFB8 
X-CRM114-Status: GOOD (  19.19  )
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

Hi Markus,

On Mon, Feb 5, 2024 at 3:23=E2=80=AFPM Markus Elfring <Markus.Elfring@web.d=
e> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 5 Feb 2024 15:08:27 +0100
>
> A wrapper function is available since the commit 890cc39a879906b63912482d=
fc41944579df2dc6
> ("drivers: provide devm_platform_get_and_ioremap_resource()").
> Thus reuse existing functionality instead of keeping duplicate source cod=
e.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Thanks for your patch!

> --- a/drivers/pmdomain/mediatek/mtk-scpsys.c
> +++ b/drivers/pmdomain/mediatek/mtk-scpsys.c
> @@ -441,8 +441,7 @@ static struct scp *init_scp(struct platform_device *p=
dev,
>
>         scp->dev =3D &pdev->dev;
>
> -       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       scp->base =3D devm_ioremap_resource(&pdev->dev, res);
> +       scp->base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &re=
s);

Given res is further unused, please use devm_platform_ioremap_resource()
instead, and remove the local variable res.

>         if (IS_ERR(scp->base))
>                 return ERR_CAST(scp->base);
>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

