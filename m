Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CECEC77B7D
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 13:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYPq5fR3Cy+OCwvVu7qitsrrs6GcWO5NbmwTHJ8YR2Q=; b=n3hbXTuxwAHXr201CqYhRvzxSk
	+UrCW3u6IZuw9siBGNeC1wAIlUPV/i8N4iinsyEteN/AVFs9rpk4PPyeErEhShFcj2USDwPEasUJG
	IsXzV4287mFPJ0cvOCg3uqMxve1PF0DXymogwbBczMJ7dGr3M5fwYBa05C4tEDyd4hVlW7+O8gBEc
	n8pG8++O44S9LEvdDNAucHpla6ETDXShE8ffVKQE+ZNQowvI9hTkFtbH9hBCmK7PGGUgBnPbsVwpB
	LUirJKKvIR3Esb7pqfzCJ5tkCwsIVgkyp+u3WtUKAFdNawdWKmYi/ASyT2dElwliJ9B58JW+BlnC2
	4kRacnOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyYiy-002KZi-1t;
	Mon, 15 May 2023 13:58:52 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyYiv-002KYJ-1Z;
	Mon, 15 May 2023 13:58:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iYPq5fR3Cy+OCwvVu7qitsrrs6GcWO5NbmwTHJ8YR2Q=; b=DseE9QezuaB+gFlQFDgkh4dgtL
	xJ/ww2T/22Lol2k4IZxaLQoSU2ijCPXZMlvSEFrGXMaJnn5qKTEIJboz+bURxAIV9i1YAgXwAS4rB
	7muyyhfd/vYLFth04sB9XuXUBaUs4D7mVllAEDb5F2IqjOVlEN8nQBFgp00IRfL2q030=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pyYiH-00CtiM-71; Mon, 15 May 2023 15:58:09 +0200
Date: Mon, 15 May 2023 15:58:09 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Felix Fietkau <nbd@nbd.name>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>, John Crispin <john@phrozen.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Marcin Wojtas <mw@semihalf.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Taras Chornyi <taras.chornyi@plvision.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	UNGLinuxDriver@microchip.com, Vladimir Oltean <olteanv@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH RFC] Providing a helper for PCS inband negotiation
Message-ID: <9f7b1d6f-ca62-4c6c-9cd5-37726e7857b7@lunn.ch>
References: <ZGIkGmyL8yL1q1zp@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZGIkGmyL8yL1q1zp@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_065849_526759_5A1F6654 
X-CRM114-Status: GOOD (  10.01  )
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

> 2. XLGMII.. Looking at the XPCS driver, it's unclear whether Clause 73
>    AN gets used for this. A quick scan of IEEE 802.3 suggests that
>    XLGMII doesn't have any support for any inband signalling, and it's
>    just an intermediary protocol between the MAC (more specifically the
>    RS, but for the purposes of this I'll just refer to MAC) and the
>    attached PCS, and any autonegotiation happens after the XLGMII link.

So isn't XLGMII then a generic PHY thing, not a phylink thing?

Or am i not correctly understanding how
drivers/phy/marvell/phy-*-comphy.c and
drivers/phy/microchip/*_serdev.c fit into the overall picture?

	Andrew

