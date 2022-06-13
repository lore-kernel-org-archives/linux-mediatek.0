Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24255C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 15:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:To:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCSbxSzVmSdmWReRWD/AVjmFe81cOiccc+5A+YgTfjw=; b=UtPeV51+xKEU1tlbtOnVEDMjGk
	SnJAI4qCzgR3HQVpIABwFFviAQSttDbltpClUnYprdM3r0x3P4s011+zPEJVLIszASSAEsP67zF7D
	E+hwPN6oXRl5lEpc4mPbNeaRExkoT6iQZCXMNiNlt23Ob6TjqduB9ZoPAGuKUYjyoMpsgBcDPF19z
	CDW2Oaot3iiaxdiNrc0sp48OpR0+v5QQNRZ8q9pTNODVByWvAhE5uY7OFMzwTKwubaijS+RbJ0+/w
	tMBT4VTWpxMR+DoWxkeqVohCLIsnrpktTnJ8oqCwwQqUsNgH/HgU0VN3BCtooTzEq3y0Ec+NSYlC0
	IhPaWGNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0mN8-004Zor-Bz; Mon, 13 Jun 2022 15:52:58 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0mMw-004ZiZ-Mr; Mon, 13 Jun 2022 15:52:48 +0000
Received: by mail-wm1-x335.google.com with SMTP id a10so3208593wmj.5;
        Mon, 13 Jun 2022 08:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to
         :references:from:subject:in-reply-to:content-transfer-encoding;
        bh=OCL5aWKRbj0ROQTskl1q1tCaL14mdMWA6juXly3fSBY=;
        b=Knn6GmPZQULHNfmfoeI4Fpg+udRaQGh5orUc4dJD4WbSTCQCnxwcWiNs993WqlEUWs
         /6dHHJAhYJXBD7Va9MK0UFIRRSTwEiqPoMPoIzSY+23D8k94rLcFIKpuMi18R1m3IWSh
         3NiJMMEsxpXeaiWNV7fWwvBZiSynlf72E1S6jqf9Mr+jY75/8l2OJed49AXo/ENVEthc
         Tkol+fq+LvPAWmT/LxapbDTbjAKe8Ml4vXGcnH1To03kPwyRe/68RiV6UaWxzWYUlfwu
         AYDngHNUGy6AxTykccByw6LHJvLS3ZwZb+RGAuBop5BjyTNj1VbSlh37MV5pNYlFBxXh
         AjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=OCL5aWKRbj0ROQTskl1q1tCaL14mdMWA6juXly3fSBY=;
        b=gq/Igs2ixZ4NkqlxpGm+ZD3lw8Cxmi5kWghrJpdbCpNJj6xNyNKIz62LmLt7bpW6m3
         jrtbREP7KxegsyNCwCWYnPL9IvxvJ2yLuf7V3yD18DEZsQfDZEBu9uspvlDX/41B6jVG
         a62jGANHkbJt7LDCa3MS/Jc3GbMB82e8c6igfRItzjGJN4/d2phW2IsBOlppymTcgH6L
         DxodipYvo96r1gRtmwuETfAxuqGiZRBXztB73luRD+DncUSd23GejyB1Pnn+VKoA+dx9
         RSybVSS/U2HqmKRvb2RXeIqt7Uz8zO0m50IYjJHVXS5e7bSVO//iD2Q8MILW4GaoUIpf
         Uv+g==
X-Gm-Message-State: AOAM531ci/uVhbmiPcpQ+5xW0RzFsG/43aCBHqwSlzfUnVM/qc8mRSzG
	24R7X+Fb3ESD3I+ThJJh2u+jMi51JuG8Hw==
X-Google-Smtp-Source: ABdhPJxb8jGNR9Uj1sykaV4sMfYHmhnT+dMd4lOi3/Cadt9gYuj/PJgSkxQCaPTx4jhhNoioc0o5Nw==
X-Received: by 2002:a05:600c:22d9:b0:39c:4b1b:5f99 with SMTP id 25-20020a05600c22d900b0039c4b1b5f99mr118995wmg.151.1655135564826;
        Mon, 13 Jun 2022 08:52:44 -0700 (PDT)
Received: from [192.168.0.36] ([37.223.143.134])
        by smtp.gmail.com with ESMTPSA id t17-20020a05600c129100b0039754d1d327sm9736322wmd.13.2022.06.13.08.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jun 2022 08:52:43 -0700 (PDT)
Message-ID: <606c3409-0e27-e993-8657-0c8d36a16a97@gmail.com>
Date: Mon, 13 Jun 2022 17:52:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: "moudy.ho" <moudy.ho@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220608144055.27562-1-chunkuang.hu@kernel.org>
 <55b84b36832b0da24c267d06a43b9db4ee345176.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] mailbox: mtk-cmdq: Remove proprietary cmdq_task_cb
