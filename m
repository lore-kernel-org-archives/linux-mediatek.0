Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BC4CCFA19
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Nov 2025 07:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtwNZ51TOe1KmMbJGFmq0uDZnSOTzBAwW5XE8OEKres=; b=pmIITq6FT353I9Lpx1N2wa5J58
	k+omm+28hz0srkLQwb0c1E65bgEjdsKSF0xKu4M+i6Vo7zUe09Xz2ISga4iWObrOwhux6xeFTWLGJ
	CUyci1arDGoTH7S60JfYb1beeW/xrOk/+aqsJ5ihcZDKeOnVMXKeiI00xUsmLe+YGkIXWJIyEeY0A
	lJ17YxQQBRlQlc2eQurefEABowXpYwoEKUcx1rvI0wcDT5EHTPHJFQENu9y9ZoEZ3IJtnjf9e+Hw2
	8qo0p43VLbUr7OI8kD18dIfOrwTmVi8nS7SMoKds8PgNrPJp/23l+dWfHLZIMMhxqcYQqpGLrR7Xr
	FN44o5PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHGaL-0000000Gll7-21YF;
	Fri, 07 Nov 2025 07:08:37 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHGaI-0000000Glk9-1JRg
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Nov 2025 07:08:35 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-429b6e25316so57289f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Nov 2025 23:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762499312; x=1763104112; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qtwNZ51TOe1KmMbJGFmq0uDZnSOTzBAwW5XE8OEKres=;
        b=HkZ9rE66+fczi3WT5/nlLBM2vDpygkSZbPaPAryNzwa5ej/Rpv128o9WrQD+UUA9MQ
         6lYn7G4QNUHM881SXRXvttKZGuZ/QBQPwFcDaSqk/FRn4Lkf6LsEZBfyfW7fPuyqSO+L
         1Cj4ESqw13GWwVBl7TdsH42AcmOiPNMacm7gFqfoTKfpo7pxDCrryPhJQAK0lFrenXmb
         oAISSA9hT/Wh4q/LhIL3R2tIk31gcrjg+8o3bEJY9Hx8cNYURWJ5EA3XG5UpFwzw1dOb
         /gRNAkqbei1QU4gPwxhbHci/kcEggT+xoZhwcXAe2TwEOXqGd1IWxXOleRuo7kBUxtMM
         tQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762499312; x=1763104112;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qtwNZ51TOe1KmMbJGFmq0uDZnSOTzBAwW5XE8OEKres=;
        b=q0AGoGYKT7/SJHPjGF22IHss+hmSbegjnFLpXzeUzwJiIGNiAKM3QFc3tgXPw0y4Y0
         WJ0HPJ/skdFWw8NkX4o4zoB9BJbWXorzVW3tLAStz3DNTDo08mNZ7TWFtUf5TYdc8JpO
         Wcdx4lOje9Gdsnhx4/Gac3w6+m8Q+4ZX7nqoMT7mJ/G5kPnPCLUZGd1IID4UQGLIveHm
         65n7WN6K09CsveelYQtItc9VfYaJS9u2Qp7Y33cpWn/lt7/xsWllJcElwqhYfoGOej4l
         q4aWMbIiqH5E/eNyRTa7jPGrFMCRPaoVCdlmYOZON5cyifE63Rawn39At8AoOV8n/eXy
         r13A==
X-Forwarded-Encrypted: i=1; AJvYcCVpF1OhCLmy2kCbD1isZQoIiQXIt07MJoAT73QN9BuOEQCdPwL/9CFzJczTSXIqtzRkSO+JLDARBeAB8ChTag==@lists.infradead.org
X-Gm-Message-State: AOJu0YxC+gZAZILwQnszXI4iVw+GoXKAj2sot2rbqajGg7aH+N6zlH66
	9iF+73kCEbhwKN61cBWflH39dhglySVR1SmNEe3vJoPpgnrFkGmYkTm0srdHnO7S9Dc=
