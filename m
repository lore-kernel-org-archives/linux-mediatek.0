Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CE310A88D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 15:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzVATzeIpqjOe+8Cx38MLFUSi1q5cYwLtg5AqfYWoD0=; b=wdyvVihItmaSg1jAgrYnJytssv
	FLCN5LuJG5ODwjwU+F82o1zSm6TVJ4qxaKb54zsaHKwmSiumNzK0FJ3zEuDyBjpGF9IQ1JJe/JqzQ
	MIVPx3JJd35dMTHBAcRxfmeygETkpfC4OMWyiO4d18fwIVbUtI9UWRZjB5wTKwf4X01ieUeY2N9OV
	EvvXf1Ph+XF3RnYxgmcsCdVK5X+kDbu/1nf2YiBwPcImhyjKNQeXklApXr8lAyI2W337SjsY2ACqa
	9avTo/gqNzRJMDzCLGfk2q/iqTGIGFZ8H48dYrLDW+pYvyx1h2EEu7b+LTr0iChHOxmmMxhuYfBvD
	LycE489w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mcA-00000005kVp-2TLH;
	Thu, 26 Mar 2026 15:27:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mc8-00000005kVN-1ggI;
	Thu, 26 Mar 2026 15:27:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gzVATzeIpqjOe+8Cx38MLFUSi1q5cYwLtg5AqfYWoD0=; b=1T8b5Jwhep6s1bdWD5TFn69pLd
	SZy76s1Snrm8+z47EkFs8pZ+0aN7O1f/CRLTzggTAK990pTxU/0jKo2cqbVyH6JLzbiRwv14myAiT
	eTR5fybqRfzJ31fYr2YHTHbg2A68ALLDfCJbdipXFN7uhgA+1NVXH2puZFFppl3R+IsnI8D7Rd3Iy
	yxjDkb5v6q0ydugukyqGcRF8U125/05UaD43B7lTf8nI3TnXbp/gXXQfL3QmejCzKSrIvZFu36hxC
	Vn/nM434Xrgmgt020x4M0+hBAje0q8xBEhZ+6yB1qj2vdhNBkchMmXOEv7UmuthB5MCmMx/YrYF7Q
	HQF3D0bA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51150)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w5mbs-000000004xT-2JKK;
	Thu, 26 Mar 2026 15:27:00 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w5mbq-0000000078D-0OZH;
	Thu, 26 Mar 2026 15:26:58 +0000
Date: Thu, 26 Mar 2026 15:26:57 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, kevin-kw.huang@airoha.com,
	macpaul.lin@mediatek.com, matthias.bgg@gmail.com,
	kernel@collabora.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 4/4] net: phy: Introduce Airoha AN8801/R
 Gigabit Ethernet PHY driver
Message-ID: <acVQQQiciPQBkQOG@shell.armlinux.org.uk>
References: <20260326-add-airoha-an8801-support-v2-0-1a42d6b6050f@collabora.com>
 <20260326-add-airoha-an8801-support-v2-4-1a42d6b6050f@collabora.com>
 <acVND6DdpM9czIwU@shell.armlinux.org.uk>
 <044110c5-da1e-48c0-93fd-35553e86b271@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <044110c5-da1e-48c0-93fd-35553e86b271@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_082716_461969_4429798A 
X-CRM114-Status: GOOD (  19.18  )
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

On Thu, Mar 26, 2026 at 04:24:23PM +0100, Andrew Lunn wrote:
> On Thu, Mar 26, 2026 at 03:13:19PM +0000, Russell King (Oracle) wrote:
> > On Thu, Mar 26, 2026 at 01:04:15PM +0100, Louis-Alexis Eyraud wrote:
> > > +static int an8801r_set_wol(struct phy_device *phydev,
> > > +			   struct ethtool_wolinfo *wol)
> > > +{
> > > +	struct net_device *attach_dev = phydev->attached_dev;
> > > +	const unsigned char *macaddr = attach_dev->dev_addr;
> > 
> > This isn't a criticism for this patch, but a discussion point for
> > phylib itself.
> > 
> > It occurs to me that there's a weakness in the phylib interface for WoL,
> > specifically when WoL is enabled at the PHY, but someone then changes
> > the interface's MAC address - there doesn't seem to be a way for the
> > address programmed into the PHY to be updated. Should there be?
> > 
> > Do we instead expect users to disable WoL before changing the MAC for
> > a network interface?
> 
> Program the MAC address during suspend? I assume userspace is no
> longer active at this point, so the address should be stable.

What is the timing requirements for a system going into suspend vs a WoL
packet being sent? Should a WoL packet abort entry into suspend? If yes,
then we need to program the MAC before the PHY is suspended, because
suspend could already be in progress.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

