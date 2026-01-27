Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92ED0D2F031
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jan 2026 13:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lfk0u8jijXvQF1SoXyqvsVpMiit2Fv9RQS39R0lpECo=; b=ccWjEG7yCXwM6Exi4+hrE86sz2
	rR7TJ7S+NRDJiEeu9ONB7BZVbC51bR+Rd6urbioD3jSFj31wWYdfE6/1xor91Xxz/j4bJ963jhUTz
	us6cKb81sf94J8gvSyE5j5unBQfKiPJ9KHBpoYyXSfkHafslVTAR+3+AHXLR8GGOGYqWsUUjjW1mw
	g8EMJmNPt7H8k0kotUSE1yksM1zatHJIQ2EtIpoTOHRDrMLqTzmZh2IYgobmv9DIyCcW/jGAwZzef
	L4iUdC0Db0strO8npuCNaqYL0QqNuZO912lakFU1TMfI5lxImnEq7MOm9HVIwZ3L9luAWCkqgLMem
	lItn4OIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkjaT-0000000ELnj-1VB5;
	Tue, 27 Jan 2026 13:58:33 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkjaL-0000000ELkL-2ZtE
	for linux-mediatek@lists.infradead.org;
	Tue, 27 Jan 2026 13:58:31 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-59de0b7c28aso5676667e87.1
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Jan 2026 05:58:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769522302; cv=none;
        d=google.com; s=arc-20240605;
        b=GmeYlwKohE3RsekJg7UpukMQ6JGnvEd8h/yynMe0Ad0D24NkJQLN4qnomVLMwPevjW
         YRT5tXH0d7E68e2qnPHB9aVPHSxkUu2FSrydbvRLyHqw6yEJ/zI5AjLmoaXYG4PUoQcN
         cZ6dDyAnDS+TeYtrmoPX66pwVATR3fiGJtOPHzoPTaw9vIy/JwJzxEzz4VIhM5E5IlsE
         tjKykoMoCqu0I9T1bJY62jU1BC3l7/y6H9LNEel8RGeefHASNCQTq5pIf3j0TSsSxj4m
         XgqFbLIJODLfE2l2dc7jlUV8xYFmkHr2X/lPzyYd7Zh2BkjnleJybFY1FQaV/D2SPXuK
         054g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lfk0u8jijXvQF1SoXyqvsVpMiit2Fv9RQS39R0lpECo=;
        fh=kDG2+utUtON3k/zDy7cIAf8m6/02PfQap6jjs8IaJ+w=;
        b=b67kg1bE6AUajf0ijUFrCuqk51EsH1h+qmgkOmuoLtDvS/gCaquWwVqZKNeQTpk22T
         +CTnkZvSdpNg4oV68VBL8GjHnjBBBQEhB6UDeMSijMvD8ZZR+rd1KlzhgLmqRZJcu+eE
         jwkC1iKhLbnX9Vy9ImfGRBG+jKGwh58PArFGOPgK+Z3qte7/BSzz+mGEyzKjaiNofhlI
         xUoABKal8TEOxxpPyVi2QEB5+LkHVDaHlFLDY5d51zix+dLngQUpHDykvOiQVER+RYcM
         X8+0ZArKYHBlaNDL48frnqi8bIbnVKSAP97fDHNQtsRPWIYHW95oYjEHWINThhYEthGK
         0Yyg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769522302; x=1770127102; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfk0u8jijXvQF1SoXyqvsVpMiit2Fv9RQS39R0lpECo=;
        b=p71KP3C+5uwTNDkftgo+zrmdPqny8rwuNUfNNbB669t4/DvZH7IgWT8V2bv/4tVjtz
         iX4lBFOlU/C4BZd58GYwRoyzW/p6eq7daWpo92AYkw27NDcffyBhd9T0DPbsC7oxCh1f
         BVTI4v+1Ak8D8em7NAvxApLgZeocU3ezmlbednjQyt767xpEgHXChVa6VRZvSfkRQ+gV
         p+T5EFj0YtdR0Eaw62GX0/w+BFexLhKDtwS7hkuRnWx1dkqK8gdbfgSxkyGFW94wQtRu
         uXOwwO8gU13dq7Nk6lQ3HYTIh9V3DKKSeBw3r/E6r4TVHhZ/OV6F6GIWwJ6eGqhIwEmo
         k5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769522302; x=1770127102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lfk0u8jijXvQF1SoXyqvsVpMiit2Fv9RQS39R0lpECo=;
        b=iZV/FAobh2Je63rm+huDn2XpM7PrKhUzhfI9+65P9nZK474r3OQgLcOO6su7Mi0RO/
         sbqiq5e+JWPsDu1wIUNWgN8NK7EIX6kj3g/8ZdFT/uCMuyi9IvWlBcBETHH0S27pXBgn
         7/uLqp2Cb77OJXJUVW91am+k8xXDqH6o4UAsvfK0XKm5VHJl49XP20PpE1sIyvSErUFQ
         wnhAeuaeix0aI6FXdEvRdeTmRruPjjGOd19+loDEI+IGolkIUeGdaswYpOIIpsD/M2AO
         1Bo92T8TTDfg5NChaRRKzJC5+D84DefhvS7pAgLGfcRxRRGwSUAjyIRYpstC7RIjTMJV
         VHuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqhWQk+ZMAHNQNMIKDJWcKlK0aFbGVGxEVNfYZSsZceT8m5wAoCKgd4l4TmoU6mc8ZUX4fDIzePvYnuTjaQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFtKiOMoz5E1Oeoqq6MZGNwV07gHD/+18S5mogqStMwjCG0fyc
	O6bdDUz0saxrSZ4LFb5Voo8f5Jk6YwPECov+ibHh8krfuiV5fNmIDWMpMyU+kOKWFT9h923bNkF
	ePBhUXMqFy3KCltXXOCRz524DCPNZWMSOWs8O6aLkRQ==
