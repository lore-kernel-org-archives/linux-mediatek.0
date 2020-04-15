Return-Path: <SRS0=9LKV=57=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4FADC2BB1D
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Apr 2020 00:08:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A86C22076C
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Apr 2020 00:08:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r4ztgA84";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2mGwezel"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A86C22076C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6kNBcxcMV8H+CjCrVptuubFiIRaLANzJmsQDxsx9ny8=; b=r4ztgA84cBZGt1
	XpAI2rkKqT77ppRq1lG7wzpMn3A/3oYysywj4ky8jnN+QwUMlQUeY0li2x9zdgU8LWAagB3cEvWvI
	fUJt/ifWC6JahORzHmq3RH3TA9MA9mAmBjU6F/c70YDiKkHo9sPFTcwbH95K3j8Nmwlrx6YAKkkK5
	PZHfAgYCEHtdd3JQB9I0ckjiCHaMwApx2OOIAnwRA143NeKI5MT6uxbsfxKHUkeJPEI+3Y+6VDNoU
	AAZi8LdyUxq3j5hdSvli78aCwbVk5tAL4eCquBUeT11pWUM5tZN+2brrPitF9uRgSSFDV/hHuV8bR
	kB2UENMjNDeNo3mgkZ6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOVbT-00065Q-Pl; Wed, 15 Apr 2020 00:08:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOVbR-000655-3v
 for linux-mediatek@lists.infradead.org; Wed, 15 Apr 2020 00:08:30 +0000
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 949782076B;
 Wed, 15 Apr 2020 00:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586909307;
 bh=cdX73dCi301I9IaDllfT9erksCJfp1wTJ5tC0x+WiuA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=2mGwezel0ZXkJr4sx2a0wDhInI7pjl5enz3UaaoGYhfXZ/wUoVmUbTrcMwRxXw1jv
 fPXjR/bmvr/56sm7nrV2qyYWd7Npe3LuzHY44neC3rTOdwDK4OxAcn95d5EC4SoJl7
 /Nu4RdF2mi2gnU/YXKDoSs10B1MsP9DDHzpxvpbw=
Date: Tue, 14 Apr 2020 17:08:27 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH] mm/gup: fix null pointer dereference detected by coverity
Message-Id: <20200414170827.d32fc1fc12a33b140b740b94@linux-foundation.org>
In-Reply-To: <20200407095107.1988-1-miles.chen@mediatek.com>
References: <20200407095107.1988-1-miles.chen@mediatek.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_170829_179181_6C2CB09F 
X-CRM114-Status: GOOD (  11.25  )
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
Cc: linux-mm@kvack.org, Peter Xu <peterx@redhat.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 7 Apr 2020 17:51:07 +0800 Miles Chen <miles.chen@mediatek.com> wrote:

> In fixup_user_fault(), it is possible that unlocked is NULL,
> so we should test unlocked before using it.
> 
> For example, in arch/arc/kernel/process.c, NULL is passed
> to fixup_user_fault().
> 
> SYSCALL_DEFINE3(arc_usr_cmpxchg, int *, uaddr, int, expected, int, new)
> {
> ...
> 	ret = fixup_user_fault(current, current->mm, (unsigned long) uaddr,
> 			       FAULT_FLAG_WRITE, NULL);
> ...
> }

(cc Peter)

> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1230,7 +1230,8 @@ int fixup_user_fault(struct task_struct *tsk, struct mm_struct *mm,
>  	if (ret & VM_FAULT_RETRY) {
>  		down_read(&mm->mmap_sem);
>  		if (!(fault_flags & FAULT_FLAG_TRIED)) {
> -			*unlocked = true;
> +			if (unlocked)
> +				*unlocked = true;
>  			fault_flags |= FAULT_FLAG_TRIED;
>  			goto retry;
>  		}

Not sure.  If the caller passes FAULT_FLAG_ALLOW_RETRY then they must
also pass in a valid non-NULL `unlocked'.  If the caller passed
FAULT_FLAG_ALLOW_RETRY and unlocked==NULL then the resulting oops is an
appropriate way of reporting this mistake.  I think?


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
