Return-Path: <SRS0=NAie=2C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0A8C43603
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 16:24:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E021A206C3
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 16:24:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RnoOZDDK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="onENMK8o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E021A206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nbtj7cZ3yA1aU0vIFS3ArNUDUzqB3+tjNOk4mA2jSVU=; b=RnoOZDDKkL1Vt1
	OUls4u5CpHr10GELYqDXKCuuwdjt9n/0L91yhj5tFidJah75YEbWmUHK7bw9HSYtiqBab4FqYmuL8
	uxTF+Z9WAzvUZPacoJmJqBsnBh4ovQgW9jVvteDyi1urqpP5vsvCMs6gj1UTIHjUHvvABNo7jSHqw
	12s7FpgnRLf6++AtxoKd6F/iOfsYW2jkasd9je57dl7gEAerCB2qj4Cc1K0mLwbmqPuRm82B76CZb
	pnzwQDIq0dHm5XgsD71emhfII2gEEVE3fT/ojIwvloVHmhRo/7c61inkUUilCL5vlOh3Swz+2tZey
	7Fb/sl2bHC/VbkeLdyQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifRGT-0002oN-10; Thu, 12 Dec 2019 16:24:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifRGQ-0002nW-ES
 for linux-mediatek@lists.infradead.org; Thu, 12 Dec 2019 16:24:32 +0000
X-UUID: 634f4f4f672e43fe865d11fe5a428d6f-20191212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=GaNx7Y6ValbHeiS9Crk5bomhLkNvkMMHVvQsSt1bpmQ=; 
 b=onENMK8oUCz2FszWLdnRLgg+WHuo+OO7L1y34X2MTHw16Jbr38bY1st1PZZwNX1vr7/z2ic/ItqS3ePTBdc9yOmhZhjaRmg4EW0/qPQvFupZq526PbR102SGhtzE6A5lBRdd1jJZJo997vm9ERlz2eytEFEHqJlbRwDRnWKqSzg=;
X-UUID: 634f4f4f672e43fe865d11fe5a428d6f-20191212
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1807605168; Thu, 12 Dec 2019 08:24:24 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 12 Dec 2019 08:24:39 -0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 13 Dec 2019 00:23:44 +0800
Message-ID: <1576167861.18168.29.camel@mtksdccf07>
Subject: Re: [PATCH net-next 4/6] net: dsa: mt7530: Add the support of
 MT7531 switch
From: Landen Chao <landen.chao@mediatek.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Date: Fri, 13 Dec 2019 00:24:21 +0800
In-Reply-To: <0eb12ad8-0484-feb5-d912-40e052315739@gmail.com>
References: <cover.1575914275.git.landen.chao@mediatek.com>
 <6d608dd024edc90b09ba4fe35417b693847f973c.1575914275.git.landen.chao@mediatek.com>
 <0eb12ad8-0484-feb5-d912-40e052315739@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_082430_495626_77E6DBBE 
