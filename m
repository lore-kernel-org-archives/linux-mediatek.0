Return-Path: <SRS0=Ntwg=IW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55110C433C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 13:20:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC9FD61A0A
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 13:20:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC9FD61A0A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2WL1ZFVpLaZeeRiQXYMSEkToAYCRfPWMZhoqGmDRx1I=; b=F8fiuNm8SGK3oNlweCPhmm4QX
	SM/I/ncuCDLbS/vS38raPUaK0DohXVfRnyUcKay3or5hwe/nIlxtxTSFhIKLx4QbHUWNe2+0Tonlr
	8Jxx9/hnGxxyDMA37Ie3YQ7ULHnq33G0Fvj7rBLRsO5duFdKC3GZxkxcIj0BxxwShT61kt7Ywunq2
	Af9jB+6rpz6H2LC4HrSPv43cg5aEtV1AI5h11LOr48VayfsnuRNErqs+1O8qNR/WCL3+Y/wCpNnBW
	rknLEf7TzOf6mC/HJFWRB2Q+kJqRn8B53xYmxePVoZx0yvnphIeN9ETCOHRX9bO6wJVj43d/ybUaf
	JVIkOUQTA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lP3QZ-00H8zp-Qz; Wed, 24 Mar 2021 13:20:03 +0000
Received: from foss.arm.com ([217.140.110.172])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lP3QL-00H8yo-Fm; Wed, 24 Mar 2021 13:19:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFA5D1FB;
 Wed, 24 Mar 2021 06:19:46 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (e121166-lin.cambridge.arm.com
 [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A55263F718;
 Wed, 24 Mar 2021 06:19:43 -0700 (PDT)
Date: Wed, 24 Mar 2021 13:19:38 +0000
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Thierry Reding <treding@nvidia.com>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Will Deacon <will@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Michael Kelley <mikelley@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v2 12/15] PCI/MSI: Let PCI host bridges declare their
 reliance on MSI domains
Message-ID: <20210324131938.GA16722@e121166-lin.cambridge.arm.com>
References: <20210322184614.802565-1-maz@kernel.org>
 <20210322184614.802565-13-maz@kernel.org>
 <6a2eaa5d-1d83-159f-69e5-c9e0a00a7b50@arm.com>
 <87im5hkahr.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87im5hkahr.wl-maz@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_131949_889973_34D5F89E 
X-CRM114-Status: GOOD (  36.10  )
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

On Tue, Mar 23, 2021 at 06:09:36PM +0000, Marc Zyngier wrote:
> Hi Robin,
> 
> On Tue, 23 Mar 2021 11:45:02 +0000,
> Robin Murphy <robin.murphy@arm.com> wrote:
> > 
> > On 2021-03-22 18:46, Marc Zyngier wrote:
> > > The new 'no_msi' attribute solves the problem of advertising the lack
> > > of MSI capability for host bridges that know for sure that there will
> > > be no MSI for their end-points.
> > > 
> > > However, there is a whole class of host bridges that cannot know
> > > whether MSIs will be provided or not, as they rely on other blocks
> > > to provide the MSI functionnality, using MSI domains.  This is
> > > the case for example on systems that use the ARM GIC architecture.
> > > 
> > > Introduce a new attribute ('msi_domain') indicating that implicit
> > > dependency, and use this property to set the NO_MSI flag when
> > > no MSI domain is found at probe time.
> > > 
> > > Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> > > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > > ---
> > >   drivers/pci/probe.c | 2 +-
> > >   include/linux/pci.h | 1 +
> > >   2 files changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> > > index 146bd85c037e..bac9f69a06a8 100644
> > > --- a/drivers/pci/probe.c
> > > +++ b/drivers/pci/probe.c
> > > @@ -925,7 +925,7 @@ static int pci_register_host_bridge(struct pci_host_bridge *bridge)
> > >   	device_enable_async_suspend(bus->bridge);
> > >   	pci_set_bus_of_node(bus);
> > >   	pci_set_bus_msi_domain(bus);
> > > -	if (bridge->no_msi)
> > > +	if (bridge->no_msi || (bridge->msi_domain && !bus->dev.msi_domain))
> > >   		bus->bus_flags |= PCI_BUS_FLAGS_NO_MSI;
> > >     	if (!parent)
> > > diff --git a/include/linux/pci.h b/include/linux/pci.h
> > > index 48605cca82ae..d322d00db432 100644
> > > --- a/include/linux/pci.h
> > > +++ b/include/linux/pci.h
> > > @@ -551,6 +551,7 @@ struct pci_host_bridge {
> > >   	unsigned int	preserve_config:1;	/* Preserve FW resource setup */
> > >   	unsigned int	size_windows:1;		/* Enable root bus sizing */
> > >   	unsigned int	no_msi:1;		/* Bridge has no MSI support */
> > > +	unsigned int	msi_domain:1;		/* Bridge wants MSI domain */
> > 
> > Aren't these really the same thing? Either way we're saying the bridge
> > itself doesn't handle MSIs, it's just in one case we're effectively
> > encoding a platform-specific assumption that an external domain won't
> > be provided. I can't help wondering whether that distinction is really
> > necessary...
> 
> There is a subtle difference: no_msi indicates that there is no way
> *any* MSI can be dealt with whatsoever (maybe because the RC doesn't
> forward the corresponding TLPs?). msi_domain says "no MSI unless...".
> 
> We could implement the former with the latter, but I have the feeling
> that's not totally bullet proof. Happy to revisit this if you think it
> really matters.

IIUC msi_domain == 1 means: this host bridge needs an msi_domain to enable
MSIs, which in turn means that there are bridges that do _not_ require
an msi_domain to enable MSIs. I don't know how other arches handle the 
msi_domain pointer but I am asking whether making:

if (bridge->no_msi || !bus->dev.msi_domain))
	bus->bus_flags |= PCI_BUS_FLAGS_NO_MSI;

is a possibility (removing the need for the msi_domain flag).

At least this looks more like an arch property than a host bridge
specific property (eg patch [13] pci_host_common_probe() may be used on
arches other than ARM where it is not necessary true that it requires an
msi_domain to enable MSIs).

I agree that's complicated to untangle - just asking if there is way
to simplify it.

Thanks,
Lorenzo

> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
