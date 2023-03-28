Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E71FC761AF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 15:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OB4wfhtpOzRfLk2kLZNpSm2G3rfNhQDRIRU/cwoGYiM=; b=CZj9aXRM1C09MWQkr4SxaS6NmL
	bb/4K4VYiORGTTjB4vu7iA1uK9WpXFD5eV685gJ0ALEIqDlfKHgu12KI82aNmcXqVsxbEabuagCQI
	1O6KcxzFrp4gOfEDtWAijO/bpLvpbFER3IiMMLK4h9VjvHYwv2GusC8zXFkWIuNVzNLRpkS62VwPp
	QAVKnuUymFe9hPr3bzlX/CVhnDwrqo7oUg7ZfeZVPy7T875blHQPtuwdQ20Nb6SuG5rygGnjy7ote
	ChRkjRC0GkR9QBQFsAxdBWibI6Q/vUoWMrYbtZTMExoxwhcPw1FawZgSy6/OyFgogZDr0Rhs9GeSq
	x0TFrkkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phAoa-00ErYG-09;
	Tue, 28 Mar 2023 15:00:48 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phAoW-00ErWr-1d;
	Tue, 28 Mar 2023 15:00:46 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1phAoM-0008Nx-1D;
	Tue, 28 Mar 2023 17:00:34 +0200
Date: Tue, 28 Mar 2023 16:00:30 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
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
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [RFC PATCH net-next 2/2] net: dsa: mt7530: introduce MMIO driver
 for MT7988 SoC
Message-ID: <ZCMBDm31AzDGBKyL@makrotopia.org>
References: <ZCIML310vc8/uoM4@makrotopia.org>
 <a3458e6d-9a30-4ece-9586-18799f532580@lunn.ch>
 <ZCIML310vc8/uoM4@makrotopia.org>
 <a3458e6d-9a30-4ece-9586-18799f532580@lunn.ch>
 <ZCLmwm01FK7laSqs@makrotopia.org>
 <ZCLmwm01FK7laSqs@makrotopia.org>
 <20230328141628.ahteqtqniey45wb6@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230328141628.ahteqtqniey45wb6@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_080044_567535_B3806126 
X-CRM114-Status: GOOD (  18.80  )
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

On Tue, Mar 28, 2023 at 05:16:28PM +0300, Vladimir Oltean wrote:
> On Tue, Mar 28, 2023 at 02:08:18PM +0100, Daniel Golle wrote:
> > I agree that using regmap would be better and I have evaluated that
> > approach as well. As regmap doesn't allow lock-skipping and mt7530.c is
> > much more complex than xrs700x in the way indirect access to its MDIO bus
> > and interrupts work, using regmap accessors for everything would not be
> > trivial.
> > 
> > So here we can of course use regmap_read_poll_timeout and a bunch of
> > readmap_write operations. However, each of them will individually acquire
> > and release the mdio bus mutex while the current code acquires the lock
> > at the top of the function and then uses unlocked operations.
> > regmap currently doesn't offer any way to skip the locking and/or perform
> > locking manually. regmap_read, regmap_write, regmap_update_bits, ... always
> > acquire and release the lock on each operation.
> 
> What does struct regmap_config :: disable_locking do?

I thought I can't use that on a per-operation base because the
instance of struct regmap_config itself isn't protected by any lock
and hence setting disable_locking=false before calling one of the
accessor functions may affect also other congruent calls to the
accessors which will then ignore locking and screw things up.
Please correct me if I'm wrong there.

Yet another way I thought about now could also be to have two regmap
instances, one for locked and one for unlocked accessed to the same
regmap_bus.

