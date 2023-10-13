Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E8FCDB488
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Oct 2023 16:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=OY298T+d3H7RzjzLX32pp2D1IPVtukUDcr/FtL4VqeA=; b=ck8v6zwWu63/jxiVSNJBzN8eHL
	Laq+zUDPfAT1Bql2vxyxeu3nOBD5axDttT7fLmCw+hxQnDr/a/jLzybfh9O4VA6Yn25lx+NO5Nesw
	MwfB6tzdllc00wMyxuRlMG6YBMJqIKDZo2e9+u3YVoH4YpwI1irPcLTpIgSh8rQk3w/13hxmrvu5C
	4kYmR331s7wd+IDhb9buh9MXlqsvUPZmrijjSZwbOFcXAQ/9SLm0ttK6gwVfsGygVbLFR1vQjzAAR
	W921rOGvUn2hlasekBDfF72XiR1NdIbnq2k7VTG9eBFvDtfvvfL0BEtJm/mha9wuQtQ9zMZ8SLB5N
	Q52zjB4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrLLQ-003ujQ-1D;
	Fri, 13 Oct 2023 16:49:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrLLK-003ugK-0V;
	Fri, 13 Oct 2023 16:48:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8F2E6B82BBE;
	Fri, 13 Oct 2023 16:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A61FEC433C9;
	Fri, 13 Oct 2023 16:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697215731;
	bh=szP7x2S0GYdm6BcJLpTOMMqgkvX4QE9nsVO22TS5i8o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=iXecQ4KBb/XyryDRw48MJQ8eE5IZmTibbJWLMBT63ah7VMsNNhfRxsQRBnSxXVRz8
	 ptzcbqS9ofaJyIOri3ZALVgpwCe+Rwg/lONB4QUFij9MtoErSRw7/rE4HfqKMRp9Ol
	 1AuluwowvDK8NcbSOabPG4FxyRekhzTRLLTUCt9VlQsHG9fr69h7832PJfiQYCJtsC
	 xvTbFlvGOVHUu8F9jtsNeee3XWb5EfGiJLqK4gNafwswJDcPCPTqjBh2AHAtqM1Mvf
	 uNDeS2sjsSyZm50Zfb+V47XLjRkfe0MUfugLCniPVwGscnhdTvdZP2Opj4v6DC5oEv
	 fj+erZKZvWbGg==
Date: Fri, 13 Oct 2023 11:48:50 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, ath10k@lists.infradead.org,
	ath11k@lists.infradead.org, ath12k@lists.infradead.org,
	intel-wired-lan@lists.osuosl.org,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org,
	Netdev <netdev@vger.kernel.org>
Subject: Re: [PATCH v2 05/13] PCI/ASPM: Add pci_enable_link_state()
Message-ID: <20231013164850.GA1118214@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afb4db5-5fe1-9f5d-a910-032adf195c@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_094854_470159_3CD3BB2D 
X-CRM114-Status: GOOD (  38.15  )
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

On Thu, Oct 12, 2023 at 03:53:39PM +0300, Ilpo Järvinen wrote:
> On Wed, 11 Oct 2023, Bjorn Helgaas wrote:
> > On Mon, Sep 18, 2023 at 04:10:55PM +0300, Ilpo Järvinen wrote:
> > > pci_disable_link_state() lacks a symmetric pair. Some drivers want to
> > > disable ASPM during certain phases of their operation but then
> > > re-enable it later on. If pci_disable_link_state() is made for the
> > > device, there is currently no way to re-enable the states that were
> > > disabled.
> > 
> > pci_disable_link_state() gives drivers a way to disable specified ASPM
> > states using a bitmask (PCIE_LINK_STATE_L0S, PCIE_LINK_STATE_L1,
> > PCIE_LINK_STATE_L1_1, etc), but IIUC the driver can't tell exactly
> > what changed and can't directly restore the original state, e.g.,
> > 
> >   - PCIE_LINK_STATE_L1 enabled initially
> >   - driver calls pci_disable_link_state(PCIE_LINK_STATE_L0S)
> >   - driver calls pci_enable_link_state(PCIE_LINK_STATE_L0S)
> >   - PCIE_LINK_STATE_L0S and PCIE_LINK_STATE_L1 are enabled now
> > 
> > Now PCIE_LINK_STATE_L0S is enabled even though it was not initially
> > enabled.  Maybe that's what we want; I dunno.
> > 
> > pci_disable_link_state() currently returns success/failure, but only
> > r8169 and mt76 even check, and only rtl_init_one() (r8169) has a
> > non-trivial reason, so it's conceivable that it could return a bitmask
> > instead.
> 
> It's great that you suggested this since it's actually what also I've been 
> started to think should be done instead of this straightforward approach
> I used in V2. 
> 
> That is, don't have the drivers to get anything directly from LNKCTL
> but they should get everything through the API provided by the 
> disable/enable calls which makes it easy for the driver to pass the same
> value back into the enable call.
> 
> > > Add pci_enable_link_state() to remove ASPM states from the state
> > > disable mask.
> > > 
> > > Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > > ---
> > >  drivers/pci/pcie/aspm.c | 42 +++++++++++++++++++++++++++++++++++++++++
> > >  include/linux/pci.h     |  2 ++
> > >  2 files changed, 44 insertions(+)
> > > 
> > > diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
> > > index 91dc95aca90f..f45d18d47c20 100644
> > > --- a/drivers/pci/pcie/aspm.c
> > > +++ b/drivers/pci/pcie/aspm.c
> > > @@ -1117,6 +1117,48 @@ int pci_disable_link_state(struct pci_dev *pdev, int state)
> > >  }
> > >  EXPORT_SYMBOL(pci_disable_link_state);
> > >  
> > > +/**
> > > + * pci_enable_link_state - Re-enable device's link state
> > > + * @pdev: PCI device
> > > + * @state: ASPM link states to re-enable
> > > + *
> > > + * Enable device's link state that were previously disable so the link is
> > 
> > "state[s] that were previously disable[d]" alludes to the use case you
> > have in mind, but I don't think it describes how this function
> > actually works.  This function just makes it possible to enable the
> > specified states.  The @state parameter may have nothing to do with
> > any previously disabled states.
> 
> Yes, it's what I've been thinking between the lines. But I see your point 
> that this API didn't make it easy/obvious as is.
> 
> Would you want me to enforce it too besides altering the API such that the 
> states are actually returned from disable call? (I don't personally find
> that necessary as long as the API pair itself makes it obvious what the 
> driver is expect to pass there.)

This was just a comment about the doc not matching the function
behavior.

I think we have to support pci_enable_link_state() even if the driver
hasn't previously called pci_disable_link_state(), so drivers have to
be able to specify the pci_enable_link_state() @state from scratch.

Does that answer the enforcement question?  I don't think we can
really enforce anything other than that @state specifies valid ASPM
states.

Bjorn

