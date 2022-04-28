Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5432AC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 06:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tTJHkNotTV0f16kTQ1vmVzC4CPvWOofdsGM0MixFSYg=; b=DiHrRXoIdpZKPQ
	/YVf7RAtE913Tqy5zsQ0ym6Qj5GAMCRRwa8PsqVi60EOUIAn1JOzZqunYaoc8Rg985v37SdiwV5Zw
	Lq9ZGEZpJsTe368CxVW3YJjYPUMEVTmcty78a9ynxHjD5EVO6hYQFh7IIpJPj8GbQ491CBYUdxSv2
	iLMzMgDkG048mlogzgAxI6S2b9apoYjGC0FlXEBfQqMuEo3VWIakfKQYPkVcuFXxubh7LZTvfSgrz
	FZn0hufA+i5PhOzRRXt1iAy7jDVB5HIQuK+z0hQUA66fVoowBZEtzFjFoupU/GjN8d8JJIzdkrUfV
	84HF/3uQmTO3Y7NFYZEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njxpY-004wqM-EQ; Thu, 28 Apr 2022 06:40:48 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njxpW-004wpX-0n
 for linux-mediatek@lists.infradead.org; Thu, 28 Apr 2022 06:40:47 +0000
Received: by mail-ej1-x632.google.com with SMTP id r13so7565632ejd.5
 for <linux-mediatek@lists.infradead.org>; Wed, 27 Apr 2022 23:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=g4ePX7G8X59yI/6hK2LFLFfdo4oBytYEY/83QyfibjA=;
 b=jVp+JM3y8a9ObmevGUR7dwqAqrXopLU2pWMmZvlw0Vdcrz3CELRZq+auxAZcpNpNO/
 boNJveutpKxLbIuIRbH1nJhH6VgdYNiiDkRrIrXLpikV73w50S6qPyFUOX8GKXDlSgy4
 OJDIUNQPIKQqE8L2iYd0bIeAb/Yhwsu7QT7IXJ5TusUTeePLEBHSFujZ0YRZXQE5nGRd
 FJnKPECStPsfPBxqwAuyfYWSc7V2RyTix1v6ytZnWFU2EhaGhLprV223qK+mXrcRbpw1
 TL52G/mxAqe1w72c8Tv38ORCxciWDi8I+al0JsxL3joPSAbYuepXQnzDNT2aAylny59b
 9lFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g4ePX7G8X59yI/6hK2LFLFfdo4oBytYEY/83QyfibjA=;
 b=R2B6Em6WXN3qNEKWExhOJm1slJFWP2LCKqNVLwZ45IEZ78MNnG7nStyD3jxxxsDyew
 P3gPFqnLX+3Vtzi2nl64MPoPF1kvGYhwY5ARlk1ngWwJvQoN5faQ3yUoqV//TeFVDmjq
 OTvIq07Qq7gvKG+IfhPMZr9cXDlEiSgYSVsne+g13+OBU7vYAWzQao35avAljuW6bwtL
 sA9H1J0JEMLUfuFkOdfWfQ6mxETKsUIhZEK2PMulNENbd5XzCR2buWEVg+vQQJ4z1DNe
 EQ4JONB40omTo8hvVdRLO5GjiPMewrWBtel43ayz8JOu+onOLk2VVrcqXLdpXqaGMhut
 jRUA==
X-Gm-Message-State: AOAM532TzfJYtMc/efxYR8slqEMI6h5e0MYxtzJrvrzuJYZTKs75UKpx
 ERY47ppZzLvUY1Du6Sh2R6w4Mw==
X-Google-Smtp-Source: ABdhPJz4z22JlAvsEbghIRkpGgckZCqesm5hhXuET4dcbdH5mMusYCHlByL0Rm4+EjZShXHVrbFXGg==
X-Received: by 2002:a17:907:3f1c:b0:6f3:98ab:4735 with SMTP id
 hq28-20020a1709073f1c00b006f398ab4735mr17988072ejc.547.1651128044392; 
 Wed, 27 Apr 2022 23:40:44 -0700 (PDT)
Received: from [192.168.0.159] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 r22-20020a17090638d600b006d584aaa9c9sm7889328ejd.133.2022.04.27.23.40.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 23:40:43 -0700 (PDT)
Message-ID: <49dd007b-f6f6-0278-8f06-f81cf951fcd3@linaro.org>
Date: Thu, 28 Apr 2022 08:40:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V3 12/17] dt-binding: mt8192: Add infra_ao reset bit
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
Cc: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?Q2h1bi1KaWUgQ2hlbiAo6Zmz5rWa5qGAKQ==?=
 <Chun-Jie.Chen@mediatek.com>, "wenst@chromium.org" <wenst@chromium.org>,
 =?UTF-8?B?UnVueWFuZyBDaGVuICjpmYjmtqbmtIsp?= <Runyang.Chen@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20220422060152.13534-1-rex-bc.chen@mediatek.com>
 <20220422060152.13534-13-rex-bc.chen@mediatek.com>
 <e5b18654-ce83-44ee-e4c8-4cdfc4ceaa1d@linaro.org>
 <5ec37a01b0b84140a7d171b9a5cff7ad8f9fbe87.camel@mediatek.com>
 <418c5f0c-5279-41f5-3705-345ec9a97ea2@linaro.org>
 <9547368870f6a8d5c5e6bd5dd497ddbe04c51b93.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9547368870f6a8d5c5e6bd5dd497ddbe04c51b93.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_234046_115311_28A9FB5D 
