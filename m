Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E2CC47073
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Jan 2024 21:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGQrMzQwX3MNC9JbNg8EA6tHHf/BKd21HsDSgP8Zeb0=; b=3WgowoTZ2LXZnrZtd4n9ksFvS+
	aKvydEVU5KwHtlW970+rG33s3ECah6DFOvOjupXGNmehkdpylMvdnAqtSWbHS4MJ+txa50jL7KS4E
	y2Q8MAqGnqn1/b7ffSh/2jhFcY0gmkiCjx+3tp4IjM5meazqwdkHvYdwyYxvpdcR4ArE0ja5g17Vt
	E5aP66e5FEcOguqqTpAA1ht1vzxqMNAWG6VNMLkhFUUqxZcfMiUGFn9nk9SqsjCVATOXMdbJPrBJD
	aPiUhXkkcBWfx/wG/4ETPBt5HrDBRnKN0trrAoX0Fi/lj/B4qs3VufoAy2hLQ9BOO1zlq1YHQBmcw
	FesXP+aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMb82-003dUW-35;
	Sun, 07 Jan 2024 21:56:22 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMb7z-003dTz-1Z;
	Sun, 07 Jan 2024 21:56:21 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40e43e48a16so7862335e9.2;
        Sun, 07 Jan 2024 13:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704664577; x=1705269377; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yGQrMzQwX3MNC9JbNg8EA6tHHf/BKd21HsDSgP8Zeb0=;
        b=J6UVBSF3foO2NA9UlutS8NLDV1NM9wwtsbooSA0iLe2gXKjkhX7bU42udfigUZEpEG
         cvQqqqcOfwLo+oHa0Bso5bLKu9vv1rPxUNv4hrDxNLRtoUUnMgEXssvUJlMJ5WGiUBcU
         MxNrThGJDmTtdBQ2UngZNQWlMQwwXAJ+j7MqPzs/7gbM1M359BF8rL3pmGQKsgbsY3f8
         xIfZ7EAjLK+hXlZxcglJZX/6UqXjoSAF6LEsYXRfUL7rEDPgwdwp5D/s2tBVYiIgJx7H
         q+2uD9aVC4Mq6EQ6rGK81C/ZI/uNRuG8l3jYD3T4+qnhK4pRtOjhikrIsYyy7GzLttZX
         2bLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704664577; x=1705269377;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGQrMzQwX3MNC9JbNg8EA6tHHf/BKd21HsDSgP8Zeb0=;
        b=nzb26DKEztsiChwDMqyy8NunnMf25uvb++S9QYkqnTWrkYvstUIdKuky87wx2RBW0L
         xUSt2PYt6VXE+IStm0X7/J1/zit9siONzy4cqHtb2VZQQORab3zNVNhJNo+9l4rNYzK4
         zl0ZJn8+gh97EhpO3QMP5QJwWwH4XQT2Dp4SyAfmWojoNNnzDwW0f4pzNmRSRbD2g+ng
         X3bssInP51WW8/aCjIcWCv3loCufCkqbWbFQDwvIaOiPpa/Mhv4UwX3FX23IbSWgZrAc
         xp6HQqVH8gIVNGiVvUPLrBOUe/VbkH8H93T2Cz+oN5F2kWSVVPhFFZIJqDDzD48L8hN3
         lfYg==
X-Gm-Message-State: AOJu0Yzkr6RTs/Z4vFF5qSLbJY2BajjczsFvrzIA2mv6snwGxBUcGVkI
	DULG8E1pkpkZK4l6TDtGdlY=
X-Google-Smtp-Source: AGHT+IFakyNMH8G9SPyri+zfxnohlZ+ZcaDcznmCmQmTQnvJni921zfAca1Y8hoHWTgEIqykmPKB5w==
X-Received: by 2002:a05:600c:5407:b0:40e:4358:cd60 with SMTP id he7-20020a05600c540700b0040e4358cd60mr859060wmb.21.1704664577192;
        Sun, 07 Jan 2024 13:56:17 -0800 (PST)
