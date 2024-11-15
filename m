Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A4FD6DDF3
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Nov 2024 12:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9d3SL9vH2e3pgLXSrAw/DmX0mWevotMaQ8nhbnV7C+c=; b=b9wlj3A6Fmq3n02XzqPU0NF3O2
	TzyYQfBcNghSClajc87P0LcXvDPvh7alB24CiqSMoZ8DTZ+KaN+dYHtx1mbWbt+M/dQYNk3HaQxCB
	kzlO6R1jsYvmtyEGpqsUAD9QiuPhnU4cP4HXEVHaC21FQCXwVdIQHNCxDTMBX5oKs1aaExpWXALY0
	0Ud15O7dsiDNFcIeGsW/3QmESe8AWqi/Xc97OHOd0ToLvN+plp+S6oVpbGRFxYbDjbC/o6QKkCj6n
	FxV2yQKOSBob8K45h0ioSjoTIhMmzPTj5zUxtrdR3WzqnjQ/xj2HzVfMz5Zi7IVH5ln7APc/8ajVC
	bEhQRmHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBvaZ-00000002g4V-3gqN;
	Fri, 15 Nov 2024 12:38:15 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBvZd-00000002fsv-1toq
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Nov 2024 12:37:18 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2ea1267707eso933022a91.2
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Nov 2024 04:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731674236; x=1732279036; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9d3SL9vH2e3pgLXSrAw/DmX0mWevotMaQ8nhbnV7C+c=;
        b=C6QLjUvAGIExue7fEF63bd4Nz7AHcLdZ/wT+43IgbXxge1N+f1CDStfo2Si5MIHekK
         hpv6CoI0n0LvZap7atuEHzTH+XBGgCa0NCG6HH6jC81GDSwUWW2vldZslp91K1E5qBBk
         hgk1ldskCc16oz5+Rebg4Nu0hvrKSLV/00WbNPGyQh+MQ1J/FbYxcKurTlAWwiezfzIG
         of9H5lUFM++sWMzPoE1cEbPvVSy+oQU26J9TDUvSH4cGyUg/V2K1AeR+oy2ezY9DSRFO
         mXwgzKl5+E4nTsE9TFJhueXz87Ov3qB4YXKX1u/4hNIJ1mKI3Y1I+QUYcH+62xRu4oFU
         k5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731674236; x=1732279036;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9d3SL9vH2e3pgLXSrAw/DmX0mWevotMaQ8nhbnV7C+c=;
        b=E5ImuAvPcdp9QHBQhRuXh9RkORUnczy2Om94f31Fv6M0Arm+vnb/Qp7TOE5I1qFLkC
         KPbYmobihqYIFeE81i5o3aRC6tTvWhSQJFTFoy9qZUS8/rx6kUIo+/7bULgSS4oVWdQA
         qRfMLQHQ1b6DRQLk6+kMR6AfOVROnkKCrq9UwNkCBrlRqfl2jqB6WIG7H0tgmWHaEWtX
         9R3Y8Kv2N2S2NiNJQ2+ZtwYpFTYZqJXP6S6cbmTd2VdCirYgSaPWvWehoz6n1ll4RDgN
         7ySZkzyotXIo7RL3drubAqLkI/qESpLw1JdB/OSO25N9NognY8v2paHtxFNTfNjz86Se
         YoGA==
X-Forwarded-Encrypted: i=1; AJvYcCV5ZJ5ZcX+yGqME9UxWpobFUmmPgjhpaXNTQcwnB4MBwN1LZ/+jKdks7Lhaz2H1wBQN/C+W9XmwMH2aiTciaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvPxYhnGoyAAXFsWbV6gFdq1FZDbgL5Q/goyFn9HtzlEosua+z
	RkBBWOSJd7WLZqVveo4CjCriXwMmuX8HphSAe4t3eaIfqIbEkUveHfAXU3sObg==
X-Google-Smtp-Source: AGHT+IFQSkHpmOGv/LSYibpTXHi0sXyBiyJoTKFZ11di0ptf1fGsM/SheI+/mVrvRrtADmFkp80Y8g==
X-Received: by 2002:a17:90b:17c2:b0:2d8:8430:8a91 with SMTP id 98e67ed59e1d1-2ea154f5ee9mr3269168a91.10.1731674236386;
        Fri, 15 Nov 2024 04:37:16 -0800 (PST)
