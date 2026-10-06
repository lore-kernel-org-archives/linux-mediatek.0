Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B78ACA5FED
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2026 08:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3shV/IEEj+NmVizCeUDHMNW1W3PTgtTr4WQ4n8BMHxY=; b=x/wFhWjMBybfoGk2+FLycAkz8a
	xvGJncdZX7H7bx/GKprlW3I9h51F5yNyonjuhXL9SIcSmF24LTgzxIkG7RSy4lZk+u/gpAe6bv/VG
	3GAg54rsZrqAJU83DGdpbR6HW95gSqaA/t9UVnY/L8uFoDFRcqmDsal9ykqTDS+3ByZMXjRuDWpnS
	RJpPoNkKVqBygqRBoGFv/JHwOxMl72M+Xo7c27j2NH5IImcXBVxhGXrBKd02PJmiybExwheKdpOje
	+zLEbAj9EWqN8H3QOTsmqC9e3vvpdW9xM4shlf7Sc6TELh/sWBF4RP2cFlARMKG0Tldb5T0XtSnX9
	yk7a3elA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE0bR-00000000HsH-1suf;
	Tue, 06 Oct 2026 08:32:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE0bQ-00000000Hrx-0MXW
	for linux-mediatek@bombadil.infradead.org;
	Tue, 06 Oct 2026 08:32:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3shV/IEEj+NmVizCeUDHMNW1W3PTgtTr4WQ4n8BMHxY=; b=EWEF5OJeS+INeVwbT1HVYH95AW
	2QNWc9cALutiRhr8bMSDgdj64HhMq/z/PdzU01/VBwxFEktVtKd8pzhvCGOyzNsH6KuR8ocVREFvf
	SBaaFpIb7FnHbGxqayIGgtlHo5Jz1ueKBpbN4/uetLdPeYliiq0M6SuzluUEY8Tmblo5IWbr2YK3N
	9Wix4bG75ZcObsgAZSmFkb7waV2Q7XW+vbs53Olz8DJnWBgutfvHbw0hllSqI42z917phdqCr5OsT
	STSfoAunTdKY+SKGRhSuP8sXl6Y3Obu8s/KqoW9hBc1j76H6g64+WgB/Z1Bhl8NhbZHtn4RnYp4kn
	nlOB4DsQ==;
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xE0bK-00000008ZVQ-1Q0t
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Oct 2026 08:32:46 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-677c1fc082bso2079718d50.3
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Oct 2026 01:32:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791275553; cv=none;
        d=google.com; s=arc-20260327;
        b=hYLVBBmzSmGMD4hOFg0gMCfxjWnOODv+7lCbUW29Ogb8MZ8lTkZEz6eakj2+oFSEHQ
         sYPFa/HHXJy785DxoH0BTA9sAfVAILE2/QqveoZwru+UNbS3dt7dbjEZOmggsIe03SoZ
         +jqgZP/vbQK5irStDBFAS8YoCnDizxxCTLtq+IiId/LoJQx094IqvX0HfGWqV9YhjHNR
         rpZEnCszZyDn24ckkmELRxE+xKG3CodMbTgxvFMjOUdBtBBNcLP1RukghFvPVbkDoP1D
         4aqLR9lOzpMs+8JKmNy/7ECe8W3MBBzBrr4pj3+D7ZBvO2ozg42tPLtlEE6xk258NitM
         EClQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3shV/IEEj+NmVizCeUDHMNW1W3PTgtTr4WQ4n8BMHxY=;
        fh=PuCBaN18EJUUmqtuEblfypITq2ewviUjwHJ201Vo2jc=;
        b=luZcg5IZ1G7V2xv+5bn7iqU/fn0q1T9tuCD0hUPAyq4fx2Lxw6sySS66fvOxLZVXwK
         hZ423mn6OUu6YMjQ50q0fiFFFomEF8g6fsfokVz+AyNHQ1yp3WxtSFMgXdWAodSPW65e
         IGgGhvvFnj258X+IG70RYKV3UR7Iu3Ay4k1syxF8LrKQhRbejQ4dOjmT3ce2k5uJy0M9
         Dag1oJRYrstCn++lhWdA1NY7V4fImgxYwjfHIJDPRX7K+c71FLJOid7MHNYyNajpSStJ
         CD+BS8b9qWpNFp3WbKF9dpd3qIfK8r/GqpQYLv8xsrlaHblCsaX/v0EVYeiu4c6WwvUn
         r5sQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791275553; x=1791880353; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3shV/IEEj+NmVizCeUDHMNW1W3PTgtTr4WQ4n8BMHxY=;
        b=DkgJnhcwXV+ZZKYJ1rbV7UU29i13vLjt1lAWTWe5L8Z23tgKwokO3dA0Vl9e+YIjmt
         BserJGi/P+5OZiIqMAGMqW6/kxP+hR2p9wzB0j2nUjbFBnHn8TXQIEM2OAsMwV2gF8Yz
         PibTP02gzqitchfKkmqpCwI0hY13QQV63tWDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791275553; x=1791880353;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3shV/IEEj+NmVizCeUDHMNW1W3PTgtTr4WQ4n8BMHxY=;
        b=zU6dY1u/wv9Zi+xtskfjLcOiBG1pdKKZ/MZw0NzEIqWrSKjJS/avj8apwAqGu4DI+N
         o7L92GF+mQpyPtygrELPRgbitsp+43SqSup4ZhOb4N4Xg2djlJWpmG4cvgyoVtdrYz5J
         4S5auUpqSzKZtLSwLw3Oa+/P8ovuApOIdIPDwlnvQOW73Z3rvaPkK8ZQhnLwJzWYn4py
         Qelv3rbojMOViMVZu/0N3aLnxP0bolfYQraD64InG0vNuYHH98R+Mf5SGDdxyEL1LiDh
         wu71icZrfCstCQ5Lm8IUXVKUOAugNQIhg1c1X1JhUH3gR4WMvmRsUqOrLJQhIkJ4tiIf
         k4Kw==
