Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1774CC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 13:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7/8Vb+pJfL/cYqKxa7tEtPl84Ey+t1wdd3icfiSAzA=; b=OWkcSr19kzmKIJMEmjUMZu6S84
	1C1/OMf+xiYWR/nKz9uNq2QEgWY5Mm7lhzWxMO3+bym/yp6HkpeFCGsXt2rsN7HCNdlsQOMwKsr0m
	ck917mJ6S5W/9tgd35YSm/iVdz804BarV7/5kebg8OZ+RA8KJ54bfvIaDnheR488sripRVioTYsaA
	FSu7A1xE7g8IKtkj2SWD/y5xJHLFHs0KDfoim4lw005zL0I4fNE8U+JtG8bu+NmCM8iHMmLZ7gkML
	01+gtxnFBOumYFiuW4Xk3PhuoS639YhO35hXtjWRseNKYUujHOsWKBI/yLvKTQnfQv/U7iFRyrh97
	M4940DwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEsfr-0050qX-3o; Fri, 22 Jul 2022 13:26:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEsfS-0050U8-SS; Fri, 22 Jul 2022 13:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description;
	bh=Z7/8Vb+pJfL/cYqKxa7tEtPl84Ey+t1wdd3icfiSAzA=; b=Wb1cTbHYRKB67i/G5TZEPdrG7s
	zlj1JY2OX60TAYQ9tOXna2kPMTOBt0pOVhkGb6XFw1UYHkdzDisc4XcRg3yEACzMi3J2NHzjQOXj4
	vCh3vTmKa49EIof0Qis5JUo27L89+i8I6uRZff39be2XKBE7e+LNw2aePE7fGE30I4frzif4RrQ4N
	bh2m0t0bgNFpYP5V5zCngTTuq+19Mb/Ob20VlJuYyaxH1Kop68x9rrVwZjF9+gKyMZi0UbdvlZ9/8
	TkfclEd4ahmFARSG47RIwgPtB9+MqDgvogVXze1/eolxSQoA3n+hQHY93rfb2A05HRJwHt01oyEZv
	gRt3FUNg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEsfO-005rkj-KI; Fri, 22 Jul 2022 13:26:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Z7/8Vb+pJfL/cYqKxa7tEtPl84Ey+t1wdd3icfiSAzA=; b=TtYL5rhtwxHHen2/pjLuqGYdn0
	9CkXajXWWN8l9BKG4c4EWuJGdn5p+frOXLhddZYQ30VZ5PN/KUxneqkW2A8ArkXmoxYvPA2hPaKkY
	RUhy5WTovLw25CEDTB+wrq8hjuD2Nz2/AQl4Q3u9kvnPAMvDbgd189xA1DoJP6MCj4hMaja6LXCrR
	2H9xR25irX4QNXhfarqIf7fug7R4WuAFX4eUPJvNc2wGB0CrnG88Jb8Aw/AsBWG0tXG3X3pGPrzYw
	Ug286XIk8d+E3HHafcd4IbPurKTTN+Yt6QVGE/lTktTCNmaiZUciCe2y017OYqWKeHTRp9BjWjlot
	+6igktJg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33514)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1oEscn-0006zF-04; Fri, 22 Jul 2022 14:23:25 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1oEscg-0005qw-6a; Fri, 22 Jul 2022 14:23:18 +0100
Date: Fri, 22 Jul 2022 14:23:18 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alvin __ipraga <alsi@bang-olufsen.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Daniel Scally <djrscally@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	George McCollister <george.mccollister@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sean Wang <sean.wang@mediatek.com>, UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH net-next 3/6] net: dsa: add support for retrieving the
 interface mode
Message-ID: <YtqkxklImfR9gW1Z@shell.armlinux.org.uk>
References: <20220716123608.chdzbvpinso546oh@skbuf>
 <YtUec3GTWTC59sky@shell.armlinux.org.uk>
 <20220720224447.ygoto4av7odsy2tj@skbuf>
 <20220721134618.axq3hmtckrumpoy6@skbuf>
 <Ytlol8ApI6O2wy99@shell.armlinux.org.uk>
 <20220721151533.3zomvnfogshk5ze3@skbuf>
 <20220721192145.1f327b2a@dellmb>
 <20220721192145.1f327b2a@dellmb>
 <20220721182216.z4vdaj4zfb6w3emo@skbuf>
 <20220722145936.497ac73f@dellmb>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220722145936.497ac73f@dellmb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_142607_330369_3430596D 
X-CRM114-Status: GOOD (  10.80  )
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

On Fri, Jul 22, 2022 at 02:59:36PM +0200, Marek Behún wrote:
>   The 2.5GBASE-X PCS does not support Clause 37 Auto-Negotiation.
>   Hence, the 1000BASE-X PCS is expected to have its Clause 37
>   Auto-Negotiation functionality disabled so that the /C/ ordered set
>   will not be transmitted. If a 2.5GBASE-X PCS receives /C/ ordered
>   set, then undefined behavior may occur.
>   ...

The reason that's probably stated is because there hasn't been any
standardisation of it, different implementations behave differently,
so they can't define a standard behaviour without breaking what's
already out there.

With mvneta, the reality is that the 2.5G speed is implemented by
changing the clock configuration in the COMPHY block (serdes) - which
basically clocks everything 2.5x faster. I seem to remember mvpp2 is
the same deal.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

