Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDF7C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Feb 2022 17:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UfyPeebRHVnF4m/vrSStQdLjsd7znhfw0aQzJdxrWgk=; b=VTqaN+798QV9i+
	ytH0TecJc+NHco8vANXYs8sjkMj3Pgqh0KDKbRk0eTZE5rRGSnG163yZ9Bf7Q/11RDqy7Zn7sb0Zz
	/lbFUtMxhFvXtxGA+iD7RZVkEEUIXoVMAE++g91jxgjDtfjrECugOhRHmTAmJSbwxcrB3uhFJCGVk
	igMUHRdT3V1oALpMye2CjZLKDSto6PKvxdoPb0Dj05crMLa+l/+3FJxhjNvpq7xrSFX+Zh1qSu6Ky
	ZTZ2ZUZV8Qs62StecnowfuaUubRDEmFxWLPorR3hFGK5NrTP8Elu3mJ3S/NagfdgW7OsDDvdd6VqY
	V/m1T4M20wuNvjcwNFag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHr4P-000ztB-Mq; Wed, 09 Feb 2022 17:47:57 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHr4D-000zqh-1R; Wed, 09 Feb 2022 17:47:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oMKnNdGWerhyD/7w0+tBGE6rpgKKyrhe4U8yo9811Xw=; b=jMJlnN5ys4sb2VxEYZNp4qWoop
 wY6cefxuoWUwZZM14mTfXt3TH0uOOZ06XrOTBn9X9xPJ0Z3jydot3Ofrx9O7trqsFdDsok9LvYoiM
 ZWZMBa7PLnqpuSEVlFeh2e4CphtRF/I5uaPxv5FUcjgzDjaIePWUVsMg3xOUiUdV+H2c7WjOAR+tm
 WU8aNrJGf4DiSqvt53tM+b/5sPvwKe5dgT39PLb+dV645Di6jxFCLPNVpLpp25Giy2412WSRCoWof
 HdxUQa7wB+Du6GrY1UEkGrY2hAdAS5+QVhF84CRcVZEolGtx1UvgF0E832e1+vCpySCQlbBYs7NFQ
 m13vdLdQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57172)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1nHr43-0004or-LU; Wed, 09 Feb 2022 17:47:35 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1nHr40-0001ie-Rq; Wed, 09 Feb 2022 17:47:32 +0000
Date: Wed, 9 Feb 2022 17:47:32 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Landen Chao <landen.chao@mediatek.com>
Cc: DENG Qingfang <dqfext@gmail.com>, Sean Wang <Sean.Wang@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH RFC net-next 0/7] net: dsa: mt7530: updates for phylink
 changes
Message-ID: <YgP+NBeGL4MzRcYR@shell.armlinux.org.uk>
References: <YfwRN2ObqFbrw/fF@shell.armlinux.org.uk>
 <YgO8WMjc77BsOLtD@shell.armlinux.org.uk>
 <48d2d967a625c65308bff7bad03ae49779986549.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <48d2d967a625c65308bff7bad03ae49779986549.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_094745_110136_4C80D5D7 
X-CRM114-Status: GOOD (  25.30  )
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

On Thu, Feb 10, 2022 at 01:33:34AM +0800, Landen Chao wrote:
> On Wed, 2022-02-09 at 21:06 +0800, Russell King (Oracle) wrote:
> > On Thu, Feb 03, 2022 at 05:30:31PM +0000, Russell King (Oracle)
> > wrote:
> > > Hi,
> > > 
> > > This series is a partial conversion of the mt7530 DSA driver to the
> > > modern phylink infrastructure. This driver has some exceptional
> > > cases
> > > which prevent - at the moment - its full conversion (particularly
> > > with
> > > the Autoneg bit) to using phylink_generic_validate().
> > > 
> > > What stands in the way is this if() condition in
> > > mt753x_phylink_validate():
> > > 
> > > 	if (state->interface != PHY_INTERFACE_MODE_TRGMII ||
> > > 	    !phy_interface_mode_is_8023z(state->interface)) {
> > > 
> > > reduces to being always true. I highlight this here for the
> > > attention
> > > of the driver maintainers.
> Hi Russel,
> 
> The above behaviour is really a bug. "&&" should be used to prevent
> setting MAC_10, MAC_100 and Antoneg capability in particular interface
> mode in original code. However, these capability depend on the link
> partner of the MAC, such as Ethernet phy. It's okay to keep setting
> them.

Hi Landen,

Thanks for the response. I think you have a slight misunderstanding
about these capabilities, both in the old code and the new code.

You shouldn't care about e.g. the ethernet PHY's capabilities in the
validate() callback at all - phylink will look at the capabilities
reported by phylib, and mask out anything that the MAC says shouldn't
be supported, which has the effect of restricting what the ethernet
PHY will advertise.

In the old code, the validate() callback should only be concerned with
what the MAC and PCS can support - e.g. if the MAC isn't capable of
supportig 1G half-duplex, then the 1G HD capabilities should be masked
out.

With the new code, PCS gain their own validation function, which means
that the validate() callback then becomes very much just about the MAC,
and with phylink_generic_validate(), we can get away with just
specifying a bitmap of the supported interface types for the MAC/PCS
end of the system, and the MAC speeds that are supported.

Given your feedback, I will re-jig the series to take account of your
comments - thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
