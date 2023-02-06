Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 278B4C636D6
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Feb 2023 14:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sf/528wXAQUAwrFpLgVFCwIJzpqE7FME4cXLMCiQ9q4=; b=mIPZEU9o9TZXVdebhsbF8v00tZ
	+P5rBvgOsavZ0hwfKJhDQmwMlVy0LBCRtQhbIImoAaOWLIKtxe530ApKNCtO9y+EotIyKze2MU8tM
	2dBHfY95VX3TCKIC92+Hf9Idk9n91mR1SR4cSUmYpkHL3BUi/JkdotKC6VG8RWcAcQLKXmqQNiURV
	Ryh/mwu1WwsXficUHNK0O8+zFuCbCY+3t9K3X0rkPaOPctaUpkdX1Dl4URiax8zJn2TATjK4jkPST
	Kc1W92d5ZLKvPF3rxlIfUDiNaLv7miCoPwgf3gJNjf38g9yczFEyJQsLAMgl8/BXh89oRewHbrYRn
	Fb0QlPoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP2dc-008o4a-Hh; Mon, 06 Feb 2023 14:38:32 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP2dR-008o16-C9
	for linux-mediatek@lists.infradead.org; Mon, 06 Feb 2023 14:38:23 +0000
Received: by mail-wr1-x42a.google.com with SMTP id a2so10293625wrd.6
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Feb 2023 06:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sf/528wXAQUAwrFpLgVFCwIJzpqE7FME4cXLMCiQ9q4=;
        b=SFl9P6mJB4sMOiUWh46YPfTw67evHCpobeIYqBGB3FXcLQE7OI+Whm6vEJ+dz1b73C
         WVODA1ekHEt8t+KimKYEuXwF3FbAL06LLNVA6G6hQAz7O9BXpIRFP28xlgjYEBzQQMa2
         T+FrUB8SvWWNVBLcSxSoFwPwGI4KmBhYIVE9K0Xu2fhIiMPHGF0uc7lltqcKRKpnBeyW
         dc4guszP3mI/UGFFf2znZlrMByVFFmjz2snKGOYfS8SSI1NMzhY8ZeVIQFOCca0WDNAm
         bafVZp6pu9jliK2/II2xsSYdKo/yUp+fcQV8y5jJY956gMaeE/ogLOUaJigRIQoxIpyT
         /FMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sf/528wXAQUAwrFpLgVFCwIJzpqE7FME4cXLMCiQ9q4=;
        b=I9rsG8KWEUrC/razDY3n2r05VgSPvDUKZZNMqmLcyS4pCZVAsnaHqYKOYz5O5Q7iCs
         SajTsbTslj6HzAxAElKcu3Ui1nQEsvxJnt6sz8BFzTlCyzkTgf6OorAAOgmDBoeD7xuY
         YGup/HdgF4aXUsdzuCadzZA2vvNPTRKdZB3MDcbuJwDBMdWr+MrBpb3CX8VYfBhQMq6a
         sNWCXytlNX27aRIev+Jbe7DDm1eWgw7ko2A43Al4F0+2OP7KwihuNTl9O1peW+46IhlF
         9L+HAlL0eVmdnfpjLXowYwqKtEFL1Wq0aHF73hTxx6WKBHDor+c35mrKN9qaa1bR9Z5X
         036g==
X-Gm-Message-State: AO0yUKXfG+zeJYnL58O4qnRF4QCAvNKX96cO5eMphkq5l4e34zFPOFev
	Fdis+u6zcl/R5kEouhH33gyOeQ==
X-Google-Smtp-Source: AK7set9WEiQQfj69zfozOpjUPK78PzdVOxESwEbgbyE39wzmtW0iMjikdve/zkaIsPj3uSNQsEa5yg==
X-Received: by 2002:a5d:46cf:0:b0:2c3:ea6b:ef83 with SMTP id g15-20020a5d46cf000000b002c3ea6bef83mr3042598wrs.12.1675694297531;
        Mon, 06 Feb 2023 06:38:17 -0800 (PST)
