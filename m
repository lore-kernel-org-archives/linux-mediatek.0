Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE04C3ABA9
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Apr 2025 20:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqrZP5JivyxldFmAi4UVOQoQCnpE7WmY52m/wQ8PrDM=; b=EmN9/LO+bSucJFrUAcpQ1In3Hf
	ytotLXFC39aUeWW9t/0tPlmYVo5tFgZxrRLKVyeaPzL+kwWpN2bgWJ3ph47w6YFB9se9dGAalDnCU
	3JE1Mc4f+K7rwERs68B3hnREA6G6TurQClq4FZpt67LLbjpB+HIGBhMo5U+otyCWXY6KCzpjMVL1Z
	vGYxWdKF1IOB9nboG/kwr9pO+d0Q8p2ILBojh4vaT0GtGMnHAf7/F7DO5Dngy3uco2mSOGb1cmL0X
	bblwJz/O7B+PbrEx53EUh1nMMi+bJx5JjUSllUyjrouIxVrUAUnDWxoiTa4bF1IF38EDvjHj+wveb
	ouCXVlzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9s15-0000000Ao1d-0fIK;
	Tue, 29 Apr 2025 20:57:23 +0000
Received: from smtp-30.smtpout.orange.fr ([80.12.242.30] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9rzi-0000000Aniy-3h6Z;
	Tue, 29 Apr 2025 20:56:00 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 9rzNumpcYN5mI9rzQuMyVC; Tue, 29 Apr 2025 22:55:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1745960147;
	bh=NqrZP5JivyxldFmAi4UVOQoQCnpE7WmY52m/wQ8PrDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=E9f552v1eFs2M5RxbiunKLS2gnnjSGCo6hzrEh6jaPK03065K+1nT5dkBAszEdjKw
	 AI7xqWuvhsHem6Nx4H3rcjsJjPr4H96CMKKa4y457EgNOCUnZXzkrERuC1M4FRE3JW
	 dDRKGu7+CG3ebjSU4g+UPa7cel34II0iYK8xkp7mp7bzgahLXjhqrUIzQy5NEDaxHB
	 cvVaEyaeGmOV/NVfldXu6B0KHjLejiTB+i6UdaBwqg41vpfyHsVQAh/hCFnnDPcL9S
	 eS+6vHW+diXwf6syIkCNoKqXzhQh6lO4XWGs9GOGdq5JdkmQ9hZzvCyaPdVPhEzYsU
	 CVV4zdRpzrBFQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 29 Apr 2025 22:55:47 +0200
X-ME-IP: 90.11.132.44
Message-ID: <85758958-0e67-4492-a9e0-40f25c554e8c@wanadoo.fr>
Date: Tue, 29 Apr 2025 22:55:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: airoha: Fix an error handling path in airoha_probe()
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <f4a420f3a8b4a6fe72798f9774ec9aff2291522d.1744977434.git.christophe.jaillet@wanadoo.fr>
 <aAJFgqrOFL_xAqtW@lore-desk> <aBDglZH4VaBlWU2a@lore-desk>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <aBDglZH4VaBlWU2a@lore-desk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_135559_324307_CD383E6F 
X-CRM114-Status: GOOD (  14.54  )
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

Le 29/04/2025 à 16:22, Lorenzo Bianconi a écrit :
>>> If an error occurs after a successful airoha_hw_init() call,
>>> airoha_ppe_deinit() needs to be called as already done in the remove
>>> function.
>>>
>>> Fixes: 00a7678310fe ("net: airoha: Introduce flowtable offload support")
>>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>>> ---
>>> Compile tested-only
>>> ---
>>>   drivers/net/ethernet/airoha/airoha_eth.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
>>> index 69e523dd4186..252b32ceb064 100644
>>> --- a/drivers/net/ethernet/airoha/airoha_eth.c
>>> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
>>> @@ -2631,6 +2631,8 @@ static int airoha_probe(struct platform_device *pdev)
>>>   		}
>>>   	}
>>>   	free_netdev(eth->napi_dev);
>>> +
>>> +	airoha_ppe_deinit(eth);
>>>   	platform_set_drvdata(pdev, NULL);
>>>   
>>>   	return err;
>>> -- 
>>> 2.49.0
>>>
>>
>> Hi Christophe,
>>
>> I agree we are missing a airoha_ppe_deinit() call in the probe error path,
>> but we should move it above after stopping the NAPI since if airoha_hw_init()
>> fails we will undo the work done by airoha_ppe_init(). Something like:
>>
>> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
>> index 16c7896f931f..37d9678798d1 100644
>> --- a/drivers/net/ethernet/airoha/airoha_eth.c
>> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
>> @@ -2959,6 +2959,7 @@ static int airoha_probe(struct platform_device *pdev)
>>   error_napi_stop:
>>   	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
>>   		airoha_qdma_stop_napi(&eth->qdma[i]);
>> +	airoha_ppe_init(eth);
>>   error_hw_cleanup:
>>   	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
>>   		airoha_hw_cleanup(&eth->qdma[i]);
>>
> 
> Hi Christophe,
> 
> any plan to repost this fix?

Hi,

I'll send a v2, but I currently don't have time to look at it.
Will need a few more days.

CJ

> 
> Regards,
> Lorenzo
> 
>>
>> Agree?
>>
>> Regards,
>> Lorenzo
> 
> 


