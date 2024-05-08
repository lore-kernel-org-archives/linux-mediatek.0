Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D6EC04FFE
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 May 2024 16:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55JgjvBmIgCm3D5GB+wpCGQc7vBp7Fqh3QDpnDCReME=; b=yCRCNU6isPeTihxtWVg7W9vtwe
	Hdoq/3lP+DgKBJJa5SLdgUJDuWlgeIGRLYSBTv3YqVokFiv1cHuZDD34boH2yzgaESD5Qn8f1AbcZ
	qjIMog8c4iy9H7ktRIQAPShe3wT+XnJ91f1ztCXSflpytX9gBez4tC2+SndnTkrF/9ErfOKnZnjyt
	8d1ESxhFG1QVZOV8XgkNu6/dIPJ231Z+II3PBGnybZPfjsfg+9etufOlnC5l7lTSVQMqGvUROKciX
	UUMLPMabP2FAuvuBCoVr8Aie7gbfTpaZ4bZ8IuuFQ/pWTT2ToUEuMP2l4kzJNwy734QGKM+iocWoQ
	FkHiWhoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4k2q-0000000GA33-1bd0;
	Wed, 08 May 2024 16:21:28 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4k2o-0000000GA12-0QeA;
	Wed, 08 May 2024 16:21:27 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1s4k2e-000000003Ks-1aM4;
	Wed, 08 May 2024 16:21:16 +0000
Date: Wed, 8 May 2024 17:21:11 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: SkyLake Huang =?utf-8?B?KOm7g+WVn+a+pCk=?= <SkyLake.Huang@mediatek.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
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
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 3/3] net: phy: mediatek: add support for built-in 2.5G
 ethernet PHY on MT7988
Message-ID: <Zjumd3bnZDu9LYGH@makrotopia.org>
References: <20240425023325.15586-1-SkyLake.Huang@mediatek.com>
 <20240425023325.15586-4-SkyLake.Huang@mediatek.com>
 <ZiocBmBWiNnbeyGq@shell.armlinux.org.uk>
 <4ccd437ee744382a8483ffe71d06cd495dacec71.camel@mediatek.com>
 <577176af-9f6c-45f9-824f-2b4ca762b2f7@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <577176af-9f6c-45f9-824f-2b4ca762b2f7@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_092126_166899_8DCC9AEB 
X-CRM114-Status: GOOD (  15.93  )
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

On Wed, May 08, 2024 at 02:30:21PM +0200, Andrew Lunn wrote:
> > I'm not sure I really get this. MT7988's internal 2.5Gphy is built
> > inside SoC. We won't have a number of these PHYs.
> 
> How long does firmware download take? If you are holding RTNL you are
> blocking all other network configuration. How many Ethernets does this
> device have? If it is just one, it is not too bad, but if there is a
> built in switch, you cannot be configuring that switch at the same
> time firmware download is happening...

The MT7988 SoC has a bunch of network interfaces:

 - GMAC0 is typically connected as conduit to a 4-port MT7530-like DSA
   switch offering 4 1GE user ports. PHY driver mediatek-ge-soc.c takes
   care of those, and yes, they do need some "care"...

 - GMAC1 can be used with the internal 2.5GE PHY (ie. with the driver
   discussed here) OR for to connect an external PHY or SFP via
   1000Base-X, 2500Base-X, SGMII, 5GBase-R, 10GBase-R or USXGMII.

 - GMAC2 is can only be used with an external PHY or SFP using
   1000Base-X, 2500Base-X, SGMII, 5GBase-R, 10GBase-R or USXGMII.

So while there is only exactly one of the internal 2.5GE PHY there are
many other network interfaces on that same SoC.

I hope that clarifies things a bit.

