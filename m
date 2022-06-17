Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BDBC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 11:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UX0tutY1C5/15azw7Wry0J61sOmCtZFSquxklOsmCSE=; b=KIb+AR9iMoiRmcXWvAQFoNI5Np
	sp+JOdMwnEdV6y9YmKoghb/CrgXgCWx89hU4LPO3lwqayZ8lS9X7Iypvx8Mh+shyJLC3D+aZojEr2
	N1SzwyC6j+xO4cJadV46eeFp1nbBkKUUj7cF6kUmEQxjY/Vnn09Q0MLBQykTh0exnUNgajim+QiWt
	RiZcCA4srbv/jw+BbbPR+mKvtdSMyVniV0AjcKsKUnQ9UQWxaRQ3YaSh3o5igwL+U4EzRFbxkG1U4
	YEjvNPmjCDtbfkoA21jxqo9JGfia275ZmA14Ir1re57Es/ilT/SNnPaVXDT5JA15ZEhjpUes1mSbF
	sXWBmicw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o29jq-0079na-1o; Fri, 17 Jun 2022 11:02:06 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o29Wt-0073UD-Rr; Fri, 17 Jun 2022 10:48:45 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ED2B5660179A;
	Fri, 17 Jun 2022 11:48:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655462919;
	bh=iolRVPHpQh6u3gC87otykET26yu59XGpf0xquwJFbtc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XRs4/BwLMzqZniW2WQLPzcxJs6DepjVBYQa2NqHJpTL1av7Khq/gdaL+nLrDEyn07
	 /gHguPuCdGwlXhpoxmLoKUeoxg3Xk2yk9vJ6qwvinAbc/Wbob/QdYw8TOcIWeL7AUC
	 yXyuajtPBLCLGs/orx4F4ZHVuZwavLZNZ7yHZI7VumHdqNqB7BHdL/OlZiXRrWUv7N
	 dspWvd1xqc9JENEkB4sW/inqQPJbmRrF3ZLRurk40raNh9icJDGstAyH2iGL/5/0zZ
	 C0MKJ7N3lZXU5ysNCR5BNdL78R93hH5yJaXAKvPZHa4fPb/dKk6yjPQ4ll04rXwKqS
	 0aufFhxGXKFIw==
Message-ID: <7da07c36-e449-dcfc-b1d3-897bead0f23f@collabora.com>
Date: Fri, 17 Jun 2022 12:48:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] cpufreq: Add MT8186 to cpufreq-dt-platdev blocklist
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>, rafael@kernel.org
Cc: viresh.kumar@linaro.org, rex-bc.chen@mediatek.com,
 jia-wei.chang@mediatek.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220617090652.56247-1-angelogioacchino.delregno@collabora.com>
 <71bf73f9-fa60-e4ba-a339-64d876514af2@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <71bf73f9-fa60-e4ba-a339-64d876514af2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_034844_235975_6FB53BA2 
X-CRM114-Status: GOOD (  13.30  )
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

Il 17/06/22 12:16, Matthias Brugger ha scritto:
> 
> 
> On 17/06/2022 11:06, AngeloGioacchino Del Regno wrote:
>> This SoC shall use the mediatek-cpufreq driver, or the system will
>> crash upon any clock scaling request: add it to the cpufreq-dt-platdev
>> blocklist.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Fixes: 39b360102f3a ("cpufreq: mediatek: Add support for MT8186")
> 
> Fixes tag should be before any Rb, SoB etc tags.

Oh wow, I really did that.

Sorry, I'll send a v2 in a minute or two.

> 
> With that:
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
>> ---
>>   drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c 
>> b/drivers/cpufreq/cpufreq-dt-platdev.c
>> index 96de1536e1cb..2c96de3f2d83 100644
>> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
>> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
>> @@ -127,6 +127,7 @@ static const struct of_device_id blocklist[] __initconst = {
>>       { .compatible = "mediatek,mt8173", },
>>       { .compatible = "mediatek,mt8176", },
>>       { .compatible = "mediatek,mt8183", },
>> +    { .compatible = "mediatek,mt8186", },
>>       { .compatible = "mediatek,mt8365", },
>>       { .compatible = "mediatek,mt8516", },