X-Gm-Gg: AZuq6aKBS8865XUNrb7grAehxRDPaTY6RD1IJChGl4N785aRfpK4VaL3vt+gzEbpor1
	EDrpcuBZdFIo7z/oHAhTVwmkeyz/1IErfR/w1bTwuEh7y5aPVPraW0P0J/qpUYFQ8mNUlqWBKJv
	k3aKfiM+9+lysBpe9sXKafUriZvi15bqBTmsB2ZQoOhx++iP2msgy+dHMfVCUZqbj4inOyEQV+d
	QLIIlq6nmsNIGCvErELKL5rr89LFGBiAXt5DE/vPmFJjUsH4KG39ZWOcHhTpH5v4DDjHMimiwiR
	1XLI7Us=
X-Received: by 2002:a05:6512:4005:b0:59d:f12c:9f05 with SMTP id
 2adb3069b0e04-59e0401a4eamr918529e87.23.1769522302270; Tue, 27 Jan 2026
 05:58:22 -0800 (PST)
MIME-Version: 1.0
References: <20251231035357.1147578-1-tzungbi@kernel.org> <CAGXv+5Fm7DFkZ_JONhHN4467=oVhuw-e1XtXuD53qBQDWd7cNw@mail.gmail.com>
In-Reply-To: <CAGXv+5Fm7DFkZ_JONhHN4467=oVhuw-e1XtXuD53qBQDWd7cNw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 27 Jan 2026 14:57:46 +0100
X-Gm-Features: AZwV_QgVAr_2niJYiUonIGgapgyqBQwATPHJ_yDF_S4wCInP9xq5Hp1p8jkeJQA
Message-ID: <CAPDyKFrqqXYy_Y-7WA=5taBhE4rcYX+Uz_RnGpOtD-AF3eipVQ@mail.gmail.com>
Subject: Re: [PATCH v2] pmdomain: mediatek: Break lock dependency to `prepare_lock`
To: Tzung-Bi Shih <tzungbi@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_055825_893050_F9C3CA0E 
X-CRM114-Status: GOOD (  34.76  )
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

