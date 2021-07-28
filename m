Return-Path: <SRS0=pZ6D=MU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2719DC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 11:05:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5F1660F46
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 11:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E5F1660F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P+E16KkFi/K2J4BXpkXgmAn5VL7rSZ4Z4TYBBMUMB0U=; b=3mMgKJf/gZQlGR
	D3YfJ8tKkc00NXhG/lkABPar3fqKjgPCUqM7JARqgx1zY58pncsMldm4lPOCd8G4gbRr66hzkPqXN
	Mz/YqyjfsHRneW2Xr+EaDsYZJLPFelEChG+CgXP3NbWqsGQYAopPyW/YbUfMTfFCyRLSC8oXSe3iw
	co2jaSeOgTyOCnbN+8HlgsTt02LaqoKwKOTU+r/kYn7qFXRMotXViJtkDb1poFHkiDhzg2LSF1+NN
	br0GMYhBzfvklMmGoYivV52TGtgF4Fr46FksH2g6GoHxbGI2joAiEa9iRlek/3QE99HPQIYN6rXl9
	oynXYWqXsk0F5CfdB/mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8hNQ-000VTi-4C; Wed, 28 Jul 2021 11:05:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8hNC-000VQK-Lb; Wed, 28 Jul 2021 11:05:16 +0000
X-UUID: fccdb50f8c5b468d8029519f7c6f0606-20210728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=WuS5SPNVr0wzahpzgVixyvQu00cdYARn5gVWREstKDg=; 
 b=WQpkvRDqcSAbIl8N1BPaAd9fD+PMPC31IvYlnRu+EomjBURXJmAw4/MMUTFs4C4elL0kJjf7NOCAlyepdb2p7jYh86wzuxMJ0FJUth4WQ0vRf7c3LZRDSoi/G9A9rKTVW+72qh5WTgbpJpMgLujODCfU91JhdggJDX2ETXIwyeA=;
X-UUID: fccdb50f8c5b468d8029519f7c6f0606-20210728
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1964036186; Wed, 28 Jul 2021 04:05:10 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Jul 2021 04:05:09 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Jul 2021 19:05:07 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 28 Jul 2021 19:05:07 +0800
Message-ID: <29f4844b1af163b0ec463fccbc9b902b3150f5c1.camel@mediatek.com>
Subject: Re: [PATCH 1/2] kasan, mm: reset tag when access metadata
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Catalin Marinas <catalin.marinas@arm.com>
CC: Marco Elver <elver@google.com>, Nicholas Tang
 <nicholas.tang@mediatek.com>, Andrew Yang <andrew.yang@mediatek.com>, "Andrey
 Konovalov" <andreyknvl@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, Chinwen Chang
 <chinwen.chang@mediatek.com>, Andrew Morton <akpm@linux-foundation.org>,
 <kasan-dev@googlegroups.com>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <Kuan-Ying.Lee@mediatek.com>
Date: Wed, 28 Jul 2021 19:05:07 +0800
In-Reply-To: <20210727192217.GV13920@arm.com>
References: <20210727040021.21371-1-Kuan-Ying.Lee@mediatek.com>
 <20210727040021.21371-2-Kuan-Ying.Lee@mediatek.com>
 <CANpmjNM03Pag9OvBBVnWnSBePRxsT+BvZtBwrh_61Qzmvp+dvA@mail.gmail.com>
 <b6b96caf30e62996fa3b75ae8d146c9cc0dcbbf6.camel@mediatek.com>
 <20210727192217.GV13920@arm.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_040514_762414_53C1CC07 
X-CRM114-Status: GOOD (  30.90  )
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

On Tue, 2021-07-27 at 20:22 +0100, Catalin Marinas wrote:
> On Tue, Jul 27, 2021 at 04:32:02PM +0800, Kuan-Ying Lee wrote:
> > On Tue, 2021-07-27 at 09:10 +0200, Marco Elver wrote:
> > > +Cc Catalin
> > > 
> > > On Tue, 27 Jul 2021 at 06:00, Kuan-Ying Lee <
> > > Kuan-Ying.Lee@mediatek.com> wrote:
> > > > 
> > > > Hardware tag-based KASAN doesn't use compiler instrumentation,
> > > > we
> > > > can not use kasan_disable_current() to ignore tag check.
> > > > 
> > > > Thus, we need to reset tags when accessing metadata.
> > > > 
> > > > Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> > > 
> > > This looks reasonable, but the patch title is not saying this is
> > > kmemleak, nor does the description say what the problem is. What
> > > problem did you encounter? Was it a false positive?
> > 
> > kmemleak would scan kernel memory to check memory leak.
> > When it scans on the invalid slab and dereference, the issue
> > will occur like below.
> > 
> > So I think we should reset the tag before scanning.
> > 
> > # echo scan > /sys/kernel/debug/kmemleak
> > [  151.905804]
> > ==================================================================
> > [  151.907120] BUG: KASAN: out-of-bounds in scan_block+0x58/0x170
> > [  151.908773] Read at addr f7ff0000c0074eb0 by task kmemleak/138
> > [  151.909656] Pointer tag: [f7], memory tag: [fe]
> 
> It would be interesting to find out why the tag doesn't match.
> Kmemleak
> should in principle only scan valid objects that have been allocated
> and
> the pointer can be safely dereferenced. 0xfe is KASAN_TAG_INVALID, so
> it
> either goes past the size of the object (into the red zone) or it
> still
> accesses the object after it was marked as freed but before being
> released from kmemleak.
> 
> With slab, looking at __cache_free(), it calls kasan_slab_free()
> before
> ___cache_free() -> kmemleak_free_recursive(), so the second scenario
> is
> possible. With slub, however, slab_free_hook() first releases the
> object
> from kmemleak before poisoning it. Based on the stack dump, you are
> using slub, so it may be that kmemleak goes into the object red
> zones.
> 
> I'd like this clarified before blindly resetting the tag.

This kasan issue only happened on hardware tag-based kasan mode.
Because kasan_disable_current() works for generic and sw tag-based
kasan.

HW tag-based kasan depends on slub so slab will not hit this
issue.
I think we can just check if HW tag-based kasan is enabled or not
and decide to reset the tag as below.

if (kasan_has_integrated_init()) // slub case, hw-tag kasan
	pointer = *(unsigned long *)kasan_reset_tag((void *)ptr);
else
	pointer = *ptr; // slab

Is this better or any other suggestions?
Any suggestion is appreciated.

Thanks,
Kuan-Ying Lee

> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
