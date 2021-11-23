Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D14C43217
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 18:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D7iGb/A0cNYWm/oT9pSqf+4bw5t4DQTz64t8TqbyKd4=; b=c54Q4idivRXtTn
	+oiiFg60bxmkNX0U0lk0mpIDxPt566AfpdRR3tWpUTSK+jTm2+QBu/bMAGiGwX9QYtmDkxQWMVhNM
	yVgu08jI1yOu+iDrwMukVKYeUFElTdndZmxdGtXtO5Bg8I1kacPHuUDyxEM6tQ05XHbbG0RfO816b
	CRPJ2+al17BY1TrTKGAACiljog3BwO3WKSYJg91DA/d+/VRpDF6afRH8p0sIhjKZFmqdcQkv0Dg45
	UmmPIqLGxA4tLxsZskZAb/q5zI9P7J0cl1crhukyofFGEebNNKmUMoTbY+Wy64CMOq8HHBqlzpdox
	/9U14euWe2hKJMFRZgtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpaBe-0037oD-Oj; Tue, 23 Nov 2021 18:06:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpaBR-0037mS-8e; Tue, 23 Nov 2021 18:06:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KYSi2DF32RnDnLuMXUFwS6/JUsWTjaNgU1Zqsf1R994=; b=Q5EHUvbmG2iGLExtA+9E0hXBPX
 3bEBtvn8q4WfYp21EJUV/yI1Q+zUeF/FKkATbjqhc+mmPCW0q7wP7/Tz2q6LilCaAfKCTT4a+PIKO
 y5u2Eucfj2z2x1wB28DccX9Pn/GR5XlY74Q+WZYeLIyY0rOIq+b/1UGWLhZhu4PXPSP4VZzG92unn
 57e3TEhIDGq6q5trzwZiYmLAnITJEyMpN3v6KpVNTgSQpfCvn8U+y9/HdT+lES8igOQL1+4oM3L+u
 MM6FwEKr5LD06Q7Vuna0+wDsWJC5xn4cV2/rj34zAL98P/lsXQglR5ma3czDKrLRJFus07/0oOMmm
 Zd+ncwwA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55822)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1mpaBB-0008F7-60; Tue, 23 Nov 2021 18:06:05 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1mpaB5-0000QM-B9; Tue, 23 Nov 2021 18:05:59 +0000
Date: Tue, 23 Nov 2021 18:05:59 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Chris Snook <chris.snook@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 Florian Fainelli <f.fainelli@gmail.com>, John Crispin <john@phrozen.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH RFC net-next 5/8] net: ag71xx: mark as a
 legacy_pre_march2020 phylink driver
Message-ID: <YZ0th75Vr9M0u6So@shell.armlinux.org.uk>
References: <YZy59OTNCpKoPZT/@shell.armlinux.org.uk>
 <E1mpSbK-00BXoo-UE@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1mpSbK-00BXoo-UE@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_100621_328797_D8B146DC 
X-CRM114-Status: GOOD (  10.51  )
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

On Tue, Nov 23, 2021 at 10:00:34AM +0000, Russell King (Oracle) wrote:
> ag71xx has a PCS, but does not make use of the phylink PCS support.
> Mark it was a pre-March 2020 driver.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Hi,

I've just been looking closer at this driver, and it seems that we can
drop the "legacy_pre_march2020" flag, and in doing so, delete the
ag71xx_mac_pcs_get_state and ag71xx_mac_an_restart functions entirely,
removing them from ag71xx_phylink_mac_ops.

Should this driver need to deal with the PCS - in other words, to
modify the advertisement, then it will need to make use of the
phylink_pcs support.

I'll send a v2 in a day or two.

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
