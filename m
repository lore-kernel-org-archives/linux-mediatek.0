Return-Path: <SRS0=rIjB=KI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5494C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 02:53:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19D5A61417
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 02:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19D5A61417
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BOZiGNQBv/HbshalPdJ8DRIu1delfMtEb9mX+3+h9Q0=; b=gw+akNjwh23Tpuph2JwAB77FD
	DDWTwBQw12pwzob8zc0Blvi+r4aB8U8ipQtIX2sdruVnb7pgaDYO/SiPzemc91gEldC87tjtEGJiI
	+MO9JL2+DbIppjfcxDgIRazEMJjZVaFhNSOaco6SSFKBpzzpYGZWwEFzyU/EnQbBS5DRnQHl+4Zk6
	R1Uulrip5wDM9Pd0KckzF4+OXv1buUcUHm11H7laEA9LHWjKN1JMmdSlq3olZf0/khZgSp81s4dgO
	zrbo0ZjHB/uBnpEWYvlufArXuUt2Rbb2SvXEw+hQRk5eHprq+R2mIILVuyBKOimQZ2viPusGz09fm
	8gWmojr1Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lh1To-004ZHp-A3; Thu, 13 May 2021 02:53:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh1Tl-004ZHd-QR
 for linux-mediatek@desiato.infradead.org; Thu, 13 May 2021 02:53:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=DkvV/jPRPm57TuS9uX0S6v2TxWE8Q0xW72CfQJu/OlI=; b=a6eaFWIxUvTpHNYEYb0FRiMncW
 TbTZJNLXIFgGlAmdFOqsbAh4/coQ1OZWOUAAXA0QsXntA2sMHK5d2HV16dFIOYE09OnRPvkFKUmfS
 DY7qjZhEV8oyvz1T45nlDbgquxNSpxldMA8NvYdVixrv2z9mv3yJ4HyOj7eMR8S/Z73HPTgMREyef
 YHq0wPDtpBtXTdQzacOZne4WmDKDaZ8CwYdZNcoBujXglRUEiOUPuc70Iij6l+9YHPJxK/AMGMT8K
 yO78GR0V4uFfoggC1sU5JxtgD4YToccX4rDeUI7LfQPD0pUj9CWwPHEnaKk19RTBvkVhO5KhYkE0q
 ReyrACsg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh1Ti-00Aygj-DQ
 for linux-mediatek@lists.infradead.org; Thu, 13 May 2021 02:53:35 +0000
X-UUID: 22f1b0908cb642e9b821d05d294cb302-20210512
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=DkvV/jPRPm57TuS9uX0S6v2TxWE8Q0xW72CfQJu/OlI=; 
 b=ZsRhWOR7pujiM9EJy3tMvvQG+cF5tsbYsXH3shzwHjc/j/b8Ghd27ZlpKY758giRPJ2yUWMwH24XsBWqosHlniMnsoUT2AjFhFlwwcuGRaxqo2Po/Du2P9N8T9du4Ml1b7T9ufpjB5CF2P2SlyAU+Gq2ZHmspHIk1Y1NG9aIGXA=;
X-UUID: 22f1b0908cb642e9b821d05d294cb302-20210512
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1024435471; Wed, 12 May 2021 19:53:25 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 May 2021 19:53:24 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 May 2021 10:53:21 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 13 May 2021 10:53:21 +0800
Message-ID: <1620874401.21092.10.camel@mtkswgap22>
Subject: Re: [PATCH] mm/sparse: fix check_usemap_section_nr warnings
From: Miles Chen <miles.chen@mediatek.com>
To: Baoquan He <bhe@redhat.com>
CC: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <wsd_upstream@mediatek.com>, <k-hagio-ab@nec.com>
Date: Thu, 13 May 2021 10:53:21 +0800
In-Reply-To: <20210513011648.GA6776@MiWiFi-R3L-srv>
References: <20210511093114.15123-1-miles.chen@mediatek.com>
 <YJpbWVrgJFLRpzl3@kernel.org> <1620797600.14730.7.camel@mtkswgap22>
 <YJuh90iYeZ8F4Ain@kernel.org> <20210513011648.GA6776@MiWiFi-R3L-srv>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7753801D92E62CBD26FBF274B8115874F75D8956F43F6CF55697AE995F99B2F32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_195334_478987_EC73CF01 
X-CRM114-Status: GOOD (  30.67  )
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

On Thu, 2021-05-13 at 09:16 +0800, Baoquan He wrote:
> On 05/12/21 at 12:37pm, Mike Rapoport wrote:
> > On Wed, May 12, 2021 at 01:33:20PM +0800, Miles Chen wrote:
> > > On Tue, 2021-05-11 at 13:24 +0300, Mike Rapoport wrote:
> > > > On Tue, May 11, 2021 at 05:31:14PM +0800, Miles Chen wrote:
> > > > > In current implementation of node_data, if CONFIG_NEED_MULTIPLE_NODES=y,
> > > > > node_data is allocated by kzmalloc. If CONFIG_NEED_MULTIPLE_NODES=n,
> > > > > we use a global variable named "contig_page_data".
> > > > > 
> > > > > If CONFIG_DEBUG_VIRTUAL is not enabled. __pa() can handle both kzalloc and
> > > > > symbol cases. But if CONFIG_DEBUG_VIRTUAL is set, we will have the
> > > > > "virt_to_phys used for non-linear address" warning when booting.
> > > > 
> > > > Maybe we'll just allocate pgdat for CONFIG_NEED_MULTIPLE_NODES=n (which is
> > > > essentially !NUMA) case in, say, free_area_init()?
> > > 
> > > 
> > > thanks for your comment.
> > > 
> > > I check the source tree and found that contig_page_data is used by
> > > crash_core.c as a symbol. I am not familiar with crash_core but I guess
> > > allocate pgdat may break this crash_core users.
> > > 
> > > For example: some userspace scripts want to read the address of
> > > contig_page_data symbol from a corefile.
> > > 
> > > kernel/crash_core.c:460:        VMCOREINFO_SYMBOL(contig_page_data);
> > > 
> > > #ifndef CONFIG_NEED_MULTIPLE_NODES
> > >         VMCOREINFO_SYMBOL(mem_map);
> > >         VMCOREINFO_SYMBOL(contig_page_data);
> > > #endif
> > 
> > My understanding is that VMCOREINFO_SYMBOL() should correspond to actual
> > symbol. If there is no contig_page_data symbol, there is no need for
> > VMCOREINFO_SYMBOL() either.
> 
> Yeah, it's exported for makedumpfile and crash utility to parse and get
> the memory layout of the corrupted kernel. If removing it, makedumpfile
> will get it from node_data[]. Looks like a good idea to unify code for
> numa|!numa on pglist_data instances.
> 
> Add Kazu to CC since he maintain makedumpfile and Crash utilities.

thanks for adding the experts in. (I searched the source code of crash
last night and found that contig_page_data is used in memory.c)

I will move the allocation and initialization to free_area_init() and
submit patch v2.


Miles

> 
> My concern is that that only happens on arm/arm64/riscv, does it mean the
> warning is not necessary, so can be removed? Or we need to check if
> CONFIG_DEBUG_VIRTUAL doesn't work well in this case.
> 
> Thanks
> Baoquan
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
