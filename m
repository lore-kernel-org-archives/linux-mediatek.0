Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0089C2BA1A
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 20:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ZD1LO3y0XJHehNXPuKa1r2z4fZ2XE0qxEWBdt79yn4=; b=ydEQiaxfdsh6JAIFAiM6A4rxbY
	rMaIAjcRz1h39jPswPE97F7YSAu3bhNiyWRtqLH7AstdqRHGOcu4B5S5v7PlreH9FbmGM9qa2Alp/
	20WNYoretbRrl0X+ZO8ebDnAXCJOe07/W21xD6cA7hg3blW/TKYzfLXHVa0hbH3Dr0Z7GHiGWxm3Z
	4tQAGkB4UC6lVz5p1tD25rDpIT+3j0By5PLL6BIaDqNy8hBzLSeaz1KlYv6+ERBiu+Q2C5VCdCTm9
	ExQk0UTFUzLza19fsa9eqGgfcHxqVTkuuNSibANrL7sCKI7pS1DwrKknDRWE69HvnfJlO/dF+6nQv
	Cz36V+Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK1dA-00000002bWX-39NW;
	Wed, 19 Jun 2024 20:10:08 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK1d7-00000002bVQ-32UJ;
	Wed, 19 Jun 2024 20:10:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+ZD1LO3y0XJHehNXPuKa1r2z4fZ2XE0qxEWBdt79yn4=; b=a3qQ0mJwO1Wqwk8QDyhbJtiHOe
	owhbk0AznrkgCE4qaOOQ4U8Zv3WRcvC36DRx2rQyNFdSobOI2jcMH3jNjieUVPU4FDl33hhgeH+xd
	Nfihwr5aL7rMQxzyxREdOwRYMmhnV5fShdvxx4oJSazTwHp1iBuQPgFCzSQLxFib+YDUmTNQTu+GO
	xalzu/ACNdxek6LCuHkEvIzx/gNAjw+jwrjfIVYoU0Rn7Su5CskXfADrt8B21cQnmWDCpn2lk2n2Y
	l8wnvBbKfoQmPxX3WZmj94MeLukRdhxaWS90ihIqXo/IYzrPmVtwaMKGC8AYIeYeilstoyMDikK08
	PNCaSDcQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56934)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sK1cs-0000q2-2z;
	Wed, 19 Jun 2024 21:09:51 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sK1cs-00070q-HU; Wed, 19 Jun 2024 21:09:50 +0100
Date: Wed, 19 Jun 2024 21:09:50 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: SkyLake Huang =?utf-8?B?KOm7g+WVn+a+pCk=?= <SkyLake.Huang@mediatek.com>
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"edumazet@google.com" <edumazet@google.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"dqfext@gmail.com" <dqfext@gmail.com>,
	Steven Liu =?utf-8?B?KOWKieS6uuixqik=?= <steven.liu@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"daniel@makrotopia.org" <daniel@makrotopia.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH net-next v7 5/5] net: phy: add driver for built-in 2.5G
 ethernet PHY on MT7988
Message-ID: <ZnM7DkKhMABNgjEi@shell.armlinux.org.uk>
References: <20240613104023.13044-1-SkyLake.Huang@mediatek.com>
 <20240613104023.13044-6-SkyLake.Huang@mediatek.com>
 <ZnKgYSi81+JdAdhC@shell.armlinux.org.uk>
 <ac5cfcdeefb350af4467fe163b8a93b7873d3889.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac5cfcdeefb350af4467fe163b8a93b7873d3889.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_131005_787096_E313931B 
X-CRM114-Status: GOOD (  16.82  )
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

On Wed, Jun 19, 2024 at 11:44:32AM +0000, SkyLake Huang (黃啟澤) wrote:
> On Wed, 2024-06-19 at 10:09 +0100, Russell King (Oracle) wrote:
> >  	 
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  On Thu, Jun 13, 2024 at 06:40:23PM +0800, Sky Huang wrote:
> > > +static struct phy_driver mtk_gephy_driver[] = {
> > > +{
> > > +PHY_ID_MATCH_MODEL(MTK_2P5GPHY_ID_MT7988),
> > > +.name= "MediaTek MT7988 2.5GbE PHY",
> > > +.probe= mt798x_2p5ge_phy_probe,
> > > +.config_init= mt798x_2p5ge_phy_config_init,
> > > +.config_aneg    = mt798x_2p5ge_phy_config_aneg,
> > > +.get_features= mt798x_2p5ge_phy_get_features,
> > > +.read_status= mt798x_2p5ge_phy_read_status,
> > > +.get_rate_matching= mt798x_2p5ge_phy_get_rate_matching,
> > > +.suspend= genphy_suspend,
> > > +.resume= genphy_resume,
> > > +.read_page= mtk_phy_read_page,
> > > +.write_page= mtk_phy_write_page,
> > > +.led_blink_set= mt798x_2p5ge_phy_led_blink_set,
> > > +.led_brightness_set = mt798x_2p5ge_phy_led_brightness_set,
> > > +.led_hw_is_supported = mt798x_2p5ge_phy_led_hw_is_supported,
> > > +.led_hw_control_get = mt798x_2p5ge_phy_led_hw_control_get,
> > > +.led_hw_control_set = mt798x_2p5ge_phy_led_hw_control_set,
> > 
> > I don't see the point of trying to align some of these method
> > declarators but not others. Consistency is important.
> > 
> Sorry I don't get your point on this. What do you mean by "trying to
> align some of these method declarators but not others"? Do you mean
> "mt798x_2p5ge_phy" prefix?

Some of the method initialisers are:

	.foo<tab>= method_foo,
	.bar<tab>= method_bar,
	...

while other are:

	.longlongname<space>= methodlonglongname,

So what this causes is:

	.foo	= method_foo,
	.bar	= method_bar,
	.longlongbaz = methodlonglongbaz,

which looks messy - why use tabs for the short ones and a space for
the others. Why not be consistent, e.g.:

	.foo = method_foo,
	.bar = method_bar,
	.longlongbaz = methodlonglongbaz,

?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

