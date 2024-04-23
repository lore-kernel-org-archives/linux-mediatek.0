Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEEFC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 04:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUs2RUZvYrbt0djestVEkcsXv+XeS/wmMn/FMr80SwM=; b=cHtej46n2JyaLMm7xoLxDtzhtt
	lSLgdFktADGStDHL0ClBdhwjsPEdCdzSm0qj3qE7ElE5W9X8ZQcERT9Q/DtnoIenJI/atJm96KFyO
	wetsHzu5T7hsp+zuqARbpet8g9t6M4XigvH/fiLzoAwfBt0EDz3ihMvu4ZFpDJELTeYvU/Eex+UYC
	T+2CRvi+3HFXbfLeKooJ/apQPjF12sfVdrzff4Ynb84450f3QVaHxtYR80Fkn2l9Oy8FdtmvRPxfp
	Wls9E8Y/M2OSn8Y4ckMm/sVoFFsNzBtAlhpBt6cBZlzXj4kV2EVCmhMBaKaz8UUjEjyKaXrhBbpV2
	b1jOl4dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz7g4-0000000FwC9-1JgU;
	Tue, 23 Apr 2024 04:22:44 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz7g0-0000000FwBP-2qvs;
	Tue, 23 Apr 2024 04:22:42 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-571e3f40e31so2498344a12.2;
        Mon, 22 Apr 2024 21:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713846158; x=1714450958; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mUs2RUZvYrbt0djestVEkcsXv+XeS/wmMn/FMr80SwM=;
        b=SKv8NCi1U0E87NqW/Qv/DCQSLS/NJMX9Q8grBBEdAa/EJwSwwcdajoQqC1NYYsqYvY
         eimSLY+Pdts08KcDbo2g2DssBZZE00rgZUTw/g27KtQrVNSaqlcF4QpI/D3I/nyZejgM
         NQDcihFnZJZcMYGCOsQmtUs6GGmTgUkAwJ8Rvq81tB70FPwn7SAcRe5hkB9ia8quU/FO
         pM3+tmFDHGFLTKdwd0Sf25l40o6joU+UHGF16QS1I4t617TO0JlfPsrJZLvmHcZiDmCj
         Pmli+yaJ4UlBkyWUeCe6ocMDZwwstHrPIhtr9UgEg0YHdFI9edAxQ+0Ye1/xvhJU6k8u
         rtRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713846158; x=1714450958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mUs2RUZvYrbt0djestVEkcsXv+XeS/wmMn/FMr80SwM=;
        b=IlLpZVh8WHlBoWVrpZRKUWQSWs8sAJw7zgjJIxJc1bH2xuVkp3sdWi8YqshUvpzsIg
         qPvMT29SmbU2oQitmBNACVJMtOK//OXuGzOiHAged5FAUmAHOW4Y0/uIq7hKOiZh/Hx7
         sJsn4D562XsZpUHjmXYRPmsDF1NC8P0FbBYpCakVp+NY/YdI9G0Vv4b0paraIxgfueFC
         Mm546+4RfsFiMxQxWvgs5DrjF/bXPzTfn9JCEQJ73OoWRYzB1sObOICm4yfcYMaHEcdK
         nym+6G4y6sM7AeF14A2/NHLefgIWw2xoE1JRPGUeag0ZV+iW24NELxbaAl1s7HYBSjbw
         YZJA==
X-Forwarded-Encrypted: i=1; AJvYcCURQ2v4EZULrFCmngcCpGuOH7KpxZ4w5ZQAu27Yh50VqH+pHXqWOkLGdB7sKSqDRNtjLJdZc8v8mD9OaWsQ0P1nAXF5bcWFZ0UCa8mUpkiPa0U3CMeIIeR4hF66IY6zshGHdeWO8gP/asDf544QBumYUtVWunHqaSQ=
X-Gm-Message-State: AOJu0YwghFsorKXe3lMJjO/5udbqPONsygKP+ag9hBK0CC+9aMJuE3Q9
	AIuwCqlb0wm5s/V1QnuBvUv3MAC/B3sP+miAVdJ/unFcWQFcvwIR
