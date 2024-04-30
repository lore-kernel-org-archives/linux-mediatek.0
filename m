Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E14C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 13:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TwVm5+lnEYg5CEZ7tfzTszScGuXmoWaijPkjxaNJWew=; b=vW9Sj50ye5ZvsGBi3mAnwXTrkW
	M3x8m/VzKPI5/v1pvJ2/5YEGV+GZ/9/wNNLAuifG4ix1BAZ4qP/U2ki8HW4QY58LFNliekB7xq7zR
	yhKSj5GRn/56ZCEB+gJ5YL7MWEELtGmNA19RwSm+QfFqjPUbKLzvu8g1j/K2RALzGxmyHIgtpChim
	1ZYAmIVlZ4oG5fNQQXJV2dAfg5pRuFmDNQjDo2SMSRMyEVUgCdxi1HappYvMWAawPkz+0kP401gG7
	PyNnKIieZtd/SwyQBsXheFrmAotPM6r8tQhcSoVXdLYhs5gU82bfmhjyk7PUh32FWQDnEwOLTnf9f
	lvLB1WXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1nR0-00000006Vvm-1LCv;
	Tue, 30 Apr 2024 13:22:14 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1nQw-00000006Voz-1Zl2;
	Tue, 30 Apr 2024 13:22:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=TwVm5+lnEYg5CEZ7tfzTszScGuXmoWaijPkjxaNJWew=; b=hNdLY11MBVwiLcsj/KLRRRmmP/
	+UY3ZGxIEL2VvFBxE/WLExR1zJyiE6LBbzELdBA+fc3Uwl75f4ReqFshL4Nn3ECoBUEYCT3QXFn75
	e4dRXSSCQt4hJtfgwWr2fwAkSx8FAErl5RBYCgAxH2oThySmZ6C0A36rYLwesuviP2mY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s1nQM-00EL6Y-Kn; Tue, 30 Apr 2024 15:21:34 +0200
Date: Tue, 30 Apr 2024 15:21:34 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Felix Fietkau <nbd@nbd.name>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Landen Chao <Landen.Chao@mediatek.com>, devicetree@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: dsa: mt7530: fix impossible MDIO address and
 issue warning
Message-ID: <ab0875ad-b8a8-4055-93f7-7f9f51910098@lunn.ch>
References: <e615351aefba25e990215845e4812e6cb8153b28.1714433716.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e615351aefba25e990215845e4812e6cb8153b28.1714433716.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_062210_518631_758FAB1F 
X-CRM114-Status: GOOD (  29.01  )
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

On Tue, Apr 30, 2024 at 12:45:46AM +0100, Daniel Golle wrote:
> The MDIO address of the MT7530 and MT7531 switch ICs can be configured
> using bootstrap pins. However, there are only 4 possible options for the
> switch itself: 7, 15, 23 and 31 (ie. only 3 and 4 can be configured, bit
> 0~2 are always 111). Practically all boards known as of today use the
> default setting which is to have the switch respond to address 31, while
> the built-in switch PHYs respond to address 0~4 in this case.
> 
> However, even in MediaTek's SDK the address of the switch is wrongly
> stated in the device trees as 0 (while in reality it is 31), so warn the
> user about such broken device tree and make a good guess what was
> actually intended.
> 
> This is imporant to not break compatibility with older Device Trees as
> with commit 868ff5f4944a ("net: dsa: mt7530-mdio: read PHY address of
> switch from device tree") the address in device tree will be taken into
> account. Doing so instead of assuming the switch is always at
> address 31 which was previously hard-coded will obviously break things
> for many existing downstream device trees as they contain the wrong
> address (0) which previously didn't matter.
> 
> Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  drivers/net/dsa/mt7530-mdio.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/net/dsa/mt7530-mdio.c b/drivers/net/dsa/mt7530-mdio.c
> index fa3ee85a99c1..119630fd9060 100644
> --- a/drivers/net/dsa/mt7530-mdio.c
> +++ b/drivers/net/dsa/mt7530-mdio.c
> @@ -193,6 +193,19 @@ mt7530_probe(struct mdio_device *mdiodev)
>  			return PTR_ERR(priv->io_pwr);
>  	}
>  
> +	/* Only MDIO bus address 7, 15, 23 and 31 are valid options */
> +	if (~(priv->mdiodev->addr & 0x7) & 0x7) {
> +		/* If the address in DT must be wrong, make a good guess about
> +		 * the most likely intention, and issue a warning.
> +		 */
> +		int correct_addr = ((((priv->mdiodev->addr - 7) & ~0x7) % 0x20) + 7) & 0x1f;
> +
> +		dev_warn(&mdiodev->dev,
> +			 "impossible switch MDIO address in device tree: %d, assuming %d\n",
> +			 priv->mdiodev->addr, correct_addr);

You could include FW_WARN in this, to indicate this is a firmware
issue. It is not used too much with DT, since it was originally
intended for ACPI issues, but a few ARM systems use it with DT.

	 Andrew