Received: from thinkpad ([117.193.215.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea06f9c51esm2703383a91.39.2024.11.15.04.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 04:37:15 -0800 (PST)
Date: Fri, 15 Nov 2024 18:07:07 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/4] PCI: mediatek-gen3: Move reset/assert callbacks
 in .power_up()
Message-ID: <20241115123707.in4x27ub4wtwdggh@thinkpad>
References: <20241109-pcie-en7581-fixes-v2-0-0ea3a4af994f@kernel.org>
 <20241109-pcie-en7581-fixes-v2-3-0ea3a4af994f@kernel.org>
 <20241115090231.nwmxl6acspxqflpc@thinkpad>
 <ZzcRG3OInXZ2TP-Z@lore-rh-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZzcRG3OInXZ2TP-Z@lore-rh-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_043717_515559_672F8E4F 
X-CRM114-Status: GOOD (  30.37  )
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

On Fri, Nov 15, 2024 at 10:15:07AM +0100, Lorenzo Bianconi wrote:
> > On Sat, Nov 09, 2024 at 10:28:39AM +0100, Lorenzo Bianconi wrote:
> > > In order to make the code more readable, move phy and mac reset lines
> > > assert/de-assert configuration in .power_up() callback
> > > (mtk_pcie_en7581_power_up()/mtk_pcie_power_up()).
> > > 
> > 
> > I don't understand how moving the code (duplicting it also) makes the code more
> > readable. Could you please explain?
> 
> Hi Manivannan,
> 
> this has been requested by Bjorn in
> https://patchwork.kernel.org/project/linux-pci/patch/aca00bd672ee576ad96d279414fc0835ff31f637.1720022580.git.lorenzo@kernel.org/#26110282
> 

Ok. The description needs to state the reason i.e., the
reset_control_bulk_assert() is moved to make it pair with
reset_control_bulk_deassert() in mtk_pcie_setup() and
mtk_pcie_en7581_power_up().

Btw, could you explain why reset_control_bulk_deassert() is present in
mtk_pcie_setup()?

- Mani

> > 
> > > Introduce PCIE_MTK_RESET_TIME_US macro for the time needed to
> > > complete PCIe reset on MediaTek controller.
> > > 
> > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > ---
> > >  drivers/pci/controller/pcie-mediatek-gen3.c | 28 ++++++++++++++++++++--------
> > >  1 file changed, 20 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> > > index 8c8c733a145634cdbfefd339f4a692f25a6e24de..1ad93d2407810ba873d9a16da96208b3cc0c3011 100644
> > > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > > @@ -120,6 +120,9 @@
> > >  
> > >  #define MAX_NUM_PHY_RESETS		3
> > >  
> > > +/* Time in us needed to complete PCIe reset on MediaTek controller */
> > 
> > No need of this comment. Macro name itself is explanatory.
> 
> ack, I will fix it.
> 
> Regards,
> Lorenzo
> 
> > 
> > - Mani
> > 
> > > +#define PCIE_MTK_RESET_TIME_US		10
> > > +
> > >  /* Time in ms needed to complete PCIe reset on EN7581 SoC */
> > >  #define PCIE_EN7581_RESET_TIME_MS	100
> > >  
> > > @@ -867,6 +870,14 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
> > >  	int err;
> > >  	u32 val;
> > >  
> > > +	/*
> > > +	 * The controller may have been left out of reset by the bootloader
> > > +	 * so make sure that we get a clean start by asserting resets here.
> > > +	 */
> > > +	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
> > > +				  pcie->phy_resets);
> > > +	reset_control_assert(pcie->mac_reset);
> > > +
> > >  	/*
> > >  	 * Wait for the time needed to complete the bulk assert in
> > >  	 * mtk_pcie_setup for EN7581 SoC.
> > > @@ -941,6 +952,15 @@ static int mtk_pcie_power_up(struct mtk_gen3_pcie *pcie)
> > >  	struct device *dev = pcie->dev;
> > >  	int err;
> > >  
> > > +	/*
> > > +	 * The controller may have been left out of reset by the bootloader
> > > +	 * so make sure that we get a clean start by asserting resets here.
> > > +	 */
> > > +	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
> > > +				  pcie->phy_resets);
> > > +	reset_control_assert(pcie->mac_reset);
> > > +	usleep_range(PCIE_MTK_RESET_TIME_US, 2 * PCIE_MTK_RESET_TIME_US);
> > > +
> > >  	/* PHY power on and enable pipe clock */
> > >  	err = reset_control_bulk_deassert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
> > >  	if (err) {
> > > @@ -1013,14 +1033,6 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
> > >  	 * counter since the bulk is shared.
> > >  	 */
> > >  	reset_control_bulk_deassert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
> > > -	/*
> > > -	 * The controller may have been left out of reset by the bootloader
> > > -	 * so make sure that we get a clean start by asserting resets here.
> > > -	 */
> > > -	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
> > > -
> > > -	reset_control_assert(pcie->mac_reset);
> > > -	usleep_range(10, 20);
> > >  
> > >  	/* Don't touch the hardware registers before power up */
> > >  	err = pcie->soc->power_up(pcie);
> > > 
> > > -- 
> > > 2.47.0
> > > 
> > 
> > -- 
> > மணிவண்ணன் சதாசிவம்



-- 
மணிவண்ணன் சதாசிவம்

