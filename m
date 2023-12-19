Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E998AC41535
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Dec 2023 16:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+nXGZ4WeIHnK2XE30unq/qDzfMFlqizs0CUMRrlF3c=; b=MuBe9iWMCe4lJcn5JnRIYQaIEl
	f4ukp/+JRDqC2poK6Mr5T+HC3vvi+Es1A+6az9NOlvK+ExjEqtrKQ3C3J8P/wDMr2B5vapdAv/cK1
	ciVo784EwMDPKYRSilnljoUPiJMKxYnbufEW7cd+remyDiVm4yq7x04wPk0nXH9boHBKUOiaDPwBU
	JysjNmd8kiwvxrIul+PqONnTfObVNgvPDtHNe5I0m5ULJdspYiiLEEQWcooumpHfpCVBJK34BJO7/
	GkHLdSiQ9SBknuQBEhKTDf0zvdti2+kpAwfNqLCkc1mTTNFOKiL5+RGFmclLJR/sDAEzltq/u9Jeh
	gweO4K+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFcz2-00EhTp-2y;
	Tue, 19 Dec 2023 16:30:16 +0000
Received: from mail-oo1-f48.google.com ([209.85.161.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFcyz-00EhRM-2i;
	Tue, 19 Dec 2023 16:30:15 +0000
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-593f182f263so98881eaf.0;
        Tue, 19 Dec 2023 08:30:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703003412; x=1703608212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+nXGZ4WeIHnK2XE30unq/qDzfMFlqizs0CUMRrlF3c=;
        b=F9Ab7g8LzO3HSaR8CYz+YSJ4seqaCjqIuVk0+4OCxTb+ivkgwLSTiNhJUwHWAxVRUQ
         PxFLRqUSP3G2Kf2YM8TGCffXaOdTosj3i4JL1Qjg6bLILBnObgDRuqjaxpISXJ16ceQU
         gZjhNNZEEAMcssgJAXrOT1S0JA4Pis45d8eUOTNpyyf2HZxBuPgB+EvABzYN5VgSyda2
         QprKuaaODJkxqmGW/mCF5i6WuVqM9o56FVRGv4qXvcc3GNwcviqgL2fdM4XtjBEL9h46
         MzFHKU22XZeN/kghJvsOg+Ugzn8s9OJoORb6nSMCQUnAPVxaWOpkJ/aA8az3JCgVGiS6
         nTAQ==
X-Gm-Message-State: AOJu0YxyeqScXxYy3qz6toIXXAdiBzcVtti6ec0hehbTtQEya1VG25KL
	l2LTh8Cl1sxDsn9+8dzEfq31NBKMH+g+dCiF6lc=
X-Google-Smtp-Source: AGHT+IGCcu1hyxmj8XnSccAScP5oqN5dUluYAX9W1tGMGB9589pmbO/sXkRTIM1WwxoBb7YqVBoVmBJ+Pid3j1wUZQ4=
X-Received: by 2002:a05:6820:2d44:b0:58d:be0d:6f7b with SMTP id
 dz4-20020a0568202d4400b0058dbe0d6f7bmr29168905oob.1.1703003412038; Tue, 19
 Dec 2023 08:30:12 -0800 (PST)
MIME-Version: 1.0
References: <20231219031444.91752-1-bo.ye@mediatek.com> <e807b180b074419ba4f1d1ff8a4c1a80@AcuMS.aculab.com>
In-Reply-To: <e807b180b074419ba4f1d1ff8a4c1a80@AcuMS.aculab.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 19 Dec 2023 17:30:00 +0100
Message-ID: <CAJZ5v0gLDZtfGhowxSM+nwBCM80y6sDR56fYZrHNGaRFK1oGyw@mail.gmail.com>
Subject: Re: [PATCH v2] fix overflow in idle exit_latency
To: David Laight <David.Laight@aculab.com>
Cc: Bo Ye <bo.ye@mediatek.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"yongdong.zhang@mediatek.com" <yongdong.zhang@mediatek.com>, C Cheng <C.Cheng@mediatek.com>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_083013_882094_C75DB9A3 
X-CRM114-Status: GOOD (  26.26  )
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

On Tue, Dec 19, 2023 at 5:24=E2=80=AFPM David Laight <David.Laight@aculab.c=
om> wrote:
>
> From: Bo Ye
> > Sent: 19 December 2023 03:15
> >
> > From: C Cheng <C.Cheng@mediatek.com>
> >
> > In detail:
> >
> > In C language, when you perform a multiplication operation, if
> > both operands are of int type, the multiplication operation is
> > performed on the int type, and then the result is converted to
> > the target type. This means that if the product of int type
> > multiplication exceeds the range that int type can represent,
> >  an overflow will occur even if you store the result in a
> > variable of int64_t type.
> >
> > For a multiplication of two int values, it is better to use
> > mul_u32_u32() rather than s->exit_latency_ns =3D s->exit_latency *
> > NSEC_PER_USEC to avoid potential overflow happenning.
> >
> > Signed-off-by: C Cheng <C.Cheng@mediatek.com>
> > Signed-off-by: Bo Ye <bo.ye@mediatek.com>
> > ---
> > Change in v2:
> > -remove Change-ID
> > -correct patch author name
> > -replace multiplication of two int values with mul_u32_u32
> > -refine commit message
> > ---
> >  drivers/cpuidle/driver.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/cpuidle/driver.c b/drivers/cpuidle/driver.c
> > index d9cda7f6ccb9..cf5873cc45dc 100644
> > --- a/drivers/cpuidle/driver.c
> > +++ b/drivers/cpuidle/driver.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/cpumask.h>
> >  #include <linux/tick.h>
> >  #include <linux/cpu.h>
> > +#include <linux/math64.h>
> >
> >  #include "cpuidle.h"
> >
> > @@ -187,7 +188,7 @@ static void __cpuidle_driver_init(struct cpuidle_dr=
iver *drv)
> >                       s->target_residency =3D div_u64(s->target_residen=
cy_ns, NSEC_PER_USEC);
> >
> >               if (s->exit_latency > 0)
> > -                     s->exit_latency_ns =3D s->exit_latency * NSEC_PER=
_USEC;
> > +                     s->exit_latency_ns =3D mul_u32_u32(s->exit_latenc=
y, NSEC_PER_USEC);
>
> Just force either side of the multiply to a 64bit unsigned type.
> The compiler will then DTRT which is likely to be better code than
> whatever mul_u32_u32() generates.

So why is it there?

The default implementation of mul_u32_u32() is to cast its first
argument to u64 before the multiplication AFAICS.

> In any case is the 'exit_latency' ever going to be greater than 4 seconds=
?
> In which case the 32bit multiply will never overflow.

So this is more of a theoretical thing found by some static analysis
tool or similar.

> >               else if (s->exit_latency_ns < 0)
> >                       s->exit_latency_ns =3D  0;
> >               else
> > --

