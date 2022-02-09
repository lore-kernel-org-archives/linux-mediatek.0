Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC2AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Feb 2022 13:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f9qeMuF8ifMShpYEreEMSrk5pj9ejqHQWno1U0/q98o=; b=HGpdOzj2K0HS+E
	IHlzktbXk/c4gKIk7eO92/4HdJUUVXs3mVX47zehQXNCBLTKEggYNnL2Rd+yj8wkSyr3CHcLyZixh
	HKtjlO7Fc2bJpobblKCZ7Ermz25PA4vYPR4Cq+UhYhly562LfYGKXA6XOwkfRiG/y3zE1vgPgi/+N
	eKR+ar1S5oKWZv0yGwiBCe9Cql1K+lNF2m0qUs6zfjGudj/JKcJIQAlrpgk/yLQcEiIqfX1sN44Kt
	koqBJXlrTKftEzc0VrQEu/yDzuVUXeAIs719P8DEghEtZtwnLbtyS4uqLRMjK89ROrJ3u1tWrvOR3
	uX6o5ArQXwwdniJcO9sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHmiS-0007gZ-Pj; Wed, 09 Feb 2022 13:09:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHmiH-0007ZQ-OE; Wed, 09 Feb 2022 13:08:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=upC8s56EuBQezUfHCbf6Sex/+GOA674B29PJ8A+uuZs=; b=jEde0e7/5XB5RNBY5P0Vm0oUK/
 QNk0l0BR42QvBLJDWE23pmjEGFOKS25qjupBZFdyIZJJwMZtNP3X0WrjOua7p+6GABojoNDdZogGF
 qZM7TXQ+M6I80Mr3OfH2PGqACrQmHLPZo1U3VakRfdmDxMF1d8KHvphtcYkqa/9gUJYzc0hentYbu
 r5XLzDHUAP3TfdLJkNoKwXlqyT+0K6ukhwendyAGkad1ABuLhgeUDZlsfVBPQsPVZbJNbLMO0ezrf
 CJHIn6753z7Q+vcarDxi1uevRXBbnKEBwPjzPyuC83n0RHFIVlvu1S4yMspH0V8c8pmrew68mDaBL
 r9KChxpQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57168)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1nHmg8-0004XV-9o; Wed, 09 Feb 2022 13:06:36 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1nHmg4-0001Xq-PC; Wed, 09 Feb 2022 13:06:32 +0000
Date: Wed, 9 Feb 2022 13:06:32 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: DENG Qingfang <dqfext@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC net-next 0/7] net: dsa: mt7530: updates for phylink
 changes
Message-ID: <YgO8WMjc77BsOLtD@shell.armlinux.org.uk>
References: <YfwRN2ObqFbrw/fF@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YfwRN2ObqFbrw/fF@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_050849_811363_B26F3A99 
X-CRM114-Status: GOOD (  15.72  )
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

On Thu, Feb 03, 2022 at 05:30:31PM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> This series is a partial conversion of the mt7530 DSA driver to the
> modern phylink infrastructure. This driver has some exceptional cases
> which prevent - at the moment - its full conversion (particularly with
> the Autoneg bit) to using phylink_generic_validate().
> 
> What stands in the way is this if() condition in
> mt753x_phylink_validate():
> 
> 	if (state->interface != PHY_INTERFACE_MODE_TRGMII ||
> 	    !phy_interface_mode_is_8023z(state->interface)) {
> 
> reduces to being always true. I highlight this here for the attention
> of the driver maintainers.

I'm intending to submit this series later today, preserving the above
behaviour, as I like to keep drivers bug-for-bug compatible, with the
assumption that they've been tested as working, even if the code looks
wrong. However, it would be good if this point could be addressed.
Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
