Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387A7C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 13:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bOa2B9C40UO+CUzLJRvfrs7inEQcU1/Q8znTWl0cIOU=; b=jSad+e7ArttEw2
	tcnlhVqqc1XBBxJw3zqREm2VvNcoIM8Ed4kDH1TYAfxKiD/47eORaTq443hDbbQ8cLYIN2hmMiq30
	RgBnajS3HalHj67RYRzE5jTbj7C/SSz+JyolqjudrBmaAZ9E3iJ3eRsxfoujgk6dckh36kUjf5d5U
	7IgkAsnl5RbWnOrSinhdQHBWkOsQgef1UtDpJ1igVYLS0uD9V2n49ipGO5PNy/2jilAtBj8ztF5nr
	HP7wO1BIYnhysJ/wXKxv3BEkdBsu5FoIxwRzAG1EEPYGDHvGI9HxZXdYZPUHSUIzXLLype6sLe63m
	A+S98DbmWqTP/01RqZQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZBvB-00CMYD-5j; Tue, 29 Mar 2022 13:30:05 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZBuy-00CMTr-Lh; Tue, 29 Mar 2022 13:29:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B8E323A;
 Tue, 29 Mar 2022 06:29:49 -0700 (PDT)
Received: from e120937-lin (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3AC0C3F73B;
 Tue, 29 Mar 2022 06:29:47 -0700 (PDT)
Date: Tue, 29 Mar 2022 14:29:45 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-kernel@vger.kernel.org, dietmar.eggemann@arm.com,
 Pierre.Gondois@arm.com, ionela.voinescu@arm.com,
 viresh.kumar@linaro.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, linux-pm@vger.kernel.org,
 mka@chromium.org, nm@ti.com, sboyd@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, sudeep.holla@arm.com,
 matthias.bgg@gmail.com
Subject: Re: [0/8] Introduce support for artificial Energy Model
Message-ID: <YkMJyRblpNMnv8ub@e120937-lin>
References: <20220316235211.29370-1-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220316235211.29370-1-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_062952_813309_02E5F08C 
X-CRM114-Status: GOOD (  25.27  )
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

On Wed, Mar 16, 2022 at 11:52:03PM +0000, Lukasz Luba wrote:
> Hi all,
> 

Hi Lukasz,

> This patch set adds new callback and support for artificial Energy Model (EM).
> The new EMs have artificially generated performance states.
> Such EMs can be created from lean information sources, such
> as the relative energy efficiency between CPUs. The ACPI based
> platforms provide this information
> (ACPI 6.4, s5.2.12.14 'GIC CPU Interface (GICC) Structure'
> 'Processor Power efficiency Class' field).
> 
> Artificial EMs might require to directly provide the 'cost' of
> the generated performance state. This patch set adds a new callback
> .get_cost() for this. The EM framework does not force any model
> or formula, it's up to the platform code.
> 
> Artificial EMs aim to leverage the Energy Aware Scheduler
> (EAS). Other frameworks relying on performance states
> information (i.e. IPA/DTPM) must be informed of the
> EM type and might be prevented from using it. This patch
> sets also does this by introducing a new flag:
> EM_PERF_DOMAIN_ARTIFICIAL.
> 
> The patch set is based on current linux-next, where some
> changes to OPP & EM are queuing.
> 
> The patch set also contains (patch 7/8 and patch 8/8) logic which prevents
> two EM's client frameworks from using this new EM type. Some other approach,
> using 'milli-watts', has been proposed and discussed, but refused [1].
> This new flag is more precised and should not leave space for
> wrong interpretation.
> 
> Shortly after this patch set you will see a patch set implementing the
> platform code and registering this new EM.
> 

Just to let you know that in the few days I'm going to post the first
chunk of some SCMIv3.1 additions that includes also (as you probably
know) the SCMI Perf protocol support for reporting perf_domain costs in
micro-watts and not only in milli-watts.

Given that it does not seem that as of now the em_ API used by the SCMI
cpufreq driver can make use of this new scale (and being not at all
familiar with EM/EAS for sure :P), the SCMIv3.1 'Perf micro-watts' patch
which I will post (I'll CC you) does NOT expose any new interface but only
takes care to store the new micro-watts capability internally in a flag
(if advertised by an SCMIv3.1 backend server), so that, basically, you'll
keep seeing from the SCMI cpufreq driver that the scale is milli-watt
(when milli-watts are used of course) or non-milli-watt (for abstract and
micro-watts scales).

This is intended to be of course a first step, laying out just the bare
minimum commmon internal SCMI support, until we figure out how to properly
expose this from the SCMI Perf in order to make it usable for EM.
(if neeeded at all).

Thanks,
Cristian


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
