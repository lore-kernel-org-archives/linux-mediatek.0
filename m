Return-Path: <SRS0=mu4u=HG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E09ACC43381
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 18:25:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E42E64F45
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 18:25:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E42E64F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tsyQzxRuzG9fybIRn9uwq1HMzLDvCra+09iLMmWnsjc=; b=uxAS+dhV+elxokz0dmMGbtKAM
	/NVtHIRjCDn3Bs210yEXp7R9OR/2dDdbIO4wQNh4/MaQCOr3SwD2+XtAachzQtCagPX1LwS9QkHB8
	9ibkpFbJcbSlu+P4Y+Hqs+tMQksg0yB3lbhmgQFVdvtPzZPMUPDXi+7DQT+V8qilwEMGa00x4MUbP
	HOXm/C9JgmP7/6vjH6mdFYUoNksor8ENAZfeiYXpH0Yrt7AZkBPcW4uPGL9vBlT2untgJR4w/2D9i
	uA5Z/3H6d4LHV8/lX+xYwriH1ENuuv4ovUP9CHn2/eBR3dUgPS9qLbuoWSv2PXi0SOVqE1lscPRRo
	YCptgAZlQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7jJb-00019L-QE; Thu, 04 Feb 2021 18:25:15 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7jJW-00017q-NS; Thu, 04 Feb 2021 18:25:12 +0000
Received: by mail-oi1-f171.google.com with SMTP id d20so4674942oiw.10;
 Thu, 04 Feb 2021 10:25:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d6oB2Qztkl9BjXQQwp+NfZoVpfQbcBRjYcgQR7uzhog=;
 b=muyCDCIUfiOHGvt0TSFkMNPRJR3ksyUD3+4gAQnIbIGDtBw9jF5Yans6byy3W4AxuN
 WFtggHoOb9gSUBnGI6N+aSrJj0S62Mwmow9h2zOHfRQGyyKLL5/RWz43fkPPGLaqS6Aa
 bKNijHmYqkh9JGtHfk+5W+/K7BP4uqaITDWVtGhW6qt+fG/GM177xyENTkcwvhPkSOGl
 gl4YWsRdLl4gehs/E6/Yzs74ovSKyIDvzL4oBn29BMUSyjnGVx7QxynJMA2dStFLnwLn
 IuJc16Jd4X9MPO2PfKRwMtki4/lDOSSBSpLG5YYk1PRIXR5W4P5j1YnBYpsfeb6FqfhI
 i5LQ==
X-Gm-Message-State: AOAM533ABDdfKYdcp4xZ/zdfLG3+4PWan/P7R/BWFiB67JwxfXV/NHSQ
 aO5qHxyONr+YE8FVOxcmVM7yyPlEHGf2HPqe//s=
X-Google-Smtp-Source: ABdhPJypGvruuxvO0IhKSdvcaOwbvYYe5k/w3NQpfqbI3XpWJtBWvgmPngTkneREdGlompVqeL5CkhOTc9LTqjKVdLM=
X-Received: by 2002:aca:d14:: with SMTP id 20mr543094oin.157.1612463109784;
 Thu, 04 Feb 2021 10:25:09 -0800 (PST)
MIME-Version: 1.0
References: <a59bb322b22c247d570b70a8e94067804287623b.1612241683.git.viresh.kumar@linaro.org>
In-Reply-To: <a59bb322b22c247d570b70a8e94067804287623b.1612241683.git.viresh.kumar@linaro.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 4 Feb 2021 19:24:58 +0100
Message-ID: <CAJZ5v0jN7n5no1if61hZxb9-Fvv9LRkoYpU9-GgiFQhUV1Cm3w@mail.gmail.com>
Subject: Re: [PATCH V2] cpufreq: Remove CPUFREQ_STICKY flag
To: Viresh Kumar <viresh.kumar@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_132510_807893_43F5ABF0 
X-CRM114-Status: GOOD (  27.12  )
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
Cc: Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>,
 linux-mips@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, Rafael Wysocki <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>,
 Andy Gross <agross@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Keguang Zhang <keguang.zhang@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Feb 2, 2021 at 5:56 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> During cpufreq driver's registration, if the ->init() callback for all
