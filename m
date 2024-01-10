Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FF6C47073
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 18:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ygJO/yfS/kYURGo632XL+UAKC6HRU0bCt+QfkkSA/jQ=; b=yXpgtBS7jFCHES4Qge5Z+Kt/GJ
	8ICpPuS/L3i/1eG5S3cbHidULUoipXKtZuLKqZZw0k9qfPVN+rEmzkvCkJdJdeiVomMpDQo0OSdbs
	trpXmeLIiUsJx8AkKnxIBkI+59dt6y5+7oFBKB5oj4DtLRgKihJmqtoBMjwPBf9GbWKz8YHDFn9D2
	2+RTbPZ2akAcYoFPnf2zLYeSlc9ATdN3kWRlvuKDgWoWg7wWZiAbBQK0712lC98dMq1LqxC3B/BX8
	FQQfQbinWwDu7VXknmWGod4OuAqJayM4JWpDQoRi/9+6tY0a0hp8qBDpW3KGMonnCc/hLj8LWS0JV
	cK8yFC3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNdOf-00DTW8-27;
	Wed, 10 Jan 2024 18:33:49 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNdOc-00DSy6-1w;
	Wed, 10 Jan 2024 18:33:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ygJO/yfS/kYURGo632XL+UAKC6HRU0bCt+QfkkSA/jQ=; b=Altj7fFEgmnst3pkUyvqp/ev10
	l8KOLFzehOuc1jSUkQ/pKC5Dr5WSCqjyO67puXiqXG1Sz+x+DYTyX5m1XDJsdvqRFRJdccIXFuwtZ
	f3qUcAw+XChvxpSGtvl7S7pfLiUaFbjj+Xh2mm6OKniuh+4h3rSm82IA/KeANy4uD3lgyUrGlgcyF
	lQCz+bnsqvqzTHaGbcXe4jrGT1DPToEkIdTYVW9oRXAgc0gJxQ/fofdHYIA902JAW0+rMS/wQvQ3E
	/FDlBX3atzL92Ci3v6VVOqAagyqzTsYJq57SCv1sASq7QTsfYPsFsATL+ejKr+3FsxbtfXePkCoy8
	vxb/pohQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40166)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rNdMB-0005hi-25;
	Wed, 10 Jan 2024 18:31:15 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rNdM7-0005XE-DA; Wed, 10 Jan 2024 18:31:11 +0000
Date: Wed, 10 Jan 2024 18:31:11 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH net-next 08/30] net: dsa: mt7530: change p{5,6}_interface
 to p{5,6}_configured
Message-ID: <ZZ7ib5WWyH4TyirS@shell.armlinux.org.uk>
References: <ZHy2jQLesdYFMQtO@shell.armlinux.org.uk>
 <0542e150-5ff4-5f74-361a-1a531d19eb7d@arinc9.com>
 <7c224663-7588-988d-56cb-b9de5b43b504@arinc9.com>
 <20230610175553.hle2josd5s5jfhjo@skbuf>
 <22fba48c-054d-ff0a-ae2c-b38f192b26f7@arinc9.com>
 <9308fa1a-6de3-490b-9aeb-eb207b0432df@arinc9.com>
 <9308fa1a-6de3-490b-9aeb-eb207b0432df@arinc9.com>
 <20240110142721.vuthnnwhmuvghiw4@skbuf>
 <b47311f8-315d-46d9-bd5b-757141708a3f@arinc9.com>
 <20240110180525.wwxkkoqam37oqm2f@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240110180525.wwxkkoqam37oqm2f@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_103346_659590_7B7FE05A 
X-CRM114-Status: GOOD (  13.66  )
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

On Wed, Jan 10, 2024 at 08:05:25PM +0200, Vladimir Oltean wrote:
> On Wed, Jan 10, 2024 at 08:15:20PM +0300, Arınç ÜNAL wrote:
> > __builtin_return_address(1) doesn't seem to work. I'm running this on arm64.
> 
> I can't tell you why either, I'm sorry. I can just point to the
> documentation, which does specify that "On some machines it may be
> impossible to determine the return address of any function other than
> the current one". If somebody knows what this depends on, feel free to
> interject.
> https://gcc.gnu.org/onlinedocs/gcc/Return-Address.html
> 
> On my NXP LS1028A (also arm64) plus clang-16 compiler, __builtin_return_address()
> does work with multiple nesting levels.

gcc will probably need to be using frame pointers so it can walk the
stack, if gcc even implements non-zero values to
__builtin_return_address(). Without frame pointers, it would need an
unwinder.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

