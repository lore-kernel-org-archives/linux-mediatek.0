Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3294C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Dec 2021 11:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T7yBqKfS/8vFuJ0FWLwyKDKBYmG0+v1ynFwffYQQAL4=; b=xDuFx1EqTqSaB9
	xuBWwqTrvO8OKw5BbvMrAPvaKXkdAywRfQHLUBQeobXHXsRNozxmHTAHbzBeW4zp+20+JHfDuBfgW
	l0khHRfTL+ce775fkeI4idHfjWjq0+S5LmPEzXSQxUnHxwQKmPVSGwSd/G09R1dOXDAj6WtF8sfNl
	oRVsB6wFlyLd42sAXekK3EFDmF0QDfDaF0ee+gKJShM9e49Vhsz67GAJC0OZ9MF0bFz75m+698cfI
	Vcw6T2acq5w6rz+21BF4kaDkDiAVsxLpidkvU22L+whGAapmVyQMbiCsdCVfTMh/WcP8ExCUmbSuX
	TfP54d3uayHNoMDqK+ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2Ay7-000pb4-G1; Tue, 28 Dec 2021 11:48:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2Ay4-000pMd-7r; Tue, 28 Dec 2021 11:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RNHoZ0GtgjhwVRX5MUHe6/BsYwPpZYj7SMw0wDAtQCs=; b=MxXNU1qDUzsNhJqRi43dEJZzzJ
 WvX+NBxpx8uYlsXJ00bOrPJPVOCqJPoGlreLOIHursxqvSkwnTp4RhdqTnni8mYGheUkEVboHQMJZ
 Cr+jUmuqC5OwW/atnmbPJv0OgLSraQqq3MYOBaROD2t3lF+oqj5b78A5q/6C1EcYDSvw0MYDL8NBJ
 XqnCPygRMbfdClvNbgNXeBTd8D94x9cB5nM0P/O28VakWcRs5aCT3RyY4JRkW7xiogeEEODxLdsbX
 +r5jSGoj+9nC6RzlC1w9h12Hqg8k/6ageOb1ONRMhnoxxiBT85ZV8Fyx08i2WSj59xyDh5+f26HxR
 VeNCVTfQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56470)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1n2Avw-0001ml-2G; Tue, 28 Dec 2021 11:46:24 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1n2Avq-0000ej-JT; Tue, 28 Dec 2021 11:46:18 +0000
Date: Tue, 28 Dec 2021 11:46:18 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>
Cc: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v7 2/2] net: ethernet: mtk_eth_soc: implement Clause 45
 MDIO access
Message-ID: <Ycr5Cna76eg2B0An@shell.armlinux.org.uk>
References: <YcnoAscVe+2YILT8@shell.armlinux.org.uk>
 <YcpVmlb1jFavCBpS@makrotopia.org> <YcpVtjykiS7mgtT5@makrotopia.org>
 <YcpkXclZRXLC3XfM@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YcpkXclZRXLC3XfM@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_034836_345624_ED5E8E35 
X-CRM114-Status: GOOD (  20.09  )
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

On Tue, Dec 28, 2021 at 01:11:57AM +0000, Daniel Golle wrote:
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> index 5ef70dd8b49c6..b73d8adc9d24c 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> @@ -341,9 +341,12 @@
>  /* PHY Indirect Access Control registers */
>  #define MTK_PHY_IAC		0x10004
>  #define PHY_IAC_ACCESS		BIT(31)
> +#define PHY_IAC_SET_ADDR	0
>  #define PHY_IAC_READ		BIT(19)
> +#define PHY_IAC_READ_C45	(BIT(18) | BIT(19))
>  #define PHY_IAC_WRITE		BIT(18)

You probably want at some point to clean the "operation code" (OP)
definition up here. IEEE 802.3 defines this as a two bit field:

OP	Clause 22	Clause 45
00	Undefined	Address
01	Write		Write
10	Read		Post-read-increment-address
11	Undefined	Read

What I'm getting at is, this isn't a couple of independent bits, and my
feeling is that such fields should not be defined using BIT() unless
they truely are independent bits.

Maybe:

#define PHY_IAC_OP(x)		((x) << 18)
#define PHY_IAC_OP_C45_ADDR	PHY_IAC_OP(0)
#define PHY_IAC_OP_WRITE	PHY_IAC_OP(1)
#define PHY_IAC_OP_C22_READ	PHY_IAC_OP(2)
#define PHY_IAC_OP_C45_READ	PHY_IAC_OP(3)

Or if you prefer GENMASK / FIELD_FIT way of doing things:

#define PHY_IAC_OP_MASK		GENMASK(17, 16)
#define PHY_IAC_OP_C45_ADDR	FIELD_FIT(PHY_IAC_OP_MASK, 0)
#define PHY_IAC_OP_WRITE	FIELD_FIT(PHY_IAC_OP_MASK, 1)
#define PHY_IAC_OP_C22_READ	FIELD_FIT(PHY_IAC_OP_MASK, 2)
#define PHY_IAC_OP_C45_READ	FIELD_FIT(PHY_IAC_OP_MASK, 3)

I'm also wondering about the PHY_IAC_START* definitions. IEEE 802.3
gives us:

ST
00	Clause 45
01	Clause 22

I'm wondering whether bit 17 is part of the start field in your device,
making bit 16 and 17 a two-bit field that defines the ST bits sent on
the bus.

Also, as I mentioned previously, I would like to see helpers to extract
the devad and regad fields, so here's a patch that adds a couple of
helpers (but is completely untested!) If you update your patches to use
this (please wait a bit longer before doing so in case there's other
comments) you will need to include my patch along with your other two.
Thanks.

8<====
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [PATCH] net: mdio: add helpers to extract clause 45 regad and devad
 fields

Add a couple of helpers and definitions to extract the clause 45 regad
and devad fields from the regnum passed into MDIO drivers.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 include/linux/mdio.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/mdio.h b/include/linux/mdio.h
index 5c6676d3de23..37f98fbdee49 100644
--- a/include/linux/mdio.h
+++ b/include/linux/mdio.h
@@ -7,6 +7,7 @@
 #define __LINUX_MDIO_H__
 
 #include <uapi/linux/mdio.h>
+#include <linux/bitfield.h>
 #include <linux/mod_devicetable.h>
 
 /* Or MII_ADDR_C45 into regnum for read/write on mii_bus to enable the 21 bit
@@ -14,6 +15,7 @@
  */
 #define MII_ADDR_C45		(1<<30)
 #define MII_DEVADDR_C45_SHIFT	16
+#define MII_DEVADDR_C45_MASK	GENMASK(20, 16)
 #define MII_REGADDR_C45_MASK	GENMASK(15, 0)
 
 struct gpio_desc;
@@ -385,6 +387,16 @@ static inline u32 mdiobus_c45_addr(int devad, u16 regnum)
 	return MII_ADDR_C45 | devad << MII_DEVADDR_C45_SHIFT | regnum;
 }
 
+static inline u16 mdiobus_c45_regad(u32 regnum)
+{
+	return FIELD_GET(MII_REGADDR_C45_MASK, regnum);
+}
+
+static inline u16 mdiobus_c45_devad(u32 regnum)
+{
+	return FIELD_GET(MII_DEVADDR_C45_MASK, regnum);
+}
+
 static inline int __mdiobus_c45_read(struct mii_bus *bus, int prtad, int devad,
 				     u16 regnum)
 {
-- 
2.30.2

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
