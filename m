Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD09EB64DD
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Aug 2023 16:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAgSe/fvcEsAuCevj4UGpRGSw4bx6DrrfYgnHUykh04=; b=zh9IiSgme3cuZnCSqdEPi9DeTF
	za32T6TVXWHG2+6U+taKTxiadHLjKBAQFZs2vyUg++dlG94LOIXw7po3BImSh3AjGUezmRxJg6D8J
	5vZlK1gw8k2budJHW4Jq1Z7kiPRx4xNoOB7rIBODg8lPJBMhhfyLdeHN4MJY8ldhxb3+YdEFIniVq
	oB2pNtlS3dvN54ctGMkHKMV1SOZXI7obkpFkmxkSL/EnVpjyE43fMKyF41uMRNizh8NOOpm0ajmRu
	jivUUWMw0Bdk9gSI0NQMw6rk/bcmd2V0vN+R9NpTBT3+F8nkL36t8WaGukHZC0fzSE71IIKa9uKab
	34Ce8xlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUVAl-00B8ZQ-0H;
	Fri, 11 Aug 2023 16:39:35 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUVAh-00B8XU-1s;
	Fri, 11 Aug 2023 16:39:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=TAgSe/fvcEsAuCevj4UGpRGSw4bx6DrrfYgnHUykh04=; b=dyYT0EfC1RxBdwrrg002ZYKUBG
	gM+1qg62PZ1QlIpEgtBoie4k7T4n2f82EWwCI9OndqQhZIArgRWc0KII3zfTvYDU4l1e7hFjdrf2N
	zFJorazHy0YexBrhSHTDH+uW0kAaDXJXX6pmN+srzeq12Uptft6MN8ggGYZvbCUmUE0k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qUVAC-003pLi-AB; Fri, 11 Aug 2023 18:39:00 +0200
Date: Fri, 11 Aug 2023 18:39:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: phy: mediatek-ge-soc: support PHY LEDs
Message-ID: <ed096dfe-6a42-4838-972b-7a28afaf2f6e@lunn.ch>
References: <a21288bf80f26dda6c9729edb5b25d0995df5e38.1691724757.git.daniel@makrotopia.org>
 <ac6a4318-3a47-2c77-6b81-b5f04765c04e@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac6a4318-3a47-2c77-6b81-b5f04765c04e@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_093931_621937_7021F323 
X-CRM114-Status: GOOD (  10.64  )
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

> > +	/* Only now setup pinctrl to avoid bogus blinking */
> > +	pinctrl = devm_pinctrl_get_select(&phydev->mdio.dev, "gbe-led");
> 
> This function gets reference on phydev->mdio.dev, but there is no code
> to release it. It looks like a leak which will prevent module unload,
> but I don't have hardware now to prove it.

Since it is a devm_ function, it should get released when the device
is destroyed. Or am i missing something?

   Andrew

