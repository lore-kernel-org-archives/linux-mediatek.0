Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE1AC47258
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jan 2024 23:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3L0RW4HC32Lx5N8gtFQZihg57fFjleHQGb6GEyv904U=; b=wSkCA+7sZEWizEgYH2GPftkknc
	vYsQmxkvIxzOE4HGjCRl9eoPbV6DfptjWEFFaNWJm3kHDoV+HbVTOW5wi8ZN5pknbTTZvKY6sxV3u
	ZozJOD3VdskdJGOX12cGq3Gc2tepzulXQQpukoA4WyU042nDc9gy4dhX7loRIEehOmcGBZB5PGlgc
	bdzUdx91gcPqaFIlZn6Wdb8gtsLfGguJxPbP7mHdbKccshiewNtlzjVfa9nBy5iIiCZ41AMSGJC6d
	Uht1lDCXAPBog3AmtMkfMZ2PvolCQJw86qvKKWrtzBP8MFBRZOKqhnouq70IxnsjffLxxE7OjVNqI
	XUSCMVcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSQ8s-000oyP-1Y;
	Tue, 23 Jan 2024 23:25:18 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSQ8p-000oxL-2i;
	Tue, 23 Jan 2024 23:25:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=3L0RW4HC32Lx5N8gtFQZihg57fFjleHQGb6GEyv904U=; b=Gr
	D29UDWX/6aQD2sRb7aY/kxmfBVq8gBCbrbzylkaj3+maXmg+39XjQ//bc3h0pQe6NrE5FlbECD2h1
	OFSQjWYIxZyLizyhMAttwp5ZPoa/PTVRkI3vqrWY6BNsDqw8u8oTCBTOTjFU9IPgjFHKVVgf1HL/O
	LnjELfdoswWP1DI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rSQ8h-005t6u-Hh; Wed, 24 Jan 2024 00:25:07 +0100
Date: Wed, 24 Jan 2024 00:25:07 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ziyang Huang <hzyitc@outlook.com>
Cc: mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	richardcochran@gmail.com, p.zabel@pengutronix.de,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/8] phy: Introduce Qualcomm ethernet uniphy driver
Message-ID: <8488a274-148d-42da-9fd3-d56ef1db6061@lunn.ch>
References: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB55568ACB534944D7DEB00C7AC9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB555648886D03AB911224F6FAC9742@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TYZPR01MB555648886D03AB911224F6FAC9742@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_152515_875152_63E09E4F 
X-CRM114-Status: GOOD (  19.53  )
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

On Tue, Jan 23, 2024 at 11:58:26PM +0800, Ziyang Huang wrote:
> 在 2024/1/21 20:42, Ziyang Huang 写道:
> > +#define rmwl(addr, mask, val) \
> > +	writel(((readl(addr) & ~(mask)) | ((val) & (mask))), addr)
> > +
> > +static int cmn_init(struct platform_device *pdev)
> > +{
> > +	struct resource *res;
> > +	void __iomem *cmn_base;
> > +	void __iomem *tcsr_base;
> > +	u32 val;
> > +
> > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cmn");
> > +	if (!res)
> > +		return 0;
> > +
> > +	cmn_base = devm_ioremap_resource(&pdev->dev, res);
> > +	if (IS_ERR_OR_NULL(cmn_base))
> > +		return PTR_ERR(cmn_base);
> > +
> > +	/* For IPQ50xx, tcsr is necessary to enable cmn block */
> > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "tcsr");
> > +	if (res) {
> > +		tcsr_base = devm_ioremap_resource(&pdev->dev, res);
> > +		if (IS_ERR_OR_NULL(tcsr_base))
> > +			return PTR_ERR(tcsr_base);
> > +
> > +		rmwl((tcsr_base + TCSR_ETH_CMN), TCSR_ETH_CMN_ENABLE,
> > +		     TCSR_ETH_CMN_ENABLE);
> > +	}
> > +
> > +	rmwl((cmn_base + CMN_PLL_REFCLK_SRC),
> > +	     CMN_PLL_REFCLK_SRC_FROM_MASK,
> > +	     CMN_PLL_REFCLK_SRC_FROM_REG);
> > +	rmwl((cmn_base + CMN_PLL_REFCLK),
> > +	     (CMN_PLL_REFCLK_EXTERNAL | CMN_PLL_REFCLK_FREQ_MASK
> > +	      | CMN_PLL_REFCLK_DIV_MASK),
> > +	     (CMN_PLL_REFCLK_FREQ_48M | CMN_PLL_REFCLK_DIV(2)));
> > +
> > +	rmwl((cmn_base + CMN_PLL_CTRL), CMN_PLL_CTRL_RST_N, 0);
> > +	msleep(1);
> > +	rmwl((cmn_base + CMN_PLL_CTRL), CMN_PLL_CTRL_RST_N,
> > +	     CMN_PLL_CTRL_RST_N);
> > +	msleep(1);
> > +
> > +	return read_poll_timeout(readl, val,
> > +				 (val & CMN_PLL_STATUS_LOCKED),
> > +				 100, 200000, false,
> > +				 (cmn_base + CMN_PLL_STATUS));
> > +}
> > +
> 
> Hi Andrew,
> 
> Sorry to bother you. But I can't make a decision here.
> 
> The CMN block (Seem like the Abbreviation of "component") controls the
> entire network block. It need to be configured before uniphy, mdio, gmac,
> etc.. In the past, Qualcomm put it in mdio driver. But UNIPHY need to been
> initializated before mdio because some PHYs/switchs use the outclk provided
> by UNIPHY as their main clocks.
> 
> So it seem like that it should be described in a separate node. But I
> couldn't find a suitable driver directory for it. Can you please give me
> some suggestions? Thanks.

Maybe drivers/soc/qcom.

Does it provide any resources to the uniphy, mdio, gmac, etc? Anything
which can be used to link all the bits together?

Looking at CMN_PLL_CTRL_RST_N, could it be considered as a reset
driver? Each of the other drivers have a phandle to it, and use the
reset API to take it out of reset when they probe? That should give
you some ordering guarantees.

    Andrew

