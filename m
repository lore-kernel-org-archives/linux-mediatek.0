Return-Path: <SRS0=pZ6D=MU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B18DBC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 01:56:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CCA460E9B
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 01:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CCA460E9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H2hoknHDFhb3XxsLW175uHWwu9y20bXoUL0pv7VfVNg=; b=QSzV7e30cgKzlU
	GiDSG+f0M3bGgB9am/pzMmVXkkxMdnZupnng8ptouu9VrqkhIQuyoDFkpRQnFb1m2cmj+h0+qmNPa
	hu8ZEQoCTby6/+CFs9J5JlzEHmV6iWixU86oRuUPKqsNm1azil3cTdAxI2IMVe50PBed3Bz4FUslr
	o+92QWic/1/5W7b34loeMmIX+LtnpwRmeq7kkSUL4si3iNA0I3pTz6B2O/YGnWQIp8G9pOINve/qo
	bCr7PY2muMt2FNYekJit/1oKI0qhkBGHnwU4NItotdLWlBBtdUVgIwWYXuXRKM8C+yJRGNsoHfThC
	EjuFeYSBC7kodRUvNjPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8Ynd-00GpAi-05; Wed, 28 Jul 2021 01:55:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8YnP-00Gp9j-NC; Wed, 28 Jul 2021 01:55:45 +0000
X-UUID: 47ee47c598fe43e1be93c988ed78e80f-20210727
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=58L+Btku+CwzhUYReBlGJltfCSXj2Yn897i2au2OlSc=; 
 b=U3BkHUMIA6xzBNrS69NkBtSsd9K2Vvwn7zUNA76F6quugxZ+TRJNO3tHkWnnYdoL53IWdNTJRIGOZpb7dxPx0o/SK0bR2EEoAia3TZoJVmi41Jl+2hBe8WE+OeYPokh2A0glX0yXwy1Vi2cog2K8cwtP6i5uDdak7jbzX4EZSpU=;
X-UUID: 47ee47c598fe43e1be93c988ed78e80f-20210727
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1856050274; Tue, 27 Jul 2021 18:55:40 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Jul 2021 18:55:17 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs06n2.mediatek.inc
 (172.21.101.130) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 28 Jul 2021 09:55:16 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 28 Jul 2021 09:55:14 +0800
Message-ID: <1627437314.31194.13.camel@mhfsdcap03>
Subject: Re: [PATCH 2/2] phy: mediatek: phy-mtk-tphy: support USB2UART switch
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
CC: <linux-phy@lists.infradead.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ainge Hsu <ainge.hsu@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>, Mediatek WSD Upstream
 <wsd_upstream@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-usb@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Wed, 28 Jul 2021 09:55:14 +0800
In-Reply-To: <1627383013-4535-2-git-send-email-macpaul.lin@mediatek.com>
References: <1627383013-4535-1-git-send-email-macpaul.lin@mediatek.com>
 <1627383013-4535-2-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_185543_813547_E83A438E 
X-CRM114-Status: GOOD (  24.45  )
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

On Tue, 2021-07-27 at 18:50 +0800, Macpaul Lin wrote:
> Some embedded platform shared PINs between USB and UART.
> For example, some phone will use special cable detection in boot loader
> to switch USB port function into UART mode.
> 
> This patch support USB2UART switch function in phy-mtk-tphy.
> 1. Implement USB2UART switch API support in phy-mtk-tphy.
> 2. Use PHY_MODE_UART support according to new mode in phy.h.
> 3. Use mtk_phy_get_mode_ext() to query the current MODE from hardware.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  drivers/phy/mediatek/phy-mtk-tphy.c |  114 +++++++++++++++++++++++++++++++++++
>  1 file changed, 114 insertions(+)
> 
title: please use "phy: phy-mtk-tphy: ..."  as other patches


> diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
> index cdbcc49..a7dfeec 100644
> --- a/drivers/phy/mediatek/phy-mtk-tphy.c
> +++ b/drivers/phy/mediatek/phy-mtk-tphy.c
> @@ -68,6 +68,7 @@
>  #define PA6_RG_U2_SQTH_VAL(x)	(0xf & (x))
>  
>  #define U3P_U2PHYACR4		0x020
> +#define P2C_RG_USB20_DM_100K_EN		BIT(17)
>  #define P2C_RG_USB20_GPIO_CTL		BIT(9)
>  #define P2C_USB20_GPIO_MODE		BIT(8)
>  #define P2C_U2_GPIO_CTR_MSK	(P2C_RG_USB20_GPIO_CTL | P2C_USB20_GPIO_MODE)
> @@ -76,6 +77,12 @@
>  #define P2C_RG_SIF_U2PLL_FORCE_ON	BIT(24)
>  
>  #define U3P_U2PHYDTM0		0x068
> +#define P2C_RG_UART_MODE		GENMASK(31, 30)
> +#define P2C_RG_UART_MODE_VAL(x)		((0x3 & (x)) << 30)
> +#define P2C_RG_UART_MODE_OFET		(30)
> +#define P2C_FORCE_UART_I		BIT(29)
> +#define P2C_FORCE_UART_BIAS_EN		BIT(28)
> +#define P2C_FORCE_UART_TX_OE		BIT(27)
>  #define P2C_FORCE_UART_EN		BIT(26)
>  #define P2C_FORCE_DATAIN		BIT(23)
>  #define P2C_FORCE_DM_PULLDOWN		BIT(21)
> @@ -98,6 +105,8 @@
>  		P2C_RG_DPPULLDOWN | P2C_RG_TERMSEL)
>  
>  #define U3P_U2PHYDTM1		0x06C
> +#define P2C_RG_UART_BIAS_EN		BIT(18)
> +#define P2C_RG_UART_TX_OE		BIT(17)
>  #define P2C_RG_UART_EN			BIT(16)
>  #define P2C_FORCE_IDDIG		BIT(9)
>  #define P2C_RG_VBUSVALID		BIT(5)
> @@ -600,6 +609,90 @@ static void u2_phy_instance_exit(struct mtk_tphy *tphy,
>  	}
>  }
>  
> +static void u2_phy_instance_set_mode_2uart(struct u2phy_banks *u2_banks)
> +{
> +	u32 tmp;
> +
> +	/* Clear PA6_RG_U2_BC11_SW_EN */
remove the comments
> +	tmp = readl(u2_banks->com + U3P_USBPHYACR6);
> +	tmp &= ~(PA6_RG_U2_BC11_SW_EN);
> +	writel(tmp, u2_banks->com + U3P_USBPHYACR6);
> +
> +	/* Set P2C_RG_SUSPENDM */
> +	tmp = readl(u2_banks->com + U3P_U2PHYDTM0);
> +	tmp |= P2C_RG_SUSPENDM;
> +	writel(tmp, u2_banks->com + U3P_U2PHYDTM0);
> +
> +	/* Set P2C_FORCE_SUSPENDM */
> +	tmp = readl(u2_banks->com + U3P_U2PHYDTM0);
> +	tmp |= P2C_FORCE_SUSPENDM;
> +	writel(tmp, u2_banks->com + U3P_U2PHYDTM0);
> +
> +	/* Clear and Set P2C_RG_UART_MODE to 2'b01 */
> +	tmp = readl(u2_banks->com + U3P_U2PHYDTM0);
> +	tmp &= ~(P2C_RG_UART_MODE);
> +	tmp |= P2C_RG_UART_MODE_VAL(0x1);
> +	writel(tmp, u2_banks->com + U3P_U2PHYDTM0);
> +
> +	/* Clear P2C_FORCE_UART_I */
> +	tmp = readl(u2_banks->com + U3P_U2PHYDTM0);
> +	tmp &= ~(P2C_FORCE_UART_I);
> +	writel(tmp, u2_banks->com + U3P_U2PHYDTM0);
> +
> +	/* Set P2C_FORCE_UART_BIAS_EN */
> +	tmp = readl(u2_banks->com + U3P_U2PHYDTM0);
> +	tmp |= P2C_FORCE_UART_BIAS_EN;
> +	writel(tmp, u2_banks->com + U3P_U2PHYDTM0);
> +
> +	/* Set P2C_FORCE_UART_TX_OE */
> +	tmp = readl(u2_banks->com + U3P_U2PHYDTM0);
> +	tmp |= P2C_FORCE_UART_TX_OE;
> +	writel(tmp, u2_banks->com + U3P_U2PHYDTM0);
> +
> +	/* Set P2C_FORCE_UART_EN */
> +	tmp = readl(u2_banks->com + U3P_U2PHYDTM0);
> +	tmp |= P2C_FORCE_UART_EN;
> +	writel(tmp, u2_banks->com + U3P_U2PHYDTM0);
> +
> +	/* Set P2C_RG_UART_BIAS_EN */
> +	tmp = readl(u2_banks->com + U3P_U2PHYDTM0);
> +	tmp |= P2C_RG_UART_BIAS_EN;
> +	writel(tmp, u2_banks->com + U3P_U2PHYDTM0);
> +
> +	/* Set P2C_RG_UART_TX_OE */
> +	tmp = readl(u2_banks->com + U3P_U2PHYDTM0);
> +	tmp |= P2C_RG_UART_TX_OE;
> +	writel(tmp, u2_banks->com + U3P_U2PHYDTM0);
> +
> +	/* Set P2C_RG_UART_EN */
> +	tmp = readl(u2_banks->com + U3P_U2PHYDTM0);
> +	tmp |= P2C_RG_UART_EN;
> +	writel(tmp, u2_banks->com + U3P_U2PHYDTM0);
> +
> +	/* Set P2C_RG_USB20_DM_100K_EN */
> +	tmp = readl(u2_banks->com + U3P_U2PHYACR4);
> +	tmp |= P2C_RG_USB20_DM_100K_EN;
> +	writel(tmp, u2_banks->com + U3P_U2PHYACR4);
> +
> +	/* Clear P2C_RG_DMPULLDOWN, P2C_RG_DPPULLDOWN */
> +	tmp = readl(u2_banks->com + U3P_U2PHYDTM0);
> +	tmp &= ~(P2C_RG_DPPULLDOWN | P2C_RG_DMPULLDOWN);
> +	writel(tmp, u2_banks->com + U3P_U2PHYDTM0);
> +}
> +
> +static int u2_phy_instance_get_mode_ext(struct mtk_tphy *tphy, struct mtk_phy_instance *instance)
> +{
> +	struct u2phy_banks *u2_banks = &instance->u2_banks;
> +	u32 tmp;
> +
> +	tmp = readl(u2_banks->com + U3P_U2PHYDTM0);
> +
> +	if ((tmp & P2C_RG_UART_MODE) >> P2C_RG_UART_MODE_OFET)
> +		return PHY_MODE_UART;
> +	else
> +		return PHY_MODE_USB_OTG;
> +}
> +
>  static void u2_phy_instance_set_mode(struct mtk_tphy *tphy,
>  				     struct mtk_phy_instance *instance,
>  				     enum phy_mode mode)
> @@ -609,6 +702,9 @@ static void u2_phy_instance_set_mode(struct mtk_tphy *tphy,
>  
>  	tmp = readl(u2_banks->com + U3P_U2PHYDTM1);
>  	switch (mode) {
> +	case PHY_MODE_UART:
> +		u2_phy_instance_set_mode_2uart(u2_banks);
How do you use this helper?

Can we switch back to usb phy mode if switching to uart?
When switch to uart mode, if the host supports multi-ports, it will
cause the host can't enter sleep mode anymore.

> +		return;
>  	case PHY_MODE_USB_DEVICE:
>  		tmp |= P2C_FORCE_IDDIG | P2C_RG_IDDIG;
>  		break;
> @@ -933,6 +1029,10 @@ static int mtk_phy_init(struct phy *phy)
>  		return ret;
>  	}
>  
> +	ret = u2_phy_instance_get_mode_ext(tphy, instance);
> +	if (ret == PHY_MODE_UART)
> +		return 0;
> +
>  	switch (instance->type) {
>  	case PHY_TYPE_USB2:
>  		u2_phy_instance_init(tphy, instance);
> @@ -996,6 +1096,19 @@ static int mtk_phy_exit(struct phy *phy)
>  	return 0;
>  }
>  
> +static int mtk_phy_get_mode_ext(struct phy *phy)
> +{
> +	struct mtk_phy_instance *instance = phy_get_drvdata(phy);
> +	struct mtk_tphy *tphy = dev_get_drvdata(phy->dev.parent);
> +	int ret;
> +
> +	ret = 0;
> +	if (instance->type == PHY_TYPE_USB2)
> +		ret = u2_phy_instance_get_mode_ext(tphy, instance);
> +
> +	return ret;
> +}
> +
>  static int mtk_phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
>  {
>  	struct mtk_phy_instance *instance = phy_get_drvdata(phy);
> @@ -1060,6 +1173,7 @@ static struct phy *mtk_phy_xlate(struct device *dev,
>  	.power_on	= mtk_phy_power_on,
>  	.power_off	= mtk_phy_power_off,
>  	.set_mode	= mtk_phy_set_mode,
> +	.get_mode_ext	= mtk_phy_get_mode_ext,
>  	.owner		= THIS_MODULE,
>  };
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
