Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E694C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 10:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7LXn1hz6kNnMgO18szvbTmgCKMaF5+M4wGFNxtwrGZA=; b=GoIYHinb6r9eB4
	BNSyWH9cpAuzqtN2rabP3dhKtWCJpLBaERVgyYIcmas8grwTKnBW/1nRzxz6B0ltPTA7flDlzSjS8
	FNK3YON5xtZtZ7G15z6oB4KIIaAh258UinSC0M5oxgiIGeT+tXfE1KlWRfjXc3KtvPZ6Oyzd8BfyY
	6T5LQ45mz3eXmzlyrsqkolT2BQdTJ5cwzVAV5/zF1DLupC9NRhzRlNS5JRAx9e74PXaA35vketCZi
	+PZO0YRwGqfnYKCcQexTsRPuong6ND6ENzlkiOL3OP1Q30XakOsFydT75slZIzuwALsq03s3JqLgO
	1xv2q65qmP8v1CXUiHkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ9Vz-00BsYI-8p; Tue, 29 Mar 2022 10:55:55 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ9Vh-00BsRY-N8; Tue, 29 Mar 2022 10:55:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 905851F4399D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648551336;
 bh=BkZPje0ko1RmCOeaZCQI6Aif1v92KYxg2RWub0qs3h8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fm3OdlCmMJLmpoBlTsVUEIEc8hA+qRakTJt355ubrkrs8fTrHqj1xrg0jaS71Mtx4
 v1SzYfySxtz0h7F0BdfqgcwD5rw/p1P9/NIFnhm4kamId/J0t9xKThI5PJ1bekqvX+
 JpYTkvYiu57KBPel8szadY6HJP6kkPo2ji2sKnOvIwiw1ppZZjZe/I8f7yPZkpuaox
 PnmTnghFGlqj7deWCvL5jlDVw9bQCb5TUHyNn33A+ID/1vh+WP5bIQxTM+kn+OFGyr
 3S0BqXREluIaVVgD52cGTRk8RMEn7KvuGH0eLVVg5bS/q0Zu/W3CbLroJ/hvsHk6MW
 FnCkbsHYB05qg==
Message-ID: <ea0f7cdd-0fae-fb66-3171-f0870384e6aa@collabora.com>
Date: Tue, 29 Mar 2022 12:55:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] rpmsg: mtk_rpmsg: Fix circular locking dependency
Content-Language: en-US
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: bjorn.andersson@linaro.org, matthias.bgg@gmail.com, pihsun@chromium.org,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20220114144737.375621-1-angelogioacchino.delregno@collabora.com>
 <20220217190349.GA477215@p14s>
 <ad306275-cd38-e6ad-55cc-0f7c4bdfcecf@collabora.com>
 <20220218180111.GA574087@p14s>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220218180111.GA574087@p14s>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_035538_080926_815911AE 
X-CRM114-Status: GOOD (  30.53  )
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