On Thu, 22 Jan 2026 at 09:38, Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Wed, Dec 31, 2025 at 11:54=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.or=
g> wrote:
> >
> > Break a circular locking dependency between the Generic Power Domain
> > lock (`genpd->mlock`) and the clock framework's `prepare_lock`.  Move
> > the prepare() to the domain initialization phase and the unprepare()
> > to the cleanup phase.
> >
> > The possible deadlock occurs in the following scenario:
> >
> > 1. `genpd_power_on` acquires `genpd->mlock` and then calls the driver's
> >    `scpsys_power_on`.  The driver calls `clk_bulk_prepare_enable`,
> >    which attempts to acquire `prepare_lock`.
> >
> > > -> #0 (prepare_lock){+.+.}-{3:3}:
> > >        __lock_acquire
> > >        lock_acquire
> > >        __mutex_lock_common
> > >        mutex_lock_nested
> > >        clk_prepare
> > >        clk_bulk_prepare
> > >        scpsys_power_on
> > >        genpd_power_on
> >
> > 2. A clock provider (managed by a power domain) is resumed.
> >    `clk_prepare` acquires `prepare_lock` and triggers a runtime resume =
of
> >    its power domain, which attempts to acquire `genpd->mlock`.
> >
> > > -> #1 (&genpd->mlock){+.+.}-{3:3}:
> > >        __mutex_lock_common
> > >        mutex_lock_nested
> > >        genpd_lock_mtx
> > >        genpd_runtime_resume
> > >        __rpm_callback
> > >        rpm_callback
> > >        rpm_resume
> > >        __pm_runtime_resume
> > >        clk_core_prepare
> > >        clk_prepare
> > >        clk_bulk_prepare
> >
> > This creates a cycle: `mlock` -> `prepare_lock` -> `mlock`.
> >
> > > Possible unsafe locking scenario:
> > >
> > >       CPU0                    CPU1
> > >       ----                    ----
> > >  lock(&genpd->mlock);
> > >                               lock(prepare_lock);
> > >                               lock(&genpd->mlock);
> > >  lock(prepare_lock);
> >
> > This breaks the dependency chain in #0.
> >
> > This is a revert of f0fce06e345d ("soc: mtk-pm-domains: Fix the clock
> > prepared issue").  However, addressing the issue by moving the
> > unprepare()/prepare() to PM suspend()/resume() callbacks.
> >
> > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org> # MT8183 & MT8188 no regress=
ions
>
> This is unfortunately a known problem of the interaction between pmdomain=
s
> and the clk subsystem. This *breaks* the circular lock dependency. AFAIU
> this works because the clk prepare op is a no-op, because all the clocks
> are MMIO based.

Yes, this is a known problem that we need to fix properly for the
clock/genpd subsystems.

As an intermediate step, we could consider platform specific patches
to fix the problem too, along with $subject patch. However, $subject
patch has issues too, see more comments below.

>
> There is another question of whether this actually deadlocks or not, i.e.
> if the involved &genpd->mlock is the same object or not. Perhaps the
> accuracy of lockdep could be improved by setting a different lock class
> key and name? See what regmap does.
>
>
> > ---
> > v2:
> > - Fix build error reported by "kernel test robot <lkp@intel.com>".
> >
> > v1: https://lore.kernel.org/all/20251229043244.4103262-1-tzungbi@kernel=
.org/
> >
> >  drivers/pmdomain/mediatek/mtk-pm-domains.c | 101 +++++++++++++++++----
> >  1 file changed, 81 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdom=
ain/mediatek/mtk-pm-domains.c
> > index 80561d27f2b2..c371b08c9170 100644
> > --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> > +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> > @@ -318,12 +318,12 @@ static int scpsys_hwv_power_on(struct generic_pm_=
domain *genpd)
> >         if (ret)
> >                 goto err_infra;
> >
> > -       ret =3D clk_bulk_prepare_enable(pd->num_clks, pd->clks);
> > +       ret =3D clk_bulk_enable(pd->num_clks, pd->clks);
> >         if (ret)
> >                 goto err_reg;
> >
> >         /* For HWV the subsys clocks refer to the HWV low power subsyst=
em */
> > -       ret =3D clk_bulk_prepare_enable(pd->num_subsys_clks, pd->subsys=
_clks);
> > +       ret =3D clk_bulk_enable(pd->num_subsys_clks, pd->subsys_clks);
> >         if (ret)
> >                 goto err_disable_clks;
> >
> > @@ -365,7 +365,7 @@ static int scpsys_hwv_power_on(struct generic_pm_do=
main *genpd)
> >         }
> >
> >         /* It's done! Disable the HWV low power subsystem clocks */
> > -       clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks=
);
> > +       clk_bulk_disable(pd->num_subsys_clks, pd->subsys_clks);
> >
> >         if (MTK_SCPD_CAPS(pd, MTK_SCPD_INFRA_PWR_CTL))
> >                 scpsys_sec_infra_power_on(false);
> > @@ -373,9 +373,9 @@ static int scpsys_hwv_power_on(struct generic_pm_do=
main *genpd)
> >         return 0;
> >
> >  err_disable_subsys_clks:
> > -       clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks=
);
> > +       clk_bulk_disable(pd->num_subsys_clks, pd->subsys_clks);
> >  err_disable_clks:
> > -       clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
> > +       clk_bulk_disable(pd->num_clks, pd->clks);
> >  err_reg:
> >         scpsys_regulator_disable(pd->supply);
> >  err_infra:
> > @@ -398,7 +398,7 @@ static int scpsys_hwv_power_off(struct generic_pm_d=
omain *genpd)
> >                         return ret;
> >         }
> >
> > -       ret =3D clk_bulk_prepare_enable(pd->num_subsys_clks, pd->subsys=
_clks);
> > +       ret =3D clk_bulk_enable(pd->num_subsys_clks, pd->subsys_clks);

