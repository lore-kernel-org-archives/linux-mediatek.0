Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7C5AC4363A
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 08:04:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E5E0207BB
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 08:04:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h3LKeG9w";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kkXTjUIK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E5E0207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aGYih0AOZBQBrqdpZSV4GcV+D5E8sj9gsghz/WHR7LE=; b=h3LKeG9wKJPaZxWrfRk59YhA7
	YXtCPhKEaQBLWuh/5eT/njtjy8Dhos+qpikI16e27dBJAQcDAWhEa0u94qxsIXPeYjN8NeeyVX23G
	PmoZNHfmINACq+kzKgEYcvrDCzGZzenv8ch7YhpREymNXdund4JHcxSnqFHOFSEjXtd8qSQPaIaeJ
	2kdATRtWuwHA2TyZy0jUxSGqRnndmIledxATvNcFWOPulv6FnBWgDVzhWQhafTvF9kwAJ2zcB/MsX
	4lBH+QolUbisKqTWiCd8IKnCA0qBHVpOQhigHq5nYGGzXAVX8DVTrzm7wlY3YA/741Z+pJkpGHI1b
	klEms87lA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXJxX-0007JJ-BA; Tue, 27 Oct 2020 08:03:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXJxT-0007Hu-Mc; Tue, 27 Oct 2020 08:03:57 +0000
X-UUID: df790220eafc403ca9cefce440529bb1-20201027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=JyBsc+Y4sIJPtk0rE227nArOS2YDqslqxM8kl64ZCIc=; 
 b=kkXTjUIK0rGUK7P6ezJ+4KrgcWlLSccGSZ/OPX+QQxrrPcexsxKzt5zM8PzvvslSsP50fJyLfIK3WC003Yp+8h66D9fspD8Lu+UykEDCRM0sPTqB+IkEoN359mrr9dxHDaz3G4B+GcVNIuEJxxpaM8gY+5awywmDT+aKmUaO5kQ=;
X-UUID: df790220eafc403ca9cefce440529bb1-20201027
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2060379035; Tue, 27 Oct 2020 00:03:53 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Oct 2020 01:03:51 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Oct 2020 16:03:43 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 27 Oct 2020 16:03:43 +0800
Message-ID: <1603785824.12492.11.camel@mtkswgap22>
Subject: Re: [PATCH v2 2/4] arm: mm: reordering memory type table
From: Miles Chen <miles.chen@mediatek.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Date: Tue, 27 Oct 2020 16:03:44 +0800
In-Reply-To: <20201023101640.GA1551@shell.armlinux.org.uk>
References: <20201023091437.8225-1-miles.chen@mediatek.com>
 <20201023091437.8225-3-miles.chen@mediatek.com>
 <20201023101640.GA1551@shell.armlinux.org.uk>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_040356_014961_2F5E2765 
X-CRM114-Status: GOOD (  30.18  )
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
 Simon Horman <horms@verge.net.au>, linux-mediatek@lists.infradead.org, Suren
 Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-10-23 at 11:16 +0100, Russell King - ARM Linux admin wrote:
> On Fri, Oct 23, 2020 at 05:14:35PM +0800, Miles Chen wrote:
> > From: Minchan Kim <minchan@kernel.org>
> > 
> > To use bit 5 in page table as L_PTE_SPECIAL, we need a room for that.
> > It seems we don't need 4 bits for the memory type with ARMv6+.
> > If it's true, let's reorder bits to make bit 5 free.
> > 
> > We will use the bit for L_PTE_SPECIAL in next patch.
> > 
> > A note from Catalin in [1]:
> > "
> > > Anyway, on ARMv7 or ARMv6+LPAE, the non-shared device gets mapped to
> > > shared device in hardware. Looking through the arm32 code, it seems that
> > > MT_DEVICE_NONSHARED is used by arch/arm/mach-shmobile/setup-r8a7779.c
> > > and IIUC that's a v7 platform (R-Car H1, Cortex-A9). I think the above
> > > should be defined to L_PTE_MT_DEV_SHARED, unless I miss any place where
> > > DEV_NONSHARED is relevant on ARMv6 (adding Simon to confirm on shmbile).
> > "
> > 
> > [1] https://lore.kernel.org/patchwork/patch/986574/
> > 
> > Cc: Russell King <linux@armlinux.org.uk>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will.deacon@arm.com>
> > Cc: Steve Capper <steve.capper@linaro.org>
> > Cc: Simon Horman <horms@verge.net.au>
> > Cc: Minchan Kim <minchan@kernel.org>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Signed-off-by: Minchan Kim <minchan@kernel.org>
> > Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> > ---
> >  arch/arm/include/asm/pgtable-2level.h | 21 +++++++++++++++++----
> >  arch/arm/mm/proc-macros.S             |  4 ++--
> >  2 files changed, 19 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/arm/include/asm/pgtable-2level.h b/arch/arm/include/asm/pgtable-2level.h
> > index 27a8635abea0..cdcd55cca37d 100644
> > --- a/arch/arm/include/asm/pgtable-2level.h
> > +++ b/arch/arm/include/asm/pgtable-2level.h
> > @@ -161,14 +161,27 @@
> >  #define L_PTE_MT_BUFFERABLE	(_AT(pteval_t, 0x01) << 2)	/* 0001 */
> >  #define L_PTE_MT_WRITETHROUGH	(_AT(pteval_t, 0x02) << 2)	/* 0010 */
> >  #define L_PTE_MT_WRITEBACK	(_AT(pteval_t, 0x03) << 2)	/* 0011 */
> > +#define L_PTE_MT_DEV_SHARED	(_AT(pteval_t, 0x04) << 2)	/* 0100 */
> > +#define L_PTE_MT_VECTORS	(_AT(pteval_t, 0x05) << 2)	/* 0101 */
> >  #define L_PTE_MT_MINICACHE	(_AT(pteval_t, 0x06) << 2)	/* 0110 (sa1100, xscale) */
> >  #define L_PTE_MT_WRITEALLOC	(_AT(pteval_t, 0x07) << 2)	/* 0111 */
> > -#define L_PTE_MT_DEV_SHARED	(_AT(pteval_t, 0x04) << 2)	/* 0100 */
> > -#define L_PTE_MT_DEV_NONSHARED	(_AT(pteval_t, 0x0c) << 2)	/* 1100 */
> 
> Sorry, no, this isn't going to work.
> 
> The lower two bits of this (bits 2 and 3) are explicitly designed to fit
> the C and B bits used in older architectures. Changing L_PTE_MT_VECTORS
> from having value '11' to '01' changes the functionality on older CPUs.
> 

thanks for the comment.

Is is possible to find other order to fit this? e.g.,

+#define L_PTE_MT_VECTORS	(_AT(pteval_t, 0x07) << 2)	/* 0111 */

#define L_PTE_MT_WRITEALLOC	(_AT(pteval_t, 0x05) << 2)	/* 0101 */

or only allow this types for the new CPUs?


Miles
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
