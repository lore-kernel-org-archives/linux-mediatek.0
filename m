Return-Path: <SRS0=xJt/=JE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4956C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 23:24:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83AE0611C1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 23:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83AE0611C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0uw6RPaxRaWUjaT6g7IzEgfJ7vmjrzT7w76ulDu1H1s=; b=m67UpcMVK6IZLvbBPtquJFlpP
	amYz0wpBUqfYT6c1aKe9UTjngw+smtJb49xZiIIYKLV8ZPhGvb6tYScpm9IYP9YomWWH7V21Darmb
	J5oi1d1yOshuDTRHTrWtrenmlyBk2pvqjrhCgYTIDeVA4BIBgQsCLHLU1sCZyWgI67M5Vq/mGOdad
	BIg7NqN8JtcPnL2mPBeuZLrLt+NkkUa+3Edr8mne8nydkfqdHWpFiQhskAZhHGdupOO2VGlodv9N/
	F2ET3zGLjdGAitwXLRL36j6RSqs2XyYXHrO/LFseZrir84bJHnZIsKHtpDc0Q68nYVL1CaeW9+Mkr
	ou05rdedQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUHWY-006HU3-Hd; Wed, 07 Apr 2021 23:23:50 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUHWU-006HSp-7Q
 for linux-mediatek@lists.infradead.org; Wed, 07 Apr 2021 23:23:48 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lUHWN-00FP3Y-Vc; Thu, 08 Apr 2021 01:23:39 +0200
Date: Thu, 8 Apr 2021 01:23:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: DENG Qingfang <dqfext@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Weijie Gao <weijie.gao@mediatek.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>
Subject: Re: [RFC v2 net-next 2/4] net: dsa: mt7530: add interrupt support
Message-ID: <YG4++xTrYfifg7yA@lunn.ch>
References: <20210407045038.1436843-1-dqfext@gmail.com>
 <20210407045038.1436843-3-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210407045038.1436843-3-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_002346_490368_A4CDFB55 
X-CRM114-Status: GOOD (  11.55  )
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

On Wed, Apr 07, 2021 at 12:50:36PM +0800, DENG Qingfang wrote:
> Add support for MT7530 interrupt controller to handle internal PHYs.
> In order to assign an IRQ number to each PHY, the registration of MDIO bus
> is also done in this driver.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---
> RFC v1 -> RFC v2:
> - Split MDIO and IRQ setup function

Thanks for the split. It looks good.

> +/* Forward declaration */
> +struct mt7530_priv;
> +static int mt753x_phy_read(struct mii_bus *, int, int);
> +static int mt753x_phy_write(struct mii_bus *, int, int, u16);

It is better to move the functions to before mt7530_setup_mdio().

   Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
