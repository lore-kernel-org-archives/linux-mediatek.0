Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3825C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 19:22:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F0AA601FC
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 19:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F0AA601FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AM0jySf+lUlzNfUz4KDriKi0W09WW8Fu//PRCA/oNsE=; b=W6N1cMQ0t064WF
	n7msaOXGcxdOnG464QYV3S8xmf7ja1pzHpYVBM+ICkOGvk2/0jBgvifiAQmhp6026mE+C3h7lqLbZ
	W3SQjlq8WL8TQfQbPObEnvaYuo4+amya5wXl2qUa7juc8jn5A6QlXSSVoxEuC1ZSHGKT1qneFhRUy
	m8TM+6kEvO6ixe3op0AqgieP9y04T4ZR5mork3UNXrAnnQUZo2nB1c1hBYgtMD1soI2to7zfKnSuY
	0vEQRyH/taKOxHsqywbTqs2AObQvpALJ8zMYCOAfFTnGj4uOtZlfBwQza/3TDbZAlRuP3SR/3x+gn
	fH1MoEDO+kiEHc2CJixQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8Sez-00G93y-5v; Tue, 27 Jul 2021 19:22:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8Sem-00G929-35; Tue, 27 Jul 2021 19:22:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A76E60F6E;
 Tue, 27 Jul 2021 19:22:21 +0000 (UTC)
Date: Tue, 27 Jul 2021 20:22:18 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Marco Elver <elver@google.com>, Nicholas Tang <nicholas.tang@mediatek.com>,
 Andrew Yang <andrew.yang@mediatek.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Chinwen Chang <chinwen.chang@mediatek.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] kasan, mm: reset tag when access metadata
Message-ID: <20210727192217.GV13920@arm.com>
References: <20210727040021.21371-1-Kuan-Ying.Lee@mediatek.com>
 <20210727040021.21371-2-Kuan-Ying.Lee@mediatek.com>
 <CANpmjNM03Pag9OvBBVnWnSBePRxsT+BvZtBwrh_61Qzmvp+dvA@mail.gmail.com>
 <b6b96caf30e62996fa3b75ae8d146c9cc0dcbbf6.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b6b96caf30e62996fa3b75ae8d146c9cc0dcbbf6.camel@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_122224_193723_2271C4C2 
X-CRM114-Status: GOOD (  21.61  )
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

On Tue, Jul 27, 2021 at 04:32:02PM +0800, Kuan-Ying Lee wrote:
> On Tue, 2021-07-27 at 09:10 +0200, Marco Elver wrote:
> > +Cc Catalin
> > 
> > On Tue, 27 Jul 2021 at 06:00, Kuan-Ying Lee <
> > Kuan-Ying.Lee@mediatek.com> wrote:
> > > 
> > > Hardware tag-based KASAN doesn't use compiler instrumentation, we
> > > can not use kasan_disable_current() to ignore tag check.
> > > 
> > > Thus, we need to reset tags when accessing metadata.
> > > 
> > > Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> > 
> > This looks reasonable, but the patch title is not saying this is
> > kmemleak, nor does the description say what the problem is. What
> > problem did you encounter? Was it a false positive?
> 
> kmemleak would scan kernel memory to check memory leak.
> When it scans on the invalid slab and dereference, the issue
> will occur like below.
> 
> So I think we should reset the tag before scanning.
> 
> # echo scan > /sys/kernel/debug/kmemleak
> [  151.905804]
> ==================================================================
> [  151.907120] BUG: KASAN: out-of-bounds in scan_block+0x58/0x170
> [  151.908773] Read at addr f7ff0000c0074eb0 by task kmemleak/138
> [  151.909656] Pointer tag: [f7], memory tag: [fe]

It would be interesting to find out why the tag doesn't match. Kmemleak
should in principle only scan valid objects that have been allocated and
the pointer can be safely dereferenced. 0xfe is KASAN_TAG_INVALID, so it
either goes past the size of the object (into the red zone) or it still
accesses the object after it was marked as freed but before being
released from kmemleak.

With slab, looking at __cache_free(), it calls kasan_slab_free() before
___cache_free() -> kmemleak_free_recursive(), so the second scenario is
possible. With slub, however, slab_free_hook() first releases the object
from kmemleak before poisoning it. Based on the stack dump, you are
using slub, so it may be that kmemleak goes into the object red zones.

I'd like this clarified before blindly resetting the tag.

-- 
Catalin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