X-CRM114-Status: GOOD (  21.27  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "andrew@lunn.ch" <andrew@lunn.ch>,
 "frank-w@public-files.de" <frank-w@public-files.de>,
 Sean Wang <Sean.Wang@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "vivien.didelot@savoirfairelinux.com" <vivien.didelot@savoirfairelinux.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "opensource@vdorst.com" <opensource@vdorst.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "davem@davemloft.net" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2019-12-12 at 11:57 +0800, Florian Fainelli wrote:
> 
> On 12/10/2019 12:14 AM, Landen Chao wrote:
> > Add new support for MT7531:
> > 
> > MT7531 is the next generation of MT7530. It is also a 7-ports switch with
> > 5 giga embedded phys, 2 cpu ports, and the same MAC logic of MT7530. Cpu
> > port 6 only supports HSGMII interface. Cpu port 5 supports either RGMII
> > or HSGMII in different HW sku. Due to HSGMII interface support, pll, and
> > pad setting are different from MT7530. This patch adds different initial
> > setting of MT7531.
> > 
> > Signed-off-by: Landen Chao <landen.chao@mediatek.com>
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> > ---
> 
> [snip]
> 
> > +	/* Enable PHY power, since phy_device has not yet been created
> > +	 * provided for phy_[read,write]_mmd_indirect is called, we provide
> > +	 * our own mt7531_ind_mmd_phy_[read,write] to complete this
> > +	 * function.
> > +	 */
> > +	val = mt7531_ind_mmd_phy_read(priv, 0, PHY_DEV1F,
> > +				      MT7531_PHY_DEV1F_REG_403);
> > +	val |= MT7531_PHY_EN_BYPASS_MODE;
> > +	val &= ~MT7531_PHY_POWER_OFF;
> > +	mt7531_ind_mmd_phy_write(priv, 0, PHY_DEV1F,
> > +				 MT7531_PHY_DEV1F_REG_403, val);
> 
> You are doing this for port 0 only, is that because this broadcasts to
> all internal PHYs as well, or is it enough to somehow do it just for
> port 0? It sounds like you might want to make this operation a bit more
> scoped, if you have an external PHY that also responds to broadcast MDIO
> writes this could possibly cause some unattended effects, no?
All internal PHY addresses can be used to access the same PHY_DEV1F
group of registers.

I think the port "0" here must be changed to reference the "first
internal phy address" to prevent the situation you mentioned.
> 
> [snip]
> 
> > +static int mt7531_rgmii_setup(struct mt7530_priv *priv, u32 port)
> > +{
> > +	u32 val;
> > +
> > +	if (port != 5) {
> > +		dev_err(priv->dev, "RGMII mode is not available for port %d\n",
> > +			port);
> > +		return -EINVAL;
> > +	}
> > +
> > +	val = mt7530_read(priv, MT7531_CLKGEN_CTRL);
> > +	val |= GP_CLK_EN;
> > +	val &= ~GP_MODE_MASK;
> > +	val |= GP_MODE(MT7531_GP_MODE_RGMII);
> > +	val |= TXCLK_NO_REVERSE;
> > +	val |= RXCLK_NO_DELAY;
> 
> You actually need to look at the port's phy_interface_t value to
> determine whether the delays should be set/clear in either RX or TX
> directions.
Sure. Thanks for your advice.
> 
> [snip]
> 
> > -	if (phylink_autoneg_inband(mode)) {
> > +	if (phylink_autoneg_inband(mode) &&
> > +	    state->interface != PHY_INTERFACE_MODE_SGMII) {
> 
> So you don't support in-band auto-negotiation for 1000BaseX either?
According to the user manual I have, it only provides the configure 10M
+100M+1000M AN mode/1000M force mode/2500M force mode, so I mapping them
to SGMII/1000BaseX/2500BaseX. The user friendly part of this IP wraps
too much detail to map to the spec. I'll try to dig it out.
> 
> [snip]
> 
> > @@ -1590,9 +2197,20 @@ static void mt753x_phylink_validate(struct dsa_switch *ds, int port,
> >  	phylink_set_port_modes(mask);
> >  	phylink_set(mask, Autoneg);
> >  
> > -	if (state->interface == PHY_INTERFACE_MODE_TRGMII) {
> > +	switch (state->interface) {
> > +	case PHY_INTERFACE_MODE_TRGMII:
> >  		phylink_set(mask, 1000baseT_Full);
> > -	} else {
> > +		break;
> > +	case PHY_INTERFACE_MODE_1000BASEX:
> > +	case PHY_INTERFACE_MODE_2500BASEX:
> > +		phylink_set(mask, 1000baseX_Full);
> > +		phylink_set(mask, 2500baseX_Full);
> 
> Did you intend this to be:
> 
> 	case PHY_INTERFACE_MODE_2500BASEX:
> 		phylink_set(mask, 2500baseX_Full);
> 		/* fall through */
> 	case PHY_INTERFACE_MODE_1000BASEX:
> 		phylink_set(mask, 1000baseX_Full);
> 		break;
> 
> ?
As the user manual mentioned, it is more likely to be:
 	case PHY_INTERFACE_MODE_2500BASEX:
 		phylink_set(mask, 2500baseX_Full);
 		break;
 	case PHY_INTERFACE_MODE_1000BASEX:
 		phylink_set(mask, 1000baseX_Full);
 		break;
> [snip]
> 
> > +/* Register for PHY Indirect Access Control */
> > +#define MT7531_PHY_IAC			0x701C
> > +#define  PHY_ACS_ST			BIT(31)
> > +#define  MDIO_REG_ADDR_MASK		(0x1f << 25)
> > +#define  MDIO_PHY_ADDR_MASK		(0x1f << 20)
> > +#define  MDIO_CMD_MASK			(0x3 << 18)
> > +#define  MDIO_ST_MASK			(0x3 << 16)
> > +#define  MDIO_RW_DATA_MASK		(0xffff)
> > +#define  MDIO_REG_ADDR(x)		(((x) & 0x1f) << 25)
> > +#define  MDIO_DEV_ADDR(x)		(((x) & 0x1f) << 25)
> > +#define  MDIO_PHY_ADDR(x)		(((x) & 0x1f) << 20)
> > +#define  MDIO_CMD(x)			(((x) & 0x3) << 18)
> > +#define  MDIO_ST(x)			(((x) & 0x3) << 16)
> 
> I would suggest names that are more scoped because these could easily
> collide with existing of future definitions from include/linux/mdio.h.
Sure, I'll add "MT7531_" as the prefix.
> 
> > +
> > +enum mt7531_phy_iac_cmd {
> > +	MT7531_MDIO_ADDR = 0,
> > +	MT7531_MDIO_WRITE = 1,
> > +	MT7531_MDIO_READ = 2,
> > +	MT7531_MDIO_READ_CL45 = 3,
> > +};
> > +
> > +/* MDIO_ST: MDIO start field */
> > +enum mt7531_mdio_st {
> > +	MT7531_MDIO_ST_CL45 = 0,
> > +	MT7531_MDIO_ST_CL22 = 1,
> > +};
> > +
> > +#define  MDIO_CL22_READ			(MDIO_ST(MT7531_MDIO_ST_CL22) | \
> > +					 MDIO_CMD(MT7531_MDIO_READ))
> > +#define  MDIO_CL22_WRITE		(MDIO_ST(MT7531_MDIO_ST_CL22) | \
> > +					 MDIO_CMD(MT7531_MDIO_WRITE))
> > +#define  MDIO_CL45_ADDR			(MDIO_ST(MT7531_MDIO_ST_CL45) | \
> > +					 MDIO_CMD(MT7531_MDIO_ADDR))
> > +#define  MDIO_CL45_READ			(MDIO_ST(MT7531_MDIO_ST_CL45) | \
> > +					 MDIO_CMD(MT7531_MDIO_READ))
> > +#define  MDIO_CL45_WRITE		(MDIO_ST(MT7531_MDIO_ST_CL45) | \
> > +					 MDIO_CMD(MT7531_MDIO_WRITE))
> 
> Likewise.
I'll add "MT7531_" as the prefix.

Landen
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
