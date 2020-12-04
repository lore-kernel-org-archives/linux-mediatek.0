Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CDFFC4361A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 01:33:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87F71224DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 01:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87F71224DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ui9X1M/1qWPPCRCjCpXaILVckRDqqmfyHRSPAP3eG8Q=; b=r5NKCefdRdvNbYrHJcFHiIU7D
	MOxUqoFm3NXo84ldkSPj30V6ChTeeHPFwBZZckSouPtytxxw9Xx7pfkLqC8sG2kTB8Ch/QlKzyR87
	SB+lpgZuP25HPHy7MZdgWd0lMNUV0yDAz6RjkCJ5CIdY13v5PrIUkXeEPujxVzP7csqprhfrrTtPd
	adgt0Z7IsxGI/VjNK++wj2d5xeGcrbNI9M12JdOg9Vjf4CitIqOKy1ZcwHrmZNbFWDdrig9T9LOwB
	9S0BKZxAkNuc33GKVhvt5IcilS0Ua20LCFApFi9HGeqzcJL2bSsB/BDwkbJDHKO7vF5SYEcyebbQM
	Wg3UHQrxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkzyN-0003PP-2G; Fri, 04 Dec 2020 01:33:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkzyK-0003Ot-2q
 for linux-mediatek@lists.infradead.org; Fri, 04 Dec 2020 01:33:21 +0000
X-UUID: e286fe221433448e88ca72a5cc0e2411-20201203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=asU0hyd6B0tIuuw9zw9QTEWC2OgJ7pNYC02KEDgawhA=; 
 b=qam0Wgwyb3zg7lVkVJaDM9rPfGk9Luoz00CUAMmXKmZ18FS3Nkc60zAtATBz5P+vlRJC29n26wxm4K5ONXiIgQaOo+395kN6U9x5F9EZt1B4MEY9ufnEFBQC9IqV8BtsYj3j1mLOPkRpfyWOuTwQQsbk9N0CLhDGIkR5MzHKM2M=;
X-UUID: e286fe221433448e88ca72a5cc0e2411-20201203
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1518956701; Thu, 03 Dec 2020 17:33:12 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Dec 2020 17:33:11 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Dec 2020 09:33:10 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Dec 2020 09:33:11 +0800
Message-ID: <1607045590.22275.6.camel@mtkswgap22>
Subject: Re: [PATCH v2] proc: use untagged_addr() for pagemap_read addresses
From: Miles Chen <miles.chen@mediatek.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Date: Fri, 4 Dec 2020 09:33:10 +0800
In-Reply-To: <d836c2d2-321f-3931-568b-430d73c60c2c@arm.com>
References: <20201127050738.14440-1-miles.chen@mediatek.com>
 <d836c2d2-321f-3931-568b-430d73c60c2c@arm.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_203320_861157_146873F9 
X-CRM114-Status: GOOD (  31.92  )
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
 Catalin Marinas <catalin.marinas@arm.com>, wsd_upstream@mediatek.com,
 Andrey Konovalov <andreyknvl@google.com>, Will Deacon <will.deacon@arm.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, linux-fsdevel@vger.kernel.org,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Alexey Dobriyan <adobriyan@gmail.com>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-12-03 at 11:45 +0000, Vincenzo Frascino wrote:
> Hi Miles,
> 
> On 11/27/20 5:07 AM, Miles Chen wrote:
> > When we try to visit the pagemap of a tagged userspace pointer, we find
> > that the start_vaddr is not correct because of the tag.
> > To fix it, we should untag the usespace pointers in pagemap_read().
> > 
> 
> Nit: s/usespace/userspace/ (please search and replace all occurrences :) )
> 
> > I tested with 5.10-rc4 and the issue remains.
> > 
> > Explaination from Catalin in [1]:
> >
> 
> Nit: s/Explaination/Explanation/ (please search and replace all occurrences :) )

thanks, I will fix this and push v3
> 
> > "
> > Arguably, that's a user-space bug since tagged file offsets were never
> > supported. In this case it's not even a tag at bit 56 as per the arm64
> > tagged address ABI but rather down to bit 47. You could say that the
> > problem is caused by the C library (malloc()) or whoever created the
> > tagged vaddr and passed it to this function. It's not a kernel
> > regression as we've never supported it.
> > 
> > Now, pagemap is a special case where the offset is usually not generated
> > as a classic file offset but rather derived by shifting a user virtual
> > address. I guess we can make a concession for pagemap (only) and allow
> > such offset with the tag at bit (56 - PAGE_SHIFT + 3).
> > "
> > 
> > My test code is baed on [2]:
> 
> Nit: s/baed/based/ (please search and replace all occurrences :) )

thanks, I will fix this and push v3



Miles
> 
> [...]
> 
> > ---
> >  fs/proc/task_mmu.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
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
> It seems that 'svpfn' should be less-then-equal (<=) '(ULONG_MAX >>
> PAGE_SHIFT)'. Is there any specific reason why this is not the case?
> 
> > +		start_vaddr = untagged_addr(svpfn << PAGE_SHIFT);
> > +
> > +	/* Ensure the address is inside the task */
> > +	if (start_vaddr > mm->task_size)
> >  		start_vaddr = end_vaddr;
> >  
> >  	/*
> > 
> 
> Otherwise:
> 
> Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
