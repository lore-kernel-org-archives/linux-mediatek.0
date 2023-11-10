Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15F4C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Nov 2023 14:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=761wTJXmJIbVemMGzSxPZy0DOYERpf+XUIdDq0AchnA=; b=3umS60t4eA0ZFY9WUDDq/HUd4j
	psVRim/48uTcc5svHBtp13VOFq2yYUJH2ymZ2TrOCaAzQbfca3rJkZQoGXhe3tnHn81PbVoKXZ3Cz
	+mYwhS+w8ZFHOY4yCEYFvW4kg7vTph8tjl4Jv+DHhwYRaxvSPONr7eb4W+G/tMmSVgitaSCqjLkiy
	k5OWK42q5oE2CP+vdPCQvy9KZ+l7XhzLhlX+lbPMFrafSLJfotTsoUDc8Xxg+t2q5h7bgHciyVQXA
	NCZJx0d7n41A2/PkRUKRkvEtOhdhqCNia1twnXy001IwydYdcrHnLiaKyxfonX3dVP4Wl7mIaxzvX
	H/0hj9pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1SNb-008uhj-36;
	Fri, 10 Nov 2023 14:21:03 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1SNY-008ugL-2j
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Nov 2023 14:21:02 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9e62ab773f1so109661666b.0
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Nov 2023 06:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699626056; x=1700230856; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=761wTJXmJIbVemMGzSxPZy0DOYERpf+XUIdDq0AchnA=;
        b=fCQAaEdBx2OJmYlStp/SwLHTKGqd+vkO8eI1EtjtiUPj32d4saQobMHgTnWFT+g49C
         +SWXqgVpYwZ9axtYgTAEYk0LCNt+qC5NhS02Me3VdNBDrOTlAALb+8dkGqIog0Q4lqP1
         kdeO3N6T8v2a/NMv8KEG+2sVGZrDmQ+uu9SprF7kvhNdb7nQlu1ya2L9uzIsqGpRsjSo
         yKTB6uU/uyCWP3LWYQq+EmFeCWZOfKRjZkigj78LRz/5iN79bZocFuBidTTd1W/NiNIZ
         JGJ0dT61maJXtHZT1Le1F/cVJpDSn18Df7d8JYN+0nDOrVJULV9rJDnnbKRHku8Qf5U+
         bhkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699626056; x=1700230856;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=761wTJXmJIbVemMGzSxPZy0DOYERpf+XUIdDq0AchnA=;
        b=FkI87shFov4bCGohGZhbRxVBN+nfuLgSdReLyZ7y/RkoClQ4H8IAz3QpCMI7c5gZQp
         Hm4CxZ+79Pieiv+108ClrE2tx7bsQrtTdxOGYE7L7aQw21fMF0xMwQKPHWq5e11pbpOP
         k++bxhuEvwqZ/qqYN0k0+q+IqW45NcRS4Y9/75HcD8m2KfnNFo3q+XPsD1JZ4AL0YTTE
         Hev+dGnsPJTM48femLMUmNl85L+7/4ZPk8+xV0/jvp5DkmdszdPdu7RHMbxP8+4HRZ3W
         CygwIiepb4h+Sy40KFewl795/71U665omQ0AdCTgT8PW3s+Mvs5QqnhN1WfDd5LeEyAa
         LjHQ==
X-Gm-Message-State: AOJu0YyCAnEPDdYTT5Fco9TCNNBetZc7U29C++9uWlowyhik/ff0ZX2c
	6dpBGIYvqfCqZ3bocXeS2XTVBw==
X-Google-Smtp-Source: AGHT+IFQpAra7PVuRUcOCF76pQsBdsA1UCxiXsX1n+SA8KD+0EUmEcqN2Ohj/s2kN80zUUCovtMbOg==
X-Received: by 2002:a17:907:940d:b0:9bd:e3ae:ef57 with SMTP id dk13-20020a170907940d00b009bde3aeef57mr6031060ejc.60.1699626056188;
        Fri, 10 Nov 2023 06:20:56 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id dk4-20020a170907940400b009e67c32050dsm635789ejc.44.2023.11.10.06.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 06:20:55 -0800 (PST)
Message-ID: <d7b72b3e-c8f4-4675-ae62-26f5ae576f0a@linaro.org>
Date: Fri, 10 Nov 2023 15:20:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: mediatek,mtk-wdt: add MT7988
 watchdog and toprgu
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <6912f6f406bc45674020681184f3eeca2f2cb63f.1699576174.git.daniel@makrotopia.org>
 <2678cb48-1d2b-47bc-9272-06d9aa140c58@collabora.com>
 <ZU47hV1i66WN8nZJ@makrotopia.org>
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
In-Reply-To: <ZU47hV1i66WN8nZJ@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_062100_884218_2C0C2A4F 
X-CRM114-Status: GOOD (  16.98  )
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

On 10/11/2023 15:17, Daniel Golle wrote:
> On Fri, Nov 10, 2023 at 12:56:18PM +0100, AngeloGioacchino Del Regno wrote:
>> Il 10/11/23 01:30, Daniel Golle ha scritto:
>>> Add binding description for mediatek,mt7988-wdt.
>>>
>>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
>>> ---
>>>   .../bindings/watchdog/mediatek,mtk-wdt.yaml          |  1 +
>>>   include/dt-bindings/reset/mediatek,mt7988-resets.h   | 12 ++++++++++++
>>>   2 files changed, 13 insertions(+)
>>>   create mode 100644 include/dt-bindings/reset/mediatek,mt7988-resets.h
>>>
>>> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
>>> index cc502838bc398..8d2520241e37f 100644
>>> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
>>> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
>>> @@ -25,6 +25,7 @@ properties:
>>>             - mediatek,mt6735-wdt
>>>             - mediatek,mt6795-wdt
>>>             - mediatek,mt7986-wdt
>>> +          - mediatek,mt7988-wdt
>>>             - mediatek,mt8183-wdt
>>>             - mediatek,mt8186-wdt
>>>             - mediatek,mt8188-wdt
>>> diff --git a/include/dt-bindings/reset/mediatek,mt7988-resets.h b/include/dt-bindings/reset/mediatek,mt7988-resets.h
>>> new file mode 100644
>>> index 0000000000000..fa7c937505e08
>>> --- /dev/null
>>> +++ b/include/dt-bindings/reset/mediatek,mt7988-resets.h
>>> @@ -0,0 +1,12 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>>> +
>>> +/* TOPRGU resets */
>>
>> The first reset is zero, the second reset is one.
>>
>> Where's the zero'th reset? :-)
> 
> Currently the reset numbers represent the corresponding bit positions in
> the toprgu register, as this is how the mtk-wdt driver is organized.
> 
> So there is probably something at bit 0, and also at bit 3~11 and
> maybe also 17~23, but it's unknown and may be added later once known
> and/or needed.

There is no need to put register bits, which are not used by the driver,
in the bindings.

Best regards,
Krzysztof


