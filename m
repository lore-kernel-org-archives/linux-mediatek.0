Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80708C001E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Aug 2023 19:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZxIg9UUewrFM0vEREoEcGwG6IbEZLqB2tnEvw27Bhyw=; b=eUd/iYHuFZQ5ZmUWOP/UF8ILyQ
	uwa8DJZ5gOeT9ldBLL4E3dY6/eSQjG8rrDh8axEpiEvScbbzJBNM88XMBP2GsHK5/33xXCNuq8167
	BmUgB2P5qgKRVWZA44wFYY8UqKvqgqCDxJMb1ZSWR5DLjz6krtmuNeNM8O4WSeEYu8TMtJeSzhxf4
	hdmyCciGV4igtwN3uwnnQuyugGo6k5CBlgtrSaKvEn2sFUTuc99jo89uvd+0BiUdbshKZBafCcNpL
	iIXW3HJZDqXcElSRaJjl8Cx1Aq3J48vtRQkmlCBHw4MkBM+rQavRdWdavj/Klmq3nBAs/WnaioCx6
	TpoqHhtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVGfm-00FcQq-0p;
	Sun, 13 Aug 2023 19:22:46 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVGfj-00FcQH-1L;
	Sun, 13 Aug 2023 19:22:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ZxIg9UUewrFM0vEREoEcGwG6IbEZLqB2tnEvw27Bhyw=; b=lOurZ5u9goav9sLbBJjIWVfaq2
	TgKUPLHapU5ze2gv9nHt7Y/NCxbpE8W7D+jh2Fkd5wYrFiGQMhcj4HX+hzh9rOBve0t8O4jze/IKm
	z7xDsOY9kzlTwmsgKjRNIdw+62u5gRc6Ss/l//GJWYUaflJhT2AtSdO4P0bd+5hmtXLc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qVGfT-003zDS-Sv; Sun, 13 Aug 2023 21:22:27 +0200
Date: Sun, 13 Aug 2023 21:22:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2] net: phy: mediatek-ge-soc: support PHY LEDs
Message-ID: <473888d3-256f-43ac-bd33-e578918424be@lunn.ch>
References: <32e534441225c62e3bf9384b797d9beda7475053.1691943605.git.daniel@makrotopia.org>
 <8f20d427-91cc-4fbc-b263-dfc76df855f9@lunn.ch>
 <ZNkpPRc9loNX2Wos@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNkpPRc9loNX2Wos@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_122243_476812_1813AC61 
X-CRM114-Status: GOOD (  14.80  )
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

On Sun, Aug 13, 2023 at 08:04:29PM +0100, Daniel Golle wrote:
> On Sun, Aug 13, 2023 at 08:57:01PM +0200, Andrew Lunn wrote:
> > On Sun, Aug 13, 2023 at 05:24:55PM +0100, Daniel Golle wrote:
> > > Implement netdev trigger and primitive bliking offloading as well as
> > > simple set_brigthness function for both PHY LEDs of the in-SoC PHYs
> > > found in MT7981 and MT7988.
> > > 
> > > For MT7988, read boottrap register and apply LED polarities accordingly
> > 
> > Should this be bootstrap? With an S? boottrap appears quite often in
> > the code, so maybe the datasheet does say boottrap?
> 
> Yes, datasheet and vendor code refer to boottrap register which reflects
> the state of the pins used for bootStrapping the SoC...

O.K. So following the datasheet makes sense.

Again, if there is need for a respin, maybe add a comment next to the
#define.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

