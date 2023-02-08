Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE98DC05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 22:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=suNzSxczO5R4+ezF8SjRKGZxfNaOCi6nf8oTJ/dczhQ=; b=ToHcxmmUk+E0Gp+fVp6xNNPkvf
	Xpkfn29salZOGBUdyK/t5l519FoVf4+dDnAslTbeKtc8qCXh9vBYxc76C5M8e9JUAijIs6lD8abOr
	3V6M20UGyjT6hZaZWHv2dUSFR9VKEi7Ngn/6GEFjKnXDXzWDwtMs5zcxbjdV01pwbFlZjxsNlFiC7
	J0aEqAznnkD1G50f8KSena6cyVQJMKPTGQUT63Iooxy60pmyEZLKGci8jTRQLzXSN7lL3MrxaUUd1
	HSM1wpP4KG29jR2Rx5lw6sN4cv518J1m+up3R8Ljdtvf78iAiYHstvdAGQhIc46zg7ai5Mkj9tynV
	XDpI3oZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPsyV-00H5Po-6X; Wed, 08 Feb 2023 22:31:35 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPsyS-00H5NG-4m; Wed, 08 Feb 2023 22:31:33 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pPsyA-0007y7-1W;
	Wed, 08 Feb 2023 23:31:14 +0100
Date: Wed, 8 Feb 2023 22:30:52 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Jianhui Zhao <zhaojh329@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Subject: Re: [PATCH v2 03/11] dt-bindings: arm: mediatek: add
 'mediatek,pn_swap' property
Message-ID: <Y+QinJ9W8hIIF9Ni@makrotopia.org>
References: <cover.1675779094.git.daniel@makrotopia.org>
 <a8c567cf8c3ec6fef426b64fb1ab7f6e63a0cc07.1675779094.git.daniel@makrotopia.org>
 <ad09a065-c10d-3061-adbe-c58724cdfde0@kernel.org>
 <Y+KR26aepqlfsjYG@makrotopia.org>
 <b6d782ef-b375-1e73-a384-1ff37c1548a7@kernel.org>
 <Y+Oo9HaqPeNVUANR@makrotopia.org>
 <514ec4b8-ef78-35c1-2215-22884fca87d4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <514ec4b8-ef78-35c1-2215-22884fca87d4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_143132_207143_8C8C04CE 
X-CRM114-Status: GOOD (  44.38  )
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

Hi Krzysztof,

thank you for taking the time to review and explain.

On Wed, Feb 08, 2023 at 09:08:40PM +0100, Krzysztof Kozlowski wrote:
> On 08/02/2023 14:51, Daniel Golle wrote:
> > On Wed, Feb 08, 2023 at 10:32:53AM +0100, Krzysztof Kozlowski wrote:
> >> On 07/02/2023 19:00, Daniel Golle wrote:
> >>> ...
> >>>> 3. Does not look like property of this node. This is a clock controller
> >>>> or system controller, not SGMII/phy etc.
> >>>
> >>> The register range referred to by this node *does* represent also an
> >>> SGMII phy. These sgmiisys nodes also carry the 'syscon' compatible, and
> >>> are referenced in the node of the Ethernet core, and then used by
> >>> drivers/net/ethernet/mediatek/mtk_sgmii.c using syscon_node_to_regmap.
> >>> (This is the current situation already, and not related to the patchset
> >>> now adding only a new property to support hardware which needs that)
> >>
> >> Just because a register is located in syscon block, does not mean that
> >> SGMII configuration is a property of this device.
> > 
> > It's not just one register, the whole SGMII PCS is located in those
> > mediatek,sgmiisys syscon nodes.
> 
> Then maybe this should be a PCS PHY device instead of adding properties
> unrelated to clock/system controller? I don't know, currently this
> binding says it is a provider of clocks...

As in reality it is really a clock provider and also SGMII PCS at the
same time, maybe we should just update the description of the binding
to match that:

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
index d2c24c2775141..db6f75df200ba 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
@@ -2,6 +2,7 @@ MediaTek SGMIISYS controller
 ============================
 
 The MediaTek SGMIISYS controller provides various clocks to the system.
+It also represents the SGMII PCS used by the Ethernet core.
 
 Required Properties:
 

See

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/mediatek/mtk_sgmii.c#n179

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/mediatek/mt7986a.dtsi#n409


> 
> > 
> >>
> >>>
> >>> So: Should I introduce a new binding for the same compatible strings
> >>> related to the SGMII PHY features? Or is it fine in this case to add
> >>> this property to the existing binding?
> >>
> >> The user of syscon should configure it. I don't think you need new
> >> binding. You just have to update the user of this syscon.
> > 
> > Excuse my confusion, but it's still not entirely clear to me.
> > So in this case I should add the description of the added propterty of
> > the individual SGMII units (there can be more than one) to
> > Documentation/devicetree/bindings/net/mediatek,net.yaml
> > eventhough the properties are in the sgmiisys syscon nodes?
> 
> I guess the property should be in the node representing the SGMII. You
> add it now to the clock (or system) controller, so it does not look
> right. It's not a property of a clock controller.

Well maybe this node needs to be split then into one node representing
only the clock controller and another node representing the SGMII PCS?
I'm not sure if this is even possible, some registers in this range
represent clocks, other registers are accessed using regmap API in
mtk_sgmii.c.

And (see the rest of this series) the exact same SGMII PCS can also be
found in MT7531 switch IC which has it's own (a bit odd) way to access
32-bit registers over MDIO, also in this case it is simply not easily
possible to represent the SGMII PCS in device tree.

> 
> Now which node should have this property depends on your devices - which
> I have no clue about, I read what is in the bindings.

There isn't any other node exclusively representing the SGMII PCS.
I guess the only other option would be to move the property to the
Ethernet controller node, which imho complicates things as it is
really a property of an individual SGMII PHY (of which there can be
more than one).

> 
> > 
> > If so I will have to figure out how to describe properties of other
> > nodes in the binding of the node referencing them. Are there any
> > good examples for that?
> 
> phys and pcs'es?

Hm, none of the current PCS (or PHY) drivers are represented by a
syscon node... (and maybe that's the mistake in first place?)

> 
> > 
> > Or should the property itself be moved into yet another array of
> > booleans which should be added in the node describing the ethernet
> > controller and referencing these sgmiisys syscons using phandles?
> 
> Best regards,
> Krzysztof
> 

