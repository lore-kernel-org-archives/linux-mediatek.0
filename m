Return-Path: <SRS0=imyo=KB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B58C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 11:42:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45EAB610FC
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 11:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45EAB610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zM3wUnYUQdMQqW/j7DIvwfjwjzWzwO1SFLFEome3+cM=; b=gpUeHXVDL3TTxhmGVjp6ZxCmo
	ylhi2V+oEei3JmTxIQRbmlT77ot+ukx/CqJBKNw6Bq6Ikd9/Bkh7RZ9hTxWSGHx610LwfYFd+pugm
	DI9Bf3SE0NyutR6zMoYGfarbXAuydFmBvGEk7D6cWdMTZPwFDK06kQvPJOv+dRxlYOgyhh6uL4bYC
	aHiykCquTu9gdCGgETalmsBJND26zXQaoldH+o2PtEBImE15tzO5/iN9oQV+eFl3Q/rsJNpxMIpPU
	Qeoh7qwmBN0T48HXRnqthf4TqUARXQhgGUkrB0uvF/lXGVkMbVVeVaCDoN85xUjoUOPJJWcdD3PpB
	VPe6VwgDQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lecOp-0049in-I7; Thu, 06 May 2021 11:42:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lecOn-0049ih-Iu
 for linux-mediatek@desiato.infradead.org; Thu, 06 May 2021 11:42:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qUNvLLdIep6ShRhYyTwPlINGio8cv3XFetFaNex+ips=; b=v+s8tDj/oPspa15bAkrupo85qH
 MbZQDSu1DvVLQ4PcNNlbHiZUxOvMzWBJq3X6yPG6FgQvNbvMW4/lhmiA82TWJ47+S27XVrJMPqqiw
 KqvSbV23wMgiJS4KJV04DCzLeXIJSTAmbnqaRuRJsCLnvFdtv/m5RGTfOHXxPpB1//+gxtchdshPI
 ymTiKIoy+lBW9fI3rkSlVsDGErSQmxngogio7z8ZZ/kfCLWwmFToIy0e+LMhl3ngcXEJAGqFaSfy0
 fT1jjzh5Ei0ZWyUFL0OOqYo3KmaochLCwiK1ueEU9mXCzzmXh2IAGjOlnr3tBzlk2CksKtt/nzWKh
 hoE2s64g==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lecOk-005zgv-Dj
 for linux-mediatek@lists.infradead.org; Thu, 06 May 2021 11:42:32 +0000
Received: by mail-wr1-x432.google.com with SMTP id t18so5264970wry.1
 for <linux-mediatek@lists.infradead.org>; Thu, 06 May 2021 04:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qUNvLLdIep6ShRhYyTwPlINGio8cv3XFetFaNex+ips=;
 b=dX26j8LlUFLjDXNBGSYx964W/ITYz6QNs8+2B+eooVh75uzkzukox7AvI0l8LfQZxJ
 6FOjyyjQUwOLA4Lj1u9YfQWGJqQ01jaXFMhiHeDKR1cqEduoD4MjCAqgs5aCVKhrmUfY
 zTnBgRcrHN6+5t3GBZ+/uybygdAhq5ExuTKxqDAmNopveBpLxO9zoxC798OaIJh9hJ07
 ZebCL7EMUlv6vLWtct7qybZdDr8f1M7s13Acj3VfZ5lYeJiB/xWXjJlxWzd36pq+njD6
 XQnieRRawHTFcGaZDkNPf9L6v9JqPoSAp67x2WaTI0jGugWkYmvWUTbxLv4Um533X1f3
 2Cdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qUNvLLdIep6ShRhYyTwPlINGio8cv3XFetFaNex+ips=;
 b=E5tl2MW6wbW0+w+l70vLlallrR4RezAKKA7RbLVglcdAIPcAPSUpbu5SaDyVYsAcKi
 JxpvcIf64VUF+IUe8kQOgG4g9S2AavLtNLQV0vJIz/PHqZKYv5gQ27dfLY7idR0Wp/or
 UnasUP3APd//39FWWsLwN9Diyq6E2y3MdRT5eYrG047h0fR8z+T66yQZZjowSx5fReRa
 74k9lbPKGRbSzlTyHDShmMUqhkk+AzxDyJud5hf7fOJLHz2E/V5lPNX/Ip+0Gv6OFgBq
 f6m+irfri9xahFEJMQ6Q1M7vvn4udk9jN541DuMswakVjVb3rzO0notMb+G36+oz+B92
 pC6A==
X-Gm-Message-State: AOAM532B/Qt0EorUXLGpYv79ZbHLSLv8avvm/bhxwlKURYIUFZ2GdWBB
 GSzjLp4kkkIwD/tO/KUTPLc=
X-Google-Smtp-Source: ABdhPJzs1poyigbM47v01bBL8f6y9w+lLDvpWhgFEveej1bwZdSQi7GheiPFONIEoZU/YLwQIYjsAw==
X-Received: by 2002:adf:d215:: with SMTP id j21mr4691751wrh.251.1620301347009; 
 Thu, 06 May 2021 04:42:27 -0700 (PDT)
Received: from skbuf ([86.127.41.210])
 by smtp.gmail.com with ESMTPSA id b8sm4082094wrx.15.2021.05.06.04.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 04:42:26 -0700 (PDT)
Date: Thu, 6 May 2021 14:42:24 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Weijie Gao <weijie.gao@mediatek.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH net-next 2/4] net: dsa: mt7530: add interrupt support
Message-ID: <20210506114224.z42cwbhd2jnakcdv@skbuf>
References: <20210429062130.29403-1-dqfext@gmail.com>
 <20210429062130.29403-3-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210429062130.29403-3-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_044230_503894_F6D14757 
X-CRM114-Status: GOOD (  28.82  )
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

On Thu, Apr 29, 2021 at 02:21:28PM +0800, DENG Qingfang wrote:
> Add support for MT7530 interrupt controller to handle internal PHYs.
> In order to assign an IRQ number to each PHY, the registration of MDIO bus
> is also done in this driver.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---
> RFC v4 -> PATCH v1:
> - Cosmetic fixes.
> 
>  drivers/net/dsa/Kconfig  |   1 +
>  drivers/net/dsa/mt7530.c | 264 +++++++++++++++++++++++++++++++++++----
>  drivers/net/dsa/mt7530.h |  20 ++-
>  3 files changed, 257 insertions(+), 28 deletions(-)
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

I'm pretty much the last person you'd want to ask for Kconfig advice,
but I think that you should only select the Kconfig options which have
no dependencies of their own, and MEDIATEK_PHY isn't like that. Do you
ensure through some other way that its dependencies are always satisfied?

>  	help
>  	  This enables support for the MediaTek MT7530, MT7531, and MT7621
>  	  Ethernet switch chips.
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 96f7c9eede35..db838343fb05 100644
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
> @@ -1828,6 +1839,210 @@ mt7530_setup_gpio(struct mt7530_priv *priv)
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
> +						 &mt7530_irq_domain_ops, priv);
> +	if (!priv->irq_domain) {
> +		dev_err(dev, "failed to create IRQ domain\n");
> +		return -ENOMEM;
> +	}
> +
> +	/* This register must be set for MT7530 to properly fire interrupts */
> +	if (priv->id != ID_MT7531)
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

Interesting use of "static".

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

Looks good.

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
