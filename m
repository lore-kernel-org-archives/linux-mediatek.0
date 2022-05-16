Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89038C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 17:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KsbQM2STWe63PdapUIdpY9uOoW/nWSVhcHkC32Qpry8=; b=E7Rg3nnu9mpMI/
	5blHNcR1BCAeClokf7APWcS0yBURJzphpzmCc0WYPQlcpZWPzPOo5zIF6OiKpwo3wrfv3i6pI78JK
	NWW8De7K9CVdXBkffgLvyUAN1tCQQQImzckO4h0+roygf0ICbkCY2yoomMNnw7UsRjhRsmws2QeBm
	FlxcCUrsbzla05sGsIgGQDIFK1XurWeck46IjCq8RezwRILvc7UDl3EfSyEZZbX1sZWmWABoY5BZ4
	KO2kPu7S1HUhoh/NYLRJFjXnh+094yfCAl0ZtJfXNLi3VQCQP873CEwkzetk3u7eoZGV1jeBKYtVD
	dxCJ0e+xjOk3RZndvPYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqeWI-009Ln7-09; Mon, 16 May 2022 17:28:34 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqeW6-009Ll2-Hy; Mon, 16 May 2022 17:28:24 +0000
Received: by mail-oi1-f169.google.com with SMTP id r1so19449232oie.4;
 Mon, 16 May 2022 10:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wPpscCa2GIFkySmjw5GUwkyZ+UiIs3l9izNHfq7Aa2M=;
 b=lmNRyWCVh3c+n3tueP5Cfvn7nsjhZgov2OOcGy4fqcPedAHXmniYPRahziBwuLq7bo
 Glz1kNGejhbgzjRL2cpOqHHLZ+6I1Sdiu3PlFvSLH38xo+MDw4pcmxO3ijPds2rdXou3
 IMQ5mes1qUahzvDJm/lmz2i0xpVKr0tQyEC/GclFZnRhkEh9y4mEQ1MpEcoxgwbphbUV
 +xeCaYq8PUwZ/LusVnQiziG9Rs1C0uInaF3QlpVX5E0gLdZ0zm/htS7d7GIjpxpXCm3z
 i9D7RIczR6IejM+m3iVkZw/JtLw73qjsClFw1wUidElh9H9bt5ZJScOVIYHlocgCRSgU
 b1rg==
X-Gm-Message-State: AOAM533cgtlB5YoKAvNcG/2qFcJscM/xH5639bdrp/2ubJIuEbhZJrmq
 JftBP+q8xvIhKqPtqja2XQ==
X-Google-Smtp-Source: ABdhPJwUrisBSYtA1OrplifhC1XpMjP+Aq57zo5rc2g+9vWodKCKsoozbjCrFXi567TNb0emYI/VXA==
X-Received: by 2002:a05:6808:1b2c:b0:326:6bc9:4070 with SMTP id
 bx44-20020a0568081b2c00b003266bc94070mr8220903oib.248.1652722101353; 
 Mon, 16 May 2022 10:28:21 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 u7-20020a056871058700b000e686d13876sm5795033oan.16.2022.05.16.10.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 10:28:20 -0700 (PDT)
Received: (nullmailer pid 2941200 invoked by uid 1000);
 Mon, 16 May 2022 17:28:19 -0000
Date: Mon, 16 May 2022 12:28:19 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 y.oudjana@protonmail.com, jason-jh.lin@mediatek.com, ck.hu@mediatek.com,
 fparent@baylibre.com, rex-bc.chen@mediatek.com, tinghan.shen@mediatek.com,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com, ikjn@chromium.org,
 miles.chen@mediatek.com, sam.shih@mediatek.com, wenst@chromium.org,
 bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com
Subject: Re: [PATCH 4/5] dt-bindings: arm: mediatek: Add clock driver
 bindings for MT6795
Message-ID: <20220516172819.GA2938099-robh@kernel.org>
References: <20220513165050.500831-1-angelogioacchino.delregno@collabora.com>
 <20220513165050.500831-5-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220513165050.500831-5-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_102822_644016_983590A7 
X-CRM114-Status: GOOD (  18.41  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, May 13, 2022 at 06:50:49PM +0200, AngeloGioacchino Del Regno wrote:
> Add the bindings for the clock drivers of the MediaTek Helio X10
> MT6795 SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../arm/mediatek/mediatek,mt6795-clock.yaml   | 67 +++++++++++++++++
>  .../mediatek/mediatek,mt6795-sys-clock.yaml   | 73 +++++++++++++++++++
>  2 files changed, 140 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt6795-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt6795-sys-clock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt6795-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt6795-clock.yaml
> new file mode 100644
> index 000000000000..b7d96d0ed867
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt6795-clock.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt6795-clock.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MediaTek Functional Clock Controller for MT6795
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +description: |
> +  The clock architecture in MediaTek like below
> +  PLLs -->
> +          dividers -->
> +                      muxes
> +                           -->
> +                              clock gate
> +
> +  The devices provide clock gate control in different IP blocks.
> +
> +properties:
> +  compatible:
> +    items:

Don't need 'items' if only 1 item.

> +      - enum:
> +          - mediatek,mt6795-mfgcfg
> +          - mediatek,mt6795-vdecsys
> +          - mediatek,mt6795-vencsys

blank line.

> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg

Why is #clock-cells optional? 

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        clock-controller@13000000 {
> +            compatible = "mediatek,mt6795-mfgcfg";
> +            reg = <0 0x13000000 0 0x1000>;
> +            #clock-cells = <1>;
> +        };
> +
> +        clock-controller@16000000 {
> +            compatible = "mediatek,mt6795-vdecsys";
> +            reg = <0 0x16000000 0 0x1000>;
> +            #clock-cells = <1>;
> +        };
> +
> +        clock-controller@18000000 {
> +            compatible = "mediatek,mt6795-vdecsys";
> +            reg = <0 0x18000000 0 0x1000>;
> +            #clock-cells = <1>;
> +        };
> +    };
> +
> +
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt6795-sys-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt6795-sys-clock.yaml
> new file mode 100644
> index 000000000000..389dd8e245ac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt6795-sys-clock.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt6795-sys-clock.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MediaTek System Clock Controller for MT6795
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +description:
> +  The Mediatek system clock controller provides various clocks and system configuration
> +  like reset and bus protection on MT6795.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt6795-apmixedsys
> +          - mediatek,mt6795-infracfg
> +          - mediatek,mt6795-pericfg
> +          - mediatek,mt6795-topckgen
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg

#clock-cells?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        topckgen: clock-controller@10000000 {
> +            compatible = "mediatek,mt6795-topckgen", "syscon";
> +            reg = <0 0x10000000 0 0x1000>;
> +            #clock-cells = <1>;
> +        };
> +
> +        infracfg: power-controller@10001000 {
> +            compatible = "mediatek,mt6795-infracfg", "syscon";
> +            reg = <0 0x10001000 0 0x1000>;
> +            #clock-cells = <1>;
> +            #reset-cells = <1>;
> +        }
> +
> +        pericfg: power-controller@10003000 {
> +            compatible = "mediatek,mt6795-pericfg", "syscon";
> +            reg = <0 0x10003000 0 0x1000>;
> +            #clock-cells = <1>;
> +            #reset-cells = <1>;
> +        };
> +
> +        apmixedsys: clock-controller@10209000 {
> +            compatible = "mediatek,mt6795-apmixedsys", "syscon";
> +            reg = <0 0x10209000 0 0x1000>;
> +            #clock-cells = <1>;
> +        };
> +    };
> -- 
> 2.35.1
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
