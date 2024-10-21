Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1D0D15D9A
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 14:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7K5v5ZY4zeUHGzQFv6PebieE5LwgNrwfdhsPGijF2ik=; b=BRjeu1mzcOuT8Cl+BMrTn1GXJ7
	FHAKMLyhzgE5makqsGlaYGZs0QIrdBc0/0vPyjw82PQegIMYWen18KglVTDTLT5jx8gcxWGuvRqYZ
	sOmplm4/+b4Y/XeQeiNiUEE9cpm7DXXyYOvoANGfb0cG4Bc58ce7NjGufrvtPz1gBonRdfqXvdE5T
	5HEH6sO4gstvepfPPNg7yFcposkfb5mvbpP931Ot+hFivHeK5BYlu7ZmDpH8OVV9Uj5HJJSqRs7nV
	V6sqNQhGaj8xi8DXHebBxmeQFskZCCZXK5wjhyCQhagMVkVw8LXxM9bFRU2i3qRW8uMtq6oZXahrs
	KujrmavQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2tQC-00000007cZw-3Gzk;
	Mon, 21 Oct 2024 14:30:12 +0000
Received: from pandora.armlinux.org.uk ([78.32.30.218])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2t8E-00000007ZcM-0Agz;
	Mon, 21 Oct 2024 14:11:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7K5v5ZY4zeUHGzQFv6PebieE5LwgNrwfdhsPGijF2ik=; b=r4kvZTeQKPzFsBGVTHgUYy+0YZ
	ppHjYn/ra/ADYAFKKcXttGtKerJ0yHoFkifnPIDSWcbYyen3gPlZEsb5pfadAclUgpZ1S95wWPp5z
	zj7eCkHk3gGPdtKeWXF8Bjt3ZQlZwk49URuG9iBm0VgI7/SL01YYkxBB9gIBq+elopD0mm1bsY4qn
	U4445THvEsbgpn7Chu5aBzbbLF6/eebtS7EgN1cYHd4nhjss5Ciz02OPw27K9nRAROvjEfhflzDGf
	0/2yiYpzzn7ho0MMzChf6ErEfEy4i8V7vZP44n2tOY5LNEGmufxRddaadDF70Ebglscw59n6xN6pT
	RGK1uTPQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51242)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1t2t7w-0003V4-0Z;
	Mon, 21 Oct 2024 15:11:20 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1t2t7p-0001n9-0G;
	Mon, 21 Oct 2024 15:11:13 +0100
Date: Mon, 21 Oct 2024 15:11:12 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next RFC PATCH 0/4] net: dsa: Add Airoha AN8855 support
Message-ID: <ZxZhADBe6UtdCTsu@shell.armlinux.org.uk>
References: <20241021130209.15660-1-ansuelsmth@gmail.com>
 <20241021133605.yavvlsgp2yikeep4@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021133605.yavvlsgp2yikeep4@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_071138_099334_C034DB92 
X-CRM114-Status: GOOD (  12.39  )
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

On Mon, Oct 21, 2024 at 04:36:05PM +0300, Vladimir Oltean wrote:
> On Mon, Oct 21, 2024 at 03:01:55PM +0200, Christian Marangi wrote:
> > It's conceptually similar to mediatek switch but register and bits
> > are different.
> 
> Is it impractical to use struct regmap_field to abstract those
> differences away and reuse the mt7530 driver's control flow? What is the
> relationship between the Airoha and Mediatek IP anyway? The mt7530
> maintainers should also be consulted w.r.t. whether code sharing is in
> the common interest (I copied them).

That thought crossed my mind while reviewing patch 3. I compared the
PMCR and PMSR, a lot of the bits are in completely different places
between the two. I didn't check further, but I got the feeling that
would invite more complexity.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

