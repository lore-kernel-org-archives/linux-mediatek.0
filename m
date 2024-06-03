Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CB7C25B75
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jun 2024 08:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59CM1T4kNHLXN8iP2xZIPMYXtUjSOpZ37vbcWdKyQJY=; b=EWIF8mb/Ssdyd60+rJ4XYCDoC0
	Kd83lBv8ytX2azTSFnD81LazCGJOwlRQMnHl8Jjx0GxxbopXsSiSvlrtDxrsrbZ8rDcVRa/JcWZdo
	pMGyxgHxpBnc2EPRKmeqvqkA2WeCL7hRAOVPK185zGUgrGYHmtWckiYB99oWUmjRP1wuH144bzZda
	ylslr3vNdmC+9cJAl6eeBbmyMXbXTBtzIWm23W+DHkE+OhEJW1eNsFI2HDCWo2oSDFniiG/S+AZMI
	Slbe1HTO2/+EMDkaX65KOo94vLM4MBoEeI1XMs/ersr5Sd2NYi/GHB3Xd3JyPHPEsh8MyiYU7l/1t
	/x/GiPvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE2kG-0000000Fzbc-1Q53;
	Mon, 03 Jun 2024 08:08:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE2kB-0000000FzOl-2eYX;
	Mon, 03 Jun 2024 08:08:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=59CM1T4kNHLXN8iP2xZIPMYXtUjSOpZ37vbcWdKyQJY=; b=k8EuRzzCfKfASeTkUM2IU1ILOO
	wJkGORLCBY5HaUOijcxWfp3qDWtOYt2ghO1T3T8m6SHBTf4uYr5NlTmkwQG1F/QCnZH4l8aiw4jPP
	9Av/CfwaGZWtgawb95ZQt/1ExzH8/nCNWS4Z9AGRzpMQe4gvf7z/i6hqgp/PfZbtGcXStlSnU9EIE
	VfikzYJdeyrQzEuuVz6X0HL/rfP1aFGjcyvpHOow3m/Xdk+MqpeL03AAUYWNKiIsUPexZ6RY5deUb
	ybosb0beHgkpRMEIIGgU4EsSIt/Cmxp5Qk1tiImUk5AUp0ZnwzhaYKWAy96LRL/bVAkX8hTH0aqyT
	ye9H7dLA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50452)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sE2hz-0002PF-31;
	Mon, 03 Jun 2024 09:06:24 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sE2hy-0000Fn-FF; Mon, 03 Jun 2024 09:06:22 +0100
Date: Mon, 3 Jun 2024 09:06:22 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: SkyLake Huang =?utf-8?B?KOm7g+WVn+a+pCk=?= <SkyLake.Huang@mediatek.com>
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"edumazet@google.com" <edumazet@google.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"dqfext@gmail.com" <dqfext@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	Steven Liu =?utf-8?B?KOWKieS6uuixqik=?= <steven.liu@mediatek.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"daniel@makrotopia.org" <daniel@makrotopia.org>
Subject: Re: [PATCH net-next v5 4/5] net: phy: mediatek: Extend 1G TX/RX link
 pulse time
Message-ID: <Zl15fh7y2oZmFfd7@shell.armlinux.org.uk>
References: <20240530034844.11176-1-SkyLake.Huang@mediatek.com>
 <20240530034844.11176-5-SkyLake.Huang@mediatek.com>
 <ZlhTtSHRVrjWO0KD@shell.armlinux.org.uk>
 <a6280b885cf1cffa845310e7e565e1dd7421dc66.camel@mediatek.com>
 <Zlik7TfUsOanlBMV@shell.armlinux.org.uk>
 <e25de8898d594d14ade148004fdddb1f2c5b47f7.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e25de8898d594d14ade148004fdddb1f2c5b47f7.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_010839_968971_F50E001F 
X-CRM114-Status: GOOD (  21.40  )
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

On Mon, Jun 03, 2024 at 03:15:36AM +0000, SkyLake Huang (黃啟澤) wrote:
> On Thu, 2024-05-30 at 17:10 +0100, Russell King (Oracle) wrote:
> >  	 
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  On Thu, May 30, 2024 at 04:01:08PM +0000, SkyLake Huang (黃啟澤) wrote:
> > > I'm not going to handle timeout case here. If we can't detect
> > > MTK_PHY_FINAL_SPEED_1000 in 1 second, let it go and we'll detect it
> > > next round.
> > 
> > With this waiting up to one second for MTK_PHY_FINAL_SPEED_1000 to be
> > set...
> > 
> > > > > +int mtk_gphy_cl22_read_status(struct phy_device *phydev)
> > > > > +{
> > > > > +int ret;
> > > > > +
> > > > > +ret = genphy_read_status(phydev);
> > > > > +if (ret)
> > > > > +return ret;
> > > > > +
> > > > > +if (phydev->autoneg == AUTONEG_ENABLE && !phydev-
> > > > >autoneg_complete) {
> > 
> > Are you sure you want this condition like this? When the link is
> > down,
> > and 1G speeds are being advertised, it means that you'll call
> > extend_an_new_lp_cnt_limit(). If MTK_PHY_FINAL_SPEED_1000 doesn't get
> > set, that'll take one second each and every time we poll the PHY for
> > its status - which will be done while holding phydev->lock.
> > 
> > This doesn't sound very good.
> > 
> > -- 
> > RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> > FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
> 
> I add another condition to make sure we enter
> extend_an_new_lp_cnt_limit() only in first few seconds when we plug in
> cable.
> 
> It will look like this:
> ===============================================================
> #define MTK_PHY_AUX_CTRL_AND_STATUS		0x14
> #define   MTK_PHY_LP_DETECTED_MASK		GENMASK(7, 6)
> 
> if (phydev->autoneg == AUTONEG_ENABLE && !phydev->autoneg_complete) {
> 	phy_select_page(phydev, MTK_PHY_PAGE_EXTENDED_1);
> 	ret = __phy_read(phydev, MTK_PHY_AUX_CTRL_AND_STATUS);
> 	phy_restore_page(phydev, MTK_PHY_PAGE_STANDARD, 0);

We provide a helper for this:

	ret = phy_read_paged(phydev, MTK_PHY_PAGE_EXTENDED_1,
			     MTK_PHY_AUX_CTRL_AND_STATUS);

but please check "ret" for errors.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

