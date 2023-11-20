Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C57C197A0
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 19:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s6qbWAmzKi2p0EuDS/NMn95lRrUARZbsnu45noLp+Qc=; b=jixzjZ94bg+FS3yBmupqwc5auO
	6IdsLQkBWfe/8FQi8yxsSb25dZqxc7api5scFPriwY5Um+oVrRpawuDZig5ELX5VRsHn+/Nb1X0Zq
	vPvz2Sfr82eJpYuy82yJoAKoom3EjP04kyLPYj8pbRES7A0s5rcUhFLGsAXcNNAYfQ1Gx87+OX+tQ
	EqTdk3WN5CcMC8czFvHu3LP5ul8TuOh7TigFEWd4nXBsA2UTie2UuyJu1I7cC/nXw3GjJvvd+g5yS
	yBAx7t2xmGGolRqtI4w0/yymuJZZzd4RkMyXjzfuJZRQO+OFVDTBvrpqUH6Xsvz/IQsnN5w4i6RdH
	2t3Q5WOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5A59-00EiZP-0q;
	Mon, 20 Nov 2023 19:37:19 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5A54-00EiYE-1V;
	Mon, 20 Nov 2023 19:37:16 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-332c0c32d19so1576546f8f.3;
        Mon, 20 Nov 2023 11:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700509030; x=1701113830; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s6qbWAmzKi2p0EuDS/NMn95lRrUARZbsnu45noLp+Qc=;
        b=BgpRKq0zpeZr7UuagVkZOXOjD62DbWkEdR9/4wvqoa+3p8byb5Asu4m1pPeT9Uk5WM
         ifuONNPrWhxAbXBhcKO/6nqUs548oZpWiak+t45tFwoMxOt9fKRBFHKYamqWMeU8rtfR
         Fd6UAx+pXMvSCcEOhklctssxkPxk5iR0Yf5q2UV948C9D4P/FHQUJ4vh6FyeglxUEa5p
         pbUefFfklyOMVKzz0i06J6Q9IImgVXmkgmDITpRMItFGcttROrEY3g6EauB4XWEAF5nR
         iAYWI0lMfVWjsJjYv+406ZHQSFfst8gGCnSSnpnzxrCG2b9Gmb3v07BplP2xTOnom8AR
         scfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700509030; x=1701113830;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6qbWAmzKi2p0EuDS/NMn95lRrUARZbsnu45noLp+Qc=;
        b=aqgpTv9oxes5X15e2jD1Y604uOiPx24IfczMB9WialnYA2VSmHy6UbgiohAheh5iFu
         qIvBcMEczf8pwzdBwteGoqxpZtE2qIqw+XbgGeMo27ttZgs8T5NNPHT2zCco0TOosan6
         SsMgRFrSw6oSOV7Fp9UKv4OjJQ5NqN7wduLOxYqpa2n4q3Z+zD+uVsW3NKIeT8gWlr36
         PD2STHmEaEj4Ymqz+QV6isZOsb4z2XrQ0UP9xL4xJWdfSG/VvkxB5MOWw5LStytr3y5o
         HrMJlOIS6jg8peMSKHPqZOKSVrYTvWOnOB6cRVQKtj7DT8LOm048P7pxh06HvSg8Wp+k
         /Jng==
X-Gm-Message-State: AOJu0YzV59XRAB0ubnbtKZBB00izB1eHPViLt+kIghN/SPUv0836zrdB
	0rR2Y5yLyqzV9NsXQnGk7Ps=
X-Google-Smtp-Source: AGHT+IF4HwRNSy2o1xnmcctJJBVc95B9JljVI0ZK81TRO/JZxZDY4YWuo06d3u96DM+h1Tmg7Z2QIg==
X-Received: by 2002:adf:e503:0:b0:331:6a43:5abe with SMTP id j3-20020adfe503000000b003316a435abemr5132310wrm.62.1700509030283;
        Mon, 20 Nov 2023 11:37:10 -0800 (PST)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id e8-20020adfe7c8000000b00332cc24a59bsm997960wrn.109.2023.11.20.11.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 11:37:09 -0800 (PST)
Message-ID: <655bb565.df0a0220.1848b.5d49@mx.google.com>
X-Google-Original-Message-ID: <ZVuLuHAShU88RJno@Ansuel-xps.>
Date: Mon, 20 Nov 2023 17:39:20 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Harini Katakam <harini.katakam@amd.com>,
	Simon Horman <horms@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH 03/14] dt-bindings: net: document ethernet
 PHY package nodes
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-4-ansuelsmth@gmail.com>
 <20231120174133.GB2378814-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120174133.GB2378814-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_113714_506804_E7AB0BB0 
X-CRM114-Status: GOOD (  35.85  )
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

