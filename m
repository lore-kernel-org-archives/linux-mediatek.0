Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3D5C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 00:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SxLruhZdR+K/v/UEsiW187IUXN7Wf0sXdhcXKZi3lJU=; b=bnrLINBqh4FyQu29FgQO7AOZi5
	4/MS5NWtrXATg4H0mOgNkkuARKCEONfPRM2854luZzaHTc6l7Jcf1pLO2u3ssASFB95CwPl7pcfJC
	XkjOMTKAbyLS10JdnY7552RV021IzXNq7eBGmlPGcOdyJtl4ku9+kRHD+l4vFSN8wR93oBbJiLWXL
	N2Ek/UTlsdrHzmYHlPaoeGl/xOdgI6ysiKHdHIaLHVCReVsgYkS6MEe657p2T1sHdn3KSnd8lpQ17
	gsZKhcfshD8+crfVccHtA3ozqKDU74Buk+oKQsG13U4dfZ+MLFC/7tJrDG9++OGWEy7wwzpgC2P06
	9Iy+Rphg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nccnq-00ESZB-L1; Fri, 08 Apr 2022 00:48:42 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nccne-00ESWK-NG
 for linux-mediatek@lists.infradead.org; Fri, 08 Apr 2022 00:48:32 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id
 a18-20020a25bad2000000b0063360821ea7so5467592ybk.15
 for <linux-mediatek@lists.infradead.org>; Thu, 07 Apr 2022 17:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=ithdVlozh5jFC5LDPPJEaLYRLxUsUDLKrVaBbck8woI=;
 b=omXiV0brS6SC4fAsszjr3vh7SFO8aEPobqoxOFDY5gSXD4t7YUUrTf7kvD2voWFdGR
 0zfKeLrkPKhiVG1D/WWtxb29Iv343o7BnI/AvfEqwHDPJmrMzF1O3Vnpao8P0/fXyCgx
 nY3TY7bOcVwFNQFpshyTnzdQgZOwX7Q1RBQCrzsncOpPhEbEyqD2cFwzhTN4wfmDFPs5
 MekcHDrPOPryJQWDeii7ymb0dhrvpcoLFAtJ70AuD4FM5oNiUWAjY4U2/aOY8j1hxnrv
 2Ha/emP+PaKxv0PdcVrgerBl0AxigiyEeU0+NcNeFRn8UX2MwLAuPhkTGPDKgIXxlgUI
 6olQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ithdVlozh5jFC5LDPPJEaLYRLxUsUDLKrVaBbck8woI=;
 b=Iw6ihYMBTj6ROIt1XEUzYvGle8WPm+8Hk4XyUwPdTAbZMUHa7kOw/ptK/jVCBtov+j
 Zw2iy3bb7AA15CRv+R0+9UHgMefInGpNhW7Z89kwBkrMSJcoZ5p/8RdZUiavTbk+6rWv
 hBdCYIakBJ4MouqMc2iqj/s5P2eEbTsiEIdwatV0jxkdLcYKJNHoRBhOTZ0PwJg70Wpm
 IjGPQDf2VtIurMmOoJ+Pdq7Es8vyLNFRcHTYfQYpzf+UUHbCLYDUKVtRCasE6xVzeOZh
 G3J1rFfbdI6+TNjDhYaHNQUxeezCyIdtl3DsRgMkKVl4WqYYmSNUA77Ix94gvkfKleTR
 yonw==
X-Gm-Message-State: AOAM532U9RHaxaSMwP6oN3Jeu4aTl4SIuf41jo8u4FPMcNROd4CHwIrC
 eTmI5CuXJ5/j5XjTo9+pig8no0bWfvB39cw=
X-Google-Smtp-Source: ABdhPJxZfTDhCmiUWxemMxtmOYKdXt8UIDGz1EMPXmcT+4UwQKXx3DIeNZNwfDy6tGznTHCK1StYatP5YLU97sQ=
X-Received: from saravanak.san.corp.google.com
 ([2620:15c:2d:3:b203:eb20:896d:ef2f])
 (user=saravanak job=sendgmr) by 2002:a05:6902:1d1:b0:636:fa07:4b9a with SMTP
 id u17-20020a05690201d100b00636fa074b9amr12044080ybh.590.1649378905528; Thu,
 07 Apr 2022 17:48:25 -0700 (PDT)
Date: Thu,  7 Apr 2022 17:48:21 -0700
In-Reply-To: <YXlddJxLh77DKfIO@alley>
Message-Id: <20220408004821.4010969-1-saravanak@google.com>
Mime-Version: 1.0
References: <YXlddJxLh77DKfIO@alley>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
Subject: Re: [PATCH v2] printk: ringbuffer: Improve prb_next_seq() performance
From: Saravana Kannan <saravanak@google.com>
To: pmladek@suse.com, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chunlei.wang@mediatek.com, john.ogness@linutronix.de, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, rostedt@goodmis.org, 
 senozhatsky@chromium.org, kernel-team@android.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_174830_799370_C8B8474C 
