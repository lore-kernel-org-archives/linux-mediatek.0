Return-Path: <SRS0=452w=GM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA14DC433E0
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 10:03:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F6F621D7A
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 10:03:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F6F621D7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gUcY2YVb/tl+N34w77HDWjukDupOep2TRTnICdqvuE8=; b=WFtEUBIbmSBwnyNk6fma/1j6I
	hKqdhjV8LOMY/0bFePmSm447kGF61YAfGHWol2/SxopTZ9UhaCysex2/lkOeW7Tu7v4Rod7IjmMJC
	T/AHwCFRS/15LnXVd8MWhzljzC++O2sOL7Yxksj0/zVNdGH2ZTNjTT7/lKmszO+cOaDlIRpVbkGGt
	SGuhbrnawRcaD9Cz6FSibZnsGMvYIPQCI7OWlgQtyD9Zo7z/IAK2kO44DywIClOr5dpjsGbzREAdf
	5HlroqlnPo1ebMttl8pQVEVvW3Xoph4RpzHM2fqXvKxy63vEwrjZL/Hnm2RhRY/6S0S9wdgM4DVLY
	H91fPw3rg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyB5J-0006SI-8e; Sat, 09 Jan 2021 10:03:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyB4h-0006Du-9m; Sat, 09 Jan 2021 10:02:25 +0000
X-UUID: 889fc9dfb0ed4be2b38ae7a033678553-20210109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JnazlbcR6seBdWlhPe20IvGCa73wOyj5ud+A27+KqwY=; 
 b=gf4fDrIdPz4dz2ZNFyjNsQQlvIRIYvfdmO2UEFhXrrWLCyJ/8WzJWZ5dCU3SUkyjLXMyIXhhM4GynKEcLV1iOfQAjfnRHz+/P6x1qa7QAxq5K2JCXRYB7S/MZ91V4XcgkCg6WmmICjU4sKCHJDOrGfZIOFwGZBqWcDoiedSM7h8=;
X-UUID: 889fc9dfb0ed4be2b38ae7a033678553-20210109
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1930148808; Sat, 09 Jan 2021 02:02:19 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 9 Jan 2021 02:02:18 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 9 Jan 2021 18:02:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 9 Jan 2021 18:02:05 +0800
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: <ardb@kernel.org>
Subject: Re: [PATCH 0/3] arm64: kasan: support CONFIG_KASAN_VMALLOC
Date: Sat, 9 Jan 2021 18:02:05 +0800
Message-ID: <20210109100205.11359-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAMj1kXHFOQMV_4pYp9u9u++2jjQbHuLU95KeJTzrWXZWQTe_Tg@mail.gmail.com>
References: <CAMj1kXHFOQMV_4pYp9u9u++2jjQbHuLU95KeJTzrWXZWQTe_Tg@mail.gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210109_050224_154573_74D0EAA3 
X-CRM114-Status: GOOD (  19.96  )
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
Cc: lecopzer.chen@mediatek.com, linux-mm@kvack.org, andreyknvl@google.com,
 yj.chiang@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, lecopzer@gmail.com,
 glider@google.com, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, aryabinin@virtuozzo.com, akpm@linux-foundation.org,
 will@kernel.org, dan.j.williams@intel.com, dvyukov@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Ard,

> On Fri, 8 Jan 2021 at 19:31, Andrey Konovalov <andreyknvl@google.com> wrote:
> >
> > On Sun, Jan 3, 2021 at 6:12 PM Lecopzer Chen <lecopzer@gmail.com> wrote:
> > >
> > > Linux supports KAsan for VMALLOC since commit 3c5c3cfb9ef4da9
> > > ("kasan: support backing vmalloc space with real shadow memory")
> > >
> > > Acroding to how x86 ported it [1], they early allocated p4d and pgd,
> > > but in arm64 I just simulate how KAsan supports MODULES_VADDR in arm64
> > > by not to populate the vmalloc area except for kimg address.
> > >
> > > Test environment:
> > >     4G and 8G Qemu virt,
> > >     39-bit VA + 4k PAGE_SIZE with 3-level page table,
> > >     test by lib/test_kasan.ko and lib/test_kasan_module.ko
> > >
> > > It also works in Kaslr with CONFIG_RANDOMIZE_MODULE_REGION_FULL,
> > > but not test for HW_TAG(I have no proper device), thus keep
> > > HW_TAG and KASAN_VMALLOC mutual exclusion until confirming
> > > the functionality.
> > >
> > >
> > > [1]: commit 0609ae011deb41c ("x86/kasan: support KASAN_VMALLOC")
> > >
> > > Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> >
> > Hi Lecopzer,
> >
> > Thanks for working on this!
> >
> > Acked-by: Andrey Konovalov <andreyknvl@google.com>
> > Tested-by: Andrey Konovalov <andreyknvl@google.com>
> >
> > for the series along with the other two patches minding the nit in patch #3.
> >
> > Will, Catalin, could you please take a look at the arm changes?
> >
> > Thanks!
> >
> 
> 
> If vmalloc can now be backed with real shadow memory, we no longer
> have to keep the module region in its default location when KASLR and
> KASAN are both enabled.
> 
> So the check on line 164 in arch/arm64/kernel/kaslr.c should probably
> be updated to reflect this change.
> 

I've tested supporting module region randomized and It looks fine
in some easy test(insmod some modules).

I'll add this to patch v2, thanks for your suggestion.

BRs,
Lecopzer
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
