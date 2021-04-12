Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D22E3C43462
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 08:21:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38FE961221
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 08:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38FE961221
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Subject:Cc:To:
	From:Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o+O8Vl67nPnxtnT5nRpgZMk65F5KpISJk98XDLQjZbw=; b=ZioaOiejseWntRHpCEBkVWrVi
	qBdSi7q8rw30+ErQ8gScRA39n15KTPaqyHM9i+izqJGQoD6L6Tni+5mzssJLq3CUTTEW6ma51ldhU
	p1pdQXx0i0VRJq1XqVEFNPy4nFYcleyUCYrcmS/Fp+aGGf2I/WGeXgPL4+nxpj7LHk2chIGuvzudN
	dBdeouGRVDGSK/JWYVwzaGK6+/r5Ocu4e+lag8Yo1UNbBzONn636y+MDBUYRLIo29WL1+24xMGN8r
	XuyaWBhFSyKTCTfW3XSSXyxn54WMACjAbYE5k2sZYpTbZh9FYvjxEJ8Mnf4bNlq8u+FSLag++IqD5
	OaVKr7Kzg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVrow-0065RI-SI; Mon, 12 Apr 2021 08:21:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVrou-0065Qx-Ak
 for linux-mediatek@desiato.infradead.org; Mon, 12 Apr 2021 08:21:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:References:
 In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Fq82YUB3GDU1ltjYm4BlCBFOjspiOz6GpAftf/d5/es=; b=elZSgRxU58UbKfmDsjZXqbV4PH
 e3Qtb4eYu+Xknh7gGhGEbfJ3dTTYYdo0GNaavXHSpDKZxhapFnNA8UnDD94EHXJldhdi4jwjpkR+v
 x3Xnc5BS27Nbcdw3BkoXO7KmEMcu48Q9qoONP+GinAVQvw3KSYSCK8PjCXKQzj0nPIVIGD/4VBFqC
 VLewJbabMCJ4nCOsYMxVcoz5B2I8Z0eAv/gNvKLKR8xo5GgPDThhB+iIDLfXfij7KdG4RxG0Ffh4w
 pF3D/b4o0wCuhn1Y5p1uk7+gApTf4g6hy2GZt3RS1nwRoP0hr1S8/pntWcVr316C4V6oUIcXMgGGU
 6r4B5LBQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVroq-005y8e-T2
 for linux-mediatek@lists.infradead.org; Mon, 12 Apr 2021 08:21:18 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6528D6120F;
 Mon, 12 Apr 2021 08:21:16 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1lVroo-006ve9-0U; Mon, 12 Apr 2021 09:21:14 +0100
Date: Mon, 12 Apr 2021 09:21:12 +0100
Message-ID: <87fszvoqvb.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: DENG Qingfang <dqfext@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,	Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,	Heiner Kallweit
 <hkallweit1@gmail.com>,	Jakub Kicinski <kuba@kernel.org>,	Landen Chao
 <Landen.Chao@mediatek.com>,	Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>,	Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,	Vladimir Oltean
 <olteanv@gmail.com>,	Rob Herring <robh+dt@kernel.org>,	Linus Walleij
 <linus.walleij@linaro.org>,	Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,	Sergio Paracuellos
 <sergio.paracuellos@gmail.com>,	linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,	linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org,	netdev@vger.kernel.org,	Weijie Gao
 <weijie.gao@mediatek.com>,	Chuanhong Guo <gch981213@gmail.com>,
 =?UTF-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>,	Frank Wunderlich
 <frank-w@public-files.de>,	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC v4 net-next 2/4] net: dsa: mt7530: add interrupt support
In-Reply-To: <20210412034237.2473017-3-dqfext@gmail.com>
References: <20210412034237.2473017-1-dqfext@gmail.com>
 <20210412034237.2473017-3-dqfext@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: dqfext@gmail.com, davem@davemloft.net, andrew@lunn.ch,
 f.fainelli@gmail.com, hkallweit1@gmail.com, kuba@kernel.org,
 Landen.Chao@mediatek.com, matthias.bgg@gmail.com, linux@armlinux.org.uk,
 sean.wang@mediatek.com, vivien.didelot@gmail.com, olteanv@gmail.com,
 robh+dt@kernel.org, linus.walleij@linaro.org, gregkh@linuxfoundation.org,
 sergio.paracuellos@gmail.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, netdev@vger.kernel.org, weijie.gao@mediatek.com,
 gch981213@gmail.com, opensource@vdorst.com, frank-w@public-files.de,
 tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_012117_012332_B8B3176F 
X-CRM114-Status: GOOD (  37.18  )
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

