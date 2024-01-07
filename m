Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07DCC47073
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Jan 2024 18:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CsMQHwEB3XjO8qN22Ypc9Zv6bys283cpFk0qTDgoWq4=; b=1VmvCNAa1E+RLUgFG2hD+JNz2C
	M1hlJIHNsgqYt6+YxuVtF77/ySC366YFxiee/Pd3wX6zRnO4anciRfdb3ZoJKwdtrKl+EPNUb2Arj
	C/u5YTyTUEJ2Ti7+/tRFfQAV6LPRmZ/uh91ZxOvukIlHu9IOly1968NAizSQSULW5ZNrxlAVt12qT
	SpLEfPsP9ONIwspBNJSo+EasSF5LVM56O75fIJYnFiPQePG2dl1SibHws9x91Y5/TMuFQwZp/SWlU
	WyJrUFneJwg6uJSu5ER6I5roWOrDkBUIdYaTxNx1WW0qDLsLBF/0EwGgri+5a5RouIunIymmDeFrM
	q3Sb1H+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMXua-003N8w-2t;
	Sun, 07 Jan 2024 18:30:16 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMXuW-003N8F-2K;
	Sun, 07 Jan 2024 18:30:14 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-33765009941so888263f8f.3;
        Sun, 07 Jan 2024 10:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704652210; x=1705257010; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CsMQHwEB3XjO8qN22Ypc9Zv6bys283cpFk0qTDgoWq4=;
        b=DHpOATsr3/+mYAQSjbilBr5+Vm981v161xQbL5sCnw3ZAO9DHHDKM8z7sk70vkKa6q
         pU8K/ngaIWtelQdH24ZTzpe1q+kENdmgXky9qcGJq28PsS8w6kmG5YtER9NLlupEzlCh
         PLVvqkMnIyf0fk6oifrzTK0LppKZlUAaw4raqfw8r5KhlYCUz0X0OqupPfD6swEJ/f3E
         GxG9RTdTJM++0lPMNzoaMqZst7zRSxc6PvUXipRn4/iN2JO05XJFjvlOpALxUIxbYNp1
         +I1QFkN+ZF0uh52tyUrEAaqO40znQlARXtHu4JsLGRnU7bRPbAvUi2dT3uWOkpbSxB4g
         ju7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704652210; x=1705257010;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsMQHwEB3XjO8qN22Ypc9Zv6bys283cpFk0qTDgoWq4=;
        b=slMLWpF7FS1pZ56b7zChd0O11Pr30zNsDqVqINysTFgrmicvXGznqp0fMvNdUQe+oV
         xMHrY9FhA4UVGJXOdYnbYUndSXj6+BNso39Ln9D5uPSAVZAaZngDDaHIMmO80I0VUQdy
         lAodJyrLJMck3A8bM4gsIjOiBHDIBjygywxdFBgybvmMMTGZKZILxOARa8uGO8SZz0Iw
         X9/Y+J+gP0dhnVqkPHnJV0OXCvFQdaBkVkDAv/iNacV6a3OWSGuy8TlyeL06UXVqZzWW
         XQcHATag0EwbabRbG9WmK7TqBbOofuvyNKGISTfMEhSQeGFd5bdCZwXxyoU4UCSjF/1c
         /IHQ==
X-Gm-Message-State: AOJu0YwaIuNF4lTxGv/VxnE0nXV5ev4CBFJj/Qt3eNmFm2eki6T2sGDy
	twVH42BB/i9exOrdvu540tI=
X-Google-Smtp-Source: AGHT+IHremZEvv9LCEmtm+PU6uzHWnQUFW1U8uWMvK4tn/Hp8UKQRwfSSupODZgYaunUn547sbLIVg==
X-Received: by 2002:adf:d00f:0:b0:336:ea07:af52 with SMTP id t15-20020adfd00f000000b00336ea07af52mr1458044wrh.20.1704652209789;
        Sun, 07 Jan 2024 10:30:09 -0800 (PST)
Received: from Ansuel-xps. (host-80-116-159-187.retail.telecomitalia.it. [80.116.159.187])
        by smtp.gmail.com with ESMTPSA id e18-20020adfe7d2000000b003367a5b6b69sm5877811wrn.106.2024.01.07.10.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 10:30:09 -0800 (PST)
Message-ID: <659aedb1.df0a0220.35691.1853@mx.google.com>
X-Google-Original-Message-ID: <ZZrtsH3gQBjP7xxW@Ansuel-xps.>
Date: Sun, 7 Jan 2024 19:30:08 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc: Robert Marko <robert.marko@sartura.hr>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	Rob Herring <robh+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next PATCH RFC v3 1/8] dt-bindings: net: document ethernet
 PHY package nodes
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
 <20231126015346.25208-2-ansuelsmth@gmail.com>
 <0926ea46-1ce4-4118-a04c-b6badc0b9e15@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0926ea46-1ce4-4118-a04c-b6badc0b9e15@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240107_103012_783251_A385F61E 
X-CRM114-Status: GOOD (  46.55  )
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

