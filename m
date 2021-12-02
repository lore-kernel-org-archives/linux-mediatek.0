Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789F6C43219
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Dec 2021 08:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xG2pXc+M34p/IPFREN6w+JR0+ZYomsDzQ2wsZg+HoaM=; b=q72DBxycZPR8fp
	f0r1+JcFMjs5+SO4+4G9guIXGDjPN3ADGTWH39uTmAGtrD9FWgCWU5VDgHcyHiMT+CbStv0ECRZ3x
	fYQkDTC1fmNp5ReT6vpbmdMt2pmgrGoaxu5Ol3C4KdwK7Q3S8N4DmzpfyTA1sCn1LlmgUeVfeOjna
	1Qw3GsPmPxLm2wPdOi/OWrJASHeuBgtleIJDkklLDZYqnqFCerz8xiIeydGLFL+/LlesZWAFyt92I
	EUXWH1NlmsjbppqDeiQckP9oXZ+9CoMEgXOQBwIrrSoetMYMjM3nVNiXWP2PufTITsr17OomSuUKM
	BLKAMG6NAWnY3jKX+FeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mshm7-00BTiC-HZ; Thu, 02 Dec 2021 08:49:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mshls-00BTfO-Cn; Thu, 02 Dec 2021 08:48:55 +0000
X-UUID: 968be612fc30413695a4198296f8c78e-20211202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=SuJncVDagDXOzN1D2iihDmF/nabu9iVaqVHy+cMfib8=; 
 b=NxAQ/MjZ3wqUobF6eG8KTDZjl/wdmepxaTU1L+C0kkvj8BvmFgg9pJoVGqwTTGy3AXFKoS0gr3bJMOXWAeGdlFotkkc9GDTrfHKEyZojklsJ84eUa3+jgq7naly2l/0VokXbr3Zd5McCugAIuny75AO0p49BlpANE+Nxb2nq6SM=;
X-UUID: 968be612fc30413695a4198296f8c78e-20211202
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 484894905; Thu, 02 Dec 2021 01:48:47 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Dec 2021 00:48:45 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 2 Dec 2021 16:48:44 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Dec 2021 16:48:43 +0800
Message-ID: <8b6d3066fb94bc01291f1c283e299e57214d2784.camel@mediatek.com>
Subject: Re: [PATCH 5/6] phy: phy-mtk-tphy: add support efuse setting
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Kishon
 Vijay Abraham I" <kishon@ti.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>, Eddie Hung
 <eddie.hung@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, "Yz
 Wu" <yz.wu@mediatek.com>
Date: Thu, 2 Dec 2021 16:48:43 +0800
In-Reply-To: <YZ8bW+bAkxcg2G/U@matsya>
References: <20211107075646.4366-1-chunfeng.yun@mediatek.com>
 <20211107075646.4366-5-chunfeng.yun@mediatek.com> <YZuAab3j+flr1xXj@matsya>
 <1e51d7bf0e77ddb4d558f0a4407dec5cdc1bc35e.camel@mediatek.com>
 <YZ8bW+bAkxcg2G/U@matsya>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_004853_899534_905FACE3 
X-CRM114-Status: GOOD (  40.35  )
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

