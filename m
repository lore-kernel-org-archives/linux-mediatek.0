Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61CF3C63777
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 01:56:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF7A2206F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 01:56:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3GOG67LZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lCtGEG1J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF7A2206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qeEwpPW90e7Wa2lnNBxL6GNXLBx+4FJZ6VeJI3c2tLU=; b=3GOG67LZdRkURNy5E0b2HqcsK
	MNsqqJygYy7Eg7PKfooDlO0a7nn57z5WkRl0YQ7K9r3Xe7Wej8ondeurCbA4S4cfEtBGPBJjZX2Iq
	0qJAZTVNG9xFD6w/UrofLGhLunIXp9MDaHAVJNVqTn0WuYTikEaOvdkT/wj/hlJvlqoXOkZdz3/h6
	PObBUzX+KWHYexbKlEwOQdhLrL2EST6rFUPCyBXColxwzhgkDwV8ZOZ2E4xcRcQxOsdpVeIUVgqbo
	E/3VkMfMhQrXi//LccHWY8ShE7hIPaPloz04TOyjSaFqrIq7XdtbOYBRUEswafig8DYru3hfEtrnj
	7kfq/xJkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiSzM-0005Ra-EL; Fri, 27 Nov 2020 01:55:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiSzH-0005Qd-R9
 for linux-mediatek@lists.infradead.org; Fri, 27 Nov 2020 01:55:54 +0000
X-UUID: b7b8f3e1294042d2ac10248fa2c81ba7-20201126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=w8vnzPmIF9GP6qq9n7qD+b4xYK8LSksy/BEZVgo8LGA=; 
 b=lCtGEG1J6mQZdDPK9dH8MNUW8ZsiUsM+7eiY+F5nK91J/n0Wcwm+hEtdzLHW/DycWaIvbIZTAqhNX93MZWo/jQ8Sqg5YiHJ7YiXO4NyNU5NFvzr7LX9qeqZCwRu2uVQCmlnt/itC32z7hvJCZiBvJk2mELlmxaUH9Y4MV0kSb88=;
X-UUID: b7b8f3e1294042d2ac10248fa2c81ba7-20201126
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 374889805; Thu, 26 Nov 2020 17:55:51 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 Nov 2020 17:55:44 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 27 Nov 2020 09:55:28 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 27 Nov 2020 09:55:30 +0800
Message-ID: <1606442130.8845.2.camel@mtkswgap22>
Subject: Re: [RESEND PATCH v1] proc: use untagged_addr() for pagemap_read
 addresses
From: Miles Chen <miles.chen@mediatek.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Date: Fri, 27 Nov 2020 09:55:30 +0800
In-Reply-To: <87lfeqsizr.fsf@x220.int.ebiederm.org>
References: <20201123063835.18981-1-miles.chen@mediatek.com>
 <87lfeqsizr.fsf@x220.int.ebiederm.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_205552_799648_B9AC3C75 
X-CRM114-Status: GOOD (  30.07  )
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
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Alexey Dobriyan <adobriyan@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-11-24 at 12:32 -0600, Eric W. Biederman wrote:
> Miles Chen <miles.chen@mediatek.com> writes:
> 
> > When we try to visit the pagemap of a tagged userspace pointer, we find
> > that the start_vaddr is not correct because of the tag.
> > To fix it, we should untag the usespace pointers in pagemap_read().
> >
> > I tested with 5.10-rc4 and the issue remains.
> >
> > My test code is baed on [1]:
> >
> > A userspace pointer which has been tagged by 0xb4: 0xb400007662f541c8
> 
> 
> Sigh this patch is buggy.
> 
> > === userspace program ===
> >
> > uint64 OsLayer::VirtualToPhysical(void *vaddr) {
> > 	uint64 frame, paddr, pfnmask, pagemask;
> > 	int pagesize = sysconf(_SC_PAGESIZE);
> > 	off64_t off = ((uintptr_t)vaddr) / pagesize * 8; // off = 0xb400007662f541c8 / pagesize * 8 = 0x5a00003b317aa0
> > 	int fd = open(kPagemapPath, O_RDONLY);
> > 	...
> >
> > 	if (lseek64(fd, off, SEEK_SET) != off || read(fd, &frame, 8) != 8) {
> > 		int err = errno;
> > 		string errtxt = ErrorString(err);
> > 		if (fd >= 0)
> > 			close(fd);
> > 		return 0;
> > 	}
> > ...
> > }
> >
> > === kernel fs/proc/task_mmu.c ===
> >
> > static ssize_t pagemap_read(struct file *file, char __user *buf,
> > 		size_t count, loff_t *ppos)
> > {
> > 	...
> > 	src = *ppos;
> > 	svpfn = src / PM_ENTRY_BYTES; // svpfn == 0xb400007662f54
> > 	start_vaddr = svpfn << PAGE_SHIFT; // start_vaddr == 0xb400007662f54000
> > 	end_vaddr = mm->task_size;
> >
> > 	/* watch out for wraparound */
> > 	// svpfn == 0xb400007662f54
> > 	// (mm->task_size >> PAGE) == 0x8000000
> > 	if (svpfn > mm->task_size >> PAGE_SHIFT) // the condition is true because of the tag 0xb4
> > 		start_vaddr = end_vaddr;
> >
> > 	ret = 0;
> > 	while (count && (start_vaddr < end_vaddr)) { // we cannot visit correct entry because start_vaddr is set to end_vaddr
> > 		int len;
> > 		unsigned long end;
> > 		...
> > 	}
> > 	...
> > }
> >
> > [1] https://github.com/stressapptest/stressapptest/blob/master/src/os.cc#L158
> >
> > Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> > ---
> >  fs/proc/task_mmu.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> > index 217aa2705d5d..e9a70f7ee515 100644
> > --- a/fs/proc/task_mmu.c
> > +++ b/fs/proc/task_mmu.c
> > @@ -1599,11 +1599,11 @@ static ssize_t pagemap_read(struct file *file, char __user *buf,
> >  
> >  	src = *ppos;
> >  	svpfn = src / PM_ENTRY_BYTES;
> 
> > -	start_vaddr = svpfn << PAGE_SHIFT;
> > +	start_vaddr = untagged_addr(svpfn << PAGE_SHIFT);
>         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> Arguably the line above is safe, but unfortunately it has the
> possibility of suffering from overflow.
> 
> >  	end_vaddr = mm->task_size;
> >  
> >  	/* watch out for wraparound */
> > -	if (svpfn > mm->task_size >> PAGE_SHIFT)
> > +	if (start_vaddr > mm->task_size)
> >  		start_vaddr = end_vaddr;
> 
> Overflow handling you are removing here.
> >  
> >  	/*
> 
> 
> I suspect the proper way to handle this is to move the test for
> overflow earlier so the code looks something like:
> 
> 	end_vaddr = mm->task_size;
> 
> 	src = *ppos;
> 	svpfn = src / PM_ENTRY_BYTES;
> 
> 	/* watch out for wraparound */
>         start_vaddr = end_vaddr;
> 	if (svpfn < (ULONG_MAX >> PAGE_SHIFT))
>         	start_vaddr = untagged_addr(svpfn << PAGE_SHIFT);
> 
> 	/* Ensure the address is inside the task */
> 	if (start_vaddr > mm->task_size)
>         	start_vaddr = end_vaddr;


Thanks for the comment, I will fix that in patch v2.

Miles
> 
> Eric
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
