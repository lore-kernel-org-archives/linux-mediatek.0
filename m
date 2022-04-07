Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA5EC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 14:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MjLt4D7JpxZaBf1+a0GjJi0ljKKow1r/+oEjyR9agiQ=; b=EBwddfMOLpgoVF
	bBSozIL9SmB2x81iW/BG/DO0xUUMh6Q6WHlXderzs0Y12WBbJR5vtFZ7qgsc4u+cfW7pQXkXl5Zdt
	hDddFd+N8aenV1ZNPTc1US9+Vc/XUYRTMRL/AsIbNyr+o7+/vZF0Cl0G4DyECQJQAzYfRJMlZc9er
	hI4U0fapl2Tj2KeUg8vqaPpnj0zl6HcP2vWT0zbgfsXb/FlZOuCLuO5QuQjeuQcuc9VwlFFwk2T12
	nnoYJqJzw8Kry2tnHM2e8LJRm2yiQr7uOoDbR601aGStUfpWy4o6dCLxoI8i4s1q/Q767Rd/VTGGr
	UyOH7kiSIRS5LFvQxBaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncTSM-00CUYt-HU; Thu, 07 Apr 2022 14:49:54 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncTSA-00CUDW-Ht; Thu, 07 Apr 2022 14:49:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r0zup9NDI7jXFxp/JVXxLT/8LZu/OSf3lefpjk6QeR8=; b=Bv9WkOnL24l9G6v1zJ169lwqO6
 WVocmiELgUDsBaGf5HPVkVyGoCjF7GOKlXZqaj0lxr0smNeoFjMgSKLnO+SO8KVWioliSfbrGwcQy
 0MPzjJ3+mYRg5Fep2GV0FnOhWUDqQOIfk9rugOFJ41aDN/x/NCKoPqh9RBxhbZ0cPuciBkdVCrYZj
 SMc6AkWgg3aU6DXx1xu24kEi6rvEi0YAfXbAJSTrlT/K9bBPs0M0umjwBV6Wm9qMl5Qb9F4ZJ3ZnN
 aU67xsFoUjbpAcg7gL1oQbeOQiul4MTu8Ekq5WdMlHvw+BhbVc4Uk0aye8VJBWheR8A29SEnJJcZz
 XiW2jTEw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58160)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1ncTPn-0004jh-Uu; Thu, 07 Apr 2022 15:47:15 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1ncTPi-0006An-DY; Thu, 07 Apr 2022 15:47:10 +0100
Date: Thu, 7 Apr 2022 15:47:10 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 5/9] net: dsa: mt7530: only indicate linkmodes
 that can be supported
Message-ID: <Yk75boz1dIWy5jhn@shell.armlinux.org.uk>
References: <Yk1iHCy4fqvxsvu0@shell.armlinux.org.uk>
 <E1nc3Dd-004hq7-Co@rmk-PC.armlinux.org.uk>
 <20220406115250.047570c1@kernel.org>
 <20220406223443.193b0ce1@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220406223443.193b0ce1@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_074942_615037_9AC94DC3 
X-CRM114-Status: UNSURE (   9.91  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Apr 06, 2022 at 10:34:43PM +0200, Marek Beh=FAn wrote:
> On Wed, 6 Apr 2022 11:52:50 -0700
> Jakub Kicinski <kuba@kernel.org> wrote:
> =

> > On Wed, 06 Apr 2022 11:48:57 +0100 Russell King (Oracle) wrote:
> > > -	if (state->interface !=3D PHY_INTERFACE_MODE_MII) {
> > > +	if (state->interface !=3D PHY_INTERFACE_MODE_MII &&
> > > +	    state->interface !=3D PHY_INTERFACE_MODE_2500BASEX)
> > >  		phylink_set(mask, 1000baseT_Full);
> > >  		phylink_set(mask, 1000baseX_Full);
> > >  	}  =

> > =

> > Missing { here. Dunno if kbuild bot told you already.
> =

> Probably not, because next patch removes this code entirely :)

kbuild bot normally does catch these if I've missed them locally, but
I find the bot is very very sporadic. Thanks for spotting it.

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
