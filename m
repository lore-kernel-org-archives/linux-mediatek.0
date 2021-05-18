Return-Path: <SRS0=DTMy=KN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A92C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 09:00:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D77DA61209
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 09:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D77DA61209
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Subject:Cc:To:
	From:Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FKZq6gkRPtQN9nQ1kjg0vVHpT/vLx3GQhHiy7YCNhfc=; b=DBulBXgsy2/C7ydheXoKw105d
	FpWfUJZePFszwa3tAMe4/sPGSJCiRtbxDhDp+WrUTn/qMNIrJcUloWW8br8xWAkOC6UGaxxC92KcT
	w6+Bk/otZD7NLLji47tMxxYN7DsMVty1gM5EIU9PoSPoPY5Y04t860ZzoozZv8eOhhjhE1JsYOkaJ
	E/MQryUhCox3eaJUaNBzvhwaXzHYSh7a78LHDjTi7BBR9zZ8dvFIKkVGCbaBj7xL9rk5xf8jVFSHW
	wsgIymFntVWACNqRCxNsmdVnrha0eIwFilW8JFPZpsdkIqOKB0+GYyBsjhbt5V7ijvcdMeJ4hqNFE
	lJY+tCoyQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1livaM-0001WL-5n; Tue, 18 May 2021 09:00:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liva9-0001Uy-Fo; Tue, 18 May 2021 09:00:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:References:
 In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=NEJQ4CR97lNC3GgC3NNKg3Mn6TYArEHOaQgyKuD1DC4=; b=U7SPQvdMjg6wxJqFlJGjzKCTUs
 SjgYe5rW6lbXatUjpUSxUlhYjzymYunkk8G/ILxcToByAu++cVJ+B+T6qKPUboDXoVMXsSArW1sdI
 s4ryq5adYdWBC6l5cPedXn+ffKQHQv8ZCAltkkP9lAlfT+Yl4hb3Q2Dlk7dJv8Ow8eCISn66uouRU
 PSqQ9D6rFZYrBVx4dBTb78FJAwo61SThMj56WSa9wNq3zQjw2KB/dKeTwz0R0pxfaNJJylsGG9kzc
 9Gy8exserv+GY6rRV7SPzGoL1Vm6pl8jL/24xwAUuHhrtDp+Cb1j1O/NgUshc+mabn37KP/5IF37L
 B7mGcuyg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liva4-00EU1B-OA; Tue, 18 May 2021 09:00:04 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 75FAD61285;
 Tue, 18 May 2021 09:00:00 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1liva1-0021hj-CR; Tue, 18 May 2021 09:59:57 +0100
Date: Tue, 18 May 2021 09:59:56 +0100
Message-ID: <87a6osv2lv.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Thierry Reding <treding@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Michael Kelley <mikelley@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Bharat Kumar Gogada <bharatku@xilinx.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 kernel-team@android.com
Subject: Re: [PATCH v3 13/14] PCI/MSI: Document the various ways of ending up
 with NO_MSI
In-Reply-To: <b5a5a6d8-6ffc-8c5c-c5b1-fb4f5616069f@arm.com>
References: <20210330151145.997953-1-maz@kernel.org>
 <20210330151145.997953-14-maz@kernel.org>
 <b5a5a6d8-6ffc-8c5c-c5b1-fb4f5616069f@arm.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: jeremy.linton@arm.com, lorenzo.pieralisi@arm.com,
 bhelgaas@google.com, frank-w@public-files.de, treding@nvidia.com,
 tglx@linutronix.de, robh@kernel.org, will@kernel.org, kys@microsoft.com,
 haiyangz@microsoft.com, sthemmin@microsoft.com, mikelley@microsoft.com,
 wei.liu@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
 ryder.lee@mediatek.com, marek.vasut+renesas@gmail.com,
 yoshihiro.shimoda.uh@renesas.com, michal.simek@xilinx.com,
 paul.walmsley@sifive.com, bharatku@xilinx.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_020000_851893_65AC99F2 
X-CRM114-Status: GOOD (  31.88  )
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

Hi Jeremy,

On Tue, 18 May 2021 05:28:56 +0100,
Jeremy Linton <jeremy.linton@arm.com> wrote:
> 
> Hi,
> 
> 
> On 3/30/21 10:11 AM, Marc Zyngier wrote:
> > We have now three ways of ending up with NO_MSI being set.
> > Document them.
> > 
> > Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > ---
> >   drivers/pci/msi.c | 11 +++++++++--
> >   1 file changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pci/msi.c b/drivers/pci/msi.c
> > index d9c73c173c14..217dc9f0231f 100644
> > --- a/drivers/pci/msi.c
> > +++ b/drivers/pci/msi.c
> > @@ -871,8 +871,15 @@ static int pci_msi_supported(struct pci_dev *dev, int nvec)
> >   	 * Any bridge which does NOT route MSI transactions from its
> >   	 * secondary bus to its primary bus must set NO_MSI flag on
> >   	 * the secondary pci_bus.
> > -	 * We expect only arch-specific PCI host bus controller driver
> > -	 * or quirks for specific PCI bridges to be setting NO_MSI.
> > +	 *
> > +	 * The NO_MSI flag can either be set directly by:
> > +	 * - arch-specific PCI host bus controller drivers (deprecated)
> > +	 * - quirks for specific PCI bridges
> > +	 *
> > +	 * or indirectly by platform-specific PCI host bridge drivers by
> > +	 * advertising the 'msi_domain' property, which results in
> > +	 * the NO_MSI flag when no MSI domain is found for this bridge
> > +	 * at probe time.
> 
> I have an ACPI machine with a gicv2 (no m), and a MSI region that
> isn't described by ACPI because its non-standard. In the past this
> tended to work because PCIe device drivers would fall back to legacy
> pci intx silently. But, with 5.13, it seems this series now triggers
> the WARN_ON_ONCE() in arch_setup_msi_irq, because duh, no MSI support.

This is nothing new, and you could get the exact same warning if you
didn't have legacy drivers compiled in (any of the 3 drivers that were
fixed in this series).

This series now makes sure you definitely know about this issue. And
look, it worked! :-)

> Everything of course continues to work, it just gets this ugly splat
> on bootup telling me basically the machine doesn't support MSIs. So, I
> considered a few patches, including just basically setting nomsi if
> gicv2 && acpi, or eek a host bridge quirk.
> 
> None of these seem great, so how can this be fixed?

The host bridge quirk seems the most likely route to address this, but
you could just as well advertise msi_domain in the ACPI PCI path,
*and* check for IORT mappings in pci_register_host_bridge(), similarly
to what Jean-Philippe has proposed for DT in [1].

Thanks,

	M.

[1] https://lore.kernel.org/r/20210510173129.750496-1-jean-philippe@linaro.org


-- 
Without deviation from the norm, progress is not possible.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
