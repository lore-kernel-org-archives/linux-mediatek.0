Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C718C54E5D
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 09:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DmORVVqQRASoZ9rnkfY0LA6LIBlyeKMNcLspwpQKNk=; b=eBYVAmHGOsdrmhmSJdepqt9Nsd
	YKxUgdayX9H5SqmfeC2wAWB51ahQlzvkdM71hTIsuSaasgoAjBJ97QBHjXOws/uqP+TBT9XAbQiJa
	gF3SPNeaRgH0kseRtXh+K7fsrF9iX5mcRazwe0b2KaYaSxLsk9HlKQV6aYygZFe9o5tO+i5uge/NV
	otzCSRT9uExxF8UL1piCRrn3pv9LhO9RvW3jblX6ngweVTizHt6dwUShh4/yBz8vDb2apFo/+W0aR
	N5smU3YPTzflhEaA7kRznBypUtWECeALKZIa2V+8i1baZbJ9MUFV83nDI70uREbiAE3NFoEW+t5dh
	nm+0RlKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm99q-00000007sUB-2cyW;
	Mon, 18 Mar 2024 09:19:50 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm99l-00000007sSP-1u8j
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Mar 2024 09:19:47 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-56a2bb1d84eso984136a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Mar 2024 02:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710753583; x=1711358383; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6DmORVVqQRASoZ9rnkfY0LA6LIBlyeKMNcLspwpQKNk=;
        b=HAKilBkRI77+Z+b7bYND5wLmbtOIdyXfRLIVTuVsFxtJ7ltT0NcXlDbmBuwjZUe5db
         WUtmMiLWZGRt3vizooIGF5qTfGW+TWebN5PcGKhg125Tl34+ptxSBN97qSxrZCjVaxPz
         eoPhbdHdsjT3ZtGJ9sWTKyTDWDq2DIZrKYKFGEwAhKv2jjH71eoNVpC4LTQHMgmv9agf
         PEjLi/FQGJ39RJ8ST2mFExvrVIpA9/4C0ZQ4+nje7P2OiLMeUa3LiQt1IgSSZPPPzkGK
         joXqOhZCnOdxDBKq6B6ij8LmHXT1KXZKw82d/XLUfuG+mwMaVyltsHGETW+tERh9otUS
         xRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710753583; x=1711358383;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6DmORVVqQRASoZ9rnkfY0LA6LIBlyeKMNcLspwpQKNk=;
        b=NttIQ/w1NhxGSG4IowfMtF3M3350nmOct5wJnd+SJGaRAiiJVWgvA4k+iLVc2zHp8V
         EUmZyX3Nc44Uir9yAXwAVW9UY3GHnzHAsOMtO4savCWTMChQsa1EFLmf7QShG2/LuVQn
         OkQoPQI3wHvZZIPyL8Hmm0/lo1KKdQ23/2RHMu/ISJduqkBuOEm0iBXVDjsLi5zKayka
         eQFz0r9WAThspM59T3Yed+sijLcHrm+zlv17G/vIWej89IHd8TsbIZ8m7lAWGSCExUUd
         q78AWRALlN3b7QFlkylNxNzV+7rT/tZopQEOL1rdyReKFKAgQZb3Ay6VhyZU0YiaPRpI
         2Tzw==
X-Forwarded-Encrypted: i=1; AJvYcCUeK8R1Jv2gZoHyTl5up729ICG88z4PRUGQwciwnMRoEiIwxhb6SNwtalgm9vAg3GU1XwzCyWC9TC1eoVz6oAhZaeneN4jCISO6FUw32pJn2vzl
X-Gm-Message-State: AOJu0Yzd7hMo4IpF0bHEaen8f6XGkaGqLW4JZX1cXpXFhDtvYGPGpSpJ
	om4Fx0pXxrzHCYESKhxbwSl3hBMJOdrSEH2pipEiv2/SNxWbDGM0KtmZlBW+uds=
X-Google-Smtp-Source: AGHT+IEO7HsXFmgG7cuRv+XQ37xkX8fwJoLmGPXNGPpfTG+c2mFTpqtwRjx9ZqjjwFVZwbR/mziCIg==
X-Received: by 2002:a05:6402:3814:b0:568:d21c:e0ef with SMTP id es20-20020a056402381400b00568d21ce0efmr3109311edb.6.1710753582701;
        Mon, 18 Mar 2024 02:19:42 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id x1-20020a056402414100b00568d2d4e4besm1390210eda.54.2024.03.18.02.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 02:19:42 -0700 (PDT)
Message-ID: <8a6e717d-a63b-4f1f-9873-efce2a868a4a@linaro.org>
Date: Mon, 18 Mar 2024 10:19:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] mips: dts: ralink: mt7621: improve DTS style
Content-Language: en-US
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Justin Swartz <justin.swartz@risingedge.co.za>
Cc: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
 <CAMhs-H9ZO-sitsrASuvsEd+ddwVyHH35gj7yAABTqFNfOCGYYw@mail.gmail.com>
 <60512ae2-dd73-4cb6-9514-145f946300fc@linaro.org>
 <5d6c36cb9dd9afda1efb69aa34058517@risingedge.co.za>
 <adefc3ff-86a5-4af7-8276-73d0e0108901@linaro.org>
 <26633d73360e43b2c548f49e544472ea@risingedge.co.za>
 <CAMhs-H_1bwfKO8yquz-3BHQ0UQYW1FFVJYHE66w8Q9m1+fCCHw@mail.gmail.com>
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
In-Reply-To: <CAMhs-H_1bwfKO8yquz-3BHQ0UQYW1FFVJYHE66w8Q9m1+fCCHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_021945_754492_399839F2 
X-CRM114-Status: GOOD (  12.82  )
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

On 18/03/2024 09:48, Sergio Paracuellos wrote:
>>
>>
>>>> But if there're no objections and it lessens the burden on
>>>> maintainers upstream to have less patches to apply, then I have no
>>>> problem combining them into a single patch.
>>>>
>>>
>>> Yeah, one review response instead of 14 responses... One commit in the
>>> history instead of 14.
>>
>> I agree that 1 commit vs 14 is better.
>>
>> But for future reference: is it not enough for the Reviewed-by: trailer
>> to be sent in response to the cover letter of a patch set if a reviewer
>> has looked at the entire set?
> 
> It is enough, AFAICT. I found your patchset very easy to review so I
> am ok with the patchset as it is. However, at the end this will be
> through the mips tree, so let's do what Thomas prefers: add all
> patches as they are or squash all of them in one commit.

Yeah, like fixing language typos in comments: one typo per patch.

Best regards,
Krzysztof


