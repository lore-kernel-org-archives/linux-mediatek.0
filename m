Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BDCC64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 11:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5eLTHF6ZVD7q+XoBX/Z8f3udaRyHm9hE2Qes4Y+33Z8=; b=3rXQ6OXRIYKxEM5iI8gRFy2Irm
	mWSYquDWq0aodNsFRBxDpu7LK/pjblCdA1m5PrIxa4b5+7PCCY0hCtZ8i4lAAPKRVmVR8F+Yg00Av
	vTFnbga1Oi+EDn+lK0kH0O4H/rQdsKVDIFCiJof8oRnJiNVR9Uu11AxhGDR3rxr5MGSagv8de+b5o
	/04yq6P9y3axh3lkFlE31zQqedh3hoR2dQSJQ3VVtTfvYeXVAYNFxpqIsOmPkhHRNYo4W/3nrds+2
	t+ZhnvMIjqZuUV0uqdyclvPqSq0KeG+x/G34zP98BV9Scy2OoE0BcBbs5r00jBkKmsu6a3CjQQ+hJ
	tBHDNrUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZs7y-004e3X-6y; Wed, 08 Mar 2023 11:38:38 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZs7v-004e2O-DI; Wed, 08 Mar 2023 11:38:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5eLTHF6ZVD7q+XoBX/Z8f3udaRyHm9hE2Qes4Y+33Z8=; b=Jsw+Qi019/aK0xSskknbfctX55
	H/Kbz46G65qhIwm5ZlU0MQXS05aISh+FQJY3BeUtDyopl3ls7AlBppr28dKtrCNM3wPEsZBv7/gqs
	U70fpfCFe1dpkhcsnEanamebkLNCgwOb4qOa3r6s0HSRXY8h7YPlb+/xq9M1ByKCtZbRkMnucZ63b
	S6xm8ndirwkXSZpDeNW1m+8MTZYSl5WAGt2giq2HthVCOTbQYyym0/5eQf057TJmBh4pFp++NNUAh
	j4X9KjZ9JphQf4/PTu34ey9N8mPkpz4mz0Q0cnFDHztWynNihFXJKDvQmKtNkA2XJRV/rn+dBXUnb
	j1MvGi/g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36214)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pZs7t-0002N5-62; Wed, 08 Mar 2023 11:38:33 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pZs7r-0002XQ-RT; Wed, 08 Mar 2023 11:38:31 +0000
Date: Wed, 8 Mar 2023 11:38:31 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH net-next v12 09/18] net: ethernet: mtk_eth_soc: Fix link
 status for none-SGMII modes
Message-ID: <ZAhzt5eIZiJUyVm7@shell.armlinux.org.uk>
References: <cover.1678201958.git.daniel@makrotopia.org>
 <1590fb0e69f6243ac6a961b16bf7ae7534f46949.1678201958.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590fb0e69f6243ac6a961b16bf7ae7534f46949.1678201958.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_033835_464263_49DB49AB 
X-CRM114-Status: GOOD (  11.75  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <vladimir.oltean@nxp.com>, Eric Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Alexander Couzens <lynxis@fe80.eu>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Jianhui Zhao <zhaojh329@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 07, 2023 at 03:54:11PM +0000, Daniel Golle wrote:
> Link partner advertised link modes are not reported by the SerDes
> hardware if not operating in SGMII mode. Hence we cannot use
> phylink_mii_c22_pcs_decode_state() in this case.
> Implement reporting link and an_complete only and use speed according to
> the interface mode.
> 
> Fixes: 14a44ab0330d ("net: mtk_eth_soc: partially convert to phylink_pcs")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

This has been proven to work by Frank Wunderlich last October, so by
making this change, you will be regressing his setup.

What are you testing against? Have you proven independently that the
link partner is indeed sending a valid advertisement for the LPA
register to be filled in?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

