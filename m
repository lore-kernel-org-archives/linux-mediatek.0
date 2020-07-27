Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5372C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 12:10:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B301B206E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 12:10:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u6rSviq/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B301B206E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gI+wO4io4fX8hSqexnX6D8O0xsyqZNPX4T2BeKT6BM8=; b=u6rSviq/Hi5mLPUPyiPN4jis/
	W6dz9NN+dZZHJGAWtXbQUMSlknV95hjebK9K+bJfe84xMVyX4mqtnTmH1zxbZhBP64xZ+qLkAWrPo
	kXx1E5Soh1NOZcJPtpgDhZ2RojPkF+g3sgNyhgJYAuLhCM7VBmjBj8/KkI54elG3AkQdTsdPSqBcm
	LaVyDu8sFCchW05uuCPN2jTFKCzuExrkh2dkiUGig3QBgq/iSb1746geQErN5NuuNYxa1C9hOjgMn
	QxqYQfKbX13IgVSSiN347uGNpatXx43hgU0MYKar9y2AFY74AUcV2CBt/WHjcFE0XQ1jIL7kRViuI
	s+W7P9onw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k01xO-0003HM-7S; Mon, 27 Jul 2020 12:10:14 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k01xJ-0003G5-2r; Mon, 27 Jul 2020 12:10:11 +0000
Received: by mail-oi1-f195.google.com with SMTP id l84so1565415oig.10;
 Mon, 27 Jul 2020 05:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MY8NFYemyusLitbLbaMoVSrE9YgFZMePGaF7pe3X/ig=;
 b=DC5oDgOMaqK6v2qwG7pWvsD7+3J0MuzMX9Dr9Pj0aluy8O99C0BQmfc1MD5PJcPWlx
 4idWQhc6srG/OyuYfB0QJSZqMGGdU5CTjvTaBSJuC2UbnkpKPKYqAkTtgKNJCXSuvOPU
 nE205QfMHqVF4nJzSS9nLYHUHuOtp1zvXzM8keW0/s9iuu+hE7UODZWbH9UZx6zhdGDw
 99ZfBX80NxM4DzkhJjhIZL2LlT5Q+GyIjua/PMorgvdGgCGW5cXQyzKKWIvoFKnc79s0
 WLfsuRegQfaE3vyBn49uUKFk1nDsa8YU9de7gzYaJsexYXD0Eq6Wah5fjUODzo6F/qR6
 yrUg==
X-Gm-Message-State: AOAM531pLJd/hVBjgH8MsymafW7gvGDYkQk/dGa0If5TiY2wrEZSnjgd
 Q1FiJVHa0Y2NWpRtaimI8pKd34o6srZuFDmWa3Y=
X-Google-Smtp-Source: ABdhPJx+eJ2XZmKmc1yyOWlaMremLljLAQsKfx87QRnMm2/D3J76CmRbkiallwCViQ1xjwchuuWJJxzfrCmDO0Cn0+U=
X-Received: by 2002:aca:4a89:: with SMTP id
 x131mr18642621oia.103.1595851808250; 
 Mon, 27 Jul 2020 05:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <1595820346-4361-1-git-send-email-neal.liu@mediatek.com>
 <1595820346-4361-2-git-send-email-neal.liu@mediatek.com>
