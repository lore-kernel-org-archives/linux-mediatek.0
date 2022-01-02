Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD1CC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Jan 2022 16:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZyGXm81WCEXg0m3NiPeK0tVXG61WjJPLYlnLHD4WEpQ=; b=IDzBrKVcqCDNZy
	g6bZXeFBVWYnEPtZ5woelg13oYtMkxiiVl1tTVJOmGaJpbP5mZTrK/aQQmE04HO+aOKwkcvOBOFgh
	7RWk7D5vgq5Ef47q6KgIu7YHdq84/NKEBL2ZNKLR7hPQKCNWK0uXZpw1AimiHlQ3Eh2Ln2b9z8QSo
	pTR3h3hSJND6Apn41R1wyUyNCoRBcSagsZZdXaHjUog9ANYjwXNUh7CFvU1I2Vkl6XuYlkE0iZVyA
	l6sUxOI+OE2PXwe0BDARmi7K0/e9+ZmuVYrfos5dUQgKmxbWtAycQ2nUFozR+rI7mltgJb8OvgEFa
	n6aJZq70gi3pi0mLPylw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n43yN-007xuD-UE; Sun, 02 Jan 2022 16:44:43 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n43yK-007xtR-TX; Sun, 02 Jan 2022 16:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=fnD2dhLxoIMRnhwXOVwb+QU/PmiAJJndrOMvghYo6yA=; b=KTE0Bn+UtkcO6cFbAWRG0STzQK
 h7JsFqMq/J9r1KQ82bKg+X+ANroDnLWBkNemhdsD0mdB9mEqVhbE4ry4cwVQvTkRT+Wjkx/WtsX0d
 xPNQtl2anV+BiNPhMcdHmhDujw+shyQc1uIcmuM5tMKoExXO3axmESqWX0E9j2o4Cqq0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1n43yJ-000Jsy-5N; Sun, 02 Jan 2022 17:44:39 +0100
Date: Sun, 2 Jan 2022 17:44:39 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Michael Lee <igvtee@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v10 2/3] net: mdio: add helpers to extract clause 45
 regad and devad fields
Message-ID: <YdHWd1kabzYee1Gp@lunn.ch>
References: <YdCNZh5PsBwbfMtp@lunn.ch>
 <YdHJYuO0rYAoWAfD@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YdHJYuO0rYAoWAfD@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220102_084440_980917_A549B45F 
X-CRM114-Status: UNSURE (   9.42  )
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

On Sun, Jan 02, 2022 at 03:48:50PM +0000, Daniel Golle wrote:
> From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> 
> Add a couple of helpers and definitions to extract the clause 45 regad
> and devad fields from the regnum passed into MDIO drivers.
> 
> Tested-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