X-Gm-Gg: ASbGnctQm7j/jERV3K5dZIIiEPQ8AewVQP0oHoRy4IN/7LWMa8RMw2L27Pjt4JbV6DW
	XmlRz1uKBW3G9nPrQ5Ubgfeqi6wWTCdc7n9r2n9ibkMhz/NTQRzIvW4RTCK0dSryyqWTOpxjoEd
	HIukLjZLvPf3TxKbUt23Z15TuzdBFYLU96yrF0tr0B42xs69UIrzGio+1n8WrTY/1BtgIJfbldR
	IMglC8XsXHYQhZj+bE3R1GwBWYvMgWlaiBbgLfW92lnOMHjL2r8ytoFNTwhLMz/nGeEuP5Hbu+z
	LDtwUkB2LNQBlh5SROIipKspe/sN0upVFkyEGkg6RclFp4JlJreYsvDmVUGICTmqjQo021zGNNk
	InLWY8YzZJzLT9zDI0Bp0932LdfbRYkHXCwY6hIi1GRSY+wY+V3IAFNxepAfNWX6l/nZHsF7Dx1
	Xd5u+43JPOiLiR+wan9/uqht8Gn/WEF7Y=
X-Google-Smtp-Source: AGHT+IE77T5dGr6wx+Zi4AgBBU0bj3shUSkAGD10kNklEOoD/4TJ7x49hYuoTtpTUQ6bFauuSPanLw==
X-Received: by 2002:a05:600c:46c6:b0:477:54cd:2019 with SMTP id 5b1f17b1804b1-4776bc81647mr9463155e9.1.1762499312082;
        Thu, 06 Nov 2025 23:08:32 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe62bf40sm3513388f8f.9.2025.11.06.23.08.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 23:08:31 -0800 (PST)
Message-ID: <a06ed143-c497-4141-8b4d-98fcb322e130@linaro.org>
Date: Fri, 7 Nov 2025 08:08:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] soc: qcom: Simplify with
 of_machine_get_match_data()
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-11-d780ea1780c2@linaro.org>
 <odmsib3dsxzzggq4gcx7gmh6vq3crlv25fz4z2l2ntezvx6gbi@uelqojwjjait>
 <a8952b46-94b6-4fe5-a5be-d69aa41d44cd@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <a8952b46-94b6-4fe5-a5be-d69aa41d44cd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_230834_435081_D45EC68E 
X-CRM114-Status: GOOD (  17.94  )
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

On 07/11/2025 08:02, Krzysztof Kozlowski wrote:
> On 07/11/2025 04:19, Dmitry Baryshkov wrote:
>> On Thu, Nov 06, 2025 at 08:07:18PM +0100, Krzysztof Kozlowski wrote:
>>> Replace open-coded getting root OF node, matching against it and getting
>>> the match data with new of_machine_get_match_data() helper.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> ---
>>>
>>> Depends on the first OF patch.
>>> ---
>>>  drivers/soc/qcom/qcom_pd_mapper.c | 17 ++---------------
>>>  1 file changed, 2 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
>>> index 1bcbe69688d2..07198d44b559 100644
>>> --- a/drivers/soc/qcom/qcom_pd_mapper.c
>>> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
>>> @@ -613,25 +613,12 @@ static void qcom_pdm_stop(struct qcom_pdm_data *data)
>>>  static struct qcom_pdm_data *qcom_pdm_start(void)
>>>  {
>>>  	const struct qcom_pdm_domain_data * const *domains;
>>> -	const struct of_device_id *match;
>>>  	struct qcom_pdm_data *data;
>>> -	struct device_node *root;
>>>  	int ret, i;
>>>  
>>> -	root = of_find_node_by_path("/");
>>> -	if (!root)
>>> -		return ERR_PTR(-ENODEV);
>>> -
>>> -	match = of_match_node(qcom_pdm_domains, root);
>>> -	of_node_put(root);
>>> -	if (!match) {
>>> -		pr_notice("PDM: no support for the platform, userspace daemon might be required.\n");
>>> -		return ERR_PTR(-ENODEV);
>>> -	}
>>> -
>>> -	domains = match->data;
>>> +	domains = of_machine_get_match_data(qcom_pdm_domains);
>>>  	if (!domains) {
>>> -		pr_debug("PDM: no domains\n");
>>> +		pr_notice("PDM: no support for the platform or no domains, userspace daemon might be required.\n");
>>>  		return ERR_PTR(-ENODEV);
>>>  	}
>>
>> Here you are mixing two cases:
>> - There is not match in the table (in which case the driver should print
>>   a notice)
>>
>> - There is a match in the table, but the data is NULL (the platform
>>   doesn't have PDM domains). In this case there should be no notice.
> 
> 
> Why? Existing code printed notice in both cases. Why refactoring which
> tries to keep code functionally equivalent should change it?

Ah, you mean there was a debug before. Well, then I am a bit confused
because table has entries without data (so expected condition) but old
code returned ERRNO in such case - so unexpected condition.

Wail failing the probe on expected condition?

Unless it is not really expected and notice in second case is valid as well.


Best regards,
Krzysztof

