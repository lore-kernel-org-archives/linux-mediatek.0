Return-Path: <SRS0=gn/N=FC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C139C63697
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Nov 2020 15:14:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 808C5246A5
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Nov 2020 15:14:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n0aaAwJF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUBeUmRM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 808C5246A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NJms+1pEgyOYyoWTqTFc58UKQuPEoDukuyrBQj1fATk=; b=n0aaAwJFBLXjSgSeiCmG96GJy
	1od2xLRP1Hv65hk06NK/NHlXhB2JRsP/Mmk1JUCYfVxbqm0S+YTLHIjxBrxFYaZE+khk+msQexl8b
	N9av6YE6lEZMztgRwgnpFP++vRE+WEao+cH1xdW0Hdz6v082IuiQzK4zu7TMqccnhUdmNm4EK6ENY
	pT51N9htCVbePfX5bxAOhMvmcSjSTPK6gEQ7Sn39kWRae/nDMMGCgpMFiJ8JJD1IqP+9RzN+hOi71
	b21Mj0X0EoMT8aaKtABwQ8vm4HU/tXIUhs4qcpmcmcjI1+2ruVk85arkGZYpkU/Joh3gx5QeadZLJ
	tWo6aEibw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj1vM-0004pt-Bc; Sat, 28 Nov 2020 15:14:08 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj1vJ-0004pP-SN; Sat, 28 Nov 2020 15:14:06 +0000
Received: by mail-wr1-x444.google.com with SMTP id t4so8682351wrr.12;
 Sat, 28 Nov 2020 07:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vcBAq8l9akkx7hiqsbsodZQlENoGjUTUGwJDEMJ5H5w=;
 b=PUBeUmRMGX/Xbl+Ywb0x3hXxKJjlBdYKeJSfABQvEpkKvEZ/YkHwe6+ZSix190Qvne
 Kk7uETaXo12l9CzUui/7kE2hzBbInTumJmXn4zyYCCo6ZjdpoBEH1MkXdNiJjdUqsM/+
 tAu3jNzwnhbSKEIF+orqI8eBWQZX4RQhJAHfLZb1sJNqspByZ73zHgT7DRgYfrfKmRV2
 Gz0uZh0cltQoA6ESbEyixJ/rN/MHgag1QXFJ6xmy3GA2QpJVYyU07odWFaURpJeUv2aG
 WyDR7QPENB9cof90pqwiNa59DOKrhb1+4KnGLUye+hoyBFXNJHVwSPgTgNrHXoIarvdC
 5Fgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vcBAq8l9akkx7hiqsbsodZQlENoGjUTUGwJDEMJ5H5w=;
 b=AUl554cfs44E9l5UYyTIRUyHAEwYj7Lw/9/0vzds0E6YLkdsJvmvNcMR69e2RlnhJP
 Ko2cuftJRCpljJWjuSBNWKcgsAdGymegrFiIC4hOGcnCr/ll/UxyHyIaHkyymPQZ63bH
 BFhYQEl3VH9jQdOL+shYvFqirxcglN2FzpcRG0XNbbiEQe2byvOeTtHI9P2KNbe4cO/R
 rAovJNbSNlyX9O7k3A+qM+RFdwBfKZ37B+wguiydjwQdv2N9PnQ7zqZ+baeWF01d1BZj
 PFiNUKOG+92k+uUbM0TkfSExWaIdUN0cRIU2oIrAGp+MsSuYnBxR7H7xNZLfjm2+6MNK
 WDqQ==
X-Gm-Message-State: AOAM531AMQCtgq6ZyTmhJekVLHRUTQIg/PI0if1cb61zDoNB9i2s94Co
 ecUy43bvz6+cC2Uhm17Hmd0=
