Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8BCC05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 13:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=omsqhN++DtJmLqdlOSLzlOStGuaJ3k5Cs7NvwpCcsmA=; b=3PSm7dZAhCxpqvVrShVf5ve0jj
	lmUkHnCfoMswT4Dlb/wRZgq4X02Rdw8Pna6v5CPpCBuz8+bHR/zyhI6U7l8RPMuYiKHvzDaNqKUE3
	d+jlOA7kS70fnKz9wEIeuvNH3459vz9O35TREgoQCh9HHf/OFmzRS8ZLpx3ilzr1k2zZyNDqAadQ8
	yt/Qt0GKqP6bW/5rIO5X1NmsWzbymHKJTu92an+MXS+M+6qaUZoB5j9932n9NEC8hyoi03zSl3mbt
	T+3yOUaPNduXJ/U7OIqOGDHD2maW6g5BZbsNMeZtkV3LG43MRZGc+Byjn6VcLnF7Etl9ZXVqFmZ3X
	Q4iaqH6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPks1-00Form-TJ; Wed, 08 Feb 2023 13:52:21 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPkry-00Foou-U6; Wed, 08 Feb 2023 13:52:20 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pPkrX-0003uy-38;
	Wed, 08 Feb 2023 14:51:52 +0100
Date: Wed, 8 Feb 2023 13:51:48 +0000
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
Message-ID: <Y+Oo9HaqPeNVUANR@makrotopia.org>
References: <cover.1675779094.git.daniel@makrotopia.org>
 <a8c567cf8c3ec6fef426b64fb1ab7f6e63a0cc07.1675779094.git.daniel@makrotopia.org>
 <ad09a065-c10d-3061-adbe-c58724cdfde0@kernel.org>
 <Y+KR26aepqlfsjYG@makrotopia.org>
 <b6d782ef-b375-1e73-a384-1ff37c1548a7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6d782ef-b375-1e73-a384-1ff37c1548a7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_055218_991686_729898E2 
X-CRM114-Status: GOOD (  24.56  )
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

On Wed, Feb 08, 2023 at 10:32:53AM +0100, Krzysztof Kozlowski wrote:
> On 07/02/2023 19:00, Daniel Golle wrote:
> > ...
> >> 3. Does not look like property of this node. This is a clock controller
> >> or system controller, not SGMII/phy etc.
> > 
> > The register range referred to by this node *does* represent also an
> > SGMII phy. These sgmiisys nodes also carry the 'syscon' compatible, and
> > are referenced in the node of the Ethernet core, and then used by
> > drivers/net/ethernet/mediatek/mtk_sgmii.c using syscon_node_to_regmap.
> > (This is the current situation already, and not related to the patchset
> > now adding only a new property to support hardware which needs that)
> 
> Just because a register is located in syscon block, does not mean that
> SGMII configuration is a property of this device.

It's not just one register, the whole SGMII PCS is located in those
mediatek,sgmiisys syscon nodes.

> 
> > 
> > So: Should I introduce a new binding for the same compatible strings
> > related to the SGMII PHY features? Or is it fine in this case to add
> > this property to the existing binding?
> 
> The user of syscon should configure it. I don't think you need new
> binding. You just have to update the user of this syscon.

Excuse my confusion, but it's still not entirely clear to me.
So in this case I should add the description of the added propterty of
the individual SGMII units (there can be more than one) to
Documentation/devicetree/bindings/net/mediatek,net.yaml
eventhough the properties are in the sgmiisys syscon nodes?

If so I will have to figure out how to describe properties of other
nodes in the binding of the node referencing them. Are there any
good examples for that?

Or should the property itself be moved into yet another array of
booleans which should be added in the node describing the ethernet
controller and referencing these sgmiisys syscons using phandles?

