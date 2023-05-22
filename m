Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C21C7EE23
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 18:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xMDWNdtDyX2oslr/W+4USsKREfXUGofI9zp56SMdPdE=; b=XSZfZDa2ujDgq7CzZCe1XdgSse
	zkPSht8P5E81zPHfysfL4/YKxrg89XgKEKZ5Tp1X7a5kVj7UDL9oiU0BIgZ0wo4lIHPdiSSlW0GBD
	xH9HfkiNDKOH5ca1eb2OVY8twbCWVW/BKqd92qAFMQppnKabsc5Z4dJqoSvuPplfjHojsj4a3LVLy
	JKL1ALZZJaMi5c2BXdB7z7MN/l+daKczJbNdEPp0fyWfH2kR6t1/axOuEaCXh/QiEprfuy6yZuXyY
	px0MRJkwr2qFaMtMz07C4bJorrxS2LQh5GShudRHDdr/SiHYD3RqvBWhUr9SrfRNnjTD4HI6w+bv+
	QarcN4Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1A2s-007ULf-06;
	Mon, 22 May 2023 18:14:10 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1A2o-007UKF-2k;
	Mon, 22 May 2023 18:14:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xMDWNdtDyX2oslr/W+4USsKREfXUGofI9zp56SMdPdE=; b=gS1aYzGLL9GL7wcQZdImWvvfx6
	5hL51LptKMQj6jIj8fRcKt1cjpOI66ZtPT29tPsEQIjfZCh/coNN6OaFeM/DK0xgGmrLs2OEX7Syt
	MsEsrCO8NimtuR9XptngCd9yUY1FWlE+/OvGIyYF1gNEemLzc1tpP30crcrMUk3b56npFpW4nyKcD
	nAekpw9AcYmlJ7mvA8eUh5/G3jdYrl6k2Z0D6Va5AuFeVQNBDEHYJsiaiMdGxB7qGgBHZCV7PtYBC
	FpyrYF1tVY6U7+GuK4OXweUyznNtHaoInIYI7tAAP6dCSif83xJBB702Zj/U0zA72OwbY/mK+CiNV
	GYXQyvvA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38236)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1q1A2P-0007Im-0M; Mon, 22 May 2023 19:13:41 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1q1A2F-0008AI-3m; Mon, 22 May 2023 19:13:31 +0100
Date: Mon, 22 May 2023 19:13:31 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: Re: [PATCH net-next 00/30] net: dsa: mt7530: improve, trap BPDU &
 LLDP, and prefer CPU port
Message-ID: <ZGuwy/0FGh0c4wXk@shell.armlinux.org.uk>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522140917.er7f5ws24b2eeyvs@soft-dev3-1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522140917.er7f5ws24b2eeyvs@soft-dev3-1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_111407_199844_EAFC985D 
X-CRM114-Status: GOOD (  22.57  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Richard van Schagen <richard@routerhints.com>, arinc9.unal@gmail.com, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Richard van Schagen <vschagen@cs.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 22, 2023 at 04:09:17PM +0200, Horatiu Vultur wrote:
> The 05/22/2023 15:15, arinc9.unal@gmail.com wrote:
> 
> Hi,
> 
> > 
> > Hello!
> > 
> > This patch series simplifies the code, improves the logic of the switch
> > hardware support, traps LLDP frames and BPDUs for MT7530, MT7531, and
> > MT7988 SoC switches, and introduces the preferring local CPU port
> > operation.
> > 
> > There's also a patch for fixing the port capabilities of the switch on the
> > MT7988 SoC.
> > 
> 
> I have noticed that in many patches of the series you have:
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Where you also have:
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> I think you can drop Tested-by as the SoB will imply that. I think you
> got a similar comment some time ago to a different patch series.

Signed-off-by in no way implies a tested-by. Signed-off-by has a very
distinct definition that is in submitting-patches.rst.

Clearly, if one is working on infrastructure where there are numerous
drivers involved, one probably doesn't have all the hardware, and one
may have to send patches that have only been build tested, but never
tested against real hardware.

While we may attempt to elicit testing, most of the time this seems
to be a waste of time and effort - or at least that's my experience.
Even if you Cc people who have recently been active with hardware,
that is no guarantee that there will be any reaction.

That has got to the point now where I just don't bother trying to
elicit help from others to test driver changes. If people want to
test, they need to do so when they see a patch on the mailing list,
preferably before it gets applied. If not, and if it breaks something,
then we'll have to generate a patch to fix the breakage.

So no, please stop thinking that SoB implies that the patch has been
tested.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