> the CPUs fail then there is not much point in keeping the driver around
> as it will only account for more of unnecessary noise, for example
> cpufreq core will try to suspend/resume the driver which never got
> registered properly.
>
> The removal of such a driver is avoided if the driver carries the
> CPUFREQ_STICKY flag. This was added way back [1] in 2004 and perhaps no
> one should ever need it now. A lot of drivers do set this flag, probably
> because they just copied it from other drivers.
>
> This was added earlier for some platforms [2] because their cpufreq
> drivers were getting registered before the CPUs were registered with
> subsys framework. And hence they used to fail.
>
> The same isn't true anymore though. The current code flow in the kernel
> is:
>
> start_kernel()
> -> kernel_init()
>    -> kernel_init_freeable()
>       -> do_basic_setup()
>          -> driver_init()
>             -> cpu_dev_init()
>                -> subsys_system_register() //For CPUs
>
>          -> do_initcalls()
>             -> cpufreq_register_driver()
>
> Clearly, the CPUs will always get registered with subsys framework
> before any cpufreq driver can get probed. Remove the flag and update the
> relevant drivers.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/commit/include/linux/cpufreq.h?id=7cc9f0d9a1ab04cedc60d64fd8dcf7df224a3b4d
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/commit/arch/arm/mach-sa1100/cpu-sa1100.c?id=f59d3bbe35f6268d729f51be82af8325d62f20f5
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Applied as 5.12 material, thanks!

