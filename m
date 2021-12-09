Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1482AC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 15:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V5I/CUPIKF9kUkDuGaBGywN9mkf/tpQTxyu2CzcP9iM=; b=CSl9U4vWdjG+xK
	+j/pJwveQTj4k41tyji0srW8ujpmAJveOc32gzEOucSbc4avLaBxD2I5/7O+w0Niq7P0FqdP7X2GD
	yaTfRgP4XHyrQ15HIfj+Zw/cw5oMyF5yMeGYkzsd/W8/rT2KCQ3+cU3ncEbIxKZ860hzTJu0IklaL
	2oTay2B/el+9KDS1cEv9YucNCaKa80FzrEDy5ZL/lxu2OdtOzJ7A2nvmZKLAngFBJMbyiTXr/EfZB
	KZUKTPXVYde5JEusodhsohkXr7zP5JeslhfhWaXFLpy8dosujg8LbAOxHruTbCB2cCxfOtCjJxXha
	4j8RiZxGKArkkfguDIAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvLOK-00GXu5-Ik; Thu, 09 Dec 2021 15:31:28 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvLO7-00GXrt-BQ; Thu, 09 Dec 2021 15:31:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=alBfIVkxb3HaXT6+zn6Qt1eKhIvAbRqBP6R32kDmr7g=; b=lNzn819v+ueV40HKyKUC5iDKQP
 Yaior53eB81yNanCB76nHcgRjQWEbCExNboL7Xx8E3eCmBxt0wfttNF7pECZ+s+UnoduKzuyA4D9x
 wiZAC0BdnwV52Qrgri02g1qKNvd0s8OiHvAxiDGtbSXXq2D4HGTwEHYgiO5ZjRBHvoCWezeSbtMxq
 wOdga3kJG+F7AqX1QeYNmZhJOH3Wcq0V6kjK5yJo4qwHOL1tYaI84xmbl5ixHsSC+ygUO3fBwgRbl
 jjDt7euU/qZkr5rMghyLdWDB4STCckhekrq76p0xh2Do6NvNbp6DYGOjwazQr/6slrpUUmwRUrpdG
 Cnq5YB3g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56202)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1mvLO0-0000B2-4J; Thu, 09 Dec 2021 15:31:08 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1mvLNy-0007JV-6Z; Thu, 09 Dec 2021 15:31:06 +0000
Date: Thu, 9 Dec 2021 15:31:06 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Chris Snook <chris.snook@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 Florian Fainelli <f.fainelli@gmail.com>, John Crispin <john@phrozen.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 1/5] net: phylink: add legacy_pre_march2020
 indicator
Message-ID: <YbIhOikjMwZ8aQlS@shell.armlinux.org.uk>
References: <DGaGmGgWrlVkW@shell.armlinux.org.uk>
 <E1mucmf-00EyCl-KA@rmk-PC.armlinux.org.uk>
 <YbIBT7/6b0evemPB@shell.armlinux.org.uk>
 <20211209072018.6f0413ed@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211209072018.6f0413ed@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_073115_435867_675F72D3 
X-CRM114-Status: GOOD (  10.20  )
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

On Thu, Dec 09, 2021 at 07:20:18AM -0800, Jakub Kicinski wrote:
> On Thu, 9 Dec 2021 13:14:55 +0000 Russell King (Oracle) wrote:
> > This series was incorrectly threaded to its cover letter; the patches
> > have now been re-sent with the correct message-ID for their cover
> > letter. Sadly, this mistake was not obvious until I looked at patchwork
> > to work out why they haven't been applied yet.
> 
> Hm, I think they were showing up fine in patchwork, I just didn't 
> get to them, yet. I'll apply as soon as I'm done with the weekly PR.

Yes, they're in patchwork, but patchwork is saying "no cover letter" for
them, which is what alerted me to the problem. E.g.

https://patchwork.kernel.org/project/netdevbpf/patch/E1mucmu-00EyD4-Vy@rmk-PC.armlinux.org.uk/

              Context              Check              Description
...
   netdev/cover_letter            warning Series does not have a cover letter

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
