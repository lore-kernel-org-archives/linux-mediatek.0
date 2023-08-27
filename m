Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4717C83F01
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Aug 2023 12:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCurG7EiXOpcbLCR4TUbQeAiKwAmoGuhZx2dhx9/0sA=; b=E0iG5JWKnQ5fc8ha21AUWqqin/
	dWJLvKjMx36mICvoLEW3dBr3kemf5z6rLoc4ke7WC4MTn25drP3vRf1X+l9NRPmjhnml5oPRlLtMF
	ElOmzUk7aWpNzopaBpSSkQemKbeKAb/dIWkDku4CnisgUBCbP0X2CfNpbt79jxFDQftySIOu07l8b
	AitokzZPqc923BPkdti9jCYrEp/2Bjl06sxzlkkiA93BSx7fXFJ+jN+En83tzwkrlZk+RI8jje74n
	hpjtgIBBIZav6jKQeWR0bnLA4j3vl5YYuOzIWgZsyERWYOVd4ukOjupmIweqMufOWSuJOHEgI9uFX
	SFXg4XHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaEdN-0080sx-21;
	Sun, 27 Aug 2023 12:12:49 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaEdK-0080rs-14;
	Sun, 27 Aug 2023 12:12:48 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99bf3f59905so290450466b.3;
        Sun, 27 Aug 2023 05:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693138359; x=1693743159;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RCurG7EiXOpcbLCR4TUbQeAiKwAmoGuhZx2dhx9/0sA=;
        b=HtjeyrZ4lojdUAg3Txa0h0O5L91zjO7ymVE1ef0AyO8e/aGP5zTVMNpfGF7+LDSnBa
         fncjaKQCn5OA1m3yrdGfh7drEq3rXIQqCMNJ4PIv910k5gATRtCPU9loCNPUPEgjkrGZ
         OrsASSz8UvbYD4O+0jg4IO0+ObeP6tS7o9871dWeoN7YTcQJHz8vRJeJErLBW7Azoi/E
         imguyhk40te3Tlcg07GfszeQUDQHfBTkkFDuXLkrddeLifYiRx2gF46WkVxZ00T9tXxa
         Mg7aOu9q+cbxyi1O/qwqVQe7ehh2w4xsrBiotobkMv3ys1sXETeqQTVGFZgY9Gfyv1UQ
         x8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693138359; x=1693743159;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RCurG7EiXOpcbLCR4TUbQeAiKwAmoGuhZx2dhx9/0sA=;
        b=i4IUOUwdZrGWBgHaXclftgE/j94brnMEvBI4j0ubQgGqcbIpCaCOMIW/ZHmC8gY4jE
         VH3xOuV/64D/lpqXmxswVPgGO5JwHgHTBA6qLEsVClKgPHytDNhvsiWy2D7i/wYYujfq
         iFXVE6cu0ianSUCuOMZV9TF+HbdKFhfGz3PH5ykRSSLsgXrUwUv/pdgNkPCb711rEVNN
         /oPX3wubowk16vmw6/580MEY/KieUWTMBCNMik0kwAWBc/bBTEtWbAHTEkGQcnZlrpf2
         2IGTiQHAJ2p7rCVYG+oeFLASKG/y54ArQ2ldkMy+KiGFc9m8GKHcGXsQ0pMdqudZKMRH
         slKQ==
X-Gm-Message-State: AOJu0YwqbDKtE7CDK4GmN3rArX64Rgw5le40+ZSvIOmEPl12DsZsH4MC
	jyiElaHPN0IW1Yr+Eiq9puk=
X-Google-Smtp-Source: AGHT+IHehkwrhlMrAADoPpjGw9+zluW5ilr5AWfaQipKTWo/6VAIduktcVysamezUCpLRUCXr+MS9A==
X-Received: by 2002:a17:906:3295:b0:9a1:9cc5:ea5f with SMTP id 21-20020a170906329500b009a19cc5ea5fmr14484474ejw.7.1693138359151;
        Sun, 27 Aug 2023 05:12:39 -0700 (PDT)
Received: from skbuf ([188.27.184.87])
        by smtp.gmail.com with ESMTPSA id q5-20020a1709064c8500b00993928e4d1bsm3332196eju.24.2023.08.27.05.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 05:12:38 -0700 (PDT)
Date: Sun, 27 Aug 2023 15:12:35 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/4] dt-bindings: net: dsa: document internal MDIO bus
Message-ID: <20230827121235.zog4c3ehu2cyd3jy@skbuf>
References: <20230812091708.34665-3-arinc.unal@arinc9.com>
 <abc44324-454c-4524-b05e-fe989755ea47@arinc9.com>
 <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
 <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
 <20230813112026.ohsx6srbt2staxma@skbuf>
 <8a8e14f1-0493-4298-a2cc-6e7ae7929334@arinc9.com>
 <20230813190157.4y3zoro53qsz43pe@skbuf>
 <f5f468c1-b5a2-4336-b1d9-fd82da95b21d@arinc9.com>
 <20230814143601.mnpxtcm2zybnbvoh@skbuf>
 <0cee0928-74c9-4048-8cd8-70bfbfafd9b2@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0cee0928-74c9-4048-8cd8-70bfbfafd9b2@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_051246_413271_01F59597 
