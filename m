Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146A5C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 09:44:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D041964EA4
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 09:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D041964EA4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dominikbrodowski.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7SgqaNXLGCbiwxikKCAA2BF5LpxNoZR/m5G0FljFnos=; b=GOOPWeIz3Q7cAqKIkpv5wZZ58
	ok3tGcWzbJlRuRUBnYGzspg0M27e77JAZ3pXABC7UJTX/TKRdNphPzSJaA1+sY8aQr1hCloupupxy
	3MTaQGneaVgKNi4g5yisSyoI0IyY8Ooom6PmIaL15jKfuMNKhjQ7MKFkr235r6XZaHeGqmRS/HJwR
	wA5e/zsGjnJKUQcq5CI0c3NouXlCkC+2Vt/J8LCiksGiHIuwRF+KLEVsYv3i0cy1MVHsKiusRnQyj
	BOt1vdp9pSHBnldJBj13KhY65QQSCzKv0aGRdn86hXMAahIzekJQMysRhBb5AcPL8mTu1sfk5bgff
	d/bXmSchA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6Vl2-0000op-C6; Mon, 01 Feb 2021 09:44:32 +0000
Received: from isilmar-4.linta.de ([136.243.71.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6Vkz-0000nS-DR; Mon, 01 Feb 2021 09:44:30 +0000
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
Received: from light.dominikbrodowski.net (brodo.linta [10.2.0.102])
 by isilmar-4.linta.de (Postfix) with ESMTPSA id B8126200F18;
 Mon,  1 Feb 2021 09:44:22 +0000 (UTC)
Received: by light.dominikbrodowski.net (Postfix, from userid 1000)
 id 4733D2090E; Mon,  1 Feb 2021 10:44:15 +0100 (CET)
Date: Mon, 1 Feb 2021 10:44:15 +0100
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: Remove CPUFREQ_STICKY flag
Message-ID: <YBfNb91psVcf3TAS@light.dominikbrodowski.net>
References: <377d2e2d328276070ae2f26c65daa1497bb3c3cf.1612166647.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <377d2e2d328276070ae2f26c65daa1497bb3c3cf.1612166647.git.viresh.kumar@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_044429_572805_ADE575AA 
X-CRM114-Status: GOOD (  11.33  )
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
Cc: linux-omap@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, linux-tegra@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-pm@vger.kernel.org, Rafael Wysocki <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Keguang Zhang <keguang.zhang@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Viresh,

Am Mon, Feb 01, 2021 at 01:35:51PM +0530 schrieb Viresh Kumar:
> The removal of such a driver is avoided if the driver carries the
> CPUFREQ_STICKY flag. This was added way back [1] in 2004 and perhaps no
> one should ever need it now. A lot of driver do set this flag, probably
> because they just copied it from another driver.

IIRC, it was required on various ARM systems,[*] as CPUs were registered as
subsys_initcall(), while cpufreq used to be initialized only later, as an
arch_initcall(). If the ordering is opposite now on all architectures (it
wasn't on ARM back then), we should be fine.

[*] https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/commit/arch/arm/mach-sa1100/cpu-sa1100.c?id=f59d3bbe35f6268d729f51be82af8325d62f20f5

Thanks,
	Dominik

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
