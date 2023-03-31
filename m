Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A2CC6FD18
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 12:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBywTnPm98K4P6whYiX2rvcllzM1t6Zix8WFENn7dyQ=; b=VhuNTb7AF+UMgLEPjaSfOn7zqQ
	MUbzbh6p98Dml+EW2YwOOW9mqMuSl87ck9xMS/EUhf3qfdDYtIAe0BAFqenWqWo0b5HcL+UJyxUBc
	Fd3Bz+bYtoIgKHWnTO39tjmN9KYB7bZ6cXlTkI1R40uKdPvhUrdw9kmEsDLn9/sip7FgJuHjTa3aV
	6lvYWtLwQEucb6ekCuQwtRZnY8CkGRuxfT598myHU405UyfwviKqvGP4DlYfllZ+TOIYV/npCnqXw
	DKm6pn7imGbina4dLHsmHHV4AWTXp1lqbmKq5DNO9z4+XgvwpWwQk13JWyUiOxq/9ObLa8mClsCc1
	Tz/GGgGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piE7z-007Ncy-36;
	Fri, 31 Mar 2023 12:45:11 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piE7x-007Nbx-2G;
	Fri, 31 Mar 2023 12:45:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kBywTnPm98K4P6whYiX2rvcllzM1t6Zix8WFENn7dyQ=; b=KqMXOvG33G8QTvnyKl/bzvRcMq
	zhiVH2CBklpNfSSxBlIcUVZlzs1blc6QDBaVsCdpZPL5rIUxzKOrHcPIA8Bz+XcXJlls+beSFZUhF
	l10FhK4iKQaCd1eqwIY3Vgyyj0yIfuhdi+bibCLJVtA1dpxofOSGK3bm4iSseTr202jo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1piE7p-0091hJ-FY; Fri, 31 Mar 2023 14:45:01 +0200
Date: Fri, 31 Mar 2023 14:45:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk,
	linux-kernel@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sam Shih <Sam.Shih@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>
Subject: Re: [PATCH net-next 14/15] net: dsa: mt7530: introduce driver for
 MT7988 built-in switch
Message-ID: <387b3105-2d70-4906-9573-cfac20a55d3a@lunn.ch>
References: <cover.1680180959.git.daniel@makrotopia.org>
 <fef2cb2fe3d2b70fa46e93107a0c862f53bb3bfa.1680180959.git.daniel@makrotopia.org>
 <6a7c5f81-a8a3-27b5-4af3-7175a3313f9a@arinc9.com>
 <ZCazDBJvFvjcQfKo@makrotopia.org>
 <7d0acaef-0cec-91b9-a5c6-d094b71e3dbd@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d0acaef-0cec-91b9-a5c6-d094b71e3dbd@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_054509_737501_7B5A8061 
X-CRM114-Status: GOOD (  18.14  )
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

> Firstly, all of the functions on the mt7530-mmio driver should be changed
> from mt7988_* to mt7530_mmio_*. Same goes for the mt7530-mdio driver too as
> some of the functions don't start with mt7530_mdio_*. The MDIO and MMIO
> drivers are supposed to be used for the switches the MT7530 DSA driver
> supports. The mt7530_ prefix is derived from that. The mmio_ or mdio_ prefix
> is derived from, well, the driver itself.

There are examples of similar naming schemes in other DSA drivers. For
the marvell mv88e6xxx driver, all generic functions use the mv88e6xxx_
prefix. For functions which are specific to a family of marvell
switches, we use a prefix for when the feature was introduced. So for
example we have mv88e6352_g1_reset(), where that method of resetting
the devices was introduced in the mv88e6352. This also gives us some
namespace space, so we can also have mv88e6185_g1_reset() which is
used for a different family.

So i personally don't have a problem using different prefixes within
one driver, if it helps with understanding and name space issues.

> What I'm going to say next depends on how generic the MMIO and MDIO drivers
> are so that they can be used on all MediaTek architecture switches. Let's
> say, a new MediaTek switch is introduced. It seems likely that either the
> MMIO or MDIO driver will be used to control the switch. Maybe the driver for
> this new switch won't be under mt7530.c, like on Realtek, but that doesn't
> change the outcome.

My experience with silicon vendors is that they like to change the
hardware in none backwards compatible ways. So i would actually avoid
generic names, it makes it harder to deal with different variants.

	Andrew