In-Reply-To: <55b84b36832b0da24c267d06a43b9db4ee345176.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_085246_815844_81C5619D 
X-CRM114-Status: GOOD (  17.43  )
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



On 10/06/2022 04:49, moudy.ho wrote:
> On Wed, 2022-06-08 at 22:40 +0800, Chun-Kuang Hu wrote:
>> rx_callback is a standard mailbox callback mechanism and could cover
>> the
>> function of proprietary cmdq_task_cb, so use the standard one instead
>> of
>> the proprietary one. Client driver has changed to use standard
>> rx_callback, so remove proprietary cmdq_task_cb.
>>
>> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> 
> Depends on:
> 
> https://patchwork.kernel.org/project/linux-mediatek/patch/1650102868-26219-1-git-send-email-chunkuang.hu@kernel.org/
> 
> Tested-by: Moudy Ho <Moudy.Ho@mediatek.com>
> 

Thanks for helping by testing this, although:

Your message makes me think that you didn't test against v5.19-rc1 nor against 
v5.18 (!) based kernel but something older. Giving a Tested-by tag to an older 
kernel with lots of out-of-tree patches on top can be critical as the kernel 
evolves and changes pretty much over time.
Upstream development should always be done against an upstream kernel, as 
otherwise bugs in the upstream kernel could stay unnoticed and show up as 
"regressions" later on, when you update your base kernel version.

Best regards,
Matthias

>> ---
>>   drivers/mailbox/mtk-cmdq-mailbox.c       | 11 -----------
>>   include/linux/mailbox/mtk-cmdq-mailbox.h | 10 ----------
>>   2 files changed, 21 deletions(-)
>>
>> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c
>> b/drivers/mailbox/mtk-cmdq-mailbox.c
>> index 2578e5aaa935..9465f9081515 100644
>> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
>> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
>> @@ -192,15 +192,10 @@ static bool cmdq_thread_is_in_wfe(struct
>> cmdq_thread *thread)
>>   
>>   static void cmdq_task_exec_done(struct cmdq_task *task, int sta)
>>   {
>> -	struct cmdq_task_cb *cb = &task->pkt->async_cb;
>>   	struct cmdq_cb_data data;
>>   
>>   	data.sta = sta;
>> -	data.data = cb->data;
>>   	data.pkt = task->pkt;
>> -	if (cb->cb)
>> -		cb->cb(data);
>> -
>>   	mbox_chan_received_data(task->thread->chan, &data);
>>   
>>   	list_del(&task->list_entry);
>> @@ -448,7 +443,6 @@ static void cmdq_mbox_shutdown(struct mbox_chan
>> *chan)
>>   static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long
>> timeout)
>>   {
>>   	struct cmdq_thread *thread = (struct cmdq_thread *)chan-
>>> con_priv;
>> -	struct cmdq_task_cb *cb;
>>   	struct cmdq_cb_data data;
>>   	struct cmdq *cmdq = dev_get_drvdata(chan->mbox->dev);
>>   	struct cmdq_task *task, *tmp;
>> @@ -465,13 +459,8 @@ static int cmdq_mbox_flush(struct mbox_chan
>> *chan, unsigned long timeout)
>>   
>>   	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
>>   				 list_entry) {
>> -		cb = &task->pkt->async_cb;
>>   		data.sta = -ECONNABORTED;
>> -		data.data = cb->data;
>>   		data.pkt = task->pkt;
>> -		if (cb->cb)
>> -			cb->cb(data);
>> -
>>   		mbox_chan_received_data(task->thread->chan, &data);
>>   		list_del(&task->list_entry);
>>   		kfree(task);
>> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h
>> b/include/linux/mailbox/mtk-cmdq-mailbox.h
>> index 44365aab043c..a8f0070c7aa9 100644
>> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
>> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
>> @@ -67,24 +67,14 @@ enum cmdq_code {
>>   
>>   struct cmdq_cb_data {
>>   	int			sta;
>> -	void			*data;
>>   	struct cmdq_pkt		*pkt;
>>   };
>>   
>> -typedef void (*cmdq_async_flush_cb)(struct cmdq_cb_data data);
>> -
>> -struct cmdq_task_cb {
>> -	cmdq_async_flush_cb	cb;
>> -	void			*data;
>> -};
>> -
>>   struct cmdq_pkt {
>>   	void			*va_base;
>>   	dma_addr_t		pa_base;
>>   	size_t			cmd_buf_size; /* command occupied
>> size */
>>   	size_t			buf_size; /* real buffer size */
>> -	struct cmdq_task_cb	cb;
>> -	struct cmdq_task_cb	async_cb;
>>   	void			*cl;
>>   };
>>   
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