On Thu, 2021-11-25 at 10:42 +0530, Vinod Koul wrote:
> On 24-11-21, 14:54, Chunfeng Yun wrote:
> > On Mon, 2021-11-22 at 17:05 +0530, Vinod Koul wrote:
> > > On 07-11-21, 15:56, Chunfeng Yun wrote:
> > > > Due to some SoCs have a bit shift issue that will drop a bit
> > > > for
> > > > usb3
> > > > phy or pcie phy, fix it by adding software efuse reading and
> > > > setting,
> > > > but only support it optionally for versoin 2/3.
> > > 
> > > s/versoin/version
> > 
> > Ok
> > > 
> > > > 
> > > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > > ---
> > > >  drivers/phy/mediatek/phy-mtk-tphy.c | 162
> > > > ++++++++++++++++++++++++++++
> > > >  1 file changed, 162 insertions(+)
> > > > 
> > > > diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c
> > > > b/drivers/phy/mediatek/phy-mtk-tphy.c
> > > > index cdcef865fe9e..3b5b1c266595 100644
> > > > --- a/drivers/phy/mediatek/phy-mtk-tphy.c
> > > > +++ b/drivers/phy/mediatek/phy-mtk-tphy.c
> > > > @@ -12,6 +12,7 @@
> > > >  #include <linux/iopoll.h>
> > > >  #include <linux/mfd/syscon.h>
> > > >  #include <linux/module.h>
> > > > +#include <linux/nvmem-consumer.h>
> > > >  #include <linux/of_address.h>
> > > >  #include <linux/of_device.h>
> > > >  #include <linux/phy/phy.h>
> > > > @@ -41,6 +42,9 @@
> > > >  #define SSUSB_SIFSLV_V2_U3PHYD		0x200
> > > >  #define SSUSB_SIFSLV_V2_U3PHYA		0x400
> > > >  
> > > > +#define U3P_MISC_REG1		0x04
> > > > +#define MR1_EFUSE_AUTO_LOAD_DIS		BIT(6)
> > > > +
> > > >  #define U3P_USBPHYACR0		0x000
> > > >  #define PA0_RG_U2PLL_FORCE_ON		BIT(15)
> > > >  #define PA0_USB20_PLL_PREDIV		GENMASK(7, 6)
> > > > @@ -133,6 +137,8 @@
> > > >  #define P3C_RG_SWRST_U3_PHYD_FORCE_EN	BIT(24)
> > > >  
> > > >  #define U3P_U3_PHYA_REG0	0x000
> > > > +#define P3A_RG_IEXT_INTR		GENMASK(15, 10)
> > > > +#define P3A_RG_IEXT_INTR_VAL(x)		((0x3f & (x))
> > > > << 10)
> > > >  #define P3A_RG_CLKDRV_OFF		GENMASK(3, 2)
> > > >  #define P3A_RG_CLKDRV_OFF_VAL(x)	((0x3 & (x)) << 2)
> > > >  
> > > > @@ -187,6 +193,19 @@
> > > >  #define P3D_RG_FWAKE_TH		GENMASK(21, 16)
> > > >  #define P3D_RG_FWAKE_TH_VAL(x)	((0x3f & (x)) << 16)
> > > >  
> > > > +#define U3P_U3_PHYD_IMPCAL0		0x010
> > > > +#define P3D_RG_FORCE_TX_IMPEL		BIT(31)
> > > > +#define P3D_RG_TX_IMPEL			GENMASK(28, 24)
> > > > +#define P3D_RG_TX_IMPEL_VAL(x)		((0x1f & (x)) << 24)
> > > > +
> > > > +#define U3P_U3_PHYD_IMPCAL1		0x014
> > > > +#define P3D_RG_FORCE_RX_IMPEL		BIT(31)
> > > > +#define P3D_RG_RX_IMPEL			GENMASK(28, 24)
> > > > +#define P3D_RG_RX_IMPEL_VAL(x)		((0x1f & (x)) << 24)
> > > > +
> > > > +#define U3P_U3_PHYD_RSV			0x054
> > > > +#define P3D_RG_EFUSE_AUTO_LOAD_DIS	BIT(12)
> > > > +
> > > >  #define U3P_U3_PHYD_CDR1		0x05c
> > > >  #define P3D_RG_CDR_BIR_LTD1		GENMASK(28, 24)
> > > >  #define P3D_RG_CDR_BIR_LTD1_VAL(x)	((0x1f & (x)) << 24)
> > > > @@ -307,6 +326,11 @@ struct mtk_phy_pdata {
> > > >  	 * 48M PLL, fix it by switching PLL to 26M from default
> > > > 48M
> > > >  	 */
> > > >  	bool sw_pll_48m_to_26m;
> > > > +	/*
> > > > +	 * Some SoCs (e.g. mt8195) drop a bit when use auto
> > > > load efuse,
> > > > +	 * support sw way, also support it for v2/v3
> > > > optionally.
> > > > +	 */
> > > > +	bool sw_efuse_supported;
> > > >  	enum mtk_phy_version version;
> > > >  };
> > > >  
> > > > @@ -336,6 +360,10 @@ struct mtk_phy_instance {
> > > >  	struct regmap *type_sw;
> > > >  	u32 type_sw_reg;
> > > >  	u32 type_sw_index;
> > > > +	u32 efuse_sw_en;
> > > > +	u32 efuse_intr;
> > > > +	u32 efuse_tx_imp;
> > > > +	u32 efuse_rx_imp;
> > > >  	int eye_src;
> > > >  	int eye_vrt;
> > > >  	int eye_term;
> > > > @@ -1040,6 +1068,130 @@ static int phy_type_set(struct
> > > > mtk_phy_instance *instance)
> > > >  	return 0;
> > > >  }
> > > >  
> > > > +static int phy_efuse_get(struct mtk_tphy *tphy, struct
> > > > mtk_phy_instance *instance)
> > > > +{
> > > > +	struct device *dev = &instance->phy->dev;
> > > > +	int ret = 0;
> > > > +
> > > > +	/* tphy v1 doesn't support sw efuse, skip it */
> > > > +	if (!tphy->pdata->sw_efuse_supported) {
> > > > +		instance->efuse_sw_en = 0;
> > > > +		return 0;
> > > > +	}
> > > > +
> > > > +	/* software efuse is optional */
> > > > +	instance->efuse_sw_en = device_property_read_bool(dev,
> > > > "nvmem-
> > > > cells");
> > > > +	if (!instance->efuse_sw_en)
> > > > +		return 0;
> > > > +
> > > > +	switch (instance->type) {
> > > > +	case PHY_TYPE_USB2:
> > > > +		ret = nvmem_cell_read_variable_le_u32(dev,
> > > > "intr",
> > > > &instance->efuse_intr);
> > > > +		if (ret) {
> > > > +			dev_err(dev, "fail to get u2 intr
> > > > efuse, %d\n",
> > > > ret);
> > > > +			break;
> > > > +		}
> > > > +
> > > > +		/* no efuse, ignore it */
> > > > +		if (!instance->efuse_intr) {
> > > > +			dev_warn(dev, "no u2 intr efuse, but
> > > > dts enable
> > > > it\n");
> > > > +			instance->efuse_sw_en = 0;
> > > > +			break;
> > > > +		}
> > > 
> > > What does this check do...? so a zero value is not valid..?
> > 
> > Yes, because it's also zero for SoC without efuse, prefer to use
> > default value instead.
> > 
> > > 
> > > > +
> > > > +		dev_info(dev, "u2 efuse - intr %x\n", instance-
> > > > > efuse_intr);
> > > 
> > > dev_dbg()?
> > 
> > We usually use HW auto load way, print this log can help to point
> > out
> > that it's specific SoC.
> 
> You can enable this print thru dynamic debug or enable debug prints
> when
> debugging, let us not spam message log
Ok, will use dev_dbg()
> 
> > 
> > > 
> > > > +		break;
> > > 
> > > empty line after break improves readability, pls add
> > 
> > Ok
> > > 
> > > > +	case PHY_TYPE_USB3:
> > > > +	case PHY_TYPE_PCIE:
> > > > +		ret = nvmem_cell_read_variable_le_u32(dev,
> > > > "intr",
> > > > &instance->efuse_intr);
> > > > +		if (ret) {
> > > > +			dev_err(dev, "fail to get u3 intr
> > > > efuse, %d\n",
> > > > ret);
> > > > +			break;
> > > > +		}
> > > 
> > > This seems to be common, why not read this before switch?
> > 
> > It's not used for SGMII or SATA, but not applied until now
> > 
> > > 
> > > > +
> > > > +		ret = nvmem_cell_read_variable_le_u32(dev,
> > > > "rx_imp",
> > > > &instance->efuse_rx_imp);
> > > > +		if (ret) {
> > > > +			dev_err(dev, "fail to get u3 rx_imp
> > > > efuse,
> > > > %d\n", ret);
> > > > +			break;
> > > > +		}
> > > > +
> > > > +		ret = nvmem_cell_read_variable_le_u32(dev,
> > > > "tx_imp",
> > > > &instance->efuse_tx_imp);
> > > > +		if (ret) {
> > > > +			dev_err(dev, "fail to get u3 tx_imp
> > > > efuse,
> > > > %d\n", ret);
> > > > +			break;
> > > > +		}
> > > > +
> > > > +		/* no efuse, ignore it */
> > > > +		if (!instance->efuse_intr &&
> > > > +		    !instance->efuse_rx_imp &&
> > > > +		    !instance->efuse_rx_imp) {
> > > > +			dev_warn(dev, "no u3 intr efuse, but
> > > > dts enable
> > > > it\n");
> > > > +			instance->efuse_sw_en = 0;
> > > > +			break;
> > > > +		}
> > > 
> > > again, zero values are not valid?
> > 
> > It's also zero for SoC without efuse, treat it as invalid value
> > 
> > > 
> > > > +
> > > > +		dev_info(dev, "u3 efuse - intr %x, rx_imp %x,
> > > > tx_imp
> > > > %x\n",
> > > > +			 instance->efuse_intr, instance-
> > > > >efuse_rx_imp,
> > > > +			 instance->efuse_tx_imp);
> > > 
> > > dbg pls
> > 
> > Ok
> > > 
> > > > +		break;
> > > > +	default:
> > > > +		dev_err(dev, "no sw efuse for type %d\n",
> > > > instance-
> > > > > type);
> > > > 
> > > > +		ret = -EINVAL;
> > > > +	}
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static void phy_efuse_set(struct mtk_phy_instance *instance)
> > > > +{
> > > > +	struct device *dev = &instance->phy->dev;
> > > > +	struct u2phy_banks *u2_banks = &instance->u2_banks;
> > > > +	struct u3phy_banks *u3_banks = &instance->u3_banks;
> > > > +	u32 tmp;
> > > > +
> > > > +	if (!instance->efuse_sw_en)
> > > > +		return;
> > > > +
> > > > +	switch (instance->type) {
> > > > +	case PHY_TYPE_USB2:
> > > > +		tmp = readl(u2_banks->misc + U3P_MISC_REG1);
> > > > +		tmp |= MR1_EFUSE_AUTO_LOAD_DIS;
> > > > +		writel(tmp, u2_banks->misc + U3P_MISC_REG1);
> > > > +
> > > > +		tmp = readl(u2_banks->com + U3P_USBPHYACR1);
> > > > +		tmp &= ~PA1_RG_INTR_CAL;
> > > > +		tmp |= PA1_RG_INTR_CAL_VAL(instance-
> > > > >efuse_intr);
> > > > +		writel(tmp, u2_banks->com + U3P_USBPHYACR1);
> > > > +		break;
> > > > +	case PHY_TYPE_USB3:
> > > > +	case PHY_TYPE_PCIE:
> > > > +		tmp = readl(u3_banks->phyd + U3P_U3_PHYD_RSV);
> > > > +		tmp |= P3D_RG_EFUSE_AUTO_LOAD_DIS;
> > > > +		writel(tmp, u3_banks->phyd + U3P_U3_PHYD_RSV);
> > > 
> > > add a updatel() macro and use this here and other places?
> > 
> > You mean add macro to set/clear bits?
> > If so, I need prepare another patch for this purpose
> 
> Sure, that would be nice
Ok
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
