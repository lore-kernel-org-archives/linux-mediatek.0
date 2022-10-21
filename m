Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80667C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 02:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qdjsFEH0oh9embVqdIaj4MZM1exUIQFOODo3uNBVQKo=; b=ct203V61GiUxwxRYqWZXkeEwB8
	JSWo0SCP/cR+rmIsd+czBAQg+mowjVJ5jfUkbR4H7EMeiQa5CwtoxpPkhs2eIQpNx8+5BhNvTf4rp
	cEUPpUE2yLERdS35wyFth7bKuhGTmgYw0PbzCTHrn5GrXhhsWEm160DmS/h9Nrx32MZB/FhRvWbOU
	B0iTxKi3Nt/st32X52Edk6zjVcD8PZY9RXRLtP1Lqg/0i+dKAe4Oow7vnMkqeK8lyHKN2AZ65PoXn
	5U/ttBoPhpAqo3t+21ydxHo8T0PJBdeWcx/iFkf64m7OCE1P/tUbXM9H/bNOquWMTb2lWhDePppnI
	H6+mbTQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olhiS-004QrI-O3; Fri, 21 Oct 2022 02:24:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olhi9-004QZG-NU; Fri, 21 Oct 2022 02:24:39 +0000
X-UUID: 021d849d16dd4e3787240307118fabe7-20221020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=qdjsFEH0oh9embVqdIaj4MZM1exUIQFOODo3uNBVQKo=;
	b=RxFc6gfoUQWug62VyKwzfozzbWxvneruLmpKmWAegOy1HNx9WAquTZYhx/idDXJYRJyMpDOyLLsEIoaXgMd4nCj7BFl56ffd6Ys9Vjg4l0Ao+XcQLp35d1j1vg1lqd38xKhcqACNOVTABYx8BZL9tisezQkng68O47+QDs03YKk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:2b01c418-a79e-490e-b23f-f5b7b6123c40,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:62cd327,CLOUDID:7bd8f6ee-314c-4293-acb8-ca4299dd021f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 021d849d16dd4e3787240307118fabe7-20221020
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <sam.shih@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1990803254; Thu, 20 Oct 2022 19:24:28 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 21 Oct 2022 10:23:55 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 21 Oct 2022 10:23:55 +0800
Message-ID: <c908b7ff9c9685dedad41c0be61a7037cc31718d.camel@mediatek.com>
Subject: Re: [PATCH 1/2] phy: phy-mtk-tphy: Add PCIe 2 lane efuse support
From: Sam Shih <sam.shih@mediatek.com>
To: Daniel Golle <daniel@makrotopia.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Jie
 Yang" <jieyy.yang@mediatek.com>
Date: Fri, 21 Oct 2022 10:23:55 +0800
In-Reply-To: <df51b63add2830d91b527db64fba6ffdb7765f5d.1666193782.git.daniel@makrotopia.org>
References: <df51b63add2830d91b527db64fba6ffdb7765f5d.1666193782.git.daniel@makrotopia.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_192437_879571_430D7B47 
X-CRM114-Status: GOOD (  27.28  )
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

Hi Daniel,

The only difference between V2 and V4 tphy drivers is that V4 provides
2 channel efuse loading support.

MT7981 and MT7986 SoC support the 'autoload' feature to automatically
load PCIE 2nd lane efuse values into hardware, and this feature is
enabled on all MT7986 chips on the production line.

So I think we can directly use tphy V2 driver instead of tphy V4 for
MT7986 and MT7981 SoCs.


Best Regards,
Sam Shih


