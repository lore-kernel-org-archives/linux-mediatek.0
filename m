Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1349FC7EE22
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 11:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZsOj7BwSS2Fu49rqcySAuko/IL/XNwf7MP6mY1x3m8=; b=0IjpXjoeYE2DkNQYqwrOak2Aqv
	EOblEanQaDnI8T+FrO6w+gn7uwOe1R+nNCR1QP7KXtruN2HiqNtfDlqA1fZzsSwJTIAUnN1c/9F9E
	brLOIbQu7uwDQntDs+VWJB+yrOQzZ+lT2XR6S+qyw1ixkH4dbr7Uh8pKL/+tqhJ4egztGMVNoSo0H
	sz5yH97y4RcBk+UR+MocHRMoLzWGXimjzRqurQBDPxF7wox3J53UXildufaxVXgqLrIZmriXc0YKR
	kmNwcExT1fr4tCWmmALBiziQ4uir2c7y1rywFX89ue2R0/6p+jJ50sLx1WDtWN6b3Lq17e4H9mmvB
	4OJDWpBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px4qW-008gVp-2A;
	Thu, 11 May 2023 11:52:32 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px4qT-008gVQ-3C;
	Thu, 11 May 2023 11:52:31 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1px4qR-0008QZ-22;
	Thu, 11 May 2023 11:52:28 +0000
Date: Thu, 11 May 2023 13:50:30 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/8] net: phy: realtek: rtl8221: allow to configure
 SERDES mode
Message-ID: <ZFzWhn7yXazjjmzq@pidgin.makrotopia.org>
References: <cover.1683756691.git.daniel@makrotopia.org>
 <302d982c5550f10d589735fc2e46cf27386c39f4.1683756691.git.daniel@makrotopia.org>
 <8fdffc76-4b2f-44ea-9800-1e5d3624d94e@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fdffc76-4b2f-44ea-9800-1e5d3624d94e@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_045230_028302_865C416D 
X-CRM114-Status: GOOD (  10.49  )
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

On Thu, May 11, 2023 at 02:38:19AM +0200, Andrew Lunn wrote:
> > +#define RTL8221B_SERDES_OPTION_MODE_2500BASEX_SGMII	0
> > +#define RTL8221B_SERDES_OPTION_MODE_HISGMII_SGMII	1
> > +#define RTL8221B_SERDES_OPTION_MODE_2500BASEX		2
> 
> So what is 2500BASEX_SGMII? You cannot run SGMII at 2.5G, because
> there is no way to repeat a symbol 2.5 times so that a 1G stream takes
> up 2.5G bandwidth. The SGMII signalling also does not work at 2.5G.

*_MODE_2500BASEX_SGMII means that the PHY will dynamically switch
interface mode between 2500Base-X for 2500M links and SGMII for
everything else.

Setting  *_MODE_2500BASEX in contrast to that enabled rate-adapter mode
and always uses 2500Base-X no matter what the speed of the link on the
TP interface is.

I will add a comment explaining that.


