Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90AE9C3ABBE
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 May 2025 15:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fpp/CpJ6xlI15L8sPW0Jp6SE3VDWw42deKh4JBWQdx8=; b=VR9iq5oKZcRZf4Dg0ZvAFlOEZ0
	q5dSa2Awj3PYwJSpy0QUJ0qWv8iAM8M92OZplgdCqacMdGcUKQZ9V5oDuApA6YgY9tCvy4ijtOZ4B
	g5jvAQDlEAFcs8IQU4v17nYhbuLzPclZtz0y0jp01yViIK6xG6g20jhMhE1Fwbu/0LMgzTVIITC4/
	z3ThqhXFoLt6zCXXT3wZjHBevqhvtb8xVUPgVbch83fTS/oWN9DcHh5hL1Snw8saywftvNLBFlsbi
	+FfEpSdn+ITm6W+EIIYE5aUwG28Qvx+EJDf6Cu0/lo5s2Npv3z5/gIIs9HhGh05rdg5DSVU5zNDhg
	N/SfT6Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2qn-000000013Z1-1Qox;
	Thu, 08 May 2025 15:07:53 +0000
Received: from smtp-29.smtpout.orange.fr ([80.12.242.29] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2GM-00000000vUz-3FNr;
	Thu, 08 May 2025 14:30:16 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id D2GEu1z1amoFgD2GEuuBtk; Thu, 08 May 2025 16:30:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1746714609;
	bh=fpp/CpJ6xlI15L8sPW0Jp6SE3VDWw42deKh4JBWQdx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=ZrcfFu5n7ZtmYSlFZkMdnsjEPhPDs77wpnjGP7l88XTgLs32YS81aR066EKU2zYhO
	 nhpTCjZVPyeBmfB4Dl7G8oJ6RswNwQ+6JzetDGryhhKJL3ZfXCPbwO0cnq/3WomdB/
	 oyZvnMRcojkxdYNtP7zxK14K6jzuGt0xT9Zbl9V59KcrHOmhwzmgs88l+1H2A2vShD
	 Pi5SYj0VROdx/jM4W2Q+vuG91v5tuNzutrWDAdwMSxV/C8UPvHWvNCx7UaQ9TMARAh
	 ar8NILkN5znUdVFQ0NG4bqQwzcMY++KF8muR1A7jxDYG/z3MnEJo7VlNwUn6BRONLF
	 0K8ggDkF+A5Dw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 08 May 2025 16:30:09 +0200
X-ME-IP: 90.11.132.44
Message-ID: <f7386884-cf6f-451a-aa39-6ce26ca22832@wanadoo.fr>
Date: Thu, 8 May 2025 16:30:06 +0200
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
 <aAJFgqrOFL_xAqtW@lore-desk>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <aAJFgqrOFL_xAqtW@lore-desk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_073015_218954_C28414C7 
X-CRM114-Status: GOOD (  16.75  )
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

Le 18/04/2025 à 14:28, Lorenzo Bianconi a écrit :
>> If an error occurs after a successful airoha_hw_init() call,
>> airoha_ppe_deinit() needs to be called as already done in the remove
>> function.
>>
>> Fixes: 00a7678310fe ("net: airoha: Introduce flowtable offload support")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> Compile tested-only
>> ---
>>   drivers/net/ethernet/airoha/airoha_eth.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
>> index 69e523dd4186..252b32ceb064 100644
>> --- a/drivers/net/ethernet/airoha/airoha_eth.c
>> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
>> @@ -2631,6 +2631,8 @@ static int airoha_probe(struct platform_device *pdev)
>>   		}
>>   	}
>>   	free_netdev(eth->napi_dev);
>> +
>> +	airoha_ppe_deinit(eth);
>>   	platform_set_drvdata(pdev, NULL);
>>   
>>   	return err;
>> -- 
>> 2.49.0
>>
> 
> Hi Christophe,
> 
> I agree we are missing a airoha_ppe_deinit() call in the probe error path,
> but we should move it above after stopping the NAPI since if airoha_hw_init()
> fails we will undo the work done by airoha_ppe_init(). Something like:

Agreed.

I'll send a v2 with as a small series, because of another leak I found 
while looking at it.

And while at it, I'll propose a few clean-ups.

CJ


> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index 16c7896f931f..37d9678798d1 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2959,6 +2959,7 @@ static int airoha_probe(struct platform_device *pdev)
>   error_napi_stop:
>   	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
>   		airoha_qdma_stop_napi(&eth->qdma[i]);
> +	airoha_ppe_init(eth);
>   error_hw_cleanup:
>   	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
>   		airoha_hw_cleanup(&eth->qdma[i]);
> 
> 
> Agree?
> 
> Regards,
> Lorenzo