Il 18/02/22 19:01, Mathieu Poirier ha scritto:
> On Fri, Feb 18, 2022 at 10:16:51AM +0100, AngeloGioacchino Del Regno wrote:
>> Il 17/02/22 20:03, Mathieu Poirier ha scritto:
>>> Hi Angelo,
>>>
>>> On Fri, Jan 14, 2022 at 03:47:37PM +0100, AngeloGioacchino Del Regno wrote:
>>>> During execution of the worker that's used to register rpmsg devices
>>>> we are safely locking the channels mutex but, when creating a new
>>>> endpoint for such devices, we are registering a IPI on the SCP, which
>>>> then makes the SCP to trigger an interrupt, lock its own mutex and in
>>>> turn register more subdevices.
>>>> This creates a circular locking dependency situation, as the mtk_rpmsg
>>>> channels_lock will then depend on the SCP IPI lock.
>>>>
>>>> [   18.014514]  Possible unsafe locking scenario:
>>>> [   18.014515]        CPU0                    CPU1
>>>> [   18.014517]        ----                    ----
>>>> [   18.045467]   lock(&mtk_subdev->channels_lock);
>>>> [   18.045474]                                lock(&scp->ipi_desc[i].lock);
>>>
>>> I spent well over an hour tracing through the meanders of the code to end up in
>>> scp_ipi_register() which, I think, leads to the above.  But from there I don't
>>> see how an IPI can come in and that tells me my assumption is wrong.
>>>
>>> Can you give more details on the events that lead to the above?  I'm not saying
>>> there is no problem, I just need to understand it.
>>>
>>
>> Hi Mathieu,
>>
>> I understand that following this flow without the assistance of the actual
>> hardware may be a little confusing, so, no worries.
>>
>> drivers/remoteproc/mtk_scp.c - this driver manages the SCP (obviously, a
>> remote processor)
>> drivers/remoteproc/mtk_scp_ipi.c - public functions for kernel SCP IPC
>>
>> Flow:
>> - MediaTek SCP gets probed
>> - RPMSG starts, we start probing "something", like google,cros-ec-rpmsg
>> - mtk_rpmsg: creates endpoint; IPI handler is registered here.
>>
>>           ( more flow )
>>
>> - mtk_rpmsg: mtk_rpmsg_ns_cb() -> mtk_rpmsg_create_device(), channel is
>>               added to the channels list, worker gets scheduled
> 
> To me the above is out of order.  The name space endpoint is registered as part
> of the remote processor start sequence.  From there an IPI with ns_ipi_id comes in
> and then cros_ec_rpmsg_probe() is called.  The above seems to imply the
> opposite.
> 
>>
>>
>> Now for the part that produces the real issue:
>>
>> label_a:
>>
>> *** RPMSG MUTEX LOCK ***
> 
> By this I take you mean the subdev->channels_lock mutex.
> 
>> - mtk_rpmsg: ## Go through multiple channels ##, call mtk_rpmsg_register_device()
>>
>> - Registered device tries to communicate through RPMSG
>> - .send() or .trysend() (depending on the device) is called: send_ipi()
>>      *** SCP MUTEX LOCK ***
> 
> And this one is either scp->send_lock or scp->ipi_desc[i].lock.
> 
>>     - mtk_scp_ipi: Data written, ACK? ok -> return 0
>>      *** SCP MUTEX UNLOCK ***
>>
>> - mtk_scp_ipi: **** INTERRUPT!!! **** New RPMSG NS available? -> create channel
>>            goto label_a;
>>
>> *** RPMSG MUTEX UNLOCK ***
>>
>>
>> Pardon me for keeping some things in this flow implicit, but that was done to
>> simplify it as much as possible as to try to make you understand the situation.
> 
> I certainly appreciate the effort but the above does not provide me with a clear
> path that causes the lock to happen.  As I said in my last reply I don't doubt
> there is a lock contention but the provided information doesn't allow to
> understand how it happens.
> 
> All I am looking for is one scenario with all mutexes and functions calls
> involved.
> 

Hello Mathieu,
I'm sorry for leaving this unresolved for a long time, had to work on other
things in the meanwhile.

I'm not sure what you need, can you please help me to give you the
issue background that you require?

In the meanwhile, here's full debugging info coming from the kmsg:

https://paste.debian.net/1235967/

Thanks,
Angelo

> Thanks,
> Mathieu
> 
>>
>> Cheers,
>> Angelo
>>
>>> Thanks,
>>> Mathieu
>>>
>>>> [   18.228399]                                lock(&mtk_subdev->channels_lock);
>>>> [   18.228405]   lock(&scp->ipi_desc[i].lock);
>>>> [   18.264405]
>>>>
>>>> To solve this, simply unlock the channels_lock mutex before calling
>>>> mtk_rpmsg_register_device() and relock it right after, as safety is
>>>> still ensured by the locking mechanism that happens right after
>>>> through SCP.
>>>> Notably, mtk_rpmsg_register_device() does not even require locking.
>>>>
>>>> Fixes: 7017996951fd ("rpmsg: add rpmsg support for mt8183 SCP.")
>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> ---
>>>>    drivers/rpmsg/mtk_rpmsg.c | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
>>>> index 5b4404b8be4c..d1213c33da20 100644
>>>> --- a/drivers/rpmsg/mtk_rpmsg.c
>>>> +++ b/drivers/rpmsg/mtk_rpmsg.c
>>>> @@ -234,7 +234,9 @@ static void mtk_register_device_work_function(struct work_struct *register_work)
>>>>    		if (info->registered)
>>>>    			continue;
>>>> +		mutex_unlock(&subdev->channels_lock);
>>>>    		ret = mtk_rpmsg_register_device(subdev, &info->info);
>>>> +		mutex_lock(&subdev->channels_lock);
>>>>    		if (ret) {
>>>>    			dev_err(&pdev->dev, "Can't create rpmsg_device\n");
>>>>    			continue;
>>>> -- 
>>>> 2.33.1
>>>>
>>
>>
>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
