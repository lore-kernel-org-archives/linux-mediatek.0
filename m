Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE958C30653
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 12:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OCGoEdd5omc642DKDIVq1MlDV8lFkeoM8Q3cj5Uhtos=; b=MJK+3mXzy9ZYhLS/k8l3VE62Nk
	vIrsJyPMNiE5twYLx8li/FWkH/l6Ndv0JTwdYM2k5diQm6Gr9To7Ky6IdajyirrwIJ/Sbt/0BJxqy
	uliphisWE7+D5vfZWXz3LKrBk3p8oem91aY2PAi9L2ykSuUbJRsCGWdj/XMLU81C0GrTSAsX76878
	KUQrOFCP7NQmFo7bFfdhn63vz3f37LHRB1HxrvfsnM773HHOVpLjGI38ePJQWtsUxFQTgnjP1u2yA
	KgHJ0HJfrlJBsjiceWSbae3FPS66cRu/hMU+NuCMAW009XaZOO+gkgejnBbk0OPDTG1R2Qijv0fyR
	/AYzd1WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOzLD-0000000ACPT-1N9d;
	Wed, 03 Jul 2024 12:44:07 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOzKz-0000000ACM4-1AWF;
	Wed, 03 Jul 2024 12:43:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720010628;
	bh=0hT2eBMLYcPqqROd/WvlLs1uHHji+IItZ+Y2HiWD7EM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vpyTAyzVvZcXrUQDu55aZ5lWuhGpW4uijv+sbPSaeqbGMwwYeACv6KaoKv44HEczt
	 tKg9kZqp9at06MUQRiA7+7+nUPD9AwqNmxuswUc68pbX8U/1TiTupFCy71pNaj945s
	 5GjaYwEd8wespQXynvZIK4dWHkvo1v5Cj0++oeqzzIaQzk++MRJyY3rlhsvrv7PIrE
	 5fSDUkn02A6mpQlSpq8iYjEkM8xlHXkPzY4eoNwfoZ1yKpt8oTiz/eSz8mftCURTyZ
	 bfdsV21R+sU1G2WDiCshZ2HM3OuwAYyNJ8UVHU37P3AhNuEZxhYznhSnkePA9o2oEA
	 RzKGz4GXBe9KQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 532DA3782194;
	Wed,  3 Jul 2024 12:43:48 +0000 (UTC)
Message-ID: <d6994f56-57dc-4a66-ad7d-1daa04788b22@collabora.com>
Date: Wed, 3 Jul 2024 14:43:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: mediatek: Use dev_err_probe in every error path
 in probe
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240628-mtk-cpufreq-dvfs-fail-init-err-v1-1-19c55db23011@collabora.com>
 <20240702055703.obendyy2ykbbutrz@vireshk-i7>
 <aa6e93bd-aba2-4e4d-bce9-04e818ac25ed@collabora.com>
 <20240702084307.wwvl5dchxa4frif3@vireshk-i7>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240702084307.wwvl5dchxa4frif3@vireshk-i7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_054353_508652_9CEE77B0 
X-CRM114-Status: GOOD (  14.18  )
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

Il 02/07/24 10:43, Viresh Kumar ha scritto:
> On 02-07-24, 10:26, AngeloGioacchino Del Regno wrote:
>> Il 02/07/24 07:57, Viresh Kumar ha scritto:
>>> On 28-06-24, 15:48, Nícolas F. R. A. Prado wrote:
>>>> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
>>>> @@ -629,11 +630,9 @@ static int mtk_cpufreq_probe(struct platform_device *pdev)
>>>>    	int cpu, ret;
>>>>    	data = dev_get_platdata(&pdev->dev);
>>>> -	if (!data) {
>>>> -		dev_err(&pdev->dev,
>>>> -			"failed to get mtk cpufreq platform data\n");
>>>> -		return -ENODEV;
>>>> -	}
>>>> +	if (!data)
>>>> +		return dev_err_probe(&pdev->dev, -ENODEV,
>>>
>>> What's the point of calling dev_err_probe() when we know for sure that
>>> the error isn't EPROBE_DEFER ?
>>>
>>
>> Logging consistency, that's all; the alternative would be to rewrite the dev_err()
>> messages to be consistent with what dev_err_probe() says, so that'd be
>> dev_err("error %pe: (message)");
> 
> That would be better I guess. There is no point adding inefficient
> code.
> 
>>>> +				     "failed to get mtk cpufreq platform data\n");
>>>>    	for_each_possible_cpu(cpu) {
>>>>    		info = mtk_cpu_dvfs_info_lookup(cpu);
>>>> @@ -643,24 +642,21 @@ static int mtk_cpufreq_probe(struct platform_device *pdev)
>>>>    		info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
>>>>    		if (!info) {
>>>>    			ret = -ENOMEM;
>>>> +			dev_err_probe(&pdev->dev, ret, "Failed to allocate dvfs_info\n");
>>>
>>
>> By the way, forgot to point that out in my former review: to make it shorter,
>> instead of "ret = -ENOMEM; dev_err_probe()" you can write it as...
>>
>> ret = dev_err_probe(&pdev->dev, -ENOMEM, ".... message");
> 
> `ret` will be  be used I guess with the `goto` statement to return
> error and so the change was like this.
> 

Yes it will, but `ret = dev_err_probe(dev, -ENOMEM, "...")` is still kind of a
shortcut, as that will effectively assign -ENOMEM to ret, so that the error is
still returned like before ;-)

Cheers