X-CRM114-Status: GOOD (  62.00  )
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

Hi Arınç,

I am on vacation and I will just reply with some clarification aspects,
without having done any further research on the topic since my last reply.

On Sun, Aug 27, 2023 at 11:33:16AM +0300, Arınç ÜNAL wrote:
> Before I continue commenting, I'd like to state my understanding so we can
> make sure we're on the same page. If a driver doesn't use
> ds->slave_mii_bus, the switch it controls must not have any internal MDIO
> buses. Otherwise the PHYs on these buses couldn't function, and an improper
> driver like this would not be on the official Linux source code.

A DSA switch port, like any OF-based ethernet-controller which uses
phylink, will use one of the phy-handle, fixed-link or managed properties
to describe the interface connecting the MAC/MAC-side PCS to the PHY.

At its core, ds->slave_mii_bus is nothing more than a mechanism to make
sense of device trees where the above 3 phylink properties are not present.

It is completely false to say that if a driver doesn't have ds->slave_mii_bus,
it must not have an internal MDIO bus. Because you could still describe
that internal MDIO bus like below, without making any use of the sole property
that makes ds->slave_mii_bus useful from a dt-bindings perspective.

ethernet-switch {
	ethernet-ports {
		port@0 {
			reg = <0>;
			phy-handle = <&port0_phy>;
			phy-mode = "internal";
		};
	};

	mdio {
		port0_phy: ethernet-phy@0 {
			reg = <0>;
		};
	};
};

This is the more universal way of describing the port setup in an
OF-based way. There is also the DSA-specific (and old-style, before phylink)
way of describing the same thing, which relies on the non-OF-based
ds->slave_mii_bus, with bindings that look like this:

ethernet-switch {
	ethernet-ports {
		port@0 {
			reg = <0>;
		};
	};
};

But, I would say that the first variant of the binding is preferable,
since it is more universal.

Not all switches that have an internal MDIO bus support the second
variant of the dt-binding (the ones that don't have ds->slave_mii_bus don't).
But, they support the same configuration through the first form.

Furthermore, on the U-Boot mailing lists, I have been suggesting that
the DM_DSA driver for mv88e6xxx should not bother to support the second
version of the binding, since it is just more code to be added to handle
a case which can already be described with the more universal first binding.

> I've checked mscc,vsc7514-switch. What I see is, the architecture is an SoC
> with a switch component. Since the switch component is not designed to be a
> standalone IC, the MDIO bus of the SoC could just as well be used without
> the need to design an MDIO controller specific to the switch component, to
> manage the PHYs. So I see this switch as just another case of a switch
> without an internal MDIO bus.

Well, we need to clarify the semantics of an "internal" MDIO bus.

I would say most discrete chips with DSA switches have this SoC-style
architecture, with separate address spaces for the switching IP, MDIO
bus, GPIO controller, IRQ controllers, temperature sensors etc (see
"mscc,vsc7512-switch" which is like "mscc,vsc7514-switch", but it is
controlled over SPIO instead of MMIO). The dt-bindings of most DSA
switches may or may not reflect that discrete chip organization. Those
drivers and dt-bindings could be reimagined so that DSA is not the
top-level driver.

Yet, I would argue that it's wrong to say that because it isn't an OF
child of the switch, the MDIO bus of the VSC7514 is not internal in the
same way that the Realtek MDIO bus is internal. The switch ports are
connected to internal PHYs on this MDIO bus, and there aren't PHYs on
this MDIO bus that go to other MACs than the switch ports. So, the
VSC7514 MDIO bus could legally be called the internal MDIO bus of the
switch, even if there isn't a parent/child relationship between them.

So, what I'm disagreeing with is your insistence to correlate your
problem with internal MDIO buses. The way in which the problem is
formulated dictates what problem gets solved, and the problem is not
correctly formulated here. It is purely about ds->slave_mii_bus and its
driver-defined OF presence/absence. It is a DSA-specific binding aspect
which not even all DSA switches inherit, let alone bindings outside DSA.

> > For switches in the second category, it all depends on the way in which
> > the driver finds the node for of_mdiobus_register().
> 
> Ok, so some drivers require the mdio child node. Some require it and the
> compatible property with a certain string.
> 
> MDIO controlled Realtek switches do not need the compatible property under
> the mdio child node. There're no compatible strings to make a distinction
> between the SMI and MDIO controlled switches so the best we can do is keep
> it the way it currently is. Define realtek,smi-mdio as a compatible string
> but keep the compatible property optional. I did state this on my reply to
> patch 3 but still received reviewed-bys regardless.

