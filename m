Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23AFC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Dec 2021 21:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Gawx4IXSPh3mcOyBvWyWeUIEopIOGLptWR7OxpBXzw=; b=CiT6yob9CcUlor
	wr8bqR7DyphbqZjDrQFPNxJMTIt640iTCvi89cbUHRluMUfu6Iwcn1U16bGRQ0qPjyasLBezfXjYj
	qB69MYdOTZ2NxgoHsF6GqEWg0GwXx2g0DUTQyqZ40iYFpYE2YT5y6gRZuu2c7Mmgkn+9l4h+GKYnM
	gOMPUEPtBIECkmRm4JXqf4khyzd+TKgO6vnx4T6qwQsmWCOpqXJwrX+PYGGuMDBskyF7kz5wLAed1
	gixnLIUM1XGungx+ttR5yVMLFwrzsLroGkJQwv/x4q9g1YSno3dSgiy2Xfaw5gHuWigjCtOf9N8/g
	lgAd2jPHu5UdG5h6TGBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1bQE-00FtCO-UJ; Sun, 26 Dec 2021 21:51:18 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1bQC-00FtBU-Bx; Sun, 26 Dec 2021 21:51:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=KWjqwqswlcdAbUhm0etBm0ynDTKsWAc8HBTk4QxWbYs=; b=BI7SqIkp3zkvi0hI4KU5ODmyQD
 WGywKCiQGEmNIbfPZYXn5sRy4QU7/IFELfz/ieoz4BBOsEVK6NlgTBIUd2LQDnyAoqp/BXxZ8WUSk
 f/Y2q0sWTA/Eyug/EzLEQ1Z96l6upaCbWCDIz0HtX3SLSEf+yVWhzq74+3r+AkVgBbKI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1n1bQ4-00HWwe-62; Sun, 26 Dec 2021 22:51:08 +0100
Date: Sun, 26 Dec 2021 22:51:08 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH] net: ethernet: mtk_eth_soc: implement Clause 45 MDIO
 access
Message-ID: <YcjjzNJ159Bo1xk7@lunn.ch>
References: <YcjepQ2fmkPZ2+pE@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YcjepQ2fmkPZ2+pE@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_135116_433758_E6F88B04 
X-CRM114-Status: UNSURE (   6.27  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> +	if (phy_register & MII_ADDR_C45) {
> +		u8 dev_num = (phy_register >> 16) & 0x1f;
> +		u16 reg = (u16)(phy_register & 0xffff);

Hi Daniel

You can use the helpers

mdio_phy_id_is_c45()
mdio_phy_id_prtad()
mdio_phy_id_devad()

	Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