Received: from Ansuel-xps. (host-80-116-159-187.retail.telecomitalia.it. [80.116.159.187])
        by smtp.gmail.com with ESMTPSA id jb13-20020a05600c54ed00b0040d86e89abfsm8675217wmb.43.2024.01.07.13.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 13:56:16 -0800 (PST)
Message-ID: <659b1e00.050a0220.ba6d3.9ff3@mx.google.com>
X-Google-Original-Message-ID: <ZZsbbXz5MRUjR8MT@Ansuel-xps.>
Date: Sun, 7 Jan 2024 22:45:17 +0100
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
 <659aedb1.df0a0220.35691.1853@mx.google.com>
 <0f4ec2ff-4ef7-4667-adef-d065cfbc0a91@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f4ec2ff-4ef7-4667-adef-d065cfbc0a91@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240107_135619_549733_CCEF7B29 
X-CRM114-Status: GOOD (  55.83  )
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

On Sun, Jan 07, 2024 at 11:49:12PM +0200, Sergey Ryazanov wrote:
> Hi Christian,
> 
> On 07.01.2024 20:30, Christian Marangi wrote:
> > On Sun, Jan 07, 2024 at 08:00:33PM +0200, Sergey Ryazanov wrote:
> > > On 26.11.2023 03:53, Christian Marangi wrote:
> > > > Document ethernet PHY package nodes used to describe PHY shipped in
> > > > bundle of 4-5 PHY. The special node describe a container of PHY that
> > > > share common properties. This is a generic schema and PHY package
> > > > should create specialized version with the required additional shared
> > > > properties.
> > > > 
> > > > Example are PHY package that have some regs only in one PHY of the
> > > > package and will affect every other PHY in the package, for example
> > > > related to PHY interface mode calibration or global PHY mode selection.
> > > > 
> > > > The PHY package node MUST declare the base address used by the PHY driver
> > > > for global configuration by calculating the offsets of the global PHY
> > > > based on the base address of the PHY package and declare the
> > > > "ethrnet-phy-package" compatible.
> > > > 
> > > > Each reg of the PHY defined in the PHY package node is absolute and will
> > > > reference the real address of the PHY on the bus.
> > > > 
> > > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > > ---
> > > >    .../bindings/net/ethernet-phy-package.yaml    | 75 +++++++++++++++++++
> > > >    1 file changed, 75 insertions(+)
> > > >    create mode 100644 Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml b/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
> > > > new file mode 100644
> > > > index 000000000000..244d4bc29164
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
> > > > @@ -0,0 +1,75 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/net/ethernet-phy-package.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Ethernet PHY Package Common Properties
> > > > +
> > > > +maintainers:
> > > > +  - Christian Marangi <ansuelsmth@gmail.com>
> > > > +
> > > > +description:
> > > > +  This schema describe PHY package as simple container for
> > > > +  a bundle of PHYs that share the same properties and
> > > > +  contains the PHYs of the package themself.
> > > > +
> > > > +  Each reg of the PHYs defined in the PHY package node is
> > > > +  absolute and describe the real address of the PHY on the bus.
> > > > +
> > > > +properties:
> > > > +  $nodename:
> > > > +    pattern: "^ethernet-phy-package(@[a-f0-9]+)?$"
> > > > +
> > > > +  compatible:
> > > > +    const: ethernet-phy-package
> > > > +
> > > > +  reg:
> > > > +    minimum: 0
> > > > +    maximum: 31
> > > > +    description:
> > > > +      The base ID number for the PHY package.
> > > > +      Commonly the ID of the first PHY in the PHY package.
> > > > +
> > > > +      Some PHY in the PHY package might be not defined but
> > > > +      still exist on the device (just not attached to anything).
> > > > +      The reg defined in the PHY package node might differ and
> > > > +      the related PHY might be not defined.
> > > > +
> > > > +  '#address-cells':
> > > > +    const: 1
> > > > +
> > > > +  '#size-cells':
> > > > +    const: 0
> > > > +
> > > > +patternProperties:
> > > > +  ^ethernet-phy(@[a-f0-9]+)?$:
> > > > +    $ref: ethernet-phy.yaml#
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +
> > > > +additionalProperties: true
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    mdio {
> > > > +        #address-cells = <1>;
> > > > +        #size-cells = <0>;
> > > > +
> > > > +        ethernet-phy-package@16 {
> > > > +            #address-cells = <1>;
> > > > +            #size-cells = <0>;
> > > > +            compatible = "ethernet-phy-package";
> > > > +            reg = <0x16>;
> > > > +
> > > > +            ethernet-phy@16 {
> > > > +              reg = <0x16>;
> > > > +            };
> > > > +
> > > > +            phy4: ethernet-phy@1a {
> > > > +              reg = <0x1a>;
> > > > +            };
> > > > +        };
> > > > +    };
> > > 
> > > So, we ended up on a design where we use the predefined compatible string
> > > 'ethernet-phy-package' to recognize a phy package inside the
> > > of_mdiobus_register() function. During the V1 discussion, Vladimir came up
> > > with the idea of 'ranges' property usage [1]. Can we use 'ranges' to
> > > recognize a phy package in of_mdiobus_register()? IMHO this will give us a
> > > clear DT solution. I mean 'ranges' clearly indicates that child nodes are in
> > > the same address range as the parent node. Also we can list all child
> > > addresses in 'reg' to mark them occupied.
> > > 
> > >    mdio {
> > >      ...
> > > 
> > >      ethernet-phy-package@16 {
> > >        compatible = "qcom,qca8075";
> > >        reg = <0x16>, <0x17>, <0x18>, <0x19>, <0x1a>;
> > >        ranges;
> > >        ...
> > > 
> > >        ethernet-phy@16 {
> > >          reg = <0x16>;
> > >        };
> > > 
> > >        ethernet-phy@1a {
> > >          reg = <0x1a>;
> > >        };
> > >      };
> > >    };
> > > 
> > > Did you find some issues with the 'ranges' conception?
> > 
> > Nope it's ok but it might pose some confusion with the idea that the
> > very first element MUST be THE STARTING ADDR of the PHY package. (people
> > might think that it's just the list of the PHYs in the package and
> > remove the hardware unconnected ones... but that would be fault of who
> > write the DT anyway.)
> 
> Make sense. I do not insist on addresses listing. Mainly I'm thinking of a
> proper way to show that child nodes are accessible directly on the parent
> bus, and introducing the special compatibility string, while we already have
> the 'ranges' property.
> 
> But it's good to know Rob's opinion on whether it is conceptually right to
> use 'ranges' here.
>

