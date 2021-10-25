Return-Path: <SRS0=S3hZ=PN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69656C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 22:07:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E73860EDF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 22:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E73860EDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TCbr7keB3doENFoMgQdJgFNfabC5PC1d/iyChpSdNeI=; b=1JNySGQdOIGlzH
	n9fZWdmovaLwOMD7gteHbexVMGBmZmKVeud7OhDrctu1+CdN8ZbnBwMiFWc8Q9zGLdAjgpuAigCy9
	xrhwgN17s3D4k//kGU0W6sh5AllQ97jjMPUdwH0hBni/+IfNBhGV4BLfsf+9YG6SMYC7uk/zhsNT9
	QIdN6Xgbv/aRz8ZZiJYRx/iSCEoOPDE2gap1cpVhWoKC7cB+++Acyfl5E0qTNW9xSD/B+Z4CnnJoa
	sjdG7zg1zvPX0HTn1sYaknlMOrrDxl8rZwhzd8e9k3H+QRUWwFhn3nL1hJNK2YRHCnwcBNLkrK+p5
	ymbuMnYSdljJhiFlo0wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf87R-000BlR-RZ; Mon, 25 Oct 2021 22:07:01 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf87F-000Bjs-6S; Mon, 25 Oct 2021 22:06:51 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1635199603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yVU4mMn33Kwpph44oLBWEPBLX6RNDcmGrG4+Ry5KOkA=;
 b=euiTL59nXYUkVeKmlFBnKjcDMCYFlyPyD0dtT94q9SXxJwLIqlhTremNe9qwu51N1hjCra
 J8O9vzsI0cChQN6ZPrJlpXSDu2zkkymOIvSrcx/r7bSp3+wTZrFXeJKiJ4TjeS6NvohOvC
 IycJ/i38YGwccCleSWPtfKr5dsvBTBy2KxtFCmACb2pQ1Lf3UgddVEFLUXkAd1ICBWsiRY
 6sTD94EFIOHNRdPwvTd933fyrOG9EVRHtW0hkGWNoMdJ/LRM54GcopFrVmSVNSNZ9AsBor
 P7k86YZj873UE5OjDJ797+snDNzi3gP/YApbCyK12EDq4RF0BZbZ/jJ2pWgl1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1635199603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yVU4mMn33Kwpph44oLBWEPBLX6RNDcmGrG4+Ry5KOkA=;
 b=dJVXrJKdw3VoxNskf/5WpIkj4wWOfL7MRSKeuK3jifyQYbOwGWOy+IfmHuFQYdo5s0Pw4Z
 TS+ls8Yq3YpSjLBQ==
To: Petr Mladek <pmladek@suse.com>, "chunlei.wang" <Chunlei.wang@mediatek.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] printk: ringbuffer: Improve prb_next_seq() performance
In-Reply-To: <YXavL+XxgAPbtJQf@alley>
References: <1587709294.9792.5.camel@mbjsdccf07>
 <20200424070219.GA543@jagdpanzerIV.localdomain>
 <11f00d85b770e676cd0e06d87cc819ce82bb0beb.camel@mediatek.com>
 <YXaufehhi8QVCnds@alley> <YXavL+XxgAPbtJQf@alley>
Date: Tue, 26 Oct 2021 00:12:43 +0206
Message-ID: <87o87c92to.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_150649_579294_4A5C6073 
X-CRM114-Status: GOOD (  35.83  )
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

Hi Petr,

I am OK with this new best effort cache. But I do have some minor
comments about the implementation...

