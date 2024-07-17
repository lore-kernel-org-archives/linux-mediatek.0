Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC0EC3DA4B
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jul 2024 13:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xfkmCRGMXw0WTCj0IxGxZwgtdo9BDA8e2XyMDuwz2k4=; b=cpRpNOivcWmJ0o4dQRiwjTvaaX
	MD5GvXyUKz1CzSce/7pHVI9cKjZCjeTbGfIMrLaipBgP6SuG4KAlZeNChSHVcYeB4f7D8m+cM9WZ5
	IvhLQ2l/Io9whFz95ohVM84q5/IJWLMNl0DH0C8n4K3bFDVV/93cC04fJJTbzIOgVy6MgFjDyqa7P
	qojY+yfQchOfSrB+W3D2Nd5c8Dh9kw+y8eCUrviRSA8fDjUHZDxqbNhrR9IZ4wyCv0/qcYcVyhqrE
	1nFMd72eXWbGXaQsvw+vUVWRG0pdG5iz1b0PjHjH5UeJz8JDy2K+eInsIdgviKYU+jz8Pzpmuyl+1
	KRoZ0uBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU4iI-0000000DtSg-3FY6;
	Wed, 17 Jul 2024 13:28:58 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU4hw-0000000DtLW-0hUC;
	Wed, 17 Jul 2024 13:28:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721222914;
	bh=k4Lsi9TzISpSKVirxInoxjrE0QFIe83GF7y1SyUaTRs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=exeJu63zcIjjr4WkG5mWgtT8xc/4/b3WRzy+dkUe6luE1hm4Qsz+YLGUhUWVnXGvk
	 Qt6OCTdYE9UC0NV3aQKYsTjVuCiV8n1urSEnbVEzbu/EDyaS+ocyfi0AtMYbj0vm2t
	 pJOL4kSs4oDw5lsYpWSVkaTi7hGrLNcjs69UAhY9j5kzjo3phmRmezPkmkohcU6DTi
	 WVGBWhU/Kvgd2xllxW9OS+TDTQESbXNujEhPunxAN8Ofpq+csAX+oy0HmNZ9n575bV
	 5bXmwbgXYXXiEHoR4+LRUC3nNRy+MuTSr00w6BrMWKVob0XP/zSFAYPWWSmSDbii0I
	 TLRD+oUFBl3jg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 63A7D37805D6;
	Wed, 17 Jul 2024 13:28:33 +0000 (UTC)
Message-ID: <aa1cfc45-b271-43fa-85fc-264ea16574d9@collabora.com>
Date: Wed, 17 Jul 2024 15:28:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: mtk-cmdq: Add unregister mailbox controller in
 cmdq_remove()
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20240613150626.25280-1-jason-jh.lin@mediatek.com>
 <8ef254cb-ac65-405d-bcee-d0990536fb32@collabora.com>
 <44f6308379a8b6c834df6ff0604c652bf1f7a4b7.camel@mediatek.com>
 <47f1c2c79ad03094ebf411e13516cca47054c962.camel@mediatek.com>
 <a681e496-4979-4f4a-9f79-9636d9496fa3@collabora.com>
 <470f96fc0dd48ad0ad6bedb235a2e510c808e3e7.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <470f96fc0dd48ad0ad6bedb235a2e510c808e3e7.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_062836_363405_CF0CE120 
X-CRM114-Status: GOOD (  25.63  )
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

