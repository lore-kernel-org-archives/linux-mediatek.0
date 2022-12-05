Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC48C4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 10:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pEZDR9MixyZslezXS4PNgDrQYBbdRV5NbPbWrTwavko=; b=mkuceRu3Se2w8B
	A5FzeWqc8inRNgdazvytt8YL5iX531t7FpRBzCGAHbT2vFqYdzwpN3T5IibIHbb/Rz48iAcKVyoCC
	uoe3HuBy66oJPzmK3TUo6vMkbjjfgB6WUjgZOKWLYjsmpLJ1zM4meDj6xjdK7YlX6gi2Zrdzm2nqG
	antb7Pgmc3YuQ+XObmgbmWGjCLJHi5/NJbTK5JMc3zhjFMcaaXgmIB7u290lFfiWCtPqtFgmy37Tw
	9zQUTcujiofTJyAxe0KZqTsxt/s9o6fSDj5k4lRUGj4kwz1t9A0Grb87NjyPf0b930N3VJO6wMQFw
	n3WM3B+WfyIz0cYEprMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p28qv-000r7L-Ec; Mon, 05 Dec 2022 10:37:37 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p28qg-000qR5-JG; Mon, 05 Dec 2022 10:37:25 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 62BD366015ED;
	Mon,  5 Dec 2022 10:37:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670236638;
	bh=wGqb7ACQ+MHfk+veHSj5RJ2KW3qb/huM5iIZKEw4K08=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M+JupQ1rW6I493IZz4illgYstesxy0BsgG+SqGiOupm/st42LrVWYE5Y/wgME82l4
	 772FW1OS2KF388EsPf8PzShW7XUtFpBkku4jw8QMai2aS1ppMEFJjL4aDV0Ndyn58G
	 3LlLEaSz+ahxygFOB4K8OyHl4VycL1GLQzJ13Df6uvJij1BJvfKWFVTRnBWOxUn9VM
	 649wKVFwZOoDwIYpvSqDfLtQ8JIX5JDSM0nr9HeiR4+ZDh34W5oF3TQuE8fG4U6jDK
	 uL+yUUHAQaHfy56y49BwveE6XS2UGxc2vDuCbxfAto6V06SAmxk5Tw5kLvnCP+D8GH
	 5y6OmtYcjJYgw==
Message-ID: <4ab6ce42-4769-8a8b-495a-8a7edda91dea@collabora.com>
Date: Mon, 5 Dec 2022 11:37:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] cpufreq: mediatek: Raise proc and sram max voltage for
 MT7622/7623
Content-Language: en-US
To: Nick <vincent@systemli.org>, viresh.kumar@linaro.org
References: <20221202095227.167492-1-angelogioacchino.delregno@collabora.com>
 <75216e0c-9d36-7ada-1507-1bb4a91a3326@systemli.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <75216e0c-9d36-7ada-1507-1bb4a91a3326@systemli.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_023722_949196_B1B2E566 
X-CRM114-Status: GOOD (  23.30  )
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
Cc: linux-pm@vger.kernel.org, rafael@kernel.org, linux-kernel@vger.kernel.org, daniel@makrotopia.org, rex-bc.chen@mediatek.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, jia-wei.chang@mediatek.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 02/12/22 13:37, Nick ha scritto:
> It now starts, however, with a lot of those messages (I applied the patch to 
> linux/master and not to linux-next, because next is currently not compiling anymore 
> for me):
> 
>> [   10.777041] cpufreq: __target_index: Failed to change cpu frequency: -22
>> [   10.791577] cpu cpu0: cpu0: failed to scale up voltage!
> The complete log:
> https://gist.githubusercontent.com/PolynomialDivision/267c83c7a21a359cbb4e8d99d0303201/raw/28d3568a26634bebef2d91ebe37fc5f76ae58add/mt7622-patch-cpufreq.log
> 

Thanks for the feedback!

I am totally sure that the platform_data is correct as that's based on datasheets.

