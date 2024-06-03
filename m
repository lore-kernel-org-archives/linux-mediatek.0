Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841AEC25B75
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jun 2024 15:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fAYpza8hWil5WjZElg0QfdMfsUIIaDnzonGkWuiJ7RM=; b=xWgX7uL8lJ6jl6iVN+CXNlOWjx
	LlU7a1KvhelOKG6f0ukoaq82sJn+1wOFvmaAI3KEnnChpkUi/xAHeBT05nSiChP9qWHU/q7DYp5kT
	t2jSGyRSvuocHxHDRR0UGfD8WkATs6Rlyn4eCWrH4NjnXCHmospEtAfMvkUwzPwAv4Hl80PeTrdqh
	Z5fX3QF1czekWR6q7s3CCpbFa6of2uGspykUQOPXhNa6t5OdXb86x2pdmysm4ezovSJqn9Ii/Mhy5
	11/Xj6JHiqVWR1iSrGr2dq2qbFsNG1YqksSvti7m/jLndzc3nHTP+GOy2rdaJpMlJt48S5wlYelL9
	jd+2rMDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE9uX-0000000HGrj-2KyZ;
	Mon, 03 Jun 2024 15:47:49 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE9uU-0000000HGob-1JeV;
	Mon, 03 Jun 2024 15:47:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fAYpza8hWil5WjZElg0QfdMfsUIIaDnzonGkWuiJ7RM=; b=Xcqgj03mHhAOmGF/mV0Pya5L1Z
	zo5ux+T/fErNj3+HM0Ca53BmLhxpEag2+lSEPEqx9YpzKgLcmH627C2FYs0aUdOMjkuAzW/NH4HTa
	H2fg9YX2pfFBBVOT6+2E/1aAtShqa/O1wh4vge2ByUBiVTv9SI3K9KLz2X0bzfwpdNBIKrT67pEZ4
	MpvROis2o7bX4Dewey6M6FNZ3fnFZg63+/6LVJn5EZ+qAkhnrczfum/wGcYigjyrqJTCwXhbbiAxu
	aFfhdteowMkt65UuxFb5gUPTJMHGUil58mENNBGiDBETbS+uIase1dtguxr2lpV99tNO2D5Ko45Fv
	rp9R7x4Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38448)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sE9uC-0002wf-2a;
	Mon, 03 Jun 2024 16:47:28 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sE9uC-0000Yo-Qm; Mon, 03 Jun 2024 16:47:28 +0100
Date: Mon, 3 Jun 2024 16:47:28 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Sky Huang <SkyLake.Huang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next v6 5/5] net: phy: add driver for built-in 2.5G
 ethernet PHY on MT7988
Message-ID: <Zl3lkIDqnt4JD//u@shell.armlinux.org.uk>
References: <20240603121834.27433-1-SkyLake.Huang@mediatek.com>
 <20240603121834.27433-6-SkyLake.Huang@mediatek.com>
 <Zl3ELbG8c8y0/4DN@shell.armlinux.org.uk>
 <Zl3Fwoiv1bJlGaQZ@makrotopia.org>
 <Zl3IGN5ZHCQfQfmt@shell.armlinux.org.uk>
 <Zl3Yo3dwQlXEfP3i@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zl3Yo3dwQlXEfP3i@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_084746_399121_EDCC99E7 
X-CRM114-Status: GOOD (  31.84  )
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

On Mon, Jun 03, 2024 at 03:52:19PM +0100, Daniel Golle wrote:
> On Mon, Jun 03, 2024 at 02:41:44PM +0100, Russell King (Oracle) wrote:
> > On Mon, Jun 03, 2024 at 02:31:46PM +0100, Daniel Golle wrote:
> > > On Mon, Jun 03, 2024 at 02:25:01PM +0100, Russell King (Oracle) wrote:
> > > > On Mon, Jun 03, 2024 at 08:18:34PM +0800, Sky Huang wrote:
> > > > > Add support for internal 2.5Gphy on MT7988. This driver will load
> > > > > necessary firmware, add appropriate time delay and figure out LED.
> > > > > Also, certain control registers will be set to fix link-up issues.
> > > > 
> > > > Based on our previous discussion, it may be worth checking in the
> > > > .config_init() method whether phydev->interface is one of the
> > > > PHY interface modes that this PHY supports. As I understand from one
> > > > of your previous emails, the possibilities are XGMII, USXGMII or
> > > > INTERNAL. Thus:
> > > > 
> > > > > +static int mt798x_2p5ge_phy_config_init(struct phy_device *phydev)
> > > > > +{
> > > > > +	struct pinctrl *pinctrl;
> > > > > +	int ret;
> > > > 
> > > > 	/* Check that the PHY interface type is compatible */
> > > > 	if (phydev->interface != PHY_INTERFACE_MODE_INTERNAL &&
> > > > 	    phydev->interface != PHY_INTERFACE_MODE_XGMII &&
> > > > 	    phydev->interface != PHY_INTERFACE_MODE_USXGMII)
> > > > 		return -ENODEV;
> > > 
> > > The PHY is built-into the SoC, and as such the connection type should
> > > always be "internal". The PHY does not exist as dedicated IC, only
> > > as built-in part of the MT7988 SoC.
> > 
> > That's not how it was described to me by Sky.
> > 
> > If what you say is correct, then the implementation of
> > mt798x_2p5ge_phy_get_rate_matching() which checks for interface modes
> > other than INTERNAL is not correct. Also it means that config_init()
> > should not permit anything but INTERNAL.
> 
> The way the PHY is connected to the MAC *inside the chip* is XGMII
> according the MediaTek. So call it "internal" or "xgmii", however, up to
> my knowledge it's a fact that there is **only one way** this PHY is
> connected and used, and that is being an internal part of the MT7988 SoC.
> 
> Imho, as there are no actual XGMII signals exposed anywhere I'd use
> "internal" to describe the link between MAC and PHY (which are both
> inside the same chip package).

I don't care what gets decided about what's acceptable for the PHY to
accept, just that it checks for the acceptable modes in .config_init()
and the .get_rate_matching() method is not checking for interface
modes that are not permitted.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

