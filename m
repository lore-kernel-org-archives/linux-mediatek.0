Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 726C6C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 15:31:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35A8660C41
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 15:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35A8660C41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QOsfEl9mCmdjn5JWHl+3PkG5IREPGkJHKHTaYy4vruU=; b=VupbciMkbKR9em
	woxlbpwizAYF4tPEdBH8jGYA2E5X67kKpJuCl4im6pLse1ANT+HPnAzd1eTL1sVUYvzCzWBk5YEJh
	QxZM0oLngInsgHHzUUMT83uFGRfPkrZ2Y4C2hDbarvBxkrIdxgYkdXhgLU66ZRsFDhTtDEtQLVBdL
	rOYuSx41gFTQ70/EBjwRdr7yPX/Vdx9T0EatRLd87EgEYrAQ4p9OPZ33yyahBh3lG5kDvHBNUqEZF
	8bLEZLR/t5WjptF3enuGwXUiu20GdkZZ4XGYs+BKXVCwzW7wkZ8JiLjSQdgR53brGSwjEpYypeK/r
	5S93xg/eOiQY85TN4OGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAZu7-00Gxqo-Fu; Mon, 02 Aug 2021 15:30:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAZts-00Gxlx-Ha; Mon, 02 Aug 2021 15:30:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7607461103;
 Mon,  2 Aug 2021 15:30:40 +0000 (UTC)
Date: Mon, 2 Aug 2021 16:30:37 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: yee.lee@mediatek.com
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
Message-ID: <20210802153036.GH18685@arm.com>
References: <20210730144957.30938-1-yee.lee@mediatek.com>
 <20210730144957.30938-2-yee.lee@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210730144957.30938-2-yee.lee@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_083044_640380_75751D27 
X-CRM114-Status: GOOD (  24.78  )
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

On Fri, Jul 30, 2021 at 10:49:53PM +0800, yee.lee@mediatek.com wrote:
> From: Yee Lee <yee.lee@mediatek.com>
> 
> For some low-end devices with limited resources,
> MTE needs to be optionally disabled to save system
> costs such as tag memory and firmware controls.

I understand the cost of using MTE but I don't fully get what you mean
by firmware controls. If the ID_AA64PFR1_EL1.MTE reports that MTE is
present, the firmware should have initialised MTE correctly (e.g. tag
allocation storage, SCR_EL3.ATA) and not rely on a kernel command line
argument that may or may not be present.

> This allows ID_AA64PFR1_EL1.MTE to be overridden on 
> its shadow value by giving "arm64.nomte" on cmdline,
> and to suppress MTE feature.
> 
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Yee Lee <yee.lee@mediatek.com>

While this patch appears to disable MTE, I don't think it can fully
prevent the access to the allocation tag storage, so the firmware must
still initialise it correctly.

The issue is that __cpu_setup already configures the MAIR_EL1 register
to use Normal Tagged memory for the kernel mapping and SCTLR_EL1.ATA is
set. The TCF field is zero, so no tag checking, but I couldn't figure
out from the ARM ARM whether this also prevents LDR/STR from attempting
to fetch the allocation tags. I think it's only the ATA bit and the MAIR
configuration.

With this patch, KASAN_HW_TAGS (if configured) won't be used and MTE
will not be presented to user applications, if that's what you want, but
does not fully disable MTE.

Since May this year, the ARM ARM was updated so that SCTLR_EL1.ATA/ATA0
are not permitted to be cached in the TLB. We could therefore move the
setting to cpu_enable_mte(). Something like below, untested (to be
folded into your patch):

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index aa53954c2f6b..cac23455a2b5 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -698,8 +698,7 @@
 	(SCTLR_ELx_M    | SCTLR_ELx_C    | SCTLR_ELx_SA   | SCTLR_EL1_SA0   | \
 	 SCTLR_EL1_SED  | SCTLR_ELx_I    | SCTLR_EL1_DZE  | SCTLR_EL1_UCT   | \
 	 SCTLR_EL1_NTWE | SCTLR_ELx_IESB | SCTLR_EL1_SPAN | SCTLR_ELx_ITFSB | \
-	 SCTLR_ELx_ATA  | SCTLR_EL1_ATA0 | ENDIAN_SET_EL1 | SCTLR_EL1_UCI   | \
-	 SCTLR_EL1_EPAN | SCTLR_EL1_RES1)
+	 ENDIAN_SET_EL1 | SCTLR_EL1_UCI  | SCTLR_EL1_EPAN | SCTLR_EL1_RES1)

 /* MAIR_ELx memory attributes (used by Linux) */
 #define MAIR_ATTR_DEVICE_nGnRnE		UL(0x00)
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9035c367d08b..23b1e3d83603 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1841,6 +1841,9 @@ static void bti_enable(const struct arm64_cpu_capabilities *__unused)
 #ifdef CONFIG_ARM64_MTE
 static void cpu_enable_mte(struct arm64_cpu_capabilities const *cap)
 {
+	sysreg_clear_set(sctlr_el1, 0, SCTLR_ELx_ATA | SCTLR_EL1_ATA0);
+	isb();
+
 	/*
 	 * Clear the tags in the zero page. This needs to be done via the
 	 * linear map which has the Tagged attribute.

-- 
Catalin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
