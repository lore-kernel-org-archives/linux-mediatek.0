Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764A1C38142
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 17:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vw3JMc60QFgf7Q8TTyiPs3L7+sJqYoWAEt2y6Foay18=; b=oB+roZUIGsDMuVDgaFtbBvqHBQ
	+vry8OjZq32084XqmnpGs7aYttzTzSgLg3FEy/nglSku4ivSx2JYm7DA6Ug5EFMhxC76hdNFy4acn
	HVIZDQ0IytvV/oUPwB7PJ4jWT4rLX1INZLLh7yKqdJdddAMPc+ql4rapREPueS1g182oJQeoAH47i
	yWkV0/hIzGX+Ti80ANbt+ALmJG524aViPdIiGdPE826MTf4Bstp/3fyfISSUfAiFz7CCaOk+V0w4m
	TUjF4E10d62o4qrdaPakfSyqpPn+QFjDKZhsLGYJh7Bgb9VSMWpv+GXkD+vCtAP9qvYsQdHg/k3tj
	ufZaE+Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNGSx-00Cvtu-HS; Wed, 01 Feb 2023 17:00:11 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNGSk-00CvnD-Kk; Wed, 01 Feb 2023 17:00:00 +0000
Received: by mail-ed1-x533.google.com with SMTP id x7so15125385edr.0;
        Wed, 01 Feb 2023 08:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vw3JMc60QFgf7Q8TTyiPs3L7+sJqYoWAEt2y6Foay18=;
        b=NOxxBcabypwDw5ZsGpi0n57XKkq3s7dl1TJhJ1YbZuSXySUAeUNN3HkpUWxDfQAwWP
         Pw11X6bZJfcZDEfg16jDhfot5imVcYeZTEmsAkz6hCo/6xNPicEwtgGIJOQJWKv9nrme
         weu0cPYCeiN9Iy+dIHXphSUSaWwTfqzzdr1D37eTxqL2sYnbfmya/pLgZ33ninNGfzAh
         RuPGwa84Y121hqN51U5wWpKqB5jaULV8zy0RQxHgNMWHeUFPmkDVZF6RMEjRg1Gf2Udw
         VVJogT/Z+Watc02fy0qqYgFYouSroZed9xG8dddUa9xOkolXuWLh25DefyIW+sUlv1vy
         qufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vw3JMc60QFgf7Q8TTyiPs3L7+sJqYoWAEt2y6Foay18=;
        b=nv/xrF0sT5wF3tTy7TJFPVNSOiANaWWWtBqiMzdNLwrYMsTernr/EilaCDNC7E7gCO
         yoLWFxwZCUQseovCWZ8hZHzJEI1lFWX35G6fPU7ntes1TpgT/9u1Ffd1FTDVbuKjgJrv
         bO6kuh3pAOMBpNZetDSMFUiYGvfj6nsx1hXbYdVynVt314QD3m3c3/fWykWhMEveslO1
         CRyZZwjflFQlgtKFc78niJxLv8euGuk1xj6S6JB4PQ7jX/1J0rdBWNqtiOQBbtBCvPOf
         aZ/YBKrJe3w7HcK/8IpgrwnoxnxEp3lQk4nuM3/yQkVAK+7eaTNs6bg++INqYt6V7Wr8
         IayA==
X-Gm-Message-State: AO0yUKU4AzelePhLKNoV6BtUA3wbTy+svKL3/PoUzkXvC6EIcr4LZkkD
	Bbdv6wOSFvBQXrOlrcPRJJI=
X-Google-Smtp-Source: AK7set9j544AAoQ+SvnPoWkjwfiPgAPXI/nWj+bLA78vW8zR9X8/TrGGt5wvGremyy49kaBIO5GPrw==
X-Received: by 2002:a05:6402:22a3:b0:4a2:662a:841a with SMTP id cx3-20020a05640222a300b004a2662a841amr2675594edb.29.1675270792145;
        Wed, 01 Feb 2023 08:59:52 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id h1-20020a1709062dc100b0087bd2924e74sm8853959eji.205.2023.02.01.08.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 08:59:51 -0800 (PST)
Message-ID: <68466850-ddb0-119a-ea82-636ec2c5368e@gmail.com>
Date: Wed, 1 Feb 2023 17:59:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Balsam CHIHI <bchihi@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com,
 rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230124131717.128660-5-bchihi@baylibre.com>
 <20230131153816.21709-1-bchihi@baylibre.com>
 <ab1e4822-d5f4-79f6-ea38-47e2342ebe49@linaro.org>
 <CAGuA+oqLiCxb1g7pwf+RwUTWHV37pXdAWUXHV51TnUy1-xUOXQ@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v12] thermal: drivers: mediatek: Add the Low Voltage
 Thermal Sensor driver
In-Reply-To: <CAGuA+oqLiCxb1g7pwf+RwUTWHV37pXdAWUXHV51TnUy1-xUOXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_085958_717888_8DCBEB25 
X-CRM114-Status: GOOD (  18.22  )
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



On 01/02/2023 17:46, Balsam CHIHI wrote:
> Hi Krzysztof,
> 
> Thank you very much for the review!
> 
> On Wed, Feb 1, 2023 at 8:55 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 31/01/2023 16:38, bchihi@baylibre.com wrote:
>>> From: Balsam CHIHI <bchihi@baylibre.com>
>>>

[...]

>>> +
>>> +static irqreturn_t lvts_ctrl_irq_handler(struct lvts_ctrl *lvts_ctrl)
>>> +{
>>> +     irqreturn_t iret = IRQ_NONE;
>>> +     u32 value, masks[] = {
>>
>> Don't mix different types in one declaration. u32 and a pointer are
>> quite different types.
> 
> I'm not sure to understand.
> LVTS_INT_SENSORx are not pointers but register values.
> 

u32 mask[] is a pointer to a array of u32 values of undefined length.

[...]

>>> +static int __init lvts_golden_temp_init(struct device *dev, u32 *value)
>>
>> You did not test it, right? Build with section mismatch analysis...
> 
> I'm not sure to fully understand this comment.
> Would you explain, please?
> 

AFAIU:

lvts_golden_temp_init() and lvts_ctrl_init() are called from a function that is 
not in __init section:
lvts_domain_init()

So if you free up the first to functions after init but not the callers, things 
can explote.

[...]

>>> +
>>> +static int lvts_probe(struct platform_device *pdev)
>>> +{
>>> +     struct lvts_data *lvts_data;
>>> +     struct lvts_domain *lvts_td;
>>> +     struct device *dev = &pdev->dev;
>>> +     struct resource *res;
>>> +     int irq, ret;
>>> +
>>> +     lvts_td = devm_kzalloc(dev, sizeof(*lvts_td), GFP_KERNEL);
>>> +     if (!lvts_td)
>>> +             return -ENOMEM;
>>> +
>>> +     lvts_data = (struct lvts_data *)of_device_get_match_data(dev);
>>
>> Why do you need case?
> 
> Would you explain, please?
> 

Typo by Krysztof, he meant the cast.
lvts_data = of_device_get_match_data(dev);
should be good enough.

Regards,
Matthias