X-CRM114-Status: GOOD (  16.34  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 26/04/2022 10:23, Rex-BC Chen wrote:
> On Mon, 2022-04-25 at 15:52 +0800, Krzysztof Kozlowski wrote:
>> On 25/04/2022 07:01, Rex-BC Chen wrote:
>>> On Sat, 2022-04-23 at 18:28 +0800, Krzysztof Kozlowski wrote:
>>>> On 22/04/2022 08:01, Rex-BC Chen wrote:
>>>>> To support reset of infra_ao, add the bit definition for
>>>>> thermal/PCIe/SVS.
>>>>>
>>>>> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
>>>>> ---
>>>>>  include/dt-bindings/reset/mt8192-resets.h | 10 ++++++++++
>>>>>  1 file changed, 10 insertions(+)
>>>>>
>>>>> diff --git a/include/dt-bindings/reset/mt8192-resets.h
>>>>> b/include/dt-bindings/reset/mt8192-resets.h
>>>>> index be9a7ca245b9..d5f3433175c1 100644
>>>>> --- a/include/dt-bindings/reset/mt8192-resets.h
>>>>> +++ b/include/dt-bindings/reset/mt8192-resets.h
>>>>> @@ -27,4 +27,14 @@
>>>>>  
>>>>>  #define MT8192_TOPRGU_SW_RST_NUM				
>>>>> 23
>>>>>  
>>>>> +/* INFRA RST0 */
>>>>> +#define MT8192_INFRA_RST0_LVTS_AP_RST				
>>>>> 0
>>>>> +/* INFRA RST2 */
>>>>> +#define MT8192_INFRA_RST2_PCIE_PHY_RST				
>>>>> 15
>>>>> +/* INFRA RST3 */
>>>>> +#define MT8192_INFRA_RST3_PTP_RST				
>>>>> 5
>>>>> +/* INFRA RST4 */
>>>>> +#define MT8192_INFRA_RST4_LVTS_MCU				
>>>>> 12
>>>>> +#define MT8192_INFRA_RST4_PCIE_TOP				
>>>>> 1
>>>>
>>>> These should be the IDs of reset, not some register
>>>> values/offsets.
>>>> Therefore it is expected to have them incremented by 1.
>>>>
>>>>
>>>
>>> Hello Krzysztof,
>>>
>>> This is define bit.
>>>
>>> There is serveral reset set for infra_ao while it's not serial.
>>> For MT8192, it's 0x120/0x130/0x140/0x150/0x730.
>>> We are implement #reset-cells = <2>, and we can use this reset
>>> drive
>>> more easier.
>>>
>>> For example, in dts, we can define
>>> infra_ao: syscon {
>>> 	compatible = "mediatek,mt8192-infracfg", "syscon";
>>>  	reg = <0 0x10001000 0 0x1000>;
>>>  	#clock-cells = <1>;
>>> 	#reset-cells = <2>;
>>> };
>>>
>>> thermal {
>>> 	...
>>> 	resets = <&infra_ao 0x730 MT8192_INFRA_RST4_LVTS_MCU>;
>>> 	...
>>> };
>>>
>>> If it's acceptabel, I can update all bit difinition from 0 to 15
>>> for
>>> all reset set.
>>
>> Bits are not acceptable, because you embed specific device
>> programming
>> model (register bits) into the binding.
>>
>> These should be IDs, so decimal numbers incremented from 0, so:
>> #define MT8192_INFRA_RST0_LVTS_AP_RST				0
>> #define MT8192_INFRA_RST4_LVTS_MCU				1
>> #define MT8192_INFRA_RST4_PCIE_TOP				2
>>
>> And what is 0x730 in your example? It does not look like ID of a
>> reset...
>>
>> Entire changeset look wrong from DT point of view.
>>
>> Best regards,
>> Krzysztof
> 
> Hello Krzysztof,
> 
> Got it. I will modify them to reset index.
> And the dts in my next version would somthing like this:
> 
> ----
> #define MT8192_INFRA_THERMAL_CTRL_RST			0
> #define MT8192_INFRA_PEXTP_PHY_RST			79
> #define MT8192_INFRA_PTP_RST				101
> #define MT8192_INFRA_RST4_PCIE_TOP			129
> #define MT8192_INFRA_THERMAL_CTRL_MCU_RST		140

These are still not IDs, incremented by one.

So again from beginning:
0
1
2
...

Do not encode hardware register bits into the binding.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
