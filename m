Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30FEC4361B
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 01:42:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 583FB224DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 01:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 583FB224DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=imVCxUG7jcUMJF6V/ilp61Nnp8w+gsbnearzgkTIvVU=; b=WPMaf/H6dvLB2hRe7TVLoPB9G
	EAqMO7+ygFB2/scliM6Jixu7XqcaU6EPO4p27yCrAxHHM0exS51SzrehFKWd7NR5TZ3hasPpDe3MG
	0UKh49cRoM6/EPK6qaU6e29F/Uc5Jl5LCNgs5Gp17a82tJSQLIiyFNya0HUHl0CWBZfx5GhQERkwV
	QwFg2u/ocrJlIgYg5nG+Neex6aaVNKekjAU3TTM+N4/CWAzJr0ib3gY6CeGT9BeeX0aE0yPbiC0UM
	0A3MC9Fn2mmO367FQSwT8x0r6XtnwjYMt7gvQ13Oc9t+pOBSZpyyv8rkBpgKnRA/L8RurkeyoW191
	+eEoMompA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl07T-0003iL-AZ; Fri, 04 Dec 2020 01:42:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl07Q-0003h4-2v
 for linux-mediatek@lists.infradead.org; Fri, 04 Dec 2020 01:42:45 +0000
X-UUID: a4de14ad5b3b458a8694173ba4a16b8c-20201203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qpJag3JOEGGUczkknHZEtGGVXhrvUUQwFODEalRuGIQ=; 
 b=K/KjUiBFN6+laNMBzZcBvbL+1pSvY4m/JyGUX5m4MFXtWKZyvwtkgtc3RBi8dwYFA1EbhGlnFPf5ysTb4PYIHsqY0GkF7Ly1rS3W2L0ZksThwmqg7EYRfOhQrL+It93yQM5mNWYoC8AeRyE2i7FornrIioFLe5aCUvnj6eIUR60=;
X-UUID: a4de14ad5b3b458a8694173ba4a16b8c-20201203
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1606779229; Thu, 03 Dec 2020 17:42:38 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Dec 2020 17:34:10 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Dec 2020 09:34:07 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Dec 2020 09:34:09 +0800
Message-ID: <1607045648.22275.7.camel@mtkswgap22>
Subject: Re: [PATCH v2] proc: use untagged_addr() for pagemap_read addresses
From: Miles Chen <miles.chen@mediatek.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Date: Fri, 4 Dec 2020 09:34:08 +0800
In-Reply-To: <20201203113020.GE2224@gaia>
References: <20201127050738.14440-1-miles.chen@mediatek.com>
 <20201203113020.GE2224@gaia>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 552F8B8F974629EEEA03397AF0B305287B0DA99E5025DF5071FD727CF3EB5E5F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_204244_346985_72DAC4A5 
X-CRM114-Status: GOOD (  19.18  )
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
Cc: Song Bao Hua <song.bao.hua@hisilicon.com>, Marco Elver <elver@google.com>,
 wsd_upstream@mediatek.com, Andrey Konovalov <andreyknvl@google.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, linux-fsdevel@vger.kernel.org,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Will
 Deacon <will@kernel.org>, Alexey Dobriyan <adobriyan@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-12-03 at 11:30 +0000, Catalin Marinas wrote:
> On Fri, Nov 27, 2020 at 01:07:38PM +0800, Miles Chen wrote:
> > Cc: Will Deacon <will.deacon@arm.com>
> 
> That should be will@kernel.org.

ok, I will fix it and submit v3
> 
> > diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> > index 217aa2705d5d..92b277388f05 100644
> > --- a/fs/proc/task_mmu.c
> > +++ b/fs/proc/task_mmu.c
> > @@ -1599,11 +1599,15 @@ static ssize_t pagemap_read(struct file *file, char __user *buf,
> >  
> >  	src = *ppos;
> >  	svpfn = src / PM_ENTRY_BYTES;
> > -	start_vaddr = svpfn << PAGE_SHIFT;
> >  	end_vaddr = mm->task_size;
> >  
> >  	/* watch out for wraparound */
> > -	if (svpfn > mm->task_size >> PAGE_SHIFT)
> > +	start_vaddr = end_vaddr;
> > +	if (svpfn < (ULONG_MAX >> PAGE_SHIFT))
> 
> Does this need to be strict less-than? I think a less-than or equal
> would work better.

Thanks, I will fix it and submit v3.
> 
> > +		start_vaddr = untagged_addr(svpfn << PAGE_SHIFT);
> > +
> > +	/* Ensure the address is inside the task */
> > +	if (start_vaddr > mm->task_size)
> >  		start_vaddr = end_vaddr;
> 
> Otherwise the logic looks fine to me. With the above:
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