Checking mt6380-regulator.c and mt6380.dtsi also confirms that the min/max volt
shift and proc/sram max voltage that I've specified is currently supported.

That "failed to scale up voltage!" is a bit strange, as this means that
the regulator_set_voltage() call returns -EINVAL for .. reasons, and that's a bit
strange, since the constraints look good in the code, unless there's anything that
I'm missing here.

Can you please try a vanilla kernel?

Also, since I don't have any MT7622/7623 board to test with, if the issue persists,
it would be helpful if you could place some debugging prints in mediatek-cpufreq.c
to specifically check which regulator_set_voltage() call fails, as to try to make
me have a better overview on the problem that you're facing.

Alternatively, we can eventually setup a debugging session on IRC to make things
a bit faster.

Cheers,
Angelo

> Bests
> Nick
> 
> On 12/2/22 10:52, AngeloGioacchino Del Regno wrote:
>> During the addition of SRAM voltage tracking for CCI scaling, this
>> driver got some voltage limits set for the vtrack algorithm: these
>> were moved to platform data first, then enforced in a later commit
>> 6a17b3876bc8 ("cpufreq: mediatek: Refine mtk_cpufreq_voltage_tracking()")
>> using these as max values for the regulator_set_voltage() calls.
>>
>> In this case, the vsram/vproc constraints for MT7622 and MT7623
>> were supposed to be the same as MT2701 (and a number of other SoCs),
>> but that turned out to be a mistake because the aforementioned two
>> SoCs' maximum voltage for both VPROC and VPROC_SRAM is 1.36V.
>>
>> Fix that by adding new platform data for MT7622/7623 declaring the
>> right {proc,sram}_max_volt parameter.
>>
>> Fixes: ead858bd128d ("cpufreq: mediatek: Move voltage limits to platform data")
>> Fixes: 6a17b3876bc8 ("cpufreq: mediatek: Refine mtk_cpufreq_voltage_tracking()")
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/cpufreq/mediatek-cpufreq.c | 13 +++++++++++--
>>   1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
>> index 7f2680bc9a0f..f9a9f08c75c4 100644
>> --- a/drivers/cpufreq/mediatek-cpufreq.c
>> +++ b/drivers/cpufreq/mediatek-cpufreq.c
>> @@ -695,6 +695,15 @@ static const struct mtk_cpufreq_platform_data 
>> mt2701_platform_data = {
>>       .ccifreq_supported = false,
>>   };
>> +static const struct mtk_cpufreq_platform_data mt7622_platform_data = {
>> +    .min_volt_shift = 100000,
>> +    .max_volt_shift = 200000,
>> +    .proc_max_volt = 1360000,
>> +    .sram_min_volt = 0,
>> +    .sram_max_volt = 1360000,
>> +    .ccifreq_supported = false,
>> +};
>> +
>>   static const struct mtk_cpufreq_platform_data mt8183_platform_data = {
>>       .min_volt_shift = 100000,
>>       .max_volt_shift = 200000,
>> @@ -717,8 +726,8 @@ static const struct mtk_cpufreq_platform_data 
>> mt8186_platform_data = {
>>   static const struct of_device_id mtk_cpufreq_machines[] __initconst = {
>>       { .compatible = "mediatek,mt2701", .data = &mt2701_platform_data },
>>       { .compatible = "mediatek,mt2712", .data = &mt2701_platform_data },
>> -    { .compatible = "mediatek,mt7622", .data = &mt2701_platform_data },
>> -    { .compatible = "mediatek,mt7623", .data = &mt2701_platform_data },
>> +    { .compatible = "mediatek,mt7622", .data = &mt7622_platform_data },
>> +    { .compatible = "mediatek,mt7623", .data = &mt7622_platform_data },
>>       { .compatible = "mediatek,mt8167", .data = &mt2701_platform_data },
>>       { .compatible = "mediatek,mt817x", .data = &mt2701_platform_data },
>>       { .compatible = "mediatek,mt8173", .data = &mt2701_platform_data },