Received: from [172.17.59.64] (wifi-eduroam-trans.univ-tlse3.fr. [195.220.58.237])
        by smtp.googlemail.com with ESMTPSA id o1-20020a5d4a81000000b002c3d67aac74sm8510523wrq.88.2023.02.06.06.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 06:38:17 -0800 (PST)
Message-ID: <ea30d169-2ae6-2744-fbfd-01bbbba36554@linaro.org>
Date: Mon, 6 Feb 2023 15:38:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v12] thermal: drivers: mediatek: Add the Low Voltage
 Thermal Sensor driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: bchihi@baylibre.com, angelogioacchino.delregno@collabora.com,
 rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
 matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org,
 ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 khilman@baylibre.com, james.lo@mediatek.com, rex-bc.chen@mediatek.com
References: <20230124131717.128660-5-bchihi@baylibre.com>
 <20230131153816.21709-1-bchihi@baylibre.com>
 <ab1e4822-d5f4-79f6-ea38-47e2342ebe49@linaro.org>
 <20230206140713.GB15176@linaro.org>
 <b6a24ff7-4154-f2b4-88b1-a8a87c30d30a@linaro.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <b6a24ff7-4154-f2b4-88b1-a8a87c30d30a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_063821_418361_1B31D1AC 
X-CRM114-Status: GOOD (  15.69  )
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

On 06/02/2023 15:30, Krzysztof Kozlowski wrote:
> On 06/02/2023 15:07, Daniel Lezcano wrote:
>> On Wed, Feb 01, 2023 at 08:55:07AM +0100, Krzysztof Kozlowski wrote:
>>> On 31/01/2023 16:38, bchihi@baylibre.com wrote:
>>>> From: Balsam CHIHI <bchihi@baylibre.com>
>>>>
>>>> The Low Voltage Thermal Sensor (LVTS) is a multiple sensors, multi
>>>> controllers contained in a thermal domain.
>>>>
>>>> A thermal domains can be the MCU or the AP.
>>>>
>>>> Each thermal domains contain up to seven controllers, each thermal
>>>> controller handle up to four thermal sensors.
>>>>
>>>> The LVTS has two Finite State Machines (FSM), one to handle the
>>>> functionin temperatures range like hot or cold temperature and another
>>>> one to handle monitoring trip point. The FSM notifies via interrupts
>>>> when a trip point is crossed.
>>>>
>>>
>>> (...)
>>>
>>>> +
>>>> +struct lvts_domain {
>>>> +	struct lvts_ctrl *lvts_ctrl;
>>>> +	struct reset_control *reset;
>>>> +	struct clk *clk;
>>>> +	int num_lvts_ctrl;
>>>> +	void __iomem *base;
>>>> +	size_t calib_len;
>>>> +	u8 *calib;
>>>> +};
>>>> +
>>>> +#ifdef CONFIG_MTK_LVTS_THERMAL_DEBUGFS
>>>> +
>>>> +static struct dentry *root;
>>>
>>> How do you handle two instances of driver?
>>
>> For now, we can put the entry in /sys/kernel/debug/<dev_name>
>>
>> I'm preparing a debugfs series for the thermal framework and that will provide
>> an entry to hook in for the sensors debugfs if available
> 
> The code looked like it does not support it at all. I think it would
> remove entries from second instance, while unbinding the first (or the
> opposite).

Yes, and you are right.

So instead of having:

/sys/kernel/debugfs/lvts/lvts@mcu

We will have:

/sys/kernel/debugfs/lvts@mcu

Later, when the other domain is added, we will have:

/sys/kernel/debugfs/lvts@mcu
/sys/kernel/debugfs/lvts@ap

Each instance takes care of removing its own entry

When I'll introduce thermal debugfs, I'll take care of massaging the 
driver to have them like:

/sys/kernel/debugfs/thermal/thermal_zone/0/sensors/lvts@mcu,0
/sys/kernel/debugfs/thermal/thermal_zone/1/sensors/lvts@ap,1




-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


