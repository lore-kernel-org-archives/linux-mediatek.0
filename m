Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF758C7EE23
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 May 2023 15:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uxhui/Ir4eT5sPQEaZT+4zpzC7jhoc2yOtRKPtRVLuQ=; b=DK/22tWO5XXSNULZ+SPIEM5Q8A
	K2hM1ulDtlmD/BIVVL9GH2vNUMMxb+/rykQtNmTm5COLjAipyYqnsMqfC/qcGpRmY1Ap3pJQyj0xn
	mqkz7kQCy9339m1qmoErNDzomFByptuhe9/NlIcAoEFPhduG/+W1T90R0Q3rm78Er+adF85PZwcRI
	uuRIiLukHdo/fkjOX2uokKUF31n+QpK9HakY7aWWvu16DW7R0khTbHGBaQvaq8BmKz95fdm/WzCkz
	D1xTqjfUTsSn+inYRAbvOgpjBSnmh1TBobjUqGs2M4BHANjkUN6Y7s5JCWTb8Kgn+sRV5Gwhher0l
	WzxKTrAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptrrB-001wD2-0O;
	Tue, 02 May 2023 15:23:57 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptrr6-001wBl-0t;
	Tue, 02 May 2023 15:23:55 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 4879F221BC;
	Tue,  2 May 2023 15:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683041028; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uxhui/Ir4eT5sPQEaZT+4zpzC7jhoc2yOtRKPtRVLuQ=;
	b=aq3JR34r8i83T70pqTkemzrSH10xQCplmij5pIQyD0YK8z+itGyO9k/Zvwi7Qf+IAKSBhy
	eo5tEqIAixUbBkkCE5eSv5dIFEOV+IPzcaBToFTE8efSam2JM1pCB6A8Hp2m1P1M7YFOvF
	iPQTkRjELszxauRKGj1883nDqmBx4G8=
Received: from suse.cz (unknown [10.100.201.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 1DBAC2C141;
	Tue,  2 May 2023 15:23:46 +0000 (UTC)
Date: Tue, 2 May 2023 17:23:45 +0200
From: Petr Mladek <pmladek@suse.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sumit Garg <sumit.garg@linaro.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Ian Rogers <irogers@google.com>, ravi.v.shankar@intel.com,
	Marc Zyngier <maz@kernel.org>, linux-perf-users@vger.kernel.org,
	Stephane Eranian <eranian@google.com>,
	kgdb-bugreport@lists.sourceforge.net, ito-yuichi@fujitsu.com,
	linux-arm-kernel@lists.infradead.org,
	Stephen Boyd <swboyd@chromium.org>,
	Masayoshi Mizuma <msys.mizuma@gmail.com>, ricardo.neri@intel.com,
	Lecopzer Chen <lecopzer.chen@mediatek.com>,
	Chen-Yu Tsai <wens@csie.org>, Andi Kleen <ak@linux.intel.com>,
	Colin Cross <ccross@android.com>,
	Matthias Kaehlcke <mka@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@chromium.org>,
	Alexander Potapenko <glider@google.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Juergen Gross <jgross@suse.com>, Kees Cook <keescook@chromium.org>,
	Laurent Dufour <ldufour@linux.ibm.com>,
	Liam Howlett <liam.howlett@oracle.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>,
	Zhen Lei <thunder.leizhen@huawei.com>, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: cpu hotplug : was: Re: [PATCH v3] hardlockup: detect hard lockups
 using secondary (buddy) CPUs
Message-ID: <ZFEqynvf5nqkzEvQ@alley>
References: <20230501082341.v3.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230501082341.v3.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_082352_481881_3278DB68 
X-CRM114-Status: GOOD (  28.90  )
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

On Mon 2023-05-01 08:24:46, Douglas Anderson wrote:
> From: Colin Cross <ccross@android.com>
> 
> Implement a hardlockup detector that doesn't doesn't need any extra
> arch-specific support code to detect lockups. Instead of using
> something arch-specific we will use the buddy system, where each CPU
> watches out for another one. Specifically, each CPU will use its
> softlockup hrtimer to check that the next CPU is processing hrtimer
> interrupts by verifying that a counter is increasing.
> 
> --- /dev/null
> +++ b/kernel/watchdog_buddy_cpu.c
> +int watchdog_nmi_enable(unsigned int cpu)
> +{
> +	/*
> +	 * The new CPU will be marked online before the first hrtimer interrupt
> +	 * runs on it.

It does not need to be the first hrtimer interrupt. The CPU might have
been offlined/onlined repeatedly. The counter might have any value.

> +      * If another CPU tests for a hardlockup on the new CPU
> +	 * before it has run its first hrtimer, it will get a false positive.
> +	 * Touch the watchdog on the new CPU to delay the first check for at
> +	 * least 3 sampling periods to guarantee one hrtimer has run on the new
> +	 * CPU.
> +	 */
> +	per_cpu(watchdog_touch, cpu) = true;

We should touch also the next_cpu:

	/*
	 * We are going to check the next CPU. Our watchdog_hrtimer
	 * need not be zero if the CPU has already been online earlier.
	 * Touch the watchdog on the next CPU to avoid false positive
	 * if we try to check it in less then 3 interrupts.
	 */
	next_cpu = watchdog_next_cpu(cpu);
	if (next_cpu < nr_cpu_ids)
		per_cpu(watchdog_touch, next_cpu) = true;

Alternative would be to clear watchdog_hrtimer. But it would kind-of
affect also the softlockup detector.


> +	/* Match with smp_rmb() in watchdog_check_hardlockup() */
> +	smp_wmb();
> +	cpumask_set_cpu(cpu, &watchdog_cpus);
> +	return 0;
> +}
> +
> +void watchdog_nmi_disable(unsigned int cpu)
> +{
> +	unsigned int next_cpu = watchdog_next_cpu(cpu);
> +
> +	/*
> +	 * Offlining this CPU will cause the CPU before this one to start
> +	 * checking the one after this one. If this CPU just finished checking
> +	 * the next CPU and updating hrtimer_interrupts_saved, and then the
> +	 * previous CPU checks it within one sample period, it will trigger a
> +	 * false positive. Touch the watchdog on the next CPU to prevent it.
> +	 */
> +	if (next_cpu < nr_cpu_ids)
> +		per_cpu(watchdog_touch, next_cpu) = true;
> +	/* Match with smp_rmb() in watchdog_check_hardlockup() */
> +	smp_wmb();
> +	cpumask_clear_cpu(cpu, &watchdog_cpus);
> +}
> +

Best Regards,
Petr

