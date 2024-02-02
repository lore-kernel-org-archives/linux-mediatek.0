Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D42C4828E
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Feb 2024 11:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UslJPsc9OxqAKRDemcvqM9t/waIR2GXs7pcOUZ0/ORQ=; b=V3aClR3murWQv5gHDm7rQuQVrH
	iLFAejXPq3GFQ/4zY6jrwMbCeyshWN8Dcei6dWO6TFe+3J52PBuA1lIfhcpjYBTdekUtnS4RTXJVf
	EE5UKFCGixJLQc45ngpp2E27FyS0f7xyNRyfGKkekfmBHPW4uwRPewisAzZioxkB4Y6S7Q4puNs/v
	c9WogsmnOfYYZV4Nx6AXb9dRmdcUISyrv5V99LAGpsF9LF04t2gBgurBIZN8VWcfLjE1tBqjrxw7H
	s9Nym45d38ao51pC68McOwZClkIFGVrGwBeptb5Sxeg2ZuaktQzakOyCkCTyFH5285vbOXJDVD4/Y
	cL5a80Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVruZ-0000000BKbA-0v4f;
	Fri, 02 Feb 2024 11:40:47 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVruV-0000000BKZE-1e83;
	Fri, 02 Feb 2024 11:40:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UslJPsc9OxqAKRDemcvqM9t/waIR2GXs7pcOUZ0/ORQ=; b=jGp8goMJO/MxQ0XCJBfcTUrVlZ
	xZigOzTQl82Q8t4B92czFeAdsOazhcWc0byV/RMFxvtxNPdRsd3Pd/98g/123aQIqSzg4BJd0zKA7
	6b9U2pyFIZBoaXbM0oZtq2p/jhjv81jjqAZsffVCIDl4f+Sy9SaVHMznBIgycpw28JXHyheJskcv2
	qTf7ClI1YPceYNXMX9UidY/M0X7H0n314C0JuZeE3P17Q47bP5/hXk2TB+Gw/GeVKdjTU3PhlOX1x
	E8Ttl6pFzqH+aFIBCh8R+VXlHO6FuMM7EuhKoVzYtIGVkrGrjIm3aPaWBTEwf2ZDGCO6265lnP52l
	6Qlaix/Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46710)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rVruE-0005tL-1l;
	Fri, 02 Feb 2024 11:40:26 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rVru6-0008Hm-Un; Fri, 02 Feb 2024 11:40:18 +0000
Date: Fri, 2 Feb 2024 11:40:18 +0000
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
Subject: Re: [PATCH net-next v3 1/7] net: dsa: mt7530: empty default case on
 mt7530_setup_port5()
Message-ID: <ZbzUotyQm/FyKK7G@shell.armlinux.org.uk>
References: <20240202-for-netnext-mt7530-improvements-2-v3-0-63d5adae99ca@arinc9.com>
 <20240202-for-netnext-mt7530-improvements-2-v3-1-63d5adae99ca@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240202-for-netnext-mt7530-improvements-2-v3-1-63d5adae99ca@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_034043_452925_BBF74918 
X-CRM114-Status: GOOD (  19.60  )
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

On Fri, Feb 02, 2024 at 12:19:07PM +0300, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> There're two code paths for setting up port 5:
> 
> mt7530_setup()
> -> mt7530_setup_port5()
> 
> mt753x_phylink_mac_config()
> -> mt753x_mac_config()
>    -> mt7530_mac_config()
>       -> mt7530_setup_port5()
> 
> On the first code path, priv->p5_intf_sel is either set to
> P5_INTF_SEL_PHY_P0 or P5_INTF_SEL_PHY_P4 when mt7530_setup_port5() is run.
> 
> On the second code path, priv->p5_intf_sel is set to P5_INTF_SEL_GMAC5 when
> mt7530_setup_port5() is run.
> 
> Empty the default case which will never run but is needed nonetheless to
> handle all the remaining enumeration values.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

While reviewing this change, but not related to it, I notice that this
function sets the TX delay based on the RGMII interface mode. This isn't
correct. I've explained why this is this many times in the past, but
essentially it comes down to the model:


phy-mode in NIC node	Network driver	PCB		PHY
rgmii			no delays	delays		no delays
rgmii-id		no delays	no delays	tx/rx delays
rgmii-txid		no delays	no delays	tx delays
rgmii-rxid		no delays	no delays	rx delays

Then we have rx-internal-delay-ps and tx-internal-delay-ps in the NIC
node which define the RGMII delays at the local end and similar
properties for the PHY node.


So, if we take the view that, when a switch is connected to a NIC in
RGMII mode, then the phy-mode specified delays still should not impact
the local NIC.

Now, for the switch, we specify the phy-mode in the port node as well.
Consider the case of a switch port connected to a RGMII PHY. This has
to operate in exactly the same way as a normal NIC - that is, the
RGMII delays at the port should be ignored as it's the responsibility
of a PHY.

The final scenario to examine is the case of a RGMII switch port
connected to a NIC. The NIC's phy-mode has no way to be communicated
to DSA or vice versa, so neither phy-mode can impact the other side
of the RGMII link, but should only place the link into RGMII mode.
Given everything I've said above, the only way to configure RGMII
delays is via the rx-internal-delay-ps and tx-internal-delay-ps
properties. So, DSA drivers should _not_ be configuring their ports
with RGMII delays based on the RGMII phy interface mode.

The above is my purely logically reasoned point of view on this
subject. Others may have other (to me completely illogical)
interpretations that can only lead to interoperability issues.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

