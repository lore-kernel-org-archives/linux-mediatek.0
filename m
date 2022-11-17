Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C1DC4321E
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Nov 2022 15:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TVhbvRUqZQu6uk1nSlOpC0Wl3O1+Ha3Mzov9EJw71XE=; b=oNdvS1WpoieqXcjtLA4u4E060X
	+z7aacP3SllIQgvpHPCw6ECMnAVhGy8JFW2I03Z3uGA9euHdTk6Rt5OMHbJSeqHrukf/QorrfZHqx
	LdUYAivi80ytFkvYyegZcsIuf7g+Q+mRG/zM7pogR3Gn8/OeEhQZw+y4iUYUPI2/N395Qzgi1uj/t
	SLDGYlm90eWy8+5Z3zDrLZpn2E9d8K8DdWS8aK8j36EjM7nH9JlTsPVDqQ60Pr6Nu8H7aP6lOd/6o
	qvSbF7/aEtmpwgfP3ShcrKjU9QzfqArvCdC3JNHZW+SjA118uoY2mCgqBIT3dzgfKTfmk4UrpFJZV
	BJcTCNJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovgzb-00FRyN-RI; Thu, 17 Nov 2022 15:39:55 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovgzY-00FRub-9A; Thu, 17 Nov 2022 15:39:54 +0000
Received: by mail-ot1-f50.google.com with SMTP id g51-20020a9d12b6000000b0066dbea0d203so1264502otg.6;
        Thu, 17 Nov 2022 07:39:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVhbvRUqZQu6uk1nSlOpC0Wl3O1+Ha3Mzov9EJw71XE=;
        b=u+6dX5MOy78iqnUc/do0MTx4QDhwyiCIi+jichM/9uZ783K6GW6MvouRNSE4iyEJXg
         s/wlvsvPLUEjj3dvt+qjlWEsD9jxCbMQe9zkWn1Ubwq/vTOZHOuYQZYXaZGkG40wljbB
         dXYSWW87pkJfgpT1SCOi+TuVxr9QImSqm3/XmGoBUkhppyVHhWSsPkmhh3z+Fud5EaOW
         nXSb7vu8E8n/Wx5QvycsxryJV021DgXjg8CagoJTwhrh2jp11O0O69qpLw4cgG0gIUYM
         eP44Buzn8DRFrnzvtFWwd+4Kn/ug3OlolTPLS9nu1tF3h6v5ehPoYQ0gS44o8vS4V5J+
         gjOw==
X-Gm-Message-State: ANoB5pmIw8gND6ApBQWWH+ifqQi4WTCCSljR9E4lB4WZlWYpalLOTj4H
	SnmjH1CrIvwXoldaaKymxRBwOMtpqQ==
X-Google-Smtp-Source: AA0mqf4f8AEtQBCEXoach04sei0JgrD/an2wLNFUiFJXCBqskIg7Lnw9MEjrMzhIfDsicIRmbX4Fng==
X-Received: by 2002:a05:6830:1d66:b0:66c:5b70:2396 with SMTP id l6-20020a0568301d6600b0066c5b702396mr1626581oti.357.1668699589169;
        Thu, 17 Nov 2022 07:39:49 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 44-20020a9d04af000000b0066101e9dccdsm450844otm.45.2022.11.17.07.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 07:39:48 -0800 (PST)
Received: (nullmailer pid 2918390 invoked by uid 1000);
	Thu, 17 Nov 2022 15:39:50 -0000
Date: Thu, 17 Nov 2022 09:39:50 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Flora Fu <flora.fu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tianping Fang <tianping.fang@mediatek.com>, Fabien Parent <fabien.parent@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Brown <broonie@kernel.org>, Sean Wang <sean.wang@mediatek.com>, Chen Zhong <chen.zhong@mediatek.com>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org, Fabien Parent <fparent@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-rtc@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v5 02/10] dt-bindings: rtc: mediatek: convert MT6397 rtc
 documentation
Message-ID: <20221117153950.GA2913522-robh@kernel.org>
References: <20221005-mt6357-support-v5-0-8210d955dd3d@baylibre.com>
 <20221005-mt6357-support-v5-2-8210d955dd3d@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005-mt6357-support-v5-2-8210d955dd3d@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_073952_352396_BDF684FA 
X-CRM114-Status: GOOD (  21.92  )
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

On Wed, Nov 16, 2022 at 01:32:56PM +0100, Alexandre Mergnat wrote:
> - Convert rtc/rtc-mt6397.txt to rtc/mt6397-rtc.yaml
> - Add maintainer
> - Remove the .txt binding file
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt   |  2 +-
>  .../bindings/rtc/mediatek,mt6397-rtc.yaml          | 43 ++++++++++++++++++++++
>  .../devicetree/bindings/rtc/rtc-mt6397.txt         | 31 ----------------
>  3 files changed, 44 insertions(+), 32 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
> index 0088442efca1..79aaf21af8e9 100644
> --- a/Documentation/devicetree/bindings/mfd/mt6397.txt
> +++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
> @@ -33,7 +33,7 @@ Optional subnodes:
>  		- compatible: "mediatek,mt6331-rtc"
>  		- compatible: "mediatek,mt6358-rtc"
>  		- compatible: "mediatek,mt6397-rtc"
> -	For details, see ../rtc/rtc-mt6397.txt
> +	For details, see ../rtc/mediatek,mt6397-rtc.yaml
>  - regulators
>  	Required properties:
>  		- compatible: "mediatek,mt6323-regulator"
> diff --git a/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml b/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml
> new file mode 100644
> index 000000000000..f5a323597f1d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml
> @@ -0,0 +1,43 @@
> + # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/mediatek,mt6397-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6397/MT6366/MT6358/MT6323 RTC
> +
> +maintainers:
> +  - Tianping Fang <tianping.fang@mediatek.com>
> +  - Alexandre Mergnat <amergnat@baylibre.com>
> +
> +description: |

Don't need '|' if no formatting.

> +  MediaTek PMIC based RTC is an independent function of MediaTek PMIC that works
> +  as a type of multi-function device (MFD). The RTC can be configured and set up
> +  with PMIC wrapper bus which is a common resource shared with the other
> +  functions found on the same PMIC.
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt6323-rtc
> +      - mediatek,mt6358-rtc
> +      - mediatek,mt6366-rtc
> +      - mediatek,mt6397-rtc
> +
> +  start-year: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +
> +examples:
> +  - |
> +    pmic {
> +        rtc {
> +            compatible = "mediatek,mt6397-rtc";
> +        };
> +    };

Please drop the example here. Just one complete example in the MFD 
schema.

