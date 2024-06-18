Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE96CC27C4F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jun 2024 11:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oBQU++tJyVfJ8fqliuoiARNytvZ8/C9xVpCZVpElczM=; b=ODRw/6taysjFk5Okgy4d5mx/sC
	3XEZbxeM/yN6LZ055Y57syGwGygHIUAulE52FizwsB5krwd+E+pcSHPZImnNZyamfQxTf+MnwijlS
	BNXqnxjrfjtIpUY+fFglmWpceiWvuVNXIR2SerqN/gQjs9h1NfOFSFK7gjXgzbe/HRJ4wmKFotpKm
	TDkxehUzviq92wBHYU9pSQzOiAbCvkb8bHb7amx9egIzDXYHoh7cmLfUw/2xIKhluVdgXUvFW1M2O
	mcglN9cEZCLhhim5yqSw/abLPpCTns4UbKkDDFQ29l5N/7xqOrKtjMQoxU38ysPdLYasMJBIdPNqY
	sBnU/g+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJXJi-0000000EhmL-2015;
	Tue, 18 Jun 2024 11:48:02 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJXJe-0000000Ehha-094o;
	Tue, 18 Jun 2024 11:47:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718711274;
	bh=LCU1/wOlqhMINpdJryJw+TiAI7Pm6y9VMDX9zjYoTss=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=yeckDiAEUb+DP1MZqjwJngPW/+GxgOHE5R08Li3TKX+LHvwY8YL8TOL3ULuE25xS5
	 IbXb2Mb5Hpr1X3FYL9rz7GZICtEUlny9Wa+8pUzBl+2HsK+FKjwx3y6EST6ptG7ZVj
	 w/aP5QiMDbbSxblzKIMabPNh3OqaRc0ocDjWAK4lpdrdccRNyfrz0WF6oJvZXkZqc9
	 H8fAzOlRe7S9Pqdli40eEYIYxKJs125DxOcpLlkBuIuf57GZWQS5NVnE3M5cVtCDCf
	 8RmGrdJJhPuf6yIeL91qacqR6wD5kUbCUmc2b+ao+JkUFcRkrIcpePD/QyaC078THN
	 ahoRh6xaB52wA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4D10D378217B;
	Tue, 18 Jun 2024 11:47:54 +0000 (UTC)
Message-ID: <a681e496-4979-4f4a-9f79-9636d9496fa3@collabora.com>
Date: Tue, 18 Jun 2024 13:47:53 +0200
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
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <47f1c2c79ad03094ebf411e13516cca47054c962.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_044758_244346_56574A8C 
X-CRM114-Status: GOOD (  22.05  )
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

Il 18/06/24 05:28, Jason-JH Lin (林睿祥) ha scritto:
> Hi Angelo,
> 
> On Fri, 2024-06-14 at 00:52 +0800, Jason-JH.Lin wrote:
>> Hi Angelo,
>>
>> On Thu, 2024-06-13 at 17:10 +0200, AngeloGioacchino Del Regno wrote:
>>> Il 13/06/24 17:06, Jason-JH.Lin ha scritto:
>>>> Add unregister mailbox controller in cmdq_remove to fix cmdq
>>>> unbind
>>>> WARN_ON message from pm_runtime_get_sync() in
>>>> cmdq_mbox_shutdown().
>>>>
>>>> Fixes: 623a6143a845 ("mailbox: mediatek: Add Mediatek CMDQ
>>>> driver")
>>>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>>>
>>> Hello,
>>>
>>> I think you forgot about...
>>>
>>>
>>
>>
> https://lore.kernel.org/all/6fcd48b14e865c25e6db7559fe6b946537bfa0ce.camel@mediatek.com/
>>>
>>
>> I'll send this series next week after testing it.
>>
>>
>>> ...as that would also resolve this one without any hacks.
>>
>> I thought it was another problem, so I sent this patch.
>>
>> After looking to the kerneldoc of devm_mbox_controller_unregister(),
>> I
>> found that it's not necessary to call this anywhere.
>>
>> I'll drop this patch. Thanks for the review.
> 
> I found that the series of "Move pm_runimte_get and put to
> mbox_chan_ops API" can not fix this unbind crash issue.
> 
> It seems they are 2 different issues.
> 
> So I think calling devm_mbox_controller_unregister() in cmdq_remove()
> can ensure the CMDQ device is not removed and be paired to
> cmdq_probe().
> 

Can you please paste the stack trace of that warning that you're seeing when
calling cmdq_remove()?

I'm not convinced that this is the best solution - it might be, but I have
a hunch that there might be a better way to address this issue.

Thanks!
Angelo

> Regards,
> Jason-JH.Lin
> 
>>
>> Regards,
>> Jason-JH.Lin
>>
>>>
>>> Cheers,
>>> Angelo
>>>
>>>> ---
>>>>    drivers/mailbox/mtk-cmdq-mailbox.c | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c
>>>> b/drivers/mailbox/mtk-cmdq-mailbox.c
>>>> index 4aa394e91109..1399e18a39a4 100644
>>>> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
>>>> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
>>>> @@ -371,6 +371,8 @@ static void cmdq_remove(struct
>>>> platform_device
>>>> *pdev)
>>>>    {
>>>>    	struct cmdq *cmdq = platform_get_drvdata(pdev);
>>>>    
>>>> +	devm_mbox_controller_unregister(&pdev->dev, &cmdq->mbox);
>>>> +
>>>>    	if (cmdq->pdata->sw_ddr_en)
>>>>    		cmdq_sw_ddr_enable(cmdq, false);
>>>>    
>>>
>>>



