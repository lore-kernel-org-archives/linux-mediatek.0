Return-Path: <SRS0=UXZI=AU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A7DC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 12:18:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5398F2074B
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 12:18:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j+sDhdc1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5398F2074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6TcReIEuOapGPjn+EcV5CglqOvHuyWqikSKqbiVWOck=; b=j+sDhdc1nGE7XOb8os0M2vttG
	vyHp0FpG0fKzIPupbB2276HsxXwXacikvlRhXF5lvKo5uMSEU99HFxtDeSJf1Rf3lhi3vzZ4krBRF
	m1H6r0pJjZZDdpOJjVD2JTHaT33DndR++HoON6C86ZbuIAJueOUhS0/L+VPcBwkaHb03teK7n8Ydz
	WYKQ40z64JC356hSHQ9aXC689lpxrGozvMORc4dvrNmd9chUkHumuqfG3dHfTVrGmXP3njcTp0QkJ
	sKrpWnXt9WY9/leRR7Y5uoPupCAV4svHiqnaW0O8DeV23eklIM2U4sG92KOksNFAQObdH7dHOW99P
	g8QgCUjHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtVVU-00043e-Ky; Thu, 09 Jul 2020 12:18:29 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtVVR-00042r-Ab; Thu, 09 Jul 2020 12:18:26 +0000
Received: by mail-oi1-f194.google.com with SMTP id h17so1708827oie.3;
 Thu, 09 Jul 2020 05:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BHVNxL+/4Dut3OSZTR+rYs7XqFLN3i0nnfmN8u7+xOA=;
 b=aGjJc0a+/tDSItOIbfrh9d7w5GpqMWXm89DNkSSAFCNM/CRwFoLisOKwWWU25cPJ86
 nuJOAfN7u06ciN+bwHwO1s/8k17drDjXHHpSEU1qwGiWFUBlAtX6O5lsiej96XmW051i
 G0QSIQvsRfpYaSDxRYlRlb1P4I+L6+VEolhJ3xfG6Hltl71AwYLtG511i5DfMNxeNwoN
 LH4MxHHfd/2azMP6yIFxnGmLxYBx4cPOQL5a3v8p4Va4cQqH7IwB5O2JTVcdtDHFu7Ct
 wlgWd0MkwFrocJuzhaAq8QDZQMUun3eF9TGtH5UAkh1X8jopk0E1zgkOOzvI6Myj9VcN
 DGpA==
X-Gm-Message-State: AOAM533Y0uvlAhgbbHKXt9M7OBB38EDQEM6Lsyp5wlc2sdlkZ4PVq0iW
 pIzlticPc7Ji6p1TddSsObJWY9RbpqeaTrsgP5c=
X-Google-Smtp-Source: ABdhPJxtj1vjB44EgNVrKbINxMf3MLBQQVOimbtqX57PoimFmHD9A3C9Fv4wq87LSAfsDKch7XlhTuenX5e7j0W2xjI=
X-Received: by 2002:aca:4a89:: with SMTP id
 x131mr11420648oia.103.1594297104569; 
 Thu, 09 Jul 2020 05:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <1594005196-16327-1-git-send-email-neal.liu@mediatek.com>
 <1594005196-16327-2-git-send-email-neal.liu@mediatek.com>
In-Reply-To: <1594005196-16327-2-git-send-email-neal.liu@mediatek.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 9 Jul 2020 14:18:13 +0200
Message-ID: <CAJZ5v0ihB5AJwSRpjaOnXAmciregzxARL5xfudu1h+=_LXaE_w@mail.gmail.com>
Subject: Re: [PATCH v2] cpuidle: change enter_s2idle() prototype
To: Neal Liu <neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_081825_402353_8BF46C6C 
X-CRM114-Status: GOOD (  24.60  )
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
 linux-tegra <linux-tegra@vger.kernel.org>, wsd_upstream@mediatek.com,
 Linux PM <linux-pm@vger.kernel.org>,
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

On Mon, Jul 6, 2020 at 5:13 AM Neal Liu <neal.liu@mediatek.com> wrote:
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

Can you please explain this in a bit more detail?

As it stands, I don't understand the problem statement enough to apply
the patch.

> Align function prototype of enter() since it needs return value for
> some use cases. The return value of enter_s2idle() is no
> need currently.

So last time I requested you to document why ->enter_s2idle needs to
return an int in the code, which has not been done.  Please do that.

> Signed-off-by: Neal Liu <neal.liu@mediatek.com>
> ---
>  drivers/acpi/processor_idle.c   |    6 ++++--
>  drivers/cpuidle/cpuidle-tegra.c |    8 +++++---
>  drivers/idle/intel_idle.c       |    6 ++++--
>  include/linux/cpuidle.h         |    6 +++---
>  4 files changed, 16 insertions(+), 10 deletions(-)
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
> index ec2ef63..bee10c0 100644
> --- a/include/linux/cpuidle.h
> +++ b/include/linux/cpuidle.h
> @@ -66,9 +66,9 @@ struct cpuidle_state {
>          * suspended, so it must not re-enable interrupts at any point (even
>          * temporarily) or attempt to change states of clock event devices.
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
> 1.7.9.5

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
