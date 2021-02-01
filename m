Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E51FC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 14:02:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33E9B64EA2
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 14:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33E9B64EA2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JcCjdTdYBQ8g87xrCzSNfesYgDjjYnvwEp/41ElDXqQ=; b=xmgze78wv3vu/2VPU1opiqIEg
	97bjSDuhoGFd+ceK1/g47KrjiRDf5VE40pZW6pkF3at6YhGLLmE6WKgtszmXo/xL88lWKmil9IrCy
	MuvnzwnFCw5cys1vM1xffok2wOnL/f3sO9DlIj3oZ0DlQLwFnBXNqJQHJDm8JrEYLkhvsQlHPkcGQ
	qdTn6XejkPD8sV0njC1lShJTUZjZdq821B9dYvNWpVdxNOI4cxin6Dxt7j8rzBSjc+vn+UerjFg+c
	PFzwlmN2TFFc4nGqabDkHHYgP7b2oOxIiSvEEUv7pfOKPy0R0M7gwHUBvxgiR1d4Q5Pen+vJ44E5P
	9ll299+Vg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6Zma-0003qM-BM; Mon, 01 Feb 2021 14:02:24 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6ZmW-0003ou-9J; Mon, 01 Feb 2021 14:02:21 +0000
Received: by mail-oi1-f174.google.com with SMTP id k25so18840317oik.13;
 Mon, 01 Feb 2021 06:02:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PjQ2aAipDSaq5oC4lmBya+0Rk1klXjpSSVN7GA5y3Ng=;
 b=ftkzc4L/WNGU4Fp90MRDviIzuE0yVpnrGptaTsX9AP6OMcHb3jToAS0uPfcHlioxgm
 eySRc7xF0mLVkqC9szF4ftFld6UNqvKWbu8fS1FvCVTvHlrNuvo9LVtt/vdQiiwYOj5t
 vvCgtlW7lt59RHIGBVzOIsvZz0OnoRuiUf33S3P/FuoUQ/NkFFSaLzVh68UkiQUY56DX
 rONiAb3Ufwwl6Camhslj/HcsFtnB2KxXuuz54vRpxum2mv6IC+0TSWtoSos3KbOa7/gD
 qpDnILLRsCIXseF6k3jF3tV3bSM8uJ0aG0R9JoGRrqw6oazMlsYPZPpjJoPfwiA9OuWY
 8bug==
X-Gm-Message-State: AOAM5333nxILkUsy2fLzqK2jhBotJJcvtI+wbZvMY3KMNxRtsnGZfbSC
 8xYqFJh0DOpQqL/M3VaWyJugYmpY+OyJiPVAg6s=
X-Google-Smtp-Source: ABdhPJw1DQOtXQiOfLob/rMGpYwphh6HqBDyeQVpm2HarfCzjirlfFQpNkL8KnEPZ6WvYaJWPQuOJUtbJQHKhwp2iUI=
X-Received: by 2002:aca:fc84:: with SMTP id a126mr11038406oii.71.1612188138028; 
 Mon, 01 Feb 2021 06:02:18 -0800 (PST)
MIME-Version: 1.0
References: <377d2e2d328276070ae2f26c65daa1497bb3c3cf.1612166647.git.viresh.kumar@linaro.org>
 <YBfNb91psVcf3TAS@light.dominikbrodowski.net>
 <20210201100502.xluaj5rpqosqsq7b@vireshk-i7>
In-Reply-To: <20210201100502.xluaj5rpqosqsq7b@vireshk-i7>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 1 Feb 2021 15:02:06 +0100
Message-ID: <CAJZ5v0iowSHeie2HLPjHUftBDVBQXi30O1Kfk3Kxchc0K=gYag@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: Remove CPUFREQ_STICKY flag
To: Viresh Kumar <viresh.kumar@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_090220_336600_5AB9BE4B 
X-CRM114-Status: GOOD (  19.37  )
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
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>,
 Andy Gross <agross@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Keguang Zhang <keguang.zhang@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Feb 1, 2021 at 11:06 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 01-02-21, 10:44, Dominik Brodowski wrote:
> > IIRC, it was required on various ARM systems,[*] as CPUs were registered as
> > subsys_initcall(), while cpufreq used to be initialized only later, as an
>
> s/later/earlier ? arch happens before subsys not at least and that is
> the only way we can break cpufreq here, i.e. when the driver comes up
> before the CPUs are registered.
>
> > arch_initcall(). If the ordering is opposite now on all architectures (it
> > wasn't on ARM back then), we should be fine.
> >
> > [*] https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/commit/arch/arm/mach-sa1100/cpu-sa1100.c?id=f59d3bbe35f6268d729f51be82af8325d62f20f5
>
> Thanks for your reply, it made me look at that aspect in some more
> detail to confirm I don't end up breaking anything. Unless I am making
> a mistake in reading the code, this is the code flow that we have
> right now:
>
> start_kernel()
> -> kernel_init()
>    -> kernel_init_freeable()
>       -> do_basic_setup()
>          -> driver_init()
>             -> cpu_dev_init()
>                -> subsys_system_register(for-CPUs)
>
>          -> do_initcalls()
>             -> register-cpufreq-driver from any level
>
> And so CPUs should always be there for a cpufreq driver.
>
> Makes sense ?

It does to me, but can you update the changelog, please?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