On Mon, Nov 20, 2023 at 10:41:33AM -0700, Rob Herring wrote:
> On Mon, Nov 20, 2023 at 02:50:30PM +0100, Christian Marangi wrote:
> > Document ethernet PHY package nodes used to describe PHY shipped in
> > bundle of 4-5 PHY. These particular PHY require specific PHY in the
> > package for global onfiguration of the PHY package.
> > 
> > Example are PHY package that have some regs only in one PHY of the
> > package and will affect every other PHY in the package, for example
> > related to PHY interface mode calibration or global PHY mode selection.
> > 
> > The PHY package node should use the global-phys property and the
> > global-phy-names to define PHY in the package required by the PHY driver
> > for global configuration.
> > 
> > It's also possible to specify the property phy-mode to specify that the
> > PHY package sets a global PHY interface mode and every PHY of the
> > package requires to have the same PHY interface mode.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../bindings/net/ethernet-phy-package.yaml    | 86 +++++++++++++++++++
> >  1 file changed, 86 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml b/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
> > new file mode 100644
> > index 000000000000..2aa109e155d9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
> > @@ -0,0 +1,86 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/ethernet-phy-package.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Ethernet PHY Package Common Properties
> > +
> > +maintainers:
> > +  - Christian Marangi <ansuelsmth@gmail.com
> 
> Missing a '>'
> 
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^ethernet-phy-package(-[0-9]+)?$"
> > +
> > +  compatible:
> > +    const: ethernet-phy-package
> > +
> > +  '#address-cells':
> > +    description: number of address cells for the MDIO bus
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    description: number of size cells on the MDIO bus
> > +    const: 0
> > +
> > +  global-phys:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    minItems: 1
> > +    maxItems: 31
> > +    description:
> > +      List of phandle to the PHY in the package required and
> > +      used to configure the PHY package.
> > +
> > +  global-phy-names:
> > +    $ref: /schemas/types.yaml#/definitions/string-array
> > +    minItems: 1
> > +    maxItems: 31
> > +    description:
> > +      List of names of the PHY defined in global-phys.
> > +
> > +  phy-connection-type:
> > +    $ref: /schemas/net/ethernet-phy-mode-types.yaml#definitions/phy-connection-type
> > +    description:
> > +      Specifies global interface type for the PHY package.
> > +
> > +  phy-mode:
> > +    $ref: "#/properties/phy-connection-type"
> > +
> > +patternProperties:
> > +  ^ethernet-phy(@[a-f0-9]+)?$:
> > +    $ref: /schemas/net/ethernet-phy.yaml#
> > +
> > +required:
> > +  - compatible
> > +
> > +dependencies:
> > +  global-phy-names: [global-phys]
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    ethernet {
> 
> You mean 'mdio' here, right?
> 
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        ethernet-phy-package {
> 
> This doesn't work. Child nodes of MDIO bus must be an MDIO device with 
> an address. What you need is a node with all the addresses of the 
> device:
> 
> mdio {
>   ...
> 
>   ethernet-phy@1 {
>     compatible = "vendor,specifc-compatible-for-device";
>     reg = <1>, <4>;
>     ...
>   };
> };
> 
> There's also some MDIO devices which define a secondary address as a 
> child device. Maybe those are similar to your situation. I don't recall 
> which ones offhand.
>

Ehh this is not really a situation. We really need a way to describe PHY
package. (In the sense of device that expose multiple PHY package, as
they can be treated as single one but they are actually in bulk of 2-4-5
PHY)

qca807x is one example, quickinc is trying to push another PHY with just
a similar implementation and Maxime Chevallier just pointed out that Marvell
Alaska 88e1543 PHY also have this kind of configuration.

I feel defining PHY in subnode is a MUST and using ethernet-phy might be
confusing to describe PHY package (so I think a brand new node name
might be a better solution)

About the reg, I wonder if it would like it more if the PHY package node
would include the reg as the first address of the package and the reg
property as a list of all the reg the PHY package use.

Something like this?

        ethernet-phy-package@1 {
            compatible = "ethernet-phy-package";
            #address-cells = <1>;
            #size-cells = <0>;
            reg = <1>, <2>, <3>, <4>;

            global-phys = <&phy4>;
            global-phy-names = "base";

            ethernet-phy@1 {
              compatible = "ethernet-phy-ieee802.3-c22";
              reg = <1>;
            };

            phy4: ethernet-phy@4 {
              compatible = "ethernet-phy-ieee802.3-c22";
              reg = <4>;
            };
        };

Thanks a lot for the review and I hope we can find a good and correct
way to model this. Just hope we don't have to add all kind of proprerty
to describe the idea of PHY package. (I think the current example makes
it very clear that the PHY under the node are all part of a single piece
on the device)

> > +            compatible = "ethernet-phy-package";
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            global-phys = <&phy4>;
> > +            global-phy-names = "base";
> > +
> > +            ethernet-phy@1 {
> > +              compatible = "ethernet-phy-ieee802.3-c22";
> > +              reg = <1>;
> > +            };
> > +
> > +            phy4: ethernet-phy@4 {
> > +              compatible = "ethernet-phy-ieee802.3-c22";
> > +              reg = <4>;
> > +            };
> > +        };
> > +    };
> > -- 
> > 2.40.1
> > 

-- 
	Ansuel

