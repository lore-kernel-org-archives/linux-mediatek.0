Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129CAECAAD8
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 02:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ne9cM+YswsLwN2sAUxB058oBiWyLOnEeEdaac2OhME0=; b=knhG0ZltVSCyJWkW3dGyonvqpV
	aJZERhY+0i/HH6St1lPAtuynAP2TphLvuJd4yIQosW9eCYKPElGmadTWFh8mUB0n0MjSassB8FAEl
	MR62GHbgup96BGCAlANiJWo2pIFtioXcxdqF2xaaPkX8DufVvQzgq8e+0TusaOBFhCaKVixYFgi7B
	MLyH99ODxhpkK0izRpRVj4bIKPYDlg6qRZrWi12v3E6DOqDoKzsP9LVq7ZfsjDMszJi+7bWkeRxuP
	RcSVpV41tYicBBWUHjz3ozs9anmMaNQlhxmDDI/731Ev36tOPDpkVxZTJZA/WVPy+KtXi8fSKkelh
	79C29lUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYemK-00FnHy-DC; Thu, 15 Sep 2022 02:39:00 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYem4-00Fn6p-SU; Thu, 15 Sep 2022 02:38:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=Ne9cM+YswsLwN2sAUxB058oBiWyLOnEeEdaac2OhME0=; b=Lc
	oA3YdAA+Nf2G+MvvFRbZfD9HVBUvaIuUPRfzo1Nhy/7lv5nb7OcEC1StLRYaBAt3+phKAv+q4KB90
	xwXirbuxfyfEOfL/8JBkT+ZlUxjCfcQBatVtR4EiY8jmcg09CfL7w8s3/Zt4yD4lwSn7C/d5Qp2ZK
	4gJU7QZNKkqc2q4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1oYelt-00Glyc-QH; Thu, 15 Sep 2022 04:38:33 +0200
Date: Thu, 15 Sep 2022 04:38:33 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: netdev <netdev@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Thibaut <hacks@slashdirt.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: Re: Move MT7530 phy muxing from DSA to PHY driver
Message-ID: <YyKQKRIYDIVeczl1@lunn.ch>
References: <0e3ca573-2190-57b0-0e98-7f5b890d328e@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e3ca573-2190-57b0-0e98-7f5b890d328e@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_193844_959962_7963BE44 
X-CRM114-Status: GOOD (  19.13  )
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

On Thu, Sep 15, 2022 at 01:07:13AM +0300, Arınç ÜNAL wrote:
> Hello folks.
> 
> MediaTek MT7530 switch has got 5 phys and 7 gmacs. gmac5 and gmac6 are
> treated as CPU ports.
> 
> This switch has got a feature which phy0 or phy4 can be muxed to gmac5 of
> the switch. This allows an ethernet mac connected to gmac5 to directly
> connect to the phy.
> 
> PHY muxing works by looking for the compatible string "mediatek,eth-mac"
> then the mac address to find the gmac1 node. Then, it checks the mdio
> address on the node which "phy-handle" on the gmac1 node points to. If the
> mdio address is 0, phy0 is muxed to gmac5 of the switch. If it's 4, phy4 is
> muxed.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/drivers/net/dsa/mt7530.c?id=1f9a6abecf538cc73635f6082677a2f4dc9c89a4#n2238
> 
> Because that DSA probes the switch before muxing the phy, this won't work on
> devices which only use a single switch phy because probing will fail.
> 
> I'd like this operation to be done from the MediaTek Gigabit PHY driver
> instead. The motives for this change are that we solve the behaviour above,
> liberate the need to use DSA for this operation and get rid of the DSA
> overhead.
> 
> Would a change like this make sense and be accepted into netdev?

Where in the address range is the mux register? Officially, PHY
drivers only have access to PHY registers, via MDIO. If the mux
register is in the switch address space, it would be better if the
switch did the mux configuration. An alternative might be to represent
the mux in DT somewhere, and have a mux driver.

    Andrew