Yes, because.... [1]

> > Having identified all switches which make some sort of use of
> > ds->slave_mii_bus, the rule would sound like this:
> > 
> > 1. If the schema is that of (need to replace this with compatible
> >     strings, I'm too lazy for that):
> > 
> >     - ksz_switch_ops
> >     - mv88e6060_switch_ops
> >     - lan9303_switch_ops
> >     - rtl8365mb_switch_ops_mdio
> >     - b53_switch_ops
> >     - vsc73xx_ds_ops
> >     - mv88e6xxx
> >     - qca8k
> > 
> >     and we have an "mdio" child, then phylink bindings are mandatory on user ports.
> > 
> > 2. If the schema is that of gswip_mdio and we have a child node of "lantiq,xrx200-mdio",
> >     then phylink bindings are mandatory on user ports (I haven't checked,
> >     but it might be that the "lantiq,xrx200-mdio" child is mandatory, and
> >     in that case, this goes to category 4 below).
> > 
> > 3. If the schema is that of realtek_smi_setup_mdio and we have a child node of
> >     "realtek,smi-mdio", then phylink bindings are mandatory on user ports
> >     (same comment about the child MDIO note maybe being mandatory).
> > 
> > 4. If the switch didn't appear in the above set of rules, then phylink
> >     bindings are unconditionally mandatory on user ports.
> > 
> > We don't care at all what the drivers that don't use ds->slave_mii_bus
> > do with the "mdio" child node. It doesn't change the fact that their
> > user ports can't have missing phylink bindings.
> 
> I partially agree. I say, for the switches without an internal MDIO bus,
> invalidate the mdio child node, and enforce the phylink bindings on the
> user ports. Such as mscc,vsc7514-switch and nxp,sja1105x. For nxp,sja1110x,
> invalidate the mdio child node, and enforce the phylink bindings on the
> user ports if the mdios property is used.

Why "if the mdios property is used" and not "always"? :-/

To say it again: because the sja1105 driver does not use ds->slave_mii_bus,
it can make no sense of dt-bindings on user ports which lack phylink properties.
So they are *always* needed. The "mdios" property changes nothing in that regard.

> 
> I'd like to add this before I conclude. The way I understand dt-bindings is
> that a binding does not have to translate to an action on the driver.
> Documenting bindings for the sole purpose of describing hardware is a valid
> case.

[1] ...this. The SMI-controlled and MDIO-controlled Realtek switches are
otherwise the same, right? So why would they have different dt-bindings?

> For example, currently, the MT753X DSA subdriver won't, in any way,
> register the bus OF-based. Still, the mdio property for the switches which
> this driver controls can be documented because the internal mdio bus does
> exist on the hardware.

It can, but the whole point is: if ds->slave_mii_bus gains an OF presence,
then it loses its core functionality (that user ports can lack phylink
bindings). This is the entire essence of what this discussion should capture.

> 
> So I'd like to keep the mdio property valid for the switches which their
> drivers can only register non-OF-based ds->slave_mii_bus.
> 
> In conclusion, what to do:
> 
> - Define "the mdio property" and "the enforcement of phylink bindings for
>   user ports if mdio property is used" on ethernet-switch.yaml.
>     - Invalidate the mdio property on the switches without an internal MDIO
>       bus.
> - Define "the enforcement of phylink bindings for user ports" on the
>   switches without an internal MDIO bus.
> - Require "the mdio property" for the switches which their driver requires
>   it to function.
> - Require "the mdio property" and "the compatible string of the mdio
>   property" for the switches which their driver requires them to function.
> 
> There's no 1:1 switch to switch compatible string relation, as seen on
> Realtek switches so I'll have to figure that out as I go.
> 
> I'm open to your comments to this mail but the gap between discussion and
> end result has widened a lot on this patch series so I'd like to first
> offload this conversation by preparing v2 with what I said here and discuss
> further there.

Honestly, from my side, a verbal comment in the dt-bindings document
would have been just fine, as long as it is truthful to the reality it
describes.

You wanted to over-complicate things with an actual schema validation,
and then hooking onto things that are unrelated with the phenomenon that
needs to be captured (like the "mdio" child node, without explicit
regard to whether it is the ds->slave_mii_bus or not).

It's not about internal MDIO buses in general, it's about whether those
internal MDIO buses are used in ds->slave_mii_bus, and their OF
presence/absence! That is absolutely driver-specific and I would only
expect a driver-specific way of enforcing it. I didn't say it's not
hard, and I didn't ask to enforce it, either.

