Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C5AC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 16:51:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F0CB61920
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 16:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F0CB61920
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AMi/EidbdMMVnMaFmWOWdpPz8XxtQZQYiHjoMKm6Y4s=; b=iXdYVjP/hsnY95SpEG8lmZzN2
	RjZM8NjJNVETo/wrMAMhh2wauGfLVsC5e/FeRPYeb6bfHo3yQdnC7bh9v3WED0cM+tCnf0pjrLuxC
	n116JwX5CzMrTHHZY4b5FkVoBNrgdNeq/mCFQmwkbrEpWLJiKbUJ1eUeNGGChsqSeG4vol1zx8PJu
	XrhzqrCAhL9NOEOUQpyMWkP9Q2XFXKw5KqEmqe1YnqvILoUI7v9sDIRRyKCQS3kA7ZObo4NvfwZS/
	HuXrjPZ6qvTaosknEN1TJ1dVL2vcykf7VRfzLl+uc9+xbmFlwEKPAIdMjVE7Gh9Izi0ORNeERi6xd
	zZIP2lRTg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQv6t-000nBX-5G; Mon, 29 Mar 2021 16:51:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQodi-000Yk5-IV; Mon, 29 Mar 2021 09:56:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=GUbqVBX4TX1euc8vfr2F+rCr7To70JD6Vde9/kTqfuw=; b=BpD0tfFAGPOm2RIyIW24Kbzcjr
 rS3Ytj3/wCER1vtg9Tc4meCRe33Mx4KRpVLtk3TTCeNYJR2B2J93LQ9csvDeWJuSpj/B3NgGuXHx5
 axMHaeI0NIzqOgQLDi1nmVLGW5mwha2gysvoFoFlsEwOhNaTqhGdnaN7J5V3KSdhj1oAUAV+roTam
 s8YPhM66THFa1+J3S3qjvMj39kXTquKIFL/BAbnOZEYTvO9RF10s3Lcu/akvnpH78WJToZUl1QM0J
 wUT6FNhT2/CK4Mvpm+HLZFy12VqPwR4eXzSGZdOW2Hd76AKeg3dxYSU6Sa668EvSbnJqYH4gpdWKr
 ALk1o/6A==;
Received: from elvis.franken.de ([193.175.24.41])
 by casper.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lQoE7-001KKh-10; Mon, 29 Mar 2021 09:30:49 +0000
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1lQoE1-0003qb-05; Mon, 29 Mar 2021 11:30:21 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 1E866C1D90; Mon, 29 Mar 2021 11:26:07 +0200 (CEST)
Date: Mon, 29 Mar 2021 11:26:07 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Chuanhong Guo <gch981213@gmail.com>
Subject: Re: [PATCH 2/2] MIPS: ralink: mt7621: add memory detection support
Message-ID: <20210329092607.GE8484@alpha.franken.de>
References: <20210327053840.471155-1-ilya.lipnitskiy@gmail.com>
 <20210327053840.471155-2-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210327053840.471155-2-ilya.lipnitskiy@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_103030_047017_83B9C3DD 
X-CRM114-Status: GOOD (  16.91  )
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

On Fri, Mar 26, 2021 at 10:38:40PM -0700, Ilya Lipnitskiy wrote:
> From: Chuanhong Guo <gch981213@gmail.com>
> 
> mt7621 has the following memory map:
> 0x0-0x1c000000: lower 448m memory
> 0x1c000000-0x2000000: peripheral registers
> 0x20000000-0x2400000: higher 64m memory
> 
> detect_memory_region in arch/mips/kernel/setup.c only adds the first
> memory region and isn't suitable for 512m memory detection because
> it may accidentally read the memory area for peripheral registers.
> 
> This commit adds memory detection capability for mt7621:
>   1. Add the highmem area when 512m is detected.
>   2. Guard memcmp from accessing peripheral registers:
>      This only happens when a user decided to change kernel load address
>      to 256m or higher address. Since this is a quite unusual case, we
>      just skip 512m testing and return 256m as memory size.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> [Minor commit message reword, make mt7621_memory_detect static]
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> ---
>  arch/mips/include/asm/mach-ralink/mt7621.h |  7 +++---
>  arch/mips/ralink/common.h                  |  1 +
>  arch/mips/ralink/mt7621.c                  | 29 +++++++++++++++++++---
>  arch/mips/ralink/of.c                      |  2 ++
>  4 files changed, 32 insertions(+), 7 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
