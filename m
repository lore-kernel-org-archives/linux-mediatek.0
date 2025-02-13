Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB644C0219D
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2025 13:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LofFdn71YhJEfg4gK8mqJ2EQ/Xufw9Ujp/0BZNUiuSw=; b=Xk/MV1izLjjzWlc9bYgMIEZs8M
	Qz1y6DJJLPlqTswL94RpZNzTWiT0RrbvrY/vnJSvwnY9PabDY96ljh00Wy5CaX/CvpKaZ4JFDelBM
	pw+FK6EUBuvVNOptwREebu5EdpPoN5GwOf+XFV6N9xHAI7Pva1VPXdf9vuV3P+XSaps4kWZ6x9iPE
	PZ0VG4ec7Eu161oIevUObPnR62CTMj40Vtt4d0XjOZfU4Jz8ti0szI6fguJl21u+MXtr/jfnCC7nf
	dolMEXhH6IgbO+Z2smG+9CsWjCV8AI7s0BioXAOp8TUk69dviq5x7h977eL5AN2qpDHqrR+mFkUXD
	b2FUKwWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZHt-0000000B9sm-2evk;
	Thu, 13 Feb 2025 13:29:53 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZHs-0000000B9sK-0MMx;
	Thu, 13 Feb 2025 13:29:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=LofFdn71YhJEfg4gK8mqJ2EQ/Xufw9Ujp/0BZNUiuSw=; b=OD
	zZaBT/rDCeCpGiGnVgl4VG7kyi4r7LH/9K2ox5F62nicWoK8i2mLmNKkByiaAy2NSuSk8r3qvc5ch
	ENTTTHgM30/v41WWLAEXjHmi7Mek6IZjtfCR/+O9p3Rd5TEjR8gtzOterexQlXHMnelpHb9xYAt/p
	EGpe3aVaxfoZOZM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tiZHb-00DkP8-9Z; Thu, 13 Feb 2025 14:29:35 +0100
Date: Thu, 13 Feb 2025 14:29:35 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: SkyLake Huang =?utf-8?B?KOm7g+WVn+a+pCk=?= <SkyLake.Huang@mediatek.com>
Cc: "dqfext@gmail.com" <dqfext@gmail.com>,
	Steven Liu =?utf-8?B?KOWKieS6uuixqik=?= <steven.liu@mediatek.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"edumazet@google.com" <edumazet@google.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"horms@kernel.org" <horms@kernel.org>,
	"daniel@makrotopia.org" <daniel@makrotopia.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Subject: Re: [PATCH net-next 1/3] net: phy: mediatek: Add token ring access
 helper functions in mtk-phy-lib
Message-ID: <64b70b2d-b9b6-4925-b3f6-f570ddb70e95@lunn.ch>
References: <20250116012159.3816135-1-SkyLake.Huang@mediatek.com>
 <20250116012159.3816135-2-SkyLake.Huang@mediatek.com>
 <5546788b-606e-489b-bb1a-2a965e8b2874@lunn.ch>
 <385ba7224bbcc5ad9549b1dfb60ace63e80f2691.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <385ba7224bbcc5ad9549b1dfb60ace63e80f2691.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_052952_123409_44193834 
X-CRM114-Status: GOOD (  12.41  )
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

On Thu, Feb 13, 2025 at 07:39:39AM +0000, SkyLake Huang (黃啟澤) wrote:
> On Sun, 2025-01-19 at 18:12 +0100, Andrew Lunn wrote:
> > 
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> > 
> > 
> > > +/* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x1 */
> > > +/* MrvlTrFix100Kp */
> > > +#define MRVL_TR_FIX_100KP_MASK                       GENMASK(22,
> > > 20)
> > > +/* MrvlTrFix100Kf */
> > > +#define MRVL_TR_FIX_100KF_MASK                       GENMASK(19,
> > > 17)
> > > +/* MrvlTrFix1000Kp */
> > > +#define MRVL_TR_FIX_1000KP_MASK                      GENMASK(16,
> > > 14)
> > > +/* MrvlTrFix1000Kf */
> > > +#define MRVL_TR_FIX_1000KF_MASK                      GENMASK(13,
> > > 11)
> > 
> > What does the Mrvl prefix stand for?
> > 
> > This patch is pretty much impossible to review because it makes so
> > many changes. Please split it up into lots of small simple changes.
> > 
> >     Andrew
> > 
> > ---
> > pw-bot: cr
> Those registers with Mrvl* prefix were originally designed for
> connection with certain Marvell devices. It's our DSP parameters.

Will this code work with real Marvell devices? Is this PHY actually
licensed from Marvell?

	Andrew

