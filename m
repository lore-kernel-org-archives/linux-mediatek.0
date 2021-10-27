Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0752C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 15:49:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC299610A0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 15:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC299610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NZp26MOTkX1/Erlwgpw47UISSpAgsEg9u3HE8jAi+Lc=; b=H4CJOWNh3Sl2oo
	87b7Qf2AvmaSfX+kOG6L8uZ7wNfghCYkyA3tM4OxpVynqkfVsRw18th8AEamBBTEyhCUK0eJ7JFA7
	0TShl8yeWSp7Ud2dBGGoAgXeoF88Q3YjYqPV3DA26AOddt1HfzaO1cc68ghFmWDzaVs/4rpi1zEmW
	O8cfHIoT5FwYAqJOcIRVc3/BSABigbPdGBzw798BXyYcvZ9uufzVpcRWgXO6gV4ACSlwztd0KfUTD
	LJ+V3d0/GA6ks4j17Ek2ER6b/1iIlQ+jU6svZMgU5Vc1fFyWNwHg81rAI2kO61dhi+LRSyzPrzHTR
	vMC4luxbY1scCzvWaNXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mflAs-005Mx9-LL; Wed, 27 Oct 2021 15:49:10 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mflAe-005Mub-Ix; Wed, 27 Oct 2021 15:48:58 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1635349723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tkgVdeXd598pY6QU8+NQfjeQPsQIGyv6eN0Glc1LxB8=;
 b=E1mttTQNJGFfAAYzAmlbyJlajz+M1aCHTFA0exSqMApNuSblDEJ/VWVzbUiib9QPsnIDSG
 bqG1p6eHKr32gHH7LUa8Q6gm7GWXtBCoano7f85qDMZU6wimszeQAUxkgoVmuWymqt5g9+
 gkB/aJR5hqmxLjaG+ud4Pmh8pBFBoy8wObsI0NagaE90M1vtHKn/OSm+1id6atWiPHy3qE
 2jAwkoPAuPLantUo940hSj8BskMyWLcoR12DuYwbcAvPhGg/FAXm8Yu1iq9MGl6r/Wvxch
 SgG9+XVztZfP6u1CV2he2FKpjLX92dXO5RKZBwYEhoKMj/xOElRmQqeo5QtsVQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1635349723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tkgVdeXd598pY6QU8+NQfjeQPsQIGyv6eN0Glc1LxB8=;
 b=vFfC/cCfKpiBQYOBxRqi7Tsb/O51LcCf3i/k0yyiJi6iXtBd7cWNLp5srPz34r7Ueikskh
 GZvvGnQTSpWHdTCw==
To: Petr Mladek <pmladek@suse.com>
Cc: "chunlei.wang" <Chunlei.wang@mediatek.com>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] printk: ringbuffer: Improve prb_next_seq() performance
In-Reply-To: <YXlddJxLh77DKfIO@alley>
References: <YXlddJxLh77DKfIO@alley>
Date: Wed, 27 Oct 2021 17:54:42 +0206
Message-ID: <875ytih3j9.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_084856_811247_09D37BEB 
X-CRM114-Status: GOOD (  11.19  )
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

On 2021-10-27, Petr Mladek <pmladek@suse.com> wrote:
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

You also need this hunk:

@@ -530,7 +530,8 @@ static enum desc_state desc_read(struct prb_desc_ring *desc_ring,
 	state_val = atomic_long_read(state_var); /* LMM(desc_read:E) */
 	d_state = get_desc_state(id, state_val);
 out:
-	atomic_long_set(&desc_out->state_var, state_val);
+	if (desc_out)
+		atomic_long_set(&desc_out->state_var, state_val);
 	return d_state;
 }

Sorry, I missed it in my last review. This time I build+boot tested the patch.

With this hunk added:

Reviewed-by: John Ogness <john.ogness@linutronix.de>

John

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