scpsys_hwv_power_off() is typically called by genpd in the suspend
noirq() phase, when all devices attached to the genpd in question have
been suspended too. See genpd_suspend_noirq().

This means that scpsys_suspend() (below) may be called to unprepare
the clock, before scpsys_hwv_power_off() may call clk_disable(). This
is a bug according to the clock framework.

Moving scpsys_suspend() to the noirq phase too could maybe work.
Although, perhaps an even simpler solution would be to do the
clk_prepare() during ->probe() and clk_unprepare() during ->remove()
(and error path in probe). Of course, this assumes that
clk_prepare/unprepare doesn't really do anything hardware wise, so we
don't start wasting power by keeping the clocks prepared.

> >         if (ret)
> >                 goto err_infra;
> >
> > @@ -437,8 +437,8 @@ static int scpsys_hwv_power_off(struct generic_pm_d=
omain *genpd)
> >         if (ret)
> >                 goto err_disable_subsys_clks;
> >
> > -       clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks=
);
> > -       clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
> > +       clk_bulk_disable(pd->num_subsys_clks, pd->subsys_clks);
> > +       clk_bulk_disable(pd->num_clks, pd->clks);
> >
> >         scpsys_regulator_disable(pd->supply);
> >
> > @@ -448,7 +448,7 @@ static int scpsys_hwv_power_off(struct generic_pm_d=
omain *genpd)
> >         return 0;
> >
> >  err_disable_subsys_clks:
> > -       clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks=
);
> > +       clk_bulk_disable(pd->num_subsys_clks, pd->subsys_clks);
> >  err_infra:
> >         if (MTK_SCPD_CAPS(pd, MTK_SCPD_INFRA_PWR_CTL))
> >                 scpsys_sec_infra_power_on(false);
> > @@ -616,7 +616,7 @@ static int scpsys_power_on(struct generic_pm_domain=
 *genpd)
> >         if (ret)
> >                 return ret;
> >
> > -       ret =3D clk_bulk_prepare_enable(pd->num_clks, pd->clks);
> > +       ret =3D clk_bulk_enable(pd->num_clks, pd->clks);
> >         if (ret)
> >                 goto err_reg;
> >
> > @@ -638,8 +638,7 @@ static int scpsys_power_on(struct generic_pm_domain=
 *genpd)