X-Forwarded-Encrypted: i=1; AKwUvBzXLXVcqk6BwcVrZlY58MF7ZsNw6oLjUuIOsOQ5e8zYw075IcgA4im9pp1t6kyhSjnvW8Aqdr+2BiOdDUhICA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJDc7C4nlBgw5vtX7bl0jwNN4hFYHEFGszVMTqT8Yun9slgxCDQ
	vVQiZH3IcXlm6BZcVEwpicFFrw4pagDmgC2GJGA2n5PyIC8tbt2/4f1s624QmvDPAupsQqzpyzE
	Da4zywEPrDO3FvBMHWbrvkJdUg8x8ntU46IEatDKv
X-Gm-Gg: AYBFou1SHGl0vAG8l+FFlBrexEPAgum1eXp9BhDvFRHTkuOtLm0PqC62ezMYsFDT9N6
	U5jeBpl01oKuDO58T9WZRnocYrEZOYcb2MiFvLzJr8VkDTJMijjhfG4CUKdAhJ9iU8Y9HmRrWSn
	WJsrx56gedsFs8tUeEqJiuG63A4JrGXmyO9Wihz47Cdk0HBDffrp/+EZpOnnz8ONpGibOfk1vsL
	oK/lBlKZLmjvTEPTHCdZpwatARdILICcrqGHtkF1QMpeZPgepP3XntB1FqBmkPPgkmS5i5JlEDK
	pIKZ7p7DFTzuKtkfzQAfK1PJhE64FTVRdNS6BoHaYEqobZhBfWIIag==
X-Received: by 2002:a53:c0c2:0:b0:671:7b7f:abbb with SMTP id
 956f58d0204a3-677bd39aa4dmr2469021d50.59.1791275553415; Tue, 06 Oct 2026
 01:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <20261006025410.506443-1-nils@buechner.me> <20261006025410.506443-3-nils@buechner.me>
In-Reply-To: <20261006025410.506443-3-nils@buechner.me>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 6 Oct 2026 10:32:21 +0200
X-Gm-Features: AclHuK8Gx2HsVGfCjYPgfM4FA2K14FiDyp_XESIE_p6YvoUuSuzEHEzfn-CxmWQ
Message-ID: <CAGXv+5F-5b+ESeUXBMYfKU=wUF9tAioyWOjWfYXoz09_-P8-bg@mail.gmail.com>
Subject: Re: [PATCH 2/2] soc: mediatek: mtk-svs: Don't fail init01 on a bank
 whose buck is not at vboot yet
To: =?UTF-8?Q?Nils_B=C3=BCchner?= <nils@buechner.me>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_093244_998124_04682241 
X-CRM114-Status: GOOD (  29.48  )
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

On Tue, Oct 6, 2026 at 4:54=E2=80=AFAM Nils B=C3=BCchner <nils@buechner.me>=
 wrote:
>
> svs_init01() moves every bank to its vboot OPP and then immediately
> requires the bank's buck to read back exactly vboot. For the MT8183 GPU
> banks the buck follows panfrost devfreq, which has not necessarily acted
> on the OPP change yet (an idle GPU stays at its lowest OPP), so the
> check fails and the whole SVS probe aborts with -EPERM, leaving the CPU
> and CCI banks uncalibrated as well:
>
>   SVSB_GPU: buck voltage: 700000uV, expected vboot: 800000uV
>   mtk-svs 1100bc00.svs: error -EPERM: svs start fail
>
> Poll the buck for up to 500ms before giving up. If it still is not at
> vboot, skip only that bank: restore its default OPP voltages, disable it,
> and calibrate the others.
>
> On Acer Chromebook Spin 311 (MT8183) the GPU buck reaches vboot within
> the poll window and all four banks complete init01/init02.