Il 17/07/24 05:44, Jason-JH Lin (林睿祥) ha scritto:
> On Tue, 2024-06-18 at 13:47 +0200, AngeloGioacchino Del Regno wrote:
>> Il 18/06/24 05:28, Jason-JH Lin (林睿祥) ha scritto:
>>> Hi Angelo,
>>>
>>> On Fri, 2024-06-14 at 00:52 +0800, Jason-JH.Lin wrote:
>>>> Hi Angelo,
>>>>
>>>> On Thu, 2024-06-13 at 17:10 +0200, AngeloGioacchino Del Regno
>>>> wrote:
>>>>> Il 13/06/24 17:06, Jason-JH.Lin ha scritto:
>>>>>> Add unregister mailbox controller in cmdq_remove to fix cmdq
>>>>>> unbind
>>>>>> WARN_ON message from pm_runtime_get_sync() in
>>>>>> cmdq_mbox_shutdown().
>>>>>>
>>>>>> Fixes: 623a6143a845 ("mailbox: mediatek: Add Mediatek CMDQ
>>>>>> driver")
>>>>>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>>>>>
>>>>> Hello,
>>>>>
>>>>> I think you forgot about...
>>>>>
>>>>>
>>>>
>>>>
>>>
>>>
> https://lore.kernel.org/all/6fcd48b14e865c25e6db7559fe6b946537bfa0ce.camel@mediatek.com/
>>>>>
>>>>
>>>> I'll send this series next week after testing it.
>>>>
>>>>
>>>>> ...as that would also resolve this one without any hacks.
>>>>
>>>> I thought it was another problem, so I sent this patch.
>>>>
>>>> After looking to the kerneldoc of
>>>> devm_mbox_controller_unregister(),
>>>> I
>>>> found that it's not necessary to call this anywhere.
>>>>
>>>> I'll drop this patch. Thanks for the review.
>>>
>>> I found that the series of "Move pm_runimte_get and put to
>>> mbox_chan_ops API" can not fix this unbind crash issue.
>>>
>>> It seems they are 2 different issues.
>>>
>>> So I think calling devm_mbox_controller_unregister() in
>>> cmdq_remove()
>>> can ensure the CMDQ device is not removed and be paired to
>>> cmdq_probe().
>>>
>>
>> Can you please paste the stack trace of that warning that you're
>> seeing when
>> calling cmdq_remove()?
>>
>> I'm not convinced that this is the best solution - it might be, but I
>> have
>> a hunch that there might be a better way to address this issue.
>>
> 
> After tracing the stack trace again, I found this call trace warning is
> caused in WARN_ON(pm_runtime_get_sync(cmdq->mbox.dev) < 0). The return
> value of pm_runtime_get_sync() is -13(-EACCESS) that's caused by
> calling pm_runtime_disable() before calling pm_runtime_get_sync().
> 
> CMDQ driver uses devm_mbox_controller_register() in cmdq_probe() to
> bind the cmdq device to the mbox_controller, so
> devm_mbox_controller_unregister() will automatically unregister the
> device bound to the mailbox controller when the device-managed resource
> is removed. That means devm_mbox_controller_unregister() and
> cmdq_mbox_shoutdown() will be called after cmdq_remove().
> 
> CMDQ driver also uses devm_pm_runtime_enable() in cmdq_probe() after
> devm_mbox_controller_register(), so that devm_pm_runtime_disable() will
> be called after cmdq_remove(), but before
> devm_mbox_controller_unregister().
> 
> 
> To fix this problem, we need to make devm_pm_runtime_disable() be
> called after devm_mbox_controller_unregister().
> 
> I've tried 2 ways can fix this problem:
> - Swap the sequence of devm_mbox_controller_register() and
> devm_pm_runtime_enable() in cmdq_probe()
> - Change to use mbox_controller_register() in cmdq_probe() and use
> mbox_controller_unregister() in cmdq_probe()
> 

Hey.

That's a nice conclusion here!
If the first one has no issues, go for the first one: that's just about
moving a call upwards, noiseless and pretty.

Cheers!
Angelo

> Which one do you think is better?
> 
> Regards,
> Jason-JH.Lin
> 
>> Thanks!
>> Angelo
>>
>>> Regards,
>>> Jason-JH.Lin
>>>
>>>>
>>>> Regards,
>>>> Jason-JH.Lin
>>>>
>>>>>
>>>>> Cheers,
>>>>> Angelo
>>>>>
>>>>>> ---
>>>>>>     drivers/mailbox/mtk-cmdq-mailbox.c | 2 ++
>>>>>>     1 file changed, 2 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c
>>>>>> b/drivers/mailbox/mtk-cmdq-mailbox.c
>>>>>> index 4aa394e91109..1399e18a39a4 100644
>>>>>> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
>>>>>> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
>>>>>> @@ -371,6 +371,8 @@ static void cmdq_remove(struct
>>>>>> platform_device
>>>>>> *pdev)
>>>>>>     {
>>>>>>     	struct cmdq *cmdq = platform_get_drvdata(pdev);
>>>>>>     
>>>>>> +	devm_mbox_controller_unregister(&pdev->dev, &cmdq-
>>>>>>> mbox);
>>>>>> +
>>>>>>     	if (cmdq->pdata->sw_ddr_en)
>>>>>>     		cmdq_sw_ddr_enable(cmdq, false);
>>>>>>     
>>>>>
>>>>>
>>
>>




