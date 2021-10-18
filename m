Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46505C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 14:25:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00D9360F8F
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 14:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00D9360F8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xn2W5py9ab73hZg8ccSrUunLGVn7IBz2kOoXtCfAL2g=; b=ePzd5/QSKHRKBh
	evemnxVt3K+yj+VyjeX8fX482cCBQWh8MjsF00DsPvhPqiVr3WaMN1tAe+NRuvS9oyfxQ0ZVqcjjk
	NA/F5x279WixJpj3TBK7MVBNzCd1PKNDqyZVped7Ujgy4+cxkJlMtX/UcMOHKQZ0eiUItl2c0jHPk
	PW9tXg66inSATPyUsBjnk/hnHoQUmh5KGekUr5nDmYnXuqGLIdje6hgoQigbApJiu6gD5j/lHNKXc
	IAjm8btimgN5TShuA5v49OZu0zRXo7/oFmgODgJ0CiDv+/f9cMJf8PaRnVcvUokGhxEYXw500Kg7A
	QX23Vejhboeqs48qZQaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcTZR-00G67l-CP; Mon, 18 Oct 2021 14:24:57 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcTTs-00G3l1-Tx
 for linux-mediatek@lists.infradead.org; Mon, 18 Oct 2021 14:19:15 +0000
Received: by mail-wr1-x42a.google.com with SMTP id o20so41817239wro.3
 for <linux-mediatek@lists.infradead.org>; Mon, 18 Oct 2021 07:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rO3u8W1re/ntjdP9B4sW4LejsVx7mXqMR7pW2tEhW4Q=;
 b=O1+Nn4hkoQfSRaziBOLEs2H+RirbluSCSD2tQr2FERY9FAdMZDgS4CIeefn/xx37rH
 IAO7Knk0l1HaAtY6Ao88to0IiCogKf3A7qSuF9m6WAs3AOLOfp6VBcEpsFjgIolVmWlo
 IF3if4zl55WYSoLr+JIK1zCHCSaJKFgnWKgbzV7RNp5zvBKAKdJ18ErF0Ro/f64fPWBb
 4H0CTJOn9w0dkOq9zN/9iMra26JvcTahNTop4fNcPzhu3pYg5v/RAMzxx63E4z8hz1Af
 iXxBddPkSiPkh6BvUsQVcV8D4Zx1xCFgfsP39ah0399lXTwni8cKxn/jDFVvMGN+FFkn
 JQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rO3u8W1re/ntjdP9B4sW4LejsVx7mXqMR7pW2tEhW4Q=;
 b=HC/dQa92b9tVMTWv34djaEmM/JavLpE2ZfQmCW9pb4bWDeMbTqFKsuQgPPQsy4hKaC
 /S0yqNMnpsjyyKwN9AOJVNTcVEC7uRJHhjFS+1BfHmNHraEXxShx8Z19mg64lLBR1P4K
 l16fY1n6sphWkYX+YnC8RSRUj+oQld0lQ93RoTat1m5lHphpOzNPS3Gj/bHDmaSKqYRm
 9SGyznHuWxr/ioshenASV92Fbj+8HlchWvEzJAP/PmU1NAT0OhEI5GeAbY6wJKQ8X33u
 iMGyemu/KkPOnHM/Rr6C/rmZLSZVm8qDF1211bZ/8ZgI0AgPWn6PT8xWd6PhW/HRGAMj
 E6AA==
X-Gm-Message-State: AOAM531qy+o3Q4OtfrRos41w0OsQVH+f4Wkohwew5OpdqhZzmwn1KjAg
 HXVX1HP6kHDQmOkwHDuIBLvRng==
X-Google-Smtp-Source: ABdhPJx6QFnBuYrXhffPsvdEadj2vqw25nodwUVxgLLLJThHk6Zdq74Bt+K0UKskiB3M9DghQfMYMA==
X-Received: by 2002:adf:eb4f:: with SMTP id u15mr36415532wrn.215.1634566750156; 
 Mon, 18 Oct 2021 07:19:10 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900:5142:5fbb:5821:5dc3])
 by smtp.gmail.com with ESMTPSA id a2sm12835406wru.82.2021.10.18.07.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 07:19:09 -0700 (PDT)
Date: Mon, 18 Oct 2021 16:19:08 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Vinod Koul <vkoul@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/7] dt-bindings: mediatek, dp: Add Display Port binding
Message-ID: <20211018141908.fuevv2m66fw3xg36@blmsp>
References: <20211011094624.3416029-1-msp@baylibre.com>
 <20211011094624.3416029-3-msp@baylibre.com>
 <YWTaJOXGgF2bHznv@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YWTaJOXGgF2bHznv@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_071913_069387_9F5D1688 
X-CRM114-Status: GOOD (  22.96  )
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

Hi Rob,

On Mon, Oct 11, 2021 at 07:43:16PM -0500, Rob Herring wrote:
> On Mon, Oct 11, 2021 at 11:46:19AM +0200, Markus Schneider-Pargmann wrote:
> > This controller is present on several mediatek hardware. Currently
> > mt8195 and mt8395 have this controller without a functional difference,
> > so only one compatible field is added.
> > 
> > The controller can have two forms, as a normal display port and as an
> > embedded display port.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> >  .../display/mediatek/mediatek,dp.yaml         | 89 +++++++++++++++++++
> >  1 file changed, 89 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> > new file mode 100644
> > index 000000000000..f7a35962c23b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> > @@ -0,0 +1,89 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek Display Port Controller
> > +
> > +maintainers:
> > +  - CK Hu <ck.hu@mediatek.com>
> > +  - Jitao shi <jitao.shi@mediatek.com>
> > +
> > +description: |
> > +  Device tree bindings for the Mediatek (embedded) Display Port controller
> > +  present on some Mediatek SoCs.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt8195-edp_tx
> > +      - mediatek,mt8195-dp_tx
> 
> Are these blocks different?

Good point, the registers of these blocks are described in its own
chapter each. Also I do need to distinguish between both in the driver.
Would you suggest making this distinction differently or keep it as two
compatibles?

> 
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: faxi clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: faxi
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Input endpoint of the controller, usually dp_intf
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Output endpoint of the controller
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/power/mt8195-power.h>
> > +    dp_tx: edp_tx@1c500000 {
> > +        compatible = "mediatek,mt8195-edp_tx";
> > +        reg = <0 0x1c500000 0 0x8000>;
> > +        interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
> > +        power-domains = <&spm MT8195_POWER_DOMAIN_EPD_TX>;
> > +        pinctrl-names = "default";
> > +        pinctrl-0 = <&edp_pin>;
> > +        status = "okay";
> 
> Don't show status in examples.

Fixed.

Thank you Rob.

Best,
Markus

> 
> > +
> > +        ports {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            port@0 {
> > +                reg = <0>;
> > +                edp_in: endpoint {
> > +                    remote-endpoint = <&dp_intf0_out>;
> > +                };
> > +            };
> > +            port@1 {
> > +                reg = <1>;
> > +                edp_out: endpoint {
> > +                	remote-endpoint = <&panel_in>;
> > +                };
> > +            };
> > +        };
> > +    };
> > -- 
> > 2.33.0
> > 
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