Were both drivers (mtk-svs and panfrost) built-in, or as modules?
This would affect the timing.

> Runtime-tested on an Acer Chromebook Spin 311 (MT8183, juniper) with a
> 7.0-based kernel (the hardware is not set up to boot mainline);
> build-tested on mainline with W=3D1. On the device together with
> the auxadc_thermal per-sensor zone change: all four banks complete
> init01/init02 at boot (CPU little 1.99 GHz 1050 -> 1000 mV), stable
> under 60 s of full load on all cores at maximum frequency.
>
> The change and this changelog were drafted with an AI coding assistant
> during a debugging session on the hardware; they were reviewed and
> tested by the submitter.

This section could be moved after the "---".

> Fixes: 681a02e95000 ("soc: mediatek: SVS: introduce MTK SVS engine")
> Assisted-by: Claude Opus 5.5
> Signed-off-by: Nils B=C3=BCchner <nils@buechner.me>
> ---
>  drivers/soc/mediatek/mtk-svs.c | 34 +++++++++++++++++++++++++++-------
>  1 file changed, 27 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-sv=
s.c
> index 99edecb20..2598a1ccb 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -16,6 +16,7 @@
>  #include <linux/device.h>
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
> +#include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/kthread.h>
>  #include <linux/module.h>
> @@ -1439,6 +1440,7 @@ static int svs_init01(struct svs_platform *svsp)
>         bool search_done;
>         int ret =3D 0, r;
>         u32 opp_freq, opp_vboot, buck_volt, idx, i;
> +       unsigned long skipped =3D 0;
>
>         if (!svs_mode_available(svsp, SVSB_MODE_INIT01))
>                 return 0;
> @@ -1542,13 +1544,20 @@ static int svs_init01(struct svs_platform *svsp)
>                                                       bdata->volt_step,
>                                                       bdata->volt_base);
>
> -               buck_volt =3D regulator_get_voltage(svsb->buck);
> -               if (buck_volt !=3D opp_vboot) {
> -                       dev_err(svsb->dev,
> -                               "buck voltage: %uuV, expected vboot: %uuV=
\n",
> -                               buck_volt, opp_vboot);
> -                       ret =3D -EPERM;
> -                       goto svs_init01_finish;
> +               /*
> +                * The consumer's DVFS (e.g. GPU devfreq while the GPU is=
 idle)
> +                * may not have moved to the vboot OPP yet. Give it a mom=
ent,
> +                * then calibrate the remaining banks without this one in=
stead
> +                * of failing the whole SVS probe.
> +                */
> +               if (read_poll_timeout(regulator_get_voltage, buck_volt,
> +                                     buck_volt =3D=3D opp_vboot, 10000, =
500000,
> +                                     false, svsb->buck)) {
> +                       dev_warn(svsb->dev,
> +                                "buck voltage: %uuV, expected vboot: %uu=
V, skipping bank\n",
> +                                buck_volt, opp_vboot);
> +                       __set_bit(idx, &skipped);
> +                       continue;
>                 }
>
>                 spin_lock_irqsave(&svs_lock, flags);
> @@ -1578,6 +1587,14 @@ static int svs_init01(struct svs_platform *svsp)
>                         if (r)
>                                 dev_err(svsb->dev, "opp %uHz enable fail:=
 %d\n",
>                                         svsb->opp_dfreq[i], r);
> +
> +                       /* A skipped bank keeps its default OPP voltages =
*/
> +                       if (test_bit(idx, &skipped))
> +                               dev_pm_opp_adjust_voltage(svsb->opp_dev,
> +                                                         svsb->opp_dfreq=
[i],
> +                                                         svsb->opp_dvolt=
[i],
> +                                                         svsb->opp_dvolt=
[i],
> +                                                         svsb->opp_dvolt=
[i]);
>                 }
>
>                 if (svsb->volt_flags & SVSB_INIT01_PD_REQ) {
> @@ -1599,6 +1616,9 @@ static int svs_init01(struct svs_platform *svsp)
>                 if (r)
>                         dev_err(svsb->dev, "%s disable fail: %d\n",
>                                 bdata->buck_name, r);
> +
> +               if (test_bit(idx, &skipped))
> +                       svsb->mode_support =3D SVSB_MODE_ALL_DISABLE;
>         }
>
>  svs_init01_resume_cpuidle:
> --
> 2.53.0
>
>

