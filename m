Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76159CCA47F
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 13:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pK0aITHEOXhetYfa9jzRxv0dnqesZt/f+TIF3/+rls=; b=p34rTl9HGOCA1Wrrt6T+SGqKwL
	HVqMIfRCryuyTK96Unv67EM+5c+bobTVrfOtvkJNmTSCQo8GR/tDJF7lgaK5dk8gg+C7HlKCOQ/rV
	UiM2sXPDZFhz5vAgeoL3Dt1ZFpk0brSxiUUjychL9L0a0ccjjJPecUy42oDuvt2tCe0P/Zr28D66T
	zekeXBn4GEfLQuvY1F/j0cC8YvAOslGWBKVFgUXkZvd+G0pEqWeviVsm/KW4Ig+baitX57gQy29un
	NYkbt8LnmI1Sf+zIb8PgR9SdAYkMZZJVTaoR6JFOf6Ls6eTovpFJaHX1M57fYZbvsIF/axMz0WkW5
	7iqv8Hew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0kJH-003uzV-RE; Mon, 13 Jun 2022 13:40:51 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0kIS-003uPB-R7; Mon, 13 Jun 2022 13:40:02 +0000
Received: by mail-wr1-x42e.google.com with SMTP id k16so7186881wrg.7;
        Mon, 13 Jun 2022 06:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=wQnoBtrfVqerdDXtoRJNXxFJ8ERaywkQKEUxnchF8QU=;
        b=Tllb95AleXMxXyeBwv7CpMAXehORNHpEs+cthLcVV5jw9/oFcVQli7Afj7fCxQzmNE
         +C9c4mGSCLY/MylFVNEK2H4DbI4VgFTYB8wPeVZXqnj/g8r9R/HoSWLIu8ZzS1HI2+yA
         SvcFbCVln4LbAwEhjVIqzyMUx7z20qITI55robQo5dmXd8lHxX+FSdkemEMs0PgCLlNa
         Rm2f4zaTbnPhuHxoCPzBl2R0QH6JBY1V2m0A8xOO3SI6xJPTelAYvi5Oh6V5pn8hsW34
         +gjwvopzJESwJDVyC/Va9IerEMajbi7DefzuSNh+GxLUBw4vf7QJsLC/qP1m/bxCnzxU
         Z0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wQnoBtrfVqerdDXtoRJNXxFJ8ERaywkQKEUxnchF8QU=;
        b=xzKC6HTT+pjNmH8caNEDeZSkYIsLBQ3HJfG3yCxfhRSZdYO1raVh9aNOm+KmYEL9Ee
         cDxOnHZa+cXO6+/iUqC0F4fDO9Jk6F06Xb+EszOY6+0kDnBwPiDEsIHLHRZ7KcRKIHcE
         14fv2cC7zx5bllgL0chLq5qMPp9pXrZvScuRoT4lEJ8B2fnzFHOHJYFPtmuJsQ8ArJNW
         Wg2MQm+Czq7nGlnkv04x0KtIYxbe2dXJaLLB2cQEFA0hGzGhDuAfGGhFoZwAohyA4QGe
         n3XO5Da1bx/5KYo9QryrHGvAllqY+Syu0yL/nsVZE7XKUw5oxHkcF5YcJlH0Ftw5Dbe8
         llDA==
X-Gm-Message-State: AOAM5322usV6U3OL/7ZRpKeQ2Y3dKA6bohLnDjWeDSTqDSeUnVsaGAPE
	VvsCYs8StetHUdyyNeflh8s=
X-Google-Smtp-Source: ABdhPJzaB7syhPpYvqUXtQrW/XfIxiI0fU2XTi7T+9RC2+CQ6lyBLhW79NarIKvbDng0DRfhrmSyPw==
X-Received: by 2002:a5d:6d8c:0:b0:217:a419:c3f8 with SMTP id l12-20020a5d6d8c000000b00217a419c3f8mr42252830wrs.260.1655127595429;
        Mon, 13 Jun 2022 06:39:55 -0700 (PDT)
Received: from [192.168.0.36] ([37.223.143.134])
        by smtp.gmail.com with ESMTPSA id t7-20020a05600c198700b0039c5fb1f592sm9365680wmq.14.2022.06.13.06.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jun 2022 06:39:54 -0700 (PDT)
Message-ID: <fed3da9f-2a87-96f7-347b-d1c4f5f133ae@gmail.com>
Date: Mon, 13 Jun 2022 15:39:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] mailbox: mtk-cmdq: Remove proprietary cmdq_task_cb
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220608144055.27562-1-chunkuang.hu@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220608144055.27562-1-chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_064000_962696_E794B944 
X-CRM114-Status: GOOD (  17.65  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 08/06/2022 16:40, Chun-Kuang Hu wrote:
> rx_callback is a standard mailbox callback mechanism and could cover the
> function of proprietary cmdq_task_cb, so use the standard one instead of
> the proprietary one. Client driver has changed to use standard
> rx_callback, so remove proprietary cmdq_task_cb.
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/mailbox/mtk-cmdq-mailbox.c       | 11 -----------
>   include/linux/mailbox/mtk-cmdq-mailbox.h | 10 ----------
>   2 files changed, 21 deletions(-)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 2578e5aaa935..9465f9081515 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -192,15 +192,10 @@ static bool cmdq_thread_is_in_wfe(struct cmdq_thread *thread)
>   
>   static void cmdq_task_exec_done(struct cmdq_task *task, int sta)
>   {
> -	struct cmdq_task_cb *cb = &task->pkt->async_cb;
>   	struct cmdq_cb_data data;
>   
>   	data.sta = sta;
> -	data.data = cb->data;
>   	data.pkt = task->pkt;
> -	if (cb->cb)
> -		cb->cb(data);
> -
>   	mbox_chan_received_data(task->thread->chan, &data);
>   
>   	list_del(&task->list_entry);
> @@ -448,7 +443,6 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
>   static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
>   {
>   	struct cmdq_thread *thread = (struct cmdq_thread *)chan->con_priv;
> -	struct cmdq_task_cb *cb;
>   	struct cmdq_cb_data data;
>   	struct cmdq *cmdq = dev_get_drvdata(chan->mbox->dev);
>   	struct cmdq_task *task, *tmp;
> @@ -465,13 +459,8 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
>   
>   	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
>   				 list_entry) {
> -		cb = &task->pkt->async_cb;
>   		data.sta = -ECONNABORTED;
> -		data.data = cb->data;
>   		data.pkt = task->pkt;
> -		if (cb->cb)
> -			cb->cb(data);
> -
>   		mbox_chan_received_data(task->thread->chan, &data);
>   		list_del(&task->list_entry);
>   		kfree(task);
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> index 44365aab043c..a8f0070c7aa9 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -67,24 +67,14 @@ enum cmdq_code {
>   
>   struct cmdq_cb_data {
>   	int			sta;
> -	void			*data;
>   	struct cmdq_pkt		*pkt;
>   };
>   
> -typedef void (*cmdq_async_flush_cb)(struct cmdq_cb_data data);
> -
> -struct cmdq_task_cb {
> -	cmdq_async_flush_cb	cb;
> -	void			*data;
> -};
> -
>   struct cmdq_pkt {
>   	void			*va_base;
>   	dma_addr_t		pa_base;
>   	size_t			cmd_buf_size; /* command occupied size */
>   	size_t			buf_size; /* real buffer size */
> -	struct cmdq_task_cb	cb;
> -	struct cmdq_task_cb	async_cb;
>   	void			*cl;
>   };
>   

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
