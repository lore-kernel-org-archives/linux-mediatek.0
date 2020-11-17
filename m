Return-Path: <SRS0=M313=EX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A08C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2020 22:25:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8179D241A6
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2020 22:25:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zJax9Zgq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o0tSjorA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8179D241A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UkLyVMfQtmPwiZC0/Xv8LQnefOIlFsSe9bu1GDW3FkM=; b=zJax9ZgqFFGFiq00aWm/FlVCw
	u5M1v7N64lTWZKGu0+/ciiC1XqfN/q+Z8at/8VFvpwW6V8b3Thx7GNUP2RgHVgjfgv+SAQ411Kwuw
	zp35PFfcsnVAB0/L4kGebm0m975cyAE71Ijk9RPVnkz1EMZAitMy2R/4jsHVlga+u4WirWt0vIqRb
	quHU7xvtW7GM26Vbtz+ubIdYd++3t+hB80oLNqxmSMZAz/m2xLAstIJB6YVrgYdQsLg3uDK2gxf9B
	0SnV+kyvlumZJ+Mxp0ZMyoxLPjIs4T8HAPWR2MWoQ/Dx3rarTZSG0dbiTWp1yg1tHKq/6O5IR3lE8
	kjR8wZ16w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf9PJ-00036G-Lr; Tue, 17 Nov 2020 22:25:01 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf9PF-00035Q-K6; Tue, 17 Nov 2020 22:24:59 +0000
Received: by mail-wr1-x444.google.com with SMTP id r17so25121513wrw.1;
 Tue, 17 Nov 2020 14:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jz4UGtWh3ZHBh8W98Tqf226bIN+2YbRc8x8fZYb0d70=;
 b=o0tSjorAL76DbugKWcC6wceu7jFVMz89WrsrdNOGSZolnwQ3+pWuLrU+JIG8FdNhVA
 ogrZxK3fH5IYFAh7WqX60cBhRJEpfVkP/G1sZdyS5gSnXhi9R7g7d41rLriZETZSzL8R
 toCH8wVQGr+YHFvEJFpfxlsrrfjNkbj9aOaLRsMcItvrIUK68yTjKwf6R01FecLT/Jss
 OT6sroq1tnudp6u8jHZwLW/yrYzjx1PYTEB0hFLN6OWoDRrNP+b81F/GrqUROvr1WRo/
 n01a+C1kKFK6KYgyUax7q9ZFt5x3CZRn+TBLE+M7OqxivVLqZTwtw4BBIRzWQeStfzCF
 Hp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jz4UGtWh3ZHBh8W98Tqf226bIN+2YbRc8x8fZYb0d70=;
 b=uNKX+PVO67rsHC/PMEqOkQUZVFpL6012Arudf5HqByYICgNyNbO/GiuzxRTT5xaZl3
 LxB1OWedpQmKFpvsu/DLNV7T0Rtshsl8OtqlLu8im/l+YsiBYM6OPPgtKQYWkcMMbKpk
 cM2K1fbPPYBfZJAdSt4uIGW66H9jxHWy/7snFxGYNFAQdO3EDZxL8eqg3+0b0Di7xNxr
 Jhf9vshowXSgCZmiLPuiMns9KQloBjvCF9vPTFK0MEcCswX4y6RpyuhSDKhVCnnSc7/K
 8TVbxop2MPlg/sAkwVJ4ZNwoJBv+OTaiXlKW5EI4/eMRqqR7rWrRzGjVEsGj9FPmSPhC
 s3qQ==
X-Gm-Message-State: AOAM533G3yDDfIzFSz43pzDmCyHzCqknYxG+e1bP3CxXkzoOX1tomdEG
 sdoIopVtl51vIqZRnHVUjz6r1UXcqhU=
X-Google-Smtp-Source: ABdhPJwfTZMv22pQCg7Rp7oZi+MBL/EPup9kE1+AoFStntZXWLqcGSvQhvslk1N5LoREmUlCTY/Z6w==
X-Received: by 2002:a5d:514a:: with SMTP id u10mr1646515wrt.312.1605651895550; 
 Tue, 17 Nov 2020 14:24:55 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:3cf0:d5c8:abb1:7fc9?
 ([2a01:110f:b59:fd00:3cf0:d5c8:abb1:7fc9])
 by smtp.gmail.com with ESMTPSA id v67sm233076wma.17.2020.11.17.14.24.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 14:24:54 -0800 (PST)
Subject: Re: [PATCH v6 1/2] dt-bindings: leds: Add bindings for MT6360 LED
To: Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
 robh+dt@kernel.org, matthias.bgg@gmail.com