On Sun, Jan 07, 2024 at 08:00:33PM +0200, Sergey Ryazanov wrote:
> Hi Christian and Robert,
> 
> thank you for this great work!
> 
> Let me ask a couple of questions regarding the phy package conception.
> Please find them below.
> 
> On 26.11.2023 03:53, Christian Marangi wrote:
> > Document ethernet PHY package nodes used to describe PHY shipped in
> > bundle of 4-5 PHY. The special node describe a container of PHY that
> > share common properties. This is a generic schema and PHY package
> > should create specialized version with the required additional shared
> > properties.
> > 
> > Example are PHY package that have some regs only in one PHY of the
> > package and will affect every other PHY in the package, for example
> > related to PHY interface mode calibration or global PHY mode selection.
> > 
> > The PHY package node MUST declare the base address used by the PHY driver
> > for global configuration by calculating the offsets of the global PHY
> > based on the base address of the PHY package and declare the
> > "ethrnet-phy-package" compatible.
> > 
> > Each reg of the PHY defined in the PHY package node is absolute and will
> > reference the real address of the PHY on the bus.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >   .../bindings/net/ethernet-phy-package.yaml    | 75 +++++++++++++++++++
> >   1 file changed, 75 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml b/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
> > new file mode 100644
> > index 000000000000..244d4bc29164
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
> > @@ -0,0 +1,75 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/ethernet-phy-package.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Ethernet PHY Package Common Properties
> > +
> > +maintainers:
> > +  - Christian Marangi <ansuelsmth@gmail.com>
> > +
> > +description:
> > +  This schema describe PHY package as simple container for
> > +  a bundle of PHYs that share the same properties and
> > +  contains the PHYs of the package themself.
> > +
> > +  Each reg of the PHYs defined in the PHY package node is
> > +  absolute and describe the real address of the PHY on the bus.
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^ethernet-phy-package(@[a-f0-9]+)?$"
> > +
> > +  compatible:
> > +    const: ethernet-phy-package
> > +
> > +  reg:
> > +    minimum: 0
> > +    maximum: 31
> > +    description:
> > +      The base ID number for the PHY package.
> > +      Commonly the ID of the first PHY in the PHY package.
> > +
> > +      Some PHY in the PHY package might be not defined but
> > +      still exist on the device (just not attached to anything).
> > +      The reg defined in the PHY package node might differ and
> > +      the related PHY might be not defined.
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +patternProperties:
> > +  ^ethernet-phy(@[a-f0-9]+)?$:
> > +    $ref: ethernet-phy.yaml#
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: true
> > +
> > +examples:
> > +  - |
> > +    mdio {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        ethernet-phy-package@16 {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +            compatible = "ethernet-phy-package";
> > +            reg = <0x16>;
> > +
> > +            ethernet-phy@16 {
> > +              reg = <0x16>;
> > +            };
> > +
> > +            phy4: ethernet-phy@1a {
> > +              reg = <0x1a>;
> > +            };
> > +        };
> > +    };
> 
> So, we ended up on a design where we use the predefined compatible string
> 'ethernet-phy-package' to recognize a phy package inside the
> of_mdiobus_register() function. During the V1 discussion, Vladimir came up
> with the idea of 'ranges' property usage [1]. Can we use 'ranges' to
> recognize a phy package in of_mdiobus_register()? IMHO this will give us a
> clear DT solution. I mean 'ranges' clearly indicates that child nodes are in
> the same address range as the parent node. Also we can list all child
> addresses in 'reg' to mark them occupied.
> 
>   mdio {
>     ...
> 
>     ethernet-phy-package@16 {
>       compatible = "qcom,qca8075";
>       reg = <0x16>, <0x17>, <0x18>, <0x19>, <0x1a>;
>       ranges;
>       ...
> 
>       ethernet-phy@16 {
>         reg = <0x16>;
>       };
> 
>       ethernet-phy@1a {
>         reg = <0x1a>;
>       };
>     };
>   };
> 
> Did you find some issues with the 'ranges' conception?
>

Nope it's ok but it might pose some confusion with the idea that the
very first element MUST be THE STARTING ADDR of the PHY package. (people
might think that it's just the list of the PHYs in the package and
remove the hardware unconnected ones... but that would be fault of who
write the DT anyway.)

> 
> And I would like to ask you about another issue raised by Vladimir [1].
> These phy chips become SoC with all these built-in PHYs, PCSs, clocks,
> interrupt controllers, etc. Should we address this now? Or should we go with
> the proposed solution for now and postpone modeling of other peripherals
> until we get a real hardware, as Andrew suggested?
> 

Honestly I would postpone untile we have a clear idea of what is
actually part of the PHY and what can be handled externally... Example
setting the clock in gcc, writing a specific driver...

It's a random idea but maybe most of the stuff required for that PHY is
just when it's connected to a switch... In that case it would all be
handled in the switch driver (tobe extended qca8k) and all these extra
stuff would be placed in that node instead of bloating phy nodes with
all kind of clk and other stuff.

This series still require 2 more series (at803x splint and cleanup) to be
actually proposed so we have some time to better define this.

What do you think?

> I'm asking because it looks like we have got a real hardware. Luo currently
> trying to push QCA8084 (multi-phy/switch chip) support, and this chip
> exactly contains a huge clock/reset controller [2,3].
> 
> 
> 1. https://lore.kernel.org/lkml/20231124165923.p2iozsrnwlogjzua@skbuf // Re:
> [net-next RFC PATCH 03/14] dt-bindings: net: document ethernet PHY package
> nodes
> 2. https://lore.kernel.org/lkml/20231215074005.26976-1-quic_luoj@quicinc.com
> // [PATCH v8 00/14] add qca8084 ethernet phy driver
> 3. https://lore.kernel.org/lkml/20231104034858.9159-1-quic_luoj@quicinc.com
> // [PATCH v12 0/4] add clock controller of qca8386/qca8084
> 
> --
> Sergey

-- 
	Ansuel

