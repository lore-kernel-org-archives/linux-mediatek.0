Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF12C31D97
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 10:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aCKtF4LthkUcr294gZgJyIzu0FUA+wEzV3s4IEsQXCc=; b=JTbzZupHph2Y5ojWvLks1GHhY+
	own9urTNvKMJd62TZn5Y2R8bfzhKKmcYBVSB+hv9eTcvgM9+g6MVssJ9jM5apZEa89ua2lN5p2l9L
	vbCrhxOAMeo4EpXxu5SklLp9wbQ8u+rcu20IrefVpLjDcl+1f5ThL4cIa7Z2cGLv4nkYzRiJZZWuB
	5elQ++R2miIs42mJjIGkdjtHDCmrfvIt5CEW9XhDNYEXad/jYPEvJvqBVU4pETdid4FNp8sLIlc/J
	+0g9UQS41iAeTqqT/KzWUX0mF3ezgnu0Xi6qyAIEaIPXAcm+pPyK/ZO7UeS43nkqL3Rub6pxlJb6S
	6jJ0Dc5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPK1X-0000000CvFP-0jSW;
	Thu, 04 Jul 2024 10:49:11 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPK1J-0000000CvA9-32Yd;
	Thu, 04 Jul 2024 10:48:58 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1sPK18-000000008CZ-2DuW;
	Thu, 04 Jul 2024 10:48:46 +0000
Date: Thu, 4 Jul 2024 11:48:42 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, regressions@lists.linux.dev
Subject: Re: [PATCH net v3] net: dsa: mt7530: fix impossible MDIO address and
 issue warning
Message-ID: <ZoZ-ClhHUWzAPB1D@makrotopia.org>
References: <7e3fed489c0bbca84a386b1077c61589030ff4ab.1719963228.git.daniel@makrotopia.org>
 <20240703191308.3703099c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703191308.3703099c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_034857_781552_C7183594 
X-CRM114-Status: GOOD (  15.16  )
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

On Wed, Jul 03, 2024 at 07:13:08PM -0700, Jakub Kicinski wrote:
> On Wed, 3 Jul 2024 00:44:28 +0100 Daniel Golle wrote:
> > +	/* The corrected address is calculated as stated below:
> > +	 * 0~6   -> 31
> > +	 * 8~14  -> 7
> > +	 * 16~22 -> 15
> > +	 * 24~30 -> 23
> > +	 */
> > +return ((((phy_addr - MT7530_NUM_PORTS) & ~MT7530_NUM_PORTS) % PHY_MAX_ADDR) +
> > +	MT7530_NUM_PORTS) & (PHY_MAX_ADDR - 1);
> 
> nit: the return statement lacks indentation

Yes, lacks an additional space to match the level of the first open parentheses.
I'll fix that in the next round.

> 
> but also based on the comment, isn't it:
> 
> 	return (round_down(phy_addr, MT7530_NUM_PORTS + 1) - 1)	& (PHY_MAX_ADDR - 1);

The original, more complicated statement covers also the correct addresses,
ie. 31 -> 31, 7 -> 7, 15 -> 15, 23 -> 23. However, the function is never
called if the address is deemed correct, so that doesn't actually matter.

It's kinda difficult to decide whether it is more important to return
correct results also for values never used with the current code, or
have a slightly more readable and shorter function but with expectations
regarding the input values given by the caller.

Opinions?

