Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E42FC25B74
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 May 2024 11:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2JFH2lxXujNwLkkqMdhKO1Da8BcCgn2IjUNWIWwi5/g=; b=PirFrDM7NMaFFK5Auoxx46y68T
	mvxh+8HX7NLPVTwAz1VAzhq/mMg5XVNAm4eskRkyHvVFcuZaY5cEUoUbSJw2ysW0BzzR9gINNj53j
	Lv8+K6xLuNFGmfD6AwST7LGAL+d5unXOZYMbEhYpdC0V1eHOp8qIPAQNdygXeBNzWUxPBlNdWmtlM
	4n2AeBDXzqc0tpYCALktyQ8cwdf0qbnXFbGmA1Y4q6H4PqesQp25iczvey2sZDhx0bisid9xMPBv7
	lcjXIy6Wup02hBSMCVSiVtrivyu/W2RNcX39g7pBNoU1m5Nqk3Z1M9MVUHK2B4BB9VW+K+HbZfELk
	Ti8vGszg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Nj7-0000000HIo8-2Hoc;
	Tue, 21 May 2024 11:32:17 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Nip-0000000HIe4-1rnP
	for linux-mediatek@lists.infradead.org;
	Tue, 21 May 2024 11:32:15 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-420160f8f52so28834415e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 21 May 2024 04:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716291114; x=1716895914; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2JFH2lxXujNwLkkqMdhKO1Da8BcCgn2IjUNWIWwi5/g=;
        b=z7AUh04FSav0yYp00n1iSajzt88ZywNKml3pAV6tj1IE4Rlbu3CCdVxqSvUGPqTJap
         uSVOMDSGq3scaPLXubbiYC4d6H4ZZmH1/Y5eYYO2KJY+SOvlDlZAL/XfOMrkQl/HVOlJ
         sf7afWh+O5zk4p3WxVR3/ijEolwvXVa/DOFUylYIrjfEI+wuB8ONSe4TnQQdiFLDy03H
         9M7/SaErW8Lev3DOsvpQ3lR49ZboBgpPYeSb8MilTdECvyqPJtosPAkia0P8M2L2IFpr
         5d1cWzbX4vhbHUavPPcPo1VkzGHQofuK6+ekmhUWXji5XocHV2yqt3cEcB7/AWXUotdF
         7ogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716291114; x=1716895914;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2JFH2lxXujNwLkkqMdhKO1Da8BcCgn2IjUNWIWwi5/g=;
        b=ZunWkenzO2GTCZKwfma06ACIJGEepaSkbRqZDIeOCDZs+NldjNI91MgaNnsPkRGfKX
         rqoxD55/23ppEhoVgex7H+Sq+aYFBQEm0BzTSemrXipS/vftw5nUy2GVru2LCO4yQIOQ
         kYMTy3NbOslybUQaHq8pNJziTMcQfjYzIhKJaxgpPqU7W+mo1zyZMcf9vod8i3m39jhC
         aAr44EmxYovzR4NK0GlaZlY/uBUkvu3BEmIFYOKJ9DZxXMzYzSdrl4sHNZXFU6uc9fAp
         QpQ3mj9fWWYDsc9nzYreB4EBmdU90JHBUUxy57Q984WZlcbdaEXv3LWkjA48F8ZMftla
         9dUg==
X-Forwarded-Encrypted: i=1; AJvYcCWK+/CY6nAIVlY7rhsDOaaPxdCof7+bGuCVk1nEhwjY8mXMeYsUlt6bip3hp+CZ49ecSe8U1amPmB3ClIjwW4hlCcquASOsRTJK2jtzpdkFo4y7
X-Gm-Message-State: AOJu0Yz0sZmY3NB7TQCQYJ19+Pw9D/Y2xVid8Q44H3sCmdy9eYmXc5ya
	Xclx32mGTck5y+M5vZdcRZlTvWHf4J0wzjldL8w9p0CBg8gpAda05HHO8VUvvkM=
X-Google-Smtp-Source: AGHT+IEZtNtQQzN8LPfrUmrIF04SBuch56Npn6yjY1fPcTnhtEc4nsxKxAQc/JbKcKmKekWEkBLBgA==
X-Received: by 2002:a05:600c:4e8c:b0:41a:408b:dbaa with SMTP id 5b1f17b1804b1-41fea539875mr256321905e9.0.1716291114001;
        Tue, 21 May 2024 04:31:54 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-420e1462e1asm89644515e9.0.2024.05.21.04.31.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 04:31:53 -0700 (PDT)
Message-ID: <26f1f9a6-46fa-4f86-ba46-eea454ba902f@linaro.org>
Date: Tue, 21 May 2024 13:31:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/15] arm64: dts: mediatek: mt8188: add default
 thermal zones
Content-Language: en-US
To: Julien Panis <jpanis@baylibre.com>, Nicolas Pitre <nico@fluxnic.net>,
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20240402032729.2736685-1-nico@fluxnic.net>
 <20240402032729.2736685-16-nico@fluxnic.net>
 <aab10d22-b1a1-45e9-85bc-a4334aa6c497@linaro.org>
 <02ac5b07-08fe-4abd-8db8-141f4e47f68a@baylibre.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <02ac5b07-08fe-4abd-8db8-141f4e47f68a@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_043159_870849_91563EA1 
X-CRM114-Status: GOOD (  15.95  )
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

On 21/05/2024 13:10, Julien Panis wrote:
> Hello Daniel,
> 
> On 4/4/24 17:16, Daniel Lezcano wrote:
>>
>> Hi Nico,
>>
>> a few comments about this description.
>>
>> On 02/04/2024 05:25, Nicolas Pitre wrote:
>>> From: Nicolas Pitre <npitre@baylibre.com>
>>>
>>> Inspired by the vendor kernel but adapted to the upstream thermal
>>> driver version.
>>
>> [ ... ]
>>
>>> +    thermal_zones: thermal-zones {
>>> +        cpu-little0-thermal {
>>> +            polling-delay = <1000>;
>>
>> Except if I'm wrong, the driver supports the interrupt mode, so it not 
>> necessary to poll constantly when there is no mitigation. You can 
>> remove the line and everywhere else.
>>
>>> +            polling-delay-passive = <250>;
>>
>> As little CPU, 200ms or 150ms may be more adequate.
>>
>>> +            thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU0>;
>>> +
>>> +            trips {
>>> +                cpu_little0_alert: trip-alert {
>>> +                    temperature = <85000>;
>>> +                    hysteresis = <2000>;
>>> +                    type = "passive";
>>> +                };
>>
>> You may want to add a 'hot' trip point in between, so the userspace 
>> can be notified and take an action before reaching 'critical' (like 
>> unplugging a CPU)
> 
> There's no "notify" function in the driver.

The trip point crossing is always notified to userspace in the core 
code. It is not driver specific.

> Do you think it's worth adding such 'hot' trip point, though ?

Having this trip point would allow generic trip point handling in a 
userspace daemon to do an action.

If the userspace does not take care of this event, it won't hurt.



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


