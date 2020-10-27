Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32BFDC388F9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 07:52:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6E49206F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 07:52:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0/LLzFFO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="R7cJRV9e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6E49206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nMyITXEq0BGpK5oSNlTgFXL9PUIKVilXmycb2NO2lRo=; b=0/LLzFFO/L1c35ecexHc4so5L
	CMgXFqMsuN060mwzo1aaUNj2ucCXgeu/VZ7N1IRapATsHHCjSQj1UtcUB3KSGs6cmaJ0OTLqSQs2M
	XobNXOQesIzykR2fwkB1EZvXnuWYw9xjSarDE0iT1osWPAbiRKAwtzBtLYEsT9qSIqQTGBtxUTgbr
	quZ12cHh9xSQoXl7Afa95CFrdEcb5s0XLLzuE7q3ey1dMWB7yHUnMeuBA1D4o50qdRDdYqxGrg0TY
	Ten+M4ngeixSJTN2tFFTU3KjTHz0H0yOLgrw1VJp5pxwEwM1GXIkW3FzN7iDoK+JMPTn3uEFS/O/j
	Q2yI7LpjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXJmD-0005ud-0m; Tue, 27 Oct 2020 07:52:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXJm2-0005rR-Ih; Tue, 27 Oct 2020 07:52:11 +0000
X-UUID: 94f7586da0d34100a887528930803085-20201026
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=aGt6QInp83VuseH7EJv5vbzqb7DasMCsQr38Kz5cgVA=; 
 b=R7cJRV9eyeUuH1jt+Xwoc9i9vYGTsPhsGmst7AzAUfnPSAqVHLm+jNXw0wX1v5mVCRFp4Hr9jfjrIl6xSjBij37rnJkIZgLpjRXQIjx5XH3W+WoHUTWJLWZPXgslmlOXHTpOFb0tP4wK0tFUPh7I0Q0yT10JAEyFPb/7VwbLRkQ=;
X-UUID: 94f7586da0d34100a887528930803085-20201026
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 326152629; Mon, 26 Oct 2020 23:52:00 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Oct 2020 00:45:34 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Oct 2020 15:45:11 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 27 Oct 2020 15:45:11 +0800
Message-ID: <1603784712.12492.5.camel@mtkswgap22>
Subject: Re: [PATCH v2 3/4] arm: mm: introduce L_PTE_SPECIAL
From: Miles Chen <miles.chen@mediatek.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Date: Tue, 27 Oct 2020 15:45:12 +0800
In-Reply-To: <20201023100810.GY1551@shell.armlinux.org.uk>
References: <20201023091437.8225-1-miles.chen@mediatek.com>
 <20201023091437.8225-4-miles.chen@mediatek.com>
 <20201023100810.GY1551@shell.armlinux.org.uk>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_035206_907209_54D8873A 
X-CRM114-Status: GOOD (  23.08  )
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

On Fri, 2020-10-23 at 11:08 +0100, Russell King - ARM Linux admin wrote:
> On Fri, Oct 23, 2020 at 05:14:36PM +0800, Miles Chen wrote:
> > From: Minchan Kim <minchan@kernel.org>
> > 
> > This patch introduces L_PTE_SPECIAL and pte functions for supporting
> > get_user_pages_fast.
> > 
> > Cc: Russell King <linux@armlinux.org.uk>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will.deacon@arm.com>
> > Cc: Steve Capper <steve.capper@linaro.org>
> > Cc: Minchan Kim <minchan@kernel.org>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Signed-off-by: Minchan Kim <minchan@kernel.org>
> > Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> > ---
> >  arch/arm/Kconfig                      |  4 ++--
> >  arch/arm/include/asm/pgtable-2level.h |  1 +
> >  arch/arm/include/asm/pgtable-3level.h |  6 ------
> >  arch/arm/include/asm/pgtable.h        | 13 +++++++++++++
> >  4 files changed, 16 insertions(+), 8 deletions(-)
> > 
> > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> > index c18fa9d382b7..1f75864b7c7a 100644
> > --- a/arch/arm/Kconfig
> > +++ b/arch/arm/Kconfig
> > @@ -13,7 +13,7 @@ config ARM
> >  	select ARCH_HAS_KCOV
> >  	select ARCH_HAS_MEMBARRIER_SYNC_CORE
> >  	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
> > -	select ARCH_HAS_PTE_SPECIAL if ARM_LPAE
> > +	select ARCH_HAS_PTE_SPECIAL if (ARM_LPAE || CPU_V7 || CPU_V6 || CPUV6K)
> >  	select ARCH_HAS_PHYS_TO_DMA
> >  	select ARCH_HAS_SETUP_DMA_OPS
> >  	select ARCH_HAS_SET_MEMORY
> > @@ -82,7 +82,7 @@ config ARM
> >  	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
> >  	select HAVE_EFFICIENT_UNALIGNED_ACCESS if (CPU_V6 || CPU_V6K || CPU_V7) && MMU
> >  	select HAVE_EXIT_THREAD
> > -	select HAVE_FAST_GUP if ARM_LPAE
> > +	select HAVE_FAST_GUP if (ARM_LPAE || CPU_V7 || CPU_V6 || CPUV6K)
> >  	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
> >  	select HAVE_FUNCTION_GRAPH_TRACER if !THUMB2_KERNEL && !CC_IS_CLANG
> >  	select HAVE_FUNCTION_TRACER if !XIP_KERNEL
> > diff --git a/arch/arm/include/asm/pgtable-2level.h b/arch/arm/include/asm/pgtable-2level.h
> > index cdcd55cca37d..385e7a32394e 100644
> > --- a/arch/arm/include/asm/pgtable-2level.h
> > +++ b/arch/arm/include/asm/pgtable-2level.h
> > @@ -117,6 +117,7 @@
> >  #define L_PTE_VALID		(_AT(pteval_t, 1) << 0)		/* Valid */
> >  #define L_PTE_PRESENT		(_AT(pteval_t, 1) << 0)
> >  #define L_PTE_YOUNG		(_AT(pteval_t, 1) << 1)
> > +#define L_PTE_SPECIAL		(_AT(pteval_t, 1) << 5)
> 
> How does this work?  Bits 2 through 5 are already in use for the memory
> type.
> 
> Repurposing this bit means that L_PTE_MT_DEV_NONSHARED,
> L_PTE_MT_DEV_WC, L_PTE_MT_DEV_CACHED and L_PTE_MT_VECTORS clash with
> it.

Thanks for the comment.
The idea is to re-order the memory type table in [1] (patch v2/4) and
use bit 5 for L_PTE_SPECIAL.

[1] https://lore.kernel.org/patchwork/patch/1323893/


Miles
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
