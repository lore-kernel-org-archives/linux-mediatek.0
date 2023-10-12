Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56E0CDB46E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 08:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+wPmP3VGOK6yGl6Kr4TJV0MWx1WEauuIU8UjMK/rEI=; b=Y1M/zBeGpiqqJlvn8TO4NtLoaB
	UPnbxbauqfB99+KVeBPLmQ0RaK8/UnRLK139nMTmKCqsxrbvchLorU2cG4F8n+xMfSZ28KXOIJQIa
	sOSpNdwwntHL+IAbzgJHXKi3wHSaededsP4mYb2XRcWJI7nhCwNgRPoHXJEFS3rHexjMZw9c6gSIc
	s3HSfl4221PZ+awDZc045lFxpa5ux9ivalgb4Nf6tGaaPGmW10sSTt7PsKx5h8WaCvPpbWgBx1EsR
	hZGjSmFDniPn9zX/WlhOnuI/9UGcRm9HcyfuN2xHH1KgDA0HzJZZs+4saSdbWWbvNsYRJxBFpwdiw
	HYi41Jyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqr9E-000CSf-0h;
	Thu, 12 Oct 2023 08:34:24 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqr99-000CQ6-35;
	Thu, 12 Oct 2023 08:34:21 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CD7236607341;
	Thu, 12 Oct 2023 09:34:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697099655;
	bh=E88h58mF/ZKcAYzSlJWUetP0X5DEpkrttpRrhxuWALE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IvCnG2I7NpVPySOXB5XIIE6cRcYZl+a6JXTM48N1i1aOiFBk0xJgUPmrNtVXA+DRB
	 81yfxgCGnRUQgwfKAMhtfxEu20NfjWfaGzhBSmpyze5q/mxMH8PBZiUTHhCb+Z6osP
	 zkha3dUuYJWSYQ/LSVOH7bwgR0AIKdK1S4R1zrrSrLsLqyvYH/H6h0o9sBinK9Pwsx
	 IOC6a5LR9pf//QYEYW3SWB9pdvQ1d3ikeQFHvtjfru76zVxxmFDKJXr8G/DaCs2vTM
	 VlIuPwZItV/PoD9AAmTlHZ6kwl8gDFxdMb0+HfENpKUWuGutnruLo/n6AICouynpbA
	 6W9EU6VZMPl8Q==
Message-ID: <a656906b-b39f-3647-c0c7-f8d14d2e4385@collabora.com>
Date: Thu, 12 Oct 2023 10:34:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] mailbox: mtk-cmdq-mailbox: Implement Runtime PM with
 autosuspend
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "kernel@collabora.com" <kernel@collabora.com>
References: <20231011110309.164657-1-angelogioacchino.delregno@collabora.com>
 <33104b25f0430aba4be9fe1060a02f94e1c9d3d7.camel@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <33104b25f0430aba4be9fe1060a02f94e1c9d3d7.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_013420_275867_851353D7 
X-CRM114-Status: GOOD (  37.68  )
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

Il 12/10/23 10:00, Jason-JH Lin (林睿祥) ha scritto:
> Hi Angelo,
> 
> Thanks for your help!
> 
> On Wed, 2023-10-11 at 13:03 +0200, AngeloGioacchino Del Regno wrote:
>> MediaTek found an issue with display HW registers configuration, and
>> located the reason in the CMDQ Mailbox driver; reporting the original
>> comment with the analysis of this problem by Jason-JH Lin:
>>
>>    GCE should config HW in every vblanking duration.
>>    The stream done event is the start signal of vblanking.
>>
>>    If stream done event is sent between GCE clk_disable
>>    and clk_enable. After GCE clk_enable the stream done event
>>    may not appear immediately and have about 3us delay.
>>
>>    Normal case:
>>    clk_disable -> get EventA -> clk_enable -> clear EventA
>>    -> wait EventB -> get EventB -> config HW
>>
>>    Abnormal case:
>>    clk_disable -> get EventA -> clk_enable -> EventA delay appear
>>    -> clear EventA fail -> wait EventB but get EventA -> config HW
> 
> Please also help to add this comment here:
> This abnormal case may configure display HW in the vactive or non-vblanking duration.

I can send a v2 to add the proposed line in the commit description...

...otherwise... Jassi, can you perhaps please add that while applying the
commit, if there's no more feedback on this?

Asking for simplicity; I'm not against sending a v2, anyway.


