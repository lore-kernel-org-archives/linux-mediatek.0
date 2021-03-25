Return-Path: <SRS0=z/aX=IX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA083C433C1
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 10:03:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65BC861A02
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 10:03:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65BC861A02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=heVFiBtQ+qU6QVqwFNLaO0sxh5JDppfMED/iV1/gaCo=; b=Php2nfQYlU4PktPfVCU15Y2li
	wtrCg6sAPA9Y0kKavcq9ftEh2YLqhEo/tMennLyEtvVxm/vwgpCLyiib3jgzDPiiri7TQLJslh1S4
	/uliwXJnIDYrw/5YNe7ZXtOMwtGTGKmZzDKK4mt+8emIOwfCEYX7UjnBYthq4n6KBQKkzCz2SG+lp
	j4MAM1wvDbM7nAy3FSHP/PSzDi5kzdoxHCj94dwN8TuJacjuy8hgZv1uIz7RGJzc4IuF+lALZKR1n
	8Ko/ti2lFCpMSYxFf7EQl2wqp+oy6+azpX4VssNCg0WetW8e1byxYdSV4+j5+VGSEmavfXkU/2vCJ
	FbfJiAVLQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPMpI-001B8k-Kv; Thu, 25 Mar 2021 10:02:56 +0000
Received: from elvis.franken.de ([193.175.24.41])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lPMne-001B2Y-Og; Thu, 25 Mar 2021 10:01:50 +0000
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1lPMnd-00074f-00; Thu, 25 Mar 2021 11:01:09 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 10399C1C6A; Thu, 25 Mar 2021 10:55:30 +0100 (CET)
Date: Thu, 25 Mar 2021 10:55:29 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Chuanhong Guo <gch981213@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: ralink: mt7621: add memory detection support
Message-ID: <20210325095529.GA5775@alpha.franken.de>
References: <20210317055902.506773-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210317055902.506773-1-ilya.lipnitskiy@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_100148_258309_879D8A66 
X-CRM114-Status: GOOD (  16.06  )
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

On Tue, Mar 16, 2021 at 10:59:02PM -0700, Ilya Lipnitskiy wrote:
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
> [...]

I get

WARNING: modpost: vmlinux.o(.text+0x132c): Section mismatch in reference from the function prom_soc_init() to the function .init.text:mt7621_memory_detect()
The function prom_soc_init() references
the function __init mt7621_memory_detect().
This is often because prom_soc_init lacks a __init 
annotation or the annotation of mt7621_memory_detect is wrong.

Can you please fix this ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