X-Google-Smtp-Source: AGHT+IHNB26jxIYXuLgkHDTr7cigbRb6NRaEhxNW9klXv6JV7oErenfbZDVtvg93kbkJoHjeXqljJQ==
X-Received: by 2002:a17:906:3502:b0:a52:277d:c1c9 with SMTP id r2-20020a170906350200b00a52277dc1c9mr8047023eja.50.1713846157921;
        Mon, 22 Apr 2024 21:22:37 -0700 (PDT)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id 17-20020a170906311100b00a5599f3a057sm3847028ejx.107.2024.04.22.21.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 21:22:37 -0700 (PDT)
Message-ID: <c6a8fdc1-0230-4438-8b80-c07daf80f1ce@gmail.com>
Date: Tue, 23 Apr 2024 06:22:35 +0200
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
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20240209085616.1062-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_212240_948618_C9B4CC22 
X-CRM114-Status: GOOD (  21.85  )
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

On 9.02.2024 09:56, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files. Introduced changes:
> 1. Reworded title
> 2. Made "bus" clock required on MT7623 as well
> 3. Added required #include-s and adjusted "reg" & clocks in example
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

could you take my patch throught your tree?


> ---
> V2: Extended "IR" in title
>      Made "bus" required at MT7623 needs it as well
>      Updated example
> 
> Thanks AngeloGioacchino!
> 
>   .../bindings/media/mediatek,mt7622-cir.yaml   | 55 +++++++++++++++++++
>   .../devicetree/bindings/media/mtk-cir.txt     | 28 ----------
>   2 files changed, 55 insertions(+), 28 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt7622-cir.yaml
>   delete mode 100644 Documentation/devicetree/bindings/media/mtk-cir.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt7622-cir.yaml b/Documentation/devicetree/bindings/media/mediatek,mt7622-cir.yaml
> new file mode 100644
> index 000000000000..c01210e053f9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt7622-cir.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Consumer Infrared Receiver on-SoC Controller
> +
> +maintainers:
> +  - Sean Wang <sean.wang@mediatek.com>
> +
> +allOf:
> +  - $ref: rc.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt7622-cir
> +      - mediatek,mt7623-cir
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: clk
> +      - const: bus
> +
> +required:
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt2701-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    ir@10013000 {
> +        compatible = "mediatek,mt7623-cir";
> +        reg = <0x10013000 0x1000>;
> +        interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_LOW>;
> +        clocks = <&infracfg CLK_INFRA_IRRX>, <&topckgen CLK_TOP_AXI_SEL>;
> +        clock-names = "clk", "bus";
> +        linux,rc-map-name = "rc-rc6-mce";
> +    };
> diff --git a/Documentation/devicetree/bindings/media/mtk-cir.txt b/Documentation/devicetree/bindings/media/mtk-cir.txt
> deleted file mode 100644
> index 5e18087ce11f..000000000000
> --- a/Documentation/devicetree/bindings/media/mtk-cir.txt
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Device-Tree bindings for Mediatek consumer IR controller
> -found in Mediatek SoC family
> -
> -Required properties:
> -- compatible	    : Should be
> -			"mediatek,mt7623-cir": for MT7623 SoC
> -			"mediatek,mt7622-cir": for MT7622 SoC
> -- clocks	    : list of clock specifiers, corresponding to
> -		      entries in clock-names property;
> -- clock-names	    : should contain
> -			- "clk" entries: for MT7623 SoC
> -			- "clk", "bus" entries: for MT7622 SoC
> -- interrupts	    : should contain IR IRQ number;
> -- reg		    : should contain IO map address for IR.
> -
> -Optional properties:
> -- linux,rc-map-name : see rc.txt file in the same directory.
> -
> -Example:
> -
> -cir: cir@10013000 {
> -	compatible = "mediatek,mt7623-cir";
> -	reg = <0 0x10013000 0 0x1000>;
> -	interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_LOW>;
> -	clocks = <&infracfg CLK_INFRA_IRRX>;
> -	clock-names = "clk";
> -	linux,rc-map-name = "rc-rc6-mce";
> -};


