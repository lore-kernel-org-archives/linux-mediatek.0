Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36D0C27C4F
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jun 2024 08:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0iEFgdOgvP8ilqiWdq7v8OaqOOUugnJDJ9/FR98Crw=; b=a7uRGB9ALLZqU8bNAAVmMLEa8l
	xo/jmUZ3kqa0f292e7fpz3kdMvvocZNSuK+l6nrqPCwQocwG1/mdJw1S5eOpJHoF2DXCsozv+BHWv
	414FjiiaDkLJC9n3v0fMf1dPVnKRx28BhmqdW2aFZpOvIducyYQEwr2Mt0kAkdwI/bW5ItV3nhe53
	9eA3ZzvQ6tHswwB6KvgQoKFAjWnexPi1DEN2j7b62HpljGKeRBLhZjtYMCHzctyJ+wODbSi+sCFJ3
	JCbtHDjlEtsP1ID74z5r8wsoopaB9rhhMTk5plm1A8N/zNGYyYGzIfSBoOIeP32JH3nhzsdULOfrq
	B7mdYZGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE2mg-0000000Fzs4-2OHr;
	Mon, 03 Jun 2024 08:11:14 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE2mc-0000000Fzp0-00Vx;
	Mon, 03 Jun 2024 08:11:11 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-57a31d63b6bso3356579a12.0;
        Mon, 03 Jun 2024 01:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717402265; x=1718007065; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u0iEFgdOgvP8ilqiWdq7v8OaqOOUugnJDJ9/FR98Crw=;
        b=UBonS8Rf7h1JPKBYTCcv90ruKET7BsNycdB9j2+UQN58WheNF88ZuFtiAZvKV6G6cf
         8jGHKvIvMsfLXlVQbDz68rwq2reiJkNGfRNWSbyPQGHBC4kolKJr0noUiMuax9qMPLjB
         RFwrH+zeEizTreBOFnlxx0DH9zm9vT+ZqrhPbTcujhzGj7Umw73g4ZQacP6lKnSMnIfO
         qAuksl/WNLn6NatnfzGAn+2wN12N92Wic0uRcRQCvknKmHMa9mUKtUsrPtB2xNNfIgGC
         83RO88+l1Ci06Fnq0BPj+dEQQjBIXOpq55xOT6IGXE8gpx5rLs8p8cq86ne/ykR9pVyz
         uOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717402265; x=1718007065;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u0iEFgdOgvP8ilqiWdq7v8OaqOOUugnJDJ9/FR98Crw=;
        b=QTqZuwMiDtxlwyqEB43uR6ob7IgXm5DjoMTe6WcVHSfCwuMbkqZ5Ct2IUiw0CXCfnA
         xlwOLu9ReOeDXrrcae2LaVewzQJ/dSpLVSx44CYoQqNt4oFkbead5bsX8IFFtx28bY80
         sgSyQ3WWBiJv1251r527bz/dvyREAuwblUrlUL33DIS3gZe1GKGb5f/kb/howk+ozKY5
         F6DuwQmwz2t5/ym8Of/vOHuLu8G5ChNeUhI+wY/e+L5hn7rXeLfewd93GlLsCS7SsJTV
         5Z7ppDq0wnOZC+ieoAiUR0Dw7141i9DMWrSo7fXGazjyUN1BIGuoCVypfYA8zP3n1FpA
         HDLA==
X-Forwarded-Encrypted: i=1; AJvYcCWinrWxVX0oh/qchegcivcBcmlH7B/Z9BGqaIqysgFdb2WUGntkPHvh8l0XYboiyWlyRiwj79chv9/AGgKxcGbBadpiUpbJzFuhJZU3XlWXTYt3mkYdcL9bG0Za2M+0wXw3dWlDVkLTH7K4WDf4sOmjT1Yz607CKnE=
X-Gm-Message-State: AOJu0YyXh8RlFNXP5Ey4xqn5edGHDzD2UNOSm33RltFdGDK/m8X0lDqE
	B4/Ox9JvVKMSFtPUPHj8w3G8fPopKyjcp+A8QZp+RsRpdHBBd0xIqx2G6g==
X-Google-Smtp-Source: AGHT+IH6pWS9A6Vbq2Fi3kiLwfN9CRE8W4TLtLaMd2BEzlaTgHeBZGoT0/sgdITW73FJ4YD6wggPRg==
X-Received: by 2002:a50:9992:0:b0:57a:215a:5cb9 with SMTP id 4fb4d7f45d1cf-57a3638f923mr5604168a12.19.1717402265020;
        Mon, 03 Jun 2024 01:11:05 -0700 (PDT)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-57a31c9c0b8sm4974672a12.86.2024.06.03.01.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 01:11:04 -0700 (PDT)
