Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3296C44500
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jan 2026 08:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YlaCsTUa7F4+bnXBKm75fmTPUHjK8kWJYjdBYurLfMU=; b=Vf+bPNoX5fbjvz+nqMXq23xhl2
	OXk5yPRcrI8QmQPQ+xuBbtx6gWwWjGyHtcFHx+RJ3z+/axiZY1USwIBiz3LLGm74CDd5jilC0RFGh
	hHwu18a3eSC1WsH3rsSigYwdlceTPh8nSgbtsJQ96mdG3rfln4DlzUy0xq7hbZcBGG3kqzaQH7cIW
	JarlKfMNDusYc2oAYBBeSotR4JBoEsS1y4tjOpkuQ1VTfJhEwEk0idCcNyx0Mqk3Ual2Ic3iR/fkz
	u203F6HGwfrZ5DljiY45KisUIku62a8Gn4CSLRCLaa9gbyGZy49TPldVtYajed4rYrtLVNTW3g1P3
	NvMffTZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqCj-00000006eyy-1SLc;
	Thu, 22 Jan 2026 08:38:13 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqCf-00000006exz-44UG
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Jan 2026 08:38:11 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-59b672f8ec4so729657e87.1
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Jan 2026 00:38:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769071087; cv=none;
        d=google.com; s=arc-20240605;
        b=lDudbj7QO0kPD/W1EHiU68g5zu4rUHScU0rWMqonOnGUleHuluO+0UbiaMGPAvAdsZ
         22DbgSiuEg0mmRUOWW1zHI5JFbAZnDCD9g91LQXETEklzpdYN7oAWmTsWV6XxKLoL+RA
         HZWUpmH5RJ0fozEJ1cMDg4k2gN1vLC7COltq0VuUrPQlTUc/uwbqfx0lBr5+fHWjs6ji
         MEQCLEP9aHvDp0BwF0/4MM1xRGV0abFwpZiz2exy0pTRkkVMB38FNOQSvOoimWs4OBS0
         QxZpvQffBc5uVgsVu7kSfGvU/CCS04LzXGk/uXGLWcW9m02jcQIhyZ3zmUNPi5E2f9Iz
         tkfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YlaCsTUa7F4+bnXBKm75fmTPUHjK8kWJYjdBYurLfMU=;
        fh=WRDmxL7uG1bbqfEZDIcDD4LCG3tYauRa8So+p7em1Ec=;
        b=A159QxLn3v3G3ibrrRhjD4zdK4boVwX7/z6L6K+3XsVQPiFU6VR3CkWDFESQ2z92He
         NBmGaJtB7SzU2s1fOhov0L+98uOW8Zrz3Imcp2O0Q86kInLI3bDBhDXkO/rGGliNtjSE
         fzb6wx7W64I+7BuYfevOAesJvjVuITPk+QjDc+zn0TFOovjn83idpgBFvh727494ZXOU
         Uv9VoyDdZcmlluD1mMM9sElbqQUXBH3dQcnjuqQattbHNstymd9qKH7kTpUJs1CF15/j
         eulRbONxbZOkVm57WOny4MCT6xtZeW5ARuX8jTXOvOWhMstuhbAxIWKxq2odjNuKY46f
         oshQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769071087; x=1769675887; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YlaCsTUa7F4+bnXBKm75fmTPUHjK8kWJYjdBYurLfMU=;
        b=JJeWBon5WahUY/4XQewJdW3W/TUQn9+zt1xghKj/DRM1Vdu3QgnrhoIAmSLTtXkXlj
         A4poOnyY4sqqfG0uPi2gAdrn//rUe9fTXpZv5t939Bw9FaT1QG7IHl0E0oeMQbkfBWgy
         rFpOpbwy0VJFiFBb2rGh7AHlENqy5nXEhpVds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769071087; x=1769675887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YlaCsTUa7F4+bnXBKm75fmTPUHjK8kWJYjdBYurLfMU=;
        b=Uma1o1sOeZ3nJx7ngysaowrAs5A8KzwL69zL2nwYD2hSaYycFDU+srhLjjTzKijBu8
         +R9JiDmvj+lflwSbeEZGtHTgqOmn8rg/rzFOXCJS8Ju1Wxuivzf4wGNKLwYKf+vHabqf
         WorkSd9goBY0cr9KgrdU6lDStK9x2iMzVvUZ8gPWZSQn/IaCTDn5g4P9CysWMUr+BjDi
         vfIoj/1bgvdrgvGI9Gj5MUuPIk9LUkCO65I6C/qjVBgT2S8Am8CfOx3nfbUmc7L5Ixoc
         MDwv29CrCgGjX0StRErVXCc0UZ9iet8QUut3IA7JUeiscYCVhW6gxfb/BGoijXwLWVQq
         2H9w==
