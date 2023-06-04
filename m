Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90418C7EE29
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jun 2023 13:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UzzrhBNawZ31nGxvXXuqa4J3SochyxihEmrfIV4DZvY=; b=Vcdw2NpKiZuQWW59zv6V/ThrRH
	M5GmIKu0DeZ9tqaGAyS6sxAY21C5+jJjcJHWB+OgfAn6QrFkuSlFluqboldodgE5UlR2qXpjS11Cp
	7CYtlPngnF9PFjHEtb4KhwEHgkFeHM68ihitUoqLwKKAwYu8mAoGwC13S7rY4d2ci3d48BXDeCoHO
	MOujlif3gnRK7Ok8wHygjE+hlz1XonnjZAbdad2cgnzAn/Vl63lH2PrFg+DTPEZhVjiC+r3wGd+uk
	ryy7kA97H3cAOSpBgydMw1kUE3tOq/wRG+ardQEjPDCY8IADn/xnteBYT8Yf3jAxEfmVMXZaeTW5e
	wQjWLxFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5nUO-00CCVC-2m;
	Sun, 04 Jun 2023 13:09:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5nUL-00CC8W-0E;
	Sun, 04 Jun 2023 13:09:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UzzrhBNawZ31nGxvXXuqa4J3SochyxihEmrfIV4DZvY=; b=PelkEpSR3NnJ2cgM83e2WDHOll
	K07RelK5yOLv8J8HBKdF4PjKS1SkWSDmh0aM/GN3rj9Po+21pkbm8ZHmV5kIt0quivrYckxH04EiK
	mI1MgVfcMFmLFzY3ggf8RfPa3mzXd3eXaBrRDmy7z5L+mhMCqN/ZSDgGPws7EdlP72LEE7kE0nKcz
	5iYspNj739l3n5PHgOsxOYfDIn7+ZAPay1zcnPaHHnaeC1WMmPikJDR3htiVWtbafIsvxmjBSAEHZ
	qUdKdxUUkFtdLuVA/sxGTMvlfy12PskuB5qGj9LNbWg+eo8D3OXdWofb2nJSTEEIlOx0CCt/xFHci
	Zwsje9xw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48974)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1q5nRx-0002cf-68; Sun, 04 Jun 2023 14:07:13 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1q5nRr-00054c-EH; Sun, 04 Jun 2023 14:07:07 +0100
Date: Sun, 4 Jun 2023 14:07:07 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH net-next 08/30] net: dsa: mt7530: change p{5,6}_interface
 to p{5,6}_configured
Message-ID: <ZHyMezyKizkz2+Wg@shell.armlinux.org.uk>
References: <20230522121532.86610-9-arinc.unal@arinc9.com>
 <20230522121532.86610-9-arinc.unal@arinc9.com>
 <20230524175107.hwzygo7p4l4rvawj@skbuf>
 <576f92b0-1900-f6ff-e92d-4b82e3436ea1@arinc9.com>
 <20230526130145.7wg75yoe6ut4na7g@skbuf>
 <7117531f-a9f2-63eb-f69d-23267e5745d0@arinc9.com>
 <ZHsxdQZLkP/+5TF0@shell.armlinux.org.uk>
 <826fd2fc-fbf8-dab7-9c90-b726d15e2983@arinc9.com>
 <ZHyA/AmXmCxO6YMq@shell.armlinux.org.uk>
 <20230604125517.fwqh2uxzvsa7n5hu@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230604125517.fwqh2uxzvsa7n5hu@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_060941_207742_56266DCF 
X-CRM114-Status: GOOD (  12.62  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jun 04, 2023 at 03:55:17PM +0300, Vladimir Oltean wrote:
> On Sun, Jun 04, 2023 at 01:18:04PM +0100, Russell King (Oracle) wrote:
> > I don't remember whether Vladimir's firmware validator will fail for
> > mt753x if CPU ports are not fully described, but that would be well
> > worth checking. If it does, then we can be confident that phylink
> > will always be used, and those bypassing calls should not be necessary.
> 
> It does, I've just retested this:
> 
> [    8.469152] mscc_felix 0000:00:00.5: OF node /soc/pcie@1f0000000/ethernet-switch@0,5/ports/port@4 of CPU port 4 lacks the required "phy-handle", "fixed-link" or "managed" properties
> [    8.494571] mscc_felix 0000:00:00.5: error -EINVAL: Failed to register DSA switch
> [    8.502151] mscc_felix: probe of 0000:00:00.5 failed with error -22

... which isn't listed in dsa_switches_apply_workarounds[], and
neither is mt753x. Thanks.

So, that should be sufficient to know that the CPU port will always
properly described, and thus bypassing phylink in mt753x for the CPU
port should not be necessary.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

