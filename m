Return-Path: <SRS0=cYlk=GP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A55C433E6
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 16:33:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2E7522B2B
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 16:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2E7522B2B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U7RDRDiUa+Fn4xwoIHpM4lS+yB83Os2LDcPS3NJ52ck=; b=SHieqrwuAxxOBEYGF9Ni2+8VB
	z6jwRMmaCcoStGsgjC8f3UeA2QxUnmJZvRm+krTmo0uvZoCfV+JzkUxCA8IcIXCNS/+qwXfKgpMSX
	QBX0O//z+l5L+kIDcwE0o4G+p5GUiMCVRwglvalVLJkbZmQY9sZ/oErifIEfRy32ZqKvL7/R+yiz5
	cObFm5l8JYJd0O9ZRg5W3ArZA4BxPw9X7MQMQC7Y9KLH2+eXARaO+T0gxWoJo1Id6UQDFw0FX4kSY
	2dqmtOqRbqesj6oTKulgRtBo3/A9uaMPdZBxeBCrfyxL0yoxYIPPACYANPHckySyuz9OIvF1txqgv
	ZWHI/JEIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzMbb-0006lw-HB; Tue, 12 Jan 2021 16:33:15 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzMbR-0006jd-NH; Tue, 12 Jan 2021 16:33:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9014F101E;
 Tue, 12 Jan 2021 08:33:01 -0800 (PST)
Received: from C02TD0UTHF1T.local (unknown [10.57.57.147])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F0683F719;
 Tue, 12 Jan 2021 08:32:57 -0800 (PST)
Date: Tue, 12 Jan 2021 16:32:54 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2] arm64: perf: Fix access percpu variables in
 preemptible context
Message-ID: <20210112163254.GB36306@C02TD0UTHF1T.local>
References: <CAFA6WYNepUP=SeHWnDDbxx=ggwPq2jDd5JmrcXD5GoMC5dYH2g@mail.gmail.com>
 <20210108125527.14175-1-lecopzer.chen@mediatek.com>
 <20210112150735.GC9689@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210112150735.GC9689@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_113305_845961_CB72BB48 
X-CRM114-Status: GOOD (  23.05  )
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
Cc: sumit.garg@linaro.org, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 alexander.shishkin@linux.intel.com, catalin.marinas@arm.com, jolsa@redhat.com,
 linux-kernel@vger.kernel.org, acme@kernel.org, oliver.sang@intel.com,
 peterz@infradead.org, mingo@redhat.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, namhyung@kernel.org, alexandru.elisei@arm.com,
 yj.chiang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 12, 2021 at 03:07:36PM +0000, Will Deacon wrote:
> On Fri, Jan 08, 2021 at 08:55:27PM +0800, Lecopzer Chen wrote:
> > > On Mon, 21 Dec 2020 at 21:53, Lecopzer Chen <lecopzer.chen@mediatek.com> wrote:
> > > >
> > > > commit 367c820ef08082 ("arm64: Enable perf events based hard lockup detector")
> > > > reinitilizes lockup detector after arm64 PMU is initialized and open
> > > > a window for accessing smp_processor_id() in preemptible context.
> > > > Since hardlockup_detector_perf_init() always called in init stage
> > > > with a single cpu, but we initialize lockup detector after the init task
> > > > is migratable.
> > > >
> > > > Fix this by utilizing lockup detector reconfiguration which calls
> > > > softlockup_start_all() on each cpu and calls watatchdog_nmi_enable() later.
> > > > Because softlockup_start_all() use IPI call function to make sure
> > > > watatchdog_nmi_enable() will bind on each cpu and fix this issue.
> > > 
> > > IMO, this just creates unnecessary dependency for hardlockup detector
> > > init via softlockup detector (see the alternative definition of
> > > lockup_detector_reconfigure()).
> > 
> > 
> > The arm64/Kconfig select HAVE_HARDLOCKUP_DETECTOR_PERF if we have NMI:
> > 	select HAVE_HARDLOCKUP_DETECTOR_PERF if PERF_EVENTS && HAVE_PERF_EVENTS_NMI
> > 
> > And in lib/Kconfig.debug HARDLOCKUP_DETECTOR select SOFTLOCKUP_DETECTOR automatically.
> > 	config HARDLOCKUP_DETECTOR_PERF
> > 		bool
> > 		select SOFTLOCKUP_DETECTOR
> > 
> > So we don't need to explicitly select softlockup.
> > And actually this patch is not a perfect solution like you said
> > (hardlockup depends on softlockup),
> > but the key point is that lockup_detector_init() seems only design for
> > using in early init stage and not for calling in later deffered initial process.
> 
> I agree; the current usage in armv8_pmu_driver_init() looks very broken to
> me, and bodging it with raw_smp_processor_id() isn't the right solution.
> 
> Maybe we should just revert 367c820ef08082, as this looks like a design
> issue rather than something with a simple fix?

I think that would make sense for now, then we can reconsider the whole
thing rather than looking for a point-fix.

Thanks,
Mark.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
