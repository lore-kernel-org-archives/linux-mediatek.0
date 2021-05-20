Return-Path: <SRS0=cSMM=KP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 689C5C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 01:00:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA8DE6100A
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 01:00:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA8DE6100A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R9YcQMwLMNAD+4rH4lAeIkVrxkUriGSl5JFr0V/G9LE=; b=Mce52ySoNSLpfAQScB89DqPPQ
	YU9BlDMmR7gpCmFeqNXpUqG8KRDCh1yJ/7MjbuRMNSy0LsYIrgfMoQ8lpOcRPv7ykyL+TAmSsO3it
	zY+MG/n+vsqvoQLlH+yd4aHPvc9I2mfBNkETZpkMOmwoT1Lsf/Rh3b0TFlAIcgjiMXQ4fkD4eUpTD
	qe2KaxU25biqhxsVX3b/qyXOiDuQiT/16fnOMm5jn0g8TjmvTNIvombTge6Oy2D0hqaeAn2FFbl3K
	8eRvDclApMU4RnL9dX0IW+r9dikQvZhIc0295CIM2MTsGIp5Rs3fiWcwpTjTxWeTL61f0hMuC1LMy
	M86yVq66Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljX2I-005Viv-Ff; Thu, 20 May 2021 00:59:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljX2G-005Vil-Pm
 for linux-mediatek@desiato.infradead.org; Thu, 20 May 2021 00:59:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=x1FNX0sAiQIZUVXxQspUMNUpkt0RpICL5Fv/PRybBDM=; b=UWbK7WuLcv0EHU7Omwupa4y42L
 ahL50mgyNo6GoPy7/Rj0T1YkCDv/D4psEpI5P5CbnPAqoUcJbXUh740wpvtjB19GExVqh/YNzL8GM
 5AGXaxEIVtWqa4UWeUlF6s4j6tvpRzyrVT3cESfS6Ez1HYEjZmHnqLELI9qj1J04pxVtbE0XhoA7o
 sCIPEGt1NUak1ZdN7j0clEM7f6QUhwSP3lAAnLTuW4YUrtVo1iQFXSCOvz8sWkgXugCpuVCV5HVTq
 +Fs1GDzpdkCBeoBu0TG2rrry+4I0Si6mTnbHs+qpJe2MIRz/3VtyCpw8Y/tR9RD3pVJscOo94ZA4j
 5MAuhuaA==;
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljX2E-00FsJC-CS
 for linux-mediatek@lists.infradead.org; Thu, 20 May 2021 00:59:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=x1FNX0sAiQIZUVXxQspUMNUpkt0RpICL5Fv/PRybBDM=; b=K5ONPXI5zpIYe16pjqMtnbj9lb
 RuDK6/Hk0MAO4x1JyyFFMk4/O7xxbYINyuD9h2mEeVLStv7aS08lvMGdSEUM+CF9Tc5CPJP+dCnl+
 ijrADNVnaIq1JSxufasy95Q5KzuBma9hX2cDTn2640DGAalQJAlEOz/0TKto3UJpxyTY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ljX21-0050dM-BI; Thu, 20 May 2021 02:59:21 +0200
Date: Thu, 20 May 2021 02:59:21 +0200
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
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH net-next v2 1/4] net: phy: add MediaTek Gigabit Ethernet
 PHY driver
Message-ID: <YKW0acoyM+5rVp0X@lunn.ch>
References: <20210519033202.3245667-1-dqfext@gmail.com>
 <20210519033202.3245667-2-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519033202.3245667-2-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_175934_451221_B9D455DC 
X-CRM114-Status: UNSURE (   8.07  )
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

> +static void mtk_gephy_config_init(struct phy_device *phydev)
> +{
> +	/* Disable EEE */
> +	phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);

Is EEE broken on this PHY? Or is this just to get it into a defined
state?

Otherwise

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
