Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93301C4828E
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Feb 2024 11:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMzyKXLvD5bCWLAnSG7LQUc76KmbvEK7xMGWqLkAp84=; b=BeLOntqZt4gl5p5SlcsquFtrNT
	jdqFFLxWflEp/90rT6PI4myKt/Ehx782jNfRt2v/0ueWND1P9oY8eCuRvd+cDm0WhbJCM9LV2EUrs
	ESKXhcXAPh8KnXhuHzJChg3alcqLAjLG4NH4eHwuov/O0pd8kbLUtMhPVMWkA4yDDKSW38e6Do4u2
	SFbYpZmToLFL8bl8++QJ6BvuANzIplW4Hq2L32+OaC/x72ZNN+crv8jVf1mPZ6X9+vU4gJUeQD5tL
	dWZVvfu6zlugdkUYqbEp6LPy89/5pPCyvISOPehw2VGFstmzTAwsxUzK7CughygMkLnQ2OqO6SkHF
	8mmS9KQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVrzb-0000000BLfC-0N2x;
	Fri, 02 Feb 2024 11:45:59 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVrzX-0000000BLeG-1aQI;
	Fri, 02 Feb 2024 11:45:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NMzyKXLvD5bCWLAnSG7LQUc76KmbvEK7xMGWqLkAp84=; b=pnwl8EWWJP/EPh7oo8FzwwNZnV
	eNLhuPMQ8WmVsruBxONkcOgm51ooQq6kt45NBEt6yUTqPxMTsq6L6uzcYrnmK8VejdcyK9Q455ojJ
	0uKdTi5/RuNOyShPkwARm1u5fz8kEQH+LOXXz8XM5Z6+BIDiI3dRE/vwpe8sQgC3tuRCGmvDn4oJG
	LKjp4GbvbwHqhCSV2iYUiUxg7A7zexwby7NHHdYu1wnOkn1nOj+pzsYuoR/PDLk++f/YXo8g6ae6I
	24CTDvu62YfX7ZS5loprhXgCANYrEItsU9ghPg5YMxjdgVCGtfxsMaoyNuJZ8QOdSh5exi/vcOqFd
	kisPK1Mg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46388)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rVrzM-0005tt-0k;
	Fri, 02 Feb 2024 11:45:44 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rVrzJ-0008Hw-2O; Fri, 02 Feb 2024 11:45:41 +0000
Date: Fri, 2 Feb 2024 11:45:40 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: arinc.unal@arinc9.com
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	Bartel Eerdekens <bartel.eerdekens@constell8.be>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v3 2/7] net: dsa: mt7530: call port 6 setup from
 mt7530_mac_config()
Message-ID: <ZbzV5Ly9rv6IsmVl@shell.armlinux.org.uk>
References: <20240202-for-netnext-mt7530-improvements-2-v3-0-63d5adae99ca@arinc9.com>
 <20240202-for-netnext-mt7530-improvements-2-v3-2-63d5adae99ca@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240202-for-netnext-mt7530-improvements-2-v3-2-63d5adae99ca@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_034555_443774_6C2DF540 
X-CRM114-Status: GOOD (  14.04  )
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

On Fri, Feb 02, 2024 at 12:19:08PM +0300, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> mt7530_pad_clk_setup() is called if port 6 is enabled. It used to do more
> things than setting up port 6. That part was moved to more appropriate
> locations, mt7530_setup() and mt7530_pll_setup().
> 
> Now that all it does is set up port 6, rename it to mt7530_setup_port6(),
> and move it to a more appropriate location, under mt7530_mac_config().
> 
> Leave an empty mt7530_pad_clk_setup() to satisfy the pad_setup function
> pointer.
> 
> This is the code path for setting up the ports before:
> 
> mt753x_phylink_mac_config()
> -> mt753x_mac_config()
>    -> mt7530_mac_config()
>       -> mt7530_setup_port5()
> -> mt753x_pad_setup()
>    -> mt7530_pad_clk_setup()
> 
> This is after:
> 
> mt753x_phylink_mac_config()
> -> mt753x_mac_config()
>    -> mt7530_mac_config()
>       -> mt7530_setup_port5()
>       -> mt7530_setup_port6()
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

I hope that the "default" case in mt7530_setup_port6() is effectively
unreachable - as long as mt7530_mac_port_get_caps() is paired with this
and only sets the interface modes in supported_interfaces that
mt7530_setup_port6() handles, then that will be fine.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