> 
>>
>>  From his analysis we get that the GCE may finish its event processing
>> after some amount of time (and not immediately after sending commands
>> to it); since the GCE is used for more than just display, and it gets
>> used frequently, solve this issue by implementing Runtime PM handlers
>> with autosuspend: this allows us to overcome to the remote processor
>> delay issues and reduce the clock enable()/disable() calls, while
>> also
>> still managing to save some power, which is something that we
>> wouldn't
>> be able to do if we just enable the GCE clocks at probe.
>>
>> Speaking of which: if Runtime PM is not available there will
>> obviously
>> be no way to get this power saving action so, in this case, the
>> clocks
>> will be enabled at probe() time, kept enabled for the entire driver's
>> life and disabled at remove().
>>
>> Reported-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>> Signed-off-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>> ---
>>
>> The 100ms autosuspend delay was estimated in a worst-case scenario
>> and
>> was tested on MT8192 and MT8195 Chromebooks, with internal display
>> and
>> external display running to maximize the number of CMDQ messages
>> being
>> sent through.
>> That value can probably be decreased to half of what I've set, but on
>> that I prefer being cautious and keep it at 100ms.
>>
>> P.S.: This also solves microstuttering issues that I've randomly seen
>> on all MediaTek Chromebooks.
>>
>>   drivers/mailbox/mtk-cmdq-mailbox.c | 80 +++++++++++++++++++++++++---
>> --
>>   1 file changed, 68 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c
>> b/drivers/mailbox/mtk-cmdq-mailbox.c
>> index 4d62b07c1411..de862e9137d5 100644
>> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
>> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
>> @@ -13,10 +13,13 @@
>>   #include <linux/kernel.h>
>>   #include <linux/module.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>>   #include <linux/mailbox_controller.h>
>>   #include <linux/mailbox/mtk-cmdq-mailbox.h>
>>   #include <linux/of.h>
>>   
>> +#define CMDQ_MBOX_AUTOSUSPEND_DELAY_MS	100
>> +
>>   #define CMDQ_OP_CODE_MASK		(0xff << CMDQ_OP_CODE_SHIFT)
>>   #define CMDQ_NUM_CMD(t)			(t->cmd_buf_size /
>> CMDQ_INST_SIZE)
>>   #define CMDQ_GCE_NUM_MAX		(2)
>> @@ -283,10 +286,8 @@ static void cmdq_thread_irq_handler(struct cmdq
>> *cmdq,
>>   			break;
>>   	}
>>   
>> -	if (list_empty(&thread->task_busy_list)) {
>> +	if (list_empty(&thread->task_busy_list))
>>   		cmdq_thread_disable(cmdq, thread);
>> -		clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
>> -	}
>>   }
>>   
>>   static irqreturn_t cmdq_irq_handler(int irq, void *dev)
>> @@ -307,9 +308,26 @@ static irqreturn_t cmdq_irq_handler(int irq,
>> void *dev)
>>   		spin_unlock_irqrestore(&thread->chan->lock, flags);
>>   	}
>>   
>> +	pm_runtime_mark_last_busy(cmdq->mbox.dev);
> 
> Should we add this pm_runtime_put_autosuspend(cmdq->mbox.dev); here?
> 

The interrupt handler is guaranteed to execute (hence the interrupt is
guaranteed to fire) before the suspend timer is estinguished: for this
reason, it was not necessary to increase the runtime pm refcount in
this function, hence it is not necessary to call pm_runtime_put_autosuspend()
here.

>> +
>>   	return IRQ_HANDLED;
>>   }
>>   
>> +static int cmdq_runtime_resume(struct device *dev)
>> +{
>> +	struct cmdq *cmdq = dev_get_drvdata(dev);
>> +
>> +	return clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks);
>> +}
>> +
>> +static int cmdq_runtime_suspend(struct device *dev)
>> +{
>> +	struct cmdq *cmdq = dev_get_drvdata(dev);
>> +
>> +	clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
>> +	return 0;
>> +}
>> +
> 
> We can use them to replace the clk_bulk_enable() and clk_bulk_disable()
> in cmdq_init().
> 

No, because I expect those handlers to possibly grow in the future to handle
more suspend/resume actions; besides, those are handlers, not generic helper
functions, hence those shouldn't be called inside of other functions of this
file, unless there's a good reason to do so (for example, letting this driver
to still work without runtime PM support, which I'm doing in the probe() and
remove() callbacks).

> Thanks for your improvement patch again!
> 
> and
> 
> Tested-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> 

Thank you!
Angelo


