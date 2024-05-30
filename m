Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F8DC25B74
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 16:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCLB+9a+QfL2sb9yKKFj5QeAyOgyBI8+hlOoPiVSjrE=; b=EjrCCNPeAYuWSEwfQbhljuBIWk
	puzlkWUCoH6jo3UCsi47E5enICWPpPR1TNCw7r9BCyxUnFaxzB3V19Jk4g8QDVwlHBrDBGBZLErws
	vqZwuS52yn9y2QMyRAATJ1PBqWIfoZfl3awZtJXPuqHqSTbU4+CnWS/rzq1OP8L73FW38ZBIUjAk9
	zGm4SUm2UmLP0iZpfAFIODbd0gmsqyGz34pOTztjAhtomS2MIgpjwmG4SVe0DJEz/TeadQLSGbri6
	oLvT+CdXDUAbHKXC4qsXerhOU2mhpFUeiCTDTpg0wj2hpnzPubmEbHtMjx7oRESSu1ikbfRcIMOH4
	pIhWrn6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCiMP-00000007o1R-22D3;
	Thu, 30 May 2024 16:10:37 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCiMM-00000007o0x-14oR;
	Thu, 30 May 2024 16:10:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RCLB+9a+QfL2sb9yKKFj5QeAyOgyBI8+hlOoPiVSjrE=; b=Z5QDZsOS1ARFi6l5H5n04kuyHE
	4JdSXvF0ig2Ovj7RnQWzX5ZK2lzDG1+1tkWmA6GaMawx+vY1ca0J/RAPGgSmj3boER3hOwUcOVi0s
	ADcOfzQwM50O9x9NfTbkJKp6/AGIEnPoidataPzTNMP5TgNmmXTE2wQPHbz+7q0BsyXADX6l/1u/3
	dKpqtazhhMVcUss/iumrKrhjlE/Q8SVjlodLti4qjYGRcHgLVzrxeaQT/L6rJlY0zsaj2cis0/DUU
	ioPw9lGTA4JKiIW5SGuR6ewBygc+RHfAWx0+E9lr0UHvkPVYOmUKV5wafaIJIWGfExNcBxU1zzwoG
	zg9cONcw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57056)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sCiMB-0007Zb-1D;
	Thu, 30 May 2024 17:10:23 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sCiM9-0005HH-L4; Thu, 30 May 2024 17:10:21 +0100
Date: Thu, 30 May 2024 17:10:21 +0100
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
Subject: Re: [PATCH net-next v5 4/5] net: phy: mediatek: Extend 1G TX/RX link
 pulse time
Message-ID: <Zlik7TfUsOanlBMV@shell.armlinux.org.uk>
References: <20240530034844.11176-1-SkyLake.Huang@mediatek.com>
 <20240530034844.11176-5-SkyLake.Huang@mediatek.com>
 <ZlhTtSHRVrjWO0KD@shell.armlinux.org.uk>
 <a6280b885cf1cffa845310e7e565e1dd7421dc66.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a6280b885cf1cffa845310e7e565e1dd7421dc66.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_091034_315991_3705AE33 
X-CRM114-Status: UNSURE (   9.19  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, May 30, 2024 at 04:01:08PM +0000, SkyLake Huang (黃啟澤) wrote:
> I'm not going to handle timeout case here. If we can't detect
> MTK_PHY_FINAL_SPEED_1000 in 1 second, let it go and we'll detect it
> next round.

With this waiting up to one second for MTK_PHY_FINAL_SPEED_1000 to be
set...

> > > +int mtk_gphy_cl22_read_status(struct phy_device *phydev)
> > > +{
> > > +int ret;
> > > +
> > > +ret = genphy_read_status(phydev);
> > > +if (ret)
> > > +return ret;
> > > +
> > > +if (phydev->autoneg == AUTONEG_ENABLE && !phydev-
> > >autoneg_complete) {

Are you sure you want this condition like this? When the link is down,
and 1G speeds are being advertised, it means that you'll call
extend_an_new_lp_cnt_limit(). If MTK_PHY_FINAL_SPEED_1000 doesn't get
set, that'll take one second each and every time we poll the PHY for
its status - which will be done while holding phydev->lock.

This doesn't sound very good.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

