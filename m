Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD1EC61D92
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Nov 2023 08:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ghrTaSbGxLK9kxVU7nsSkXTB5ZRHrTPXh4hZLw4lW1o=; b=MOeN2XXzBAM4bk4syaolXRRTXv
	Rr/5yTX0C50d2UhI9oF5WC/7/XFH5qv7xX1XayCCV5YXYfm2Fr+y4sOEGBxg9SoLBY63G1phq2pFo
	/08Jvt/iOu826b2kD+NMMOP0wKCIyhUn9WP+oLzW5wTg86DQMpJcgcA0UbL+50OIz9P8XbB2Y2J9N
	O5m/lmUD+8P7wAgr2q9VPQhmizB+6pZen/5woh4hyC+2RMH4AaqPzr3fqF6LQ8O/4luEruTSUn0P3
	IlyT+Qd/NZVo7EAxB7Cw9qqtWj0wn2z0ROYlRNthDNs0vfefrYbrqfY2Qu16CF2Xm7FJgaoAnNqKh
	c07byVjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5iEX-00105I-1F;
	Wed, 22 Nov 2023 08:05:17 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5iER-00101D-1e
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Nov 2023 08:05:13 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50aab3bf71fso4741972e87.3
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Nov 2023 00:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700640307; x=1701245107; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ghrTaSbGxLK9kxVU7nsSkXTB5ZRHrTPXh4hZLw4lW1o=;
        b=rL+am1SzX4Y9TrIFi2PWS2yKXF+haxwlTuQC8Hr5knNjKcd1LW/BDitUzRW9HJs5vX
         C75KPiEExh6tcsQE0k9KrCsfkKvAy2NBPL4ZnDapRPoZHZKW+xymxTRK97+w2r7Ff+uS
         JwgQHcT01tYlF5scAsuQmb+ASH2r/ppZOyVUuDw5IS5JwjvmuG35x83VWv2ATnEPH4It
         ZWiJr3Y+6NC4eSUJJk2tlMeM8/YTY3XKHC4s34k8JrveWyTM8wpFAHxKuqNPmnN2c8Ya
         Btraq76aJ/LXL4svauutAuSiC4bFpKQCv66KnU89D8xRYoM2f4A+ImM4XOOxx0QkiezL
         qdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700640307; x=1701245107;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ghrTaSbGxLK9kxVU7nsSkXTB5ZRHrTPXh4hZLw4lW1o=;
        b=fAAl18Pepw3fGzQ/z7dnwt593gK7QRC+ssgFuE/By31E2z+52LLt25Jxd820udNZoj
         NzNB4e1syEUozrCtDqcNQMlGyS71HW5aRidluP7kdwVPhWXO3wAd5QAWjOw3i/Yv6LUM
         6EXwaAMemYCbcLAQp59Y8cNpL4uR2WgfqPypjPPLKJ6VkldNRCrdfD2iUQlxzWBs1gc0
         0zkIUXgZ6EgFCdK+5RCLCnXxCLCEFyQr90tNMQ/nR9sUYhM13ae9w6V5opuXJi8SiZaI
         1NTWPOGhAcDBJnMh1YQczUMCYvAjmrNNSziwBD374FFvJ/gQXboa4eJ6bd4m9W+vA0Ci
         qTBQ==
X-Gm-Message-State: AOJu0YwWV4jqQlJuGDejGzrAxoCrHUP2YrSUxrfxCs0zrq5MySvcIPGU
	VTAShucbbaYXJV4G6jq2VvdGkA==
X-Google-Smtp-Source: AGHT+IGSn7B1tdeAC18VFvtXuRhUozBEdZxjJDLizh5cvTQhRHlk6HnCDVb3HF69G+qZZGaY0pwJPA==
X-Received: by 2002:a05:6512:1086:b0:507:bc6b:38a6 with SMTP id j6-20020a056512108600b00507bc6b38a6mr1300437lfg.33.1700640307182;
        Wed, 22 Nov 2023 00:05:07 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.100])
        by smtp.gmail.com with ESMTPSA id z16-20020adfe550000000b0032db4e660d9sm16411735wrm.56.2023.11.22.00.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 00:05:06 -0800 (PST)
