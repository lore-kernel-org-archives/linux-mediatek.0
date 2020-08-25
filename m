Return-Path: <SRS0=9GQg=CD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E98AC433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 22:20:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F35ED2075E
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 22:20:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t+Tlqofg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F35ED2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ldNsWTuBkyF3ShqQLlrfMH3DnJ7uQJRTWfqpstK2NCQ=; b=t+TlqofgodQah8PVbo/2ORpN8
	llMCJez+S/oQz4mIIoHgcIE/IdnoFYRKkCdpqV1LVFC1P2glus10+YuP79aKoqAN+lUWQNK1hRFsu
	CDN3rt7wOJScdCJcqxJO1PT4PKACB2gg7n1DrOcDUYyuaW47Q8PN0dQF6SQjBFIqknc8ErROLZvSt
	0vrkl7ih4NSpVWpr3ZJ7qVhdKUR1SVi0Z7qMANTR8it6hUmI5IzzjwUGO++DvUmEGbXvOZ2JacgBr
	wNbXfTzdK/4nspGbKqyh5rMPFFPBH5H1cO91SnNwctaoCtQjsF2t25wbjZ+gwhD/tHeYaxk+pGY49
	MI2/pGBNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAhJ9-0002z7-4P; Tue, 25 Aug 2020 22:20:47 +0000
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAhJ4-0002xG-F1; Tue, 25 Aug 2020 22:20:43 +0000
Received: by mail-il1-f194.google.com with SMTP id f75so134920ilh.3;
 Tue, 25 Aug 2020 15:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=k3KGmLJGZaOAZkv6OSfgLj0L7NmLhPE7zQczouh7MEU=;
 b=l08172fQGeHvMSB6QtYoBImVbVfkwlTaGNu9iySHY+t2zLnAiE0bzIqh5bKK5YCS/7
 d4uBDiBlsw1KKM4Qo2WirGITNfbOPM9soxbAdEXordM7l5FG7rrr1MDVOrQkCBC5tQ7c
 zA91pO14Zl3jp21kyv9gejR9DLtdO0XAwRtwIV2tbL8XNYWI0v87FRsYjRC7+ZTbScWw
 SbhzI9XXEEg1Vvicdrzx3eVHoy66bDJeEbBQWT67o3ccb7eYsi+cBS0SwcbQ+++y1u0W
 wDnp9Tt9HyZmZ4LWgnqoPUwAoBj1XQ4zeYkZhfN6sOuQl/0chCgmumqc1Mogjya6Js3Y
 Csyw==
X-Gm-Message-State: AOAM531ig2kIavmknnKLrww8zDL3JCacNYLe4/O6hhVGED+RTA/DRA9d
 MBJNcaQKmT03rHWhRoV1VQ==
X-Google-Smtp-Source: ABdhPJzvk8+3fhcPALS9UgRxvDmg4rJYVAmWzKAM0VmpBUEr/br5MUyUK52jUlLc3MBVxtZH4RMmfw==
X-Received: by 2002:a92:cf09:: with SMTP id c9mr11410277ilo.38.1598394040539; 
 Tue, 25 Aug 2020 15:20:40 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id p77sm224314ill.39.2020.08.25.15.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 15:20:39 -0700 (PDT)
Received: (nullmailer pid 1447409 invoked by uid 1000);
 Tue, 25 Aug 2020 22:20:37 -0000
Date: Tue, 25 Aug 2020 16:20:37 -0600
From: Rob Herring <robh@kernel.org>
To: Ikjoon Jang <ikjn@chromium.org>
Subject: Re: [PATCH] dt-bindings: spi: Convert spi-mtk-nor to json-schema
Message-ID: <20200825222037.GA1443219@bogus>
References: <20200820052827.2642164-1-ikjn@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200820052827.2642164-1-ikjn@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_182042_562476_FF769070 
X-CRM114-Status: GOOD (  18.40  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bayi Cheng <bayi.cheng@mediatek.com>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Chuanhong Guo <gch981213@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 20, 2020 at 01:28:27PM +0800, Ikjoon Jang wrote:
> Convert Mediatek ARM SOC's serial NOR flash controller binding
> to json-schema format.
> 
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> ---
>  .../bindings/spi/mediatek,spi-mtk-nor.yaml    | 82 +++++++++++++++++++
>  .../devicetree/bindings/spi/spi-mtk-nor.txt   | 47 -----------
>  2 files changed, 82 insertions(+), 47 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
>  delete mode 100644 Documentation/devicetree/bindings/spi/spi-mtk-nor.txt
> 
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
> new file mode 100644
> index 000000000000..1e4bcf691539
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Serial NOR flash controller for MediaTek ARM SoCs
> +
> +maintainers:
> +  - Bayi Cheng <bayi.cheng@mediatek.com>
> +  - Chuanhong Guo <gch981213@gmail.com>
> +
> +description: |
> +  This spi controller support single, dual, or quad mode transfer for
> +  SPI NOR flash. There should be only one spi slave device following
> +  generic spi bindings. It's not recommended to use this controller
> +  for devices other than SPI NOR flash due to limited transfer
> +  capability of this controller.
> +
> +allOf:
> +  - $ref: /spi/spi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - mediatek,mt2701-nor
> +              - mediatek,mt2712-nor
> +              - mediatek,mt7622-nor
> +              - mediatek,mt7623-nor
> +              - mediatek,mt7629-nor
> +          - enum:
> +              - mediatek,mt8173-nor
> +      - items:
> +          - const: mediatek,mt8173-nor
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: clock used for spi bus
> +      - description: clock used for controller
> +
> +  clock-names:
> +    items:
> +      - const: "spi"
> +      - const: "sf"

Don't need quotes.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names

interrupts was required.

Add:

unevaluatedProperties: false

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      nor_flash: spi@1100d000 {
> +        compatible = "mediatek,mt8173-nor";
> +        reg = <0 0x1100d000 0 0xe0>;
> +        interrupts = <&spi_flash_irq>;
> +        clocks = <&pericfg CLK_PERI_SPI>, <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
> +        clock-names = "spi", "sf";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        flash@0 {
> +          compatible = "jedec,spi-nor";
> +          reg = <0>;
> +        };
> +      };
> +    };
> +

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
