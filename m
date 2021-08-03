Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74434C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 15:49:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3063B60EFD
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 15:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3063B60EFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MYvRI6Aq/1+IfrGHRMBlanHLA8Ce49E3GIS0mVtMSLs=; b=NlovZu6H/CugQa
	VRVYMhX1G0aduGJDmvqTtdc98HK6kC/uxaATVTaiq5+aNkUsvlHKMGsCS4eOGghbzM+5lq18xuZzU
	JmlcawnUgrUb8DlrqjUlD9XVNJv6+r4yIqGmoxVsS2EaOia+COT5wL+STkjRm63+790Hl6v8+ItMM
	9/XuB29m3vQzMZCo10scU9X58icmaKB8gBBVXRSkX58VUYzEPACkpDKDJTUhUVBoQaKPLbsr3RB4d
	qvElBf3AHtsLeCj2eMiNqVVm4D5aE1MMY52+v/wT2XwVA4eNBwCcsXRCuLP9i63M25b1zCe+P3pTN
	LAwYr/LR0fuCOPs9xMPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAwey-003RyB-KC; Tue, 03 Aug 2021 15:48:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAwek-003RtZ-MT; Tue, 03 Aug 2021 15:48:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E72BE60EFD;
 Tue,  3 Aug 2021 15:48:33 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-kernel@vger.kernel.org,
	yee.lee@mediatek.com
Cc: Will Deacon <will@kernel.org>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>, 
 Peter Zijlstra <peterz@infradead.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Kuan-Ying.lee@mediatek.com,
 James Morse <james.morse@arm.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Hector Martin <marcan@marcan.st>, Jonathan Corbet <corbet@lwn.net>,
 Randy Dunlap <rdunlap@infradead.org>, chinwen.chang@mediatek.com,
 Vlastimil Babka <vbabka@suse.cz>,
 Amit Daniel Kachhap <amit.kachhap@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 David Brazdil <dbrazdil@google.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Fuad Tabba <tabba@google.com>, Marc Zyngier <maz@kernel.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, nicholas.Tang@mediatek.com
Subject: Re: [PATCH v4 1/1] arm64/cpufeature: Optionally disable MTE via
 command-line
Date: Tue,  3 Aug 2021 16:48:27 +0100
Message-Id: <162800569298.22283.5858826672578810642.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210803070824.7586-2-yee.lee@mediatek.com>
References: <20210803070824.7586-1-yee.lee@mediatek.com>
 <20210803070824.7586-2-yee.lee@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_084838_788837_5B300CF3 
X-CRM114-Status: GOOD (  10.50  )
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

On Tue, 3 Aug 2021 15:08:22 +0800, yee.lee@mediatek.com wrote:
> MTE support needs to be optionally disabled in runtime
> for HW issue workaround, FW development and some
> evaluation works on system resource and performance.
> 
> This patch makes two changes:
> (1) moves init of tag-allocation bits(ATA/ATA0) to
> cpu_enable_mte() as not cached in TLB.
> 
> [...]

Applied to arm64 (for-next/mte), thanks!

[1/1] arm64/cpufeature: Optionally disable MTE via command-line
      https://git.kernel.org/arm64/c/7a062ce31807

-- 
Catalin


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
