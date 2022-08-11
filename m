Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876EBC19F2D
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Aug 2022 09:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWYdVQgTkSshr+LnqPUerx5UBYrvRFihiIrrHfJRObk=; b=IrpQTclcUhZW6PGOjCQpn0g1PQ
	AKBZ5yiQ38UoOPSfexTmdNBq/OFSexswzTe0r9KrZaGNS/rCF8SgNamkqBUWt0Mnjmz+Tp1iedsrU
	f3KZQ6SjHAdivFO5ZwKrY+yyBCwiPnyLDPo0KaR9piVzvMU40LQr38pW41gfD5luWkVsDgyZSj5eA
	gtNRpfuWwkVMxo8wwCMAWvD4c/JQ06xKXhlbbMXGCQ6mR6OCNPphd1mTlNv2V0GQEbcM5lo7Dem5V
	jmg4MLK10uoHxOImT7MCpwseDKd6gRffpECI6daKU/qJ3sz/YJMAu2IlPRl1WuufJc7/0IxwRRfz0
	uCM+lJ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM4IH-00AfCH-Ha; Thu, 11 Aug 2022 09:15:57 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM4IE-00AfBB-DL
	for linux-mediatek@lists.infradead.org; Thu, 11 Aug 2022 09:15:55 +0000
Received: by mail-lj1-x231.google.com with SMTP id x10so1086219ljq.4
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Aug 2022 02:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=eWYdVQgTkSshr+LnqPUerx5UBYrvRFihiIrrHfJRObk=;
        b=V7SzdIVQUah6XvBKizvA1mVgIky9pI9QACts5UE/xHSbnXlzv5qvmt06tCaJpfdMEp
         8LVG9IdKWBoImtN747jLTjxZsqEQ3SS/svIo8rGmJ/oEiKFkPfEhGmqErGXM58Zmaa3U
         QgDqrWPMumitFhDxY4nqBRzTUmIUcSJnPGQoXXrYfpa+OvCbBU+5lbHFUthxydyGFpb4
         wtkR+UzFC43D/+M/57s9tDYzX9kYGHpnFadSkFEFqkBFBkIpsa8vn8ngxL5OU9QgljRO
         l2JghWSevhNV7NWvHiuF2PdGHxD2BVmk3WYK8lMj8nPIqWFkmNR/66LgmlSScYfjUelZ
         YxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=eWYdVQgTkSshr+LnqPUerx5UBYrvRFihiIrrHfJRObk=;
        b=jYwEB4rt5e9hj1hyiOLbfYzGoxHSCLip3nL3RJWLo81X5uFAbH26EMRwA599vE5IOO
         JeTR4EZwOP2BdJE1uxNIkszl1q4PekS2yVbF49+/0mH5mS4SjminvlBGKdaecWqP+jje
         4IC7+luLSVCDrB/9rZg3ICECwphigSkIdtdUmZxNLa1U5ePDkNRsS19pveSZZ0EmuQyo
         wVcOtHOHeStpj7zhX9R6eAoHqRvxxS1tV5ymLXXQHJP9sHnZsZtKIrHcsj8l8icW3hKh
         v9lzROwy9fj76LbaMCNJMx4E2o4jtfGy25UVqBvmiG/2Qp+Zj0hMF0IooVbulHnPVr3k
         OG5w==
X-Gm-Message-State: ACgBeo1uhy8KoZZK9hbwVT5RIfZce7UJrhjssPSEOODlB2Ntonc5+oYN
	iu396OG+EVGfcjawAJczk10YcQ==
X-Google-Smtp-Source: AA6agR53XfRpjtqJX/e2qIzfPhAibPRJPgQbeXyD0yMC1ANb0zWWn7gz9PDlDZC9gFwqwtlCvsKCCQ==
X-Received: by 2002:a2e:2ac1:0:b0:25e:4b39:e3cb with SMTP id q184-20020a2e2ac1000000b0025e4b39e3cbmr10344846ljq.458.1660209352649;
        Thu, 11 Aug 2022 02:15:52 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id j15-20020a056512028f00b0048b2be5320csm641183lfp.118.2022.08.11.02.15.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 02:15:51 -0700 (PDT)
Message-ID: <a063d48a-2096-ba5b-7f65-d55fec49d534@linaro.org>
Date: Thu, 11 Aug 2022 12:15:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] pmic: add mt6366 regulator document
Content-Language: en-US
To: "zhiyong.tao" <zhiyong.tao@mediatek.com>, lee.jones@linaro.org,
 robh+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, eddie.huang@mediatek.com, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, fshao@chromium.org
Cc: sen.chu@mediatek.com, hui.liu@mediatek.com, allen-kh.cheng@mediatek.com,
 hsin-hsiung.wang@mediatek.com, sean.wang@mediatek.com,
 macpaul.lin@mediatek.com, wen.su@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 zhiyong tao <zhiyong.tao@mediatk.com>
References: <20220728062749.18701-1-zhiyong.tao@mediatek.com>
 <20220728062749.18701-2-zhiyong.tao@mediatek.com>
 <03a13ed4-e7cd-6f7d-f8f7-9b1e6193e202@linaro.org>
 <111e1073e1ce689e289e52c645a1be2e7dc7fe12.camel@mediatek.com>
 <86ab77f5-8beb-7237-d6e2-734f52ca176b@linaro.org>
 <3d120fdb5d26d1211f797e5a26e8af3f34439424.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3d120fdb5d26d1211f797e5a26e8af3f34439424.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_021554_479554_0543F999 
X-CRM114-Status: GOOD (  13.56  )
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

On 11/08/2022 12:14, zhiyong.tao wrote:
> On Thu, 2022-08-11 at 11:58 +0300, Krzysztof Kozlowski wrote:
>> On 11/08/2022 11:42, zhiyong.tao wrote:
>>>>
>>>>>
>>>>> Signed-off-by: zhiyong tao <zhiyong.tao@mediatk.com>
>>>>> ---
>>>>>  .../regulator/mediatek,mt6366-regulator.yaml  | 375
>>>>> ++++++++++++++++++
>>>>>  1 file changed, 375 insertions(+)
>>>>
>>>> Subject does not match subsystem.
>>>
>>> Hi Krzysztof,
>>>
>>> Do you mean that we should change the title like this:
>>> regulator: dt-bindings: mediatek: add mt6366 regulator document
>>> is it right?
>>
>> Yes. And remove redundant pieces so for example:
>>
>> regulator: dt-bindings: mediatek: add mt6366
>> or:
>> regulator: dt-bindings: add mediatek,mt6366
> ==>
> Thanks for your suggestion, we will fix it in next verison.
>>
>>
>> (...)
>>
>>>>> +    patternProperties:
>>>>> +      "^buck-
>>>>> v(dram1|core|coresshub|proc11|proc12|gpu|s2|modem|s1)$":
>>>>> +        type: object
>>>>> +        $ref: "regulator.yaml#"
>>>>
>>>> No need for quotes.
>>>
>>> ==>
>>> We will remove the line "$ref: "regulator.yaml#"" in next verison,
>>> is
>>> it right?
>>
>> No, it is not. Why do you want to remove it?
> ==>
> We don't understand "No need for quotes."which means.
> Do you mean that we should remove the quotation marks.
> We will change it like this:$ref: regulator.yaml#
> is it right?

Yes, remove the quotation marks. You wanted to remove entire line which
is not correct. $ref should stay.

Best regards,
Krzysztof

