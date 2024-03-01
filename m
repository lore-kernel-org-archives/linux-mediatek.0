Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D479AC5478C
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 14:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yYU2P/XionBukymtyfAivEvDMyJYX93BV07iZlCfOYE=; b=zpdLTSaCbdOIQqll1tAHy+XWyD
	qDh9zPjC3A8/evqddu7TEysVeqjS5VGP25ADqwAlIULKSUf1eoKJk855XQbnU14KDhDixYceDUY5Z
	shmjYekoKWf/nVuopjreAe2PdEp02BtsBtC7GrSvznE8j5DTzmmwDyBLnKZOya+/dgsvS+MBwTJqp
	AqSeIMBlnzYX6BoTHAhR2URJIIA6Uq2FKUt6SjIOLOaxZ6FQqVqc4QnP7sng10EoYSjB8zeUJeyC+
	uLRnhIis2aWjWF9AJHHDTRLJARHVXkXIaul10i97SHEqpJidyV+2oMq/9Jvfoycs+ztunuBoJurqv
	D8YXNuew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg4D7-00000000n03-3bRA;
	Fri, 01 Mar 2024 14:50:05 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg4D4-00000000mwO-30Xn;
	Fri, 01 Mar 2024 14:50:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yYU2P/XionBukymtyfAivEvDMyJYX93BV07iZlCfOYE=; b=tUADbGwvT+bsqxHHRHjijlFIck
	/MxOPOG46qCY9h2+BenQw2uzIhrLdYBDgLxjbu8yWYH7flCOABA55iFsEg9N7dxj1gxDw59UDU9r8
	tpqrWyKZV+yEY4ka3CG07cwSmMkGzDPsTgzkpHKtgWR+Y8lFiTbSGPB0p7OpjA9uwLcjTIUElDlks
	ja7yEhTbbw+CbXM14OppCextPo810gFu2NaEQ4z/wCi/q2sXlu6fcoA+6HJjhcx78eVS5akivlXgA
	zxJ8PntBaP2UA2YMn5sWKulvyHNYylCYIl7lcOiwUkvMT+PrbAOxz2jt8n+ke4U0TaQWDMmgriaer
	3WJOsdqA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49086)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rg4Cj-0001iq-1A;
	Fri, 01 Mar 2024 14:49:41 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rg4Cc-0001p9-1m; Fri, 01 Mar 2024 14:49:34 +0000
Date: Fri, 1 Mar 2024 14:49:33 +0000
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
Subject: Re: [PATCH net-next v3 1/9] net: dsa: mt7530: remove
 .mac_port_config for MT7988 and make it optional
Message-ID: <ZeHq/ZoVqMD9BojD@shell.armlinux.org.uk>
References: <20240301-for-netnext-mt7530-improvements-3-v3-0-449f4f166454@arinc9.com>
 <20240301-for-netnext-mt7530-improvements-3-v3-1-449f4f166454@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240301-for-netnext-mt7530-improvements-3-v3-1-449f4f166454@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_065002_783191_A611EEB3 
X-CRM114-Status: GOOD (  13.17  )
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

On Fri, Mar 01, 2024 at 12:42:57PM +0200, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> For the switch on the MT7988 SoC, the mac_port_config member for ID_MT7988
> in mt753x_table is not needed as the interfaces of all MACs are already
> handled on mt7988_mac_port_get_caps().
> 
> Therefore, remove the mac_port_config member from ID_MT7988 in
> mt753x_table. Before calling priv->info->mac_port_config(), if there's no
> mac_port_config member in mt753x_table, exit mt753x_mac_config()
> successfully.
> 
> Remove calling priv->info->mac_port_config() from the sanity check as the
> sanity check requires a pointer to a mac_port_config function to be
> non-NULL. This will fail for MT7988 as mac_port_config won't be a member of
> its info table.
> 
> Co-developed-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

