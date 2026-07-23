Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98949C531CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2026 18:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RHtRx7/TrncyXEUejofUChLHf2uO3p9RQph6fNJ/fvk=; b=S/YD8Hfujf0M/Uz+m+EJ6qWY7A
	1MfHRtv0QHr2kMi/kVIzWqVmNpkfNX7tpggUmTX3VxP6XhRl2gbCVDNRYQumBleaHHojG1saao2ZE
	6BTW+2RPyD6E6L7lKTa5RwJvguIm4h3UsfptOHfy40q5xhfAvtcDgC/vGLwy8/BUwxZPY4MAbA4IV
	jUpuBuq9O2i+6HXJciJvU0ovOtq+9cDSK90U0VL3uqKsNQXPaMrCfm9JTbE0mq1gUyExQqsX0NdMn
	ykdBUbedO6iCzxd85hrYLkoiPFm3tSLZmzNSS0mJR5WNUPnPG8i1fmlY46jywEz+a+zUMP5zP4UBb
	zZtJQLZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmyL7-0000000Eu3x-18pW;
	Thu, 23 Jul 2026 18:40:13 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmyL3-0000000Eu2j-2gkH
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Jul 2026 18:40:11 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso413778f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Jul 2026 11:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784832007; x=1785436807; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RHtRx7/TrncyXEUejofUChLHf2uO3p9RQph6fNJ/fvk=;
        b=IbcdojMOOM/I3PeobYzpp6MpxB4lrVdli4zyaW1LwfdaF+43KKwNWE6yUx6ZbZmB2V
         xeCJ64soqH6DlZLX3uggcYUcnaEmGrjLtNaFpP0cvrd+oljZ/mtHWUH10Lz0rDDB1fiL
         G55ZC/wK8CBizRBLaykiMU7Hb0SugDzjSLHKGr9r4sG8Lo8AaDzVRNKqAesxrENW7doc
         1Ck28NuzFYMBuQX2eI4kriBkYeEiKGmbAmOSQsTQP/ydoY6rTSE2Z67D7cgmr7+dDg9b
         rroRo0QOharioZZ9h5rpMSA3WWGahmXxNMaBtmCPcE9ggd6SLwKBR+H0rb/tBuKdpxMX
         68Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784832007; x=1785436807;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RHtRx7/TrncyXEUejofUChLHf2uO3p9RQph6fNJ/fvk=;
        b=Hs/IEDQ8jcALZOAvGaC0JqohovuBJc9M1UHVD4MXycnH+AymWA8TLjhxTHxwH20W1q
         dq58rnS8UJq7qLPsKqvuSV4A+bGdWgEZt5o+W+wD/WGSbSl7kk9snZiitKf5F/YpBlKF
         dP1ZZVOebtbN+njMi9fQ0+vxMVPuXOPyp5D0epLKBAztTOghAEPw0fdittT+nYTiAQ2P
         bc1HHFs1WaZ5jWLHgdERqjz4CSMsOQH/tQqvXukve9kPYAwxuZTc1UDCTnaYjkzl24tE
         PUJuuFp4ncY3AGcIdIDcCE4listEL8ig3FkpoepgVUtst49Jrxf1GKVbzzrc4oPqEH7B
         sLtQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqf016h4rCxSUrJIxSrt/JEpD/eiY7IC9gRdy14yB0b6mYRwL9GpUHHTS423KPZSHuZ7blhcrmQxDJMmBUlvA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyzZiEukhDzP9WBEFMhwuapWF/0NZVyhD5bhwoFG45y+2t75Gi7
	D5QntnwVe+AKc0gc40ki84bgtYjxNeixZ6hsCqY2PuZspqONxxZXVuaP
X-Gm-Gg: AR+sD13ek+uRrdyu24QZwHLgDq4j0BUidMgHF1WcyabIXHxk4+io5W2mEJziTFh0moe
	g9dOO80x+W43nML7OtUhyfsJe9FkmX3Eu7TgPVWfsmY0F5lUia9rvaHi4SB+MIaDHfZw6PouGrC
	Rvt/1yF3c/GZXugWegYB6aiLUgNzMm4DzSqansbzgaVAvVXdbN+8i453qNcXRoHiWPfpfgiXooX
	8PUc/kifECEqtuovTqWYFvs6Ji34VlCjY7aTh7wXKwU2JJ+5xC7GNiZYVH75/POLLHmg3FeT7rk
	g0Pl8Ql4UAFpCbIvF0rufPe8jITrPi0LVx1ITWVbeNYni8hgSQtPFLo/2BP5ndURU1x2BzThnzz
	1e1udV5CXVBe4moAnoObOvqdbvbd/x/3uzuU5MqXlENf2vloAiCKa58vct+90+MBsyLXSWtPmDB
	x4QBabjeOZJHkXXUDmE9ge/hPIOAxYiV3nZAStaiadwvlqKbY=
