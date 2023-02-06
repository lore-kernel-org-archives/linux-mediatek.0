Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9DBC61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Feb 2023 14:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SelsI8yzcEBkNQxZNV8tPqWXPH22omPqI53i1VeNzBQ=; b=3OqLqHZpI1X0VxcOduadjM/VGW
	fzPUIEMZgyCh0+6oc4NtjFnZ0HujamFsYu4QIpZlQxyrKRslrT5WaF7BmwFnvXKjZQVpTDdDZDpgp
	mHeyfD2mOGEa2pZ/pXHpljoLQL2pav00101nUm48W0aVxAWFOlHo5T7MokrpfJW43iUJ6ok4jhe3w
	AwO1wmzJvBrCwKay3pFTMeGgLLRDlcu0YMaHA5ujA3kxKGCD3YTIuj2G6vb9biC3YBGwpIGBcR5AD
	veJ+4e+vTtJtoQ7cXisCzaUMFU7khuyqgZUtvS2a73Xhx/p0YeFhnnd6gj0utKV2wN15QoO4xTDjR
	/OAa/xpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP2Vs-008mQa-Ji; Mon, 06 Feb 2023 14:30:32 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP2Vi-008mNc-Ni
	for linux-mediatek@lists.infradead.org; Mon, 06 Feb 2023 14:30:24 +0000
Received: by mail-wr1-x434.google.com with SMTP id k13so3132102wrh.8
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Feb 2023 06:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SelsI8yzcEBkNQxZNV8tPqWXPH22omPqI53i1VeNzBQ=;
        b=v9xwkDIZOVWO941JxF+vm1Dc2RxA14RNnwB27jT8wqZ1LXpVPkyXFUmXjc/af1vHzO
         hrbzb+qy5p4H+6Yn6ipuaPXXtlWNnsITuC2D+PTQH6mj8azff1144AifDaJl2RO2t3Qg
         8IxasxjeMKcjuBBail3/CwkeM6J5yJS9CeOCrzU0mfoAJRN69bQ8Bj8UT/IHbKUnDQtI
         D851ylmtb8mc5u1PnBx8cDU1IeDaNRCEdvSsARmGUVvR5aKh/UDfmquuAFcfieLIks3b
         OudZUhLerPC9dK9lwTMBvZuExUT7zJx4rSY5cG9XKl/gjA+mi7V9vdaCcxzNqkhAbbku
         gT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SelsI8yzcEBkNQxZNV8tPqWXPH22omPqI53i1VeNzBQ=;
        b=BAFJQbmVl/xSDzXyLCUNRb8mTIVao1dBv1Z0mu2928Lu5PcezwG7cfKxDrzPpVc5qM
         HVR6jiRQ2ZQSf/ihJjqwJnI03bCuM2jlsFmYD4hsQTZXlw8MN6eSGDCLVydPVIqVKW2g
         zH33DQU1lKMdH7oa7KSXoAUZMpZmaI5L3TelFuUJtU8UF3gPpb8Pw/17w/eech022m6q
         uPuYfNUHtWienM369HLg8BhZB6XA53VsKHY5JKSg8jJ8M+YO48DD43vGxS/CQCfq7JDv
         d9JLYo2lK6Un3qMsV3oLmFTvwEVBuiHxjNMA506QAcc2m++tmb0yv9bBySvCVlxuydZ1
         1apg==
X-Gm-Message-State: AO0yUKV1wOOXu3QBcu6eMMT9jngt7zE5mVkiFx+ro2Rxdvwcnj91eUQy
	3ZOFu35s+T545aywzkdlJ6Wlhw==
X-Google-Smtp-Source: AK7set8OxFswJkWxdT01ruq6k/zxpz9cyuNcS2/TkMFSxlEM3tn6Wdo030SdfenRyBCXADtuBH9LLQ==
X-Received: by 2002:adf:f108:0:b0:2c3:ea77:26ab with SMTP id r8-20020adff108000000b002c3ea7726abmr3529496wro.60.1675693818971;
        Mon, 06 Feb 2023 06:30:18 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002bfb1de74absm8928828wru.114.2023.02.06.06.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 06:30:18 -0800 (PST)
Message-ID: <b6a24ff7-4154-f2b4-88b1-a8a87c30d30a@linaro.org>
Date: Mon, 6 Feb 2023 15:30:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v12] thermal: drivers: mediatek: Add the Low Voltage
 Thermal Sensor driver
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230206140713.GB15176@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_063022_785260_D54343B4 
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

On 06/02/2023 15:07, Daniel Lezcano wrote:
> On Wed, Feb 01, 2023 at 08:55:07AM +0100, Krzysztof Kozlowski wrote:
>> On 31/01/2023 16:38, bchihi@baylibre.com wrote:
>>> From: Balsam CHIHI <bchihi@baylibre.com>
>>>
>>> The Low Voltage Thermal Sensor (LVTS) is a multiple sensors, multi
>>> controllers contained in a thermal domain.
>>>
>>> A thermal domains can be the MCU or the AP.
>>>
>>> Each thermal domains contain up to seven controllers, each thermal
>>> controller handle up to four thermal sensors.
>>>
>>> The LVTS has two Finite State Machines (FSM), one to handle the
>>> functionin temperatures range like hot or cold temperature and another
>>> one to handle monitoring trip point. The FSM notifies via interrupts
>>> when a trip point is crossed.
>>>
>>
>> (...)
>>
>>> +
>>> +struct lvts_domain {
>>> +	struct lvts_ctrl *lvts_ctrl;
>>> +	struct reset_control *reset;
>>> +	struct clk *clk;
>>> +	int num_lvts_ctrl;
>>> +	void __iomem *base;
>>> +	size_t calib_len;
>>> +	u8 *calib;
>>> +};
>>> +
>>> +#ifdef CONFIG_MTK_LVTS_THERMAL_DEBUGFS
>>> +
>>> +static struct dentry *root;
>>
>> How do you handle two instances of driver?
> 
> For now, we can put the entry in /sys/kernel/debug/<dev_name>
> 
> I'm preparing a debugfs series for the thermal framework and that will provide
> an entry to hook in for the sensors debugfs if available

The code looked like it does not support it at all. I think it would
remove entries from second instance, while unbinding the first (or the
opposite).

Best regards,
Krzysztof


