Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B1DC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 07:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tUFomvnnUpoBReQfiiQUHW+BI549gNaOmIYh7cDyhE4=; b=dqvJdObC3DjoaV
	ZhsWqpluUPPCIFjWySucpLLd3DUImacdvQnd+J+a2tokfkftpLGp1biknE/Cwl29lZ4+HSxwuN9E5
	LyJmIETtbc7bM67DOUoIG5i5P6s5axBA61/8yMpz8lfmhBxRONQFSFKFVgG8IBH/9oqqvKoSYSEqr
	yO7KJUiaNAgVC9Ys1uogHcqLLtFJ83vu9phPfJuBEXyJk6hAEa6wljSQsNxJzKWlbS6u+ozSOjtNo
	d7pz0aWm/RLbpl0zyj7tFjxoJOMpgYPNmuNshGmpfYy33YPvu1fU4XbNecvopwoP2nzlLjT2K3IMB
	CKnHqOhRy3ku/Zzelk9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nciqE-00FS9a-TA; Fri, 08 Apr 2022 07:15:34 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncipz-00FS3z-Cz; Fri, 08 Apr 2022 07:15:20 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 97DFF1F861;
 Fri,  8 Apr 2022 07:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1649402115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rx92wkjSz2UMxpAC/s3Qf3G07LKMpAhWUOPb7IxbfxE=;
 b=sgoo/tkmEGtjdOw29m3gYXRlFaRWSv2KheW+5rlQ9DicrG4IGLawTFFuv6ajTINSF1SXt6
 jJDZrLOT5zQ8YXf0gGzeHihOkzfRQbpj3HAWWQZdA0tiIi50U190Sem3b47dMtUPE6/SU3
 zKjw4VaJKSq4UJleQ+PUY154Co+d4ck=
Received: from suse.cz (unknown [10.100.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 362F6A3B82;
 Fri,  8 Apr 2022 07:15:15 +0000 (UTC)
Date: Fri, 8 Apr 2022 09:15:14 +0200
From: Petr Mladek <pmladek@suse.com>
To: Saravana Kannan <saravanak@google.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Chunlei.wang@mediatek.com,
 john.ogness@linutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 rostedt@goodmis.org, senozhatsky@chromium.org, kernel-team@android.com
Subject: Re: [PATCH v2] printk: ringbuffer: Improve prb_next_seq() performance
Message-ID: <Yk/hAubbZeV43ejA@alley>
References: <YXlddJxLh77DKfIO@alley>
 <20220408004821.4010969-1-saravanak@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220408004821.4010969-1-saravanak@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_001519_637758_B502FDAB 
X-CRM114-Status: GOOD (  25.57  )
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

On Thu 2022-04-07 17:48:21, Saravana Kannan wrote:
> 
> > Petr Mladek <pmladek@suse.com> wrote:
> > 
> > prb_next_seq() always iterates from the first known sequence number.
> > In the worst case, it might loop 8k times for 256kB buffer,
> > 15k times for 512kB buffer, and 64k times for 2MB buffer.
> > 
> > It was reported that pooling and reading using syslog interface
> > might occupy 50% of CPU.
> > 
> > Speedup the search by storing @id of the last finalized descriptor.
> > 
> > The loop is still needed because the @id is stored and read in the best
> > effort way. An atomic variable is used to keep the @id consistent.
> > But the stores and reads are not serialized against each other.
> > The descriptor could get reused in the meantime. The related sequence
> > number will be used only when it is still valid.
> > 
> > An invalid value should be read _only_ when there is a flood of messages
> > and the ringbuffer is rapidly reused. The performance is the least
> > problem in this case.
> > 
> > --- a/kernel/printk/printk_ringbuffer.h
> > +++ b/kernel/printk/printk_ringbuffer.h
> > @@ -75,6 +75,7 @@ struct prb_desc_ring {
> >  	struct printk_info	*infos;
> >  	atomic_long_t		head_id;
> >  	atomic_long_t		tail_id;
> > +	atomic_long_t		last_finalized_id;
> >  };
> 
> 
> I really know nothing about this code, but while looking around
> kernel/printk/ I noticed kernel/printk/printk.c has these lines in
> log_buf_vmcoreinfo_setup().
> 
> 	VMCOREINFO_STRUCT_SIZE(prb_desc_ring);
> 	VMCOREINFO_OFFSET(prb_desc_ring, count_bits);
> 	VMCOREINFO_OFFSET(prb_desc_ring, descs);
> 	VMCOREINFO_OFFSET(prb_desc_ring, infos);
> 	VMCOREINFO_OFFSET(prb_desc_ring, head_id);
> 	VMCOREINFO_OFFSET(prb_desc_ring, tail_id);
> 
> Would this header file change also require a change to that location?
> Something like
> 
> 	VMCOREINFO_OFFSET(prb_desc_ring, head_id);
> 	VMCOREINFO_OFFSET(prb_desc_ring, tail_id);
> +	VMCOREINFO_OFFSET(prb_desc_ring, last_finalized_id);

It is actually not needed. VMCOREINFO_*() macros define some data
that are used by the "crash" tool when reading crashdumps. The field
"last_finalized_id" is used only at runtime. It is not needed
for reading the log in the crashdump.

Anyway, thanks for the question. It is great to know that there are
more people checking our changes.

Best Regards,
Petr

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
