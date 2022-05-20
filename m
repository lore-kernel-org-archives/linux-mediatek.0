Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AB0C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 11:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yliAjHq6n25g9UFXTAD7LPP47zwpa23+eHky81XoY/g=; b=K93H6ihGWQCH2x
	5FOS7hXO0GpbP7rUakK6ax81ZikvToJVTYNhBOk+Ic4rScyCALAqp7MGhRzoc5UrqpVmxfmUx90ua
	kXXdu9XkvAU1IVrybalmoIH4Jvx9f6/GHePfAuFgcm/QJKUGxb4ey0mbdOQNvHXCUNXWlK8iEZsKw
	SCrnLayAOUm/RvRZ1kk2v/uYQVfHk2tSMHv14bkoGnQ6E2Gxs1JaNwZBnM4suHPucfaHfd5FP3Igp
	SL3cOgBoq0F1EcglwPTGEHY+LBYXxg61PYPSBA/sSLpx4/JlFEkHPJ/7UD+BkPE0exRt8rDUdSC17
	Jik+VPJX5xsqYGKa2wVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns0NR-00BwlX-0x; Fri, 20 May 2022 11:01:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrzIf-00Bi6D-Js; Fri, 20 May 2022 09:52:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0EDYX6/jlsKjCqfkxKgPdol0lZ2Drp928yPwi4paSLQ=; b=LFW8yIOQ3TimZR59Go2F8jMnzw
 CBTCI88UtBLrPQ8BNqLRw/rez8zefbkSJg8dCfAi5n6ZW1xNNnC4tOasKQ7eKUDyNQNCr6O3cQzqv
 CTGpAuSN7s+d2WbnMxm0zyBZTi0/+KQR/rwPkk0/l/cPP/Cvj/MYhM/sx+FypE5DFeWClpGEHqAOg
 Rfz6Bd7xry7bfCtnlvOcXQrj4+uO9EaLreSAmBIWCvqfibZ2FLZ6JwvxAf/Wc5x8zKbd7e1EgYoz4
 ZFO81/y8N6sUecl26BKHv9TDy6w2X5Mh2skIrkWb82wo6/WVz/5XnwScaP8hxEy3K8hKN2YlOWCtf
 vQqvZNZA==;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrzER-002IUK-FK; Fri, 20 May 2022 09:47:41 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 02A571F99B;
 Fri, 20 May 2022 09:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1653040058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0EDYX6/jlsKjCqfkxKgPdol0lZ2Drp928yPwi4paSLQ=;
 b=GsRkmokRG8jMr2vvJlveZSJsxyDD0gdysvsOlHzRO6nawaGMCacKesz3nKhzFGIrXCT7O4
 QkJnIO5CeoLCZr01MrYO4ZxjGX/iAKWb9nnKmyZTxnA3DKcfPWofoLQAult89v3jpyKQSe
 qP8vVQpSn5xrwiweHnkSnl9hnN8jHSE=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 746C02C141;
 Fri, 20 May 2022 09:47:37 +0000 (UTC)
Date: Fri, 20 May 2022 11:47:37 +0200
From: Petr Mladek <pmladek@suse.com>
To: Lecopzer Chen <lecopzer.chen@mediatek.com>
Cc: linux-kernel@vger.kernel.org, acme@kernel.org,
 akpm@linux-foundation.org, alexander.shishkin@linux.intel.com,
 catalin.marinas@arm.com, davem@davemloft.net, jolsa@redhat.com,
 jthierry@redhat.com, keescook@chromium.org, kernelfans@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-perf-users@vger.kernel.org, mark.rutland@arm.com,
 masahiroy@kernel.org, matthias.bgg@gmail.com, maz@kernel.org,
 mcgrof@kernel.org, mingo@redhat.com, namhyung@kernel.org,
 nixiaoming@huawei.com, peterz@infradead.org,
 sparclinux@vger.kernel.org, sumit.garg@linaro.org,
 wangqing@vivo.com, will@kernel.org, yj.chiang@mediatek.com
Subject: Re: [PATCH v4 6/6] arm64: Enable perf events based hard lockup
 detector
Message-ID: <YodjucHQ3Nab5J/f@alley>
References: <20220427161340.8518-1-lecopzer.chen@mediatek.com>
 <20220427161340.8518-7-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220427161340.8518-7-lecopzer.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_104739_998293_7F997B02 
X-CRM114-Status: GOOD (  18.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu 2022-04-28 00:13:40, Lecopzer Chen wrote:
> With the recent feature added to enable perf events to use pseudo NMIs
> as interrupts on platforms which support GICv3 or later, its now been
> possible to enable hard lockup detector (or NMI watchdog) on arm64
> platforms. So enable corresponding support.
> 
> One thing to note here is that normally lockup detector is initialized
> just after the early initcalls but PMU on arm64 comes up much later as
> device_initcall(). To cope with that, overriding watchdog_nmi_probe() to
> let the watchdog framework know PMU not ready, and inform the framework
> to re-initialize lockup detection once PMU has been initialized.
> 
> [1]: http://lore.kernel.org/linux-arm-kernel/1610712101-14929-1-git-send-email-sumit.garg@linaro.org
> 
> --- a/arch/arm64/kernel/perf_event.c
> +++ b/arch/arm64/kernel/perf_event.c
> @@ -1390,10 +1391,15 @@ static struct platform_driver armv8_pmu_driver = {
>  
>  static int __init armv8_pmu_driver_init(void)
>  {
> +	int ret;
> +
>  	if (acpi_disabled)
> -		return platform_driver_register(&armv8_pmu_driver);
> +		ret = platform_driver_register(&armv8_pmu_driver);
>  	else
> -		return arm_pmu_acpi_probe(armv8_pmuv3_pmu_init);
> +		ret = arm_pmu_acpi_probe(armv8_pmuv3_pmu_init);
> +
> +	retry_lockup_detector_init();

Does it makes sense to call retry_lockup_detector_init() when
the above returned an error? Should it be?

	if (!ret)
		retry_lockup_detector_init();

> +	return ret;
>  }
>  device_initcall(armv8_pmu_driver_init)


I am not qualified to ack the arm-specific code. But otherwise
the change looks reasonable.

Best Regards,
Petr

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