> ---
> V2: Detailed commit log.
>
>  drivers/cpufreq/cpufreq-dt.c           |  2 +-
>  drivers/cpufreq/cpufreq.c              |  3 +--
>  drivers/cpufreq/davinci-cpufreq.c      |  2 +-
>  drivers/cpufreq/loongson1-cpufreq.c    |  2 +-
>  drivers/cpufreq/mediatek-cpufreq.c     |  2 +-
>  drivers/cpufreq/omap-cpufreq.c         |  2 +-
>  drivers/cpufreq/qcom-cpufreq-hw.c      |  2 +-
>  drivers/cpufreq/s3c24xx-cpufreq.c      |  2 +-
>  drivers/cpufreq/s5pv210-cpufreq.c      |  2 +-
>  drivers/cpufreq/sa1100-cpufreq.c       |  2 +-
>  drivers/cpufreq/sa1110-cpufreq.c       |  2 +-
>  drivers/cpufreq/scmi-cpufreq.c         |  2 +-
>  drivers/cpufreq/scpi-cpufreq.c         |  2 +-
>  drivers/cpufreq/spear-cpufreq.c        |  2 +-
>  drivers/cpufreq/tegra186-cpufreq.c     |  2 +-
>  drivers/cpufreq/tegra194-cpufreq.c     |  3 +--
>  drivers/cpufreq/vexpress-spc-cpufreq.c |  3 +--
>  include/linux/cpufreq.h                | 17 +++++++----------
>  18 files changed, 24 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/cpufreq/cpufreq-dt.c b/drivers/cpufreq/cpufreq-dt.c
> index ad4234518ef6..b1e1bdc63b01 100644
> --- a/drivers/cpufreq/cpufreq-dt.c
> +++ b/drivers/cpufreq/cpufreq-dt.c
> @@ -175,7 +175,7 @@ static int cpufreq_exit(struct cpufreq_policy *policy)
>  }
>
>  static struct cpufreq_driver dt_cpufreq_driver = {
> -       .flags = CPUFREQ_STICKY | CPUFREQ_NEED_INITIAL_FREQ_CHECK |
> +       .flags = CPUFREQ_NEED_INITIAL_FREQ_CHECK |
>                  CPUFREQ_IS_COOLING_DEV,
>         .verify = cpufreq_generic_frequency_table_verify,
>         .target_index = set_target,
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index d0a3525ce27f..7d0ae968def7 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -2810,8 +2810,7 @@ int cpufreq_register_driver(struct cpufreq_driver *driver_data)
>         if (ret)
>                 goto err_boost_unreg;
>
> -       if (!(cpufreq_driver->flags & CPUFREQ_STICKY) &&
> -           list_empty(&cpufreq_policy_list)) {
> +       if (unlikely(list_empty(&cpufreq_policy_list))) {
>                 /* if all ->init() calls failed, unregister */
>                 ret = -ENODEV;
>                 pr_debug("%s: No CPU initialized for driver %s\n", __func__,
> diff --git a/drivers/cpufreq/davinci-cpufreq.c b/drivers/cpufreq/davinci-cpufreq.c
> index 91f477a6cbc4..9e97f60f8199 100644
> --- a/drivers/cpufreq/davinci-cpufreq.c
> +++ b/drivers/cpufreq/davinci-cpufreq.c
> @@ -95,7 +95,7 @@ static int davinci_cpu_init(struct cpufreq_policy *policy)
>  }
>
>  static struct cpufreq_driver davinci_driver = {
> -       .flags          = CPUFREQ_STICKY | CPUFREQ_NEED_INITIAL_FREQ_CHECK,
> +       .flags          = CPUFREQ_NEED_INITIAL_FREQ_CHECK,
>         .verify         = cpufreq_generic_frequency_table_verify,
>         .target_index   = davinci_target,
>         .get            = cpufreq_generic_get,
> diff --git a/drivers/cpufreq/loongson1-cpufreq.c b/drivers/cpufreq/loongson1-cpufreq.c
> index 86f612593e49..fb72d709db56 100644
> --- a/drivers/cpufreq/loongson1-cpufreq.c
> +++ b/drivers/cpufreq/loongson1-cpufreq.c
> @@ -116,7 +116,7 @@ static int ls1x_cpufreq_exit(struct cpufreq_policy *policy)
>
>  static struct cpufreq_driver ls1x_cpufreq_driver = {
>         .name           = "cpufreq-ls1x",
> -       .flags          = CPUFREQ_STICKY | CPUFREQ_NEED_INITIAL_FREQ_CHECK,
> +       .flags          = CPUFREQ_NEED_INITIAL_FREQ_CHECK,
>         .verify         = cpufreq_generic_frequency_table_verify,
>         .target_index   = ls1x_cpufreq_target,
>         .get            = cpufreq_generic_get,
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index 022e3e966e71..f2e491b25b07 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -463,7 +463,7 @@ static int mtk_cpufreq_exit(struct cpufreq_policy *policy)
>  }
>
>  static struct cpufreq_driver mtk_cpufreq_driver = {
> -       .flags = CPUFREQ_STICKY | CPUFREQ_NEED_INITIAL_FREQ_CHECK |
> +       .flags = CPUFREQ_NEED_INITIAL_FREQ_CHECK |
>                  CPUFREQ_HAVE_GOVERNOR_PER_POLICY |
>                  CPUFREQ_IS_COOLING_DEV,
>         .verify = cpufreq_generic_frequency_table_verify,
> diff --git a/drivers/cpufreq/omap-cpufreq.c b/drivers/cpufreq/omap-cpufreq.c
> index 3694bb030df3..e035ee216b0f 100644
> --- a/drivers/cpufreq/omap-cpufreq.c
> +++ b/drivers/cpufreq/omap-cpufreq.c
> @@ -144,7 +144,7 @@ static int omap_cpu_exit(struct cpufreq_policy *policy)
>  }
>
>  static struct cpufreq_driver omap_driver = {
> -       .flags          = CPUFREQ_STICKY | CPUFREQ_NEED_INITIAL_FREQ_CHECK,
> +       .flags          = CPUFREQ_NEED_INITIAL_FREQ_CHECK,
>         .verify         = cpufreq_generic_frequency_table_verify,
>         .target_index   = omap_target,
>         .get            = cpufreq_generic_get,
> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
> index 9ed5341dc515..2a3b4f44488b 100644
> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> @@ -374,7 +374,7 @@ static struct freq_attr *qcom_cpufreq_hw_attr[] = {
>  };
>
>  static struct cpufreq_driver cpufreq_qcom_hw_driver = {
> -       .flags          = CPUFREQ_STICKY | CPUFREQ_NEED_INITIAL_FREQ_CHECK |
> +       .flags          = CPUFREQ_NEED_INITIAL_FREQ_CHECK |
>                           CPUFREQ_HAVE_GOVERNOR_PER_POLICY |
>                           CPUFREQ_IS_COOLING_DEV,
>         .verify         = cpufreq_generic_frequency_table_verify,
> diff --git a/drivers/cpufreq/s3c24xx-cpufreq.c b/drivers/cpufreq/s3c24xx-cpufreq.c
> index 37efc0dc3f91..7380c32b238e 100644
> --- a/drivers/cpufreq/s3c24xx-cpufreq.c
> +++ b/drivers/cpufreq/s3c24xx-cpufreq.c
> @@ -420,7 +420,7 @@ static int s3c_cpufreq_resume(struct cpufreq_policy *policy)
>  #endif
>
>  static struct cpufreq_driver s3c24xx_driver = {
> -       .flags          = CPUFREQ_STICKY | CPUFREQ_NEED_INITIAL_FREQ_CHECK,
> +       .flags          = CPUFREQ_NEED_INITIAL_FREQ_CHECK,
>         .target         = s3c_cpufreq_target,
>         .get            = cpufreq_generic_get,
>         .init           = s3c_cpufreq_init,
> diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
> index bed496cf8d24..69786e5bbf05 100644
> --- a/drivers/cpufreq/s5pv210-cpufreq.c
> +++ b/drivers/cpufreq/s5pv210-cpufreq.c
> @@ -574,7 +574,7 @@ static int s5pv210_cpufreq_reboot_notifier_event(struct notifier_block *this,
>  }
>
>  static struct cpufreq_driver s5pv210_driver = {
> -       .flags          = CPUFREQ_STICKY | CPUFREQ_NEED_INITIAL_FREQ_CHECK,
> +       .flags          = CPUFREQ_NEED_INITIAL_FREQ_CHECK,
>         .verify         = cpufreq_generic_frequency_table_verify,
>         .target_index   = s5pv210_target,
>         .get            = cpufreq_generic_get,
> diff --git a/drivers/cpufreq/sa1100-cpufreq.c b/drivers/cpufreq/sa1100-cpufreq.c
> index 5c075ef6adc0..252b9fc26124 100644
> --- a/drivers/cpufreq/sa1100-cpufreq.c
> +++ b/drivers/cpufreq/sa1100-cpufreq.c
> @@ -186,7 +186,7 @@ static int __init sa1100_cpu_init(struct cpufreq_policy *policy)
>  }
>
>  static struct cpufreq_driver sa1100_driver __refdata = {
> -       .flags          = CPUFREQ_STICKY | CPUFREQ_NEED_INITIAL_FREQ_CHECK |
> +       .flags          = CPUFREQ_NEED_INITIAL_FREQ_CHECK |
>                           CPUFREQ_NO_AUTO_DYNAMIC_SWITCHING,
>         .verify         = cpufreq_generic_frequency_table_verify,
>         .target_index   = sa1100_target,
> diff --git a/drivers/cpufreq/sa1110-cpufreq.c b/drivers/cpufreq/sa1110-cpufreq.c
> index d9d04d935b3a..1a83c8678a63 100644
> --- a/drivers/cpufreq/sa1110-cpufreq.c
> +++ b/drivers/cpufreq/sa1110-cpufreq.c
> @@ -310,7 +310,7 @@ static int __init sa1110_cpu_init(struct cpufreq_policy *policy)
>  /* sa1110_driver needs __refdata because it must remain after init registers
>   * it with cpufreq_register_driver() */
>  static struct cpufreq_driver sa1110_driver __refdata = {
> -       .flags          = CPUFREQ_STICKY | CPUFREQ_NEED_INITIAL_FREQ_CHECK |
> +       .flags          = CPUFREQ_NEED_INITIAL_FREQ_CHECK |
>                           CPUFREQ_NO_AUTO_DYNAMIC_SWITCHING,
>         .verify         = cpufreq_generic_frequency_table_verify,
>         .target_index   = sa1110_target,
> diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
> index 491a0a24fb1e..5bd03b59887f 100644
> --- a/drivers/cpufreq/scmi-cpufreq.c
> +++ b/drivers/cpufreq/scmi-cpufreq.c
> @@ -217,7 +217,7 @@ static int scmi_cpufreq_exit(struct cpufreq_policy *policy)
>
>  static struct cpufreq_driver scmi_cpufreq_driver = {
>         .name   = "scmi",
> -       .flags  = CPUFREQ_STICKY | CPUFREQ_HAVE_GOVERNOR_PER_POLICY |
> +       .flags  = CPUFREQ_HAVE_GOVERNOR_PER_POLICY |
>                   CPUFREQ_NEED_INITIAL_FREQ_CHECK |
>                   CPUFREQ_IS_COOLING_DEV,
>         .verify = cpufreq_generic_frequency_table_verify,
> diff --git a/drivers/cpufreq/scpi-cpufreq.c b/drivers/cpufreq/scpi-cpufreq.c
> index e5140ad63db8..d6a698a1b5d1 100644
> --- a/drivers/cpufreq/scpi-cpufreq.c
> +++ b/drivers/cpufreq/scpi-cpufreq.c
> @@ -191,7 +191,7 @@ static int scpi_cpufreq_exit(struct cpufreq_policy *policy)
>
>  static struct cpufreq_driver scpi_cpufreq_driver = {
>         .name   = "scpi-cpufreq",
> -       .flags  = CPUFREQ_STICKY | CPUFREQ_HAVE_GOVERNOR_PER_POLICY |
> +       .flags  = CPUFREQ_HAVE_GOVERNOR_PER_POLICY |
>                   CPUFREQ_NEED_INITIAL_FREQ_CHECK |
>                   CPUFREQ_IS_COOLING_DEV,
>         .verify = cpufreq_generic_frequency_table_verify,
> diff --git a/drivers/cpufreq/spear-cpufreq.c b/drivers/cpufreq/spear-cpufreq.c
> index 73bd8dc47074..7d0d62a06bf3 100644
> --- a/drivers/cpufreq/spear-cpufreq.c
> +++ b/drivers/cpufreq/spear-cpufreq.c
> @@ -160,7 +160,7 @@ static int spear_cpufreq_init(struct cpufreq_policy *policy)
>
>  static struct cpufreq_driver spear_cpufreq_driver = {
>         .name           = "cpufreq-spear",
> -       .flags          = CPUFREQ_STICKY | CPUFREQ_NEED_INITIAL_FREQ_CHECK,
> +       .flags          = CPUFREQ_NEED_INITIAL_FREQ_CHECK,
>         .verify         = cpufreq_generic_frequency_table_verify,
>         .target_index   = spear_cpufreq_target,
>         .get            = cpufreq_generic_get,
> diff --git a/drivers/cpufreq/tegra186-cpufreq.c b/drivers/cpufreq/tegra186-cpufreq.c
> index e566ea298b59..5d1943e787b0 100644
> --- a/drivers/cpufreq/tegra186-cpufreq.c
> +++ b/drivers/cpufreq/tegra186-cpufreq.c
> @@ -117,7 +117,7 @@ static unsigned int tegra186_cpufreq_get(unsigned int cpu)
>
>  static struct cpufreq_driver tegra186_cpufreq_driver = {
>         .name = "tegra186",
> -       .flags = CPUFREQ_STICKY | CPUFREQ_HAVE_GOVERNOR_PER_POLICY |
> +       .flags = CPUFREQ_HAVE_GOVERNOR_PER_POLICY |
>                         CPUFREQ_NEED_INITIAL_FREQ_CHECK,
>         .get = tegra186_cpufreq_get,
>         .verify = cpufreq_generic_frequency_table_verify,
> diff --git a/drivers/cpufreq/tegra194-cpufreq.c b/drivers/cpufreq/tegra194-cpufreq.c
> index 6a67f36f3b80..a9620e4489ae 100644
> --- a/drivers/cpufreq/tegra194-cpufreq.c
> +++ b/drivers/cpufreq/tegra194-cpufreq.c
> @@ -272,8 +272,7 @@ static int tegra194_cpufreq_set_target(struct cpufreq_policy *policy,
>
>  static struct cpufreq_driver tegra194_cpufreq_driver = {
>         .name = "tegra194",
> -       .flags = CPUFREQ_STICKY | CPUFREQ_CONST_LOOPS |
> -               CPUFREQ_NEED_INITIAL_FREQ_CHECK,
> +       .flags = CPUFREQ_CONST_LOOPS | CPUFREQ_NEED_INITIAL_FREQ_CHECK,
>         .verify = cpufreq_generic_frequency_table_verify,
>         .target_index = tegra194_cpufreq_set_target,
>         .get = tegra194_get_speed,
> diff --git a/drivers/cpufreq/vexpress-spc-cpufreq.c b/drivers/cpufreq/vexpress-spc-cpufreq.c
> index f711d8eaea6a..51dfa9ae6cf5 100644
> --- a/drivers/cpufreq/vexpress-spc-cpufreq.c
> +++ b/drivers/cpufreq/vexpress-spc-cpufreq.c
> @@ -486,8 +486,7 @@ static void ve_spc_cpufreq_ready(struct cpufreq_policy *policy)
>
>  static struct cpufreq_driver ve_spc_cpufreq_driver = {
>         .name                   = "vexpress-spc",
> -       .flags                  = CPUFREQ_STICKY |
> -                                       CPUFREQ_HAVE_GOVERNOR_PER_POLICY |
> +       .flags                  = CPUFREQ_HAVE_GOVERNOR_PER_POLICY |
>                                         CPUFREQ_NEED_INITIAL_FREQ_CHECK,
>         .verify                 = cpufreq_generic_frequency_table_verify,
>         .target_index           = ve_spc_cpufreq_set_target,
> diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> index 9c8b7437b6cd..c8e40e91fe9b 100644
> --- a/include/linux/cpufreq.h
> +++ b/include/linux/cpufreq.h
> @@ -387,8 +387,13 @@ struct cpufreq_driver {
>
>  /* flags */
>
> -/* driver isn't removed even if all ->init() calls failed */
> -#define CPUFREQ_STICKY                         BIT(0)
> +/*
> + * Set by drivers that need to update internale upper and lower boundaries along
> + * with the target frequency and so the core and governors should also invoke
> + * the diver if the target frequency does not change, but the policy min or max
> + * may have changed.
> + */
> +#define CPUFREQ_NEED_UPDATE_LIMITS             BIT(0)
>
>  /* loops_per_jiffy or other kernel "constants" aren't affected by frequency transitions */
>  #define CPUFREQ_CONST_LOOPS                    BIT(1)
> @@ -432,14 +437,6 @@ struct cpufreq_driver {
>   */
>  #define CPUFREQ_IS_COOLING_DEV                 BIT(7)
>
> -/*
> - * Set by drivers that need to update internale upper and lower boundaries along
> - * with the target frequency and so the core and governors should also invoke
> - * the diver if the target frequency does not change, but the policy min or max
> - * may have changed.
> - */
> -#define CPUFREQ_NEED_UPDATE_LIMITS             BIT(8)
> -
>  int cpufreq_register_driver(struct cpufreq_driver *driver_data);
>  int cpufreq_unregister_driver(struct cpufreq_driver *driver_data);
>
> --
> 2.25.0.rc1.19.g042ed3e048af
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
