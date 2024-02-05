Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC096C4828D
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Feb 2024 19:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SeMl68ENlhZta5JKP4MegR68EKrrxCv2fGrCfnFczms=; b=4km54L7bnvpDvuSgNrGm6N0c9V
	57ik/nwCDNRxSgsWbEp6ZNXSDp1x+yrTJe+Fd8KEUlIp83SlLCv38gAIDLm/mHRQUPVSxAeZKTqd3
	h3wvL6aCpqseSubGTn6zIurY+TCGCW0T7gXP+IDr1AxMLTa9Yjr32XvsY854MFWOWzZXWZojdAGwp
	vPVP0lzEKZOwSJ9MiNcSL0ApLF7wD4djXYpMc8j/CH85FMUWa0ywB2p4yxcMEX0GRjWoy/goEMiBk
	ALdCW0PiqOhDEQEk2+f4CYHIGrcaHeav+On4Qk3fox9gtbM0n8SZ3lyoa5a3gRTqtSCCHSd36esGw
	/WH+5G8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX4Dn-00000004TEP-2KSb;
	Mon, 05 Feb 2024 19:01:35 +0000
Received: from mail-yw1-f172.google.com ([209.85.128.172])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX4Dk-00000004TCp-1n8W;
	Mon, 05 Feb 2024 19:01:33 +0000
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-60412f65124so44004657b3.3;
        Mon, 05 Feb 2024 11:01:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707159689; x=1707764489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SeMl68ENlhZta5JKP4MegR68EKrrxCv2fGrCfnFczms=;
        b=XuSN04XEdpZ3/71tasAQ3/DToOeatlW6kpO3moRl23BoykWfCU3g2rtQJ3OWv5QXuQ
         /z5usKwg4AAPsGOE88/DsstHNF0rxAQ5vu8CP6TWI41eCeTLwAB7QZ6cSLuN13G6fuKU
         XsT8gxYnAhTQugFMlAlUFo823x3Xo2kcH2wwCGWAr8kPM3bJX03EA2SWISR8cWI+yU5J
         lTjjO5cGFNi1Bsqs8hlAcerx4pDtUbBGXY35sDt4eqqUDeFce++haJDgac/n+ZU2M99c
         WXkYu/jOJZN/+TcFjAtsYnJXSzCc1Yqn37xF+OjhhkJ825Scdd0N9aIyTR0CfvEsiKC+
         WcVg==
X-Gm-Message-State: AOJu0YwRLU0pzUcu5Y/llCHcl98JSTdZHEBmsABaK49s/NScvfWquPIO
	1XwpG10Rp6lCG1vJOYJAsJq9pG5n0aug3gXnyxkaHR8sD1+kwdVeqjQlwbu2hog=
X-Google-Smtp-Source: AGHT+IG2OyOELBr5p33U9prO3DwoZI2Ey6Rrj45XH/GP3VPQb1I4HnQf58mZecDW2vPuB6at3pOG3A==
X-Received: by 2002:a05:690c:3382:b0:604:978:e76d with SMTP id fl2-20020a05690c338200b006040978e76dmr579167ywb.8.1707159688814;
        Mon, 05 Feb 2024 11:01:28 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXrKhmpbqnyi2GCscOWMmnnBGWC5dqLGYA4bx4onnMypBixbwf5f9OchIdwYjAKH21NOmflu4Y/WCj2en+ZVMB8OBK0pfbex3pMh8Cgj6hVaQSKGVQ=
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id do6-20020a05690c23c600b005ff8950ed82sm82385ywb.38.2024.02.05.11.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 11:01:28 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-60412a23225so45136087b3.2;
        Mon, 05 Feb 2024 11:01:27 -0800 (PST)
X-Received: by 2002:a0d:e289:0:b0:604:66f1:35d2 with SMTP id
 l131-20020a0de289000000b0060466f135d2mr475419ywe.49.1707159687571; Mon, 05
 Feb 2024 11:01:27 -0800 (PST)
MIME-Version: 1.0
References: <da6af483-5ee9-45cd-922e-d9d5364674dc@web.de> <CAMuHMdUxn4Ne7kmEfONz8Uk3Why3m9r83GdM5RzTxm_4Gj_a6g@mail.gmail.com>
 <8f011126-c95a-4c71-8bc9-a6b0a5823c96@web.de>
In-Reply-To: <8f011126-c95a-4c71-8bc9-a6b0a5823c96@web.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Feb 2024 20:01:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUQLWBQemtgnCHj64wCYAET8J2-MgbisyMChSbh0k0L7w@mail.gmail.com>
Message-ID: <CAMuHMdUQLWBQemtgnCHj64wCYAET8J2-MgbisyMChSbh0k0L7w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240205_110132_505326_484A3A28 
X-CRM114-Status: GOOD (  22.03  )
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

On Mon, Feb 5, 2024 at 6:28=E2=80=AFPM Markus Elfring <Markus.Elfring@web.d=
e> wrote:
> >> +++ b/drivers/pmdomain/mediatek/mtk-scpsys.c
> >> @@ -441,8 +441,7 @@ static struct scp *init_scp(struct platform_device=
 *pdev,
> >>
> >>         scp->dev =3D &pdev->dev;
> >>
> >> -       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >> -       scp->base =3D devm_ioremap_resource(&pdev->dev, res);
> >> +       scp->base =3D devm_platform_get_and_ioremap_resource(pdev, 0, =
&res);
> >
> > Given res is further unused, please use devm_platform_ioremap_resource(=
)
> > instead, and remove the local variable res.
>
> I got another idea after looking at the implementation of the function
> =E2=80=9Cdevm_platform_get_and_ioremap_resource=E2=80=9D once more.
> https://elixir.bootlin.com/linux/v6.8-rc3/source/drivers/base/platform.c#=
L87
>
> It seems that it is supported to pass a null pointer for the last paramet=
er
> (while this possibility is not mentioned in the interface description so =
far).
> How do you think about to benefit from such a design option any more
> (instead of the determination of a corresponding platform device)?

Yes, you can pass a NULL pointer as the last parameter.
And as this is very common, the wrapper devm_platform_ioremap_resource()
exists.

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

