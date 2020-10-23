Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B33DC388F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 10:17:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A004424182
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 10:16:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mmo/Io+c";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="0r39HtvR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A004424182
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RYw88taPRVZb0rfTg0i0dMGIigpoQmSeBSxHs1Xvd88=; b=Mmo/Io+ceafpXlWHA/3FnLXCi
	c57lK0tNOyem1U0EvlLxbZPAgbQxV0VDojg7X3T+ycRJn3ii0+JlZ3Adz6Tr4oZe9eh/4xjyctHM1
	QXC13GkG6vsbpHfO3khxQ2MO+pVVY/S4ii6jKNJrrhBVxbwxnpI+mVsfmKSu7kUx+Ukes2sqQX8Mk
	dMz0BIkGzlAGo7VwL/YN1LF1csP6eVKI+R3C6kOVJJNP8m5vaGbVi2GMgr64mgbqRKbpWxUdwpuHR
	ZKV2tIh92kjFIzLWKrh7Ljbl8csCQhXEgSJj8tV/VXH5bTQqbNKgg9FQW0UyCdNLGzQHuPZubaec6
	4IY4eDkUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVu7v-0002GS-PO; Fri, 23 Oct 2020 10:16:51 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVu7r-0002FY-AD; Fri, 23 Oct 2020 10:16:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u6Dt4eNB9uo93oxRYc8MfzJ3qNz/BQ4UPg0GgCDWsm0=; b=0r39HtvR8ZB+QTz2zzG67pEFd
 dFAPK/XpPLUpDvn3JFW1gqHAObbTmkOYOSlWOJHlgFnqP+pdyzzMJnSbr9aZ2s6A+Ukos/9KujyD/
 PnGRbPAJPY5gyQDZsCUSj10NZiao/46Ds9xMTZOg5CT9DoYqcfKK1dWIW1B2tixzzvJSQ5Gk8nMSH
 3h8kDACleJFEKadbOzI6JjqUkfk1TQyVARDGf+GzUt2Fw/YYTWcGJ1R6VaM97OdKUqa1weh/gAYOg
 L5E+nAHf6QR6j9c1bvRNJICXPsross/qxHCmiwz7Qpy/mJI01cYIczQTMkkMzwoFp0Eia2Hy1UTYM
 EbjZidWFg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49924)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1kVu7m-0003Hh-PE; Fri, 23 Oct 2020 11:16:42 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1kVu7k-0008MT-R3; Fri, 23 Oct 2020 11:16:40 +0100
Date: Fri, 23 Oct 2020 11:16:40 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH v2 2/4] arm: mm: reordering memory type table
Message-ID: <20201023101640.GA1551@shell.armlinux.org.uk>
References: <20201023091437.8225-1-miles.chen@mediatek.com>
 <20201023091437.8225-3-miles.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201023091437.8225-3-miles.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_061647_391489_82A0EDA4 
X-CRM114-Status: GOOD (  25.07  )
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
 Simon Horman <horms@verge.net.au>, linux-mediatek@lists.infradead.org,
 Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Oct 23, 2020 at 05:14:35PM +0800, Miles Chen wrote:
> From: Minchan Kim <minchan@kernel.org>
> 
> To use bit 5 in page table as L_PTE_SPECIAL, we need a room for that.
> It seems we don't need 4 bits for the memory type with ARMv6+.
> If it's true, let's reorder bits to make bit 5 free.
> 
> We will use the bit for L_PTE_SPECIAL in next patch.
> 
> A note from Catalin in [1]:
> "
> > Anyway, on ARMv7 or ARMv6+LPAE, the non-shared device gets mapped to
> > shared device in hardware. Looking through the arm32 code, it seems that
> > MT_DEVICE_NONSHARED is used by arch/arm/mach-shmobile/setup-r8a7779.c
> > and IIUC that's a v7 platform (R-Car H1, Cortex-A9). I think the above
> > should be defined to L_PTE_MT_DEV_SHARED, unless I miss any place where
> > DEV_NONSHARED is relevant on ARMv6 (adding Simon to confirm on shmbile).
> "
> 
> [1] https://lore.kernel.org/patchwork/patch/986574/
> 
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Steve Capper <steve.capper@linaro.org>
> Cc: Simon Horman <horms@verge.net.au>
> Cc: Minchan Kim <minchan@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: Minchan Kim <minchan@kernel.org>
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> ---
>  arch/arm/include/asm/pgtable-2level.h | 21 +++++++++++++++++----
>  arch/arm/mm/proc-macros.S             |  4 ++--
>  2 files changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/include/asm/pgtable-2level.h b/arch/arm/include/asm/pgtable-2level.h
> index 27a8635abea0..cdcd55cca37d 100644
> --- a/arch/arm/include/asm/pgtable-2level.h
> +++ b/arch/arm/include/asm/pgtable-2level.h
> @@ -161,14 +161,27 @@
>  #define L_PTE_MT_BUFFERABLE	(_AT(pteval_t, 0x01) << 2)	/* 0001 */
>  #define L_PTE_MT_WRITETHROUGH	(_AT(pteval_t, 0x02) << 2)	/* 0010 */
>  #define L_PTE_MT_WRITEBACK	(_AT(pteval_t, 0x03) << 2)	/* 0011 */
> +#define L_PTE_MT_DEV_SHARED	(_AT(pteval_t, 0x04) << 2)	/* 0100 */
> +#define L_PTE_MT_VECTORS	(_AT(pteval_t, 0x05) << 2)	/* 0101 */
>  #define L_PTE_MT_MINICACHE	(_AT(pteval_t, 0x06) << 2)	/* 0110 (sa1100, xscale) */
>  #define L_PTE_MT_WRITEALLOC	(_AT(pteval_t, 0x07) << 2)	/* 0111 */
> -#define L_PTE_MT_DEV_SHARED	(_AT(pteval_t, 0x04) << 2)	/* 0100 */
> -#define L_PTE_MT_DEV_NONSHARED	(_AT(pteval_t, 0x0c) << 2)	/* 1100 */

Sorry, no, this isn't going to work.

The lower two bits of this (bits 2 and 3) are explicitly designed to fit
the C and B bits used in older architectures. Changing L_PTE_MT_VECTORS
from having value '11' to '01' changes the functionality on older CPUs.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