Message-ID: <01f9ce3b-e6e5-4b05-bf7f-0b3a5f74910a@linaro.org>
Date: Wed, 22 Nov 2023 09:05:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: dt-bindings: add DTS Coding Style document
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Andrew Davis <afd@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michal Simek <michal.simek@amd.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Nishanth Menon <nm@ti.com>,
 Olof Johansson <olof@lixom.net>, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <20231120084044.23838-1-krzysztof.kozlowski@linaro.org>
 <6b288a2e-d147-4bd3-b1d4-daf56295d939@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <6b288a2e-d147-4bd3-b1d4-daf56295d939@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_000511_584177_40932111 
X-CRM114-Status: GOOD (  19.27  )
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

On 21/11/2023 14:50, Rafał Miłecki wrote:
>> +Order of Nodes
>> +--------------
>> +
>> +1. Nodes within any bus, thus using unit addresses for children, shall be
>> +   ordered incrementally by unit address.
>> +   Alternatively for some sub-architectures, nodes of the same type can be
>> +   grouped together (e.g. all I2C controllers one after another even if this
>> +   breaks unit address ordering).
>> +
>> +2. Nodes without unit addresses should be ordered alpha-numerically by the node
>> +   name.  For a few types of nodes, they can be ordered by the main property
>> +   (e.g. pin configuration states ordered by value of "pins" property).
>> +
>> +3. When extending nodes in the board DTS via &label, the entries should be
>> +   ordered alpha-numerically.
> 
> Just an idea. Would that make (more) sense to make &label-like entries
> match order of nodes in included .dts(i)?
> 
> Adventages:
> 1. We keep unit address incremental order that is unlikely to change
> 
> Disadventages:
> 1. More difficult to verify

Rob also proposed this and I believe above disadvantage here is crucial.
If you add new SoC with board DTS you are fine. But if you add only new
board, the order of entries look random in the diff hunk. Reviewer must
open SoC DTSI to be able to review the patch with board DTS.

If review is tricky and we do not have tool to perform it automatically,
I am sure submissions will have disordered board DTS.

> 
> 
>> +Example::
>> +
>> +	// SoC DTSI
>> +
>> +	/ {
>> +		cpus {
>> +			// ...
>> +		};
>> +
>> +		psci {
>> +			// ...
>> +		};
>> +
>> +		soc@ {
>> +			dma: dma-controller@10000 {
>> +				// ...
>> +			};
>> +
>> +			clk: clock-controller@80000 {
>> +				// ...
>> +			};
>> +		};
>> +	};
>> +
>> +	// Board DTS
>> +
>> +	&clk {
>> +		// ...
>> +	};
>> +
>> +	&dma {
>> +		// ...
>> +	};
>> +
>> +
>> +Order of Properties in Device Node
>> +----------------------------------
>> +
>> +Following order of properties in device nodes is preferred:
>> +
>> +1. compatible
>> +2. reg
>> +3. ranges
>> +4. Standard/common properties (defined by common bindings, e.g. without
>> +   vendor-prefixes)
>> +5. Vendor-specific properties
>> +6. status (if applicable)
>> +7. Child nodes, where each node is preceded with a blank line
>> +
>> +The "status" property is by default "okay", thus it can be omitted.
> 
> I think it would really help to include position of #address-cells and
> #size-cells here. In some files I saw them above "compatible" that seems
> unintuitive. Some prefer putting them at end which I think makes sense
> as they affect children nodes.
> 
> Whatever you choose it'd be just nice to have things consistent.

This is a standard/common property, thus it goes to (4) above.


Best regards,
Krzysztof


