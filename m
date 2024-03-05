Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A2AC54798
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Mar 2024 10:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uz0yh26pJyI2lgavpFBHtkwa48gqP1n9gYCBFbz4nG8=; b=uhcZWtqkHmGy/m1ANiTg3CTtg5
	qrbk55sE8WIMWO2aqSpZnyzL49oupm8EKXT0vtEXX/rqrM4Mal68WYHjxQ6tqLayNiqlxatqI7gmP
	BQpS/SkVY2+mn2mYQrtS0FRk8IKGcHqc8PwcVSq7k9vwRpm2CvkSqTCq5OAz8uy/lZIm7mZ0A38dv
	LxuEEzhCFRj/DAa1ACpSGSuGt/JyE41RYxAI2utrb+gOgkQ86yO5bkwnrNpOhjIu8PJ5YPGZROgej
	lSz9FIzxjAAIQHPW636iMQZ3cccxpNHkTEJLupucSzEew696s4qbNrEXfeQMJXMq8xjAhaMJgxiAK
	OdTdV0QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhRv4-0000000D08K-2PDo;
	Tue, 05 Mar 2024 10:21:10 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhRux-0000000D01t-35vw;
	Tue, 05 Mar 2024 10:21:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709634057;
	bh=BPEtYfyFZ3zIsSSumymVBNXkt5kDgI1A4gqsNs7DMws=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LORY2kHfPljuF+0IEJo7vcxZLDuh04Xff+jT8HMdMATwYiBtkRza0yRd8FyyGZiFM
	 p5gvq5ogsQXlg/lmCBt5CzgSn0fZf4xVOeDoPW0D2RLDvEMV0ZCdgr+4JK21oB3q9p
	 Z9GXN1NnPDKMHAf+eYAvGjZebFZxH+GHa++fOEQbAli5Ru/kw3j4sulrvcW9Urhziu
	 m+NWsTW5F6DZwTMgAXopF8zxMiOX7D42fBMAV0E+rtRNfNNMPZHMWuZ6/jYK/fB/8z
	 YfLeRF4nFcTxgDFOqeUt8I2HDFyiXwxxfglxCt7P82RDEaKMpriqI3VxOhie906WX6
	 3ZZ/G8lWD827w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 70FC23781FEF;
	Tue,  5 Mar 2024 10:20:56 +0000 (UTC)
Message-ID: <e9cc42d7-db7f-4bd8-978e-72b97cfa8d41@collabora.com>
Date: Tue, 5 Mar 2024 11:20:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] mailbox: mtk-cmdq: Add support runtime get and set
 GCE event
Content-Language: en-US
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
 <Jason-ch.Chen@mediatek.com>, =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
 <Shawn.Sung@mediatek.com>, =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20240301111126.22035-1-jason-jh.lin@mediatek.com>
 <20240301111126.22035-6-jason-jh.lin@mediatek.com>
 <298c13ff-25a7-4d9c-ab51-4c22c07c245d@collabora.com>
 <35b6915dd195abba009dab64dc6002362292351c.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <35b6915dd195abba009dab64dc6002362292351c.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_022104_168994_3F67D5B5 
X-CRM114-Status: GOOD (  17.38  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 05/03/24 04:09, Jason-JH Lin (林睿祥) ha scritto:
> Hi Angelo,
> 
> Thanks for the reviews.
> 
> On Mon, 2024-03-04 at 11:06 +0100, AngeloGioacchino Del Regno wrote:
>> Il 01/03/24 12:11, Jason-JH.Lin ha scritto:
>>> ISP drivers need to get and set GCE event in their runtime contorl
>>> flow.
>>> So add these functions to support get and set GCE by CPU.
>>>
>>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>>> Change-Id: I494c34ebc5ec26c82213f2bc03d2033d60652523
>>
>> Change-Id makes no sense upstream. Please drop.
> 
> OK, I'll drop it.
> 
>>
>>> ---
>>>    drivers/mailbox/mtk-cmdq-mailbox.c       | 37
>>> ++++++++++++++++++++++++
>>>    include/linux/mailbox/mtk-cmdq-mailbox.h |  2 ++
>>>    2 files changed, 39 insertions(+)
>>>
>>> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c
>>> b/drivers/mailbox/mtk-cmdq-mailbox.c
>>> index ead2200f39ba..d7c08249c898 100644
>>> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
>>> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
>>> @@ -25,7 +25,11 @@
>>>    #define CMDQ_GCE_NUM_MAX		(2)
>>>    
>>>    #define CMDQ_CURR_IRQ_STATUS		0x10
>>> +#define CMDQ_SYNC_TOKEN_ID		0x60
>>> +#define CMDQ_SYNC_TOKEN_VALUE		0x64
>>> +#define CMDQ_TOKEN_ID_MASK			GENMASK(9, 0)
>>>    #define CMDQ_SYNC_TOKEN_UPDATE		0x68
>>> +#define CMDQ_TOKEN_UPDATE_VALUE			BIT(16)
>>>    #define CMDQ_THR_SLOT_CYCLES		0x30
>>>    #define CMDQ_THR_BASE			0x100
>>>    #define CMDQ_THR_SIZE			0x80
>>> @@ -83,6 +87,7 @@ struct cmdq {
>>>    	struct cmdq_thread	*thread;
>>>    	struct clk_bulk_data	clocks[CMDQ_GCE_NUM_MAX];
>>>    	bool			suspended;
>>> +	spinlock_t		event_lock; /* lock for gce event */
>>>    };
>>>    
>>>    struct gce_plat {
>>> @@ -113,6 +118,38 @@ u8 cmdq_get_shift_pa(struct mbox_chan *chan)
>>>    }
>>>    EXPORT_SYMBOL(cmdq_get_shift_pa);
>>>    
>>> +void cmdq_set_event(void *chan, u16 event_id)
>>> +{
>>> +	struct cmdq *cmdq = container_of(((struct mbox_chan *)chan)-
>>>> mbox,
>>> +		typeof(*cmdq), mbox);
>>
>> struct mbox_chan *mbc = chan;
>> struct cmdq *cmdq = container_of(mbc->mbox, ... etc); (and this fits
>> in one line)
>>
> OK, I'll change it.
> 
>>> +	unsigned long flags;
>>> +
>>> +	spin_lock_irqsave(&cmdq->event_lock, flags);
>>
>> Why do you need irqsave/irqrestore? I think I know, but please
>> explain.
>>
> Because ISP driver may call cmdq_get_event() first than use
> cmdq_set_event() to update the event status in one
> mtk_imgsys_setevent() function frequently.
> 
> And mtk_imgsys_setevent() will be called in SW multi-thread after cmdq
> callback from cmdq_irq_handler, so we use the spin_lock_irqsave to
> avoid the race condition.

I was imagining something like that, yes - thank you for explaining.

Cheers,
Angelo


