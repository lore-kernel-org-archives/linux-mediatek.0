Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38163C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 15:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rKs1d2vkDI5mFyd8YnUM+5H6GgVUPfSlSckLrJWjud0=; b=cILl6QGRJjZZVNPnymOpmsG2yc
	4aA4Rf91FDTpkf8pSpXSq5QbtkWaftDh3KwC+Jp19/Rx9xP691FfgJI60gQMEZD7G+6pPRXgPLQyG
	QCDZ5i/6xprhD/Iy/TPZYEtIGemKFVF5ZvBrSlikq63cN4iuOJEznK83HnFIQowSCFzB/CWKimbro
	jORwBY1iNxw/RGfi4zlyCt+4ge2hmcg9wqjIRH0wq7R1goQExqBwtXutiv/LJi/EUX9D3RWlimQAc
	UdMM5Cz/GLgRWlpKNyGmr0SD3LXpINuJtqVMVlLWY53mvGWNJWpsCd1fCuN3akjh4RWWMxlpD3fgv
	0vh+9xqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3JSn-001H16-LG; Mon, 20 Jun 2022 15:37:17 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3JSl-001Gzd-Pn
	for linux-mediatek@lists.infradead.org; Mon, 20 Jun 2022 15:37:17 +0000
Received: by mail-ed1-x532.google.com with SMTP id e2so4719715edv.3
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jun 2022 08:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rKs1d2vkDI5mFyd8YnUM+5H6GgVUPfSlSckLrJWjud0=;
        b=Fe0GSqhWe9eTXTVLLz1n+pRkr2nN92iFMO7IwVlrQHb/n/O/S229BToHeicXgTpXrM
         eygUfXKrjLon1dYoUNSbRTbTpgM/8iO0Vaqqn80XyNkobgCurWUdijJ9I3TmwlcLhSK8
         p9/y8SRcZNR+gToKm10R+b+IfZtkT5yOU9Av0x2LHDTEZyYXv4ChSygmuEBB439/pSgz
         3Xfh4ZCnTOMxcjaMJaeTAeGCq0BQkNDV2uSUlHefUwuy+VN+mG8q6IdJowrkClZClx1p
         c9R5GQzzBYFXaQAxGIR0Ix37NvTIMmIgqq5BMnVc6ICSg2vVUwdJERJ1WRGDKDQ7Ss+g
         Dl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rKs1d2vkDI5mFyd8YnUM+5H6GgVUPfSlSckLrJWjud0=;
        b=7X0aBJjtSwg+pgkETUA3Lt0Zo4Pg7Pu+tyAK8Pt4WD91VEQCH2SYfId8d7qWRHrTai
         jikBwVeOcxtTyUY/dWvIaCNUyphCAvYa1KpDX1kSf29nbje0vbMRfZn9c9N5dj6dwc95
         ZXt1eS5zHqsLSLa/12sHCilPEJgYM0ybiMDbhJMRo4e+RvAzhNxu+GHW6zLS1pJ9xMfY
         PxMuLI6gX5YDehx+kgkfD+C/hoFeQpWhqMNyibfKkXWVbDTieno8exHn9emyOOliwjxo
         fi10xjKdprU8sjA6XIaA9Tebzic9BEmqLMYjd4BnhWiJmMX+POhsXZPAIj/uqQkPjl66
         Vt5g==
X-Gm-Message-State: AJIora/jJ6S8TXWy54aulXZZA9wFykSK+KiJz49/uokfXn/ieicgAXxs
	Zv8tJnjYFKeMlyJlIIsNdKM=
X-Google-Smtp-Source: AGRyM1u7dzuQLXUIjf1pmLPwxSZm4QUtECpkliEB6ppHXLJKZEp7qDfMTWogqsG1j7JjDb+67VdLbA==
X-Received: by 2002:a05:6402:2548:b0:42d:dd95:5bfe with SMTP id l8-20020a056402254800b0042ddd955bfemr30193903edb.285.1655739431915;
        Mon, 20 Jun 2022 08:37:11 -0700 (PDT)
Received: from [192.168.0.24] (80.174.78.229.dyn.user.ono.com. [80.174.78.229])
        by smtp.gmail.com with ESMTPSA id r18-20020a17090609d200b006fe0abb00f0sm6126653eje.209.2022.06.20.08.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 08:37:10 -0700 (PDT)
Message-ID: <fd8d057c-8531-f7df-55e2-023b8757e867@gmail.com>
Date: Mon, 20 Jun 2022 17:37:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] PM / devfreq: mediatek: Fix possible dereference of null
 pointer
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@kernel.org, dan.carpenter@oracle.com, johnson.wang@mediatek.com
Cc: linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220617133330.6510-1-matthias.bgg@kernel.org>
 <25da54a7-3fc1-39c2-ed93-0ad72ce54e11@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <25da54a7-3fc1-39c2-ed93-0ad72ce54e11@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_083715_872244_84A2D5F0 
X-CRM114-Status: GOOD (  19.84  )
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



On 20/06/2022 16:21, AngeloGioacchino Del Regno wrote:
> Il 17/06/22 15:33, matthias.bgg@kernel.org ha scritto:
>> From: Matthias Brugger <matthias.bgg@gmail.com>
>>
>> We dereference the driver data before checking of it's valid.
>> This patch fixes this, by accessing the PLL data struct after cheching
>> the pointer
>>
> 
> Hello Matthias,
> 
> honestly, I don't think that this commit is right: mtk_ccifreq_target() is the
> devfreq_dev_profile's .target() callback!
> 
> Checking mtk_ccifreq_probe(), we are setting drvdata long before adding the
> devfreq device so, actually, it's impossible for dev_get_drvdata(dev) to return
> NULL, or whatever invalid pointer.
> 
> This means that the right thing to do in mtk_ccifreq_target() is to simply remove
> the `drv` NULL check, as this can never happen! :-)
> 

Yes you are right. Probe will error out if drv can't be allocated or cci_clk 
isn't present. I'll send a new patch.

Thanks,
Matthias

> Cheers,
> Angelo
> 
>> Fixes: 07dc787be231 ("Add linux-next specific files for 20220617")
>> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
>> ---
>>   drivers/devfreq/mtk-cci-devfreq.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/devfreq/mtk-cci-devfreq.c 
>> b/drivers/devfreq/mtk-cci-devfreq.c
>> index 71abb3fbd042..77522f16c878 100644
>> --- a/drivers/devfreq/mtk-cci-devfreq.c
>> +++ b/drivers/devfreq/mtk-cci-devfreq.c
>> @@ -127,7 +127,7 @@ static int mtk_ccifreq_target(struct device *dev, unsigned 
>> long *freq,
>>                     u32 flags)
>>   {
>>       struct mtk_ccifreq_drv *drv = dev_get_drvdata(dev);
>> -    struct clk *cci_pll = clk_get_parent(drv->cci_clk);
>> +    struct clk *cci_pll;
>>       struct dev_pm_opp *opp;
>>       unsigned long opp_rate;
>>       int voltage, pre_voltage, inter_voltage, target_voltage, ret;
>> @@ -138,6 +138,7 @@ static int mtk_ccifreq_target(struct device *dev, unsigned 
>> long *freq,
>>       if (drv->pre_freq == *freq)
>>           return 0;
>> +    cci_pll = clk_get_parent(drv->cci_clk);
>>       inter_voltage = drv->inter_voltage;
>>       opp_rate = *freq;
>>
> 
> 

