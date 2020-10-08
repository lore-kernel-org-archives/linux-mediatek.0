Return-Path: <SRS0=jGCy=DP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63DA9C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 21:43:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D25BB22241
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 21:43:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="teM5QN9t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTuKFemm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D25BB22241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DLeLuML6ND8Mb+zzDp7c804UHrAoN1njafO27U0g2EQ=; b=teM5QN9ttbz2+mdUA6Ol5+ubT
	wZyqES9SMAWqyzseqDBlbZdHRdEC/cefkXZ5v47UaukgeVKiQj6bWN3sHOKDoi9+YRyMxQ3joy4v1
	zP5sYflXwBRxS7pOXleyhE+lV9lAN3si/j+rN0eoqwHAbrD3gGjrQp85LkLbZaTTflUNOXP/4iWEC
	VLc2Tg8CSDGfN3/yfy7+B3VPqbxsmFIvKGTX5eY2JMPwMhprWvv+a7EiMXs/Y4yDY1kFp5KbuA8nN
	+XLPwRSVTLIAQHySmndw4JZoLnbVf/EbTp/knUpBts1ZSVENq6TAP5eBLzJ9xwkN3xXp86O+yYjC7
	ylWSt/5ng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQdgf-0006rV-8q; Thu, 08 Oct 2020 21:42:57 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQdgd-0006qj-8R; Thu, 08 Oct 2020 21:42:56 +0000
Received: by mail-ej1-x641.google.com with SMTP id t25so10140389ejd.13;
 Thu, 08 Oct 2020 14:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hFDoG3fQdlhIOZ8IJAwTd18Qq8zG8h1BvVCyh4lmt3Y=;
 b=HTuKFemmRx2Ymd9m5//8leO6bwra40/yjCvfZ79hk5KjxmPRLcwJRL/ANFoOQz5AYK
 2Hm5+2CrTJC93AwEvpnHrMdTvdU3qdTM+9eiIrwhZL+P5mjTZJxPFtDY9YpBwwIYUc5x
 DlS545kIJiwNZSUyg71QejrfTFSCWc5K0ABMZ4uOsUHnU+HLSwKmUBdm+ZmE/s2Lssrx
 IwI0IcZWzuenqjXTvEOD7gtw4GbGSioHsCem5lvbc0SZ99LYmhveWe/J/CuOHRn5iVXp
 e+iLDkb9v9S1GtdZs2ciCRygh3NO1Jtwv8TqqjjNwdMMtdIu/DnagIpbnlS7jKhaETm3
 1wdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hFDoG3fQdlhIOZ8IJAwTd18Qq8zG8h1BvVCyh4lmt3Y=;
 b=Q5oHvIUWxYbKvxjSvGXRn15EcAZlu3irH1MpHCiP/wNT07FSTkQAfHU2UVtkMLEhOv
 QzyNCYBvyjdhbdvwTAbfDDdwy10TamtqBfZmk0odGYE09X8QIWKKckgPQqMoJXCb+EUZ
 5RkO81MKDCFRFevGEc7e6y9CNIU3T9jEuQAGtWykm5ZWKk3RXnjFqKJzf86UgZJHWXCX
 PqqIdruGal0NmUakHWXv4fT27e2Lqe6j0DQQXdS+SXn3q/gRSsNyb6BAzUpE4eY7iFOh
 4FaTPELYvI2fB+nkAohSNc0ftzELQKI9JQAM2AKoskjCkURFpG+zFWHjeuc8KHuX4SbC
 6OGw==
X-Gm-Message-State: AOAM53081mDI7SWrEfYDYfPS5kQNcxqBG9ziN4oyxHGe7uZsfnUgzL6F
 iaUF1MBn3DmekN/Da673FHY=
X-Google-Smtp-Source: ABdhPJy9kQW67aVqErjy36BpoDQBTRVwkGVvV6XJITIyjaQrxfGboo8FwLf2Cc9zn2r3s/Utn25xEw==
X-Received: by 2002:a17:906:70d4:: with SMTP id
 g20mr11466584ejk.413.1602193371995; 
 Thu, 08 Oct 2020 14:42:51 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:a188:5df3:7e17:9e85?
 ([2a01:110f:b59:fd00:a188:5df3:7e17:9e85])
 by smtp.gmail.com with ESMTPSA id p25sm4935384edm.60.2020.10.08.14.42.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2020 14:42:51 -0700 (PDT)
Subject: Re: [PATCH v5 1/2] dt-bindings: leds: Add bindings for MT6360 LED
To: Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
 robh+dt@kernel.org, matthias.bgg@gmail.com
References: <1602034966-3524-1-git-send-email-gene.chen.richtek@gmail.com>
 <1602034966-3524-2-git-send-email-gene.chen.richtek@gmail.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <2dcc2958-8942-642a-8ace-71d397857463@gmail.com>
Date: Thu, 8 Oct 2020 23:42:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1602034966-3524-2-git-send-email-gene.chen.richtek@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_174255_309431_41D4EA80 
X-CRM114-Status: GOOD (  22.15  )
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

Thanks for the update.

On 10/7/20 3:42 AM, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add bindings document for LED support on MT6360 PMIC
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>   .../devicetree/bindings/leds/leds-mt6360.yaml      | 95 ++++++++++++++++++++++
>   1 file changed, 95 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> new file mode 100644
> index 0000000..2fa636f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> @@ -0,0 +1,95 @@
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
> +  "^led@[0-3]$":
> +    type: object
> +    $ref: common.yaml#
> +    description:
> +      Properties for a single LED.
> +
> +    properties:
> +      reg:
> +        description: Index of the LED.
> +        enum:
> +          - 0 # LED output INDICATOR1_RGB
> +          - 1 # LED output INDICATOR2
> +          - 2 # LED output FLED1
> +          - 3 # LED output FLED2
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
> +       color = <LED_COLOR_ID_RGB>;
> +       led-max-microamp = <24000>;
> +     };

This should be multi-led node. See [0] for a reference.

> +     led@1 {
> +       reg = <1>;
> +       function = LED_FUNCTION_INDICATOR;

Maybe add LED_FUNCTION_MOONLIGHT ?

> +       color = <LED_COLOR_ID_AMBER>;
> +       default-state = "off";
> +       led-max-microamp = <150000>;
> +     };
> +     led@2 {
> +       reg = <2>;
> +       function = LED_FUNCTION_FLASH;
> +       color = <LED_COLOR_ID_WHITE>;
> +       function-enumerator = <1>;
> +       default-state = "off";
> +       led-max-microamp = <200000>;
> +       flash-max-microamp = <500000>;
> +       flash-max-timeout-us = <1024000>;
> +     };
> +     led@3 {
> +       reg = <3>;
> +       function = LED_FUNCTION_FLASH;
> +       color = <LED_COLOR_ID_WHITE>;
> +       function-enumerator = <2>;
> +       default-state = "off";
> +       led-max-microamp = <200000>;
> +       flash-max-microamp = <500000>;
> +       flash-max-timeout-us = <1024000>;
> +     };
> +   };
> +...
> 

[0] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml

-- 
Best regards,
Jacek Anaszewski

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
