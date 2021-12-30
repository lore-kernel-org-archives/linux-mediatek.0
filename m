Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1765C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Dec 2021 02:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9dQjs5SEIRG+3MfwYTX/x7Kdu2/G5KTIl1mCDbvlmzg=; b=HaHkjV0ERJQ8jF
	tqDWOUsqehYW4Rfs1nfUnRibQkz743ee23jVr7UI/JB+alReRBCOB3I6vDgra4vfJLEDwx1GVlEXG
	MBpwop3opF7SculC+N89t6n4vVoFKCdjmcVduN3UK928eh65otjMOsEuxGmbt2Y6D8l7ahJolUH0I
	x3I68xjJ20+6y9cYdJlPF9Ahzsie9lbTySNwVx1Z1aYEd4jq8MRAMrYgX6eYjBpvDeb4TZogDpbFP
	3Mu58qoahVcePjZ0cGOtaG3aA1s+qddAERn/yY2JSbNA0XBmVgrYJEnOF3cu+bO1aDiPxmbCPgnWk
	wcPRzOQ68OcWSmdyMcgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2kxR-003ar8-1L; Thu, 30 Dec 2021 02:14:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2kxN-003aqK-RN; Thu, 30 Dec 2021 02:14:19 +0000
X-UUID: 2c21f17ed15742eabecc96161f51bc78-20211229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=x6GiD9JJ4B1knkLkeZo2l7UgESkmJYdMXsAzklAKuuQ=; 
 b=Qg4F1qYwMCtyrkbGjOSO86EVcnkGnAg8MaoALcUdT9dEGiZJ+uBoVtWdKevLnZ1gqkYPTAiHN+vtmBCXD0OwOsDYNUhLkgFOdELjZLmoaGR9r2oLZhQfBRrUxjRzwJ83XVSc0x+tCwquZqD7ZJ2CrtIOb1q28ZoY9Zfh94GXIsw=;
X-UUID: 2c21f17ed15742eabecc96161f51bc78-20211229
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1242767948; Wed, 29 Dec 2021 19:14:11 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Dec 2021 18:14:10 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 30 Dec 2021 10:13:57 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Dec 2021 10:13:56 +0800
Message-ID: <e7e25a6bce17a4f488e49dfc6d17aa77f0603645.camel@mediatek.com>
Subject: Re: [PATCH v2 2/5] phy: phy-mtk-tphy: add support efuse setting
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vinod Koul <vkoul@kernel.org>
CC: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>
Date: Thu, 30 Dec 2021 10:13:56 +0800
In-Reply-To: <bc841baa-e025-b0b8-8dbd-f438fd6981f7@collabora.com>
References: <20211218082802.5256-1-chunfeng.yun@mediatek.com>
 <20211218082802.5256-2-chunfeng.yun@mediatek.com>
 <bc841baa-e025-b0b8-8dbd-f438fd6981f7@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_181417_923676_8485040D 
X-CRM114-Status: GOOD (  34.18  )
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

