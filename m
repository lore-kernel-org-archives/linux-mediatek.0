Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FB910A88FF
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 18:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWCdWABxg5w2NkMPkfS0kEXFaOncrxR8xyY6bs996+A=; b=stN5z1ydOCi2UaX7QtE1CKv15X
	dSe6djwW38K+w+13hTG1CdxIIY+gkN46AFhIQff9PAanQUSGaF2JsXaISRvgUkY/W9w3UQGG470gl
	Buqx4b0Wjkutr1ulVElVVWrZTedAgHox4huPyhQBPE8ckMcVAfhpRZD/mc3oAE+wq4e0DG2BWMQvQ
	GJ2Kok4DM57ZJ4uudnfIt6RkrMf+ULMvGCBHLpe7fSXppT0QGPkH2+QBycgRbbWBlDei3xyyNPucO
	XD3qFO9YKcDFrcw0or9fMgYd/j0RbdF9ZN/WsLFYAzJGMRx4eBml1FlzcLGQr2O7kt/arASL3P7GC
	KQ21woEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pVn-000000062Wp-0mlQ;
	Thu, 26 Mar 2026 18:32:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pVj-000000062Ve-2aPL;
	Thu, 26 Mar 2026 18:32:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D59C744252;
	Thu, 26 Mar 2026 18:32:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0F5C116C6;
	Thu, 26 Mar 2026 18:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774549970;
	bh=XR7anxY/aULN0YoI5XPa/sNu7iBMedYBtJCjhMTLsFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LAK06jIGTbcIopqhOIH234wqe1F7Qll2yeR6S6Qa8cnQnDQe/jXb8LhKAdS9+wkW/
	 HPiM2pAHgINa1O6cYQEVbxzyg6P7OP5gpCjepaYPUPTRxynTQZZz7mAQavfo6y09mi
	 n0LhyOjfNYGf7c7kx/Mf3bV02YFiADOBLl6/eHhbUURx7oXHaflHOJr0gm/7V3hnVr
	 NCFpY9OYaKP2rvckHz4//1hUp0xvri3t3eMEg3VPRKjCRekmFcYSMI/L9kBZWuMAFr
	 ikx2pAyIx89gFR3gYahrfC/l+iGzxHseJU8zdUDf/Ybn+fWqk2tK7P7zkM+UCiBVji
	 6lwqhYMRenmZg==
Date: Fri, 27 Mar 2026 00:02:35 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Hans Zhang <18255117159@163.com>, lpieralisi@kernel.org, 
	jingoohan1@gmail.com, kwilczynski@kernel.org, bhelgaas@google.com, 
	florian.fainelli@broadcom.com, jim2101024@gmail.com, robh@kernel.org, 
	ilpo.jarvinen@linux.intel.com, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	claudiu.beznea.uj@bp.renesas.com, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-omap@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, shawn.lin@rock-chips.com
Subject: Re: [PATCH v9 1/5] PCI: Add pcie_get_link_speed() helper for safe
 array access
Message-ID: <zcctd7y75nbdxca7dlltvr7dsdrpxphlaq63l64hob3sxzrnwl@zheojrqwfp3j>
References: <20260313165522.123518-2-18255117159@163.com>
 <20260326181624.GA1331242@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260326181624.GA1331242@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_113251_711045_D603723D 
X-CRM114-Status: GOOD (  22.55  )
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

On Thu, Mar 26, 2026 at 01:16:24PM -0500, Bjorn Helgaas wrote:
> On Sat, Mar 14, 2026 at 12:55:18AM +0800, Hans Zhang wrote:
> > The pcie_link_speed[] array is indexed by PCIe generation numbers
> > (1 = 2.5 GT/s, 2 = 5 GT/s, ...).  Several drivers use it directly,
> > which can lead to out-of-bounds accesses if an invalid generation
> > number is used.
> > 
> > Introduce a helper function pcie_get_link_speed() that returns the
> > corresponding enum pci_bus_speed value for a given generation number,
> > or PCI_SPEED_UNKNOWN if the generation is out of range.  This will
> > allow us to safely handle invalid values after the range check is
> > removed from of_pci_get_max_link_speed().
> > 
> > Signed-off-by: Hans Zhang <18255117159@163.com>
> > ---
> >  drivers/pci/pci.h   |  2 ++
> >  drivers/pci/probe.c | 16 ++++++++++++++++
> >  2 files changed, 18 insertions(+)
> > 
> > diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> > index 13d998fbacce..409aca7d737a 100644
> > --- a/drivers/pci/pci.h
> > +++ b/drivers/pci/pci.h
> > @@ -108,6 +108,8 @@ struct pcie_tlp_log;
> >  				 PCI_EXP_DEVCTL_FERE | PCI_EXP_DEVCTL_URRE)
> >  
> >  extern const unsigned char pcie_link_speed[];
> > +unsigned char pcie_get_link_speed(unsigned int speed);
> > +
> >  extern bool pci_early_dump;
> >  
> >  extern struct mutex pci_rescan_remove_lock;
> > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> > index bccc7a4bdd79..d6592898330c 100644
> > --- a/drivers/pci/probe.c
> > +++ b/drivers/pci/probe.c
> > @@ -783,6 +783,22 @@ const unsigned char pcie_link_speed[] = {
> >  };
> >  EXPORT_SYMBOL_GPL(pcie_link_speed);
> >  
> > +/**
> > + * pcie_link_speed_value - Get speed value from PCIe generation number
> 
> Wrong name here (pcie_link_speed_value vs pcie_get_link_speed)
> (pointed out by Sashiko).
> 

Noticed this one while applying.

> > + * @speed: PCIe speed (1-based: 1 = 2.5GT, 2 = 5GT, ...)
> > + *
> > + * Returns the speed value (e.g., PCIE_SPEED_2_5GT) if @speed is valid,
> > + * otherwise returns PCI_SPEED_UNKNOWN.
> > + */
> > +unsigned char pcie_get_link_speed(unsigned int speed)
> 
> Sashiko also pointed out that the commit log says this returns "enum
> pci_bus_speed", while here we return unsigned char (which is also the
> type of pcie_link_speed[x]).
> 
> https://sashiko.dev/#/patchset/20260313165522.123518-1-18255117159%40163.com
> 

This one I didn't, but fixed now, thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