In-Reply-To: <1595820346-4361-2-git-send-email-neal.liu@mediatek.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 27 Jul 2020 14:09:39 +0200
Message-ID: <CAJZ5v0ij3KxSyB_06+p0aYcy2pMex8HCmHD5R2B8V90UnynrWQ@mail.gmail.com>
Subject: Re: [PATCH v3] cpuidle: change enter_s2idle() prototype
To: Neal Liu <neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_081010_083717_AE239E81 
X-CRM114-Status: GOOD (  27.07  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>, Linux PM <linux-pm@vger.kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, lkml <linux-kernel@vger.kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jul 27, 2020 at 5:25 AM Neal Liu <neal.liu@mediatek.com> wrote:
>
> Control Flow Integrity(CFI) is a security mechanism that disallows
> changes to the original control flow graph of a compiled binary,
> making it significantly harder to perform such attacks.
>
> init_state_node() assign same function callback to different
> function pointer declarations.
>
> static int init_state_node(struct cpuidle_state *idle_state,
>                            const struct of_device_id *matches,
>                            struct device_node *state_node) { ...
>         idle_state->enter = match_id->data; ...
>         idle_state->enter_s2idle = match_id->data; }
>
> Function declarations:
>
> struct cpuidle_state { ...
>         int (*enter) (struct cpuidle_device *dev,
>                       struct cpuidle_driver *drv,
>                       int index);
>
>         void (*enter_s2idle) (struct cpuidle_device *dev,
>                               struct cpuidle_driver *drv,
>                               int index); };
>
> In this case, either enter() or enter_s2idle() would cause CFI check
> failed since they use same callee.
>
> Align function prototype of enter() since it needs return value for
> some use cases. The return value of enter_s2idle() is no
> need currently.
>
> Signed-off-by: Neal Liu <neal.liu@mediatek.com>
> Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  drivers/acpi/processor_idle.c   |    6 ++++--
>  drivers/cpuidle/cpuidle-tegra.c |    8 +++++---
>  drivers/idle/intel_idle.c       |    6 ++++--
>  include/linux/cpuidle.h         |    9 ++++++---
>  4 files changed, 19 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/acpi/processor_idle.c b/drivers/acpi/processor_idle.c
> index 75534c5..6ffb6c9 100644
> --- a/drivers/acpi/processor_idle.c
> +++ b/drivers/acpi/processor_idle.c
> @@ -655,8 +655,8 @@ static int acpi_idle_enter(struct cpuidle_device *dev,
>         return index;
>  }
>
> -static void acpi_idle_enter_s2idle(struct cpuidle_device *dev,
> -                                  struct cpuidle_driver *drv, int index)
> +static int acpi_idle_enter_s2idle(struct cpuidle_device *dev,
> +                                 struct cpuidle_driver *drv, int index)
>  {
>         struct acpi_processor_cx *cx = per_cpu(acpi_cstate[index], dev->cpu);
>
> @@ -674,6 +674,8 @@ static void acpi_idle_enter_s2idle(struct cpuidle_device *dev,
>                 }
>         }
>         acpi_idle_do_entry(cx);
> +
> +       return 0;
>  }
>
>  static int acpi_processor_setup_cpuidle_cx(struct acpi_processor *pr,
> diff --git a/drivers/cpuidle/cpuidle-tegra.c b/drivers/cpuidle/cpuidle-tegra.c
> index 1500458..a12fb14 100644
> --- a/drivers/cpuidle/cpuidle-tegra.c
> +++ b/drivers/cpuidle/cpuidle-tegra.c
> @@ -253,11 +253,13 @@ static int tegra_cpuidle_enter(struct cpuidle_device *dev,
>         return err ? -1 : index;
>  }
>
> -static void tegra114_enter_s2idle(struct cpuidle_device *dev,
> -                                 struct cpuidle_driver *drv,
> -                                 int index)
> +static int tegra114_enter_s2idle(struct cpuidle_device *dev,
> +                                struct cpuidle_driver *drv,
> +                                int index)
>  {
>         tegra_cpuidle_enter(dev, drv, index);
> +
> +       return 0;
>  }
>
>  /*
> diff --git a/drivers/idle/intel_idle.c b/drivers/idle/intel_idle.c
> index f449584..b178da3 100644
> --- a/drivers/idle/intel_idle.c
> +++ b/drivers/idle/intel_idle.c
> @@ -175,13 +175,15 @@ static __cpuidle int intel_idle(struct cpuidle_device *dev,
>   * Invoked as a suspend-to-idle callback routine with frozen user space, frozen
>   * scheduler tick and suspended scheduler clock on the target CPU.
>   */
> -static __cpuidle void intel_idle_s2idle(struct cpuidle_device *dev,
> -                                       struct cpuidle_driver *drv, int index)
> +static __cpuidle int intel_idle_s2idle(struct cpuidle_device *dev,
> +                                      struct cpuidle_driver *drv, int index)
>  {
>         unsigned long eax = flg2MWAIT(drv->states[index].flags);
>         unsigned long ecx = 1; /* break on interrupt flag */
>
>         mwait_idle_with_hints(eax, ecx);
> +
> +       return 0;
>  }
>
>  /*
> diff --git a/include/linux/cpuidle.h b/include/linux/cpuidle.h
> index ec2ef63..b65909a 100644
> --- a/include/linux/cpuidle.h
> +++ b/include/linux/cpuidle.h
> @@ -65,10 +65,13 @@ struct cpuidle_state {
>          * CPUs execute ->enter_s2idle with the local tick or entire timekeeping
>          * suspended, so it must not re-enable interrupts at any point (even
>          * temporarily) or attempt to change states of clock event devices.
> +        *
> +        * This callback may point to the same function as ->enter if all of
> +        * the above requirements are met by it.
>          */
> -       void (*enter_s2idle) (struct cpuidle_device *dev,
> -                             struct cpuidle_driver *drv,
> -                             int index);
> +       int (*enter_s2idle)(struct cpuidle_device *dev,
> +                           struct cpuidle_driver *drv,
> +                           int index);
>  };
>
>  /* Idle State Flags */
> --

Applied as 5.9 material, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
