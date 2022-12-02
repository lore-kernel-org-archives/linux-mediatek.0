Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE189C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Dec 2022 19:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yt0wmF0a++96BW0ABApkcWlkwutyseNN3f24uUrtD88=; b=E78J1hrWjV8ooNYEEHaOQhNP9P
	tLTLaxzD1JVdiDam54MCS3nTjKbuU3X7EmrQ9o++9gyMc2i67qsFWl/8kA4Oed1ugHeDMpr3bMFye
	bb3ApRQo74crwNb1mblB5Yqju+ZJkAhZ3qLvdUrzPY+uExkMLx/ZWon26uDJSvCrBa3VMix5h3UE8
	SpOfqZBcjL3TWm0raeQAlu8KJiEfgaJhhcqfrr/d6210yw2sPxwcbhoZCUO7MRcPmMGm2na0Ihii5
	jpLNdo2Q4FfxTBaBIRvhxZGRTc9O9q3yfJRo0ENqAt58G79GtYemsl7yx+YQ3vs8fqZxPx07S/TIu
	SP0mvdGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1Bzm-0016pQ-8u; Fri, 02 Dec 2022 19:46:50 +0000
Received: from mail-qt1-f178.google.com ([209.85.160.178])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1Bzc-0016n4-1X; Fri, 02 Dec 2022 19:46:41 +0000
Received: by mail-qt1-f178.google.com with SMTP id cg5so6636735qtb.12;
        Fri, 02 Dec 2022 11:46:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yt0wmF0a++96BW0ABApkcWlkwutyseNN3f24uUrtD88=;
        b=ga8tEWRg1Mv/Kq7cS9Rm7umEBjrQAdWFjfMn3ehcCobOtstgIhcITsirkqzRtgcQHL
         OVvD1U4sQJP7hTbfoE3qXWiV+E9pLA3bh7ULzvz+NJWwqiIVQ1sMYydiikOcJeKFW24+
         i6jPC+zk1M9yGJR4DWbu19MxrLpZx/NlCZ3GOhNzouw1thBGLmaDWnh1d8JVvwNHJSjM
         tKU3dlwUgJXUNthbIkX8dmHHNK1k9N6FNzjCcGLqtZuEFbog5hZEfwyldQrTWjBnFoT/
         8QpkxSw+WXDY+q/RnNp7ftDxF9k663LA/ucITFd93CkFD+wAXN3KNFiol9kdMhO0XBpM
         1E2Q==
X-Gm-Message-State: ANoB5pktTbBhr+LFUqFDfM2yakUf4H/XfKCrWSOpZuI9c1DD/sfA+7/k
	dTAuBjzY3g5JG6e/Cl2IbSfSWrZH8ncrH5fJUpU=
X-Google-Smtp-Source: AA0mqf4L9vUfM78+IFKlNHBPG8BCS2R5OW8RJjOWCGHjKW8XiUyhbPac1wNubiIE4PGn51wrEpQkhpc1KhBRPuupgm8=
X-Received: by 2002:ac8:4818:0:b0:3a6:a0d7:e1f7 with SMTP id
 g24-20020ac84818000000b003a6a0d7e1f7mr1779513qtq.153.1670010396808; Fri, 02
 Dec 2022 11:46:36 -0800 (PST)
MIME-Version: 1.0
References: <930778a1-5e8b-6df6-3276-42dcdadaf682@systemli.org>
 <18947e09733a17935af9a123ccf9b6e92faeaf9b.1669958641.git.viresh.kumar@linaro.org>
 <CAJZ5v0ixHocQbu6-zs3dMDsiw8vdPyv=8Re7N4kUckeGkLhUzg@mail.gmail.com>
In-Reply-To: <CAJZ5v0ixHocQbu6-zs3dMDsiw8vdPyv=8Re7N4kUckeGkLhUzg@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 2 Dec 2022 20:46:25 +0100
Message-ID: <CAJZ5v0hc8CsvqLKxi5iRq7iR0bkt25dRnLBd23mx-zdi2Sjgsw@mail.gmail.com>
Subject: Re: [PATCH] Revert "cpufreq: mediatek: Refine mtk_cpufreq_voltage_tracking()"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org, 
	Vincent Guittot <vincent.guittot@linaro.org>, regressions@leemhuis.info, 
	daniel@makrotopia.org, thomas.huehn@hs-nordhausen.de, 
	"v5 . 19+" <stable@vger.kernel.org>, Nick <vincent@systemli.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_114640_118884_63EF1282 
X-CRM114-Status: GOOD (  30.17  )
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

On Fri, Dec 2, 2022 at 1:17 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Fri, Dec 2, 2022 at 6:26 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > This reverts commit 6a17b3876bc8303612d7ad59ecf7cbc0db418bcd.
> >
> > This commit caused regression on Banana Pi R64 (MT7622), revert until
> > the problem is identified and fixed properly.
> >
> > Link: https://lore.kernel.org/all/930778a1-5e8b-6df6-3276-42dcdadaf682@systemli.org/
> > Cc: v5.19+ <stable@vger.kernel.org> # v5.19+
> > Reported-by: Nick <vincent@systemli.org>
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>
> Do you want me to push this revert for -rc8?