X-Google-Smtp-Source: ABdhPJw3WQq7/V2A0KHFajRCBx38ILUo9wCCsNh/EzXkokKCcgsZlrlARAHdzYhdLSpUMzF1aQnqgg==
X-Received: by 2002:adf:f3d1:: with SMTP id g17mr18139379wrp.201.1606576442892; 
 Sat, 28 Nov 2020 07:14:02 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:7c3e:7544:88c3:e387?
 ([2a01:110f:b59:fd00:7c3e:7544:88c3:e387])
 by smtp.gmail.com with ESMTPSA id d17sm20079784wro.62.2020.11.28.07.14.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Nov 2020 07:14:02 -0800 (PST)
Subject: Re: [PATCH v10 5/6] dt-bindings: leds: Add bindings for MT6360 LED
To: Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
 robh+dt@kernel.org, matthias.bgg@gmail.com
References: <1606447736-7944-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606447736-7944-6-git-send-email-gene.chen.richtek@gmail.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <8a2f252a-7cbd-401f-75a3-f42bba93fdd7@gmail.com>
Date: Sat, 28 Nov 2020 16:13:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1606447736-7944-6-git-send-email-gene.chen.richtek@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201128_101405_980013_36159D25 
X-CRM114-Status: GOOD (  24.14  )
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

On 11/27/20 4:28 AM, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add bindings document for LED support on MT6360 PMIC
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>   .../devicetree/bindings/leds/leds-mt6360.yaml      | 164 +++++++++++++++++++++
>   1 file changed, 164 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> new file mode 100644
> index 0000000..b2ffbc6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> @@ -0,0 +1,164 @@
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
> +          - 3 # LED output INDICATOR2_
These LED output descriptions look odd.
In the driver you have:

enum {
     MT6360_LED_ISNK1 = 0,
     MT6360_LED_ISNK2,
     MT6360_LED_ISNK3,
     MT6360_LED_ISNKML
     ...

I think the same names should be used for DT reg property documentation:

- 0 # LED output ISNK1
- 1 # LED output ISNK2
- 2 # LED output ISNK3
- 3 # LED output ISNKML

Here you're describing hardware, i.e. current sinks as they are
defined in the device documentation, and not the functions you're
assigning in DT to the connected LEDs.

> +          - 4 # LED output FLED1
> +          - 5 # LED output FLED2
> +          - 6 # LED output MULTICOLOR


This last enum is also disputable, since it is driver specific, and not
hardware specific. Actually you should rather check LED color id and
basing on that treat the LED as multicolor (for LED_COLOR_ID_RGB).
See drivers/leds/leds-lp55xx-common.c for a reference.

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
> +     led@3 {
> +       reg = <3>;
> +       function 

= LED_FUNCTION_MOONLIGHT;
> +       color = <LED_COLOR_ID_WHITE>;
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
> +       color = <LED_COLOR_ID_RGB>;
> +       led-max-microamp = <24000>;
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       led@0 {
> +         reg = <0>;
> +         function = LED_FUNCTION_INDICATOR;

The function is unused in case of the multicolor subleds.
Please drop it from here.

> +         color = <LED_COLOR_ID_RED>;
> +       };
> +       led@1 {
> +         reg = <1>;
> +         function = LED_FUNCTION_INDICATOR;

Ditto.

> +         color = <LED_COLOR_ID_GREEN>;
> +       };
> +       led@2 {
> +         reg = <2>;
> +         function = LED_FUNCTION_INDICATOR;

Ditto.

> +         color = <LED_COLOR_ID_BLUE>;
> +       };
> +     };
> +   };
> +
> + - |
> +
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
> +     led@1 {
> +       reg = <1>;
> +       function = LED_FUNCTION_INDICATOR;
> +       color = <LED_COLOR_ID_GREEN>;
> +       led-max-microamp = <24000>;
> +     };
> +     led@2 {
> +       reg = <2>;
> +       function = LED_FUNCTION_INDICATOR;
> +       color = <LED_COLOR_ID_BLUE>;
> +       led-max-microamp = <24000>;
> +     };
> +     led@3 {
> +       reg = <3>;
> +       function = LED_FUNCTION_MOONLIGHT;
> +       color = <LED_COLOR_ID_WHITE>;
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