X-Received: by 2002:a05:6000:712:b0:47f:87f5:ed32 with SMTP id ffacd0b85a97d-47f8d75f5f3mr5808844f8f.46.1784832007156;
        Thu, 23 Jul 2026 11:40:07 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-3-249-180.retail.telecomitalia.it. [87.3.249.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6f076sm18340282f8f.34.2026.07.23.11.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:40:06 -0700 (PDT)
Message-ID: <6a626006.4d70c427.b2b96.c939@mx.google.com>
X-Google-Original-Message-ID: <amJgA6tsUqTinTkZ@Ansuel-XPS.>
Date: Thu, 23 Jul 2026 20:40:03 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 4/4] PCI: mediatek-gen3: Add 2-lanes mode support for
 Airoha AN7581
References: <20260714115848.8537-5-ansuelsmth@gmail.com>
 <20260722174010.GA746214@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722174010.GA746214@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_114009_747998_47EC2C01 
X-CRM114-Status: GOOD (  46.98  )
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

On Wed, Jul 22, 2026 at 12:40:10PM -0500, Bjorn Helgaas wrote:
> On Tue, Jul 14, 2026 at 01:58:46PM +0200, Christian Marangi wrote:
> > The Airoha AN7581 SoC supports configuring the first PCIe0 lane to 2-lanes
> > mode (2x link) by bonding it with the second PCIe lane (PCIe1). This is
> > done by configuring the PCIe MUX in the SCU register.
> 
> s/2x/x2/ to match usual convention, e.g., PCIe r7.0 sec 1.2
> 
> I mentioned this before at
> https://lore.kernel.org/all/20260626162508.GA27685@bhelgaas
> 
> > To correctly configure PCIe0 in 2x link, define in DT the following
> > additional property:
> 
> s/property/properties/
> 
> Add a blank line here and indent the following list a couple spaces:
> 
> > - additional reg, 'sec-pcie-mac' for the secondary PCIe.
> > - PERSTOUT reset for both main and secondary PCIE0, called 'perstout' and
> >   'sec-perstout'
> > - airoha,scu property to correctly configure the SCU register for the PCIe
> >   MUX
> > - 'num-lanes' set to '2' to enable PCIe0 in 2x link
> 
> Add '' around 'airoha,scu' to match the others
> s/2x/x2/
> 
> > In such configuration the EQ preset are configured to the same values.
> > 
> > To permit correct configuration of the PCIe line, additional logic is added
> > to assert and deassert the PERSTOUT resets.
> 
> s/line/link/
> 
> In the PCIe context, "line" doesn't mean anything.
> 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/pci/controller/pcie-mediatek-gen3.c | 106 ++++++++++++++++----
> >  1 file changed, 89 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> > index b0accd828589..764974045340 100644
> > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > @@ -32,6 +32,11 @@
> >  
> >  #include "../pci.h"
> >  
> > +/* AN7581 SCU register */
> > +#define SCU_PCIC			0x88
> > +#define SCU_PCIC_PCIE_CTRL		GENMASK(7, 0)
> > +
> > +/* PCIe register */
> >  #define PCIE_BASE_CFG_REG		0x14
> >  #define PCIE_BASE_CFG_SPEED		GENMASK(15, 8)
> >  
> > @@ -131,6 +136,7 @@
> >  #define PCIE_ATR_TLP_TYPE_IO		PCIE_ATR_TLP_TYPE(2)
> >  
> >  #define MAX_NUM_PHY_RESETS		3
> > +#define MAX_NUM_PERSTOUT_RESETS		2
> >  
> >  #define PCIE_MTK_RESET_TIME_US		10
> >  
> > @@ -203,9 +209,11 @@ struct mtk_msi_set {
> >  struct mtk_gen3_pcie {
> >  	struct device *dev;
> >  	void __iomem *base;
> > +	void __iomem *sec_base;
> >  	phys_addr_t reg_base;
> >  	struct reset_control *mac_reset;
> >  	struct reset_control_bulk_data phy_resets[MAX_NUM_PHY_RESETS];
> > +	struct reset_control_bulk_data perstout_resets[MAX_NUM_PERSTOUT_RESETS];
> >  	struct phy *phy;
> >  	struct clk_bulk_data *clks;
> >  	int num_clks;
> > @@ -928,6 +936,14 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
> >  	if (ret)
> >  		return dev_err_probe(dev, ret, "failed to get PHY bulk reset\n");
> >  
> > +	pcie->perstout_resets[0].id = "perstout";
> > +	pcie->perstout_resets[1].id = "sec-perstout";
> > +
> > +	ret = devm_reset_control_bulk_get_optional_exclusive(dev, MAX_NUM_PERSTOUT_RESETS,
> > +							     pcie->perstout_resets);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to get PERSTOUT bulk reset\n");
> > +
> >  	pcie->mac_reset = devm_reset_control_get_optional_exclusive(dev, "mac");
> >  	if (IS_ERR(pcie->mac_reset))
> >  		return dev_err_probe(dev, PTR_ERR(pcie->mac_reset), "failed to get MAC reset\n");
> > @@ -949,18 +965,38 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
> >  			pcie->num_lanes = num_lanes;
> >  	}
> >  
> > +	/* Map secondary PCIe for 2-lanes mode for EN7581 */
> > +	if (pcie->num_lanes == 2 && device_is_compatible(dev, "airoha,en7581-pcie")) {
> > +		regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sec-pcie-mac");
> > +		if (!regs)
> > +			return -EINVAL;
> > +		pcie->sec_base = devm_ioremap_resource(dev, regs);
> > +		if (IS_ERR(pcie->sec_base))
> > +			return dev_err_probe(dev, PTR_ERR(pcie->sec_base), "failed to map secondary register base\n");
> > +	}
> > +
> >  	return 0;
> >  }
> >  
> >  static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
> >  {
> >  	struct pci_host_bridge *host = pci_host_bridge_from_priv(pcie);
> > +	unsigned int num_lanes = max(1, pcie->num_lanes);
> > +	struct regmap *pbus_regmap, *scu;
> >  	struct device *dev = pcie->dev;
> >  	struct resource_entry *entry;
> > -	struct regmap *pbus_regmap;
> >  	u32 val, args[2], size;
> >  	resource_size_t addr;
> > -	int err;
> > +	int i, err;
> > +
> > +	if (num_lanes > 2)
> > +		return dev_err_probe(dev, -EINVAL, "unsupported num-lanes, maximum 2 lanes supported\n");
> > +
> > +	if (num_lanes == 2) {
> > +		scu = syscon_regmap_lookup_by_phandle(dev->of_node, "airoha,scu");
> > +		if (IS_ERR(scu))
> > +			return dev_err_probe(dev, PTR_ERR(scu), "failed to map SCU regmap\n");
> > +	}
> >  
> >  	/*
> >  	 * The controller may have been left out of reset by the bootloader
> > @@ -992,6 +1028,19 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
> >  	size = lower_32_bits(resource_size(entry->res));
> >  	regmap_write(pbus_regmap, args[1], GENMASK(31, __fls(size)));
> >  
> > +	/* Assert PERSTOUT for all relevant lines */
> 
> s/lines/lanes/ (also several more places below)
> 
> > +	err = reset_control_bulk_assert(MAX_NUM_PERSTOUT_RESETS,
> > +					pcie->perstout_resets);
> > +	if (err) {
> > +		dev_err(dev, "failed to assert PERSTOUTs\n");
> > +		return err;
> > +	}
> > +
> > +	/* Configure SCU MUX to disable PCIE1 for 2 lines mode */
> > +	if (num_lanes == 2)
> > +		regmap_update_bits(scu, SCU_PCIC, SCU_PCIC_PCIE_CTRL,
> > +				   FIELD_PREP(SCU_PCIC_PCIE_CTRL, BIT(1)));
> > +
> >  	/*
> >  	 * Unlike the other MediaTek Gen3 controllers, the Airoha EN7581
> >  	 * requires PHY initialization and power-on before PHY reset deassert.
> > @@ -1024,18 +1073,6 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
> >  	pm_runtime_enable(dev);
> >  	pm_runtime_get_sync(dev);
> >  
> > -	val = FIELD_PREP(PCIE_VAL_LN0_DOWNSTREAM, 0x47) |
> > -	      FIELD_PREP(PCIE_VAL_LN1_DOWNSTREAM, 0x47) |
> > -	      FIELD_PREP(PCIE_VAL_LN0_UPSTREAM, 0x41) |
> > -	      FIELD_PREP(PCIE_VAL_LN1_UPSTREAM, 0x41);
> > -	writel_relaxed(val, pcie->base + PCIE_EQ_PRESET_01_REG);
> > -
> > -	val = PCIE_K_PHYPARAM_QUERY | PCIE_K_QUERY_TIMEOUT |
> > -	      FIELD_PREP(PCIE_K_PRESET_TO_USE_16G, 0x80) |
> > -	      FIELD_PREP(PCIE_K_PRESET_TO_USE, 0x2) |
> > -	      FIELD_PREP(PCIE_K_FINETUNE_MAX, 0xf);
> > -	writel_relaxed(val, pcie->base + PCIE_PIPE4_PIE8_REG);
> > -
> >  	err = clk_bulk_prepare_enable(pcie->num_clks, pcie->clks);
> >  	if (err) {
> >  		dev_err(dev, "failed to prepare clock\n");
> > @@ -1043,14 +1080,47 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
> >  	}
> >  
> >  	/*
> > -	 * Airoha EN7581 performs PCIe reset via clk callbacks since it has a
> > -	 * hw issue with PCIE_PE_RSTB signal. Add wait for the time needed to
> > -	 * complete the PCIe reset.
> > +	 * Old Airoha EN7581 clock driver performed PCIe reset via
> > +	 * clk callbacks since it has a hw issue with PCIE_PE_RSTB signal.
> > +	 * This is now handled by dedicated PERSTOUT resets with clk
> > +	 * driver only enabling the refclk.
> 
> This reference to the "old Airoha EN7581 clock driver" makes me think
> there's a dependency between a EN7581 clock driver change and this
> PERSTOUT change.  If so, please mention the commit SHA1 for the EN7581
> clock driver change so they're connected and people backporting to
> older kernels know to be careful to get both of them.
> 
> It sounds like this PERSTOUT change might be independent of the x2
> configuration support.  If so, it should be done in a separate patch.
>

Hi,

thanks for the review. The clock change can go on a separate patch but
since the hash will change when it will get merged what should I use as
reference? Also any hint on the tag to use or the format?

Or just describe this in the commit description following the usual
hash + commit title format?
 
> > +	 * Wait is still needed for refclk to stabilize
> >  	 */
> >  	msleep(PCIE_T_PVPERL_MS);
> >  
> > +	/* Configure all the lines to the same EQ config */
> > +	for (i = 0; i < num_lanes; i++) {
> > +		void __iomem *base = pcie->base;
> > +
> > +		if (i == 1)
> > +			base = pcie->sec_base;
> > +
> > +		val = FIELD_PREP(PCIE_VAL_LN0_DOWNSTREAM, 0x47) |
> > +			FIELD_PREP(PCIE_VAL_LN1_DOWNSTREAM, 0x47) |
> > +			FIELD_PREP(PCIE_VAL_LN0_UPSTREAM, 0x41) |
> > +			FIELD_PREP(PCIE_VAL_LN1_UPSTREAM, 0x41);
> > +		writel_relaxed(val, base + PCIE_EQ_PRESET_01_REG);
> > +
> > +		val = PCIE_K_PHYPARAM_QUERY | PCIE_K_QUERY_TIMEOUT |
> > +			FIELD_PREP(PCIE_K_PRESET_TO_USE_16G, 0x80) |
> > +			FIELD_PREP(PCIE_K_PRESET_TO_USE, 0x2) |
> > +			FIELD_PREP(PCIE_K_FINETUNE_MAX, 0xf);
> > +		writel_relaxed(val, base + PCIE_PIPE4_PIE8_REG);
> > +	}
> > +
> > +	/* Deassert PERSTOUT for all relevant lines */
> > +	err = reset_control_bulk_deassert(MAX_NUM_PERSTOUT_RESETS,
> > +					  pcie->perstout_resets);
> > +	if (err) {
> > +		dev_err(dev, "failed to deassert PERSTOUTs\n");
> > +		goto err_perstout_deassert;
> > +	}
> > +
> >  	return 0;
> >  
> > +err_perstout_deassert:
> > +	clk_bulk_disable_unprepare(pcie->num_clks, pcie->clks);
> >  err_clk_prepare_enable:
> >  	pm_runtime_put_sync(dev);
> >  	pm_runtime_disable(dev);
> > @@ -1136,6 +1206,8 @@ static void mtk_pcie_power_down(struct mtk_gen3_pcie *pcie)
> >  
> >  	phy_power_off(pcie->phy);
> >  	phy_exit(pcie->phy);
> > +	reset_control_bulk_assert(MAX_NUM_PERSTOUT_RESETS,
> > +				  pcie->perstout_resets);
> >  	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
> >  				  pcie->phy_resets);
> >  }
> > -- 
> > 2.53.0
> > 

-- 
	Ansuel