After all, I've decided to queue it up for 6.2, thanks!

> > ---
> >  drivers/cpufreq/mediatek-cpufreq.c | 147 +++++++++++++++++++----------
> >  1 file changed, 96 insertions(+), 51 deletions(-)
> >
> > diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> > index 7f2680bc9a0f..4466d0c91a6a 100644
> > --- a/drivers/cpufreq/mediatek-cpufreq.c
> > +++ b/drivers/cpufreq/mediatek-cpufreq.c
> > @@ -8,7 +8,6 @@
> >  #include <linux/cpu.h>
> >  #include <linux/cpufreq.h>
> >  #include <linux/cpumask.h>
> > -#include <linux/minmax.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >  #include <linux/of_platform.h>
> > @@ -16,6 +15,8 @@
> >  #include <linux/pm_opp.h>
> >  #include <linux/regulator/consumer.h>
> >
> > +#define VOLT_TOL               (10000)
> > +
> >  struct mtk_cpufreq_platform_data {
> >         int min_volt_shift;
> >         int max_volt_shift;
> > @@ -55,7 +56,6 @@ struct mtk_cpu_dvfs_info {
> >         unsigned int opp_cpu;
> >         unsigned long current_freq;
> >         const struct mtk_cpufreq_platform_data *soc_data;
> > -       int vtrack_max;
> >         bool ccifreq_bound;
> >  };
> >
> > @@ -82,7 +82,6 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
> >         struct regulator *proc_reg = info->proc_reg;
> >         struct regulator *sram_reg = info->sram_reg;
> >         int pre_vproc, pre_vsram, new_vsram, vsram, vproc, ret;
> > -       int retry = info->vtrack_max;
> >
> >         pre_vproc = regulator_get_voltage(proc_reg);
> >         if (pre_vproc < 0) {
> > @@ -90,44 +89,91 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
> >                         "invalid Vproc value: %d\n", pre_vproc);
> >                 return pre_vproc;
> >         }
> > +       /* Vsram should not exceed the maximum allowed voltage of SoC. */
> > +       new_vsram = min(new_vproc + soc_data->min_volt_shift,
> > +                       soc_data->sram_max_volt);
> > +
> > +       if (pre_vproc < new_vproc) {
> > +               /*
> > +                * When scaling up voltages, Vsram and Vproc scale up step
> > +                * by step. At each step, set Vsram to (Vproc + 200mV) first,
> > +                * then set Vproc to (Vsram - 100mV).
> > +                * Keep doing it until Vsram and Vproc hit target voltages.
> > +                */
> > +               do {
> > +                       pre_vsram = regulator_get_voltage(sram_reg);
> > +                       if (pre_vsram < 0) {
> > +                               dev_err(info->cpu_dev,
> > +                                       "invalid Vsram value: %d\n", pre_vsram);
> > +                               return pre_vsram;
> > +                       }
> > +                       pre_vproc = regulator_get_voltage(proc_reg);
> > +                       if (pre_vproc < 0) {
> > +                               dev_err(info->cpu_dev,
> > +                                       "invalid Vproc value: %d\n", pre_vproc);
> > +                               return pre_vproc;
> > +                       }
> >
> > -       pre_vsram = regulator_get_voltage(sram_reg);
> > -       if (pre_vsram < 0) {
> > -               dev_err(info->cpu_dev, "invalid Vsram value: %d\n", pre_vsram);
> > -               return pre_vsram;
> > -       }
> > +                       vsram = min(new_vsram,
> > +                                   pre_vproc + soc_data->min_volt_shift);
> >
> > -       new_vsram = clamp(new_vproc + soc_data->min_volt_shift,
> > -                         soc_data->sram_min_volt, soc_data->sram_max_volt);
> > +                       if (vsram + VOLT_TOL >= soc_data->sram_max_volt) {
> > +                               vsram = soc_data->sram_max_volt;
> >
> > -       do {
> > -               if (pre_vproc <= new_vproc) {
> > -                       vsram = clamp(pre_vproc + soc_data->max_volt_shift,
> > -                                     soc_data->sram_min_volt, new_vsram);
> > -                       ret = regulator_set_voltage(sram_reg, vsram,
> > -                                                   soc_data->sram_max_volt);
> > +                               /*
> > +                                * If the target Vsram hits the maximum voltage,
> > +                                * try to set the exact voltage value first.
> > +                                */
> > +                               ret = regulator_set_voltage(sram_reg, vsram,
> > +                                                           vsram);
> > +                               if (ret)
> > +                                       ret = regulator_set_voltage(sram_reg,
> > +                                                       vsram - VOLT_TOL,
> > +                                                       vsram);
> >
> > -                       if (ret)
> > -                               return ret;
> > -
> > -                       if (vsram == soc_data->sram_max_volt ||
> > -                           new_vsram == soc_data->sram_min_volt)
> >                                 vproc = new_vproc;
> > -                       else
> > +                       } else {
> > +                               ret = regulator_set_voltage(sram_reg, vsram,
> > +                                                           vsram + VOLT_TOL);
> > +
> >                                 vproc = vsram - soc_data->min_volt_shift;
> > +                       }
> > +                       if (ret)
> > +                               return ret;
> >
> >                         ret = regulator_set_voltage(proc_reg, vproc,
> > -                                                   soc_data->proc_max_volt);
> > +                                                   vproc + VOLT_TOL);
> >                         if (ret) {
> >                                 regulator_set_voltage(sram_reg, pre_vsram,
> > -                                                     soc_data->sram_max_volt);
> > +                                                     pre_vsram);
> >                                 return ret;
> >                         }
> > -               } else if (pre_vproc > new_vproc) {
> > +               } while (vproc < new_vproc || vsram < new_vsram);
> > +       } else if (pre_vproc > new_vproc) {
> > +               /*
> > +                * When scaling down voltages, Vsram and Vproc scale down step
> > +                * by step. At each step, set Vproc to (Vsram - 200mV) first,
> > +                * then set Vproc to (Vproc + 100mV).
> > +                * Keep doing it until Vsram and Vproc hit target voltages.
> > +                */
> > +               do {
> > +                       pre_vproc = regulator_get_voltage(proc_reg);
> > +                       if (pre_vproc < 0) {
> > +                               dev_err(info->cpu_dev,
> > +                                       "invalid Vproc value: %d\n", pre_vproc);
> > +                               return pre_vproc;
> > +                       }
> > +                       pre_vsram = regulator_get_voltage(sram_reg);
> > +                       if (pre_vsram < 0) {
> > +                               dev_err(info->cpu_dev,
> > +                                       "invalid Vsram value: %d\n", pre_vsram);
> > +                               return pre_vsram;
> > +                       }
> > +
> >                         vproc = max(new_vproc,
> >                                     pre_vsram - soc_data->max_volt_shift);
> >                         ret = regulator_set_voltage(proc_reg, vproc,
> > -                                                   soc_data->proc_max_volt);
> > +                                                   vproc + VOLT_TOL);
> >                         if (ret)
> >                                 return ret;
> >
> > @@ -137,24 +183,32 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
> >                                 vsram = max(new_vsram,
> >                                             vproc + soc_data->min_volt_shift);
> >
> > -                       ret = regulator_set_voltage(sram_reg, vsram,
> > -                                                   soc_data->sram_max_volt);
> > +                       if (vsram + VOLT_TOL >= soc_data->sram_max_volt) {
> > +                               vsram = soc_data->sram_max_volt;
> > +
> > +                               /*
> > +                                * If the target Vsram hits the maximum voltage,
> > +                                * try to set the exact voltage value first.
> > +                                */
> > +                               ret = regulator_set_voltage(sram_reg, vsram,
> > +                                                           vsram);
> > +                               if (ret)
> > +                                       ret = regulator_set_voltage(sram_reg,
> > +                                                       vsram - VOLT_TOL,
> > +                                                       vsram);
> > +                       } else {
> > +                               ret = regulator_set_voltage(sram_reg, vsram,
> > +                                                           vsram + VOLT_TOL);
> > +                       }
> > +
> >                         if (ret) {
> >                                 regulator_set_voltage(proc_reg, pre_vproc,
> > -                                                     soc_data->proc_max_volt);
> > +                                                     pre_vproc);
> >                                 return ret;
> >                         }
> > -               }
> > -
> > -               pre_vproc = vproc;
> > -               pre_vsram = vsram;
> > -
> > -               if (--retry < 0) {
> > -                       dev_err(info->cpu_dev,
> > -                               "over loop count, failed to set voltage\n");
> > -                       return -EINVAL;
> > -               }
> > -       } while (vproc != new_vproc || vsram != new_vsram);
> > +               } while (vproc > new_vproc + VOLT_TOL ||
> > +                        vsram > new_vsram + VOLT_TOL);
> > +       }
> >
> >         return 0;
> >  }
> > @@ -250,8 +304,8 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
> >          * If the new voltage or the intermediate voltage is higher than the
> >          * current voltage, scale up voltage first.
> >          */
> > -       target_vproc = max(inter_vproc, vproc);
> > -       if (pre_vproc <= target_vproc) {
> > +       target_vproc = (inter_vproc > vproc) ? inter_vproc : vproc;
> > +       if (pre_vproc < target_vproc) {
> >                 ret = mtk_cpufreq_set_voltage(info, target_vproc);
> >                 if (ret) {
> >                         dev_err(cpu_dev,
> > @@ -513,15 +567,6 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
> >          */
> >         info->need_voltage_tracking = (info->sram_reg != NULL);
> >
> > -       /*
> > -        * We assume min voltage is 0 and tracking target voltage using
> > -        * min_volt_shift for each iteration.
> > -        * The vtrack_max is 3 times of expeted iteration count.
> > -        */
> > -       info->vtrack_max = 3 * DIV_ROUND_UP(max(info->soc_data->sram_max_volt,
> > -                                               info->soc_data->proc_max_volt),
> > -                                           info->soc_data->min_volt_shift);
> > -
> >         return 0;
> >
> >  out_disable_inter_clock:
> > --

