Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B37C10DC1
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 17:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ZZNNhGyoTwRHgS/bMWVfX3vw+ZZ4cEePiAqrrIcnwM=; b=xpHBSanX4EivKU/NI7fXChvnEV
	9Hwajxl58pBK0Y5zjMr9ObvhBwAWB3HO8DgQKjUlcHCla6mkf/jAqMMRR6vOPHhC8IZJkQishgo0v
	EKFu8nDJX52vo4KCuCf/pFWbHZkEwim6i/BoSAX30E/dlUVj61v/FD/0tBj/k01rpH571ms9R7RFK
	4yvLQtgVERhw6GEbUZvDCSXLe9wVMRPL9L5+GYw+XsJLXwLpUx+qf0ARS5d6/NZi+K2WxajrU3w+h
	lA8QN5rTETiScfRISkUCruaxm3eaNdQOFVjo6sFm7nLnyxec5DzPqyYo8d5LdfEiub537nC0XGV9r
	R2Y+tXLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAwAL-00AzKR-2F;
	Wed, 06 Dec 2023 17:58:33 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAwAI-00AzIC-0c;
	Wed, 06 Dec 2023 17:58:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3ZZNNhGyoTwRHgS/bMWVfX3vw+ZZ4cEePiAqrrIcnwM=; b=0HbX49InVIrrypsWfM0ZmrDswH
	hUiEYIwZ/X0y6/g3n9MfR/Xe2G5AdEZwo+6WoFCG9muiQqjrdSwuIWlOmpA/dcAwSSIDNPabftXNo
	uUNE6oM3plQH/R0YwGvoVXykOm1A4uJeGpKeG2xQ6OpBt4v6vuNKuyUgCJLK2gEMd+nzY3h0O6rqU
	lVYOBys6d13VTBf1WTZRBZfPGgizzwR9LYBtitOMb3NgrraS95ziohm/QKnnBx5eXCTQ1NEWNAn6r
	jZStgPtTaO+kCOGSkHoMhAr3HpiHeQ3UkPTPRTIclBzQAngtVpzIr9Moie2tqITHv3pZ/w+4X8vqF
	3QJptGVQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56612)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rAw9w-0000E0-0u;
	Wed, 06 Dec 2023 17:58:08 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rAw9w-0002uo-Va; Wed, 06 Dec 2023 17:58:08 +0000
Date: Wed, 6 Dec 2023 17:58:08 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [RFC PATCH v2 5/8] net: pcs: add driver for MediaTek USXGMII PCS
Message-ID: <ZXC2MFn7pVX/KNmJ@shell.armlinux.org.uk>
References: <cover.1701826319.git.daniel@makrotopia.org>
 <3cd8af5e44554c2db2d7898494ee813967206bd9.1701826319.git.daniel@makrotopia.org>
 <20231206105838.069ae288@device.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206105838.069ae288@device.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_095830_231981_2FDF57CE 
X-CRM114-Status: GOOD (  12.55  )
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

On Wed, Dec 06, 2023 at 10:58:38AM +0100, Maxime Chevallier wrote:
> On Wed, 6 Dec 2023 01:44:38 +0000
> Daniel Golle <daniel@makrotopia.org> wrote:
> > +	/* Read USXGMII link status */
> > +	state->link = FIELD_GET(RG_PCS_RX_LINK_STATUS,
> > +				mtk_r32(mpcs, RG_PCS_RX_STATUS0));
> > +
> > +	/* Continuously repeat re-configuration sequence until link comes up */
> > +	if (!state->link) {
> > +		mtk_usxgmii_pcs_config(pcs, mpcs->neg_mode,
> > +				       state->interface, NULL, false);
> > +		return;
> 
> .pcs_get_state() isn't called only for link state polling,but also when querying
> the link state from ethtool, from phylink_ethtool_ksettings_get().
> 
> As mtk_usxgmii_pcs_config triggers a pcs reset and reconfiguration, won't this disrupt
> the link ? 

Highly likely if there's a race, but note that mtk_usxgmii_pcs_config()
only gets called if the link is *down*. I guess some IPs need a bit of
kicking to work properly.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

