Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F397CC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 11:33:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C080322B40
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 11:33:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="olkKNOSI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C080322B40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Fps7zUm9uUmY6IotmZKLrM/Qa8j8krlnoFHv4wa9a3U=; b=olkKNOSIYS56eTS4CFBwseCIh
	YiXGKjiTh2+RU+I0Cqhaw7fnOAggqqwEMA+EmU59bFX1Kvlqjzx1DniGlsC+nvH0Zu7jShLECiYni
	2TPg0mNuxhQG9XshPOi7QT5vh+d6ugahvmZBoPWnLXT7QE78HoZhZ+QUccMgWgzCGYfoYGGHbnkcq
	h5jQXr4wT0+vstwXu9LbyxVeA+gkgYCDkK9t9t23adBzATLZyDMPKUl6CqtCL144CXx957e/HfdZX
	e5h3GnHCT5zgfw4pWOb5QaIwPfMvR9DClk3bQfL1GxaT/UHXQvCMKmCdgOwl994Fln6vHunouCyoQ
	VWvVE4Oyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1TII-0006kv-Ak; Fri, 31 Jul 2020 11:33:46 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1TIC-0006iQ-Gw; Fri, 31 Jul 2020 11:33:41 +0000
Received: by mail-oi1-f195.google.com with SMTP id u63so14681091oie.5;
 Fri, 31 Jul 2020 04:33:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mpZwL9ptFKxq7FoZCH1xjumTWQNcssejfeTwP6RoxpQ=;
 b=ocpy+2kCQSAic7DPrk7p6ua8B6beIKSG3YBjv4mjIR2WZOPp1m/ke+FRhtKLbA3vnz
 TsHwnkowSW//8/pmoXr4MZ4+ocqGfMtfKNo+P2MCQfb97pG4fIfc6r8DKd0AHo0I8PoI
 hYgULnPZPB4TCyqWZOnu1CN8/yEYPKoDu5f6x60k3+X368wCNvVMaMRxdER34trVQ8w3
 6zAYl/LZfFCcqokbqVEOOWizbBGxaIstj0nEHQN2Dmuk2lRvv3eT47Pr9exJIb7FE3nl
 KcjwwzuS1mecjVVNC7/ec5Wvm04m+wM720CkwIdz4+iF+6upxq+nei1xAFgBew86eVDY
 adEw==
X-Gm-Message-State: AOAM5300KhA7RR3hRnpLigh+e4wZd7+gMX0Er1RO2vtSO06gYSrlhcYE
 D9GT6a+mhh/YsDl5YmXmqZ2FdGrRrgcqAeZ3N84=
X-Google-Smtp-Source: ABdhPJwjnTZ4vCcK+PJMw9f0cgXjEhaXp88nRbYUPJxc2xho6yL2W9vIsfi0PJ+loYFbKG0KfjHoOo6H/h7XzI4Nqoc=
X-Received: by 2002:aca:a88e:: with SMTP id r136mr2704600oie.110.1596195217368; 
 Fri, 31 Jul 2020 04:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <1596166744-2954-1-git-send-email-neal.liu@mediatek.com>
 <1596166744-2954-2-git-send-email-neal.liu@mediatek.com>
In-Reply-To: <1596166744-2954-2-git-send-email-neal.liu@mediatek.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 31 Jul 2020 13:33:24 +0200
Message-ID: <CAJZ5v0gk9a-PVr4+zerNWdBORyC563K8XgUdgxENAQ+Y5-85tg@mail.gmail.com>
Subject: Re: [PATCH] acpi: fix 'return' with no value build warning
To: Neal Liu <neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_073340_589573_5CFD0AE3 
X-CRM114-Status: GOOD (  17.55  )
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

On Fri, Jul 31, 2020 at 5:39 AM Neal Liu <neal.liu@mediatek.com> wrote:
>
> Fixing CFI issue which introduced by commit efe9711214e6 is
> incomplete.
> Add return value to fix return-type build warning.
>
> Signed-off-by: Neal Liu <neal.liu@mediatek.com>

Applied with edited subject and changelog, but ->

> ---
>  drivers/acpi/processor_idle.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/acpi/processor_idle.c b/drivers/acpi/processor_idle.c
> index 6ffb6c9..6870020 100644
> --- a/drivers/acpi/processor_idle.c
> +++ b/drivers/acpi/processor_idle.c
> @@ -664,11 +664,11 @@ static int acpi_idle_enter_s2idle(struct cpuidle_device *dev,
>                 struct acpi_processor *pr = __this_cpu_read(processors);
>
>                 if (unlikely(!pr))
> -                       return;
> +                       return -EFAULT;

-> there is no point returning an error code here, so I've made it
just return 0.

>
>                 if (pr->flags.bm_check) {
>                         acpi_idle_enter_bm(pr, cx, false);
> -                       return;
> +                       return 0;
>                 } else {
>                         ACPI_FLUSH_CPU_CACHE();
>                 }
> --

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
