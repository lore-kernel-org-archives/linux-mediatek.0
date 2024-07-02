Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A58EC3064D
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jul 2024 08:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wx1GOJYZwf+JESCvvqd9LTUGoB61tGtIqF2wi+BB8qc=; b=ZdzBCtRpod/ks5tK2TkIyfmFxw
	QyKMA5WvxeBCjzdKknlEWJMeq7InsJkFNZTUq3vC9GYWn7DpJ9vFO5qQ3bEudoFw6jBMTd6yCdiie
	WGm44RCTuIwfpWn9cpMF1d62v/frb+pyojm5gTqSk3N0khvurZ+kmMIi+aSJmYVa07pnwb5fJmEGI
	eBeK7tl9dZLQs+DmGOqup2hlXvoUCUwKV+CftNvNQORWhL3Lyngbf/NJViiwsgfLKuciT+zS6burH
	yJwlvxV3uj035oxlyBawVo5dycURTvDynU/fp9EEi5O+jGRWWhFT9kM4nPOIR5klf6plhrA+AoVFT
	p6nIhq/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOYql-00000005zKI-424R;
	Tue, 02 Jul 2024 08:26:55 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOYqY-00000005zE5-3nbs;
	Tue, 02 Jul 2024 08:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719908801;
	bh=9FwEaOQA++z+nzTFYiEdwJkSDvstWDNDDPc4AmAA/CM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DRT4Rtqy3WwkuWVEMML54c2TKfkvKimEiAyPGpYpqVAR8rXvTJboLUC/zfWR9B5dj
	 5696A5C3U205/koH71zlXLBYHCUdqE6aAW0GjMj58KMtO6XEKwHuHpNRbCq+EhF2hC
	 p67hBkOmq+yG7KT2QvG7hob+9evuXwqS4sqZrieOsVC9eBgmLIMXwi39CKkKxobOou
	 7XaRozvB3tEMqC5sp5LjoKg2fBRMeSXash3jFX9xv3r4ER77bO9EMNqTT4Vy4KVuQX
	 NPWYx8q+wbxLrHwQGg18RsEvaZr5xP+fwP2fFh+PG+X1cefWk4IJFTvdj0UWE8Nnht
	 uN/5ipDqGiPew==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7AF8F37820DE;
	Tue,  2 Jul 2024 08:26:40 +0000 (UTC)
Message-ID: <aa6e93bd-aba2-4e4d-bce9-04e818ac25ed@collabora.com>
Date: Tue, 2 Jul 2024 10:26:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: mediatek: Use dev_err_probe in every error path
 in probe
To: Viresh Kumar <viresh.kumar@linaro.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240628-mtk-cpufreq-dvfs-fail-init-err-v1-1-19c55db23011@collabora.com>
 <20240702055703.obendyy2ykbbutrz@vireshk-i7>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240702055703.obendyy2ykbbutrz@vireshk-i7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_012643_110130_79A95FEC 
X-CRM114-Status: GOOD (  12.11  )
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

Il 02/07/24 07:57, Viresh Kumar ha scritto:
> On 28-06-24, 15:48, Nícolas F. R. A. Prado wrote:
>> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
>> @@ -629,11 +630,9 @@ static int mtk_cpufreq_probe(struct platform_device *pdev)
>>   	int cpu, ret;
>>   
>>   	data = dev_get_platdata(&pdev->dev);
>> -	if (!data) {
>> -		dev_err(&pdev->dev,
>> -			"failed to get mtk cpufreq platform data\n");
>> -		return -ENODEV;
>> -	}
>> +	if (!data)
>> +		return dev_err_probe(&pdev->dev, -ENODEV,
> 
> What's the point of calling dev_err_probe() when we know for sure that
> the error isn't EPROBE_DEFER ?
> 

Logging consistency, that's all; the alternative would be to rewrite the dev_err()
messages to be consistent with what dev_err_probe() says, so that'd be
dev_err("error %pe: (message)");

>> +				     "failed to get mtk cpufreq platform data\n");
>>   
>>   	for_each_possible_cpu(cpu) {
>>   		info = mtk_cpu_dvfs_info_lookup(cpu);
>> @@ -643,24 +642,21 @@ static int mtk_cpufreq_probe(struct platform_device *pdev)
>>   		info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
>>   		if (!info) {
>>   			ret = -ENOMEM;
>> +			dev_err_probe(&pdev->dev, ret, "Failed to allocate dvfs_info\n");
> 

By the way, forgot to point that out in my former review: to make it shorter,
instead of "ret = -ENOMEM; dev_err_probe()" you can write it as...

ret = dev_err_probe(&pdev->dev, -ENOMEM, ".... message");

Cheers,
Angelo

> Same here.
> 



