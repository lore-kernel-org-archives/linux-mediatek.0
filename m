Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF4DC47073
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jan 2024 08:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdxnAmjWNKq4y1w9DC06BYcijknvo3Hfm6Sa3dcMMKc=; b=diyuRAI3zx1ghNNbzFzdB6J/Q7
	N5eWmmxQRRCUwpI/gKGdKtNQH2K1kvPcqtVOXRiSjW4kYzoN6bPwc6VI+W/+kWKmZRK/p2Bo31W0+
	yfaK+kBfd/HDlBxARtEmBqLIP59OrDY2g1B06gv12L0MVuAHkSuYMbBNWSsc6kvwdx55kG56ZLsWJ
	KZd7Ine8u+FxI9WdXPyxUtU6JLDH3FXfYQg+yisQ8KzvIwInzAngsUCSFMF3S2lOew9f/l0NDIaPQ
	NBBbK9eV9aTF6DBzW0/kF8T7zkGqKgJifUIg/hrh7eLZ3AQsSkgJDVvPpQmyRnIwivlU1+/+RtcyD
	2y8OJiIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rN72u-007EdR-1B;
	Tue, 09 Jan 2024 08:01:12 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rN72q-007EcN-2F
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Jan 2024 08:01:10 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5571e662b93so2224939a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Jan 2024 00:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704787266; x=1705392066; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bdxnAmjWNKq4y1w9DC06BYcijknvo3Hfm6Sa3dcMMKc=;
        b=k04SeOGI8tUzHKsiA+stTDmfmtguL6YWcbUFSBN6k8wU/59TBGkhE2iQ4bYXO2hCM+
         D8E/lqs576jlX5FqwVRbmXwx5997kl+jfrlSuOhhN31Pqu8oK3wn9sjvDhVuR8n8Woa+
         eKvtbbkn/5sCxTKxh4YOBPLE8ftZQp7e8GG1JNudCDFr19A37tDCkFAfrbLcnPlzrmB9
         vBinKzA71YO8gTRLGloagROi51Z0XodEsT/MRqXbxvcrEqNc8EFKVI/GDmHw2TSACuLo
         ucj3VTQ2qdIPEowVkxTtJk5UXmoeqD8e41LBtBBK7KIVBVBRcR36YZiWqweY1zE2zZLM
         RegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704787266; x=1705392066;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bdxnAmjWNKq4y1w9DC06BYcijknvo3Hfm6Sa3dcMMKc=;
        b=fXWjx+HG8r9CCek1xXdThanBFgFKtOJ3tEKrffGNwwknOvyY/BZn840FEiNR7/hVu1
         ITKd51qXo/RXjbJq8yuPNQjN1vZU6amKuM6jI2p8+VL38G19Wnt8IvoEGuDlrEtn+9ZA
         I55Z5IgW9z9az4hHflCr+Kd+l5BwVKYrC741EJQQ5AdIBK1jxaAw8D3/3l4pm/LKgpN5
         zqb0GFcTb4ZKY2b0kw3XB44T/PZUUu9guxWh9WhtHS1hheVDl+c57rinpa0494P18eCa
         HiN4t10BHPDYdW5t1fxVUuPGhGtcVMg9BZ3/CRoOq33N3h+N7sr+ZSMNzlRO3yCItfpF
         dpxg==
X-Gm-Message-State: AOJu0YyttFaISaaceo9irwxLTnA0opyJZKm9Y/9YU1zUtlrp8n2pAIqj
	uiQQ+5T87bIPpin7dF0OhkLl3LqnYP1oLw==
X-Google-Smtp-Source: AGHT+IEa/o2zzbOHIBzotoGx7Xl85bxPkGyo6iosf7bc67LTjXqjkMi5CuZMGjLY2nDSSD4ToGehDg==
X-Received: by 2002:a50:cc88:0:b0:557:13ad:bc8f with SMTP id q8-20020a50cc88000000b0055713adbc8fmr2800560edi.28.1704787266082;
        Tue, 09 Jan 2024 00:01:06 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id dn1-20020a05640222e100b00557e0e24abbsm657444edb.59.2024.01.09.00.01.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 00:01:05 -0800 (PST)
Message-ID: <11c58108-4851-4378-b7b9-2c302231ac68@linaro.org>
Date: Tue, 9 Jan 2024 09:01:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: i2c: Add GC08A3 image sensor driver
Content-Language: en-US
To: =?UTF-8?B?WmhpIE1hbyAo5q+b5pm6KQ==?= <zhi.mao@mediatek.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
Cc: "heiko@sntech.de" <heiko@sntech.de>,
 "gerald.loacker@wolfvision.net" <gerald.loacker@wolfvision.net>,
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
 "yunkec@chromium.org" <yunkec@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?=
 <shengnan.wang@mediatek.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
 =?UTF-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?= <Yaya.Chang@mediatek.com>,
 "bingbu.cao@intel.com" <bingbu.cao@intel.com>,
 "jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "10572168@qq.com" <10572168@qq.com>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "macromorgan@hotmail.com" <macromorgan@hotmail.com>
References: <20231207052016.25954-1-zhi.mao@mediatek.com>
 <20231207052016.25954-2-zhi.mao@mediatek.com>
 <1d58c2b9-4206-409c-b312-87f4fb649512@linaro.org>
 <e709beb2acaf0cb68c6922f3b48431644e9a0246.camel@mediatek.com>
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
In-Reply-To: <e709beb2acaf0cb68c6922f3b48431644e9a0246.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_000108_780417_A1F0AD8F 
X-CRM114-Status: GOOD (  10.10  )
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

On 09/01/2024 03:50, Zhi Mao (毛智) wrote:
> On Thu, 2023-12-07 at 09:18 +0100, Krzysztof Kozlowski wrote:
> External email : Please do not click links or open attachments until you have verified the sender or the content.
> 
> On 07/12/2023 06:20, Zhi Mao wrote:
> 
>> Add a V4L2 sub-device driver for Galaxycore GC08A3 image sensor.
> 
>>
> 
>> Reviewed-By: yunkec@chromium.org
> 
> 
> I don't see review given here:
> 
> 
> https://lore.kernel.org/linux-media/20231123115104.32094-1-zhi.mao@mediatek.com/
> 
> 
> This does not look like real review. Where was it performed? How
> 
> thorough was it? How many review iterations did it include?  Why there
> 
> is no name but anonymous review?

That was my message, not yours! Fix your quoting and reply again.

Best regards,
Krzysztof