X-Forwarded-Encrypted: i=1; AJvYcCU3TOJqX7c0OcA39Kd/ATZpNwf0VPHXWYD/H8/v0kw5PAcLAj0pMrd4/gV1HxCzWO+wrXifjP3OzDmzGVm/Tg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxS2B1PVryaUqm0IRLTsEJrFNYCdx3dlyD2Gk941XBpF4cmqn1n
	ie/0lofzHRWFeZMjYuG6qPXDRCSuoNiRJaaTFEE0BdI6DbEBZnLkS19QHZDvf7l6ZR60VR0V2Gp
	XU2MiFvwAfvsjnDcU6H44BdllzB4pqDeo48ZUx4rL
X-Gm-Gg: AZuq6aIxCx4z9PwcewQaKRCybpU7ndQokgkTP0gZLa27KdOmMTGo4ZduqxwTeiAtn/T
	z5lEuGGvAwST1RlqD7xyxr70vRzXysNLQWsrvG+NS71bsvLdrcvJu/v7IMHjp++j6lQYsE7ohdS
	dSE1kYXUtyY9q0kPh4Hz79DW38fVgrxzeaP1zRZoFROjBe5PS4VNIkR7fsOLRPumzvXcOLfeUfU
	eIElwuI1NV7Qt9urpJldjVPWGGTMztpAQQPoGdmuUHVZqmnAmKGJo4BKKQiLbw2+qgSWHKKA34r
	nx5m/jLMlIh0w3yGE7Hr/y0X
X-Received: by 2002:a05:6512:3a89:b0:59d:df5e:bfdf with SMTP id
 2adb3069b0e04-59ddf5ec025mr395152e87.33.1769071087312; Thu, 22 Jan 2026
 00:38:07 -0800 (PST)
MIME-Version: 1.0
References: <20251231035357.1147578-1-tzungbi@kernel.org>
In-Reply-To: <20251231035357.1147578-1-tzungbi@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 22 Jan 2026 16:37:55 +0800
X-Gm-Features: AZwV_QjeC9rZEZXIfjNiCuGnuqLpCfwJ2SqaV5XzQbAguloGd0OTwSGqZvreCjo
Message-ID: <CAGXv+5Fm7DFkZ_JONhHN4467=oVhuw-e1XtXuD53qBQDWd7cNw@mail.gmail.com>
Subject: Re: [PATCH v2] pmdomain: mediatek: Break lock dependency to `prepare_lock`
To: Tzung-Bi Shih <tzungbi@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_003810_139907_70DA7904 
X-CRM114-Status: GOOD (  28.54  )
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

