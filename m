Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD4DC433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 11:45:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9722619BA
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 11:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9722619BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n8gJP7DJMVMupD1/2LjfdT+LkovvPbCabWm26GpOjxA=; b=IkyJpOYwTy3rmcowibNqizLbm
	s/R/EGhNypNF3siIbehL/1nCHyvFKA56+yAkmoBsAjttLrrOIULScfBpadpCwJp9KalEm/Bm12n0r
	m/sV03k8FXiXfcHMc0oKZJxkBxLJpduMh45c/YJs55L06KQ2MIjYaUfeK/3/0uG14Q30/RYv8D87P
	avWZuxEypo62Z+aHhVI3NXpjUH17Y+vrOAZ7aio0R3e6DUhrQHoO/4OnYEmGryVWBrUbNWLACT2qb
	DW0HrnWawBKWDhQ6YMmfFYeTSLqvr4kqttddNtIMlwgwm33rQkikDW7zJt/WaP7mI73ouggVz9xtp
	T5bl9harA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOfTR-00EmD4-UW; Tue, 23 Mar 2021 11:45:26 +0000
Received: from foss.arm.com ([217.140.110.172])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lOfTI-00EmC5-6X; Tue, 23 Mar 2021 11:45:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AC0211B3;
 Tue, 23 Mar 2021 04:45:13 -0700 (PDT)
Received: from [10.57.50.37] (unknown [10.57.50.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 217AD3F7B4;
 Tue, 23 Mar 2021 04:45:08 -0700 (PDT)
Subject: Re: [PATCH v2 12/15] PCI/MSI: Let PCI host bridges declare their
 reliance on MSI domains
To: Marc Zyngier <maz@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
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
 Paul Walmsley <paul.walmsley@sifive.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 kernel-team@android.com
References: <20210322184614.802565-1-maz@kernel.org>
 <20210322184614.802565-13-maz@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <6a2eaa5d-1d83-159f-69e5-c9e0a00a7b50@arm.com>
Date: Tue, 23 Mar 2021 11:45:02 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210322184614.802565-13-maz@kernel.org>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_114516_613925_0F28BCE5 
X-CRM114-Status: GOOD (  24.16  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2021-03-22 18:46, Marc Zyngier wrote:
> The new 'no_msi' attribute solves the problem of advertising the lack
> of MSI capability for host bridges that know for sure that there will
> be no MSI for their end-points.
> 
> However, there is a whole class of host bridges that cannot know
> whether MSIs will be provided or not, as they rely on other blocks
> to provide the MSI functionnality, using MSI domains.  This is
> the case for example on systems that use the ARM GIC architecture.
> 
> Introduce a new attribute ('msi_domain') indicating that implicit
> dependency, and use this property to set the NO_MSI flag when
> no MSI domain is found at probe time.
> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>   drivers/pci/probe.c | 2 +-
>   include/linux/pci.h | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 146bd85c037e..bac9f69a06a8 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -925,7 +925,7 @@ static int pci_register_host_bridge(struct pci_host_bridge *bridge)
>   	device_enable_async_suspend(bus->bridge);
>   	pci_set_bus_of_node(bus);
>   	pci_set_bus_msi_domain(bus);
> -	if (bridge->no_msi)
> +	if (bridge->no_msi || (bridge->msi_domain && !bus->dev.msi_domain))
>   		bus->bus_flags |= PCI_BUS_FLAGS_NO_MSI;
>   
>   	if (!parent)
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 48605cca82ae..d322d00db432 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -551,6 +551,7 @@ struct pci_host_bridge {
>   	unsigned int	preserve_config:1;	/* Preserve FW resource setup */
>   	unsigned int	size_windows:1;		/* Enable root bus sizing */
>   	unsigned int	no_msi:1;		/* Bridge has no MSI support */
> +	unsigned int	msi_domain:1;		/* Bridge wants MSI domain */

Aren't these really the same thing? Either way we're saying the bridge 
itself doesn't handle MSIs, it's just in one case we're effectively 
encoding a platform-specific assumption that an external domain won't be 
provided. I can't help wondering whether that distinction is really 
necessary...

Robin.

>   
>   	/* Resource alignment requirements */
>   	resource_size_t (*align_resource)(struct pci_dev *dev,
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
