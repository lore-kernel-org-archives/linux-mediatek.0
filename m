Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C10C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 07:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wDCHCX+9IUYlEMu5hDEoY5G0MFkRkdFaHXqaPuX0jRk=; b=cpacI5AxiJ2icg
	r8Jhx0+x8/CsyBwGC0E0O95pQIW50IgsSQcAIkng81LTeW7MHy4uVZBFSAV6S2wRGg0jIFqHjrfBo
	2TIkII5xxvRRXafWlatvnqwviSGWL1QYeZqiSMSylC5wj65XDGEm+YVkalwZh4rxQBaT3NncQuUnO
	P4Rz9qdkBUWbE4LtktEltpXLWQrlsCvBvQ++4SrwjOpvYfTlu+YLg4iezzQEplisBGMV24prrlOEk
	tnr8LFJDZUsIRslH/gxt6XojDUgeiJO85kEk1ph2SluWmZ+qwUy9M0eT3AUfDEMO8f9O++mdFqAxZ
	TijZDYVoVBX1gyTHRTOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njyV9-005A6h-Jh; Thu, 28 Apr 2022 07:23:47 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njyUo-0059xY-QA
 for linux-mediatek@lists.infradead.org; Thu, 28 Apr 2022 07:23:28 +0000
Received: by mail-ed1-x536.google.com with SMTP id a21so4485100edb.1
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Apr 2022 00:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1/uMuIizparLUx2tgaC/QGD+M6/lxyg0u0CsO652dV4=;
 b=BKEUI+dNa8d940Rbw3z2VPsiSNtKsznkTgC4qf4m0vRNs6XO2j5l4yP0gEtGPptX4q
 jUy0QCNbDqKItpefA6NMGfdBIy3VJVUrbdmXqzKDnqj8hAJqrME8wLX3E1W1N+rwD9sD
 74vwI9ixDQThqli1OxqO1/pFJSwg8miohBG3nooFAy1ivh8Zzv+mTYmxA1ROSTcLIrDT
 gZT2y60bPNUBX77S/AraPAVJQSMYWiPHNTST0A45L7Pj2GVQLa3pzX2vfc/Eb9K9s2Z4
 nxjjWVMmDBOsyy9Fhf+7+a1ylJEamlumcIvDA1Tdb4skkmwfvMy5YzJm+94GSKurshPe
 6KRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1/uMuIizparLUx2tgaC/QGD+M6/lxyg0u0CsO652dV4=;
 b=BagwNq/x1o5H+xsVjSmfAjavTcWe+O0oBWPjGTHvHnyu/Drf9AisU9OOI7w1ytb2AX
 rxWRJALcLKonfSKPuIMxUZX6fv9Q/YCwL1LtDW1Un0EDyr1uErzdoB+ymsOVVb4dkeQg
 oL06MxhZjqAB+L1V1nTDlIxymhYW/2kXvoYt5VadqtXJrCVVThwl8VqPQmo74+5jiJ4A
 /OhETmJlMXPU0aTlNg6AfLrVI5Nyja7HL6C6HQCNsyJWN2EJbU+WIlWo9s2Sm5XfFmQX
 q0nblqdUJXfPfun91NwY9SGXsHP2pmcfpqvsFmuVX0AwugOp3T+TEF7fA+nSjQ9FOKhD
 eihw==
X-Gm-Message-State: AOAM532r955TXxJVTpvAV1u4taIK7km61YHL4zXKzal/EeWJX4ANlU4g
 NKYcjnZGPW3fUyTXXCDY8ZFcrQ==
X-Google-Smtp-Source: ABdhPJzGdRYw4jIYYMweMyzM4SU/EPEmOVlD56sUy+7Jn0sCg3+jHftcOzUDm2PCotyKJGsFK0NJaQ==
X-Received: by 2002:aa7:cc02:0:b0:411:487e:36fe with SMTP id
 q2-20020aa7cc02000000b00411487e36femr34587420edt.338.1651130595279; 
 Thu, 28 Apr 2022 00:23:15 -0700 (PDT)
Received: from [192.168.0.160] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 mp8-20020a1709071b0800b006efc915e1ccsm7793692ejc.118.2022.04.28.00.23.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 00:23:14 -0700 (PDT)
Message-ID: <93c0c4d7-1e3a-56d6-de22-aa2c948403e2@linaro.org>
Date: Thu, 28 Apr 2022 09:23:13 +0200
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
 <49dd007b-f6f6-0278-8f06-f81cf951fcd3@linaro.org>
 <9b42b402be2b0ed065d176238ac2c41f2ec677ef.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9b42b402be2b0ed065d176238ac2c41f2ec677ef.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_002326_899069_ECE808F5 
X-CRM114-Status: GOOD (  20.49  )
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