References: <1605610537-18085-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605610537-18085-2-git-send-email-gene.chen.richtek@gmail.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <ff327630-d919-c26c-30ca-066ad8e826bb@gmail.com>
Date: Tue, 17 Nov 2020 23:24:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <1605610537-18085-2-git-send-email-gene.chen.richtek@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_172457_705368_5DA1F798 
X-CRM114-Status: GOOD (  23.84  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, dmurphy@ti.com, linux-leds@vger.kernel.org,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Gene,

Thank you for the patch.

On 11/17/20 11:55 AM, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add bindings document for LED support on MT6360 PMIC
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>   .../devicetree/bindings/leds/leds-mt6360.yaml      | 114 +++++++++++++++++++++
>   1 file changed, 114 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> new file mode 100644
> index 0000000..871db4d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> @@ -0,0 +1,114 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-mt6360.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LED driver for MT6360 PMIC from MediaTek Integrated.
> +
> +maintainers:
> +  - Gene Chen <gene_chen@richtek.com>
> +
> +description: |
> +  This module is part of the MT6360 MFD device.
> +  see Documentation/devicetree/bindings/mfd/mt6360.yaml
> +  Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mode,
> +  and 4-channel RGB LED support Register/Flash/Breath Mode

What actually is the Register mode?

> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6360-led
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^led@[0-6]$":
> +    type: object
> +    $ref: common.yaml#
> +    description:
> +      Properties for a single LED.
> +
> +    properties:
> +      reg:
> +        description: Index of the LED.
> +        enum:
> +          - 0 # LED output INDICATOR1_RED
> +          - 1 # LED output INDICATOR1_GREEN
> +          - 2 # LED output INDICATOR1_BLUE
> +          - 3 # LED output INDICATOR2_ML
> +          - 4 # LED output FLED1
> +          - 5 # LED output FLED2
> +          - 6 # LED output MULTICOLOR
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> + - |
> +   #include <dt-bindings/leds/common.h>
> +   led-controller {
> +     compatible = "mediatek,mt6360-led";
> +     #address-cells = <1>;
> +     #size-cells = <0>;
> +
> +     led@0 {
> +       reg = <0>;
> +       function = LED_FUNCTION_INDICATOR;
> +       color = <LED_COLOR_ID_RED>;
> +       led-max-microamp = <24000>;
> +     };
> +     led@3 {
> +       reg = <3>;
> +       function = LED_FUNCTION_INDICATOR;
> +       color = <LED_COLOR_ID_AMBER>;

You should really have here LED_COLOR_ID_MOONLIGHT if this is
a moonlight LED. You'll need to add it to dt-bindings/leds/common.h.

> +       led-max-microamp = <150000>;
> +     };
> +     led@4 {
> +       reg = <4>;
> +       function = LED_FUNCTION_FLASH;
> +       color = <LED_COLOR_ID_WHITE>;
> +       function-enumerator = <1>;
> +       led-max-microamp = <200000>;
> +       flash-max-microamp = <500000>;
> +       flash-max-timeout-us = <1024000>;
> +     };
> +     led@5 {
> +       reg = <5>;
> +       function = LED_FUNCTION_FLASH;
> +       color = <LED_COLOR_ID_WHITE>;
> +       function-enumerator = <2>;
> +       led-max-microamp = <200000>;
> +       flash-max-microamp = <500000>;
> +       flash-max-timeout-us = <1024000>;
> +     };
> +     led@6 {
> +       reg = <6>;
> +       function = LED_FUNCTION_INDICATOR;
> +       color = <LED_COLOR_ID_MULTI>;
> +       led-max-microamp = <24000>;
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       led@1 {
> +         reg = <1>;
> +         function = LED_FUNCTION_INDICATOR;
> +         color = <LED_COLOR_ID_GREEN>;
> +       };
> +       led@2 {
> +         reg = <2>;
> +         function = LED_FUNCTION_INDICATOR;
> +         color = <LED_COLOR_ID_BLUE>;
> +       };
> +     };

It is of little avail to have multicolor LED with only two LEDs.
I propose not to allow such setup - i.e. you should have either
one multicolor LED comprising three sub-LEDs (regs: 0, 1, 2),
and with main color property set to LED_COLOR_ID_RGB, or three separate
LEDs.

Effectively, you should have two separate DT examples here to make it
clear: one for the case with three LED class devices and one with
LED multicolor class device.

> +   };
> +...
> 

-- 
Best regards,
Jacek Anaszewski

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
