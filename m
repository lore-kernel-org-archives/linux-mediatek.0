Return-Path: <SRS0=5OX0=OD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98887C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 13:34:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 729A8619E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 13:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 729A8619E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dj43Ae27BQXabL1Z8F2lBNWi1P5aLzeG/Tbtet23RWY=; b=j0lXXR5UaviBMt
	w8FyvYqFLDqXmKrGQzBPVTuRfvVxLp7OCvEeJeBAnOgiKnSUfLaqZ0nWZMVPv5V+EUeQRTYo0INfu
	x9hdcBT6xaqPNdNDLA27UBgkGbn2eJ3AcT8jZ2SoKY4TafpVKIlWDf2jkuxIVEwtOjhitWIz/IMfK
	KPS4YqWdZzrc8xan/akEXt+g6R1utmDYnwUu/744EibJtq38CjqhUElLrCe9mpiyFqVObUlg9CSGh
	xlOjFNmO3GElVVx6LwyFvZq3IRf+RJOCHuF3e9Hqe7M/LMVU46Y3tsZ0zjfBsZhbdMvDMfK+I/DAx
	xaJgo3px0+tvpcnKEgbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPm6a-001rJX-7S; Mon, 13 Sep 2021 13:34:40 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPm6J-001rEG-O4; Mon, 13 Sep 2021 13:34:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=58z9IrN+k42qm0F0OUP3fqAjNBj3WVbrfPNAyHtAJzU=; b=psNFZtKITlUkHDWVlVkblwVh+i
 gmXXWVm/sCelZRgYzZ5G7JJX/Q3JAdWX9v4X5iDT2MGW3263/LZpoyl4eLzQn+aNyoy1WWgI9+cG/
 qZWgZmnr8LcD0xtzrZWKeuOZBme91rlrc+cbZRw+vfC/WQgMHYAaVc7xVcDiiRY2cnII=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1mPm5y-006PE3-2j; Mon, 13 Sep 2021 15:34:02 +0200
Date: Mon, 13 Sep 2021 15:34:02 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Kurt Kanzenbach <kurt@linutronix.de>, Hauke Mehrtens <hauke@hauke-m.de>,
 Woojung Huh <woojung.huh@microchip.com>,
 UNGLinuxDriver@microchip.com, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 George McCollister <george.mccollister@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Oleksij Rempel <linux@rempel-privat.de>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Lino Sanfilippo <LinoSanfilippo@gmx.de>
Subject: Re: [RFC PATCH net 2/5] net: dsa: be compatible with masters which
 unregister on shutdown
Message-ID: <YT9TSgkUvsKR5OKx@lunn.ch>
References: <20210912120932.993440-1-vladimir.oltean@nxp.com>
 <20210912120932.993440-3-vladimir.oltean@nxp.com>
 <20210912131837.4i6pzwgn573xutmo@skbuf> <YT9QwOA2DxaXNsfw@lunn.ch>
 <20210913133130.ohk4co56v4mtljyk@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210913133130.ohk4co56v4mtljyk@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_063423_866332_49B98B78 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
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

> > Have you tested it with a D in DSA system?
> 
> To various degrees.

I will try to find time to run it on a ZII devel board, two or three
switches in a DSA configuration.

	 Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
