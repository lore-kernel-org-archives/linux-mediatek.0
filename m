Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57453C63793
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 08:59:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EF6A6127C
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 08:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EF6A6127C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KOW44lIDS8mxnLGh0NhikQAzCTpatR7Ckb7naTbGKGU=; b=F9Vi5EuNbBVTs0
	OIVSESxqlF0u7275sCD5Cu9X704eKazrZU8rWyFlYez6KSPD/SxgnTyjRQ8tzBxgctvDbE5WbyiU0
	iomfmeC+6CNXfKnz1BTpvv6wSmrqryFE6B/iV4RTuCJBVhkamd3GK1miZDmAI7OGUIssgBU3GGbJT
	vsjiOQaxYWaOOD6MhBVB5QaxRuc8c9Jmw+n7SIUBcZXtq8t6yNTN6HooSOkpxnIbzWir6KY+PLvxN
	gjwkJxSiVtIbyYK3w8tUH+YPfvwKG8M3P5F3lPTKeouAQJfSpwrcYiKRh6hB/v75c/xjL97/ov8+n
	LHC8rD9jEmQYM4Ll9sKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6UXc-000mSI-Kz; Thu, 22 Jul 2021 08:58:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6UXO-000mOa-AI; Thu, 22 Jul 2021 08:58:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BADE76138C;
 Thu, 22 Jul 2021 08:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626944317;
 bh=5+Ds4MASIrWRq99HNYMoMBFeXjK14QuDwTvs3AcKaRQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HafYTP8ZiVw5V5Hkj03a5d00l6UZsBR8huXdlff2hbxNqNk29wjIL/YTjf3xiM1SJ
 PfzbZhi9vrxFqH0puM8PbnH/Xt5FZxACyBXPaketVObl2mDlcR0bHW+c3tHthswCC4
 8RxHOJU3ZME5XKnZ4r0v8iZBDAXYyML5md/eElDnN3jg+Z1Kjmn7wAZBsIp51wXLsG
 IMMXeU/tEUL+vA9PAhZMfda1SFYKDBdG8S9zAwBstCLKCEVHtJO72dXkHz4x+d4VME
 L0Ovff6IbIUDQWo0wcwToFzPCShQ85AwWaidGjGhqne2NAGbUwYCaLwRLUu1IufnFx
 aIf7Ckeq/jvog==
Date: Thu, 22 Jul 2021 14:28:33 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eddie Hung <eddie.hung@mediatek.com>
Subject: Re: [PATCH v3 3/3] phy: phy-mtk-tphy: add support mt8195
Message-ID: <YPkzOWY0G4MFk7Nu@matsya>
References: <1626331702-27825-1-git-send-email-chunfeng.yun@mediatek.com>
 <1626331702-27825-3-git-send-email-chunfeng.yun@mediatek.com>
 <YPaIYI70823rK68w@matsya> <1626837468.4247.3.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1626837468.4247.3.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_015838_436451_6926AECF 
X-CRM114-Status: GOOD (  24.65  )
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

