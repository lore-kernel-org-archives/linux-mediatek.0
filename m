Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939F3C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 07:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T6S1s40sWViYLu6oL2nXqBoaND9tOpYGaBtg6/tr1Es=; b=RBfa7CgCObQs/8cCJQB+oNgWaR
	ig44F71J8AFIu6J/pTYy2RlIVY1dFHLBuYoUYL0DNcHukoi/tnwLFXkodgUk0pO8OpDHY2H7I9MjG
	RnTyUJGeX9Q2r1LTlBHoTYZXyo1LhqLpsajdwM1AL8G9frmESOVmPoJUr3rUTiZWwOAPD6vsY1Dq2
	pzu81LeF7q6ORxDqXgzKUoRSLPa5dN86VC4Pds2nb2ATuidzULlVO19IFTa4PVuaUUVGJkG/2YhSA
	IbQ4ofdG5v31UlF/cm829yWBH/QEOPX5sesCjSj1yGbMrLtBXGdh5l9E3Gkh5kQtvDs/kqmPP4DLM
	7a+/8aDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Vvt-001iAn-0X;
	Mon, 27 Nov 2023 07:21:29 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Vvq-001i9E-1M
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Nov 2023 07:21:28 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9fa45e75ed9so529122066b.1
        for <linux-mediatek@lists.infradead.org>; Sun, 26 Nov 2023 23:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701069685; x=1701674485; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T6S1s40sWViYLu6oL2nXqBoaND9tOpYGaBtg6/tr1Es=;
        b=ZNYNNOIodERff7rMn0hyvKBB5VP2Pvr+RFStOPTqx6v+Sh3zu1JbHdcPmloCuFhVTV
         m2BgUqa5HIvJ/2fExRB6fflnJo1owEAYi2EryJhJdqE2q5vYTo2ITeDzytKMnZQNdn5k
         h8ygKF25R+0wmv8iVfm2HkZYmWA2HAgsgxoPoGaaDPDKU80n0qv6BbyxfssM3PJ4+U7A
         w8qU5r2uH2BxqZc0wFaALCagVK8hixsXBKjQjobCdj5lI8C5TFCLMROiufxSPfVvfctE
         /z4SpYYV9++1Bu+vi/+NzLfK6dzftZemEreMAylti0rJM6ByrqA8hAAU+nzAdHbEi/3Y
         cuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701069685; x=1701674485;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T6S1s40sWViYLu6oL2nXqBoaND9tOpYGaBtg6/tr1Es=;
        b=kgK3yI9tHc3XHDwd4jBUmeos2TgpYiOtnp4dCPkbjA401bqg0Dw475BapmZoSr65gt
         876JCr7GNZKxvGF3sV32l6qAjn/V7lwHEjvWzvHWkvzhLQQct/GEuNU8NKYOLhpqFe6e
         3Rbzsy8biNINjON5V22KZqixS6hy6OBwAc8kwVdRYr+SThsEehBIdk2+eAP82J/ezpCa
         9Y6QDY2JKuq0HC5SzWr6qAeKUU/bGcb1PqU29zUpmGTBkMuSAbxusISC9bmJqXlOBUqI
         aT+TJwagmNRrOyqEGIHyP4CFFvI+SsMQY6CHi/EgC/pAAMFMcmmqtmkvDSBLI+1a6Qky
         kv9Q==
X-Gm-Message-State: AOJu0YzPzXbgT1hQu00acu4kUB5fB1DQui5rXkIKNaMlXeHTacmeD2zE
	FGiNzUhJ17Vj25lM2YhgA5sS7Q==
X-Google-Smtp-Source: AGHT+IFcr9ctcVoVNDyfiO9b5IQBOV2ALaTQ1okpUVxrhxJd7WhtzILjh5MFlhdI2NVpwd1+zEifmQ==
X-Received: by 2002:a17:906:1f02:b0:9ff:a532:b122 with SMTP id w2-20020a1709061f0200b009ffa532b122mr6616259ejj.7.1701069684818;
        Sun, 26 Nov 2023 23:21:24 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id kg23-20020a17090776f700b00a04431e5a44sm5416738ejc.16.2023.11.26.23.21.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Nov 2023 23:21:24 -0800 (PST)