On 2021-10-25, Petr Mladek <pmladek@suse.com> wrote:
> prb_next_seq() always iterates from the first known sequence number.
> In the worst case, it might loop 8k times for 256kB buffer,
> 15k times for 512kB buffer, and 64k times for 2MB buffer.
>
> It was reported that pooling and reading using syslog interface
> might occupy 50% of CPU.
>
> Speedup the search by storing @id of the last finalized descriptor.
>
> The loop is still needed because the @id is stored and read in the best
> effort way. An atomic variable is used to keep the @id consistent.
> But the stores and reads are not serialized against each other.
> The descriptor could get reused in the meantime. The related sequence
> number will be used only when it is still valid.
>
> An invalid value should be read _only_ when there is a flood of messages
> and the ringbuffer is rapidly reused. The performance is the least
> problem in this case.
>
> Reported-by: Chunlei Wang <chunlei.wang@mediatek.com>
> Signed-off-by: Petr Mladek <pmladek@suse.com>
> ---
>  kernel/printk/printk_ringbuffer.c | 46 ++++++++++++++++++++++++++++---
>  kernel/printk/printk_ringbuffer.h |  2 ++
>  2 files changed, 44 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
> index 8a7b7362c0dd..7e0c11be07c8 100644
> --- a/kernel/printk/printk_ringbuffer.c
> +++ b/kernel/printk/printk_ringbuffer.c
> @@ -474,8 +474,10 @@ static enum desc_state desc_read(struct prb_desc_ring *desc_ring,
>  	 * state has been re-checked. A memcpy() for all of @desc
>  	 * cannot be used because of the atomic_t @state_var field.
>  	 */
> -	memcpy(&desc_out->text_blk_lpos, &desc->text_blk_lpos,
> -	       sizeof(desc_out->text_blk_lpos)); /* LMM(desc_read:C) */
> +	if (desc_out) {
> +		memcpy(&desc_out->text_blk_lpos, &desc->text_blk_lpos,
> +		       sizeof(desc_out->text_blk_lpos)); /* LMM(desc_read:C) */
> +	}
>  	if (seq_out)
>  		*seq_out = info->seq; /* also part of desc_read:C */
>  	if (caller_id_out)
> @@ -1449,6 +1451,9 @@ static void desc_make_final(struct prb_desc_ring *desc_ring, unsigned long id)
>  
>  	atomic_long_cmpxchg_relaxed(&d->state_var, prev_state_val,
>  			DESC_SV(id, desc_finalized)); /* LMM(desc_make_final:A) */
> +
> +	/* Best effort to remember the last finalized @id. */
> +	atomic_long_set(&desc_ring->last_finalized_id, id);
>  }
>  
>  /**
> @@ -1657,7 +1662,12 @@ void prb_commit(struct prb_reserved_entry *e)
>   */
>  void prb_final_commit(struct prb_reserved_entry *e)
>  {
> +	struct prb_desc_ring *desc_ring = &e->rb->desc_ring;
> +
>  	_prb_commit(e, desc_finalized);
> +
> +	/* Best effort to remember the last finalized @id. */
> +	atomic_long_set(&desc_ring->last_finalized_id, e->id);
>  }
>  
>  /*
> @@ -1988,6 +1998,30 @@ u64 prb_first_valid_seq(struct printk_ringbuffer *rb)
>  	return seq;
>  }
>  
> +/* Try to read seq from the last known location. */
> +static u64 prb_last_finalized_seq(struct printk_ringbuffer *rb)
> +{
> +	struct prb_desc_ring *desc_ring = &rb->desc_ring;
> +	enum desc_state d_state;
> +	unsigned long id;
> +	u64 seq = 0;

It is not necessary to initialize @seq.

> +
> +	/* Check if the cached @id still points to a valid @seq. */
> +	id = atomic_long_read(&desc_ring->last_finalized_id);
> +	d_state = desc_read(desc_ring, id, NULL, &seq, NULL);
> +
> +	if (d_state == desc_finalized || d_state == desc_reusable)
> +		return seq;
> +
> +	/*
> +	 * The information about the last finalized sequence number
> +	 * has gone. It should happen only when there is a flood of
> +	 * new messages and the ringbuffer is rapidly recycled.
> +	 * Give up and start from the beginning.
> +	 */
> +	return 0;

Returning 0 is a bit odd here. For the problem this patch is solving it
would work, but if this new helper is ever used anywhere else, it would
be a bizarre exception since 0 can also mean success. See my suggestion
below.

> +}
> +
>  /**
>   * prb_next_seq() - Get the sequence number after the last available record.
>   *
> @@ -2005,9 +2039,12 @@ u64 prb_first_valid_seq(struct printk_ringbuffer *rb)
>   */
>  u64 prb_next_seq(struct printk_ringbuffer *rb)
>  {
> -	u64 seq = 0;
> +	u64 seq = prb_last_finalized_seq(rb);

If prb_last_finalized_seq() was successful (which can also be 0 on
success) then there is no point reading that record. We already know
that it must be higher.

I suggest implementing everything within prb_next_seq() instead of
adding the helper function prb_last_finalized_seq(). IMHO this cleanly
handles the case of a failed read for the last finalized id and avoids
an unnecessary descriptor read.

u64 prb_next_seq(struct printk_ringbuffer *rb)
{
	struct prb_desc_ring *desc_ring = &rb->desc_ring;
	enum desc_state d_state;
	unsigned long id;
	u64 seq;

	/* Check if the cached @id still points to a valid @seq. */
	id = atomic_long_read(&desc_ring->last_finalized_id);
	d_state = desc_read(desc_ring, id, NULL, &seq, NULL);

	if (d_state == desc_finalized || d_state == desc_reusable) {
		/* Begin searching after the last finalized record. */
		seq++;
	} else {
		/*
		 * The information about the last finalized sequence number
		 * has gone. It should happen only when there is a flood of
		 * new messages and the ringbuffer is rapidly recycled.
		 * Give up and start from the beginning.
		 */
		seq = 0;
	}

	/*
	 * The information about the last finalized @seq might be inaccurate.
	 * Search forward to find the current one.
	 */
	while (_prb_read_valid(rb, &seq, NULL, NULL))
		seq++;

	return seq;
}

>  
> -	/* Search forward from the oldest descriptor. */
> +	/*
> +	 * The information about the last finalized @seq might be inaccurate.
> +	 * Search forward to find the current one.
> +	 */
>  	while (_prb_read_valid(rb, &seq, NULL, NULL))
>  		seq++;
>  

John Ogness

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
