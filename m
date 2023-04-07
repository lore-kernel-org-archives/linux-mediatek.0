Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2B2C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 08:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YieoR9GFXBDpW/S/rPrqFewasba9YLxVMGUvduFkZVA=; b=RsSxCiwJhFWo3v4jo1jmtDy4QW
	+HD28cN8936aihEpnJLD6J5p4Tk8dpLGQ2ZLKcA2Im/hrNJ+5aiy0V2u4OC8rk4U9/LeHkBzsdwbn
	OLjxLE4J2H4boJUMuReqRIpmvyBMksC+DPleXecp8iuV9HEJgUeOy4n65hEtyG0T20YzibNALwASE
	NRfbLVAzpYm7HOMa8U+SvCxLX/488DfuLsY/eFUslRK1vqFLj46BOhhuaMvrdVYQpQ46hNf11IAL9
	ptWfVzHYWfV0o1ZwiOpFgWhXG9N1S23/8RD7SlbId9Pw1ybf0d09Ht790r0BPxNGjJa3AtU7VEETE
	8db1i68w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkhjX-009Xrk-1V;
	Fri, 07 Apr 2023 08:46:11 +0000
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkhjU-009Xqa-1X
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 08:46:10 +0000
Received: by mail-ua1-x930.google.com with SMTP id t20so11867670uaw.5
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 01:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680857166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YieoR9GFXBDpW/S/rPrqFewasba9YLxVMGUvduFkZVA=;
        b=gM5FWyyuaDU8IMah6LdVlCrfJr+DR2GXlJvbSlGJUaoRKyPLg8kLBmt1akuM21vwVf
         c1rOXa6jiZ2SZtSDhsCUZ0zU8Y1zl4BpYCvGwFmD2TMZR+ZNxr7rtlh3kSlfA6ptRT5y
         xqtU2MkXcQUzBzT59zUkuV3IOep2gmE+VFSiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680857166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YieoR9GFXBDpW/S/rPrqFewasba9YLxVMGUvduFkZVA=;
        b=HpbId6TbaNPAqD8UzXEmdyAFpcFstYPPU4qsyMmqpGUJCS998n4DpOurHthPvfXoZ0
         uQXXb55r1i4cP4ZDmaHK0v3DDx+MVsK0UGfmUsGkzkZmFOkKGkBArZ5mYeTce2xNzw/h
         i0hvkrxakYC+tRzrKLu6inonEOVIZD6WhozyEc08xshxNF/2E+yY7ZWn39YmY0DBLD6l
         uPTV13hAk58dL/fwKGxwPi076vokN65IpOqgNaM2Oh0pK05T8Quo5qJvXkmLBPlSR8lQ
         FN/D/b7ufpY1Rps7xzAnrkhcE0kb+WgtWqOg7fGc0DJLMDglMOmFAFp8OLuzpsAcUMGM
         7oKA==
X-Gm-Message-State: AAQBX9fHfX2BaDle+fRUlhTe9vwPif7EchPeVZ2hhdbIhjvE0UChr+gl
	MwaHsuQMTTPGJXXnXenzOA3nyJh1fjBZuRHsWm2kVg==
X-Google-Smtp-Source: AKy350ZOOBmSxsKL7GOH768+6XTswkcSHxuK2zOLiz0MKREMKOgQK0H6K8Ydycm9M3k+WwLYZcZYqhXiE5O4Eing4lk=
X-Received: by 2002:a1f:9f85:0:b0:435:56e:154e with SMTP id
 i127-20020a1f9f85000000b00435056e154emr726664vke.1.1680857166037; Fri, 07 Apr
 2023 01:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230328031037.1361048-1-wenst@chromium.org> <9ab8d176-378c-9720-3794-c710e2bd6272@linaro.org>
In-Reply-To: <9ab8d176-378c-9720-3794-c710e2bd6272@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 7 Apr 2023 16:45:55 +0800
Message-ID: <CAGXv+5H7QdNJ0Pj4xS_Ce=N63Csd1rCc+BoFJALyETLsA521NQ@mail.gmail.com>
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: only update
 registered thermal zones
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Balsam CHIHI <bchihi@baylibre.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_014608_536162_E021A860 
X-CRM114-Status: GOOD (  22.49  )
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

On Sun, Apr 2, 2023 at 4:34=E2=80=AFAM Daniel Lezcano <daniel.lezcano@linar=
o.org> wrote:
>
> On 28/03/2023 05:10, Chen-Yu Tsai wrote:
> > It's possible for some sensors or thermal zones to not be registered,
> > either because they are unused or not fully declared in the device tree=
.
> > Nevertheless the driver enables interrupts for all sensors. If an
> > interrupt happens for an not-registered sensor, the driver would end up
> > updating a non-existent thermal zone, which leads to a NULL pointer
> > dereference.
> >
> > Change it so that only registered thermal zones get updated.
>
> Why not change the interrupt initialization ?

I'll send another patch for that.

However I think the part in this patch should still be fixed?

ChenYu

> > Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage The=
rmal Sensor driver")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >   drivers/thermal/mediatek/lvts_thermal.c | 7 ++++++-
> >   1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/=
mediatek/lvts_thermal.c
> > index d87d3847c7d0..bf59174e18d3 100644
> > --- a/drivers/thermal/mediatek/lvts_thermal.c
> > +++ b/drivers/thermal/mediatek/lvts_thermal.c
> > @@ -415,9 +415,14 @@ static irqreturn_t lvts_ctrl_irq_handler(struct lv=
ts_ctrl *lvts_ctrl)
> >               if (!(value & masks[i]))
> >                       continue;
> >
> > +             iret =3D IRQ_HANDLED;
> > +
> > +             /* sensor might not exist (bogus interrupt) or not be reg=
istered */
> > +             if (!lvts_ctrl->sensors[i].tz)
> > +                     continue;
> > +
> >               thermal_zone_device_update(lvts_ctrl->sensors[i].tz,
> >                                          THERMAL_TRIP_VIOLATED);
> > -             iret =3D IRQ_HANDLED;
> >       }
> >
> >       /*
>
> --
> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for AR=
M SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
>

