Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711F7C25B78
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 May 2024 17:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhkM+fRteG8PMgK5KQbExBrib5V/iTCrBU/RE50L1EE=; b=aJn1H33ryFI48d8dJQErFM+LHS
	6Vgl796HwV17UvW5wx0qJElukppVQeZt83S/HiQML7c0oAPcjtIOTOxR3zcaSGkkkILPj/gr1tLsa
	14BC/nXCqKPh28YqrMBUmro3qN+8AX34yYB+8AGfzRQsARTx0cD8lBa3LZo1neOQDdA9s6PTuOXGC
	/vaJmZ3OnVRyassTSvBWW1mWsrAwSnqhFHzeWdEb6Uhv+qhAW4kobaotEklUu8b2a75yrtyJeNrrP
	6LNbVKM79a6Dqqd/ltmxoNf6Bq0dp4p05rkciTm75hZ+zsniWFHAovfmg32pCsT7HbsuZDyd+uCa3
	ZmjyT0YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9THw-00000000cyw-3we2;
	Tue, 21 May 2024 17:28:36 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9THm-00000000cvb-1QF2;
	Tue, 21 May 2024 17:28:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=QhkM+fRteG8PMgK5KQbExBrib5V/iTCrBU/RE50L1EE=; b=y4
	t83oNfL/I9PNlWj48LTO/Cy3aJiuDgNkz5VvIiTfi/ZliR+Cl0IsBp7lCVG8AaZJgPN71kIdYt8wy
	z3mHCy+BvbAsPZYwmlB7QpI4+E1lMIBbha/jZnGMhP9uYpuFGQDNIq8qso8jedq4xenamXMB9GQcn
	z8aGp+3perQmk84=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s9THj-00Fm7j-Ne; Tue, 21 May 2024 19:28:23 +0200
Date: Tue, 21 May 2024 19:28:23 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: SkyLake Huang =?utf-8?B?KOm7g+WVn+a+pCk=?= <SkyLake.Huang@mediatek.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"edumazet@google.com" <edumazet@google.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"dqfext@gmail.com" <dqfext@gmail.com>,
	Steven Liu =?utf-8?B?KOWKieS6uuixqik=?= <steven.liu@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"daniel@makrotopia.org" <daniel@makrotopia.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH net-next v3 5/5] net: phy: add driver for built-in 2.5G
 ethernet PHY on MT7988
Message-ID: <8af5b5b0-84b0-4603-8190-9661038d3ea5@lunn.ch>
References: <20240520113456.21675-1-SkyLake.Huang@mediatek.com>
 <20240520113456.21675-6-SkyLake.Huang@mediatek.com>
 <1158a657-1b95-4d7f-9371-41eec5388441@lunn.ch>
 <ab5df65ebd52dfd54231b9b12657d47218df8f25.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab5df65ebd52dfd54231b9b12657d47218df8f25.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_102826_402346_CD18CF82 
X-CRM114-Status: GOOD (  17.82  )
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

On Tue, May 21, 2024 at 08:17:32AM +0000, SkyLake Huang (黃啟澤) wrote:
> On Mon, 2024-05-20 at 15:35 +0200, Andrew Lunn wrote:
> >  	 
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  > +static int mt798x_2p5ge_phy_config_init(struct phy_device
> > *phydev)
> > > +{
> > > +struct mtk_i2p5ge_phy_priv *priv = phydev->priv;
> > > +struct device *dev = &phydev->mdio.dev;
> > > +const struct firmware *fw;
> > > +struct pinctrl *pinctrl;
> > > +int ret, i;
> > > +u16 reg;
> > > +
> > > +if (!priv->fw_loaded) {
> > > +if (!priv->md32_en_cfg_base || !priv->pmb_addr) {
> > > +dev_err(dev, "MD32_EN_CFG base & PMB addresses aren't valid\n");
> > > +return -EINVAL;
> > > +}
> > 
> > ...
> > 
> > > +static int mt798x_2p5ge_phy_probe(struct phy_device *phydev)
> > > +{
> > > +struct mtk_i2p5ge_phy_priv *priv;
> > > +
> > > +priv = devm_kzalloc(&phydev->mdio.dev,
> > > +    sizeof(struct mtk_i2p5ge_phy_priv), GFP_KERNEL);
> > > +if (!priv)
> > > +return -ENOMEM;
> > > +
> > > +switch (phydev->drv->phy_id) {
> > > +case MTK_2P5GPHY_ID_MT7988:
> > > +priv->pmb_addr = ioremap(MT7988_2P5GE_PMB_BASE,
> > MT7988_2P5GE_PMB_LEN);
> > > +if (!priv->pmb_addr)
> > > +return -ENOMEM;
> > > +priv->md32_en_cfg_base = ioremap(MT7988_2P5GE_MD32_EN_CFG_BASE,
> > > + MT7988_2P5GE_MD32_EN_CFG_LEN);
> > > +if (!priv->md32_en_cfg_base)
> > > +return -ENOMEM;
> > > +
> > > +/* The original hardware only sets MDIO_DEVS_PMAPMD */
> > > +phydev->c45_ids.mmds_present |= (MDIO_DEVS_PCS | MDIO_DEVS_AN |
> > > + MDIO_DEVS_VEND1 | MDIO_DEVS_VEND2);
> > > +break;
> > > +default:
> > > +return -EINVAL;
> > > +}
> > 
> > How can priv->md32_en_cfg_base or priv->pmb_addr not be set in
> > mt798x_2p5ge_phy_config_init()
> > 
> > Andrew
> Use command "$ifconfig eth1 down" and then "$ifconfig eth1 up",
> mt798x_2p5ge_phy_config_init() will be called again and again. priv-
> >md32_en_cfg_base & priv->pmb_addr are released after first firmware
> loading. So just check these two values again for safety once priv-
> >fw_loaded is overrided unexpectedly.

So the code is unsymmetrical. The memory is mapped in
mt798x_2p5ge_phy_probe() but unmapped in
mt798x_2p5ge_phy_config_init(). It would be better style to unmap it
in mt798x_2p5ge_phy_remove(). Alternatively, just map it when
downloading firmware, and unmap it straight afterwards.

Also, we generally discourage defensive programming. It is much better
to actually understand the code and know something is not possible.

	Andrew

