Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D912C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 08:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tmDdcKP/w1lSqdUXDZt0r8WrvJuiZTD+uLc8uT6i3VI=; b=sEDsqDdbagrdg6
	r3PV8vcj4CjKP8WdnVMCsh/66vLZwRdKGrKPXrl6RxWYl/CcO9lOGMOE1GA8/Ys9Cg5FEOtsKjdoY
	75Z9R11YGJxFNYIUPJxepG9KQaQbKqf28dHgDIuiG7Mj8Oi27rh3FAOjn2Z+A4M36ICgnAFCoipTc
	kHiR/H8sMm7K0ZxF5t5dy7G3nh9S1W98SGNCGFrOTil4iD2OkjDHZvkv/VpzYpmTDemCcca0h3YmL
	GiMLXoUTibS9KX46sGCGIN2jrpJ5D2QGPNHG7oPLzc8Sr8mDD3qTEqBfJaq87b9Hju4aFImkMMZ0l
	1OJv4hHIYe0tJEBZFT3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3tam-00000006cKj-3Zbh;
	Mon, 06 May 2024 08:21:00 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3taf-00000006cI6-0zqP
	for linux-mediatek@lists.infradead.org;
	Mon, 06 May 2024 08:20:55 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a59c5c9c6aeso201645266b.2
        for <linux-mediatek@lists.infradead.org>; Mon, 06 May 2024 01:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714983651; x=1715588451; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tmDdcKP/w1lSqdUXDZt0r8WrvJuiZTD+uLc8uT6i3VI=;
        b=p4msLcVbzH9UWmpz4i7D4/ZBfRFsb0TtXS+a1IB2vzJQMY0w61f3pFggiib73yUDjY
         yCv79YZStnZ/cctLYqvRubO8+dNz3O4w7i+xvRByWW2p8v9eEV+rqYn7mujbLjkN8aH+
         rzN2u+38PZoCk8khROwE2HgHXNu7HkmuwfWHLbPyprIUnQIj+ssB4q2rInVFAbok8OS2
         0sA6z8oSBw9I2f3H1tV8l3DxCqQ/UgSMuVtSoOu+R3gE8xk7ZMVIb1+SVyK87wBeCkyA
         LzJHl9Bq7mJNo8E00IY2qC406xIfJzjZLRNxmBbM9U5hnEVxSKBPbOJaQ+JyDVKqYaGC
         qP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714983651; x=1715588451;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmDdcKP/w1lSqdUXDZt0r8WrvJuiZTD+uLc8uT6i3VI=;
        b=jNyfS/pb3a6dsDjMmvRcJfOf4leNTKzRubLwKxY3Bv2tN+5aBrGcAt/Lmxu85zvVEJ
         djCRPOjUKUe3Mwzf+yzT+wXxX/m2sDeU1cDeYZqp4Yb/S5arTt7LphtwmNj8f3282mDu
         fmfH7oNoItZCyz8fzfY5W5kvGfgCny+uVwnxYZpuWAW8NY+Los4V60ieAHgUff0tZNlr
         br2hpvLXQYabc0mLeuUXeAy9ggyKTHPQD1Oxj3dF3vAml4yP95LGP3PjHqw79yIEzyCp
         VG1hG4Qxfo73zYVPrtz0YDBEbyYelYB3To1Z6NaGpWooViWoEvD1Dxkm8rEvlDbyymLc
         anTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxMYsjn5U1dPK6Gb24mrtTv8MK8LvsJyhNHq/WsAqFZVKCCpU6h0xrln++wkyToRVuNnCw4KmkPKD8oIWRs369Rep7od/6P+jytbmuj5qscNfr
X-Gm-Message-State: AOJu0YwuZzhWNZE1Qw4nJlQQK1KSop6Mud/ePWaGihh0GpQaGt9EFTph
	kxabULsVwKhs8z5moEjbWvRRQ5rovE+Rb4Vj/wPYJ1jzwTy43JP0C6Qg8TzEins=