> >          * access.
> >          */
> >         if (!MTK_SCPD_CAPS(pd, MTK_SCPD_STRICT_BUS_PROTECTION)) {
> > -               ret =3D clk_bulk_prepare_enable(pd->num_subsys_clks,
> > -                                             pd->subsys_clks);
> > +               ret =3D clk_bulk_enable(pd->num_subsys_clks, pd->subsys=
_clks);
> >                 if (ret)
> >                         goto err_pwr_ack;
> >         }
> > @@ -653,8 +652,7 @@ static int scpsys_power_on(struct generic_pm_domain=
 *genpd)
> >                 goto err_disable_sram;
> >
> >         if (MTK_SCPD_CAPS(pd, MTK_SCPD_STRICT_BUS_PROTECTION)) {
> > -               ret =3D clk_bulk_prepare_enable(pd->num_subsys_clks,
> > -                                             pd->subsys_clks);
> > +               ret =3D clk_bulk_enable(pd->num_subsys_clks, pd->subsys=
_clks);
> >                 if (ret)
> >                         goto err_enable_bus_protect;
> >         }
> > @@ -667,10 +665,9 @@ static int scpsys_power_on(struct generic_pm_domai=
n *genpd)
> >         scpsys_sram_disable(pd);
> >  err_disable_subsys_clks:
> >         if (!MTK_SCPD_CAPS(pd, MTK_SCPD_STRICT_BUS_PROTECTION))
> > -               clk_bulk_disable_unprepare(pd->num_subsys_clks,
> > -                                          pd->subsys_clks);
> > +               clk_bulk_disable(pd->num_subsys_clks, pd->subsys_clks);
> >  err_pwr_ack:
> > -       clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
> > +       clk_bulk_disable(pd->num_clks, pd->clks);
> >  err_reg:
> >         scpsys_regulator_disable(pd->supply);
> >         return ret;
> > @@ -695,7 +692,7 @@ static int scpsys_power_off(struct generic_pm_domai=
n *genpd)
> >                 regmap_set_bits(scpsys->base, pd->data->ext_buck_iso_of=
fs,
> >                                 pd->data->ext_buck_iso_mask);
> >
> > -       clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks=
);
> > +       clk_bulk_disable(pd->num_subsys_clks, pd->subsys_clks);
> >
> >         if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_PWRSEQ))
> >                 scpsys_modem_pwrseq_off(pd);
> > @@ -708,7 +705,7 @@ static int scpsys_power_off(struct generic_pm_domai=
n *genpd)
> >         if (ret < 0)
> >                 return ret;
> >
> > -       clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
> > +       clk_bulk_disable(pd->num_clks, pd->clks);
> >
> >         scpsys_regulator_disable(pd->supply);
> >
> > @@ -855,6 +852,14 @@ generic_pm_domain *scpsys_add_one_domain(struct sc=
psys *scpsys, struct device_no
> >                 pd->genpd.flags |=3D GENPD_FLAG_IRQ_SAFE;
> >         }
> >
> > +       ret =3D clk_bulk_prepare(pd->num_clks, pd->clks);
> > +       if (ret)
> > +               goto err_put_subsys_clocks;
> > +
> > +       ret =3D clk_bulk_prepare(pd->num_subsys_clks, pd->subsys_clks);
> > +       if (ret)
> > +               goto err_unprepare_clocks;
> > +
> >         /*
> >          * Initially turn on all domains to make the domains usable
> >          * with !CONFIG_PM and to get the hardware in sync with the
> > @@ -869,7 +874,7 @@ generic_pm_domain *scpsys_add_one_domain(struct scp=
sys *scpsys, struct device_no
> >                 ret =3D pd->genpd.power_on(&pd->genpd);
> >                 if (ret < 0) {
> >                         dev_err(scpsys->dev, "%pOF: failed to power on =
domain: %d\n", node, ret);
> > -                       goto err_put_subsys_clocks;
> > +                       goto err_unprepare_subsys_clocks;
> >                 }
> >
> >                 if (MTK_SCPD_CAPS(pd, MTK_SCPD_ALWAYS_ON))
> > @@ -888,6 +893,10 @@ generic_pm_domain *scpsys_add_one_domain(struct sc=
psys *scpsys, struct device_no
> >
> >         return scpsys->pd_data.domains[id];
> >
> > +err_unprepare_subsys_clocks:
> > +       clk_bulk_unprepare(pd->num_subsys_clks, pd->subsys_clks);
> > +err_unprepare_clocks:
> > +       clk_bulk_unprepare(pd->num_clks, pd->clks);
> >  err_put_subsys_clocks:
> >         clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
> >  err_put_clocks:
> > @@ -965,6 +974,8 @@ static void scpsys_remove_one_domain(struct scpsys_=
domain *pd)
> >         if (scpsys_domain_is_on(pd))
> >                 scpsys_power_off(&pd->genpd);
> >
> > +       clk_bulk_unprepare(pd->num_clks, pd->clks);
> > +       clk_bulk_unprepare(pd->num_subsys_clks, pd->subsys_clks);
> >         clk_bulk_put(pd->num_clks, pd->clks);
> >         clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
> >  }
> > @@ -1208,6 +1219,7 @@ static int scpsys_probe(struct platform_device *p=
dev)
> >         if (!scpsys)
> >                 return -ENOMEM;
> >
> > +       platform_set_drvdata(pdev, scpsys);
> >         scpsys->dev =3D dev;
> >         scpsys->soc_data =3D soc;
> >
> > @@ -1270,12 +1282,61 @@ static int scpsys_probe(struct platform_device =
*pdev)
> >         return ret;
> >  }
> >
> > +#ifdef CONFIG_PM_SLEEP
> > +static int scpsys_suspend(struct device *dev)
> > +{
> > +       struct scpsys *scpsys =3D dev_get_drvdata(dev);
> > +       struct generic_pm_domain *genpd;
> > +       struct scpsys_domain *pd;
> > +       int i;
> > +
> > +       for (i =3D 0; i < scpsys->pd_data.num_domains; i++) {
> > +               genpd =3D scpsys->pd_data.domains[i];
> > +               if (!genpd)
> > +                       continue;
> > +
> > +               pd =3D to_scpsys_domain(genpd);
> > +               clk_bulk_unprepare(pd->num_clks, pd->clks);
> > +               clk_bulk_unprepare(pd->num_subsys_clks, pd->subsys_clks=
);
> > +       }
> > +       return 0;
> > +}
> > +
> > +static int scpsys_resume(struct device *dev)
> > +{
> > +       struct scpsys *scpsys =3D dev_get_drvdata(dev);
> > +       struct generic_pm_domain *genpd;
> > +       struct scpsys_domain *pd;
> > +       int i, ret;
> > +
> > +       for (i =3D 0; i < scpsys->pd_data.num_domains; i++) {
> > +               genpd =3D scpsys->pd_data.domains[i];
> > +               if (!genpd)
> > +                       continue;
> > +
> > +               pd =3D to_scpsys_domain(genpd);
> > +               ret =3D clk_bulk_prepare(pd->num_clks, pd->clks);
> > +               if (ret)
> > +                       return ret;
> > +               ret =3D clk_bulk_prepare(pd->num_subsys_clks, pd->subsy=
s_clks);
> > +               if (ret)
> > +                       return ret;
> > +       }
> > +       return 0;
> > +}
> > +#endif
> > +
> > +static const struct dev_pm_ops scpsys_pm_ops =3D {
> > +       SET_SYSTEM_SLEEP_PM_OPS(scpsys_suspend, scpsys_resume)
> > +};
> > +
> >  static struct platform_driver scpsys_pm_domain_driver =3D {
> >         .probe =3D scpsys_probe,
> >         .driver =3D {
> >                 .name =3D "mtk-power-controller",
> >                 .suppress_bind_attrs =3D true,
> >                 .of_match_table =3D scpsys_of_match,
> > +               .pm =3D &scpsys_pm_ops,
> >         },
> >  };
> >  builtin_platform_driver(scpsys_pm_domain_driver);
> > --
> > 2.52.0.351.gbe84eed79e-goog
> >
> >

Kind regards
Uffe

