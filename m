Return-Path: <SRS0=cYlk=GP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A63C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 15:08:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC35E23132
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 15:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC35E23132
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k5fY1R5vMjCRbE+gvSZZ58amo0tpiuraV+eimWavi4o=; b=M9BhU3Fj5LUj/GcbwUP91ixPB
	4yKyg9j6cMkwqyPCxCtru7rZNkpjVBhaV1Sta8j/hCwHOuRZ5UpQsX/HtBrp1NmRroDZenuWi3uTJ
	7iRdWvelNzGbbcx09VELkXRfWHW9uirEvCXn8kaVvPq/QpPIjb9WbCfXzu8PPIkmvX6XzYqECItS9
	bF3pBq6rGxM0UwyUN35thKyh97qUgtHFD3O8Xupz4bU9qzTZzL8mGCtab1b/RRCBqTODl/tkxlKKw
	B6E+t1YN6HWEkHV5HGdDKwx2RpjMQ8S+xXZWz9Fvs1I+EEZBl2aEJy32VHfpBccI9XLwCMur/0X/+
	Wmt6eKprg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzLGz-0005VN-EC; Tue, 12 Jan 2021 15:07:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzLGp-0005Qx-3V; Tue, 12 Jan 2021 15:07:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D48F23131;
 Tue, 12 Jan 2021 15:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610464062;
 bh=vd1ZvXG086RatWV6CsvEAmO8vQlGfdPVOkxQnQY8NCA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C3QqVR5EoAdqbOzlIDyZliIhO7/xH84JOHD+IAM+0LbD6hb39pR2wt8TOtz0jwSD+
 v60Lcv3WAJrNt7L3apqeVmnsT15JxBl/cJMHg5O+Nwk2kAElkwJmpWxUdKiSrzeSj2
 4FJ/JWUFIjC0/AiTy2Og/NOmU0wth4a2g+qU5yfcmKP9khGAxfApwMEXzH3IrHDFKw
 h8k3DLu4ZvTM9sbW9937X/FOojeVj/3lHJJ2K3ZkdTKay1xdiBoUZu8Np5BcqvygNQ
 9fyavni2FQlNzxNbty7lbiGJauGFeJsI2VaKG5ED4lZQz6E4F/aEPNK7bj8cq0GnHU
 cCEY/j1eBlL4Q==
Date: Tue, 12 Jan 2021 15:07:36 +0000
From: Will Deacon <will@kernel.org>
To: Lecopzer Chen <lecopzer.chen@mediatek.com>
Subject: Re: [PATCH v2] arm64: perf: Fix access percpu variables in
 preemptible context
Message-ID: <20210112150735.GC9689@willie-the-truck>
References: <CAFA6WYNepUP=SeHWnDDbxx=ggwPq2jDd5JmrcXD5GoMC5dYH2g@mail.gmail.com>
 <20210108125527.14175-1-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210108125527.14175-1-lecopzer.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_100743_274901_3F9222E3 
X-CRM114-Status: GOOD (  18.50  )
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
Cc: mark.rutland@arm.com, sumit.garg@linaro.org,
 alexander.shishkin@linux.intel.com, alexandru.elisei@arm.com,
 yj.chiang@mediatek.com, linux-kernel@vger.kernel.org, acme@kernel.org,
 oliver.sang@intel.com, peterz@infradead.org, mingo@redhat.com,
 linux-mediatek@lists.infradead.org, catalin.marinas@arm.com,
 matthias.bgg@gmail.com, namhyung@kernel.org, jolsa@redhat.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 08, 2021 at 08:55:27PM +0800, Lecopzer Chen wrote:
> > On Mon, 21 Dec 2020 at 21:53, Lecopzer Chen <lecopzer.chen@mediatek.com> wrote:
> > >
> > > commit 367c820ef08082 ("arm64: Enable perf events based hard lockup detector")
> > > reinitilizes lockup detector after arm64 PMU is initialized and open
> > > a window for accessing smp_processor_id() in preemptible context.
> > > Since hardlockup_detector_perf_init() always called in init stage
> > > with a single cpu, but we initialize lockup detector after the init task
> > > is migratable.
> > >
> > > Fix this by utilizing lockup detector reconfiguration which calls
> > > softlockup_start_all() on each cpu and calls watatchdog_nmi_enable() later.
> > > Because softlockup_start_all() use IPI call function to make sure
> > > watatchdog_nmi_enable() will bind on each cpu and fix this issue.
> > 
> > IMO, this just creates unnecessary dependency for hardlockup detector
> > init via softlockup detector (see the alternative definition of
> > lockup_detector_reconfigure()).
> 
> 
> The arm64/Kconfig select HAVE_HARDLOCKUP_DETECTOR_PERF if we have NMI:
> 	select HAVE_HARDLOCKUP_DETECTOR_PERF if PERF_EVENTS && HAVE_PERF_EVENTS_NMI
> 
> And in lib/Kconfig.debug HARDLOCKUP_DETECTOR select SOFTLOCKUP_DETECTOR automatically.
> 	config HARDLOCKUP_DETECTOR_PERF
> 		bool
> 		select SOFTLOCKUP_DETECTOR
> 
> So we don't need to explicitly select softlockup.
> And actually this patch is not a perfect solution like you said
> (hardlockup depends on softlockup),
> but the key point is that lockup_detector_init() seems only design for
> using in early init stage and not for calling in later deffered initial process.

I agree; the current usage in armv8_pmu_driver_init() looks very broken to
me, and bodging it with raw_smp_processor_id() isn't the right solution.

Maybe we should just revert 367c820ef08082, as this looks like a design
issue rather than something with a simple fix?

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
