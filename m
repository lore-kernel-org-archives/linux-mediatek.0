Return-Path: <SRS0=cSMM=KP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB58C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 07:13:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0456561355
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 07:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0456561355
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HU3WDyC9gmaxa9yetIVntyRGmxPcsUFNIsJglzFU+4g=; b=O3HkoP+BVFIUiaFRg7wGNKKfF
	3BvpLBGHX5yWs1luxfLp7ifr5WCNp6QQ6l5NBtAxqXvQFMR8Be5XVpSNj4fxyx59hhzWtvF1/Er9x
	jD4GNhX5CI2ZoVvRBLaOpbluNwlrsEwl2sQtSjuxuXNcHbBwqQKQky8ePZVhZSrkPkwPoLRcXZ5gc
	K4ELGchfhKlth0ecbEBFCpdtn3qHY5jv5dQlfUwTiYdWeda1QU5HbZdKtPmrzGu/13jv8dkeGU+nh
	g/VwMC7LTTK4xDsTQKszM57Mk2ITgqu1Bqx2ueMe9+4Ho/EP0joiiQHE3oiT2CuhM+QUfJjIHK4Z7
	YtkWmQF1Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljcsE-0066b6-5R; Thu, 20 May 2021 07:13:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljcsB-0066au-JE
 for linux-mediatek@desiato.infradead.org; Thu, 20 May 2021 07:13:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=ZQ3X2kKIVdd7QGc0Obd6FYCQ+lslLAxE4v/TzH04zFg=; b=ErH+JLNr6cLqDj6WeX+KvgJyOP
 B0iZrqGlsLcoFlYF+i0nnUI8JUbjv7DceY9+WTmi6NGn6BO2RMT+ucgZKvFMWhz6cgcgJ4fIT1j78
 CcsvaJ/2MqcCeWKGPJHHG72NResynKoJd7SvhPoBTmNC/YYG8H+IgxG+0Y7B1urKFQ7poG3W4dBU0
 G4V08o2kV33egbq4Ptb7yR/JVttmL2L3iKsVele9mjajrKQTpkZb/GggBss1UkY3vHTqnDPcb+LLT
 Pm6Fmo1lt0nBx4Ox95jWYwyG/du35t3fja523CqiTPyl/HUOgI/S6P1xGIUb4+NFO/J//p9+Afsu1
 gWIOKL5g==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljcs4-00G1Pe-EK
 for linux-mediatek@lists.infradead.org; Thu, 20 May 2021 07:13:31 +0000
X-UUID: 5df7a6d6f2e24f86b552236d82d4f876-20210520
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ZQ3X2kKIVdd7QGc0Obd6FYCQ+lslLAxE4v/TzH04zFg=; 
 b=EJhtKMJHSLLT7k+TjsgkVYl5TweyxXs7MXcMNVdXRMnyOQxzmuKghYKfKjn6JwLDo1+MD9EAGJJeX2oGS0nY+U3rRYxYZ1Zp4z0Bz0VgSWFQ9a0NGv3hycwnnfYhxtYYiGKu6o1O5ruGvUiA8BvYG+aAOPbrwrBvXshmqREB1RE=;
X-UUID: 5df7a6d6f2e24f86b552236d82d4f876-20210520
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 801047336; Thu, 20 May 2021 00:13:23 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 May 2021 00:13:21 -0700
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 May 2021 15:13:20 +0800
Message-ID: <0adde34f936a2dafca40b06b408d82afe0852327.camel@mediatek.com>
Subject: Re: [PATCH net-next v2 1/4] net: phy: add MediaTek Gigabit Ethernet
 PHY driver
From: Landen Chao <landen.chao@mediatek.com>
To: DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>
CC: "David S. Miller" <davem@davemloft.net>, Florian Fainelli
 <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-staging@lists.linux.dev>, <devicetree@vger.kernel.org>,
 <netdev@vger.kernel.org>, Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo
 <gch981213@gmail.com>, =?ISO-8859-1?Q?Ren=E9?= van Dorst
 <opensource@vdorst.com>, "Frank Wunderlich" <frank-w@public-files.de>, Thomas
 Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Date: Thu, 20 May 2021 15:13:20 +0800
In-Reply-To: <20210520023828.3261270-1-dqfext@gmail.com>
References: <20210519033202.3245667-1-dqfext@gmail.com>
 <20210519033202.3245667-2-dqfext@gmail.com> <YKW0acoyM+5rVp0X@lunn.ch>
 <20210520023828.3261270-1-dqfext@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_001328_512409_B2AA3AF0 
X-CRM114-Status: GOOD (  16.24  )
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

On Thu, 2021-05-20 at 10:38 +0800, DENG Qingfang wrote:
> On Thu, May 20, 2021 at 02:59:21AM +0200, Andrew Lunn wrote:
> > > +static void mtk_gephy_config_init(struct phy_device *phydev)
> > > +{
> > > +	/* Disable EEE */
> > > +	phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);
> > 
> > Is EEE broken on this PHY? Or is this just to get it into a defined
> > state?
> 
> As I said in commit message, the initialization (including EEE) is
> from the vendor driver.
> I have also tested it with EEE enabled by default on one of my APs,
> and got occasional link drops.
> 

EEE of the 10-year-old MT7530 internal gephy has many IOT problems, so
it is recommended to disable its EEE.
EEE of the MT7531 internal gephy has been updated, but it is not yet
widely used.
Therefore, EEE is disabled in vendor driver.

Landen
> > Otherwise
> > 
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> > 
> >     Andrew
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
