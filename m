Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D40D65553
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2024 20:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zzmuQQKxyTgx9LMpYPrh3p1tSF7mzJ4FGaCyi5J1O2E=; b=DXEN1p8r8PY5bgy8tGwrunl7VK
	t/D40ebxKzMlkxNFz/9WREWpnMNLlHjHK3RJ/a8enjq+lZ4QQD4OYHL73g7bgEiUhQbTtICfNFerw
	7/KXi7wg38SDiki5S4qO+JM1WoWluMhF01bp+nfFrU5GWrJc/3tI9cRT9MBLnBXL3AuXJXdHdadWY
	S0XKLRNy0dhGUEgg4zAiyju34zQtvrIqLrKZCQju2PFTMqh+4L96GOStINa/Ol0jwizSUxTIPKuVk
	0lYjrMLNpatbYOadTGuMBZIecOg9Fy+WovIwmZwIei5si+CYQKzOq1QeR/dNKYWK49eILbLPQoh8Z
	NPHDSG4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG1lW-0000000BamP-1MBu;
	Tue, 26 Nov 2024 20:02:30 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG1kV-0000000Babo-3zSI;
	Tue, 26 Nov 2024 20:01:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=zzmuQQKxyTgx9LMpYPrh3p1tSF7mzJ4FGaCyi5J1O2E=; b=b+wSD1yUVZO2M7+N3jComz28RJ
	wsGEgCkqXXhnRKMzL1bOegHzG46lNuLnZCUZNer+7Wujp4VPqyY5B7sHoo4xt+YYT9U4fXsIJw5mJ
	yyFHF0axxcJS3Uqa1ltcjBJHdJaSuhmPW2TguBK9ibq0qd3Ws+NIGgkMerS2GQ46dWnA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tG1kA-00EYYP-Tu; Tue, 26 Nov 2024 21:01:06 +0100
Date: Tue, 26 Nov 2024 21:01:06 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH RFC net-next 01/16] net: phylink: pass phylink and pcs
 into phylink_pcs_neg_mode()
Message-ID: <630a8c53-55c0-49c9-a53f-ce6478641a11@lunn.ch>
References: <Z0WTpE8wkpjMiv_J@shell.armlinux.org.uk>
 <E1tFrnw-005xPe-KN@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tFrnw-005xPe-KN@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_120127_984224_A6121CD4 
X-CRM114-Status: GOOD (  11.40  )
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

On Tue, Nov 26, 2024 at 09:24:20AM +0000, Russell King (Oracle) wrote:
> Move the call to phylink_pcs_neg_mode() in phylink_major_config() after
> we have selected the appropriate PCS to allow the PCS to be passed in.
> 
> Add struct phylink and struct phylink_pcs pointers to
> phylink_pcs_neg_mode() and pass in the appropriate structures. Set
> pl->pcs_neg_mode before returning, and remove the return value.
> 
> This will allow the capabilities of the PCS and any PHY to be used when
> deciding which pcs_neg_mode should be used.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