On 21-07-21, 11:17, Chunfeng Yun wrote:
> On Tue, 2021-07-20 at 13:55 +0530, Vinod Koul wrote:
> > On 15-07-21, 14:48, Chunfeng Yun wrote:
> > > The controller is designed to use use PLL integer mode, but
> > > in fact used fractional mode for some ones on mt8195, this
> > > causes signal degradation (e.g. eye diagram test fail), fix
> > > it by switching PLL to 26Mhz from default 48Mhz to improve
> > > signal quality.
> > > 
> > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > ---
> > > v2~3: no changes
> > > ---
> > >  drivers/phy/mediatek/phy-mtk-tphy.c | 52 +++++++++++++++++++++++++++++
> > >  1 file changed, 52 insertions(+)
> > > 
> > > diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
> > > index 42a1174da6cc..c3dc1763a7eb 100644
> > > --- a/drivers/phy/mediatek/phy-mtk-tphy.c
> > > +++ b/drivers/phy/mediatek/phy-mtk-tphy.c
> > > @@ -41,6 +41,8 @@
> > >  
> > >  #define U3P_USBPHYACR0		0x000
> > >  #define PA0_RG_U2PLL_FORCE_ON		BIT(15)
> > > +#define PA0_USB20_PLL_PREDIV		GENMASK(7, 6)
> > > +#define PA0_USB20_PLL_PREDIV_VAL(x)	((0x3 & (x)) << 6)
> > >  #define PA0_RG_USB20_INTR_EN		BIT(5)
> > >  
> > >  #define U3P_USBPHYACR1		0x004
> > > @@ -52,6 +54,8 @@
> > >  #define PA1_RG_TERM_SEL_VAL(x)	((0x7 & (x)) << 8)
> > >  
> > >  #define U3P_USBPHYACR2		0x008
> > > +#define PA2_RG_U2PLL_BW			GENMASK(21, 19)
> > > +#define PA2_RG_U2PLL_BW_VAL(x)		((0x7 & (x)) << 19)
> > >  #define PA2_RG_SIF_U2PLL_FORCE_EN	BIT(18)
> > >  
> > >  #define U3P_USBPHYACR5		0x014
> > > @@ -73,6 +77,14 @@
> > >  #define P2C_USB20_GPIO_MODE		BIT(8)
> > >  #define P2C_U2_GPIO_CTR_MSK	(P2C_RG_USB20_GPIO_CTL | P2C_USB20_GPIO_MODE)
> > >  
> > > +#define U3P_U2PHYA_RESV		0x030
> > > +#define P2R_RG_U2PLL_FBDIV_26M		0x1bb13b
> > > +#define P2R_RG_U2PLL_FBDIV_48M		0x3c0000
> > > +
> > > +#define U3P_U2PHYA_RESV1	0x044
> > > +#define P2R_RG_U2PLL_REFCLK_SEL	BIT(5)
> > > +#define P2R_RG_U2PLL_FRA_EN		BIT(3)
> > > +
> > >  #define U3D_U2PHYDCR0		0x060
> > >  #define P2C_RG_SIF_U2PLL_FORCE_ON	BIT(24)
> > >  
> > > @@ -277,6 +289,12 @@ enum mtk_phy_version {
> > >  struct mtk_phy_pdata {
> > >  	/* avoid RX sensitivity level degradation only for mt8173 */
> > >  	bool avoid_rx_sen_degradation;
> > > +	/*
> > > +	 * u2phy should use integer mode instead of fractional mode of
> > > +	 * 48M PLL, fix it by switching PLL to 26M from default 48M
> > > +	 * for mt8195
> > > +	 */
> > > +	bool sw_pll_48m_to_26m;
> > >  	enum mtk_phy_version version;
> > >  };
> > >  
> > > @@ -456,6 +474,33 @@ static void u3_phy_instance_init(struct mtk_tphy *tphy,
> > >  	dev_dbg(tphy->dev, "%s(%d)\n", __func__, instance->index);
> > >  }
> > >  
> > > +static void u2_phy_pll_26m_set(struct mtk_tphy *tphy,
> > > +	struct mtk_phy_instance *instance)
> > > +{
> > > +	struct u2phy_banks *u2_banks = &instance->u2_banks;
> > > +	void __iomem *com = u2_banks->com;
> > > +	u32 tmp;
> > > +
> > > +	if (!tphy->pdata->sw_pll_48m_to_26m)
> > > +		return;
> > > +
> > > +	tmp = readl(com + U3P_USBPHYACR0);
> > > +	tmp &= ~PA0_USB20_PLL_PREDIV;
> > > +	tmp |= PA0_USB20_PLL_PREDIV_VAL(0);
> > > +	writel(tmp, com + U3P_USBPHYACR0);
> > > +
> > > +	tmp = readl(com + U3P_USBPHYACR2);
> > > +	tmp &= ~PA2_RG_U2PLL_BW;
> > > +	tmp |= PA2_RG_U2PLL_BW_VAL(3);
> > > +	writel(tmp, com + U3P_USBPHYACR2);
> > > +
> > > +	writel(P2R_RG_U2PLL_FBDIV_26M, com + U3P_U2PHYA_RESV);
> > > +
> > > +	tmp = readl(com + U3P_U2PHYA_RESV1);
> > > +	tmp |= P2R_RG_U2PLL_FRA_EN | P2R_RG_U2PLL_REFCLK_SEL;
> > > +	writel(tmp, com + U3P_U2PHYA_RESV1);
> > > +}
> > > +
> > >  static void u2_phy_instance_init(struct mtk_tphy *tphy,
> > >  	struct mtk_phy_instance *instance)
> > >  {
> > > @@ -941,6 +986,7 @@ static int mtk_phy_init(struct phy *phy)
> > >  
> > >  	switch (instance->type) {
> > >  	case PHY_TYPE_USB2:
> > > +		u2_phy_pll_26m_set(tphy, instance);
> > 
> > should this not be set only for MTK_PHY_V3?
> Workaround only for mt8195, HW will fix it for others (V3)

Pls document that in comments here

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
