Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DDDC77B73
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Apr 2023 12:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLwoKVwfNehyOtDTkDywpN8nfCU7YXNlzmr3ME2nc3I=; b=ye6YPnydtmd0joYx201c0HopT7
	eJQhYd0f4Ec/9agW0cdvYIei2PtgQ9HOYrwv8w8ta1HyZ4vtVfd6Cp8Ompl3eKrp5jWQ9vG3d3Fyb
	fOLrV/BCle2dy+mmRSCpxFF3zCcio0Zizet+mJ7xG21XmAfhX/vZshP3aphRnXYZmdmP42pxQyhZ6
	0P5qoNAx5kiQ969cCSpRoJSnKSWIx68PVQH6u0COkqgX5+/XdZu7ysQCHyrwKs93BA1Lq4CbT+A2p
	6VdEwF7zq13dVCxlWnpzoksTGzATneeUW1scJZVMgv1c6nCkK6DmMPBTswLrlhzgBPsOLPF43mFWB
	IBo70Z6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pt6Q3-00EAj0-1C;
	Sun, 30 Apr 2023 12:44:47 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pt6Q0-00EAh4-00;
	Sun, 30 Apr 2023 12:44:45 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pt6PZ-0003Fb-2r;
	Sun, 30 Apr 2023 14:44:18 +0200
Date: Sun, 30 Apr 2023 13:44:12 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: David Bauer <mail@david-bauer.net>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-bindings: net: dsa: mediatek,mt7530: document
 MDIO-bus
Message-ID: <ZE5inBwZrOE-9uyA@makrotopia.org>
References: <20230430112834.11520-1-mail@david-bauer.net>
 <20230430112834.11520-2-mail@david-bauer.net>
 <e4feeac2-636b-8b75-53a5-7603325fb411@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e4feeac2-636b-8b75-53a5-7603325fb411@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230430_054444_036704_434FA389 
X-CRM114-Status: GOOD (  24.37  )
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

On Sun, Apr 30, 2023 at 03:34:43PM +0300, Arınç ÜNAL wrote:
> On 30.04.2023 14:28, David Bauer wrote:
> > Document the ability to add nodes for the MDIO bus connecting the
> > switch-internal PHYs.
> 
> This is quite interesting. Currently the PHY muxing feature for the MT7530
> switch looks for some fake ethernet-phy definitions on the mdio-bus where
> the switch is also defined.
> 
> Looking at the binding here, there will be an mdio node under the switch
> node. This could be useful to define the ethernet-phys for PHY muxing here
> instead, so we don't waste the register addresses on the parent mdio-bus for
> fake things. It looks like this should work right out of the box. I will do
> some tests.
> 
> Are there any examples as to what to configure on the switch PHYs with this
> change?
> 
> > 
> > Signed-off-by: David Bauer <mail@david-bauer.net>
> > ---
> >   .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml        | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> > index e532c6b795f4..50f8f83cc440 100644
> > --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> > +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> > @@ -128,6 +128,12 @@ properties:
> >         See Documentation/devicetree/bindings/regulator/mt6323-regulator.txt for
> >         details for the regulator setup on these boards.
> > +  mdio:
> > +    $ref: /schemas/net/mdio.yaml#
> > +    unevaluatedProperties: false
> > +    description:
> > +      Node for the internal MDIO bus connected to the embedded ethernet-PHYs.
> 
> Please set this property as false for mediatek,mt7988-switch as it doesn't
> use MDIO.

Well, quite the opposite is true. This change is **needed** on MT7988 as
the built-in 1GE PHYs of the MT7988 are connected to the (internal) MDIO
bus of the switch. And they do need calibration data assigned as nvmem
via device tree.

tl;dr: Despite not being connected via MDIO itself also MT7988 exposes an
internal MDIO bus for the switch PHYs.

