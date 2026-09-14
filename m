Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE85BC88E50
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 12:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQvmED0XLnRiwVr+hqQN5dNbbcwXDcg5FEOEt6uQaAU=; b=BF6O40JXqbmHH7HNaN3rfPxHKo
	iHTnKevvZ0TwWlydbJEEXEOa5NwKEXA3IyObkxBoVEw5bVMNhptnP3XVCcN9GQalRxDFQtmY5kY0X
	Y6NpYQW4RMOSCS2FZNF2cSaLpAegDHPiKUhQHX+4aJnHlhqA0zNG99dIoRjjfcQ5UVrepmbeE7PiK
	jTMgOy8E6w+O3GXFHipB5pUkmwUffepA/M2kyEg3wBq+V7GU7yUjIn8daWtap5Wnt3/xXLvjWWFyL
	NsiYQnN2mRSsrnq8WDa1Zsw9NN87zh84I81YdeXfR+JePaXT/i5vbu0JBn6jMG5cr9K4PlfN2BEnA
	Th1ySFxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65wS-00000003aSe-3Fux;
	Mon, 14 Sep 2026 12:37:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65wQ-00000003aRJ-28Y4;
	Mon, 14 Sep 2026 12:37:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=EQvmED0XLnRiwVr+hqQN5dNbbcwXDcg5FEOEt6uQaAU=; b=sBroTqwr4aHv8+LplZswgoX3aU
	0Ss5buFm1c3RrFWkMwVnYWKyRfaZhFX1ouyFnw2t0qDn5TNJ/XxoYHHJkXeDuw+IV28RTbuxXnr9m
	v34tXwpKoqoTtxi/+HLGgoIdg5KRyVRQe0kKD/j2eyyWE4sLTs1mwCheiF4c6/TS1vYE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x65w8-00550T-FI; Mon, 14 Sep 2026 14:37:28 +0200
Date: Mon, 14 Sep 2026 14:37:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ahmed Naseef <naseefkm@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Dumazet <edumazet@google.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Qingfang Deng <dqfext@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: phy: mediatek: do not report link and per-speed
 LED rules together
Message-ID: <06b12441-4018-46ab-87a8-668078bcd9f7@lunn.ch>
References: <20260912134306.3544329-1-naseefkm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912134306.3544329-1-naseefkm@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_053746_548216_F9536496 
X-CRM114-Status: GOOD (  16.06  )
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

On Sat, Sep 12, 2026 at 05:43:06PM +0400, Ahmed Naseef wrote:
> mtk_phy_led_hw_ctrl_get() reports TRIGGER_NETDEV_LINK whenever any of the
> speed bits in on_set is on, and in addition reports every individual
> TRIGGER_NETDEV_LINK_* bit that is set. The netdev trigger refuses that
> combination: netdev_led_attr_store() rejects TRIGGER_NETDEV_LINK together
> with any per-speed rule, and it validates the whole resulting mode rather
> than just the bit being written. Once the hardware has any link bit
> programmed, every write to the trigger attributes of that LED therefore
> fails with -EINVAL and the LED can no longer be configured.
> 
> The rules are also fed back into the hardware: the trigger stores what is
> read back, and a later write of device_name programs it again, expanding
> TRIGGER_NETDEV_LINK to every speed in on_set. An LED configured for a
> single speed is thereby silently widened to "on at any link speed".
> 
> Both are easy to see on the EcoNet EN7528, whose four PHYs share one LED
> block. The first LED programs the block correctly, the second reads those
> rules back and rewrites them widened, and the remaining two then read the
> widened value, so an LED configured for "link_10 link_100" ends up lit on a
> 1000 Mbps link.
> 
> on_set holds every speed the LED can indicate and is exactly what
> mtk_phy_led_hw_ctrl_set() programs for TRIGGER_NETDEV_LINK, so report the
> speed independent rule only when all of them are on, and the individual
> speeds otherwise. The mapping is then the inverse of the one used when
> programming the LED and round trips without changing the register.
> 
> Fixes: c66937b0f8db ("net: phy: mediatek-ge-soc: support PHY LEDs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

