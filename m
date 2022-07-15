Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40E5C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 17:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RV4CgMt4Uhdx+RPlbigIu5+LuSwk2m9JdabT6Izy3ss=; b=GqTV9n+LJdfnPftNx+afEQ7+T5
	XcMUlTZIfyFm34NKduxsuV/BHam6Pxu8U1MrpLAXnBfLietQ1bGHN6PVDDfY+zl3QO5a/iN8jOtzo
	Dl41uht1QvX7fiddOTVnabhWbnpS+vwunMPdmjoWy1K1fFx7w8Ge4+8zGp130WmakMeC7a6S6J6tC
	fwssFwhbXCUw9xtKu6RzMUm5FbkMuPCzElK0OV/Fs7BzQ1PMDhH6nJoTG1v5sCSqeRX/FCiz2StVg
	T2F34Sljh7MznneMNuv4yuHhES8w7IRANxwemlZSC135OiXK8Ah1QEus0zoAU1a+bZGeDQ/4DkVv6
	3PsHcEjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCOy9-0096XA-CH; Fri, 15 Jul 2022 17:19:13 +0000
Received: from mail-yw1-f176.google.com ([209.85.128.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCOy6-0096Ue-OE; Fri, 15 Jul 2022 17:19:12 +0000
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-31caffa4a45so53340327b3.3;
        Fri, 15 Jul 2022 10:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RV4CgMt4Uhdx+RPlbigIu5+LuSwk2m9JdabT6Izy3ss=;
        b=gbBZK2JykWBOD/KN8uEK572Oh4oSlIR6oohQxZ9JpqdRkCSl6cWuS9kPzZwlT3rDKM
         rmUb1JqW2WgiIzTGWzLKniwBJhLu5cnD6wzFqtz4JEUDozOM9p7gA2SXz/gTne0XsfiY
         R3ZpM7EiAxG2cTOZRUzUsoO91w2ZCnYksGKwDy3Pqt2jo5Bq2P/UiAqdVJoWp9w3Cqrq
         PtWf/M0XOA/ZJFB7GKxFrh5Ab6nK207IWmjEJsAIWTfCbj/7zNY6KX4BNFwb6dRsk+aB
         r8+7YHAb5W2z1uFy+cGVECksdnuXx9bBP4rEO/VkTylmksluE6mt6Sm3+L1W9ktkKOon
         IO/g==
X-Gm-Message-State: AJIora9GSrMFYptPzJrXvswQf9d8LpieIGhOdZ92KzXROV01RXChp3AE
	foCHYjTZI6xqyry7qbI+URM1dM5x85B4xZuyivA=
X-Google-Smtp-Source: AGRyM1taAq+iVG6nrCvqbpzS3ZVBPbzQldku4nRuJGDklibMRpmYSt09XTo2pnmCZnRhRQIuFgU+qvp3vDt6Vn3VASc=
X-Received: by 2002:a81:1b97:0:b0:2db:640f:49d8 with SMTP id
 b145-20020a811b97000000b002db640f49d8mr16470414ywb.326.1657905547640; Fri, 15
 Jul 2022 10:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220707071555.10085-1-lukasz.luba@arm.com> <41c333e1-2545-f6be-2db2-9061297d0b9a@arm.com>
 <c334d692-9787-7591-54d7-f152ecbd559e@arm.com>
In-Reply-To: <c334d692-9787-7591-54d7-f152ecbd559e@arm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 15 Jul 2022 19:18:56 +0200
Message-ID: <CAJZ5v0iKT5nK56PYjnXJP__TrZs0v0B5h+Zi1=3ZNKCOF=ByxA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Energy Model power in micro-Watts and SCMI v3.1 alignment
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Amit Kucheria <amitk@kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	"Zhang, Rui" <rui.zhang@intel.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_101910_808773_7F952F84 
X-CRM114-Status: GOOD (  22.54  )
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

On Fri, Jul 15, 2022 at 10:56 AM Lukasz Luba <lukasz.luba@arm.com> wrote:
>
> Hi Rafael,
>
> gentle ping.
>
> On 7/7/22 11:46, Lukasz Luba wrote:
> > Hi Rafael,
> >
> > On 7/7/22 08:15, Lukasz Luba wrote:
> >> Hi all,
> >>
> >> This is a patch set which changes Energy Model power values scale to
> >> micro-Watts. It also upgrades the SCMI performance layer + scmi-cpufreq
> >> driver to leverage the SCMI v3.1 spec and process micro-Watts power
> >> values
> >> coming from FW. The higher precision in EM power field solves an issue
> >> of a rounding error, which then can be misinterpreted as 'inefficient
> >> OPP'.
> >> An example rounding issue calculation is present in patch 1/4
> >> description.
> >>
> >> Changes:
> >> v2
> >> - simplified 32bit checks for max number of CPUs preventing energy
> >>    estimation overflow
> >> - added Reviewed-by and ACKs
> >> v1 [1]
> >>
> >> Regards,
> >> Lukasz Luba
> >>
> >> [1]
> >> https://lore.kernel.org/lkml/20220622145802.13032-1-lukasz.luba@arm.com/
> >>
> >> Lukasz Luba (4):
> >>    PM: EM: convert power field to micro-Watts precision and align drivers
> >>    Documentation: EM: Switch to micro-Watts scale
> >>    firmware: arm_scmi: Get detailed power scale from perf
> >>    cpufreq: scmi: Support the power scale in micro-Watts in SCMI v3.1
> >>
> >>   Documentation/power/energy-model.rst  | 14 +++----
> >>   drivers/cpufreq/mediatek-cpufreq-hw.c |  7 ++--
> >>   drivers/cpufreq/scmi-cpufreq.c        | 15 +++++++-
> >>   drivers/firmware/arm_scmi/perf.c      | 18 +++++----
> >>   drivers/opp/of.c                      | 15 ++++----
> >>   drivers/powercap/dtpm_cpu.c           |  5 +--
> >>   drivers/thermal/cpufreq_cooling.c     | 13 ++++++-
> >>   drivers/thermal/devfreq_cooling.c     | 19 ++++++++--
> >>   include/linux/energy_model.h          | 54 +++++++++++++++++++--------
> >>   include/linux/scmi_protocol.h         |  8 +++-
> >>   kernel/power/energy_model.c           | 24 ++++++++----
> >>   11 files changed, 132 insertions(+), 60 deletions(-)
> >>
> >
> > I got ACKs (and on Reviewed-by) for this patch set.
> > Could you take this via your PM tree, please?
>
> This patch set is on our roadmap and would be good if it could
> go as v5.20 material.
>
> There are Acks for these patch set. If you need some
> help with this (like rebasing, etc), just ping me.
>
> Could you take them, please?

All patches in the series applied as 5.20 material, thanks!

