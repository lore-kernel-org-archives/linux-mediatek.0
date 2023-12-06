Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D67FC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 12:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2HzggLs09lPUuy4v/Jz2bzC1BOm/VvGG+/yB1SORusA=; b=ywMuRe8OnmHnST7u9n0mHGL262
	do0cAbB1WBjMQP1cG8Gn1QEFoZuqUCBtqTiQWnmrioaMKVoE++GzKK2NMThaIyr8YCIV+XKFz/+kT
	OcxIQZGfYsxuHgZVgZymngWSi50BJZMZ/KrH9c1xqG7UBn9RfI+inHOJqal57NufjqOjFrnT/hII7
	hR7cRIJEfXHti2sHgNEjINbwpnhW+dH9ylCTCaykDR3SEzqKq6a5Yg4x37ksC/7UWKkiHKaZgC27L
	027xQoqy16zL+30y60bqcdR7K2u5eHfrONn2MVcG3WY3MI6349Qo7Wsi+TzLnX3xMTzhTVhyfpuae
	D6IMB7Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rArI8-00AIyD-0j;
	Wed, 06 Dec 2023 12:46:16 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rArI4-00AIv8-0C;
	Wed, 06 Dec 2023 12:46:13 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rArHf-0005kg-2z;
	Wed, 06 Dec 2023 12:45:49 +0000
Date: Wed, 6 Dec 2023 12:45:40 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: clock: mediatek: add clock
 controllers of MT7988
Message-ID: <ZXBs9GOOOlZrMuSW@makrotopia.org>
References: <23bc89d407e7797e97b703fa939b43bfe79296ce.1701823757.git.daniel@makrotopia.org>
 <def05aac79ddff872d3e56698b736cb445f14116.1701823757.git.daniel@makrotopia.org>
 <3e72bff6-9f4d-4cd4-845e-b065f1233ec6@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e72bff6-9f4d-4cd4-845e-b065f1233ec6@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_044612_103220_B0F17F06 
