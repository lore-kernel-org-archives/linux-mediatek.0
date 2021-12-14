Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56B2C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Dec 2021 12:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ORmlxIQF4C0oz4xVfF01MOBOO23I/I9LrmT4x3+csBc=; b=I6LfZyCqQnbqCu
	JEskgCU2NuK1wp9cKTOTQqHf8aCy68Zj7wH+XlqAc8ztjGhPrIZKiO6c1dbKa9A9+1Ncm+jhxWLGC
	vCBTXveGbruxSq0zpv8tpfBWPgFL9qN2xS1S9aUKxa9JCaoXwMmSty0d1P0Q+/IUmqKJTVShZIiyh
	2dbCCXSZqfukJeQhJYkM40Xj78ozPanCJfeypDcxhQytXciYMdEyR1r3ZDSqj/7FtJHClnGw7N5di
	pG3VO3W5vKba4HmUmkEPUCffuWyJVCkzElKAgYQzPl8WAjUoNlX03E7XMXgbLfkDMdK+JFLPHLvt/
	L7HqCtSDkBGPMuCqUYRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx6fQ-00DrQA-Jr; Tue, 14 Dec 2021 12:12:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx6Vw-00DozJ-7L; Tue, 14 Dec 2021 12:02:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 97ABE614A2;
 Tue, 14 Dec 2021 12:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CAB6C34601;
 Tue, 14 Dec 2021 12:02:30 +0000 (UTC)
Date: Tue, 14 Dec 2021 12:02:27 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yee Lee <yee.lee@mediatek.com>
Cc: linux-kernel@vger.kernel.org, nicholas.Tang@mediatek.com,
 Kuan-Ying.lee@mediatek.com, chinwen.chang@mediatek.com,
 Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Vlastimil Babka <vbabka@suse.cz>, Marc Zyngier <maz@kernel.org>,
 David Brazdil <dbrazdil@google.com>,
 Ard Biesheuvel <ardb@kernel.org>, Fuad Tabba <tabba@google.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v3 1/1] arm64/cpufeature: Optionally disable MTE via
 command-line
Message-ID: <YbiH04yqEqW8p8EM@arm.com>
References: <20210730144957.30938-1-yee.lee@mediatek.com>
 <20210730144957.30938-2-yee.lee@mediatek.com>
 <20210802153036.GH18685@arm.com>
 <e055e71f0ca7bcb351b9097ba8f8f4a9d324623c.camel@mediatek.com>
 <YapGyozjactAm8vp@arm.com>
 <dc2fd1f8c68e78905f4242c2b530bc720b979cd8.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dc2fd1f8c68e78905f4242c2b530bc720b979cd8.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_040236_399193_726AED40 
X-CRM114-Status: GOOD (  25.66  )
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

On Tue, Dec 14, 2021 at 04:19:05PM +0800, Yee Lee wrote:
> On Fri, 2021-12-03 at 16:33 +0000, Catalin Marinas wrote:
> > On Thu, Nov 25, 2021 at 06:19:29PM +0800, Yee Lee wrote:
> > > As pointed out earlier, the hardware has been verified that still has
> > > transaction sending to DRAM due to mair_el1(Normal_tagged) is
> > > setup.  That means the override in this patch would be incompleted and
> > > cannot achieve to avoid undesired hardware confliction by disabling MTE.
> > > 
> > > Do we have other options to delay the configuration on MAIR_EL1 after
> > > the override? Or maybe another CONFIG to bypass the init in __cpu_setup?
> > 
> > This register is trickier as it may be cached in the TLB (IIRC). I think
> > deferring the setting of SCTLR_EL1.ATA(0) should be sufficient. Can you
> > try the diff I sent in the previous email and confirm that the accesses
> > to the allocation tag storage are blocked?
> 
> Yes, the previous diff is already online. 
> 
> In our experiment, with cmdline, "arm64.nomte", cpu_enable_mte() is
> bypassed and the ATA0 is not set, but the access to tag memory still
> dispatches. Only as MAIR_EL1 remains MAIR_ATTR_NORMAL, instead of
> MAIR_ATTR_NORMAL_TAGGED, the access will stop.
> 
> From the manual, I think ATA only affects TAG instructions like STG,
> IRG, but not the tag access within normal STR/LDR.

The ARM ARM states SCTLR_EL1.ATA0 == 0 means "access to allocation tags
is prevented". The AArch64.MemSingle[] pseudocode ends up with similar
checks:

https://developer.arm.com/documentation/ddi0596/2021-09/Shared-Pseudocode/AArch64-Functions?lang=en#AArch64.MemSingle.read.5

before reading the tags from memory in AArch64.CheckTag():

https://developer.arm.com/documentation/ddi0596/2021-09/Shared-Pseudocode/AArch64-Functions?lang=en#AArch64.CheckTag.4

My suggestion is to raise this with support@arm.com (feel free to cc me)
so that we clarify the hardware behaviour. I don't think it's entirely
correct (it's more like, is there a risk of external aborts caused by
access to allocation tag storage that's not present?)

-- 
Catalin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
