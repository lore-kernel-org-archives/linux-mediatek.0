Return-Path: <SRS0=DXFh=PU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28DA4C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 10:07:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE2BF61051
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 10:07:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE2BF61051
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9beDOKFxK6feKAw3l5VI5zt8sHhN98Q1lH/Ze8LLcZE=; b=2OJ8ZgrEW2EJ2T
	PhhDV1fTV++F3mD7sDeGxn0maFu0jE3r+wanfUcSNbkjHQA4w2KVMHUlfIEqEdsYRwf/chKd2kh8d
	TfFpnu6yMT9/2LyeB0eMvbMr1Iyle4udeqXDJg7UsVZPxI7g9E1cubpllkpMO2tuUKgOI0fgOOXIm
	Ni1hoYzafczmtDOomtdiN7m0B/nWFzDStYHJ4Dr3T92lYHSIFc9M79wm5szee2BmbHYT9v0/1qR+E
	aD8dMpZYUGr7R319UHbLRHlGYGYz0OszQHjojCaSgAtEmOq+TWiaSMFErNlsGNDhafhQ4VeRNdaBz
	wNH8v83lEz9zJw/Jns2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhUDH-00FuPk-6T; Mon, 01 Nov 2021 10:06:47 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhUD4-00FuNB-Ay; Mon, 01 Nov 2021 10:06:35 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 4C6491FD29;
 Mon,  1 Nov 2021 10:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1635761184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WH7VChrDI+e9Uk1fqS2sz7sqWyDarVDdnxdnYZmqXAk=;
 b=vHTq/U3Id6FrBhLsYrLNIAncwMSC+Auwky48/YfxU80iYDZ/NpKm4Q5X+AK+Mku2Vplu4z
 62bOyc4rgBXHnlCEvBRRueCkPtt8DAJJX1x5BBP0bCkaH52L6AjLNpzblJdaKjUfUfLWYW
 JB1ABBbVTMLdFBEMsLncLOHaQxmQKw0=
Received: from suse.cz (unknown [10.100.224.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id C5293A3B83;
 Mon,  1 Nov 2021 10:06:23 +0000 (UTC)
Date: Mon, 1 Nov 2021 11:06:23 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: "chunlei.wang" <Chunlei.wang@mediatek.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] printk: ringbuffer: Improve prb_next_seq() performance
Message-ID: <YX+8H8ApU/jm2lo9@alley>
References: <YXlddJxLh77DKfIO@alley>
 <875ytih3j9.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875ytih3j9.fsf@jogness.linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_030634_574134_6E75383A 
X-CRM114-Status: GOOD (  20.61  )
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

On Wed 2021-10-27 17:54:42, John Ogness wrote:
> On 2021-10-27, Petr Mladek <pmladek@suse.com> wrote:
> > diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
> > index 8a7b7362c0dd..24f47fbefbb5 100644
> > --- a/kernel/printk/printk_ringbuffer.c
> > +++ b/kernel/printk/printk_ringbuffer.c
> > @@ -474,8 +474,10 @@ static enum desc_state desc_read(struct prb_desc_ring *desc_ring,
> >  	 * state has been re-checked. A memcpy() for all of @desc
> >  	 * cannot be used because of the atomic_t @state_var field.
> >  	 */
> > -	memcpy(&desc_out->text_blk_lpos, &desc->text_blk_lpos,
> > -	       sizeof(desc_out->text_blk_lpos)); /* LMM(desc_read:C) */
> > +	if (desc_out) {
> > +		memcpy(&desc_out->text_blk_lpos, &desc->text_blk_lpos,
> > +		       sizeof(desc_out->text_blk_lpos)); /* LMM(desc_read:C) */
> > +	}
> >  	if (seq_out)
> >  		*seq_out = info->seq; /* also part of desc_read:C */
> >  	if (caller_id_out)
> 
> You also need this hunk:
> 
> @@ -530,7 +530,8 @@ static enum desc_state desc_read(struct prb_desc_ring *desc_ring,
>  	state_val = atomic_long_read(state_var); /* LMM(desc_read:E) */
>  	d_state = get_desc_state(id, state_val);
>  out:
> -	atomic_long_set(&desc_out->state_var, state_val);
> +	if (desc_out)
> +		atomic_long_set(&desc_out->state_var, state_val);
>  	return d_state;
>  }
> 
> Sorry, I missed it in my last review. This time I build+boot tested the patch.

Urgh. Great catch! It seems that my testing was not good enough. Or
that I was just lucky.

> With this hunk added:
> 
> Reviewed-by: John Ogness <john.ogness@linutronix.de>

I am going to queue it for 5.17 after the pull request for 5.16 is
accepted. I do not feel comfortable to rush this into 5.16, especially
after finding the bug. The merge window has just started...

Anyway, thanks a lot for review and catching the mistake.

Best Regards,
Petr

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