Message-ID: <0dc24d82-e09d-45bc-98ae-1dfb6318cb96@linaro.org>
Date: Mon, 27 Nov 2023 08:21:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: phy: mediatek: tphy: add a property for
 force-mode switch
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Bear.Wang" <bear.wang@mediatek.com>,
 Pablo Sun <pablo.sun@mediatek.com>
References: <20231125012303.760-1-chunfeng.yun@mediatek.com>
 <e34c2746-8e93-48b8-9c96-690242fbf6e9@linaro.org>
 <239def9b-437b-9211-7844-af4332651df0@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <239def9b-437b-9211-7844-af4332651df0@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_232126_467459_2ABFFF71 
X-CRM114-Status: GOOD (  26.14  )
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

On 27/11/2023 08:09, Macpaul Lin wrote:
> On 11/25/23 18:37, Krzysztof Kozlowski and Chunfeng Yun wrote:
>> 	
>>
>> External email : Please do not click links or open attachments until you 
>> have verified the sender or the content.
>>
>> On 25/11/2023 02:23, Chunfeng Yun wrote:
>>> Due to some old SoCs with shared t-phy only support force-mode switch, and
>>> can't use compatible to distinguish between shared and non-shared t-phy,
>>> add a property to supported it.
>>> But now prefer to use "mediatek,syscon-type" on new SoC as far as possible.
>>>
>>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>>> ---
>>>  Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>>> index 2bb91542e984..eedba5b7025e 100644
>>> --- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>>> @@ -235,6 +235,12 @@ patternProperties:
>>>            Specify the flag to enable BC1.2 if support it
>>>          type: boolean
>>>  
>>> +      mediatek,force-mode:
>>> +        description:
>>> +          Use force mode to switch shared phy mode, perfer to use the bellow
>>
>> I still do not understand what is the "force mode" you want to use. What
>> modes do you have? What are the characteristics of force mode?
>>
>> Also, please run spellcheck.
>>
>> Best regards,
>> Krzysztof
>>
> 
> Thanks!
> 
> 1. I've tested this patch and it could solve the clock unstable for
> XHCI1 on mt8195 or mt8395 during system boot up or during
> unload/reload the phy driver.
> 
> The error message has been listed as follows.
> 
> [   13.849936][   T72] xhci-mtk 11290000.usb: supply vbus not found, 
> using dummy regulator
> [   13.851300][   T72] xhci-mtk 11290000.usb: uwk - reg:0x400, version:104
> [   13.852624][   T72] xhci-mtk 11290000.usb: xHCI Host Controller
> [   13.853393][   T72] xhci-mtk 11290000.usb: new USB bus registered, 
> assigned bus number 3
> [   13.874490][   T72] xhci-mtk 11290000.usb: clocks are not stable (0x3d0f)
> [   13.875369][   T72] xhci-mtk 11290000.usb: can't setup: -110
> [   13.876091][   T72] xhci-mtk 11290000.usb: USB bus 3 deregistered
> [   13.877081][   T72] xhci-mtk: probe of 11290000.usb failed with error 
> -110
> 
> 2. This is a fix patch to XHCI1 since MT8195 has been upstream.
> Please add "Fixes:" tags and "Cc: stable@kernel.org" to back ward
> porting to previous stable trees.
> 
> For example, add
> Fixes: 6b5ef194611e5 ("phy: mediatek: tphy: remove macros to prepare 
> bitfield")
> is suggested since the force-mode was missing in the previous
> implementation which causes hardware function was abnormal.
> However, add
> Fixes: 33d18746fa514 ("phy: phy-mtk-tphy: use new io helpers to access 
> register")
> will be better since the USB support for mt8195 is already enabled in 
> late 2021.
> 
> 3. How about we revise the description as follows for more precisely?
> 
> mediatek,force-mode:
>    description:
>      The force mode is used to manually switch the shared PHY mode
>      between USB and PCIe. When force-mode is set, the USB 3.0 mode
>      will be selected. This is typically required for older SoCs
>      that do not automatically manage PHY mode switching.
>      For newer SoCs that support it, it is preferable to use the
>      "mediatek,syscon-type" property instead.
>    type: boolean

Again, what is force-mode? It looks like you wrote bindings for the
driver behavior. Bindings describe hardware, not how the driver should
behave. The property might be reasonable, but you must describe here
hardware characteristics/issue/etc.

Also, your driver change suggests this is compatible specific, so why it
cannot be deduced from compatible?

Best regards,
Krzysztof


