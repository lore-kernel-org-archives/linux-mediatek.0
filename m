Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C283CC388F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 10:08:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18BA920874
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 10:08:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L2eqGvXY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="zy/rP3W8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18BA920874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jqQBlcL7H0jpTQUP/qp1B/6dC6vXMqcFsuE8Enn+HjA=; b=L2eqGvXYKG6D+V8/ycS82tuzV
	YLqRbiSz/29ATDr7f5KgXCsRyT44YXYR3vKi3fc0dWk7LSzmtsbcjCYjsjGv8OoZng6QXON+2TUML
	b9bJwW4M1RDKSMr3ZZgy7wizJ7p/fodJHZ2iyo2tujRQ7lw9VVcFEuGxBC4FFXV5kT8cjK+fIbAYX
	1FB2H2vD1Fo2TMkh8Txv//UUoRfFRU1sdms+cTjnqdq9XuDgmqOAeF8+Z9kENXn47klKaorHF2yTq
	Id0q0ec7B9L1CnnET6COI/KQbwDtwt0k4Fz9VK/65p4ONVNP4ygWJHcLSQSa4rZNUm2nQJ/A2B8I8
	FnUUmnaEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVtzl-0000zO-F0; Fri, 23 Oct 2020 10:08:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVtzh-0000yc-2Z; Fri, 23 Oct 2020 10:08:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FCMu17GKL3SVbRY42WZqlRD8EE43zhJfJQWsX4JtRSw=; b=zy/rP3W8k2zB2e+ib5aUr7OVu
 hYHQ11edwlCmCqSX7E5Br7LYx9ymLD8vDqt0Yp5sIXmgiPEFbtQGib6ImDLcp54WY0pgdSIx03OW9
 j18jwFW+qnOPM9LRvFPa+NfEdkSOWe8X+Ar6JRvLKooJ9j3/+VkRTGJILcR4+OXnw0IZAxKU0eW1D
 LdaqpkM0hnPQqa1Y4GF/+ctbvGsAgz7usOMF87KbXQCa01pJKQvICW03TnNIUbLcDFJmaBPq/P5eC
 ZB0g2esjo2ch9p97XCv6Xrr2arp81wDQzXgFK4Z+YyyzloqTdQsDjbS1H/ozU5vUVSn5VEH472ieR
 5u64fBZ9Q==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49920)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1kVtzZ-0003Gk-N8; Fri, 23 Oct 2020 11:08:13 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1kVtzW-0008LM-Go; Fri, 23 Oct 2020 11:08:10 +0100
Date: Fri, 23 Oct 2020 11:08:10 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH v2 3/4] arm: mm: introduce L_PTE_SPECIAL
Message-ID: <20201023100810.GY1551@shell.armlinux.org.uk>
References: <20201023091437.8225-1-miles.chen@mediatek.com>
 <20201023091437.8225-4-miles.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201023091437.8225-4-miles.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_060821_566001_730A0F68 
X-CRM114-Status: GOOD (  17.83  )
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
Cc: Steve Capper <steve.capper@linaro.org>, wsd_upstream@mediatek.com,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
 linux-mediatek@lists.infradead.org, Suren Baghdasaryan <surenb@google.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Oct 23, 2020 at 05:14:36PM +0800, Miles Chen wrote:
> From: Minchan Kim <minchan@kernel.org>
> 
> This patch introduces L_PTE_SPECIAL and pte functions for supporting
> get_user_pages_fast.
> 
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Steve Capper <steve.capper@linaro.org>
> Cc: Minchan Kim <minchan@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: Minchan Kim <minchan@kernel.org>
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> ---
>  arch/arm/Kconfig                      |  4 ++--
>  arch/arm/include/asm/pgtable-2level.h |  1 +
>  arch/arm/include/asm/pgtable-3level.h |  6 ------
>  arch/arm/include/asm/pgtable.h        | 13 +++++++++++++
>  4 files changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index c18fa9d382b7..1f75864b7c7a 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -13,7 +13,7 @@ config ARM
>  	select ARCH_HAS_KCOV
>  	select ARCH_HAS_MEMBARRIER_SYNC_CORE
>  	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
> -	select ARCH_HAS_PTE_SPECIAL if ARM_LPAE
> +	select ARCH_HAS_PTE_SPECIAL if (ARM_LPAE || CPU_V7 || CPU_V6 || CPUV6K)
>  	select ARCH_HAS_PHYS_TO_DMA
>  	select ARCH_HAS_SETUP_DMA_OPS
>  	select ARCH_HAS_SET_MEMORY
> @@ -82,7 +82,7 @@ config ARM
>  	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
>  	select HAVE_EFFICIENT_UNALIGNED_ACCESS if (CPU_V6 || CPU_V6K || CPU_V7) && MMU
>  	select HAVE_EXIT_THREAD
> -	select HAVE_FAST_GUP if ARM_LPAE
> +	select HAVE_FAST_GUP if (ARM_LPAE || CPU_V7 || CPU_V6 || CPUV6K)
>  	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
>  	select HAVE_FUNCTION_GRAPH_TRACER if !THUMB2_KERNEL && !CC_IS_CLANG
>  	select HAVE_FUNCTION_TRACER if !XIP_KERNEL
> diff --git a/arch/arm/include/asm/pgtable-2level.h b/arch/arm/include/asm/pgtable-2level.h
> index cdcd55cca37d..385e7a32394e 100644
> --- a/arch/arm/include/asm/pgtable-2level.h
> +++ b/arch/arm/include/asm/pgtable-2level.h
> @@ -117,6 +117,7 @@
>  #define L_PTE_VALID		(_AT(pteval_t, 1) << 0)		/* Valid */
>  #define L_PTE_PRESENT		(_AT(pteval_t, 1) << 0)
>  #define L_PTE_YOUNG		(_AT(pteval_t, 1) << 1)
> +#define L_PTE_SPECIAL		(_AT(pteval_t, 1) << 5)

How does this work?  Bits 2 through 5 are already in use for the memory
type.

Repurposing this bit means that L_PTE_MT_DEV_NONSHARED,
L_PTE_MT_DEV_WC, L_PTE_MT_DEV_CACHED and L_PTE_MT_VECTORS clash with
it.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
