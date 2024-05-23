Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C991AC25B75
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 06:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i6dbk9a+uth7yFh6CNI3vvuN+SA1MsPZmlUVqAH6eR8=; b=o3fwEgzMyFG+2Bd8KfAxdWntEa
	dDXmyKTAmUetmWu1LdfRpgApGFN6Pl7Z8I46y8v0aTpYEm1ilUt6mo1La2XVY1IfCPiVblCyGsDFE
	hXYjT+40ot9hjTQQdxKPdjDEtj8PP4YBhnWRUopadT2qgHYWI+kaHLvUecUWDQ9t/2wsPw/+VR48w
	P3Mu2ZNRfdToIzPZXkay1d0YlNm6TqpD+FC9rCYDNfg40N8sSMK6tGFOOM0/16Kd8biWjxaqN5q0W
	a39EeTEfdLFPf01fcjPw9ej0bZDTMkZ/YA+3vyl6y5o5nEDXiS8ZIbngnIVzliZNakF6x/Iy6gEb8
	JxYXHPEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA1Yr-00000005ABz-0KKR;
	Thu, 23 May 2024 06:04:21 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA1Yo-00000005ABQ-18W0
	for linux-mediatek@lists.infradead.org;
	Thu, 23 May 2024 06:04:19 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-34d9c9f2cf0so1878512f8f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 22 May 2024 23:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716444255; x=1717049055; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i6dbk9a+uth7yFh6CNI3vvuN+SA1MsPZmlUVqAH6eR8=;
        b=Rtb+L3h+dmtS7oEjldvzIVSbzkchl/TeoU+uvht+SMrWzMS+3/vSa+32a83g0oNnsG
         jf95EBMSROXIkqXnewu5WWrfVS6UvtpVvJRUTaRYsHarJTaYpXzkqBK9rbe0ZQGifE1v
         5K7kpEODGjUMSGLoyk52ngfGEjPRoiwCgf6OahmfIwMglLLAkokpbfl/B7K3lefdflBE
         r+ydK3bdv7MkHLy8YhfOsGxoawvS9rFpYC4BAaTIsBmGYYXXZiJoxHMguwAO4+o4MrJ8
         ECxh/lAUfIb33Gdf68S7kJmBdEt6U1JCHlN61lwWBpffM8cdLpYUZMwcuuxbLPgYEaB/
         506A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716444255; x=1717049055;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i6dbk9a+uth7yFh6CNI3vvuN+SA1MsPZmlUVqAH6eR8=;
        b=QFn3IpRERSzrl29pTAN+WIzS+dlvqEGBMOkNiBKlTCJmJhOzXFRLVM5eIBtiv302K2
         4RSCNeCBog+rP4n3dvo9E3UH8cITozuCioMI9BCYdpyoQhNrZxAyvzgMGUDI3EiPVgKL
         XMS+dhyg47z28QiUmuCrbZ84+twRrCPvCbK849giIWt3z1XVXNlElUQy/N9ovPWqc3GZ
         LfkMKphq9qSmQvXhxpLwOQOTeJvcvZ5eWSVVr9JHcg+owdsozRh+D+suxCWP6t6HqGaI
         4FFgbWNf8knNifJNScJ3qPH8HvBBe6dn+B1X4fNQUkcm82Ct9G+WYgrzr82uH8XJXJ5B
         StOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRlxwUIB332c9F70sJtxRmdXilTfXxtsIwquHzzVNI1umLQjfVimD+iEIRISqqlHeJG1NoI6NtXmdVgx0w+LMctUo4EjuwUAdiunOHACAFTHy5
X-Gm-Message-State: AOJu0YxwGexuSHXBzMkVB+hHlnAM1q+V9isKhrwOi3LOmJgsHj152NEU
	hOXMLS9wjTLDWobBH1xKWMMYGYZ5tz0wa2+LfPRC0ZbBqEUG+bH1LoYFnoTo0Uw=
X-Google-Smtp-Source: AGHT+IGxh5Tk8DFPD8rFp7ALYpXsYOIlALKHags95KPmf6Hf+jMmQIvoRHGyEUGwvmQTTwMbFR4/2g==
X-Received: by 2002:a5d:457b:0:b0:34a:4227:e9e8 with SMTP id ffacd0b85a97d-354d8d8de10mr4617489f8f.47.1716444254670;
        Wed, 22 May 2024 23:04:14 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-354e736c71bsm2618353f8f.5.2024.05.22.23.04.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 23:04:14 -0700 (PDT)
Message-ID: <dc50ee9a-1fd3-429c-9b4c-5a8b8824ae1b@linaro.org>
Date: Thu, 23 May 2024 08:04:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: dt-bindings: mt6358: Convert to dtschema
To: Kartik Agarwala <agarwala.kartik@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20240518081621.63386-1-agarwala.kartik@gmail.com>
 <c05f91f5-a878-4f36-b325-0ac8e038a7e5@linaro.org>
 <dc8a05ee-ed84-4517-baad-a220d8702f07@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
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
In-Reply-To: <dc8a05ee-ed84-4517-baad-a220d8702f07@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_230418_358627_E53C4A16 
X-CRM114-Status: GOOD (  17.60  )
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

On 22/05/2024 23:04, Kartik Agarwala wrote:
> On 5/20/24 12:39 PM, Krzysztof Kozlowski wrote:
>> On 18/05/2024 10:16, Kartik Agarwala wrote:
>>> Convert Mediatek MT6358 Audio Codec bindings from text to dtschema.
>>>
>>> Signed-off-by: Kartik Agarwala <agarwala.kartik@gmail.com>
>>> ---
>>>  .../bindings/sound/mediatek,mt6358.yaml       | 47 +++++++++++++++++++
>>>  .../devicetree/bindings/sound/mt6358.txt      | 26 ----------
>>>  2 files changed, 47 insertions(+), 26 deletions(-)
>>>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt6358.yaml
>>>  delete mode 100644 Documentation/devicetree/bindings/sound/mt6358.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt6358.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt6358.yaml
>>> new file mode 100644
>>> index 000000000..f57ef2aa5
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt6358.yaml
>>> @@ -0,0 +1,47 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/sound/mediatek,mt6358.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Mediatek MT6358 Audio Codec
>>> +
>>> +maintainers:
>>> +  - Kartik Agarwala <agarwala.kartik@gmail.com>
>>> +
>>> +description: |
>>
>> Do not need '|' unless you need to preserve formatting.
> 
> Noted
> 
>>
>>> +  The communication between MT6358 and SoC is through Mediatek PMIC wrapper.
>>> +  For more detail, please visit Mediatek PMIC wrapper documentation.
>>> +  Must be a child node of PMIC wrapper.
>>
>> Did you update the PMIC wrapper binding with ref to this?
> 
> I am sorry but if I understand this comment, you are asking me to update this
> file [1], correct?
> 
> 1. https://www.kernel.org/doc/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> 
>>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - mediatek,mt6358-sound
>>> +      - mediatek,mt6366-sound
>>
>> You did not test the DTS.
>>
>> I think I raised the issue already: please make necessary fixes to the
>> binding (with explanation) or to the DTS, when converting the binding.
>>
> 
> Apologies again. Just to be sure, am I correct to assume that you want 
> me to fix the dts file [1] as it has both these compatibles 
> mentioned instead of only one and I should fix that by dropping one of 
> the two compatibles?
> 
> [1] https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi#L1246

No. I want these to be in sync and correct. dtbs_check must pass, which
requires either changing binding or DTS, whichever is the correct action
to do.

https://social.kernel.org/notice/Ai9hYRUKo8suzX3zNY

Best regards,
Krzysztof


