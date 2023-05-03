Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0623BC77B7F
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 May 2023 12:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HLFpTw4Opsx0SIhXDBcwLEPI4lObbahA52WBgGIUVsM=; b=iKXK3kieWUQZ/equQRWzIZXzIS
	vba6kHnY/fhn0gT2F7NXGWaY3Cq9bxeqbRViYXccchkovoo92qck99JnqJckeaRndQk8tKJKBt3Pf
	pV1+GQQCwsbIlYnLZvd1SA/tuNL3+HYN5D9OxtmdbNLP6DZLmX7wMtgi4f4DTd33RyLIuWTCriY3R
	b1XC9sNAi5Y6XawC4J1Js+A4izVfTZJXV7McJS2cDKKJZ9o3TOuud0JVsv6P7gwYYsN957nS+xBUG
	xt5cjboLaJ9umsc6j8yomaEefifJo2IfOnHHOkUQVRB2RFQahzFDqlV/0SidLtP93IZVWY4E3fao5
	oMNsO4eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puBMr-004WJG-2y;
	Wed, 03 May 2023 12:13:57 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puBMm-004WFc-35
	for linux-mediatek@lists.infradead.org;
	Wed, 03 May 2023 12:13:55 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-55a79671a4dso41640367b3.2
        for <linux-mediatek@lists.infradead.org>; Wed, 03 May 2023 05:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683116031; x=1685708031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLFpTw4Opsx0SIhXDBcwLEPI4lObbahA52WBgGIUVsM=;
        b=w24SJl1jEsx1dsysGc/JqXn8TRE0UMobpr8S9T3y+gEnR/nI+CHCSx5trFpTNAVCVG
         8XS7YABKoVXwdqhydgmtWe9LQJJ7LBPnr1fCtb0rshbAxTDbaTU+5U0WNdSypx0SKblE
         0CP6meVuOVDCtCX96ONGJ58N4h4LCh6KY7HQXwOPLcftT7CWUqTxxZHaVMF/ygVuJ3xU
         KtX9ixUBAF79tkLLjx9Hg+1rarQ5Su54dehEmdGZNBkbkoufEbwweYd9rnB2Q94mEjKe
         bYeSIwtnrv7tEjxTeB2h1XUenyGb9cWojKfDEo4AC69c880iPhtph2axVQ7WlTkbXxO7
         +S+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683116031; x=1685708031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLFpTw4Opsx0SIhXDBcwLEPI4lObbahA52WBgGIUVsM=;
        b=dhW5f5K5UoeYJ2hKiUNvsPs3lnK+bem0UCbkGddjEeK4/bgz3pVv618XhXHyNa7p0Z
         d6RoJuxM9er54+Y6RHLhE2+kHr8OwNI1tyHGhaNiPw12XqMGXtTsJNuZ9n9AijQurmjh
         wq+Gh+5b1j456AKrdl2PMPssB42XhorVoseO0y+k9mkBGZf0nUAc/nZz3YHS5soMBFEk
         KsdV9n/7/IbxqYjDTnsBvnerp8KNPG5ED01iex9XRl78QFiiOa7j/vPVM7ihNLCSFJp5
         dqn5LNOY0BJq+i5Pq1QZgvL/ELKqmKMDXDHA3a1b03sJhgpliW6oUsH+2tHgXWKVlig2
         XVZQ==
X-Gm-Message-State: AC+VfDzY183UzH8BKbkL8X5jraMaklXnsYU8A+aSMRL8hAZb4xH4rh4Z
	MK42XUljaBg86g4JmCUvJ76bcgg828FaRj/0fpwg5A==
X-Google-Smtp-Source: ACHHUZ66hRgZLiqP0HgNywmuyEJNjQjxpzuYU/Ewr0nLiWAs/k7+ydf4eMIyKQKo0mpz4nSzQd/diYDGzmnUCVXeNlI=
X-Received: by 2002:a81:4f04:0:b0:54f:ddb9:95e7 with SMTP id
 d4-20020a814f04000000b0054fddb995e7mr20136923ywb.34.1683116031053; Wed, 03
 May 2023 05:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain> <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com> <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <bce93654-fc36-3d12-282d-76fafb8f51ce@linaro.org> <CAL_JsqJXd_EpOQwwNEAn25mzFfkhEvqzur6ui5Ca+dbt2kA8-Q@mail.gmail.com>
 <5e318b02-8f33-4e2d-a956-5660e1c60619@app.fastmail.com>
In-Reply-To: <5e318b02-8f33-4e2d-a956-5660e1c60619@app.fastmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 May 2023 15:13:39 +0300
Message-ID: <CAA8EJpq8x5wQa3fMebaSP3hCdMiCsZRaF+B4Y3N3royW_CeXCA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Olof Johansson <olof@lixom.net>, Christian Marangi <ansuelsmth@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Linux-OMAP <linux-omap@vger.kernel.org>, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com, 
	linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-tegra@vger.kernel.org, "linux-oxnas@groups.io" <linux-oxnas@groups.io>, 
	linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-realtek-soc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_051353_029560_F386DCCF 
X-CRM114-Status: GOOD (  20.81  )
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

On Wed, 3 May 2023 at 13:39, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, May 3, 2023, at 03:17, Rob Herring wrote:
> > On Tue, May 2, 2023 at 5:52=E2=80=AFPM Dmitry Baryshkov <dmitry.baryshk=
ov@linaro.org> wrote:
> >> On 02/05/2023 22:40, Rob Herring wrote:
> >> >      'berlin' : 'berlin',
> >> >      'pxa2' : 'pxa',
> >> >      'pxa3' : 'pxa',
> >> >      'pxa' : 'marvell',
> >>
> >> I'd question if it makes sense to split the pxa line. Yes, it was sold
> >> by Intel to Marvell, but IIRC the devices still had some inheritance.
> >> So, if we have the 'pxa' subdir, I'd move Marvell PXAs to that dir too=
.
> >
> > I think I probably split it because it was different maintainers.
> > Though it doesn't look like pxa168 or pxa910 have any maintainer. They
> > are a mixture of pxa and mmp I think.
>
> I think the original split here is probably the best we can do,
> but there is no good way to do it because of the confusing naming
> and the problem that there is no clear line between pxa and mmp.
> As far as I can tell, the release timeline was:
>
> Intel pxa2xx (mach-pxa, xscale, still exists)
> Intel pxa3xx (mach-pxa, xscale, still exists)
> Intel pxa90x (never merged)
> Marvell pxa93x (mach-pxa, xscale, removed in Linux-6.3, no DT)
> Marvell pxa92x (never merged)
> Marvell pxa91x (mach-mmp, pj1, still exists)
> Marvell pxa168 (mach-mmp, pj1, still exists)
> Marvell pxa95x (mach-pxa, pj4, long gone)
> Marvell pxa688 (mach-mmp, pj4, known as mmp2)
>
> So with pxa93x out of the picture, we can simplify it as using
> 'pxa' as the name for all the above chips with an Intel XScale
> core, and 'marvell' for all the other ones that have a Marvell
> core and exist in mach-mmp.

Should it be 'intel' for pxa[23]xx then?

>
>      Arnd



--=20
With best wishes
Dmitry