On Wed, Dec 31, 2025 at 11:54=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
>
> Break a circular locking dependency between the Generic Power Domain
> lock (`genpd->mlock`) and the clock framework's `prepare_lock`.  Move
> the prepare() to the domain initialization phase and the unprepare()
> to the cleanup phase.
>
> The possible deadlock occurs in the following scenario:
>
> 1. `genpd_power_on` acquires `genpd->mlock` and then calls the driver's
>    `scpsys_power_on`.  The driver calls `clk_bulk_prepare_enable`,
>    which attempts to acquire `prepare_lock`.
>
> > -> #0 (prepare_lock){+.+.}-{3:3}:
> >        __lock_acquire
> >        lock_acquire
> >        __mutex_lock_common
> >        mutex_lock_nested
> >        clk_prepare
> >        clk_bulk_prepare
> >        scpsys_power_on
> >        genpd_power_on
>
> 2. A clock provider (managed by a power domain) is resumed.
>    `clk_prepare` acquires `prepare_lock` and triggers a runtime resume of
>    its power domain, which attempts to acquire `genpd->mlock`.
>
> > -> #1 (&genpd->mlock){+.+.}-{3:3}:
> >        __mutex_lock_common
> >        mutex_lock_nested
> >        genpd_lock_mtx
> >        genpd_runtime_resume
> >        __rpm_callback
> >        rpm_callback
> >        rpm_resume
> >        __pm_runtime_resume
> >        clk_core_prepare
> >        clk_prepare
> >        clk_bulk_prepare
>
> This creates a cycle: `mlock` -> `prepare_lock` -> `mlock`.
>
> > Possible unsafe locking scenario:
> >
> >       CPU0                    CPU1
> >       ----                    ----
> >  lock(&genpd->mlock);
> >                               lock(prepare_lock);
> >                               lock(&genpd->mlock);
> >  lock(prepare_lock);
>
> This breaks the dependency chain in #0.
>
> This is a revert of f0fce06e345d ("soc: mtk-pm-domains: Fix the clock
> prepared issue").  However, addressing the issue by moving the
> unprepare()/prepare() to PM suspend()/resume() callbacks.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org> # MT8183 & MT8188 no regressio=
ns

This is unfortunately a known problem of the interaction between pmdomains
and the clk subsystem. This *breaks* the circular lock dependency. AFAIU
this works because the clk prepare op is a no-op, because all the clocks
are MMIO based.

There is another question of whether this actually deadlocks or not, i.e.
if the involved &genpd->mlock is the same object or not. Perhaps the
accuracy of lockdep could be improved by setting a different lock class
key and name? See what regmap does.


> ---
> v2:
> - Fix build error reported by "kernel test robot <lkp@intel.com>".
>
> v1: https://lore.kernel.org/all/20251229043244.4103262-1-tzungbi@kernel.o=
rg/
>
>  drivers/pmdomain/mediatek/mtk-pm-domains.c | 101 +++++++++++++++++----
>  1 file changed, 81 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomai=
n/mediatek/mtk-pm-domains.c
> index 80561d27f2b2..c371b08c9170 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -318,12 +318,12 @@ static int scpsys_hwv_power_on(struct generic_pm_do=
main *genpd)
>         if (ret)
>                 goto err_infra;
>
> -       ret =3D clk_bulk_prepare_enable(pd->num_clks, pd->clks);
> +       ret =3D clk_bulk_enable(pd->num_clks, pd->clks);
>         if (ret)
>                 goto err_reg;
>
>         /* For HWV the subsys clocks refer to the HWV low power subsystem=
 */
> -       ret =3D clk_bulk_prepare_enable(pd->num_subsys_clks, pd->subsys_c=
lks);
> +       ret =3D clk_bulk_enable(pd->num_subsys_clks, pd->subsys_clks);
>         if (ret)
>                 goto err_disable_clks;
>
> @@ -365,7 +365,7 @@ static int scpsys_hwv_power_on(struct generic_pm_doma=
in *genpd)
>         }
>
>         /* It's done! Disable the HWV low power subsystem clocks */
> -       clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
> +       clk_bulk_disable(pd->num_subsys_clks, pd->subsys_clks);
>
>         if (MTK_SCPD_CAPS(pd, MTK_SCPD_INFRA_PWR_CTL))
>                 scpsys_sec_infra_power_on(false);
> @@ -373,9 +373,9 @@ static int scpsys_hwv_power_on(struct generic_pm_doma=
in *genpd)
>         return 0;
>
>  err_disable_subsys_clks:
> -       clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
> +       clk_bulk_disable(pd->num_subsys_clks, pd->subsys_clks);
>  err_disable_clks:
> -       clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
> +       clk_bulk_disable(pd->num_clks, pd->clks);
>  err_reg:
>         scpsys_regulator_disable(pd->supply);
>  err_infra:
> @@ -398,7 +398,7 @@ static int scpsys_hwv_power_off(struct generic_pm_dom=
ain *genpd)
>                         return ret;
>         }
>
> -       ret =3D clk_bulk_prepare_enable(pd->num_subsys_clks, pd->subsys_c=
lks);
> +       ret =3D clk_bulk_enable(pd->num_subsys_clks, pd->subsys_clks);
>         if (ret)
>                 goto err_infra;
>
> @@ -437,8 +437,8 @@ static int scpsys_hwv_power_off(struct generic_pm_dom=
ain *genpd)
>         if (ret)
>                 goto err_disable_subsys_clks;
>
> -       clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
> -       clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
> +       clk_bulk_disable(pd->num_subsys_clks, pd->subsys_clks);
> +       clk_bulk_disable(pd->num_clks, pd->clks);
>
>         scpsys_regulator_disable(pd->supply);
>
> @@ -448,7 +448,7 @@ static int scpsys_hwv_power_off(struct generic_pm_dom=
ain *genpd)
>         return 0;
>
>  err_disable_subsys_clks:
> -       clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
> +       clk_bulk_disable(pd->num_subsys_clks, pd->subsys_clks);
>  err_infra:
>         if (MTK_SCPD_CAPS(pd, MTK_SCPD_INFRA_PWR_CTL))
>                 scpsys_sec_infra_power_on(false);
> @@ -616,7 +616,7 @@ static int scpsys_power_on(struct generic_pm_domain *=
genpd)
>         if (ret)
>                 return ret;
>
> -       ret =3D clk_bulk_prepare_enable(pd->num_clks, pd->clks);
> +       ret =3D clk_bulk_enable(pd->num_clks, pd->clks);
>         if (ret)
>                 goto err_reg;
>
> @@ -638,8 +638,7 @@ static int scpsys_power_on(struct generic_pm_domain *=
genpd)
>          * access.
>          */
>         if (!MTK_SCPD_CAPS(pd, MTK_SCPD_STRICT_BUS_PROTECTION)) {
> -               ret =3D clk_bulk_prepare_enable(pd->num_subsys_clks,
> -                                             pd->subsys_clks);
> +               ret =3D clk_bulk_enable(pd->num_subsys_clks, pd->subsys_c=
lks);
>                 if (ret)
>                         goto err_pwr_ack;
>         }
> @@ -653,8 +652,7 @@ static int scpsys_power_on(struct generic_pm_domain *=
genpd)
>                 goto err_disable_sram;
>
>         if (MTK_SCPD_CAPS(pd, MTK_SCPD_STRICT_BUS_PROTECTION)) {
> -               ret =3D clk_bulk_prepare_enable(pd->num_subsys_clks,
> -                                             pd->subsys_clks);
> +               ret =3D clk_bulk_enable(pd->num_subsys_clks, pd->subsys_c=
lks);
>                 if (ret)
>                         goto err_enable_bus_protect;
>         }
> @@ -667,10 +665,9 @@ static int scpsys_power_on(struct generic_pm_domain =
*genpd)
>         scpsys_sram_disable(pd);
>  err_disable_subsys_clks:
>         if (!MTK_SCPD_CAPS(pd, MTK_SCPD_STRICT_BUS_PROTECTION))
> -               clk_bulk_disable_unprepare(pd->num_subsys_clks,
> -                                          pd->subsys_clks);
> +               clk_bulk_disable(pd->num_subsys_clks, pd->subsys_clks);
>  err_pwr_ack:
> -       clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
> +       clk_bulk_disable(pd->num_clks, pd->clks);
>  err_reg:
>         scpsys_regulator_disable(pd->supply);
>         return ret;
> @@ -695,7 +692,7 @@ static int scpsys_power_off(struct generic_pm_domain =
*genpd)
>                 regmap_set_bits(scpsys->base, pd->data->ext_buck_iso_offs=
,
>                                 pd->data->ext_buck_iso_mask);
>
> -       clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
> +       clk_bulk_disable(pd->num_subsys_clks, pd->subsys_clks);
>
>         if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_PWRSEQ))
>                 scpsys_modem_pwrseq_off(pd);
> @@ -708,7 +705,7 @@ static int scpsys_power_off(struct generic_pm_domain =
*genpd)
>         if (ret < 0)
>                 return ret;
>
> -       clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
> +       clk_bulk_disable(pd->num_clks, pd->clks);
>
>         scpsys_regulator_disable(pd->supply);
>
> @@ -855,6 +852,14 @@ generic_pm_domain *scpsys_add_one_domain(struct scps=
ys *scpsys, struct device_no
>                 pd->genpd.flags |=3D GENPD_FLAG_IRQ_SAFE;
>         }
>
> +       ret =3D clk_bulk_prepare(pd->num_clks, pd->clks);
> +       if (ret)
> +               goto err_put_subsys_clocks;
> +
> +       ret =3D clk_bulk_prepare(pd->num_subsys_clks, pd->subsys_clks);
> +       if (ret)
> +               goto err_unprepare_clocks;
> +
>         /*
>          * Initially turn on all domains to make the domains usable
>          * with !CONFIG_PM and to get the hardware in sync with the
> @@ -869,7 +874,7 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsy=
s *scpsys, struct device_no
>                 ret =3D pd->genpd.power_on(&pd->genpd);
>                 if (ret < 0) {
>                         dev_err(scpsys->dev, "%pOF: failed to power on do=
main: %d\n", node, ret);
> -                       goto err_put_subsys_clocks;
> +                       goto err_unprepare_subsys_clocks;
>                 }
>
>                 if (MTK_SCPD_CAPS(pd, MTK_SCPD_ALWAYS_ON))
> @@ -888,6 +893,10 @@ generic_pm_domain *scpsys_add_one_domain(struct scps=
ys *scpsys, struct device_no
>
>         return scpsys->pd_data.domains[id];
>
> +err_unprepare_subsys_clocks:
> +       clk_bulk_unprepare(pd->num_subsys_clks, pd->subsys_clks);
> +err_unprepare_clocks:
> +       clk_bulk_unprepare(pd->num_clks, pd->clks);
>  err_put_subsys_clocks:
>         clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
>  err_put_clocks:
> @@ -965,6 +974,8 @@ static void scpsys_remove_one_domain(struct scpsys_do=
main *pd)
>         if (scpsys_domain_is_on(pd))
>                 scpsys_power_off(&pd->genpd);
>
> +       clk_bulk_unprepare(pd->num_clks, pd->clks);
> +       clk_bulk_unprepare(pd->num_subsys_clks, pd->subsys_clks);
>         clk_bulk_put(pd->num_clks, pd->clks);
>         clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
>  }
> @@ -1208,6 +1219,7 @@ static int scpsys_probe(struct platform_device *pde=
v)
>         if (!scpsys)
>                 return -ENOMEM;
>
> +       platform_set_drvdata(pdev, scpsys);
>         scpsys->dev =3D dev;
>         scpsys->soc_data =3D soc;
>
> @@ -1270,12 +1282,61 @@ static int scpsys_probe(struct platform_device *p=
dev)
>         return ret;
>  }
>
> +#ifdef CONFIG_PM_SLEEP
> +static int scpsys_suspend(struct device *dev)
> +{
> +       struct scpsys *scpsys =3D dev_get_drvdata(dev);
> +       struct generic_pm_domain *genpd;
> +       struct scpsys_domain *pd;
> +       int i;
> +
> +       for (i =3D 0; i < scpsys->pd_data.num_domains; i++) {
> +               genpd =3D scpsys->pd_data.domains[i];
> +               if (!genpd)
> +                       continue;
> +
> +               pd =3D to_scpsys_domain(genpd);
> +               clk_bulk_unprepare(pd->num_clks, pd->clks);
> +               clk_bulk_unprepare(pd->num_subsys_clks, pd->subsys_clks);
> +       }
> +       return 0;
> +}
> +
> +static int scpsys_resume(struct device *dev)
> +{
> +       struct scpsys *scpsys =3D dev_get_drvdata(dev);
> +       struct generic_pm_domain *genpd;
> +       struct scpsys_domain *pd;
> +       int i, ret;
> +
> +       for (i =3D 0; i < scpsys->pd_data.num_domains; i++) {
> +               genpd =3D scpsys->pd_data.domains[i];
> +               if (!genpd)
> +                       continue;
> +
> +               pd =3D to_scpsys_domain(genpd);
> +               ret =3D clk_bulk_prepare(pd->num_clks, pd->clks);
> +               if (ret)
> +                       return ret;
> +               ret =3D clk_bulk_prepare(pd->num_subsys_clks, pd->subsys_=
clks);
> +               if (ret)
> +                       return ret;
> +       }
> +       return 0;
> +}
> +#endif
> +
> +static const struct dev_pm_ops scpsys_pm_ops =3D {
> +       SET_SYSTEM_SLEEP_PM_OPS(scpsys_suspend, scpsys_resume)
> +};
> +
>  static struct platform_driver scpsys_pm_domain_driver =3D {
>         .probe =3D scpsys_probe,
>         .driver =3D {
>                 .name =3D "mtk-power-controller",
>                 .suppress_bind_attrs =3D true,
>                 .of_match_table =3D scpsys_of_match,
> +               .pm =3D &scpsys_pm_ops,
>         },
>  };
>  builtin_platform_driver(scpsys_pm_domain_driver);
> --
> 2.52.0.351.gbe84eed79e-goog
>
>

