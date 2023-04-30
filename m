Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0AEC77B73
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Apr 2023 14:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJtCwQvXEsgN/DAG5ktUpq5HtX6DvhAJ6ab2hmFg45Q=; b=QTpApx0wphXuTHJFmdmKxEPBky
	yu/+keUOh4VAer9wvBz9sFq/5KJjql7mwt/vcv3BwMdCSqklZ6ea0atTWYSRS4+NjO6OwzrSisNTV
	4L96v81f8q7XEHcrw9+oqNMF2g7uwhD4E0j54eRlo5RtrCWz7My/W+EdXXdHvl+NEMV9OxDfx1lfy
	rBtX1dd9Ek4TQxDPUmExnYiXPhDKag6Y5jh2ZYmKI/r6zV48kBr+NCrHZAwqhRD1D8moYIiFA3GV4
	JVmt4c7o99LEwSnF9rIzctf7lwE1M72qAjpw3i6Qk1Fu9to6J0VWjWBBDzNfnYPO2XbWnBI8B2vCT
	DeUb8R2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pt7pe-00EGYd-2C;
	Sun, 30 Apr 2023 14:15:18 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pt7pb-00EGXt-0S;
	Sun, 30 Apr 2023 14:15:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=YJtCwQvXEsgN/DAG5ktUpq5HtX6DvhAJ6ab2hmFg45Q=; b=PGkwTjefbDsRkIxZOZyAAxXYvc
	DRfxK+n+tV6/ZTbjyhSBZu5rooMxurrXu1pxh1XmlNyosfcR2WuMzNz2PXzC1jrD7Y+g5HXD9Qgz+
	my4wpqPsnUPHABpedUl0HjB3faSt4mfNAhg75u5JUK5tZWN4ODSO4OlsnoRITmj/pyhQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pt7ov-00BYQq-LY; Sun, 30 Apr 2023 16:14:33 +0200
Date: Sun, 30 Apr 2023 16:14:33 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: David Bauer <mail@david-bauer.net>
Cc: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] mt7530: register OF node for internal MDIO bus
Message-ID: <842530f0-78b9-4cfe-9469-d20b1c0b5259@lunn.ch>
References: <20230430112834.11520-1-mail@david-bauer.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230430112834.11520-1-mail@david-bauer.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230430_071515_200745_23E3F2BC 
X-CRM114-Status: GOOD (  11.72  )
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

On Sun, Apr 30, 2023 at 01:28:32PM +0200, David Bauer wrote:
> The MT753x switches provide a switch-internal MDIO bus for the embedded
> PHYs.
> 
> Register a OF sub-node on the switch OF-node for this internal MDIO bus.
> This allows to configure the embedded PHYs using device-tree.
> 
> Signed-off-by: David Bauer <mail@david-bauer.net>

Hi David

Please read

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

You should put the tree in the patch subject.

Also, net-next is closed at the moment due to the merge window. Please
only post RFC patches during this time, and repost once net-next opens
again.

	Andrew

