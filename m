Return-Path: <SRS0=uRRy=DF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BABCC2D0A8
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2020 18:44:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BA69207D8
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2020 18:44:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R/kMnSLg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BA69207D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bo5EeCA3ck88IuJc8T7whXQHBgS63s11n1O8ZeSe+M0=; b=R/kMnSLgj7W9zMSOkDe/6zoK5
	uZQDf9JEPN41uYPE9eYdiPxZfMTSj44mIfmkXdnciCZjwcuX1IsO0sqY6OKpHUgJ3aamjVxuUNT63
	bXGBWH0zWuNlbupd506sBMcr1g9SggCs/AZcX/se//0AmitY2uqg5Jcijd7aHg6O96A5DD2NZRoua
	VZDHu2+G0NQAGv0BgJqORtiAKHCr1NFNzxr3rTRGqQFb3GFjVRHJjY+ihWz7R3DSQ4U7HgHOaJ0Z6
	dRE+bpuL1CUiOJFi6+V4zGxfKn84ozpQu0kTLRZ4jXk63S+R5VdWiftQanB3v1zkNS0HA+cwRvJtx
	zlhxjS3Nw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMy8T-0000tm-0p; Mon, 28 Sep 2020 18:44:29 +0000
Received: from mail-oo1-f68.google.com ([209.85.161.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMy8P-0000t0-PH; Mon, 28 Sep 2020 18:44:26 +0000
Received: by mail-oo1-f68.google.com with SMTP id g26so586380ooa.9;
 Mon, 28 Sep 2020 11:44:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mMpSORkuwjhOa8TOokOcUYzY59laiixLdPiUVCdrAeg=;
 b=AmYuz4OBo9B0IxgfN7Poznh6hHLP34g/VTwi/BOQr6WAYYKxEFlMhz4pmlOSIIzfLx
 QsCip17ZRaWOBc3HAp9iKtLFSBfkykI+Ogt/ntFoW4+hiHKoWV+/k2cUBrJ5TgYCgnX9
 4AEZCzqI1sPxU/0eReYA0y0S1s0epoZeaUkgxvE5lhAepBVUYDvzm2yCXGnGUhU3UgIR
 NO50jBmcxFyQVXNJuDZXeuJIVQHs4CcYMCzOV/YhdyhwDtMlAWQjRxrw886JlsRyU0lr
 zgGVakJQ1KrtsJm56ojw2uh1EsqGqXuz2M0LbgmEsjaLL1mnBRK26IAfCfhjdcHNoiDF
 rOhQ==
X-Gm-Message-State: AOAM531ggtGvLwThmSi0v5ktfhjL5MOkrBEFFkPPGM6uxQeeMUqC8dQp
 UAgJXf39ZOsDKBjMZ+1U4R0otQ3zyfQZ
X-Google-Smtp-Source: ABdhPJyPdFTuxXAFsELHG08LsFRQXGxrjXoPbeF7DUDjO4hDT1H917CJR631LnpqUTwioqQMk3+PVQ==
X-Received: by 2002:a4a:a50a:: with SMTP id v10mr1807675ook.4.1601318664841;
 Mon, 28 Sep 2020 11:44:24 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y23sm2261445ooj.34.2020.09.28.11.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 11:44:24 -0700 (PDT)
Received: (nullmailer pid 3059480 invoked by uid 1000);
 Mon, 28 Sep 2020 18:44:23 -0000
Date: Mon, 28 Sep 2020 13:44:23 -0500
From: Rob Herring <robh@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: leds: Add bindings for MT6360 LED
Message-ID: <20200928184423.GA3041988@bogus>
References: <1600865452-19649-1-git-send-email-gene.chen.richtek@gmail.com>
 <1600865452-19649-2-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1600865452-19649-2-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_144425_843317_2DCDBD1C 
X-CRM114-Status: GOOD (  17.97  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 cy_huang@richtek.com, linux-kernel@vger.kernel.org, gene_chen@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, matthias.bgg@gmail.com,
 shufan_lee@richtek.com, Wilma.Wu@mediatek.com, linux-leds@vger.kernel.org,
 dmurphy@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 23, 2020 at 08:50:51PM +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add bindings document for LED support on MT6360 PMIC
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  .../devicetree/bindings/leds/leds-mt6360.yaml      | 107 +++++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> new file mode 100644
> index 0000000..a356a1f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-mt6360.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LED driver for MT6360 PMIC from MediaTek Integrated.

Where's the PMIC schema? This file needs to be referenced from it and 
that means it all needs to be one series.

> +
> +maintainers:
> +  - Gene Chen <gene_chen@richtek.com>
> +
> +description: |
> +  This module is part of the MT6360 MFD device.
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
> +  "^led@[0-5]$":
> +    type: object
> +    $ref: common.yaml#
> +    description:
> +      Properties for a single LED.
> +
> +    properties:
> +      reg:
> +        description: Index of the LED.
> +        enum:
> +          - 0 # LED output INDICATOR1
> +          - 1 # LED output INDICATOR2
> +          - 2 # LED output INDICATOR3
> +          - 3 # LED output INDICATOR4
> +          - 4 # LED output FLED1
> +          - 5 # LED output FLED2
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
> +       default-state = "off";
> +     };
> +     led@1 {
> +       reg = <1>;
> +       function = LED_FUNCTION_INDICATOR;
> +       color = <LED_COLOR_ID_GREEN>;
> +       default-state = "off";
> +     };
> +     led@2 {
> +       reg = <2>;
> +       function = LED_FUNCTION_INDICATOR;
> +       color = <LED_COLOR_ID_BLUE>;
> +       default-state = "off";
> +     };
> +     led@3 {
> +       reg = <3>;
> +       function = LED_FUNCTION_INDICATOR;
> +       color = <LED_COLOR_ID_AMBER>;
> +       default-state = "off";
> +     };
> +     led@4 {
> +       reg = <4>;
> +       function = LED_FUNCTION_FLASH;
> +       color = <LED_COLOR_ID_WHITE>;
> +       function-enumerator = <1>;
> +       default-state = "off";
> +       led-max-microamp = <200000>;
> +       flash-max-microamp = <500000>;
> +       flash-max-timeout-us = <1024000>;
> +     };
> +     led@5 {
> +       reg = <5>;
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
> -- 
> 2.7.4
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
