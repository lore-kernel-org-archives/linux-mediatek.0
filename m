Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAB9C30653
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 09:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=geP03lvsfMAhnqc3Yd0q1TFY6TBqjmLB1BtZFu7nfI0=; b=ldtODWr1UFQKi3OpUfPzjF87xN
	oZlIb+pZVJcP+uC5wCk/DfzGiLRON1UPQMVTRjtU+vDMMQThld+Q1UQu+ZmtAWNA194m8XT3oTC3J
	juZ+i4YP4vUVNp5etcJcPU+3WAiJeO9lD8KsBPK5MjBF1wMDKcVjHjiI43P2ldKrCDSGpNmw7KXns
	CXQswNRxZuJAtq3sboblP4jBC+ysoiTdnjj5v07joz2d4h4fAehWYygX8YVdd/KGOxc5hxVpDgsLq
	7jlBjpMVIOjUXRuEOifvMVjGtXWWo7TrZLF99UMOAtUFXjLt34/pyzaJgu4DHFcsECXZaihU3u/oe
	jXdNt5aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPIjr-0000000CkFU-2978;
	Thu, 04 Jul 2024 09:26:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPIjd-0000000CkAU-03kO;
	Thu, 04 Jul 2024 09:26:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2C4C367;
	Thu,  4 Jul 2024 02:26:57 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E27D83F766;
	Thu,  4 Jul 2024 02:26:27 -0700 (PDT)
Date: Thu, 4 Jul 2024 10:26:25 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Huang Rui <ray.huang@amd.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Perry Yuan <perry.yuan@amd.com>, Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Markus Mayer <mmayer@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Len Brown <lenb@kernel.org>, Kevin Hilman <khilman@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Lizhe <sensor1010@163.com>, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 4/4] cpufreq: Make cpufreq_driver->exit() return void
Message-ID: <ZoZqwb8LdQQohQHM@bogus>
References: <cover.1720075640.git.viresh.kumar@linaro.org>
 <3f73fda736818128558b61ad5fe2bed5dce3ddc4.1720075640.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f73fda736818128558b61ad5fe2bed5dce3ddc4.1720075640.git.viresh.kumar@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_022637_112356_1B68F756 
X-CRM114-Status: GOOD (  10.39  )
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

On Thu, Jul 04, 2024 at 12:23:55PM +0530, Viresh Kumar wrote:
> From: Lizhe <sensor1010@163.com>
> 
> The cpufreq core doesn't check the return type of the exit() callback
> and there is not much the core can do on failures at that point. Just
> drop the returned value and make it return void.
> 
> Signed-off-by: Lizhe <sensor1010@163.com>
> [ Viresh: Reworked the patches to fix all missing changes together. ]
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---

[...]

>  drivers/cpufreq/scmi-cpufreq.c         |  4 +---
>  drivers/cpufreq/scpi-cpufreq.c         |  4 +---
>  drivers/cpufreq/vexpress-spc-cpufreq.c |  5 ++---

(For the above 3 files)
Acked-by: Sudeep Holla <sudeep.holla@arm.com>

--
Regards,
Sudeep