On Mon, 12 Apr 2021 04:42:35 +0100,
DENG Qingfang <dqfext@gmail.com> wrote:
> 
> Add support for MT7530 interrupt controller to handle internal PHYs.
> In order to assign an IRQ number to each PHY, the registration of MDIO bus
> is also done in this driver.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---
> RFC v3 -> RFC v4:
> - No changes.
> 
>  drivers/net/dsa/Kconfig  |   1 +
>  drivers/net/dsa/mt7530.c | 266 +++++++++++++++++++++++++++++++++++----
>  drivers/net/dsa/mt7530.h |  20 ++-
>  3 files changed, 258 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/net/dsa/Kconfig b/drivers/net/dsa/Kconfig
> index a5f1aa911fe2..264384449f09 100644
> --- a/drivers/net/dsa/Kconfig
> +++ b/drivers/net/dsa/Kconfig
> @@ -36,6 +36,7 @@ config NET_DSA_LANTIQ_GSWIP
>  config NET_DSA_MT7530
>  	tristate "MediaTek MT753x and MT7621 Ethernet switch support"
>  	select NET_DSA_TAG_MTK
> +	select MEDIATEK_PHY
>  	help
>  	  This enables support for the MediaTek MT7530, MT7531, and MT7621
>  	  Ethernet switch chips.
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 2bd1bab71497..da033004a74d 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -10,6 +10,7 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/netdevice.h>
> +#include <linux/of_irq.h>
>  #include <linux/of_mdio.h>
>  #include <linux/of_net.h>
>  #include <linux/of_platform.h>
> @@ -596,18 +597,14 @@ mt7530_mib_reset(struct dsa_switch *ds)
>  	mt7530_write(priv, MT7530_MIB_CCR, CCR_MIB_ACTIVATE);
>  }
>  
> -static int mt7530_phy_read(struct dsa_switch *ds, int port, int regnum)
> +static int mt7530_phy_read(struct mt7530_priv *priv, int port, int regnum)
>  {
> -	struct mt7530_priv *priv = ds->priv;
> -
>  	return mdiobus_read_nested(priv->bus, port, regnum);
>  }
>  
> -static int mt7530_phy_write(struct dsa_switch *ds, int port, int regnum,
> +static int mt7530_phy_write(struct mt7530_priv *priv, int port, int regnum,
>  			    u16 val)
>  {
> -	struct mt7530_priv *priv = ds->priv;
> -
>  	return mdiobus_write_nested(priv->bus, port, regnum, val);
>  }
>  
> @@ -785,9 +782,8 @@ mt7531_ind_c22_phy_write(struct mt7530_priv *priv, int port, int regnum,
>  }
>  
>  static int
> -mt7531_ind_phy_read(struct dsa_switch *ds, int port, int regnum)
> +mt7531_ind_phy_read(struct mt7530_priv *priv, int port, int regnum)
>  {
> -	struct mt7530_priv *priv = ds->priv;
>  	int devad;
>  	int ret;
>  
> @@ -803,10 +799,9 @@ mt7531_ind_phy_read(struct dsa_switch *ds, int port, int regnum)
>  }
>  
>  static int
> -mt7531_ind_phy_write(struct dsa_switch *ds, int port, int regnum,
> +mt7531_ind_phy_write(struct mt7530_priv *priv, int port, int regnum,
>  		     u16 data)
>  {
> -	struct mt7530_priv *priv = ds->priv;
>  	int devad;
>  	int ret;
>  
> @@ -822,6 +817,22 @@ mt7531_ind_phy_write(struct dsa_switch *ds, int port, int regnum,
>  	return ret;
>  }
>  
> +static int
> +mt753x_phy_read(struct mii_bus *bus, int port, int regnum)
> +{
> +	struct mt7530_priv *priv = bus->priv;
> +
> +	return priv->info->phy_read(priv, port, regnum);
> +}
> +
> +static int
> +mt753x_phy_write(struct mii_bus *bus, int port, int regnum, u16 val)
> +{
> +	struct mt7530_priv *priv = bus->priv;
> +
> +	return priv->info->phy_write(priv, port, regnum, val);
> +}
> +
>  static void
>  mt7530_get_strings(struct dsa_switch *ds, int port, u32 stringset,
>  		   uint8_t *data)
> @@ -1828,6 +1839,211 @@ mt7530_setup_gpio(struct mt7530_priv *priv)
>  }
>  #endif /* CONFIG_GPIOLIB */
>  
> +static irqreturn_t
> +mt7530_irq_thread_fn(int irq, void *dev_id)
> +{
> +	struct mt7530_priv *priv = dev_id;
> +	bool handled = false;
> +	u32 val;
> +	int p;
> +
> +	mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
> +	val = mt7530_mii_read(priv, MT7530_SYS_INT_STS);
> +	mt7530_mii_write(priv, MT7530_SYS_INT_STS, val);
> +	mutex_unlock(&priv->bus->mdio_lock);
> +
> +	for (p = 0; p < MT7530_NUM_PHYS; p++) {
> +		if (BIT(p) & val) {
> +			unsigned int irq;
> +
> +			irq = irq_find_mapping(priv->irq_domain, p);
> +			handle_nested_irq(irq);
> +			handled = true;
> +		}
> +	}
> +
> +	return IRQ_RETVAL(handled);
> +}
> +
> +static void
> +mt7530_irq_mask(struct irq_data *d)
> +{
> +	struct mt7530_priv *priv = irq_data_get_irq_chip_data(d);
> +
> +	priv->irq_enable &= ~BIT(d->hwirq);
> +}
> +
> +static void
> +mt7530_irq_unmask(struct irq_data *d)
> +{
> +	struct mt7530_priv *priv = irq_data_get_irq_chip_data(d);
> +
> +	priv->irq_enable |= BIT(d->hwirq);
> +}
> +
> +static void
> +mt7530_irq_bus_lock(struct irq_data *d)
> +{
> +	struct mt7530_priv *priv = irq_data_get_irq_chip_data(d);
> +
> +	mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
> +}
> +
> +static void
> +mt7530_irq_bus_sync_unlock(struct irq_data *d)
> +{
> +	struct mt7530_priv *priv = irq_data_get_irq_chip_data(d);
> +
> +	mt7530_mii_write(priv, MT7530_SYS_INT_EN, priv->irq_enable);
> +	mutex_unlock(&priv->bus->mdio_lock);
> +}
> +
> +static struct irq_chip mt7530_irq_chip = {
> +	.name = KBUILD_MODNAME,
> +	.irq_mask = mt7530_irq_mask,
> +	.irq_unmask = mt7530_irq_unmask,
> +	.irq_bus_lock = mt7530_irq_bus_lock,
> +	.irq_bus_sync_unlock = mt7530_irq_bus_sync_unlock,
> +};
> +
> +static int
> +mt7530_irq_map(struct irq_domain *domain, unsigned int irq,
> +	       irq_hw_number_t hwirq)
> +{
> +	irq_set_chip_data(irq, domain->host_data);
> +	irq_set_chip_and_handler(irq, &mt7530_irq_chip, handle_simple_irq);
> +	irq_set_nested_thread(irq, true);
> +	irq_set_noprobe(irq);
> +
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops mt7530_irq_domain_ops = {
> +	.map = mt7530_irq_map,
> +	.xlate = irq_domain_xlate_onecell,
> +};
> +
> +static void
> +mt7530_setup_mdio_irq(struct mt7530_priv *priv)
> +{
> +	struct dsa_switch *ds = priv->ds;
> +	int p;
> +
> +	for (p = 0; p < MT7530_NUM_PHYS; p++) {
> +		if (BIT(p) & ds->phys_mii_mask) {
> +			unsigned int irq;
> +
> +			irq = irq_create_mapping(priv->irq_domain, p);

This seems odd. Why aren't the MDIO IRQs allocated on demand as
endpoint attached to this interrupt controller are being probed
individually? In general, doing this allocation upfront is an
indication that there is some missing information in the DT to perform
the discovery.

> +			ds->slave_mii_bus->irq[p] = irq;
> +		}
> +	}
> +}
> +
> +static int
> +mt7530_setup_irq(struct mt7530_priv *priv)
> +{
> +	struct device *dev = priv->dev;
> +	struct device_node *np = dev->of_node;
> +	int ret;
> +
> +	if (!of_property_read_bool(np, "interrupt-controller")) {
> +		dev_info(dev, "no interrupt support\n");
> +		return 0;
> +	}
> +
> +	priv->irq = of_irq_get(np, 0);
> +	if (priv->irq <= 0) {
> +		dev_err(dev, "failed to get parent IRQ: %d\n", priv->irq);
> +		return priv->irq ? : -EINVAL;
> +	}
> +
> +	priv->irq_domain = irq_domain_add_linear(np, MT7530_NUM_PHYS,
> +						&mt7530_irq_domain_ops, priv);
> +	if (!priv->irq_domain) {
> +		dev_err(dev, "failed to create IRQ domain\n");
> +		return -ENOMEM;
> +	}
> +
> +	/* This register must be set for MT7530 to properly fire interrupts */
> +	if (priv->id != ID_MT7531)

Why not check for ID_MT7530 directly then?

> +		mt7530_set(priv, MT7530_TOP_SIG_CTRL, TOP_SIG_CTRL_NORMAL);
> +
> +	ret = request_threaded_irq(priv->irq, NULL, mt7530_irq_thread_fn,
> +				   IRQF_ONESHOT, KBUILD_MODNAME, priv);
> +	if (ret) {
> +		irq_domain_remove(priv->irq_domain);
> +		dev_err(dev, "failed to request IRQ: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void
> +mt7530_free_mdio_irq(struct mt7530_priv *priv)
> +{
> +	int p;
> +
> +	for (p = 0; p < MT7530_NUM_PHYS; p++) {
> +		if (BIT(p) & priv->ds->phys_mii_mask) {
> +			unsigned int irq;
> +
> +			irq = irq_find_mapping(priv->irq_domain, p);
> +			irq_dispose_mapping(irq);
> +		}
> +	}
> +}
> +
> +
> +static void
> +mt7530_free_irq_common(struct mt7530_priv *priv)
> +{
> +	free_irq(priv->irq, priv);
> +	irq_domain_remove(priv->irq_domain);
> +}
> +
> +static void
> +mt7530_free_irq(struct mt7530_priv *priv)
> +{
> +	mt7530_free_mdio_irq(priv);
> +	mt7530_free_irq_common(priv);
> +}
> +
> +static int
> +mt7530_setup_mdio(struct mt7530_priv *priv)
> +{
> +	struct dsa_switch *ds = priv->ds;
> +	struct device *dev = priv->dev;
> +	struct mii_bus *bus;
> +	static int idx;
> +	int ret;
> +
> +	bus = devm_mdiobus_alloc(dev);
> +	if (!bus)
> +		return -ENOMEM;
> +
> +	ds->slave_mii_bus = bus;
> +	bus->priv = priv;
> +	bus->name = KBUILD_MODNAME "-mii";
> +	snprintf(bus->id, MII_BUS_ID_SIZE, KBUILD_MODNAME "-%d", idx++);
> +	bus->read = mt753x_phy_read;
> +	bus->write = mt753x_phy_write;
> +	bus->parent = dev;
> +	bus->phy_mask = ~ds->phys_mii_mask;
> +
> +	if (priv->irq)
> +		mt7530_setup_mdio_irq(priv);
> +
> +	ret = mdiobus_register(bus);
> +	if (ret) {
> +		dev_err(dev, "failed to register MDIO bus: %d\n", ret);
> +		if (priv->irq)
> +			mt7530_free_mdio_irq(priv);
> +	}
> +
> +	return ret;
> +}
> +
>  static int
>  mt7530_setup(struct dsa_switch *ds)
>  {
> @@ -2780,32 +2996,25 @@ static int
>  mt753x_setup(struct dsa_switch *ds)
>  {
>  	struct mt7530_priv *priv = ds->priv;
> +	int ret = priv->info->sw_setup(ds);
> +	if (ret)
> +		return ret;
>  
> -	return priv->info->sw_setup(ds);
> -}
> -
> -static int
> -mt753x_phy_read(struct dsa_switch *ds, int port, int regnum)
> -{
> -	struct mt7530_priv *priv = ds->priv;
> -
> -	return priv->info->phy_read(ds, port, regnum);
> -}
> +	ret = mt7530_setup_irq(priv);
> +	if (ret)
> +		return ret;
>  
> -static int
> -mt753x_phy_write(struct dsa_switch *ds, int port, int regnum, u16 val)
> -{
> -	struct mt7530_priv *priv = ds->priv;
> +	ret = mt7530_setup_mdio(priv);
> +	if (ret && priv->irq)
> +		mt7530_free_irq_common(priv);
>  
> -	return priv->info->phy_write(ds, port, regnum, val);
> +	return ret;
>  }
>  
>  static const struct dsa_switch_ops mt7530_switch_ops = {
>  	.get_tag_protocol	= mtk_get_tag_protocol,
>  	.setup			= mt753x_setup,
>  	.get_strings		= mt7530_get_strings,
> -	.phy_read		= mt753x_phy_read,
> -	.phy_write		= mt753x_phy_write,

I don't get why this change is part of the interrupt support. This
should probably be a separate patch.

>  	.get_ethtool_stats	= mt7530_get_ethtool_stats,
>  	.get_sset_count		= mt7530_get_sset_count,
>  	.set_ageing_time	= mt7530_set_ageing_time,
> @@ -2986,6 +3195,9 @@ mt7530_remove(struct mdio_device *mdiodev)
>  		dev_err(priv->dev, "Failed to disable io pwr: %d\n",
>  			ret);
>  
> +	if (priv->irq)
> +		mt7530_free_irq(priv);
> +
>  	dsa_unregister_switch(priv->ds);
>  	mutex_destroy(&priv->reg_mutex);
>  }
> diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
> index ec36ea5dfd57..62fcaabefba1 100644
> --- a/drivers/net/dsa/mt7530.h
> +++ b/drivers/net/dsa/mt7530.h

nit: Another thing is that I don't see why this include file exists at
all. The only user is mt7530.c, so the two could be merged and reduce
the clutter.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
