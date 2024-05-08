Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B79C19F4F
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 May 2024 13:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rlmkt8g9gLz2FbVYrvJA9JT7otm1jUX7lKLhqslbHGI=; b=ct6BAh0V2atsW8qOwDVibQSx65
	4Q+Aw+oggHamLLUhm9zmWNhuUB8x2vwpgYVERUR5cpUKKHoL1wZm8moFWdJPxp9vjAF6fp7SQv4BW
	bLRerI1w3OoHUr8qxVuOBHnPAdH2YkfD0TP3NTZDo9dJe86ECB2MXnaNP9SlUODsrbtXCES9xBjny
	p3HlETMfUVoHMNRxllzNvVmkwIeRfuu5FqbAx9UzNfKYnObcdC58aMsCtwGwamGmRtyIBkGF75g7N
	DeGZ2hMmeQKok638X0wkLxZpwjsxXpiNb4QdH/cQXqJzVg3qkCPmyafp8MX8ClQJ1xVVY36KD3UyG
	Dq3QNi6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4h3d-0000000FZXJ-1ySq;
	Wed, 08 May 2024 13:10:05 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4h3X-0000000FZVe-1rJd;
	Wed, 08 May 2024 13:10:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rlmkt8g9gLz2FbVYrvJA9JT7otm1jUX7lKLhqslbHGI=; b=RxSJb7Sp74qndsfLvvKEIOPdMa
	KiM42boTGqab+gwvAILrvWeEgwiUvELAV9UohU9tBo+KLYB9Bi/BfXaH8X2T/DtUVugFGs6dDb0RK
	ENFqOb70DXPSiab+XKPwcLEP+OOr1zUF1h0/Fu3qoY6iaCXOeDx7LlBR/adnjPC/eB+6OqqTM7Az5
	gIrFB7py2+qzhy/7DTOthu2CnbU69O3Vk3XCFvxD6BK65qPLiGGKemYc34cRtBSWKiRZAelFFn/Lm
	zEJ7yxsL1sWRX0JI6WxfgLPVSQUEnDn4wpPGxGlpPaz4+qIQ5f5539AOQn5V0PqO3xzJadUtFB3Mu
	xWRQjYCA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39206)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1s4h39-0005FO-0X;
	Wed, 08 May 2024 14:09:35 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1s4h34-0001OL-HC; Wed, 08 May 2024 14:09:30 +0100
Date: Wed, 8 May 2024 14:09:30 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Sky Huang <SkyLake.Huang@mediatek.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH 2/3] net: phy: mediatek: Add mtk phy lib for token ring
 access & LED/other manipulations
Message-ID: <Zjt5iobHklvrVgtB@shell.armlinux.org.uk>
References: <20240425023325.15586-1-SkyLake.Huang@mediatek.com>
 <20240425023325.15586-3-SkyLake.Huang@mediatek.com>
 <Zjo9SZiGKDUf2Kwx@makrotopia.org>
 <a005409e-255e-4633-a58c-6c29e6708b34@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a005409e-255e-4633-a58c-6c29e6708b34@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_060959_786630_18B8B6FD 
X-CRM114-Status: GOOD (  18.48  )
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

On Wed, May 08, 2024 at 02:25:56PM +0200, Andrew Lunn wrote:
> On Tue, May 07, 2024 at 03:40:09PM +0100, Daniel Golle wrote:
> > Could you create this helper library in a way that it would be useful
> > also for the otherwise identical LED controller of the Airoha EN8811H,
> > ie. supporting both variants with LED_ON_LINK2500 at BIT(7) as well as
> > BIT(8) would be worth it imho as all the rest could be shared.
> 
> Please trim the email when replying to just what is relevant. If i
> need to page down lots of time to find a comment it is possible i will
> skip write passed a comment...

+1. There are _too_ _many_ people on netdev who just don't bother to do
this, and it's getting to the point where if people can't be bothered
to make it easier for me to engage with them, I'm just not going to be
bothered engaging with them. People need to realise that this is a two-
way thing, and stop making reviewers have extra work trying to find
their one or two line comment buried in a few hundred lines of irrevant
content. I might just send a reply, top posting, stating I can't be
bothered to read their email.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

