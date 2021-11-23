Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B562EC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 19:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vc0eLVnLBKjdBW6ss5MPVPn43I3Orv4Patrh5E7I6gs=; b=HZVt2u2d4rotxa
	q8tMjklfGIhBYxQY+UIo6jX0Tl41Cr/Qzj3aW7iumQUp7iPapDdxX1fnSzo5rEcIYzbOxnG218nGJ
	CwvDpndZ114iknsKWEjIfrdLheuA+UoSqjGrSzJIq4E8IoHr/7tyZG8ZGj3FbhBGfNlghygy3/MNa
	uNmoJSU6u8j9c7/oyCczP4X6cHgGiysN2E9A4T515Bwo47QQ4cQfG+fLPFatne9N4AfOIqxQbKQBp
	Bwh1hbfIq7AKBwo30w7dh7A7nje6i0PupEa8PpLOvaieOum2jUp7lKWIPbK0bidLM3JBmcII8eueE
	wHh3HOGI11hUe7qfJzEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpboW-003NDa-7p; Tue, 23 Nov 2021 19:50:48 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpboH-003NAr-Pj; Tue, 23 Nov 2021 19:50:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JqPQT+5l4PKOmnzgMmJcdponKw5AJ1lusJwfSB+JKtc=; b=I1bAbDItaiXpFxQ3LNSctXv/hd
 hEj16n9n5ke8/jcmeowt/V6FIcyeQtBWHs/VBbai21S2YagXJxPXNyE8G4Pw4XdqNAaEYoxUJ8Mgj
 VKRWp1zwhF4HDIQKkqaQx3oGPhzvynHhI5v0sBnJD8MO35BLZXeVyZ1MrVn3UXrqRe9mDvDYDA2U1
 xlAVJ0QaE449Z+bVT8nAdZxJSYODYSHi6nMOWzzygi67PH8W8VIzQ79drEiDSQcBkrWmEaV4JlkOm
 gYyNHkn9Y12R7rTJEQAtJxeXglN//mWe/SAqCBoO6Ui54t9bph0/ZKX6wk9TqyHHHHhP3VGBufPxk
 fge9XwBA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55826)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1mpbo4-0008Kl-Iw; Tue, 23 Nov 2021 19:50:20 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1mpbo1-0000V4-4Y; Tue, 23 Nov 2021 19:50:17 +0000
Date: Tue, 23 Nov 2021 19:50:17 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Sean Anderson <sean.anderson@seco.com>,
 Chris Snook <chris.snook@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 Florian Fainelli <f.fainelli@gmail.com>, John Crispin <john@phrozen.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH RFC net-next 8/8] net: phylink: allow PCS to be removed
Message-ID: <YZ1F+dD3Jwc/k1Xw@shell.armlinux.org.uk>
References: <YZy59OTNCpKoPZT/@shell.armlinux.org.uk>
 <E1mpSba-00BXp6-9e@rmk-PC.armlinux.org.uk>
 <20211123120825.jvuh7444wdxzugbo@skbuf>
 <YZ0R6T33DNTW80SU@shell.armlinux.org.uk>
 <90262b1c-fee2-f906-69df-1171ff241077@seco.com>
 <20211123181515.qqo7e4xbuu2ntwgt@skbuf>
 <472ce8f0-a592-ce5b-0005-7d765b2d0e93@seco.com>
 <20211123193017.rtvxyvb3oheqoxlz@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211123193017.rtvxyvb3oheqoxlz@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_115033_861431_AF4BE018 
X-CRM114-Status: GOOD (  14.77  )
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

On Tue, Nov 23, 2021 at 09:30:17PM +0200, Vladimir Oltean wrote:
> Sorry if you feel like I am asking too many questions. I just want to
> understand what I'm being asked to review here :)
> 
> So going back to the initial question. What use case do these patches
> help to make some progress with?

If we exclude patch 8, this series:

1) identifies all those drivers that are reliant on the legacy behaviour
   of phylink, which can then be targetted for modernisation - some of
   which may be trivial to do. ag71xx and axienet have turned out to be
   two drivers that can be trivially converted.

2) hopefully stops the legacy use finding its way into new drivers by
   making it easier to spot in review, but hopefully people will realise
   that setting the legacy flag in their driver to use the old hooks is
   something they probably want to avoid.

3) gives consistent phylink behaviour to modern drivers which may or
   may not decide to register a PCS with phylink.

(3) is probably the most important point for any driver that registers
a PCS conditionally. Right now, any driver that does this gets a
slightly different behaviour from phylink as detailed in patch 7.

I would like to remove the legacy code and old .mac_pcs_get_state and
.mac_an_restart callbacks some day...

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
