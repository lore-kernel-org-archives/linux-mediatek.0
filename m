Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519C4C7EE22
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 17:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OnR2NP9xCS0vzQL25YI/cGRXwlhXe4S1V+yp6DE8fS4=; b=YCKuUOLytA85R4CRralyCJ4j8i
	LSy+BBOSdpS2sxP1f0MqoFX15m/8y68nI6+M/wCA463b5aQDt9nSewD30Qbcuo9FcTuCzjGg5CfNi
	Jm67EB0XlZXnUYAcqZnGyvP+gmmHcQqPmrEKRA5hp1ZX1ccf3aQxchFZgc0zFXiqGaqXy471Ca0Sd
	flyrl8rUkluz+9NLdny9FEAg//MidtweqAt1quOMbNm/G4cNqrywGq4H9YPmjPzcrr8KyXvHpruiG
	iR5aT+g9glwQQSGp5b+tyJwJWbHDYNub4bXNorEhxGi3n6uZh+aZBN6War9W8Uk/47SCyZvxWPMnh
	hqfMbFqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px9uK-009VtI-0k;
	Thu, 11 May 2023 17:16:48 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px9uH-009VrU-0R;
	Thu, 11 May 2023 17:16:46 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1px9u9-0001cR-35;
	Thu, 11 May 2023 17:16:38 +0000
Date: Thu, 11 May 2023 19:14:48 +0200
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
Subject: Re: [PATCH net-next 0/8] Improvements for RealTek 2.5G Ethernet PHYs
Message-ID: <ZF0iiDIZQzR8vMvm@pidgin.makrotopia.org>
References: <cover.1683756691.git.daniel@makrotopia.org>
 <55c11fd9-54cf-4460-a10c-52ff62b46a4c@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55c11fd9-54cf-4460-a10c-52ff62b46a4c@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_101645_172243_D2E75667 
X-CRM114-Status: GOOD (  21.11  )
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

On Thu, May 11, 2023 at 02:28:15AM +0200, Andrew Lunn wrote:
> On Thu, May 11, 2023 at 12:53:22AM +0200, Daniel Golle wrote:
> > Improve support for RealTek 2.5G Ethernet PHYs (RTL822x series).
> > The PHYs can operate with Clause-22 and Clause-45 MDIO.
> > 
> > When using Clause-45 it is desireable to avoid rate-adapter mode and
> > rather have the MAC interface mode follow the PHY speed. The PHYs
> > support 2500Base-X for 2500M, and Cisco SGMII for 1000M/100M/10M.
> 
> I don't see what clause-45 has to do with this. The driver knows that
> both C22 and C45 addresses spaces exists in the hardware. It can do
> reads/writes on both. If the bus master does not support C45, C45 over
> C22 will be performed by the core.

My understanding is/was that switching the SerDes interface mode is only
intended with Clause-45 PHYs, derived from this comment and code:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/phy/phylink.c#n1661


Hence I concluded that for Clause-22 PHYs we expect the interface mode
to always remain the same, while many Clause-45 PHYs require switching
the SerDes interface mode depending on the speed of the external link.
Trying to use interface mode switching (in the .read_status function)
with is_c45 == false also just didn't work well:

https://github.com/openwrt/openwrt/pull/11990#issuecomment-1503160296


Up to 1000M this has no really been a problem, as the Cisco SGMII SerDes
supports 10M, 100M and 1000M speeds. Starting with 2500M things have
became more complicated, and we usually have the choice of either have
the MAC<->PHY link operate at a contant mode and speed (e.g. 2500Base-X)
or having to switch the MAC<->PHY interface mode (e.g. between
2500Base-X and SGMII) depending on whether the link speed on the
external interface is 2500M or not.

Looking at PHYs which support speeds beyond one gigabit/sec due to the
higher complexity and need for a larger register space most of them are
managed using Clause-45 MDIO. 2500Base-T PHYs are kind of the exception
because some of them (esp. RealTek) are still mostly being managed using
Clause-22 MDIO using proprietary paging mechanisms to enlarge the
register space.

I also don't like overloading the meaning of is_c45 to decide whether
rate-adapter mode should be used or not, neither do I like the idea to
tie the use of phylink to using SGMII in-band-status or not -- but at
this point both do correlate and there aren't any other feature flags or
validation methods to do it in a better way. In the end this can also
just be solved by documenation, ie. makeing sure that those facts are
well understood: interface mode switching only being supported when
using Clause-45 MDIO and also the fact that phylink expects operating
Cisco SGMII without in-band-status when connecting to a managed PHY.