On Wed, 2022-10-19 at 16:37 +0100, Daniel Golle wrote:
> From: Zhanyong Wang <zhanyong.wang@mediatek.com>
> 
> Add PCIe 2 lane efuse support in tphy driver.
> 
> Signed-off-by: Jie Yang <jieyy.yang@mediatek.com>
> Signed-off-by: Zhanyong Wang <zhanyong.wang@mediatek.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  drivers/phy/mediatek/phy-mtk-tphy.c | 112
> ++++++++++++++++++++++++++++
>  1 file changed, 112 insertions(+)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c
> b/drivers/phy/mediatek/phy-mtk-tphy.c
> index e906a82791bdaa..b0c9834efec7ef 100644
> --- a/drivers/phy/mediatek/phy-mtk-tphy.c
> +++ b/drivers/phy/mediatek/phy-mtk-tphy.c
> @@ -43,6 +43,15 @@
>  #define SSUSB_SIFSLV_V2_U3PHYD		0x200
>  #define SSUSB_SIFSLV_V2_U3PHYA		0x400
>  
> +/* version V4 sub-banks offset base address */
> +/* pcie phy banks */
> +#define SSUSB_SIFSLV_V4_SPLLC		0x000
> +#define SSUSB_SIFSLV_V4_CHIP		0x100
> +#define SSUSB_SIFSLV_V4_U3PHYD		0x900
> +#define SSUSB_SIFSLV_V4_U3PHYA		0xb00
> +
> +#define SSUSB_LN1_OFFSET		0x10000
> +
>  #define U3P_MISC_REG1		0x04
>  #define MR1_EFUSE_AUTO_LOAD_DIS		BIT(6)
>  
> @@ -268,6 +277,7 @@ enum mtk_phy_version {
>  	MTK_PHY_V1 = 1,
>  	MTK_PHY_V2,
>  	MTK_PHY_V3,
> +	MTK_PHY_V4,
>  };
>  
>  struct mtk_phy_pdata {
> @@ -317,6 +327,9 @@ struct mtk_phy_instance {
>  	u32 efuse_intr;
>  	u32 efuse_tx_imp;
>  	u32 efuse_rx_imp;
> +	u32 efuse_intr_ln1;
> +	u32 efuse_tx_imp_ln1;
> +	u32 efuse_rx_imp_ln1;
>  	int eye_src;
>  	int eye_vrt;
>  	int eye_term;
> @@ -760,6 +773,36 @@ static void phy_v2_banks_init(struct mtk_tphy
> *tphy,
>  	}
>  }
>  
> +static void phy_v4_banks_init(struct mtk_tphy *tphy,
> +			      struct mtk_phy_instance *instance)
> +{
> +	struct u2phy_banks *u2_banks = &instance->u2_banks;
> +	struct u3phy_banks *u3_banks = &instance->u3_banks;
> +
> +	switch (instance->type) {
> +	case PHY_TYPE_USB2:
> +		u2_banks->misc = instance->port_base +
> SSUSB_SIFSLV_V2_MISC;
> +		u2_banks->fmreg = instance->port_base +
> SSUSB_SIFSLV_V2_U2FREQ;
> +		u2_banks->com = instance->port_base +
> SSUSB_SIFSLV_V2_U2PHY_COM;
> +		break;
> +	case PHY_TYPE_USB3:
> +		u3_banks->spllc = instance->port_base +
> SSUSB_SIFSLV_V2_SPLLC;
> +		u3_banks->chip = instance->port_base +
> SSUSB_SIFSLV_V2_CHIP;
> +		u3_banks->phyd = instance->port_base +
> SSUSB_SIFSLV_V2_U3PHYD;
> +		u3_banks->phya = instance->port_base +
> SSUSB_SIFSLV_V2_U3PHYA;
> +		break;
> +	case PHY_TYPE_PCIE:
> +		u3_banks->spllc = instance->port_base +
> SSUSB_SIFSLV_V4_SPLLC;
> +		u3_banks->chip = instance->port_base +
> SSUSB_SIFSLV_V4_CHIP;
> +		u3_banks->phyd = instance->port_base +
> SSUSB_SIFSLV_V4_U3PHYD;
> +		u3_banks->phya = instance->port_base +
> SSUSB_SIFSLV_V4_U3PHYA;
> +		break;
> +	default:
> +		dev_err(tphy->dev, "incompatible PHY type\n");
> +		return;
> +	}
> +}
> +
>  static void phy_parse_property(struct mtk_tphy *tphy,
>  				struct mtk_phy_instance *instance)
>  {
> @@ -951,6 +994,40 @@ static int phy_efuse_get(struct mtk_tphy *tphy,
> struct mtk_phy_instance *instanc
>  
>  		dev_dbg(dev, "u3 efuse - intr %x, rx_imp %x, tx_imp
> %x\n",
>  			instance->efuse_intr, instance-
> >efuse_rx_imp,instance->efuse_tx_imp);
> +
> +		if (tphy->pdata->version != MTK_PHY_V4)
> +			break;
> +
> +		ret = nvmem_cell_read_variable_le_u32(dev, "intr_ln1",
> &instance->efuse_intr_ln1);
> +		if (ret) {
> +			dev_err(dev, "fail to get u3 lane1 intr efuse,
> %d\n", ret);
> +			break;
> +		}
> +
> +		ret = nvmem_cell_read_variable_le_u32(dev,
> "rx_imp_ln1", &instance->efuse_rx_imp_ln1);
> +		if (ret) {
> +			dev_err(dev, "fail to get u3 lane1 rx_imp
> efuse, %d\n", ret);
> +			break;
> +		}
> +
> +		ret = nvmem_cell_read_variable_le_u32(dev,
> "tx_imp_ln1", &instance->efuse_tx_imp_ln1);
> +		if (ret) {
> +			dev_err(dev, "fail to get u3 lane1 tx_imp
> efuse, %d\n", ret);
> +			break;
> +		}
> +
> +		/* no efuse, ignore it */
> +		if (!instance->efuse_intr_ln1 &&
> +		    !instance->efuse_rx_imp_ln1 &&
> +		    !instance->efuse_tx_imp_ln1) {
> +			dev_warn(dev, "no u3 lane1 efuse, but dts
> enable it\n");
> +			instance->efuse_sw_en = 0;
> +			break;
> +		}
> +
> +		dev_info(dev, "u3 lane1 efuse - intr %x, rx_imp %x,
> tx_imp %x\n",
> +			 instance->efuse_intr_ln1, instance-
> >efuse_rx_imp_ln1,
> +			 instance->efuse_tx_imp_ln1);
>  		break;
>  	default:
>  		dev_err(dev, "no sw efuse for type %d\n", instance-
> >type);
> @@ -990,6 +1067,31 @@ static void phy_efuse_set(struct
> mtk_phy_instance *instance)
>  
>  		mtk_phy_update_field(u3_banks->phya + U3P_U3_PHYA_REG0,
> P3A_RG_IEXT_INTR,
>  				    instance->efuse_intr);
> +		if (instance->type == PHY_TYPE_USB3 || (
> +		    !instance->efuse_intr_ln1 &&
> +		    !instance->efuse_rx_imp_ln1 &&
> +		    !instance->efuse_tx_imp_ln1))
> +			break;
> +
> +		mtk_phy_set_bits(u3_banks->phyd + SSUSB_LN1_OFFSET +
> U3P_U3_PHYD_RSV,
> +				 P3D_RG_EFUSE_AUTO_LOAD_DIS);
> +
> +		mtk_phy_update_field(u3_banks->phyd + SSUSB_LN1_OFFSET
> + U3P_U3_PHYD_IMPCAL0,
> +				     P3D_RG_TX_IMPEL, instance-
> >efuse_tx_imp_ln1);
> +		mtk_phy_set_bits(u3_banks->phyd + SSUSB_LN1_OFFSET +
> U3P_U3_PHYD_IMPCAL0,
> +				 P3D_RG_FORCE_TX_IMPEL);
> +
> +		mtk_phy_update_field(u3_banks->phyd + SSUSB_LN1_OFFSET
> + U3P_U3_PHYD_IMPCAL1,
> +				     P3D_RG_RX_IMPEL, instance-
> >efuse_rx_imp_ln1);
> +		mtk_phy_set_bits(u3_banks->phyd + SSUSB_LN1_OFFSET +
> U3P_U3_PHYD_IMPCAL1,
> +				 P3D_RG_FORCE_RX_IMPEL);
> +
> +		mtk_phy_update_field(u3_banks->phya + SSUSB_LN1_OFFSET
> + U3P_U3_PHYA_REG0,
> +				     P3A_RG_IEXT_INTR, instance-
> >efuse_intr_ln1);
> +
> +		dev_info(dev, "%s set LN1 efuse, tx_imp %x, rx_imp %x
> intr %x\n",
> +			 __func__, instance->efuse_tx_imp_ln1,
> +			 instance->efuse_rx_imp_ln1, instance-
> >efuse_intr_ln1);
>  		break;
>  	default:
>  		dev_warn(dev, "no sw efuse for type %d\n", instance-
> >type);
> @@ -1129,6 +1231,9 @@ static struct phy *mtk_phy_xlate(struct device
> *dev,
>  	case MTK_PHY_V3:
>  		phy_v2_banks_init(tphy, instance);
>  		break;
> +	case MTK_PHY_V4:
> +		phy_v4_banks_init(tphy, instance);
> +		break;
>  	default:
>  		dev_err(dev, "phy version is not supported\n");
>  		return ERR_PTR(-EINVAL);
> @@ -1169,6 +1274,12 @@ static const struct mtk_phy_pdata
> tphy_v3_pdata = {
>  	.version = MTK_PHY_V3,
>  };
>  
> +static const struct mtk_phy_pdata tphy_v4_pdata = {
> +	.avoid_rx_sen_degradation = false,
> +	.sw_efuse_supported = true,
> +	.version = MTK_PHY_V4,
> +};
> +
>  static const struct mtk_phy_pdata mt8173_pdata = {
>  	.avoid_rx_sen_degradation = true,
>  	.version = MTK_PHY_V1,
> @@ -1188,6 +1299,7 @@ static const struct of_device_id
> mtk_tphy_id_table[] = {
>  	{ .compatible = "mediatek,generic-tphy-v1", .data =
> &tphy_v1_pdata },
>  	{ .compatible = "mediatek,generic-tphy-v2", .data =
> &tphy_v2_pdata },
>  	{ .compatible = "mediatek,generic-tphy-v3", .data =
> &tphy_v3_pdata },
> +	{ .compatible = "mediatek,generic-tphy-v4", .data =
> &tphy_v4_pdata },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, mtk_tphy_id_table);
> -- 
> 2.37.3
> 
> 


