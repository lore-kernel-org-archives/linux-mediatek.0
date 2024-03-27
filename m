Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04811C47DD9
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Mar 2024 09:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9VA56VrFWmCSGuSnKV8c60GKZ/E4BlEsHm8F89QPoQ=; b=mLsp6a1Pi+l6/hswpqqpavpg21
	f9Sp4barjK4eICKV9wYrotmJtIdqwCS1XSfEc+8xd6sW9fnMJKeqROY/J0IFEfvc3Kg5UYdhk5HfQ
	2/KoSkYSC24gUfWl2ie9hOSUQZkrEIXlQaupgUeNMNHGJYgtrrMztbAONvnyedypwITojH6dFwx/m
	hJJ1Qt16NMaeDYkvcAxq03n1szKpA2mikhcBAxey44TtxEjjWBDI3/loWnel16vkGV03zp/POX5l3
	bFWVyoGB8xeVrWyHohSYPe+ICFhO1QO29tg6DZgZYY1Hg4Qsk6A8lOeB0ZjAeLvG6lRp263oxAKau
	CNTZqMtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpPVF-00000008DaR-0LfX;
	Wed, 27 Mar 2024 09:23:25 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpPVB-00000008DYR-2NRL
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Mar 2024 09:23:23 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a46d0a8399aso109633566b.1
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Mar 2024 02:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711531400; x=1712136200; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U9VA56VrFWmCSGuSnKV8c60GKZ/E4BlEsHm8F89QPoQ=;
        b=nKr8+6wUw4QW6FjD+/oLTHi+DZS1UERJaMn4Xp6aRDOAb28xDRhCqWZHgLvrdTVJmQ
         J9UEslDkMNX4v8Q5bXnn/7GJL1WJd15QMyoKIx8NtBv4Qvk4Mi7kpMrdrqkTPPCTPGHG
         8GJ6Yc7vupx798F8DkGEYaP6TyS2bzW9UIkzwpzeG9z8wLz7Faiq88//PmFScPU6SA5I
         +lt9ivD+nihZ0VfBReqsvG3x+xksizPn59Rdcc89uXRWFvkt0aSDBG28MJRnxLuo2Ir1
         /unWDibuBYFSZUNR/qi8QPdoD0dJmZz8IVGtJHQJC6VBDV/O5esiPSFqiiehj9SH0Nxw
         W5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711531400; x=1712136200;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9VA56VrFWmCSGuSnKV8c60GKZ/E4BlEsHm8F89QPoQ=;
        b=lk/5RQmsW+4D/VEXSV6mspedwtNDeUOlINL6nAmA6QVi25GljPgSWHnxkn6XZ2fC0L
         smc3Pbtpby/5T9y6//zOwaifufhwdvIPbYxbseq97Ht163BhBEBJCtyc41L9ssjf9ugZ
         L9TPhM75tMESf/nLZYF0gAoPlHSDIsEGRaUNyZGCfx9Ns8ZQg42++cr1UQBp84K4ye6I
         q00Qn0kM6pFoRuUcLyUUtduW76rwulJYUI+BH/RcW1HMLATbi2/Dxg4bd+QIOJkhtI4P
         zrSPOzhtNreD4vaQ6E+6cONLT6GZwpndKDNWF9IjP6NT/Hs0kkwhN/j75+stpUyVRERK
         MkQg==
X-Forwarded-Encrypted: i=1; AJvYcCXtVV0AoKLhZdrbAjuheAkxInMnQE/ZBW8he9eMBUUdJCUaUx2Cpq9rJVwz6ffzng2GAuUmRwTBOhKcU9Z1bWjf32JrVLyq9Qu8YbbUNH8DRPcY
X-Gm-Message-State: AOJu0YyWQsJQYtwJtxBwXeN0CSvI6zRt7FHdQzT7FqjKI4GKQCSWnlUQ
	hRKegooVmErfG1ZMH0spv8XRquTmbCGrWqzlZqOvLyLDcra/YxGhCgomIdlDu+8=
X-Google-Smtp-Source: AGHT+IHOTEmL5nnAkaZ43sMnfmXMPzU1hxieecDn0KTOMb9akiksiLfGJLOnOIYjYs+Tzeyvsdi2eA==
X-Received: by 2002:a17:907:7d8f:b0:a4e:14d:69d6 with SMTP id oz15-20020a1709077d8f00b00a4e014d69d6mr1513670ejc.36.1711531399781;
        Wed, 27 Mar 2024 02:23:19 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id p22-20020a1709060dd600b00a4df7d02395sm1406144eji.86.2024.03.27.02.23.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 02:23:19 -0700 (PDT)
Message-ID: <c3ca3d90-898e-44b0-ad0f-dd78c09c5fcd@linaro.org>
Date: Wed, 27 Mar 2024 10:23:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: power: Add mediatek larb definition
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: "yu-chang.lee" <yu-chang.lee@mediatek.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, fan.chen@mediatek.com,
 xiufeng.li@mediatek.com
References: <20240327055732.28198-1-yu-chang.lee@mediatek.com>
 <20240327055732.28198-3-yu-chang.lee@mediatek.com>
 <6dd9959e-f741-47af-b10a-1894f72ae78f@linaro.org>
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
In-Reply-To: <6dd9959e-f741-47af-b10a-1894f72ae78f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_022321_719462_E9A1DE0C 
X-CRM114-Status: GOOD (  13.30  )
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

On 27/03/2024 09:39, Krzysztof Kozlowski wrote:
> On 27/03/2024 06:57, yu-chang.lee wrote:
>> Add Smart Multimedia Interface Local Arbiter to mediatek
>> power domain.
>>
>> Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>
>> ---
>>  .../devicetree/bindings/power/mediatek,power-controller.yaml  | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>> index 8985e2df8a56..228c0dec5253 100644
>> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>> @@ -125,6 +125,10 @@ $defs:
>>          $ref: /schemas/types.yaml#/definitions/phandle
>>          description: phandle to the device containing the SMI register range.
>>  
>> +     mediatek,larb:
>> +        $ref: /schemas/types.yaml#/definitions/phandle
>> +        description: phandle to the device containing the LARB register range.
> 
> Why do you need it?
> 
> Plus I also see mediatek,larbs and mediatek,larb-id... so now we have
> third one similar.

... and not even tested!

Best regards,
Krzysztof


