Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80CCC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 22:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ni+QM1NQCcgkAj/8RAaEXHLHTHpEmfsdhBRgD9S0obg=; b=g53vF5sAoXPzfu8P0R2sZ5779n
	TEORd0ULoJzgok9U7acJ/9qw9Uuc/lpbDOSivlVnF2VXMlo1yt26QQ7Nuz79ODlo5L3so9J4L7hOu
	oXT/NeFAhViyNCRaXbdrBNlXw5GGmBmpQZl7P39yDBCLnt/vJO5ChK9czLsqGvJn5qPEX1H7ArBV9
	JmNceIRVDs0XD8KfXCYfcLFIsn+wusOkI4XEi2bl32UJxzMYRwVlFTJjq8jTpgfgke39W3VrurF0g
	HA1TA7kbuztMzLdX9a7446mVwRyVkjlZHek3+gii7r/oqabI9xQ6FkWlkODwyqxKVGREtHZhz+FWK
	idBNpsSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7jtt-003ZtX-2f;
	Mon, 27 Nov 2023 22:16:21 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7jtn-003Zs7-0X;
	Mon, 27 Nov 2023 22:16:16 +0000
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6d812988394so1601478a34.3;
        Mon, 27 Nov 2023 14:16:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701123374; x=1701728174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ni+QM1NQCcgkAj/8RAaEXHLHTHpEmfsdhBRgD9S0obg=;
        b=ZU/tWGszzfKSBHKuo7Pv5R0QjRgxt8hfOgX7PWYugDNR1MPUDIBWzHez9F/r44b+/6
         DhLotX87EpdD3A4W+CBX3sOExFEipy/ZRaglYEjf3PCfPjkAw8S/9QRZA0FCrJZ/3sUO
         UV+6RYGa5+R1JTFHBppD84yFlZhSjG96lX078R4Acmjp4CPim5GVCr/e4NH8hNzspVWG
         dSDfTAJZjxaM6PiS0gF12r/6rqh22Zfp+4CCuStbHx1Zy0fV4reSEZI0QHegMntKdnW/
         PBuD78jU7hGSWEP6gL3Ldi7LepTcD22BKdb25+h1cPyCan1WGm1mE58Tm46Qa6eEc760
         dqNw==
X-Gm-Message-State: AOJu0YyYgNX+mBuLa2a3buTMj8Y8TGd0OIiRWbh3Kc2FHoJZIwClzWGL
	4FX4k+55FoNY2413jhM/ig==
X-Google-Smtp-Source: AGHT+IGUTejt/8I/FkmEAVJmTD9AFB5fYEWb//1MrwvjzlCkYslMTEoW/bdzPOLIYsPc065LFT0e5A==
X-Received: by 2002:a05:6830:1e39:b0:6d3:a8b:b34 with SMTP id t25-20020a0568301e3900b006d30a8b0b34mr15059347otr.5.1701123373505;
        Mon, 27 Nov 2023 14:16:13 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s12-20020a056830438c00b006ce2f0818d3sm1497262otv.22.2023.11.27.14.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 14:16:12 -0800 (PST)
Received: (nullmailer pid 4135204 invoked by uid 1000);
	Mon, 27 Nov 2023 22:16:11 -0000
Date: Mon, 27 Nov 2023 16:16:11 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [net-next PATCH RFC v3 1/8] dt-bindings: net: document ethernet
 PHY package nodes
Message-ID: <20231127221611.GA4023452-robh@kernel.org>
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
 <20231126015346.25208-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231126015346.25208-2-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_141615_317313_D43AA395 
X-CRM114-Status: GOOD (  28.17  )
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

On Sun, Nov 26, 2023 at 02:53:39AM +0100, Christian Marangi wrote:
> Document ethernet PHY package nodes used to describe PHY shipped in
> bundle of 4-5 PHY. The special node describe a container of PHY that
> share common properties. This is a generic schema and PHY package
> should create specialized version with the required additional shared
> properties.
> 
> Example are PHY package that have some regs only in one PHY of the
> package and will affect every other PHY in the package, for example
> related to PHY interface mode calibration or global PHY mode selection.
> 
> The PHY package node MUST declare the base address used by the PHY driver
> for global configuration by calculating the offsets of the global PHY
> based on the base address of the PHY package and declare the
> "ethrnet-phy-package" compatible.
> 
> Each reg of the PHY defined in the PHY package node is absolute and will
> reference the real address of the PHY on the bus.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/net/ethernet-phy-package.yaml    | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml b/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
> new file mode 100644
> index 000000000000..244d4bc29164
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/ethernet-phy-package.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ethernet PHY Package Common Properties
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +description:
> +  This schema describe PHY package as simple container for
> +  a bundle of PHYs that share the same properties and
> +  contains the PHYs of the package themself.
> +
> +  Each reg of the PHYs defined in the PHY package node is
> +  absolute and describe the real address of the PHY on the bus.
> +
> +properties:
> +  $nodename:
> +    pattern: "^ethernet-phy-package(@[a-f0-9]+)?$"
> +
> +  compatible:
> +    const: ethernet-phy-package

In case I wasn't clear, but that compatible is a NAK.

> +
> +  reg:
> +    minimum: 0
> +    maximum: 31

Pretty sure the bus binding already provides these constraints.

> +    description:
> +      The base ID number for the PHY package.
> +      Commonly the ID of the first PHY in the PHY package.
> +
> +      Some PHY in the PHY package might be not defined but
> +      still exist on the device (just not attached to anything).
> +      The reg defined in the PHY package node might differ and
> +      the related PHY might be not defined.
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0

You are implementing a secondary MDIO bus within this node. It needs a 
$ref to mdio.yaml instead of defining the bus again implicitly.

> +
> +patternProperties:
> +  ^ethernet-phy(@[a-f0-9]+)?$:
> +    $ref: ethernet-phy.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    mdio {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ethernet-phy-package@16 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            compatible = "ethernet-phy-package";
> +            reg = <0x16>;
> +
> +            ethernet-phy@16 {
> +              reg = <0x16>;
> +            };
> +
> +            phy4: ethernet-phy@1a {
> +              reg = <0x1a>;
> +            };

This example on its own doesn't make sense. It can't be fully validated 
because you allow any additional properties. Drop it.

> +        };
> +    };
> -- 
> 2.40.1
> 

