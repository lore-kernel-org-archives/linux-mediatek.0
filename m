Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B7FC004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 18:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cnYUwfrkdsesrrT+SXjYPoP9CYZdtUkqI2mtBXQK3g=; b=KfGPkAgx3fIlI7EI+8dh8JNvHz
	/bFmvAWH/BSPiVuim9rK5x4iwKqn80sqfT5lDanghzURn9UmPtEHwwZ6vyQUHsd4QbzETcIkLJuCw
	ZRDSlXIjnQMUG5UtPp67vnNEEDmUIc4w+bNngMKoBb9I9J8KdVRGBSzXTXMkD7ZdRmndiG3QlQeta
	jT3sdAHuj8I/rRADkWo5tthKnmptSKX+dNTG9kBWodpMIK8yD3xATtzYmV8QpUI7AzxOMclHCZ6B3
	9WQOwr+zoE7C7Bj3w30Caw7KyPMbyA5dHOqW8mUIlknDUFkBQK74p5Pv3uOyNlcJ6Woc+KkOuSBNe
	fTvle7sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZE3-006Qpr-Ip; Thu, 19 Jan 2023 18:01:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZDp-006Qli-GE; Thu, 19 Jan 2023 18:01:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4cnYUwfrkdsesrrT+SXjYPoP9CYZdtUkqI2mtBXQK3g=; b=JUbA8ODkFhLyd+VvNpV3OS4155
	5j/VVNdsJs7Nip7RKV4gTD/WYcV41Uy9/hiqAdU/FsVu9QfqLON1qJKHukeKUohQ10JPkd9cICZIi
	vXNyMbmLcFx9QB6PYPTNaJyE4q827ld9ln6ezeiM+12gok+SbKlNVz1mC4kkFR1qdIAoZMTwVU/8k
	OPrQ0weRhPKp+KYfEBHFPNDv4kNWuPcuKKAYEuCJCrJE9/WbUWi04pHp2RQE4QXQDP29XA2nJNZDN
	9Y9CYs6njl9l+vaQ0fBZnr1kSqa4v0fz8DK1vBf+wGpwQU1PkbtySXFu3j01z4JZCQ2P4tWjZ7+Mz
	WW3NXaYg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36214)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pIZDB-0004oT-TJ; Thu, 19 Jan 2023 18:00:29 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pIZD2-0000fc-CQ; Thu, 19 Jan 2023 18:00:20 +0000
Date: Thu, 19 Jan 2023 18:00:20 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Michael Walle <michael@walle.cc>
Cc: Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Wells Lu <wellslutw@gmail.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Tobias Waldekranz <tobias@waldekranz.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RESEND net-next 0/4] net: mdio: Remove support for
 building C45 muxed addresses
Message-ID: <Y8mFNMwtCyiMwcN7@shell.armlinux.org.uk>
References: <20230119130700.440601-1-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119130700.440601-1-michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_100112_281371_4E7D72B2 
X-CRM114-Status: UNSURE (   9.25  )
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

On Thu, Jan 19, 2023 at 02:06:56PM +0100, Michael Walle wrote:
> [Russell told me that his mailserver rejected my mail because of
> an ill-formated "To:" header. Resending now with plain git-send-email
> instead of b4 send.]
> 
> I've picked this older series from Andrew up and rebased it onto
> the latest net-next.
> 
> With all drivers which support c45 now being converted to a seperate c22
> and c45 access op, we can now remove the old MII_ADDR_C45 flag.

Great!

For the series:

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

