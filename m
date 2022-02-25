Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D838C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 12:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZUxaDO+nthlTNiZ2aN3F6XEm6n9Vlp8XY/juZezE+HA=; b=1VUR11U3WJL7aG
	Xni3bLyb0KNMywKQPfPO+JPGG3pYvNjR7ORHi+b4oQPvRbbYHM1j6sWtC9QocVCWsfqsoS8grDP4K
	1+FaJxawt/uKaF7ez6IJ16jP69FLoNWdTvKm6YoHkWJkKmERR7LC5yBmoXbNVCVZOGCtA0gauD3hD
	YjriUwyOPlWwPsX3wTLvHMzc2Ti/+9qMVNnuCTlSOt6wqt7s001vp0v/4nSEjDjlt0EvjTNEsyKHB
	s5/6sZIPdmXQCxUm0Ptyld8aCsNcTIWN1YGy3tWvsyOrLxa2W/L148PawZhK5dAmyRziBQwCySNUM
	OHiM7hO2ahT5+cZorMnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNa3g-004v2X-Bu; Fri, 25 Feb 2022 12:50:52 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNa3S-004uxR-C1; Fri, 25 Feb 2022 12:50:39 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id AECEE2114E;
 Fri, 25 Feb 2022 12:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1645793436; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p+z7dhR5AVpWtS+uySTHMyttMo1Oz60T/1wMsyvp/Uo=;
 b=vRXiEwcWBV/NU3KG7hCbXIHY7ZCeuXt2JIUb6LQjB+Bb45u4uabozrc4q4xG2VTL3xaU/Q
 TN2Ed5kkkeZ8EmQiaWkhGGWie6kCPEMKWWybX+Tq+kGm9jW9N1bbouSmgAdXKpHtgjqcRn
 iBRB6rxjni2WvxifF30a5dS+Rjonp2s=
Received: from suse.cz (unknown [10.100.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 54B8EA3B83;
 Fri, 25 Feb 2022 12:50:36 +0000 (UTC)
Date: Fri, 25 Feb 2022 13:50:36 +0100
From: Petr Mladek <pmladek@suse.com>
To: Lecopzer Chen <lecopzer.chen@mediatek.com>
Cc: linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 davem@davemloft.net, Matthias Brugger <matthias.bgg@gmail.com>,
 Marc Zyngier <maz@kernel.org>, Julien Thierry <jthierry@redhat.com>,
 Kees Cook <keescook@chromium.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Wang Qing <wangqing@vivo.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Xiaoming Ni <nixiaoming@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-mediatek@lists.infradead.org, sumit.garg@linaro.org,
 kernelfans@gmail.com, yj.chiang@mediatek.com
Subject: Re: [PATCH 2/5] kernel/watchdog: change watchdog_nmi_enable() to void
Message-ID: <YhjQnMZahzu1w2lj@alley>
References: <20220212104349.14266-1-lecopzer.chen@mediatek.com>
 <20220212104349.14266-3-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220212104349.14266-3-lecopzer.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_045038_578794_102A6D80 
X-CRM114-Status: GOOD (  16.34  )
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

On Sat 2022-02-12 18:43:46, Lecopzer Chen wrote:
> 
> Nobody cares about the return value of watchdog_nmi_enable(),
> changing its prototype to void.
> 
> --- a/arch/sparc/kernel/nmi.c
> +++ b/arch/sparc/kernel/nmi.c
> @@ -282,11 +282,11 @@ __setup("nmi_watchdog=", setup_nmi_watchdog);
>   * sparc specific NMI watchdog enable function.
>   * Enables watchdog if it is not enabled already.
>   */
> -int watchdog_nmi_enable(unsigned int cpu)
> +void watchdog_nmi_enable(unsigned int cpu)
>  {
>  	if (atomic_read(&nmi_active) == -1) {
>  		pr_warn("NMI watchdog cannot be enabled or disabled\n");
> -		return -1;
> +		return;
>  	}
>  
>  	/*
> @@ -295,11 +295,11 @@ int watchdog_nmi_enable(unsigned int cpu)
>  	 * process first.
>  	 */
>  	if (!nmi_init_done)
> -		return 0;
> +		return;
>  
>  	smp_call_function_single(cpu, start_nmi_watchdog, NULL, 1);
>  
> -	return 0;
> +	return;

Return at the end of the function is superfluous.

>  }
>  /*
>   * sparc specific NMI watchdog disable function.

Otherwise, it looks good.

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
