Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71078C54E68
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Mar 2024 19:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KuJ46ov0M1WFwhfgzmspEFR4JVVYgLT88C9rn2uIR34=; b=vTOrG4Ldfo8Y3YpohtJl0q3/lc
	pUjxlUdUmkF/FjY8r8dMcepzgsQMEuwyIyOziDiFG28ocms/9IrrzTs8osdYc3dYgeF3lbPUtpKjH
	6jIs11wEfQ0vcezYh/qK1ua4Nt4RM74mhpz8D3GLGYA6fe1WtTvo7iL0khA+FoIA9wQ4rtAtMGNvd
	RdjFrn2lCRmPTtUAU8VsBb4pTQCBipWNFaPJNgvx7ElX0CObJrssvWHIFOFYMoIgeubjQ5yXAkMu9
	8Ji7C2B0RVtRZ9+s7BKyrXHT0PKEZjbP/hxo0pmlXAlE2KzH06iCqvQ3JRv5XY2h69aRklJmTVpUl
	zaj4JMAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmfI9-0000000E0m6-1YwI;
	Tue, 19 Mar 2024 19:38:33 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmfI5-0000000E0kr-2O8M;
	Tue, 19 Mar 2024 19:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KuJ46ov0M1WFwhfgzmspEFR4JVVYgLT88C9rn2uIR34=; b=bVWvnIiqzDGPrE99+90DS3V/0c
	FfzZ4Xx1Lkoij6a3fsPRHLBdnADgUk5RsDNbLcxQ2NbscnZBGNiTXVTGbJ2Ja7iCXcjY6XnIIWHaG
	IK4j2hgYiCnKYhMdZixQthGh23EC/SNWFf1icFUQv9MDVpt6mve9ZKTeoQvc26nVaRlA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rmfHf-00Ajib-Vv; Tue, 19 Mar 2024 20:38:03 +0100
Date: Tue, 19 Mar 2024 20:38:03 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
	Russell King <linux@armlinux.org.uk>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Bartel Eerdekens <bartel.eerdekens@constell8.be>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/3] Fix EEE support for MT7531 and MT7988 SoC switch
Message-ID: <6cb585f6-6da8-45a2-a28b-2fb556f95672@lunn.ch>
References: <20240318-for-net-mt7530-fix-eee-for-mt7531-mt7988-v>
 <ZfnYkuzuvwLepIfC@makrotopia.org>
 <00ec9779-19ce-4005-83f0-f4abf37350fc@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00ec9779-19ce-4005-83f0-f4abf37350fc@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_123829_719430_2C276400 
X-CRM114-Status: GOOD (  11.51  )
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

> I would argue that EEE advertisement on the PHY should be enabled by
> default.

That is an open question at the moment. For some use cases, it can add
extra delay and jitter which can cause problems. I've heard people
doing PTP don't like EEE for example.

The current phylib core code leaves the PHY advertisement whatever its
reset default is. So we leave it to the manufacture to decide if it
should be enabled or disabled by default. It is policy, so it should
really be down to user space to configure EEE how it wants it.

       Andrew

