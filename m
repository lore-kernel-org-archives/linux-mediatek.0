Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70883C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 12:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9bOFTyg/R9p1/+tBwBFvmuDWAa2yaqkR6u3E/N1A/E=; b=YERlF5dz1caUWV4Cx+y7U9AP1l
	3mLvxYGksan6ic9gfnbKmvD+hnk9MeKJsnDYCgu05a/IkYU6BdYXfdelU7J2iBecbp+KkK8eL5XqR
	A2YJI/Hoe9jQPNfbM2RucyhnJOzd9STICcDRdJ2F/f48AIDaLc+dCXqjZQBNFO5TQHqOs6TnVa/D5
	Tj23YjhyOgfsUupDPOGxij3EHNeF8h27Awn4y4Peh8f8QhZ/7pC54hfr/j6VAcBFAQdSyi2UOkkgn
	nrQLyg+F8W0TOwKTR847KhTDBUYNPPQrj276WEWgPscqjKtE7UvVgnHRCvo1xsdqwwECdcF4Zu0ee
	YRok4srg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQSR9-005fGW-F4; Fri, 10 Feb 2023 12:23:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQSR7-005fEF-Bw; Fri, 10 Feb 2023 12:23:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=e9bOFTyg/R9p1/+tBwBFvmuDWAa2yaqkR6u3E/N1A/E=; b=v/jnMKqEH+8MxMTg1LSOuZlT5r
	8p8lDTs3uBC3X/8daquwcHTpKTKlethqhl7FnLhTLWZb0EMmnWFVX8JNrb64F/KfIDLBPLhi7t0zG
	XCPfpa3WZXwuDRjIz7rSRPyWrqDUakuVBDBhkzHOC9du6lPypRcIk1Zi7KKdPrq94SC00AadW/l1G
	qNyhltA1js2JwQeRgdZ4kcGGBCzUmQn8yLpsy8p1bwONA/iqfpIkD+KzGeGQUTUAWwLcsZ9IShafK
	F4IvdFjPQN05neJsSIsVpfhIIRR4u7TdQV3MrXVoV9bHidk1lZz/psQnzNgJLRV3JRe/gr4POeh7j
	LVDpicUw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36520)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pQSQu-0001Vw-FZ; Fri, 10 Feb 2023 12:23:16 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pQSQo-0005Zp-ED; Fri, 10 Feb 2023 12:23:10 +0000
Date: Fri, 10 Feb 2023 12:23:10 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
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
Message-ID: <Y+Y3Lt4I5LPzlK5x@shell.armlinux.org.uk>
References: <cover.1675779094.git.daniel@makrotopia.org>
 <a8c567cf8c3ec6fef426b64fb1ab7f6e63a0cc07.1675779094.git.daniel@makrotopia.org>
 <ad09a065-c10d-3061-adbe-c58724cdfde0@kernel.org>
 <Y+KR26aepqlfsjYG@makrotopia.org>
 <b6d782ef-b375-1e73-a384-1ff37c1548a7@kernel.org>
 <Y+Oo9HaqPeNVUANR@makrotopia.org>
 <514ec4b8-ef78-35c1-2215-22884fca87d4@kernel.org>
 <Y+QinJ9W8hIIF9Ni@makrotopia.org>
 <c29a3a22-cc23-35bf-c8e0-ebe1405a4d94@kernel.org>
 <Y+YdqbJS4bDvTxuD@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+YdqbJS4bDvTxuD@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_042329_426123_10060721 
X-CRM114-Status: GOOD (  20.22  )
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

On Fri, Feb 10, 2023 at 10:34:17AM +0000, Russell King (Oracle) wrote:
> On Thu, Feb 09, 2023 at 12:30:27PM +0100, Krzysztof Kozlowski wrote:
> > On 08/02/2023 23:30, Daniel Golle wrote:
> > > Hm, none of the current PCS (or PHY) drivers are represented by a
> > > syscon node... (and maybe that's the mistake in first place?)
> > 
> > Yes.
> 
> Nos, it isn't.

To expand on this - I have no idea why you consider it a mistake that
apparently all PCS aren't represented by a syscon node.

PCS is a sub-block in an ethernet system, just the same as a MAC is a
sub-block. PCS can appear in several locations of an ethernet system,
but are generally found either side of a serial ethernet link such
as 1000base-X, SGMII, USXGMII, 10Gbase-R etc.

So, one can find PCS within an ethernet PHY - and there may be one
facing the MAC connection, and there will be another facing the media.
We generally do not need to separate these PCS from the PHY itself
because we view the PHY as one whole device.

The optional PCS on the MAC side of the link is something that we
need to know about, because this has to be configured to talk to the
PHY, or to configure and obtain negotiation results from in the case of
fibre links.

PCS on the MAC side are not a system level device, they are very much a
specific piece of ethernet hardware in the same way that the MAC is,
and we don't represent the MAC as a syscon node. There is no reason
to do so with PCS.

These PCS on the MAC side tend to be accessed via direct MMIO accesses,
or over a MDIO bus.

There's other blocks in the IEEE 802.3 ethernet layering, such as the
PMA/PMD module (which for the MAC side we tend to model with the
drivers/phy layer) - but again, these also appear in ethernet PHYs
in order to produce the electrical signals for e.g. twisted pair
ethernet.

So, to effectively state that you consider that PCS should always be
represented as a syscon node is rather naieve, and really as a DT
reviewer you should not be making such decisions, but soliciting
opinions from those who know this subject area in detail _whether_
they are some kind of system controller before making such a
decision.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

