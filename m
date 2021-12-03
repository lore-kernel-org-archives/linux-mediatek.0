Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581A4C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Dec 2021 16:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zvgUTbrNtxW9lyZ1a204sMDyk7f5r9pW/yUz6NCohGs=; b=D+oJJGGxZudDHM
	ZJd3O462x3CIK6ZvdaWIbCgxgUnwSh4drQnmSBnEm74cb3IkeM4Q5IOL6BWKm1IO7RswXswzR/uYv
	P542C6GMFNsXkvLedLjkh9FWPb7BgJwu0aVtc35DwB6XMc3iGhNAKB3k9dWJHIfwgLSqyv4KqTjkB
	1V+v99W/JfOfBBtwq9rz51MqktUL/xHGTlfPrVBB1Qsw0PmoO+Z3W4OmrOQkyF/cQgKTFpjgbCwgq
	Sp+DSLgOJvnHnymIgkTdOdDq4zI7hZVOrkdj2knko1WHxJ23Dg3ldqZQUEFuG+Qb5o0+H+yXrVzyS
	9c5o3BcJq1kNmR7C7QOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtBV9-00GXEA-JC; Fri, 03 Dec 2021 16:33:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtBUw-00GXAe-S0; Fri, 03 Dec 2021 16:33:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6DBF762B37;
 Fri,  3 Dec 2021 16:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F539C53FCD;
 Fri,  3 Dec 2021 16:33:17 +0000 (UTC)
Date: Fri, 3 Dec 2021 16:33:14 +0000
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
Message-ID: <YapGyozjactAm8vp@arm.com>
References: <20210730144957.30938-1-yee.lee@mediatek.com>
 <20210730144957.30938-2-yee.lee@mediatek.com>
 <20210802153036.GH18685@arm.com>
 <e055e71f0ca7bcb351b9097ba8f8f4a9d324623c.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e055e71f0ca7bcb351b9097ba8f8f4a9d324623c.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_083323_073039_0F67F4DE 
X-CRM114-Status: GOOD (  36.88  )
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

On Thu, Nov 25, 2021 at 06:19:29PM +0800, Yee Lee wrote:
> On Mon, 2021-08-02 at 16:30 +0100, Catalin Marinas wrote:
> > On Fri, Jul 30, 2021 at 10:49:53PM +0800, yee.lee@mediatek.com wrote:
> > > From: Yee Lee <yee.lee@mediatek.com>
> > > 
> > > For some low-end devices with limited resources,
> > > MTE needs to be optionally disabled to save system
> > > costs such as tag memory and firmware controls.
> > 
> > I understand the cost of using MTE but I don't fully get what you mean
> > by firmware controls. If the ID_AA64PFR1_EL1.MTE reports that MTE is
> > present, the firmware should have initialised MTE correctly (e.g. tag
> > allocation storage, SCR_EL3.ATA) and not rely on a kernel command line
> > argument that may or may not be present.
> > 
> > > This allows ID_AA64PFR1_EL1.MTE to be overridden on 
> > > its shadow value by giving "arm64.nomte" on cmdline,
> > > and to suppress MTE feature.
> > > 
> > > Suggested-by: Marc Zyngier <maz@kernel.org>
> > > Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > > Signed-off-by: Yee Lee <yee.lee@mediatek.com>
> > 
> > While this patch appears to disable MTE, I don't think it can fully
> > prevent the access to the allocation tag storage, so the firmware must
> > still initialise it correctly.
> > 
> > The issue is that __cpu_setup already configures the MAIR_EL1 register
> > to use Normal Tagged memory for the kernel mapping and SCTLR_EL1.ATA is
> > set. The TCF field is zero, so no tag checking, but I couldn't figure
> > out from the ARM ARM whether this also prevents LDR/STR from attempting
> > to fetch the allocation tags. I think it's only the ATA bit and the MAIR
> > configuration.
> > 
> > With this patch, KASAN_HW_TAGS (if configured) won't be used and MTE
> > will not be presented to user applications, if that's what you want, but
> > does not fully disable MTE.
> 
> As pointed out earlier, the hardware has been verified that still has
> transaction sending to DRAM due to mair_el1(Normal_tagged) is
> setup.  That means the override in this patch would be incompleted and
> cannot achieve to avoid undesired hardware confliction by disabling
> MTE.
> 
> Do we have other options to delay the configuration on MAIR_EL1 after
> the override? Or maybe another CONFIG to bypass the init in
> __cpu_setup?

This register is trickier as it may be cached in the TLB (IIRC). I think
deferring the setting of SCTLR_EL1.ATA(0) should be sufficient. Can you
try the diff I sent in the previous email and confirm that the accesses
to the allocation tag storage are blocked?

-- 
Catalin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
