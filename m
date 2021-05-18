Return-Path: <SRS0=DTMy=KN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A0C6C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 04:29:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 654AD60E08
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 04:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 654AD60E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IEIFV76h4o22bwSOrUQCTKPxOiNOv+cEMWaGXABskN0=; b=pnw32bm+zj0LVU3oUc0yQ/6xJ
	8XLwWABaTjApAW5IBObFdENBCm3ggJKeg62Jmv/uQzQyQ4UdBnkN9N2f2t2UF99ZOkrNqxTVyET8m
	+zwrzIa1uxrScsoawHwyNuliArxhD45nOgVQL4fxQwy7ZRvBEZOyZ1ICjvcWTA/NtnYLytv0TMRIc
	z2UubHP13yQMtOq9zuV1SUsWYpy89ejnfT1Zs8asagdAs2j8JO9QT67I0v0FdGWYr0rMZdysNdspA
	OOkOLm1bhVVsAi0r2zFIyL+eYsRlIpYFeOxKYpkFfBH3M7PVtPYO6+vCg+7CnVj7z1s26Gmffb1cV
	jUKK6cKfA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lirM5-00GvQq-QD; Tue, 18 May 2021 04:29:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lirLu-00GvQ9-TG; Tue, 18 May 2021 04:29:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=0KECMAkIouFKAdnT4vUIwdJ7jqvY85m3SX+xtY0qU8g=; b=RmoODnDBeAHtYrrte3KdWaqLGS
 ZfOiysDbjofVG3jMQWzv7il8mne2d7DN7x3nKLP90g+E+CC39ZIkmUuNjK8aJIqpaDXkd5utTj19h
 1NHyk3P6L4pBsdO54Yf+iGZJ3RWHaQqZZY4LqDALCMSuVTe1ktP89lKCd8fYKnSctetSchT2n9um/
 z1G1ApqoWH9tUiPWvnm9CG7tpf/l+uzggQSA3/KDXxZ+qDT96MvVxfgPe6DBY+QjSTj5acxWkTi0z
 UybPj8Ek5eKNiOu8EENQV9C9NXZXjPyILnDczaOaO9pe9AqWQRRzev8rN4Y3hIWhOCdCMG2GzmePh
 opfeDD+A==;
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lirLs-00EIlZ-23; Tue, 18 May 2021 04:29:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AECA31B;
 Mon, 17 May 2021 21:28:58 -0700 (PDT)
Received: from [192.168.122.166] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 185D53F73D;
 Mon, 17 May 2021 21:28:57 -0700 (PDT)
Subject: Re: [PATCH v3 13/14] PCI/MSI: Document the various ways of ending up
 with NO_MSI
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
 Paul Walmsley <paul.walmsley@sifive.com>,
 Bharat Kumar Gogada <bharatku@xilinx.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 kernel-team@android.com
References: <20210330151145.997953-1-maz@kernel.org>
 <20210330151145.997953-14-maz@kernel.org>
From: Jeremy Linton <jeremy.linton@arm.com>
Message-ID: <b5a5a6d8-6ffc-8c5c-c5b1-fb4f5616069f@arm.com>
Date: Mon, 17 May 2021 23:28:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210330151145.997953-14-maz@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_212904_228532_89764999 
X-CRM114-Status: GOOD (  23.00  )
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

Hi,


On 3/30/21 10:11 AM, Marc Zyngier wrote:
> We have now three ways of ending up with NO_MSI being set.
> Document them.
> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>   drivers/pci/msi.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/msi.c b/drivers/pci/msi.c
> index d9c73c173c14..217dc9f0231f 100644
> --- a/drivers/pci/msi.c
> +++ b/drivers/pci/msi.c
> @@ -871,8 +871,15 @@ static int pci_msi_supported(struct pci_dev *dev, int nvec)
>   	 * Any bridge which does NOT route MSI transactions from its
>   	 * secondary bus to its primary bus must set NO_MSI flag on
>   	 * the secondary pci_bus.
> -	 * We expect only arch-specific PCI host bus controller driver
> -	 * or quirks for specific PCI bridges to be setting NO_MSI.
> +	 *
> +	 * The NO_MSI flag can either be set directly by:
> +	 * - arch-specific PCI host bus controller drivers (deprecated)
> +	 * - quirks for specific PCI bridges
> +	 *
> +	 * or indirectly by platform-specific PCI host bridge drivers by
> +	 * advertising the 'msi_domain' property, which results in
> +	 * the NO_MSI flag when no MSI domain is found for this bridge
> +	 * at probe time.

I have an ACPI machine with a gicv2 (no m), and a MSI region that isn't 
described by ACPI because its non-standard. In the past this tended to 
work because PCIe device drivers would fall back to legacy pci intx 
silently. But, with 5.13, it seems this series now triggers the 
WARN_ON_ONCE() in arch_setup_msi_irq, because duh, no MSI support.

Everything of course continues to work, it just gets this ugly splat on 
bootup telling me basically the machine doesn't support MSIs. So, I 
considered a few patches, including just basically setting nomsi if 
gicv2 && acpi, or eek a host bridge quirk.

None of these seem great, so how can this be fixed?

Thanks,




>   	 */
>   	for (bus = dev->bus; bus; bus = bus->parent)
>   		if (bus->bus_flags & PCI_BUS_FLAGS_NO_MSI)
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
