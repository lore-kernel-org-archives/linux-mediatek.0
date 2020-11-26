Return-Path: <SRS0=o4uA=FA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDE5C56202
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 07:59:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E4B0206D9
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 07:59:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wRTh3i6s";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="s2XTWUkO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E4B0206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CsUYwNyjfdfQ51OJnInW9QaE65/cpGqvu9KFgZX28J4=; b=wRTh3i6s68koVhb35PRWwthHF
	UMRNLaYn0s6tZVdMvAgWnmeaGznkRxLzRYF8BmEEDyLSqwWL6JAqjlzOXDFxpABvSU5TOACpMdLZe
	QK12urhNEjXnJ7wUlELKk5AAu9aRvu2kLvhhoFOdJJsGttnqZfn6vX7Iq52mJXFO8I5Bfmtot+LYd
	o8Jdvoy/t6P4YFldm/ckPCkIeUgMV5WSX/pMD3euFRBDYeYeuVdFN4nTVGHb3utKG0UvV3aA92SoE
	dZN6uSar8XDfWvfmfluaEpi6ba8XjrqARx2Mz+m1Z4ETJeLIt2qKCr3f1Uwuo6rWuNH+uDpcH7pc5
	H4fw64bdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiCBX-0005de-QH; Thu, 26 Nov 2020 07:59:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiCBT-0005co-LU
 for linux-mediatek@lists.infradead.org; Thu, 26 Nov 2020 07:59:21 +0000
X-UUID: 0210354f2caa4e02840cc7bba6ee445d-20201125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=TvfCgI01pTRpVVGjtW+F66wwpBJPrTQJILPgC/5kpgU=; 
 b=s2XTWUkO+059dPW/cJpgM0MHAX5kYGqnwlq47Bcdppf7tWgRnBCRGR5OOJwpZNA6A/vwmuo7odeDdF+M/Qq3P8q8YxnD9o1oMV1Led2eGZDNRW+mUI84q4OWm9Slegf3QROQwyJecqFNTQOufsWYiSVH4Mq+l4y6CqxDk73JTrs=;
X-UUID: 0210354f2caa4e02840cc7bba6ee445d-20201125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 97990437; Wed, 25 Nov 2020 23:59:12 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Nov 2020 23:49:08 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 Nov 2020 15:49:06 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 26 Nov 2020 15:49:06 +0800
Message-ID: <1606376946.17565.6.camel@mtkswgap22>
Subject: RE: [RESEND PATCH v1] proc: use untagged_addr() for pagemap_read
 addresses
From: Miles Chen <miles.chen@mediatek.com>
To: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
Date: Thu, 26 Nov 2020 15:49:06 +0800
In-Reply-To: <24d32889abb1412abcd4e868a36783f9@hisilicon.com>
References: <20201123063835.18981-1-miles.chen@mediatek.com>
 <24d32889abb1412abcd4e868a36783f9@hisilicon.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 81E83192E13862002142DEB72FECB66C2F007FF6FF26CBB6A2E8207C46CF8A942000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_025920_491258_DA52DB61 
X-CRM114-Status: GOOD (  29.57  )
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
Cc: "wsd_upstream@mediatek.com" <wsd_upstream@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Alexey Dobriyan <adobriyan@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-11-26 at 07:16 +0000, Song Bao Hua (Barry Song) wrote:
> 
> > -----Original Message-----
> > From: Miles Chen [mailto:miles.chen@mediatek.com]
> > Sent: Monday, November 23, 2020 7:39 PM
> > To: Alexey Dobriyan <adobriyan@gmail.com>; Andrew Morton
> > <akpm@linux-foundation.org>
> > Cc: linux-kernel@vger.kernel.org; linux-fsdevel@vger.kernel.org;
> > linux-mediatek@lists.infradead.org; wsd_upstream@mediatek.com; Miles
> > Chen <miles.chen@mediatek.com>
> > Subject: [RESEND PATCH v1] proc: use untagged_addr() for pagemap_read
> > addresses
> > 
> > When we try to visit the pagemap of a tagged userspace pointer, we find
> > that the start_vaddr is not correct because of the tag.
> > To fix it, we should untag the usespace pointers in pagemap_read().
> > 
> > I tested with 5.10-rc4 and the issue remains.
> > 
> > My test code is baed on [1]:
> > 
> > A userspace pointer which has been tagged by 0xb4: 0xb400007662f541c8
> > 
> > === userspace program ===
> > 
> > uint64 OsLayer::VirtualToPhysical(void *vaddr) {
> > 	uint64 frame, paddr, pfnmask, pagemask;
> > 	int pagesize = sysconf(_SC_PAGESIZE);
> > 	off64_t off = ((uintptr_t)vaddr) / pagesize * 8; // off =
> > 0xb400007662f541c8 / pagesize * 8 = 0x5a00003b317aa0
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
> > 	start_vaddr = svpfn << PAGE_SHIFT; // start_vaddr ==
> > 0xb400007662f54000
> > 	end_vaddr = mm->task_size;
> > 
> > 	/* watch out for wraparound */
> > 	// svpfn == 0xb400007662f54
> > 	// (mm->task_size >> PAGE) == 0x8000000
> > 	if (svpfn > mm->task_size >> PAGE_SHIFT) // the condition is true because
> > of the tag 0xb4
> > 		start_vaddr = end_vaddr;
> > 
> > 	ret = 0;
> > 	while (count && (start_vaddr < end_vaddr)) { // we cannot visit correct
> > entry because start_vaddr is set to end_vaddr
> > 		int len;
> > 		unsigned long end;
> > 		...
> > 	}
> > 	...
> > }
> > 
> > [1]
> > https://github.com/stressapptest/stressapptest/blob/master/src/os.cc#L158
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
> > @@ -1599,11 +1599,11 @@ static ssize_t pagemap_read(struct file *file, char
> > __user *buf,
> > 
> >  	src = *ppos;
> >  	svpfn = src / PM_ENTRY_BYTES;
> > -	start_vaddr = svpfn << PAGE_SHIFT;
> > +	start_vaddr = untagged_addr(svpfn << PAGE_SHIFT);
> >  	end_vaddr = mm->task_size;
> > 
> >  	/* watch out for wraparound */
> > -	if (svpfn > mm->task_size >> PAGE_SHIFT)
> > +	if (start_vaddr > mm->task_size)
> >  		start_vaddr = end_vaddr;
> 
> Wouldn't the untag be done by the user reading pagemap file?
> With this patch, even users pass an illegal address, for example,
> users put a tag on a virtual address which hasn't really a tag,
> they will still get the right pagemap.
> 


I run arm64 devices.
If the tagged pointer is enabled, the ARM top-byte Ignore is also
enabled. It means the top-byte is always be ignored.

I think the kernel should not break existing userspace program, so it's
better to handle the tagged user pointer in kernel.

grep 'untag' mm -RnH to see existing examples.


thanks,
Miles

> > 
> >  	/*
> > --
> > 2.18.0
> 
> Thanks
> Barry
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
