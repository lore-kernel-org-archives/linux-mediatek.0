Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA25ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Sep 2022 19:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBXcTqRXIyzn6/VpGTEqpFLugw8xANRV30xtPRjF4JM=; b=SZnNGOnSJuORQxveaT3xmlh/MT
	peJVoJM6eX1ceNX9jzq/x3NPG871iegA5xbeDYhuMj9OAclDJVumPTxsLQ5QXPtvMHS7F0/matmPF
	1U/qEzWvAPaSw1crq6Q+kH/TEzdGjbicF0gHq0gPDQtYXdvmyUklZ/x7x+BnMLVtkutrdEhdOMSxz
	Oi2M/Lf+DVy82K+i1IrFEyD6I22BxLm+UFpn0nuBuvpjQhOXqB/sqglMM5Mx2pxJd6n1qJnwtbLNT
	G9UCmCZI+wkWP73VcBYDm+zVZ2wSDYFn2+Wlt9PUUJ5FRfMBsn7RXfK2LhFnRzfu12uQ8ajbn4mdO
	7qH5faaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXT6D-004DBM-Rr; Sun, 11 Sep 2022 19:58:38 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXT6B-004DAJ-30
	for linux-mediatek@lists.infradead.org; Sun, 11 Sep 2022 19:58:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dBXcTqRXIyzn6/VpGTEqpFLugw8xANRV30xtPRjF4JM=; b=kgEnqC12NPmUW9Ab1FHNXV48HK
	fJ5s/kqjoO97QIJAGaJ1ipS1CmsJPmyoyRjWBHvhhuXePuWMqk1PXWZXqMkQbnoDNlB74lrHLq17f
	DukCVxbGvebqKAnLEJkljmbPBHBQZvQB9/IuIpse5n/2qTjKdLFfxeUTZwTco+uF3L0fde1xlyIG0
	jiEST458X8TcQJwuHtd6FeBAkte3JlTc22WMx7RV9qyDE5uCwzKOmJX1ehDeLLjouaFnbRnCw6gqy
	e4Wmh3qF9G7KLGhapLBTNoxmTkxV1j84c6fyClQoq8expCmYMriR6RQtXubHmuQ97qMRQiDqiwerS
	R7wO7KFQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34244)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1oXT5z-0000uu-NL; Sun, 11 Sep 2022 20:58:23 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1oXT5r-0007P8-G9; Sun, 11 Sep 2022 20:58:15 +0100
Date: Sun, 11 Sep 2022 20:58:15 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alexander 'lynxis' Couzens <lynxis@fe80.eu>
Subject: Re: [PATCH] net: dsa: mt7530: add support for in-band link status
Message-ID: <Yx4910YC6/Y7ghfm@shell.armlinux.org.uk>
References: <YxvkbO9PoNi86BZa@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxvkbO9PoNi86BZa@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220911_125835_185942_5F02564A 
X-CRM114-Status: GOOD (  10.31  )
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

Hi,

Just two points please:

On Sat, Sep 10, 2022 at 02:12:12AM +0100, Daniel Golle wrote:
> +static void
> +mt7531_sgmii_pcs_get_state_inband(struct mt7530_priv *priv, int port,
> +				  struct phylink_link_state *state)
> +{
> +	unsigned int val;
> +
> +	val = mt7530_read(priv, MT7531_PCS_CONTROL_1(port));
> +	state->link = !!(val & MT7531_SGMII_LINK_STATUS);
> +	if (!state->link)
> +		return;
> +
> +	if (state->interface == PHY_INTERFACE_MODE_2500BASEX)
> +		state->speed = SPEED_2500;
> +	else
> +		state->speed = SPEED_1000;
> +
> +	state->duplex = DUPLEX_FULL;
> +	state->pause = 0;

MLO_PAUSE_NONE please.

Also, please set state->an_complete appropriately.


-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