I like the ideas of ranges and I will try to propose it... Another idea
might be declare something like <0x16 0x4> where the additional cell
would declare the amount of address occupiaed by the package. But I
think your way is much better and less ""custom"". Yes would also love
some feedback from Rob about this.

> > > And I would like to ask you about another issue raised by Vladimir [1].
> > > These phy chips become SoC with all these built-in PHYs, PCSs, clocks,
> > > interrupt controllers, etc. Should we address this now? Or should we go with
> > > the proposed solution for now and postpone modeling of other peripherals
> > > until we get a real hardware, as Andrew suggested?
> > 
> > Honestly I would postpone untile we have a clear idea of what is
> > actually part of the PHY and what can be handled externally... Example
> > setting the clock in gcc, writing a specific driver...
> > 
> > It's a random idea but maybe most of the stuff required for that PHY is
> > just when it's connected to a switch... In that case it would all be
> > handled in the switch driver (tobe extended qca8k) and all these extra
> > stuff would be placed in that node instead of bloating phy nodes with
> > all kind of clk and other stuff.
> > 
> > This series still require 2 more series (at803x splint and cleanup) to be
> > actually proposed so we have some time to better define this.
> > 
> > What do you think?
> 
> Fair enough! Let's postpone until we really need it. I noticed this
> PHY-like-SoC discussion in the V1 comments, and it was not finished there
> neither addressed in the latest patch comment. So I asked just to be sure
> that we were finished with this. Thank you for the clarification.
> 
> --
> Sergey
> 

-- 
	Ansuel