X-CRM114-Status: GOOD (  23.56  )
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
Cc: James Liao <jamesjj.liao@mediatek.com>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-clk@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, Sabrina Dubroca <sd@queasysnail.net>, Chen-Yu Tsai <wenst@chromium.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Garmin.Chang" <Garmin.Chang@mediatek.com>, Conor Dooley <conor+dt@kernel.org>, Sam Shih <sam.shih@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Jianhui Zhao <zhaojh329@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 06, 2023 at 11:59:54AM +0100, AngeloGioacchino Del Regno wrote:
> Il 06/12/23 01:57, Daniel Golle ha scritto:
> > Add various clock controllers found in the MT7988 SoC to existing
> > bindings (if applicable) and add files for the new ethwarp, mcusys
> > and xfi-pll clock controllers not previously present in any SoC.
> > 
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> > v3:
> >   * move clock bindings to clock folder
> >   * drop ti,syscon-reset from bindings and example
> >   * merge mcusys with topckgen bindings
> > 
> > v2:
> >   * dropped unused labels
> >   * add 'type: object' declaration for reset-controller found in new
> >     ethwarp controller and represented as ti,syscon-reset
> >   * rebase on top of
> >     "dt-bindings: arm: mediatek: move ethsys controller & convert to DT schema"
> > 
> >   .../arm/mediatek/mediatek,infracfg.yaml       |  1 +
> >   .../bindings/clock/mediatek,apmixedsys.yaml   |  1 +
> >   .../bindings/clock/mediatek,ethsys.yaml       |  1 +
> >   .../clock/mediatek,mt7988-ethwarp.yaml        | 49 +++++++++++++++++++
> >   .../clock/mediatek,mt7988-xfi-pll.yaml        | 48 ++++++++++++++++++
> >   .../bindings/clock/mediatek,topckgen.yaml     |  2 +
> >   .../bindings/net/pcs/mediatek,sgmiisys.yaml   | 13 +++--
> >   7 files changed, 112 insertions(+), 3 deletions(-)
> >   create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7988-ethwarp.yaml
> >   create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7988-xfi-pll.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
> > index ea98043c6ba3d..230b5188a88db 100644
> > --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
> > +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
> > @@ -30,6 +30,7 @@ properties:
> >                 - mediatek,mt7629-infracfg
> >                 - mediatek,mt7981-infracfg
> >                 - mediatek,mt7986-infracfg
> > +              - mediatek,mt7988-infracfg
> >                 - mediatek,mt8135-infracfg
> >                 - mediatek,mt8167-infracfg
> >                 - mediatek,mt8173-infracfg
> > diff --git a/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
> > index 372c1d744bc27..685535846cbb7 100644
> > --- a/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
> > +++ b/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
> > @@ -22,6 +22,7 @@ properties:
> >             - mediatek,mt7622-apmixedsys
> >             - mediatek,mt7981-apmixedsys
> >             - mediatek,mt7986-apmixedsys
> > +          - mediatek,mt7988-apmixedsys
> >             - mediatek,mt8135-apmixedsys
> >             - mediatek,mt8173-apmixedsys
> >             - mediatek,mt8516-apmixedsys
> > diff --git a/Documentation/devicetree/bindings/clock/mediatek,ethsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,ethsys.yaml
> > index 94d42c8647777..f9cddacc2eae1 100644
> > --- a/Documentation/devicetree/bindings/clock/mediatek,ethsys.yaml
> > +++ b/Documentation/devicetree/bindings/clock/mediatek,ethsys.yaml
> > @@ -22,6 +22,7 @@ properties:
> >                 - mediatek,mt7629-ethsys
> >                 - mediatek,mt7981-ethsys
> >                 - mediatek,mt7986-ethsys
> > +              - mediatek,mt7988-ethsys
> >             - const: syscon
> >         - items:
> >             - const: mediatek,mt7623-ethsys
> > diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7988-ethwarp.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7988-ethwarp.yaml
> > new file mode 100644
> > index 0000000000000..9b919a155eb13
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/mediatek,mt7988-ethwarp.yaml
> > @@ -0,0 +1,49 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7988-ethwarp.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek MT7988 ethwarp Controller
> > +
> > +maintainers:
> > +  - Daniel Golle <daniel@makrotopia.org>
> > +
> > +description:
> > +  The Mediatek MT7988 ethwarp controller provides clocks and resets for the
> > +  Ethernet related subsystems found the MT7988 SoC.
> > +  The clock values can be found in <dt-bindings/clock/mt*-clk.h>.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: mediatek,mt7988-ethwarp
> > +      - const: syscon
> > +      - const: simple-mfd
> 
> No, this is not a mfd, I say.
> 
> Prove me wrong! :-)

https://github.com/dangowrt/linux/blob/mt7988-for-next/arch/arm64/boot/dts/mediatek/mt7988a.dtsi#L564

The 'simple-mfd' compatible is required to have the Linux
kernel probe drivers for sub-nodes -- several drivers will act on
the different aspects of the circuit exposed at this memory range.
From what I understand, this is the definition of a MFD.

> 
> ..snip..
> 
> > diff --git a/Documentation/devicetree/bindings/net/pcs/mediatek,sgmiisys.yaml b/Documentation/devicetree/bindings/net/pcs/mediatek,sgmiisys.yaml
> > index 66a95191bd776..68632cda334bd 100644
> > --- a/Documentation/devicetree/bindings/net/pcs/mediatek,sgmiisys.yaml
> > +++ b/Documentation/devicetree/bindings/net/pcs/mediatek,sgmiisys.yaml
> > @@ -15,15 +15,22 @@ description:
> >   properties:
> >     compatible:
> > -    items:
> > -      - enum:
> > +    oneOf:
> > +      - items:
> > +        - enum:
> >             - mediatek,mt7622-sgmiisys
> >             - mediatek,mt7629-sgmiisys
> >             - mediatek,mt7981-sgmiisys_0
> >             - mediatek,mt7981-sgmiisys_1
> >             - mediatek,mt7986-sgmiisys_0
> >             - mediatek,mt7986-sgmiisys_1
> > -      - const: syscon
> > +        - const: syscon
> > +      - items:
> > +        - enum:
> > +          - mediatek,mt7988-sgmiisys_0
> > +          - mediatek,mt7988-sgmiisys_1
> > +        - const: syscon
> > +        - const: simple-mfd
> 
> Same.
> 
> Cheers,
> Angelo