X-Google-Smtp-Source: AGHT+IGZugCF55E3mU1WDQzk+ixOdDGn2ORJUjR1HtaCqaeFlXIxs5cPG2OOwXDTs5Xwl9OR1Wvf2A==
X-Received: by 2002:a17:906:1d51:b0:a59:c220:16a5 with SMTP id o17-20020a1709061d5100b00a59c22016a5mr2666066ejh.9.1714983651254;
        Mon, 06 May 2024 01:20:51 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id wr8-20020a170907700800b00a59be52ff98sm1884910ejb.191.2024.05.06.01.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 01:20:50 -0700 (PDT)
Message-ID: <174a8bfe-7a9e-4816-9bde-de48f04b07f6@linaro.org>
Date: Mon, 6 May 2024 10:20:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 5/5] arm64: dts: mediatek: Add mt7986 based Bananapi R3
 Mini
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20240505164549.65644-1-linux@fw-web.de>
 <20240505164549.65644-6-linux@fw-web.de>
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
In-Reply-To: <20240505164549.65644-6-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_012053_368121_3B71A32B 
X-CRM114-Status: GOOD (  15.97  )
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
Cc: devicetree@vger.kernel.org, Tianling Shen <cnsztl@immortalwrt.org>, netdev@vger.kernel.org, Tianling Shen <cnsztl@gmail.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Eric Woudstra <ericwouds@gmail.com>, linux-clk@vger.kernel.org, linux-leds@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 05/05/2024 18:45, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add device Tree for Bananapi R3 Mini SBC.
> 
> Co-developed-by: Eric Woudstra <ericwouds@gmail.com>
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> Co-developed-by: Tianling Shen <cnsztl@gmail.com>
> Signed-off-by: Tianling Shen <cnsztl@gmail.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  arch/arm64/boot/dts/mediatek/Makefile         |   1 +
>  .../mediatek/mt7986a-bananapi-bpi-r3-mini.dts | 486 ++++++++++++++++++
>  2 files changed, 487 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index 37b4ca3a87c9..1763b001ab06 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -11,6 +11,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7981b-xiaomi-ax3000t.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-acelink-ew-7886cax.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-mini.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtbo
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nand.dtbo
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nor.dtbo
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts
> new file mode 100644
> index 000000000000..c764b4dc4752
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts
> @@ -0,0 +1,486 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2021 MediaTek Inc.
> + * Authors: Frank Wunderlich <frank-w@public-files.de>
> + *          Eric Woudstra <ericwouds@gmail.com>
> + *          Tianling Shen <cnsztl@immortalwrt.org>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/mt65xx.h>
> +
> +#include "mt7986a.dtsi"
> +
> +/ {
> +	model = "Bananapi BPI-R3 Mini";
> +	chassis-type = "embedded";
> +	compatible = "bananapi,bpi-r3mini", "mediatek,mt7986a";
> +
> +	aliases {
> +		serial0 = &uart0;
> +		ethernet0 = &gmac0;
> +		ethernet1 = &gmac1;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	dcin: regulator-12vd {

Please use name for all fixed regulators which matches current format
recommendation: 'regulator-[0-9]+v[0-9]+'

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git/commit/?id=b6d4b3500d57370f5b3abf0701c9166b384db976

> +		compatible = "regulator-fixed";
> +		regulator-name = "12vd";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	fan: pwm-fan {
> +		compatible = "pwm-fan";
> +		#cooling-cells = <2>;
> +		/* cooling level (0, 1, 2) - pwm inverted */
> +		cooling-levels = <255 96 0>;
> +		pwms = <&pwm 0 10000>;
> +		status = "okay";

Why? Where is it disabled?

> +	};
> +
> +	reg_1p8v: regulator-1p8v {

Please use name for all fixed regulators which matches current format
recommendation: 'regulator-[0-9]+v[0-9]+'

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git/commit/?id=b6d4b3500d57370f5b3abf0701c9166b384db976

In other places as well.



Best regards,
Krzysztof


