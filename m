Return-Path: <SRS0=o4uA=FA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AA4C56202
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 07:16:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 544772075A
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 07:16:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uLQjVLu/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 544772075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=URhkUQ6lXfsC39PZ894pQma0ND8JHF82vGVdOVfVxjM=; b=uLQjVLu/VOCOuXouNMEZcYtwR
	TCHmzVT5ULPBJjfJ7C8kdKNb4FgpdGZ/Gb800Wod9OWycwGOK2T/ymDx51v+BW46tZ0JMo2pU2fCY
	jMeDI2ojTtuacoLcpUH5JK7/xPjRyA9Z+KnKpoZnrHJaZtZO+DEkTnP3Gndvx0YcYsWOvT5sfBhHY
	/ZldFe8TDF+uwZ1WNEfV+o1TUaFEYMQKDO6rORjaX4OWevS87oCv6kZOANgqyZ/6P7H+2Ri5uAW0f
	/upafHVOz4BjljzZJW+dqUlWrjxjUjQ0mFAz+n5Z/npjQaweHgvBiDXxplAc89H4SAKUMyYAxh6Re
	4tdHwb/Bw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiBWB-0002PU-PC; Thu, 26 Nov 2020 07:16:39 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiBW7-0002P1-JA
 for linux-mediatek@lists.infradead.org; Thu, 26 Nov 2020 07:16:37 +0000
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ChTZC4LNgzXgMb;
 Thu, 26 Nov 2020 15:16:03 +0800 (CST)
Received: from dggemi759-chm.china.huawei.com (10.1.198.145) by
 DGGEMM404-HUB.china.huawei.com (10.3.20.212) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Thu, 26 Nov 2020 15:16:21 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggemi759-chm.china.huawei.com (10.1.198.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Thu, 26 Nov 2020 15:16:21 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.1913.007;
 Thu, 26 Nov 2020 15:16:21 +0800
From: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To: Miles Chen <miles.chen@mediatek.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: RE: [RESEND PATCH v1] proc: use untagged_addr() for pagemap_read
 addresses
Thread-Topic: [RESEND PATCH v1] proc: use untagged_addr() for pagemap_read
 addresses
Thread-Index: AQHWwWNz5MRhXZKR2UCNja39TEhHcanaA0sg
Date: Thu, 26 Nov 2020 07:16:21 +0000
Message-ID: <24d32889abb1412abcd4e868a36783f9@hisilicon.com>
References: <20201123063835.18981-1-miles.chen@mediatek.com>
In-Reply-To: <20201123063835.18981-1-miles.chen@mediatek.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.202.201]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_021636_720853_EF642062 
X-CRM114-Status: GOOD (  21.77  )
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
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wsd_upstream@mediatek.com" <wsd_upstream@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: Miles Chen [mailto:miles.chen@mediatek.com]
> Sent: Monday, November 23, 2020 7:39 PM
> To: Alexey Dobriyan <adobriyan@gmail.com>; Andrew Morton
> <akpm@linux-foundation.org>
> Cc: linux-kernel@vger.kernel.org; linux-fsdevel@vger.kernel.org;
> linux-mediatek@lists.infradead.org; wsd_upstream@mediatek.com; Miles
> Chen <miles.chen@mediatek.com>
> Subject: [RESEND PATCH v1] proc: use untagged_addr() for pagemap_read
> addresses
> 
> When we try to visit the pagemap of a tagged userspace pointer, we find
> that the start_vaddr is not correct because of the tag.
> To fix it, we should untag the usespace pointers in pagemap_read().
> 
> I tested with 5.10-rc4 and the issue remains.
> 
> My test code is baed on [1]:
> 
> A userspace pointer which has been tagged by 0xb4: 0xb400007662f541c8
> 
> === userspace program ===
> 
> uint64 OsLayer::VirtualToPhysical(void *vaddr) {
> 	uint64 frame, paddr, pfnmask, pagemask;
> 	int pagesize = sysconf(_SC_PAGESIZE);
> 	off64_t off = ((uintptr_t)vaddr) / pagesize * 8; // off =
> 0xb400007662f541c8 / pagesize * 8 = 0x5a00003b317aa0
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
> 	start_vaddr = svpfn << PAGE_SHIFT; // start_vaddr ==
> 0xb400007662f54000
> 	end_vaddr = mm->task_size;
> 
> 	/* watch out for wraparound */
> 	// svpfn == 0xb400007662f54
> 	// (mm->task_size >> PAGE) == 0x8000000
> 	if (svpfn > mm->task_size >> PAGE_SHIFT) // the condition is true because
> of the tag 0xb4
> 		start_vaddr = end_vaddr;
> 
> 	ret = 0;
> 	while (count && (start_vaddr < end_vaddr)) { // we cannot visit correct
> entry because start_vaddr is set to end_vaddr
> 		int len;
> 		unsigned long end;
> 		...
> 	}
> 	...
> }
> 
> [1]
> https://github.com/stressapptest/stressapptest/blob/master/src/os.cc#L158
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
> @@ -1599,11 +1599,11 @@ static ssize_t pagemap_read(struct file *file, char
> __user *buf,
> 
>  	src = *ppos;
>  	svpfn = src / PM_ENTRY_BYTES;
> -	start_vaddr = svpfn << PAGE_SHIFT;
> +	start_vaddr = untagged_addr(svpfn << PAGE_SHIFT);
>  	end_vaddr = mm->task_size;
> 
>  	/* watch out for wraparound */
> -	if (svpfn > mm->task_size >> PAGE_SHIFT)
> +	if (start_vaddr > mm->task_size)
>  		start_vaddr = end_vaddr;

Wouldn't the untag be done by the user reading pagemap file?
With this patch, even users pass an illegal address, for example,
users put a tag on a virtual address which hasn't really a tag,
they will still get the right pagemap.

> 
>  	/*
> --
> 2.18.0

Thanks
Barry


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