On 28/04/2022 08:48, Rex-BC Chen wrote:
> On Thu, 2022-04-28 at 14:40 +0800, Krzysztof Kozlowski wrote:
>> On 26/04/2022 10:23, Rex-BC Chen wrote:
>>> On Mon, 2022-04-25 at 15:52 +0800, Krzysztof Kozlowski wrote:
>>>> On 25/04/2022 07:01, Rex-BC Chen wrote:
>>>>> On Sat, 2022-04-23 at 18:28 +0800, Krzysztof Kozlowski wrote:
>>>>>> On 22/04/2022 08:01, Rex-BC Chen wrote:
>>>>>>> To support reset of infra_ao, add the bit definition for
>>>>>>> thermal/PCIe/SVS.
>>>>>>>
>>>>>>> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
>>>>>>> ---
>>>>>>>  include/dt-bindings/reset/mt8192-resets.h | 10 ++++++++++
>>>>>>>  1 file changed, 10 insertions(+)
>>>>>>>
>>>>>>> diff --git a/include/dt-bindings/reset/mt8192-resets.h
>>>>>>> b/include/dt-bindings/reset/mt8192-resets.h
>>>>>>> index be9a7ca245b9..d5f3433175c1 100644
>>>>>>> --- a/include/dt-bindings/reset/mt8192-resets.h
>>>>>>> +++ b/include/dt-bindings/reset/mt8192-resets.h
>>>>>>> @@ -27,4 +27,14 @@
>>>>>>>  
>>>>>>>  #define MT8192_TOPRGU_SW_RST_NUM				
>>>>>>> 23
>>>>>>>  
>>>>>>> +/* INFRA RST0 */
>>>>>>> +#define MT8192_INFRA_RST0_LVTS_AP_RST			
>>>>>>> 	
>>>>>>> 0
>>>>>>> +/* INFRA RST2 */
>>>>>>> +#define MT8192_INFRA_RST2_PCIE_PHY_RST			
>>>>>>> 	
>>>>>>> 15
>>>>>>> +/* INFRA RST3 */
>>>>>>> +#define MT8192_INFRA_RST3_PTP_RST				
>>>>>>> 5
>>>>>>> +/* INFRA RST4 */
>>>>>>> +#define MT8192_INFRA_RST4_LVTS_MCU				
>>>>>>> 12
>>>>>>> +#define MT8192_INFRA_RST4_PCIE_TOP				
>>>>>>> 1
>>>>>>
>>>>>> These should be the IDs of reset, not some register
>>>>>> values/offsets.
>>>>>> Therefore it is expected to have them incremented by 1.
>>>>>>
>>>>>>
>>>>>
>>>>> Hello Krzysztof,
>>>>>
>>>>> This is define bit.
>>>>>
>>>>> There is serveral reset set for infra_ao while it's not serial.
>>>>> For MT8192, it's 0x120/0x130/0x140/0x150/0x730.
>>>>> We are implement #reset-cells = <2>, and we can use this reset
>>>>> drive
>>>>> more easier.
>>>>>
>>>>> For example, in dts, we can define
>>>>> infra_ao: syscon {
>>>>> 	compatible = "mediatek,mt8192-infracfg", "syscon";
>>>>>  	reg = <0 0x10001000 0 0x1000>;
>>>>>  	#clock-cells = <1>;
>>>>> 	#reset-cells = <2>;
>>>>> };
>>>>>
>>>>> thermal {
>>>>> 	...
>>>>> 	resets = <&infra_ao 0x730 MT8192_INFRA_RST4_LVTS_MCU>;
>>>>> 	...
>>>>> };
>>>>>
>>>>> If it's acceptabel, I can update all bit difinition from 0 to
>>>>> 15
>>>>> for
>>>>> all reset set.
>>>>
>>>> Bits are not acceptable, because you embed specific device
>>>> programming
>>>> model (register bits) into the binding.
>>>>
>>>> These should be IDs, so decimal numbers incremented from 0, so:
>>>> #define MT8192_INFRA_RST0_LVTS_AP_RST				
>>>> 0
>>>> #define MT8192_INFRA_RST4_LVTS_MCU				
>>>> 1
>>>> #define MT8192_INFRA_RST4_PCIE_TOP				
>>>> 2
>>>>
>>>> And what is 0x730 in your example? It does not look like ID of a
>>>> reset...
>>>>
>>>> Entire changeset look wrong from DT point of view.
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>
>>> Hello Krzysztof,
>>>
>>> Got it. I will modify them to reset index.
>>> And the dts in my next version would somthing like this:
>>>
>>> ----
>>> #define MT8192_INFRA_THERMAL_CTRL_RST			0
>>> #define MT8192_INFRA_PEXTP_PHY_RST			79
>>> #define MT8192_INFRA_PTP_RST				101
>>> #define MT8192_INFRA_RST4_PCIE_TOP			129
>>> #define MT8192_INFRA_THERMAL_CTRL_MCU_RST		140
>>
>> These are still not IDs, incremented by one.
>>
>> So again from beginning:
>> 0
>> 1
>> 2
>> ...
>>
>> Do not encode hardware register bits into the binding.
>>
>> Best regards,
>> Krzysztof
> 
> Hello Krzysztof,
> 
> It's not bit definiton, and it's index for our reset.
> We have 32*5 reset bits for infra.
> But we only use these 5 index currently, I do not list all of them.

You do not have to list all of them. You can list three, e.g.:

#define MT8192_INFRA_THERMAL_CTRL_RST			0
#define MT8192_INFRA_PEXTP_PHY_RST			1
#define MT8192_INFRA_PTP_RST				2

and you will add all further later. This is how all dt-binding headers
are created.

> 
> The implementation is in [1].
> -----
> static int mtk_reset_update_set_clr(struct reset_controller_dev *rcdev,
>  	unsigned int deassert_ofs = deassert ? 0x4 : 0;
>  
>  	return regmap_write(data->regmap,
> 			    data->desc->rst_bank_ofs[id /          
>  					RST_NR_PER_BANK] +
> 			    deassert_ofs,
> 			    BIT(id % RST_NR_PER_BANK));
>  }

Exactly, you hard-code the hardware programming model - register
values/bits/whatever - in the ID, which is not correct. Additionally,
bindings are (mostly) independent of Linux implementation.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
