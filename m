Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8250CC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 15:36:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E5EB25255
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 15:36:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hE4YVIsa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E5EB25255
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rjwysocki.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Tgy855MsgpZUxoocZO2X++9Y4XKMtfrpCXdDkrfCB6Q=; b=hE4YVIsakkL99qXi95J5iEqUW
	h0b7eyV3UsjO7go9LE2vjdWaYJZKpiBxWJ5lHNc32NhOPGivExoq/yQQR6Hu7VRgJKp++KAo1w7pt
	cq1DJraZ7GTsaAK5sbpMQApB47cUt5EnvsyDplj9kq+rsaIvAL5T6/KRDlw3qCJpO+t2A/7KdDnxr
	Yo4K8+8e3Pz6LDUO4g07nSqfq/g3IX1T4bzvozhqoUhX3psPSGZou96FBqoObleXYmdZch4dvEK+4
	W46iH9sNZ3g/JC8iedefPx+JVhHdtK5FFgd4YZaQcP4OMPuJ1bJNlUpujLzjeaHCvX6nKv8t5e3hR
	sURuv/rDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpvp5-0006dF-3E; Mon, 29 Jun 2020 15:35:55 +0000
Received: from cloudserver094114.home.pl ([79.96.170.134])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpvXO-0006OJ-Nu; Mon, 29 Jun 2020 15:17:39 +0000
Received: from 89-64-84-69.dynamic.chello.pl (89.64.84.69) (HELO
 kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.415)
 id 60876454d392fc4c; Mon, 29 Jun 2020 17:17:29 +0200
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Neal Liu <neal.liu@mediatek.com>
Subject: Re: [PATCH] cpuidle: change enter_s2idle() prototype
Date: Mon, 29 Jun 2020 17:17:28 +0200
Message-ID: <9963896.lEaLCsxmBZ@kreacher>
In-Reply-To: <1593421540-7397-2-git-send-email-neal.liu@mediatek.com>
References: <1593421540-7397-1-git-send-email-neal.liu@mediatek.com>
 <1593421540-7397-2-git-send-email-neal.liu@mediatek.com>
MIME-Version: 1.0
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
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>, linux-tegra@vger.kernel.org,
 wsd_upstream@mediatek.com, linux-pm@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-acpi@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Sami Tolvanen <samitolvanen@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Monday, June 29, 2020 11:05:40 AM CEST Neal Liu wrote:
> Control Flow Integrity(CFI) is a security mechanism that disallows
> changes to the original control flow graph of a compiled binary,
> making it significantly harder to perform such attacks.
> 
> init_state_node() assigns same function pointer to idle_state->enter
> and idle_state->enter_s2idle. This definitely causes CFI failure
> when calling either enter() or enter_s2idle().
> 
> Align enter_s2idle() with enter() function prototype to fix CFI
> failure.

That needs to be documented somewhere close to the definition of the
callbacks in question.

Otherwise it is completely unclear why this is a good idea.

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
>  	return index;
>  }
>  
> -static void acpi_idle_enter_s2idle(struct cpuidle_device *dev,
> -				   struct cpuidle_driver *drv, int index)
> +static int acpi_idle_enter_s2idle(struct cpuidle_device *dev,
> +				  struct cpuidle_driver *drv, int index)
>  {
>  	struct acpi_processor_cx *cx = per_cpu(acpi_cstate[index], dev->cpu);
>  
> @@ -674,6 +674,8 @@ static void acpi_idle_enter_s2idle(struct cpuidle_device *dev,
>  		}
>  	}
>  	acpi_idle_do_entry(cx);
> +
> +	return 0;
>  }
>  
>  static int acpi_processor_setup_cpuidle_cx(struct acpi_processor *pr,
> diff --git a/drivers/cpuidle/cpuidle-tegra.c b/drivers/cpuidle/cpuidle-tegra.c
> index 1500458..a12fb14 100644
> --- a/drivers/cpuidle/cpuidle-tegra.c
> +++ b/drivers/cpuidle/cpuidle-tegra.c
> @@ -253,11 +253,13 @@ static int tegra_cpuidle_enter(struct cpuidle_device *dev,
>  	return err ? -1 : index;
>  }
>  
> -static void tegra114_enter_s2idle(struct cpuidle_device *dev,
> -				  struct cpuidle_driver *drv,
> -				  int index)
> +static int tegra114_enter_s2idle(struct cpuidle_device *dev,
> +				 struct cpuidle_driver *drv,
> +				 int index)
>  {
>  	tegra_cpuidle_enter(dev, drv, index);
> +
> +	return 0;
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
> -					struct cpuidle_driver *drv, int index)
> +static __cpuidle int intel_idle_s2idle(struct cpuidle_device *dev,
> +				       struct cpuidle_driver *drv, int index)
>  {
>  	unsigned long eax = flg2MWAIT(drv->states[index].flags);
>  	unsigned long ecx = 1; /* break on interrupt flag */
>  
>  	mwait_idle_with_hints(eax, ecx);
> +
> +	return 0;
>  }
>  
>  /*
> diff --git a/include/linux/cpuidle.h b/include/linux/cpuidle.h
> index ec2ef63..bee10c0 100644
> --- a/include/linux/cpuidle.h
> +++ b/include/linux/cpuidle.h
> @@ -66,9 +66,9 @@ struct cpuidle_state {
>  	 * suspended, so it must not re-enable interrupts at any point (even
>  	 * temporarily) or attempt to change states of clock event devices.
>  	 */
> -	void (*enter_s2idle) (struct cpuidle_device *dev,
> -			      struct cpuidle_driver *drv,
> -			      int index);
> +	int (*enter_s2idle)(struct cpuidle_device *dev,
> +			    struct cpuidle_driver *drv,
> +			    int index);
>  };
>  
>  /* Idle State Flags */
> -- 
> 1.7.9.5
> 





_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
