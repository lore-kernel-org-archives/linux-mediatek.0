Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A52BC02198
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Feb 2025 00:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQoIKTC4F29j3zhkzzTdWiTiq+DveQGlu8tEPYrS5Z0=; b=CSPT1Qnuky0YaJ4HWlE0oPvmWv
	gqUv1H5yC1d+segf8rBZ2Jef4ctcXJu+4GDo4iDbujdYNnVKZI7UB2OetprQUmOyactGIlpJ3he7D
	snHsQEBxGEkMP4vD0ySGeQB+102NnMfJCEr/5nczPCDe1r2vDybSv48cV+O9msSF6ZmTR6LLO3bd5
	oxAiotq7OXqe8zY+nRmtb1GbfTwpEhwsVZCoKlJWigtvtmymx878jHdst0PdzSbnhAb5GtLMZP8H+
	Gmzlzh6bYFE7ZWvsDsiPZuoSE5EEqtENL4hG1tYpGKvjbUVpJMIXH+PA1Pw2MJ/y+tliaowZG0FqI
	pikGgc2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1theZ4-000000023NM-2uRo;
	Tue, 11 Feb 2025 00:55:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thdRV-00000001t5U-2cMd
	for linux-mediatek@bombadil.infradead.org;
	Mon, 10 Feb 2025 23:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TQoIKTC4F29j3zhkzzTdWiTiq+DveQGlu8tEPYrS5Z0=; b=km3pr4l8EYXI5uQIKGi6Q0q17B
	LMrRoWhn4Qp64XZke0ea8qeoaHnItF5xrIMfj85ProT6fC22svjg8FiOf8soQJKlMcNOTBs9zuevT
	vM0LjkhfatG/p+scdbzUeVHZTpLoeW4qzgJSf1XYwzqTKr5OUXgrflaEjw4Ats5WmvkZBSd0y2OJE
	eIlN4UC85ZAYj4CBBL/cy5np1Tcx3C85Kr3uNbKhYfCH+XrL5V6XEwwgUbANrvOYigzzNn8NU2Sf2
	Ckvg9TUkDd800cUXEK9tPtyCGJaq9S9qB//9FJrx3BotgKKvJJ5ZDNtN4bpE3V1PSgEejv5yIH3UE
	W3ar/x9A==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thdRR-00000000NBE-2WaU
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Feb 2025 23:43:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=TQoIKTC4F29j3zhkzzTdWiTiq+DveQGlu8tEPYrS5Z0=; b=2O5WYhNtC5VJuZReoo4JOnl8Mj
	eqLQr14u4Y/zT13qc3+8jKXzL9Axe3b/eXidQPRh0xxKAMvk2zNs/rHGjJkOJAedK7Yx8JAHS5/zK
	rJRfCSFjm8ObRi1DHI6o913GPzvZICteBfSlL2UF+6RzKdewatNTwJE7cq8CMPDgoeYI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1thdR5-00CsBE-KW; Tue, 11 Feb 2025 00:43:31 +0100
Date: Tue, 11 Feb 2025 00:43:31 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Bo-Cun Chen <bc-bocun.chen@mediatek.com>,
	Chad Monroe <chad.monroe@adtran.com>,
	John Crispin <john@phrozen.org>, maxime.chevallier@bootlin.com,
	"Russell King (Oracle)" <linux@armlinux.org.uk>,
	Vladimir Oltean <olteanv@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org
Subject: Re: upstream Linux support for Ethernet combo ports via external mux
Message-ID: <e56150f0-1a57-4a04-ae74-d966e3dda5d3@lunn.ch>
References: <Z6qHi1bQZEnYUDp7@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6qHi1bQZEnYUDp7@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_234354_141457_85E3B87E 
X-CRM114-Status: GOOD (  17.55  )
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

On Mon, Feb 10, 2025 at 11:11:07PM +0000, Daniel Golle wrote:
> Hi,
> 
> Looking for ways to support a passive SerDes mux in vanilla Linux I
> found Maxime's slides "Multi-port and Multi-PHY Ethernet interfaces"[1].

Maxime is still working on this. There was a patchset posted
recently...

> The case I want to support is probably quite common nowadays but isn't
> covered there nor implemented in Linux.
> 
>  +----------------------------+
>  |            SoC             |
>  |    +-----------------+     |
>  |    |       MAC       |     |
>  |    +----+-------+----+     |
>  |         |  PCS  |   +------+
>  |         +---=---+   | GPIO |
>  +-------------=-------+---=--+
>               |            |
>            +---=---+       |
>            |  Mux  <-------+
>            +-=---=-+
>              |   |
>             /     \
>      +-----=-+   +-=-----+
>      |  PHY  |   |  SFP  |
>      +-------+   +-------+
> 
> So other than it was when SoCs didn't have built-in PCSs, now the SFP is
> not connected to the PHY, but there is an additional mux IC controlled
> by the SoC to connect the serialized MII either to the PHY (in case no
> SFP is inserted) or to the SFP (in case a module is inserted).
> 
> MediaTek came up with a vendor-specific solution[2] for that which works
> well -- but obviously it would be much nicer to have generic, vendor-
> agnostic support for such setups in phylink, ideally based on the
> existing gpio-mux driver.

I don't actually understand how it can work. For the PHY the PCS
probably needs to be running SGMII. For the SFP it probably wants
1000BaseX. It looks like phylink has no idea the mux has been flipped,
so it needs to reprogram the PCS. You cannot just create two phylink
instances and flip flop between them. You need phylink actively
involved so it can correctly manage the PCS.

	Andrew