On Fri, 2021-12-24 at 11:03 +0100, AngeloGioacchino Del Regno wrote:
> Il 18/12/21 09:27, Chunfeng Yun ha scritto:
> > Due to some SoCs have a bit shift issue that will drop a bit for
> > usb3
> > phy or pcie phy, fix it by adding software efuse reading and
> > setting,
> > but only support it optionally for version 2/3.
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v2: changes suggested by Vinod
> >      1. fix typo of version in commit message
> >      2. use dev_dbg() instead of dev_info()
> > ---
> >   drivers/phy/mediatek/phy-mtk-tphy.c | 162
> > ++++++++++++++++++++++++++++
> >   1 file changed, 162 insertions(+)
> > 
> 
> Hello Chunfeng, thanks for the patch!
> However, there are a few things to improve...
> 
> > diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c
> > b/drivers/phy/mediatek/phy-mtk-tphy.c
> > index cdcef865fe9e..98a942c607a6 100644
> > --- a/drivers/phy/mediatek/phy-mtk-tphy.c
> > +++ b/drivers/phy/mediatek/phy-mtk-tphy.c
> > @@ -12,6 +12,7 @@
> >   #include <linux/iopoll.h>
> >   #include <linux/mfd/syscon.h>
> >   #include <linux/module.h>
> > +#include <linux/nvmem-consumer.h>
> >   #include <linux/of_address.h>
> >   #include <linux/of_device.h>
> >   #include <linux/phy/phy.h>
> > @@ -41,6 +42,9 @@
> >   #define SSUSB_SIFSLV_V2_U3PHYD		0x200
> >   #define SSUSB_SIFSLV_V2_U3PHYA		0x400
> >   
> > +#define U3P_MISC_REG1		0x04
> > +#define MR1_EFUSE_AUTO_LOAD_DIS		BIT(6)
> > +
> >   #define U3P_USBPHYACR0		0x000
> >   #define PA0_RG_U2PLL_FORCE_ON		BIT(15)
> >   #define PA0_USB20_PLL_PREDIV		GENMASK(7, 6)
> > @@ -133,6 +137,8 @@
> >   #define P3C_RG_SWRST_U3_PHYD_FORCE_EN	BIT(24)
> >   
> >   #define U3P_U3_PHYA_REG0	0x000
> > +#define P3A_RG_IEXT_INTR		GENMASK(15, 10)
> > +#define P3A_RG_IEXT_INTR_VAL(x)		((0x3f & (x)) << 10)
> >   #define P3A_RG_CLKDRV_OFF		GENMASK(3, 2)
> >   #define P3A_RG_CLKDRV_OFF_VAL(x)	((0x3 & (x)) << 2)
> >   
> > @@ -187,6 +193,19 @@
> >   #define P3D_RG_FWAKE_TH		GENMASK(21, 16)
> >   #define P3D_RG_FWAKE_TH_VAL(x)	((0x3f & (x)) << 16)
> >   
> > +#define U3P_U3_PHYD_IMPCAL0		0x010
> > +#define P3D_RG_FORCE_TX_IMPEL		BIT(31)
> > +#define P3D_RG_TX_IMPEL			GENMASK(28, 24)
> > +#define P3D_RG_TX_IMPEL_VAL(x)		((0x1f & (x)) << 24)
> > +
> > +#define U3P_U3_PHYD_IMPCAL1		0x014
> > +#define P3D_RG_FORCE_RX_IMPEL		BIT(31)
> > +#define P3D_RG_RX_IMPEL			GENMASK(28, 24)
> > +#define P3D_RG_RX_IMPEL_VAL(x)		((0x1f & (x)) << 24)
> > +
> > +#define U3P_U3_PHYD_RSV			0x054
> > +#define P3D_RG_EFUSE_AUTO_LOAD_DIS	BIT(12)
> > +
> >   #define U3P_U3_PHYD_CDR1		0x05c
> >   #define P3D_RG_CDR_BIR_LTD1		GENMASK(28, 24)
> >   #define P3D_RG_CDR_BIR_LTD1_VAL(x)	((0x1f & (x)) << 24)
> > @@ -307,6 +326,11 @@ struct mtk_phy_pdata {
> >   	 * 48M PLL, fix it by switching PLL to 26M from default 48M
> >   	 */
> >   	bool sw_pll_48m_to_26m;
> > +	/*
> > +	 * Some SoCs (e.g. mt8195) drop a bit when use auto load efuse,
> > +	 * support sw way, also support it for v2/v3 optionally.
> > +	 */
> > +	bool sw_efuse_supported;
> >   	enum mtk_phy_version version;
> >   };
> >   
> > @@ -336,6 +360,10 @@ struct mtk_phy_instance {
> >   	struct regmap *type_sw;
> >   	u32 type_sw_reg;
> >   	u32 type_sw_index;
> > +	u32 efuse_sw_en;
> > +	u32 efuse_intr;
> > +	u32 efuse_tx_imp;
> > +	u32 efuse_rx_imp;
> >   	int eye_src;
> >   	int eye_vrt;
> >   	int eye_term;
> > @@ -1040,6 +1068,130 @@ static int phy_type_set(struct
> > mtk_phy_instance *instance)
> >   	return 0;
> >   }
> >   
> > +static int phy_efuse_get(struct mtk_tphy *tphy, struct
> > mtk_phy_instance *instance)
> > +{
> > +	struct device *dev = &instance->phy->dev;
> > +	int ret = 0;
> > +
> > +	/* tphy v1 doesn't support sw efuse, skip it */
> > +	if (!tphy->pdata->sw_efuse_supported) {
> > +		instance->efuse_sw_en = 0;
> > +		return 0;
> > +	}
> > +
> > 
> > [...]
> > 
> > +
> > +		dev_dbg(dev, "u3 efuse - intr %x, rx_imp %x, tx_imp
> > %x\n",
> > +			instance->efuse_intr, instance-
> > >efuse_rx_imp,instance->efuse_tx_imp);
> > +		break;
> > +	default:
> > +		dev_err(dev, "no sw efuse for type %d\n", instance-
> > >type);
> > +		ret = -EINVAL;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static void phy_efuse_set(struct mtk_phy_instance *instance)
> 
> The name for this function is a bit misleading and one may think that
> this
> is writing efuses (aka blowing a fuse array), 
The hardware efuses on MediaTek platform only support Read-Only.

> which doesn't look like being
> the case at all.
> 
> What about changing it to phy_set_sw_efuse_params(), or something
> similar?
It seems better, I'll prepare a new patch.
> 
> 
> Thank you,
> - Angelo
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
