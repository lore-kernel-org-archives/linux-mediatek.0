Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02049CDB482
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 06:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dB0ZtuvBpzCfJmkGB4L4RLzR1f5mVGD2uoUp3Ko3U84=; b=UncXeD12FwEMT4NhwBidDL5OVy
	207qyOMk3nlp3m38gIL43u8r72zJ+enfJ9qoy0t5/hB49AjA594RjZeF6j83jhkgyL8g+nENDEAkc
	AjcyyGvPfOoi2Bdwg53NolBYw2G7a9wfGzsIg8oyFWBNDjqp7vcWxoTU3t2BrTMu0+YYepnbe+FYL
	7lToMzSS6XqTF3RpERvqIQA5X1lbKbcn+Xknyq5Jn+1esV8WjwRq5godT1jFr1S9fnu3weTRD+At8
	+x05fhRSIWFRk/WPO0GRlKaM31VaVlh8IM+x6A4gTvcq6A4qdD0p0rwmSYJ/03zWs/sej0IrmFCBt
	mo1qhDIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsdRj-00BOzI-2w;
	Tue, 17 Oct 2023 06:20:51 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsdRh-00BOyR-1D
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Oct 2023 06:20:50 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-405361bb94eso60194315e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Oct 2023 23:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697523645; x=1698128445; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dB0ZtuvBpzCfJmkGB4L4RLzR1f5mVGD2uoUp3Ko3U84=;
        b=XVMXG1IbeJosKv5HkXxd0pPuEkSfhOnKxLV/N4Hs0F7qYKcJxqShLDoE/0/G2I8Sci
         x6dVKn35qQrdKf1h/PXo1VLoO7afbrE6rm2BvE1qxHJ37/Y5kj7AFrf319D6XBJxqJ9S
         KA9jDYCqApa0qnrKgfNTjgBduw3DPRxuKyKPR4jIjF+NzD5+WUl/kac6UZOdkxgpxATj
         kAgElASCm8bnF0R2D+v68+644yWQ6v3NkJ35TKXuNk9LX1RW6JrQqweMrpi1TBM4O3Tg
         rOLOuZwUJ30MXodnLEQSu/xjxcXuVFArPO/q5AaPBabOf0MUkNDzVB4jz+/+K39uuGmT
         q86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697523645; x=1698128445;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dB0ZtuvBpzCfJmkGB4L4RLzR1f5mVGD2uoUp3Ko3U84=;
        b=eGg64a8/egyHsQLFimjy7jsuT7LXVDUnc17CLJ9G7kNzx/swPlPV/aUeNoKeUj2HwK
         IcP8DyvVQI/mn+o0aZrImSwyEVRu13gBmxcx4oH/JGnv4MrruXoe6UqByZuZqvW7/BtB
         owUIp1HZTMLtJuoDLT42r4IKtE4kaYXcfX7gIRtOpFkS3uEIAjf7+qEWFQZVc2OU+fkF
         hAeU6p0p0gwaSygNoE+fyi8HSdfz7/ePFz582EUbZscsXdWpsW+vduUdqOvh5Fyh0jMp
         NSc6XtKeoQZvwPUY/HyXMIGv0IgG04NS+6jLqmuVCVYK7gY8gpPvciUpQp8FuFkq/Jtc
         or+Q==
X-Gm-Message-State: AOJu0YyT9NWXVnFdMjHmxE5IkvSnPhDBXTh5ptw+kt5+0MjGOvT50sqP
	01qD8TDFViTmnbntkV8TJkEGIw==
X-Google-Smtp-Source: AGHT+IH8jUdJj/EBHL7IvUZhzkN0+At2Kj8Rew3Vm6nc6CtxKM3p6dRkn/8AW9max/0BjYJNKTtfiQ==
X-Received: by 2002:adf:f4c3:0:b0:32d:8189:c065 with SMTP id h3-20020adff4c3000000b0032d8189c065mr1356435wrp.58.1697523645662;
        Mon, 16 Oct 2023 23:20:45 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.154])
        by smtp.gmail.com with ESMTPSA id o8-20020adfcf08000000b00326dd5486dcsm867476wrj.107.2023.10.16.23.20.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 23:20:45 -0700 (PDT)
Message-ID: <62514f27-ec39-4b1c-870a-38e3dd7add1f@linaro.org>
Date: Tue, 17 Oct 2023 08:20:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] dt-bindings: arm64: dts: mediatek: Add
 ologic,pumpkin-i350 board
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Fabien Parent <fabien.parent@linaro.org>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Julien Stephan <jstephan@baylibre.com>,
 Suhrid Subramaniam <suhrid.subramaniam@mediatek.com>,
 Ted Larson <ted@ologicinc.com>
References: <20231016215123.30343-1-laurent.pinchart@ideasonboard.com>
 <20231016215123.30343-3-laurent.pinchart@ideasonboard.com>
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
In-Reply-To: <20231016215123.30343-3-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_232049_414546_68004D04 
X-CRM114-Status: UNSURE (   6.76  )
X-CRM114-Notice: Please train this message.
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

On 16/10/2023 23:51, Laurent Pinchart wrote:
> Add a compatible string for the Pumpkin i350 board, an MT8365-based
> board developed by OLogic.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


