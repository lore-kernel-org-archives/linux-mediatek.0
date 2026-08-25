Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99C8C61DBD
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2026 19:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/d/XiaZLLKv+vI0B4miB6NRoNYuVfQaCGlqHEYGWIuU=; b=t8VlTxm5x6p4xeRVy3YrbRxqp4
	RvVgWXFHZaurlQ6wBfLOaGLLPPvs3wbj08zhcXMODndPkncXN11M642h1PIEzLAJOPS6Fy+f/TVyE
	nA1x8LD7EvW4TP+/AleC/et4/BMuT2PlA71Zc+WMk2ZPj2fsxdVVK3XMIH9uqyJzcmt1ioQVj53Wj
	/N1oHjOQAbxV4I6AVjxeXRGXpSBqFWICTgobgSTXGccsgG0MxN5HeQcFx+GJFMLf+/ThVlmhtD/Dn
	roCGWrGuf1rppOyYrxrBsoZg3WXWra+D8bWze77XQsVZwDP0szZ/g5Kqmk8AjRI2CBAsApOn5FYK3
	1BM/6jYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyx1s-00000001PAj-1oKA;
	Tue, 25 Aug 2026 19:41:52 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyx1q-00000001P9n-1CkC;
	Tue, 25 Aug 2026 19:41:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=/d/XiaZLLKv+vI0B4miB6NRoNYuVfQaCGlqHEYGWIuU=; b=4YFhZUK0eI4ur0yv9gJdwPmjyR
	4vMUTdTgXiaYg7JZGn1wDU0Wdeh7Ug3cDd5m2RRmFen2AOMTdYheuprh+e/SWX0PAzpzxGNMxOATx
	25mRanfOgPdoEbTH3E7SkBiByj8iOJyp3Bd7MuqXvIRMiPJxkCJ4px27NL/WG4il9Egg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wyx1a-001QDG-2d; Tue, 25 Aug 2026 21:41:34 +0200
Date: Tue, 25 Aug 2026 21:41:34 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 5/6] net: phy: mediatek: add calibration
 logic for AN7581
Message-ID: <53415965-602e-4638-98db-43e0b899f837@lunn.ch>
References: <20260724190811.198339-1-ansuelsmth@gmail.com>
 <20260724190811.198339-6-ansuelsmth@gmail.com>
 <d18d84e4-af86-405e-aadd-bd9a8dfe8742@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d18d84e4-af86-405e-aadd-bd9a8dfe8742@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_124150_322965_08F5395D 
X-CRM114-Status: UNSURE (   7.96  )
X-CRM114-Notice: Please train this message.
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

> > +	ret = devm_phy_package_join(&phydev->mdio.dev, phydev, 0,
> 
> 
> This should use AIROHA_DEFAULT_PORT0_ADDR as the base_addr to avoid a
> collision if another PHY driver also uses devm_phy_package_join().

Please trim the text when replying, otherwise comments get lost.

       Andrew

