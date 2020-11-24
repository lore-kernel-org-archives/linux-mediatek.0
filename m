Return-Path: <SRS0=KQlx=E6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46838C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 18:33:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9AD320637
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 18:33:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yFzlyxIw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9AD320637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=xmission.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:In-Reply-To:Date:
	References:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oYo06f5FWdZ+b/peCI20mhgXXxJEkjqhyKiYhuP54Aw=; b=yFzlyxIwGQQY+yL4YaUYAHNDl
	9+dicSIUQub/h8D+WaFds7meLdSktGNf1Ok3qgqakkxGR5GLuAqvpr3wjRyUD0BRB+juW5RX3crbn
	hBH5yn9hERjVq2fTB1/xjucBzVYv68mUCFjMtN2xux60rEy/gAg2YWq3T/FzYC4KptR40dOEEo+eA
	RRg61poRq5j7lyH2yA+JO5s0F+vz9a803TBwa/fi0eWr8DO91s2EKQPaiWRuBETrUK8PQp4JlRmXj
	Q3qjS5U7I9F4CAwHo96cShAAhxt+E6fCJHXpoQMfsis+qAKIPp/hJxzTsnKi5ysz2wNnR+rFVx7Wz
	fR15kRjCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khd85-0001Pk-9T; Tue, 24 Nov 2020 18:33:29 +0000
Received: from out01.mta.xmission.com ([166.70.13.231])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khd82-0001PD-Py
 for linux-mediatek@lists.infradead.org; Tue, 24 Nov 2020 18:33:27 +0000
Received: from in02.mta.xmission.com ([166.70.13.52])
 by out01.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1khd7y-00CpWM-N7; Tue, 24 Nov 2020 11:33:22 -0700
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]
 helo=x220.xmission.com)
 by in02.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1khd7w-005yjH-BE; Tue, 24 Nov 2020 11:33:22 -0700
From: ebiederm@xmission.com (Eric W. Biederman)
To: Miles Chen <miles.chen@mediatek.com>
References: <20201123063835.18981-1-miles.chen@mediatek.com>
Date: Tue, 24 Nov 2020 12:32:56 -0600
In-Reply-To: <20201123063835.18981-1-miles.chen@mediatek.com> (Miles Chen's
 message of "Mon, 23 Nov 2020 14:38:35 +0800")
Message-ID: <87lfeqsizr.fsf@x220.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1khd7w-005yjH-BE; ; ; mid=<87lfeqsizr.fsf@x220.int.ebiederm.org>;
 ; ; hst=in02.mta.xmission.com; ; ; ip=68.227.160.95; ; ;
 frm=ebiederm@xmission.com; ; ; spf=neutral
X-XM-AID: U2FsdGVkX1/cWINijvy8cfZD9GCnZGUD9VbnS+lLulo=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
Subject: Re: [RESEND PATCH v1] proc: use untagged_addr() for pagemap_read
 addresses
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_133326_898697_8CBAF64E 
X-CRM114-Status: GOOD (  26.33  )
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

Miles Chen <miles.chen@mediatek.com> writes:

> When we try to visit the pagemap of a tagged userspace pointer, we find
> that the start_vaddr is not correct because of the tag.
> To fix it, we should untag the usespace pointers in pagemap_read().
>
> I tested with 5.10-rc4 and the issue remains.
>
> My test code is baed on [1]:
>
> A userspace pointer which has been tagged by 0xb4: 0xb400007662f541c8


Sigh this patch is buggy.

> === userspace program ===
>
> uint64 OsLayer::VirtualToPhysical(void *vaddr) {
> 	uint64 frame, paddr, pfnmask, pagemask;
> 	int pagesize = sysconf(_SC_PAGESIZE);
> 	off64_t off = ((uintptr_t)vaddr) / pagesize * 8; // off = 0xb400007662f541c8 / pagesize * 8 = 0x5a00003b317aa0
> 	int fd = open(kPagemapPath, O_RDONLY);
> 	...
>
> 	if (lseek64(fd, off, SEEK_SET) != off || read(fd, &frame, 8) != 8) {
> 		int err = errno;
> 		string errtxt = ErrorString(err);
> 		if (fd >= 0)
> 			close(fd);
> 		return 0;
> 	}
> ...
> }
>
> === kernel fs/proc/task_mmu.c ===
>
> static ssize_t pagemap_read(struct file *file, char __user *buf,
> 		size_t count, loff_t *ppos)
> {
> 	...
> 	src = *ppos;
> 	svpfn = src / PM_ENTRY_BYTES; // svpfn == 0xb400007662f54
> 	start_vaddr = svpfn << PAGE_SHIFT; // start_vaddr == 0xb400007662f54000
> 	end_vaddr = mm->task_size;
>
> 	/* watch out for wraparound */
> 	// svpfn == 0xb400007662f54
> 	// (mm->task_size >> PAGE) == 0x8000000
> 	if (svpfn > mm->task_size >> PAGE_SHIFT) // the condition is true because of the tag 0xb4
> 		start_vaddr = end_vaddr;
>
> 	ret = 0;
> 	while (count && (start_vaddr < end_vaddr)) { // we cannot visit correct entry because start_vaddr is set to end_vaddr
> 		int len;
> 		unsigned long end;
> 		...
> 	}
> 	...
> }
>
> [1] https://github.com/stressapptest/stressapptest/blob/master/src/os.cc#L158
>
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> ---
>  fs/proc/task_mmu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index 217aa2705d5d..e9a70f7ee515 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -1599,11 +1599,11 @@ static ssize_t pagemap_read(struct file *file, char __user *buf,
>  
>  	src = *ppos;
>  	svpfn = src / PM_ENTRY_BYTES;

> -	start_vaddr = svpfn << PAGE_SHIFT;
> +	start_vaddr = untagged_addr(svpfn << PAGE_SHIFT);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Arguably the line above is safe, but unfortunately it has the
possibility of suffering from overflow.

>  	end_vaddr = mm->task_size;
>  
>  	/* watch out for wraparound */
> -	if (svpfn > mm->task_size >> PAGE_SHIFT)
> +	if (start_vaddr > mm->task_size)
>  		start_vaddr = end_vaddr;

Overflow handling you are removing here.
>  
>  	/*


I suspect the proper way to handle this is to move the test for
overflow earlier so the code looks something like:

	end_vaddr = mm->task_size;

	src = *ppos;
	svpfn = src / PM_ENTRY_BYTES;

	/* watch out for wraparound */
        start_vaddr = end_vaddr;
	if (svpfn < (ULONG_MAX >> PAGE_SHIFT))
        	start_vaddr = untagged_addr(svpfn << PAGE_SHIFT);

	/* Ensure the address is inside the task */
	if (start_vaddr > mm->task_size)
        	start_vaddr = end_vaddr;

Eric


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