Message-ID: <16e8b71d-ae71-42e9-afb3-bd8d02a3dd06@gmail.com>
Date: Mon, 3 Jun 2024 10:11:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] dt-bindings: media: convert Mediatek consumer IR to
 the json-schema
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240209085616.1062-1-zajec5@gmail.com>
 <c6a8fdc1-0230-4438-8b80-c07daf80f1ce@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <c6a8fdc1-0230-4438-8b80-c07daf80f1ce@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_011110_058661_24645D13 
X-CRM114-Status: GOOD (  17.86  )
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

Hi Mauro,

On 23.04.2024 06:22, Rafał Miłecki wrote:
> On 9.02.2024 09:56, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> This helps validating DTS files. Introduced changes:
>> 1. Reworded title
>> 2. Made "bus" clock required on MT7623 as well
>> 3. Added required #include-s and adjusted "reg" & clocks in example
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> 
> could you take my patch throught your tree?

did you have a chance to look at this? Can you take it to your tree?


>> ---
>> V2: Extended "IR" in title
>>      Made "bus" required at MT7623 needs it as well
>>      Updated example
>>
>> Thanks AngeloGioacchino!
>>
>>   .../bindings/media/mediatek,mt7622-cir.yaml   | 55 +++++++++++++++++++
>>   .../devicetree/bindings/media/mtk-cir.txt     | 28 ----------
>>   2 files changed, 55 insertions(+), 28 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt7622-cir.yaml
>>   delete mode 100644 Documentation/devicetree/bindings/media/mtk-cir.txt
>>
>> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt7622-cir.yaml b/Documentation/devicetree/bindings/media/mediatek,mt7622-cir.yaml
>> new file mode 100644
>> index 000000000000..c01210e053f9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/mediatek,mt7622-cir.yaml
>> @@ -0,0 +1,55 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek Consumer Infrared Receiver on-SoC Controller
>> +
>> +maintainers:
>> +  - Sean Wang <sean.wang@mediatek.com>
>> +
>> +allOf:
>> +  - $ref: rc.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - mediatek,mt7622-cir
>> +      - mediatek,mt7623-cir
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    items:
>> +      - const: clk
>> +      - const: bus
>> +
>> +required:
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/mt2701-clk.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    ir@10013000 {
>> +        compatible = "mediatek,mt7623-cir";
>> +        reg = <0x10013000 0x1000>;
>> +        interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_LOW>;
>> +        clocks = <&infracfg CLK_INFRA_IRRX>, <&topckgen CLK_TOP_AXI_SEL>;
>> +        clock-names = "clk", "bus";
>> +        linux,rc-map-name = "rc-rc6-mce";
>> +    };
>> diff --git a/Documentation/devicetree/bindings/media/mtk-cir.txt b/Documentation/devicetree/bindings/media/mtk-cir.txt
>> deleted file mode 100644
>> index 5e18087ce11f..000000000000
>> --- a/Documentation/devicetree/bindings/media/mtk-cir.txt
>> +++ /dev/null
>> @@ -1,28 +0,0 @@
>> -Device-Tree bindings for Mediatek consumer IR controller
>> -found in Mediatek SoC family
>> -
>> -Required properties:
>> -- compatible        : Should be
>> -            "mediatek,mt7623-cir": for MT7623 SoC
>> -            "mediatek,mt7622-cir": for MT7622 SoC
>> -- clocks        : list of clock specifiers, corresponding to
>> -              entries in clock-names property;
>> -- clock-names        : should contain
>> -            - "clk" entries: for MT7623 SoC
>> -            - "clk", "bus" entries: for MT7622 SoC
>> -- interrupts        : should contain IR IRQ number;
>> -- reg            : should contain IO map address for IR.
>> -
>> -Optional properties:
>> -- linux,rc-map-name : see rc.txt file in the same directory.
>> -
>> -Example:
>> -
>> -cir: cir@10013000 {
>> -    compatible = "mediatek,mt7623-cir";
>> -    reg = <0 0x10013000 0 0x1000>;
>> -    interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_LOW>;
>> -    clocks = <&infracfg CLK_INFRA_IRRX>;
>> -    clock-names = "clk";
>> -    linux,rc-map-name = "rc-rc6-mce";
>> -};
> 


