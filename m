Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0708FD10366
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Nov 2025 22:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7pG8R0U/pnahoXJymPcP4KNsItn4TlRtbOwE4F9lRw=; b=0+/U7ONYwfbFQtkkHagsjLWIab
	dGSwc+Vv3qoNm8ukCKYl2PVC0wIqOSdBce9vTLzZGVCKSSmkU026PbeSRAkY91KXg7MrrtJhWfJay
	+r6Bix1+64nZBnLOB4Z/FU2O5PR5Dma6zYWphdh21ZP2zFS7PuLDz7FC/qjjhp4hEI1jYDb43otwH
	rY7bzaFaGIlUVnS+a/ywsO4d+t80T+SWiYVuuLDH8hOc3IpQ2BoIT641a50MrkXNnBQFo0zrqe3bG
	OmsLlIwj7zF+14jN5Fva6endW8hnMecwmjYsjr62lYnGTwmnZ4ZWC4Vkr/MtnyilZC/AndpU3Xvd1
	d+/6s6eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO1b6-0000000E0gV-2ulf;
	Tue, 25 Nov 2025 22:33:20 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO1b3-0000000E0fj-41y8;
	Tue, 25 Nov 2025 22:33:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=H7pG8R0U/pnahoXJymPcP4KNsItn4TlRtbOwE4F9lRw=; b=LCjZZPNNMiWvKKVuIMq+NBWWVY
	kj2//mzyNplsQdeFC+RyOKTf8t+MwaN0S14WCYwwiiI6YBOR6mPugvwt510BaAjc+urPg8HVK+ndP
	jLLDH1e55AnEW9hdS6pnP/NPCWj63lVW1n+gslTWIa975faElFKixJwNT78z9QYPIPog=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vO1av-00F46S-5T; Tue, 25 Nov 2025 23:33:09 +0100
Date: Tue, 25 Nov 2025 23:33:09 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Golle <daniel@makrotopia.org>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eric Woudstra <ericwouds@gmail.com>,
	Marek =?utf-8?B?QmVo4oia4oirbg==?= <kabel@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
Subject: Re: [PATCH net-next 1/9] dt-bindings: phy: rename
 transmit-amplitude.yaml to phy-common-props.yaml
Message-ID: <b4597333-e485-426d-975e-3082895e09f6@lunn.ch>
References: <20251122193341.332324-1-vladimir.oltean@nxp.com>
 <20251122193341.332324-2-vladimir.oltean@nxp.com>
 <0faccdb7-0934-4543-9b7f-a655a632fa86@lunn.ch>
 <20251125214450.qeljlyt3d27zclfr@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125214450.qeljlyt3d27zclfr@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_143318_024017_3D7F8802 
X-CRM114-Status: GOOD (  20.47  )
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

> Yeah, although as things currently stand, I'd say that is the lesser of
> problems. The only user (mv88e6xxx) does something strange: it says it
> wants to configure the TX amplitude of SerDes ports, but instead follows
> the phy-handle and applies the amplitude specified in that node.
> 
> I tried to mentally follow how things would work in 2 cases:
> 1. PHY referenced by phy-handle is internal, then by definition it's not
>    a SerDes port.
> 2. PHY referenced by phy-handle is external, then the mv88e6xxx driver
>    looks at what is essentially a device tree description of the PHY's
>    TX, and applies that as a mirror image to the local SerDes' TX.
> 
> I think the logic is used in mv88e6xxx through case #2, i.e. we
> externalize the mv88e6xxx SerDes electrical properties to an unrelated
> OF node, the connected Ethernet PHY.

My understanding of the code is the same, #2. Although i would
probably not say it is an unrelated node. I expect the PHY is on the
other end of the SERDES link which is having the TX amplitudes
set. This clearly will not work if there is an SFP cage on the other
end, but it does for an SGMII PHY.

I guess this code is from before the time Russell converted the
mv88e6xxx SERDES code into PCS drivers. The register being set is
within the PCS register set.  The mv88e6xxx also does not make use of
generic phys to represent the SERDES part of the PCS. So there is no
phys phandle to follow since there is no phy.

	Andrew


