Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2280BC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 05:31:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D708D60F10
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 05:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D708D60F10
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X2gzVva8sQbSt3aQThB1yie8FZuUuyFDiG16i/qbiPM=; b=bpTdFWre9XqfOB
	bAb1OEtg6C7A4ojzOPwcIgY/dGeEQH7htWBaxBRtQ24XPU4EW+xl/DpdmV0BuvqQ1pOF71eOhtK/o
	BiD24CEH6vapzcZgkqoyXg7hRMr3C4/3wYzS2tPRKxSckfjipvkK3/dUXj6CYXXgY23ohFehUq1Qg
	/9gLTiuVoPTlGSzRh2xyKSQzL/6XaxyJ8cJ9rC9bJiF1e3WKDOmN/qoh09MPyzdo0GDPnM0l50K3e
	T7l9MpYtRkc7IRw9cy7NaZUQiHv2dfrFENVXYykp1jIb/JzN4/aCLLFe6nA4K+T/XsQMwZpgkYbcx
	b/Q+C2wbxgU+FT03D+Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mB9V1-004tp9-Sf; Wed, 04 Aug 2021 05:31:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mB9Up-004tnn-9a; Wed, 04 Aug 2021 05:31:16 +0000
X-UUID: 9484f596abef43aaa9a9d5c0e9822622-20210803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=nbXYjxVU9fU2eATKlueXsHPNx3eT6r3T8BtKOjcV62g=; 
 b=mFjAanG1rh7tYIHOmzFL1ww1AWqbE5OSDhfgjbm0wj9iDsD/L0WlIY74j1ch6Ta5PB/4G2Sx7Q0NT8h0P/a+8KPbQExMWYbr4UconeimS9ymV/t0Hf1vsQ6pUWVitBt7y2mQudTvnyiR0g6I1S5w5FkWCXZ8XbgPLo93Crw5320=;
X-UUID: 9484f596abef43aaa9a9d5c0e9822622-20210803
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1751798495; Tue, 03 Aug 2021 22:31:11 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 22:31:09 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 Aug 2021 13:31:08 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 4 Aug 2021 13:31:08 +0800
Message-ID: <bbba73eb31ac508792d2b8e0971229f3660e7847.camel@mediatek.com>
Subject: Re: [PATCH 1/2] kasan, mm: reset tag when access metadata
From: kuan.ying lee <kuan-ying.lee@mediatek.com>
To: Andrey Konovalov <andreyknvl@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>
CC: Marco Elver <elver@google.com>, Nicholas Tang
 <nicholas.tang@mediatek.com>, Andrew Yang <andrew.yang@mediatek.com>, "Andrey
 Ryabinin" <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>,
 Chinwen Chang <chinwen.chang@mediatek.com>, Andrew Morton
 <akpm@linux-foundation.org>, kasan-dev <kasan-dev@googlegroups.com>, "Linux
 Memory Management List" <linux-mm@kvack.org>, LKML
 <linux-kernel@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, <kuan-ying.lee@mediatek.com>
Date: Wed, 4 Aug 2021 13:31:08 +0800
In-Reply-To: <CA+fCnZdprormHJHHuEMC07+OnHdC9MLb9PLpBnE1P9TvrVisfw@mail.gmail.com>
References: <20210727040021.21371-1-Kuan-Ying.Lee@mediatek.com>
 <20210727040021.21371-2-Kuan-Ying.Lee@mediatek.com>
 <CANpmjNM03Pag9OvBBVnWnSBePRxsT+BvZtBwrh_61Qzmvp+dvA@mail.gmail.com>
 <b6b96caf30e62996fa3b75ae8d146c9cc0dcbbf6.camel@mediatek.com>
 <20210727192217.GV13920@arm.com>
 <CA+fCnZdprormHJHHuEMC07+OnHdC9MLb9PLpBnE1P9TvrVisfw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_223115_390641_44A75A06 
X-CRM114-Status: GOOD (  35.44  )
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

On Fri, 2021-07-30 at 16:57 +0200, Andrey Konovalov wrote:
> On Tue, Jul 27, 2021 at 9:22 PM Catalin Marinas <
> catalin.marinas@arm.com> wrote:
> > 
> > On Tue, Jul 27, 2021 at 04:32:02PM +0800, Kuan-Ying Lee wrote:
> > > On Tue, 2021-07-27 at 09:10 +0200, Marco Elver wrote:
> > > > +Cc Catalin
> > > > 
> > > > On Tue, 27 Jul 2021 at 06:00, Kuan-Ying Lee <
> > > > Kuan-Ying.Lee@mediatek.com> wrote:
> > > > > 
> > > > > Hardware tag-based KASAN doesn't use compiler
> > > > > instrumentation, we
> > > > > can not use kasan_disable_current() to ignore tag check.
> > > > > 
> > > > > Thus, we need to reset tags when accessing metadata.
> > > > > 
> > > > > Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> > > > 
> > > > This looks reasonable, but the patch title is not saying this
> > > > is
> > > > kmemleak, nor does the description say what the problem is.
> > > > What
> > > > problem did you encounter? Was it a false positive?
> > > 
> > > kmemleak would scan kernel memory to check memory leak.
> > > When it scans on the invalid slab and dereference, the issue
> > > will occur like below.
> > > 
> > > So I think we should reset the tag before scanning.
> > > 
> > > # echo scan > /sys/kernel/debug/kmemleak
> > > [  151.905804]
> > > =================================================================
> > > =
> > > [  151.907120] BUG: KASAN: out-of-bounds in scan_block+0x58/0x170
> > > [  151.908773] Read at addr f7ff0000c0074eb0 by task kmemleak/138
> > > [  151.909656] Pointer tag: [f7], memory tag: [fe]
> > 
> > It would be interesting to find out why the tag doesn't match.
> > Kmemleak
> > should in principle only scan valid objects that have been
> > allocated and
> > the pointer can be safely dereferenced. 0xfe is KASAN_TAG_INVALID,
> > so it
> > either goes past the size of the object (into the red zone) or it
> > still
> > accesses the object after it was marked as freed but before being
> > released from kmemleak.
> > 
> > With slab, looking at __cache_free(), it calls kasan_slab_free()
> > before
> > ___cache_free() -> kmemleak_free_recursive(), so the second
> > scenario is
> > possible. With slub, however, slab_free_hook() first releases the
> > object
> > from kmemleak before poisoning it. Based on the stack dump, you are
> > using slub, so it may be that kmemleak goes into the object red
> > zones.
> > 
> > I'd like this clarified before blindly resetting the tag.
> 
> AFAIK, kmemleak scans the whole object including the leftover redzone
> for kmalloc-allocated objects.
> 
> Looking at the report, there are 11 0xf7 granules, which amounts to
> 176 bytes, and the object is allocated from the kmalloc-256 cache. So
> when kmemleak accesses the last 256-176 bytes, it causes faults, as
> those are marked with KASAN_KMALLOC_REDZONE == KASAN_TAG_INVALID ==
> 0xfe.
> 
> Generally, resetting tags in kasan_disable/enable_current() section
> should be fine to suppress MTE faults, provided those sections had
> been added correctly in the first place.

Thanks Andrey for explanation.
I will refine commit and upload v2.

Thanks.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