X-CRM114-Status: GOOD (  33.54  )
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


> Petr Mladek <pmladek@suse.com> wrote:
> 
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
> Changes against v1:
> 
>   + Read @seq by the last finalized @id directly in prb_next_seq() (John)
> 
>  kernel/printk/printk_ringbuffer.c | 49 ++++++++++++++++++++++++++++---
>  kernel/printk/printk_ringbuffer.h |  2 ++
>  2 files changed, 47 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
> index 8a7b7362c0dd..24f47fbefbb5 100644
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
> @@ -2005,9 +2015,39 @@ u64 prb_first_valid_seq(struct printk_ringbuffer *rb)
>   */
>  u64 prb_next_seq(struct printk_ringbuffer *rb)
>  {
> -	u64 seq = 0;
> +	struct prb_desc_ring *desc_ring = &rb->desc_ring;
> +	enum desc_state d_state;
> +	unsigned long id;
> +	u64 seq;
> +
> +	/* Check if the cached @id still points to a valid @seq. */
> +	id = atomic_long_read(&desc_ring->last_finalized_id);
> +	d_state = desc_read(desc_ring, id, NULL, &seq, NULL);
>  
> -	/* Search forward from the oldest descriptor. */
> +	if (d_state == desc_finalized || d_state == desc_reusable) {
> +		/*
> +		 * Begin searching after the last finalized record.
> +		 *
> +		 * On 0, the search must begin at 0 because of hack#2
> +		 * of the bootstrapping phase it is not known if a
> +		 * record at index 0 exists.
> +		 */
> +		if (seq != 0)
> +			seq++;
> +	} else {
> +		/*
> +		 * The information about the last finalized sequence number
> +		 * has gone. It should happen only when there is a flood of
> +		 * new messages and the ringbuffer is rapidly recycled.
> +		 * Give up and start from the beginning.
> +		 */
> +		seq = 0;
> +	}
> +
> +	/*
> +	 * The information about the last finalized @seq might be inaccurate.
> +	 * Search forward to find the current one.
> +	 */
>  	while (_prb_read_valid(rb, &seq, NULL, NULL))
>  		seq++;
>  
> @@ -2044,6 +2084,7 @@ void prb_init(struct printk_ringbuffer *rb,
>  	rb->desc_ring.infos = infos;
>  	atomic_long_set(&rb->desc_ring.head_id, DESC0_ID(descbits));
>  	atomic_long_set(&rb->desc_ring.tail_id, DESC0_ID(descbits));
> +	atomic_long_set(&rb->desc_ring.last_finalized_id, DESC0_ID(descbits));
>  
>  	rb->text_data_ring.size_bits = textbits;
>  	rb->text_data_ring.data = text_buf;
> diff --git a/kernel/printk/printk_ringbuffer.h b/kernel/printk/printk_ringbuffer.h
> index 73cc80e01cef..18cd25e489b8 100644
> --- a/kernel/printk/printk_ringbuffer.h
> +++ b/kernel/printk/printk_ringbuffer.h
> @@ -75,6 +75,7 @@ struct prb_desc_ring {
>  	struct printk_info	*infos;
>  	atomic_long_t		head_id;
>  	atomic_long_t		tail_id;
> +	atomic_long_t		last_finalized_id;
>  };


I really know nothing about this code, but while looking around
kernel/printk/ I noticed kernel/printk/printk.c has these lines in
log_buf_vmcoreinfo_setup().

	VMCOREINFO_STRUCT_SIZE(prb_desc_ring);
	VMCOREINFO_OFFSET(prb_desc_ring, count_bits);
	VMCOREINFO_OFFSET(prb_desc_ring, descs);
	VMCOREINFO_OFFSET(prb_desc_ring, infos);
	VMCOREINFO_OFFSET(prb_desc_ring, head_id);
	VMCOREINFO_OFFSET(prb_desc_ring, tail_id);

Would this header file change also require a change to that location?
Something like

	VMCOREINFO_OFFSET(prb_desc_ring, head_id);
	VMCOREINFO_OFFSET(prb_desc_ring, tail_id);
+	VMCOREINFO_OFFSET(prb_desc_ring, last_finalized_id);

-Saravana

>  
>  /*
> @@ -258,6 +259,7 @@ static struct printk_ringbuffer name = {							\
>  		.infos		= &_##name##_infos[0],						\
>  		.head_id	= ATOMIC_INIT(DESC0_ID(descbits)),				\
>  		.tail_id	= ATOMIC_INIT(DESC0_ID(descbits)),				\
> +		.last_finalized_id = ATOMIC_INIT(DESC0_ID(descbits)),				\
>  	},											\
>  	.text_data_ring = {									\
>  		.size_bits	= (avgtextbits) + (descbits),					\
> -- 
> 2.26.2
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
