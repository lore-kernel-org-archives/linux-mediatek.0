Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415C6C6FD18
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Apr 2023 16:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KA3Wj6o+Guvdyn6RVWvc15n99JJqv1Kt6CugaXzG/F8=; b=gwrtOnExFERKob1ikDHB92R1J7
	04fT9ujHZJEbIeil9HG/1g0vqnWhBswa81bMsf2pbqM3pw8Kbpl3UZOkWcHNvVTsrhYcQ8197fsqW
	e3N2kl9y6DN8swGKgKWT3S0IUHgUzl8WztPIKihHbjSpnEG+wfhagHk+4ai1uf33ZxpAzDVcCtzLX
	VfZZ6G+km6O3iG9tVviXSHG2R07fafhVHsZX3FsX8Z7I/HsdPFc6uyiVo+lMo8TB5CtLb3QvqQSXS
	81yKssMaaClrB8dAebj/7F/PthI4LnZpQn9bVlDNmUV5eDNKEMugOeeqLRRqBMv7o7kzimnSsXMPA
	gg5Xn3iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pooAw-002lrW-1b;
	Tue, 18 Apr 2023 16:27:26 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pooAu-002lqo-0t;
	Tue, 18 Apr 2023 16:27:25 +0000
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-38c00f19654so582761b6e.2;
        Tue, 18 Apr 2023 09:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681835242; x=1684427242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KA3Wj6o+Guvdyn6RVWvc15n99JJqv1Kt6CugaXzG/F8=;
        b=Fqg4u6QMMnM9aYBc4wFwtaz271sINcfCw0IWAMFhx27ZQS1e+1mRvDhXJIWVHqUaCz
         LL48EQaQkR1o/hJFRV0KUAwwIe3eiiTwpIThG+uJgD18AGRrOpKI89sU020up5m31SGe
         frc9q9AAYYerF8TozWAtbgbJaJaN0H9dTxZ+UYSHnxfoFGbklRPaLnYGUYXIVdcaWify
         6EZmNXaobZxo6G/qHaR7wSNFhur0EiPg4RSmoSSU4WjT29+tRqfqUSkFy5BQveRsSy1M
         piPvWwq8RamRCdMO/fSNKPmYPCspJV8EgW5THw/cTSV2AUNTXncqj3la74AQUBtEzxL3
         p4gQ==
X-Gm-Message-State: AAQBX9cThA1/ZtfnAQuxdjbL+0VspWIrQOIwna4ReS12P5F+3QnCLABJ
	SIhN45KJwquW1txxp7Vxvg==
X-Google-Smtp-Source: AKy350bBHLRqNa07Du4N0WmT6K0vuSFaG9g8fJGUXZXaLSnM3rdYMjG2JcU3ECFR82i0sqHbDMgiyw==
X-Received: by 2002:a05:6808:2203:b0:38e:390b:777b with SMTP id bd3-20020a056808220300b0038e390b777bmr1228732oib.59.1681835241818;
        Tue, 18 Apr 2023 09:27:21 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id i11-20020aca3b0b000000b0038c235e24fesm2204031oia.48.2023.04.18.09.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 09:27:20 -0700 (PDT)
Received: (nullmailer pid 1810183 invoked by uid 1000);
	Tue, 18 Apr 2023 16:27:19 -0000
Date: Tue, 18 Apr 2023 11:27:19 -0500
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>, Jonathan Hunter <jonathanh@nvidia.com>, Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, Tyrel Datwyler <tyreld@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] PCI: Use of_property_present() for testing DT property
 presence
Message-ID: <20230418162719.GF1764573-robh@kernel.org>
References: <20230310144719.1544443-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310144719.1544443-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_092724_312502_57118683 
X-CRM114-Status: GOOD (  20.67  )
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

On Fri, Mar 10, 2023 at 08:47:19AM -0600, Rob Herring wrote:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/pci/controller/pci-tegra.c     | 4 ++--
>  drivers/pci/controller/pcie-mediatek.c | 2 +-
>  drivers/pci/hotplug/rpaphp_core.c      | 4 ++--
>  drivers/pci/of.c                       | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)

Ping!

> 
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
> index 74c109f14ff0..79630885b9c8 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -1375,7 +1375,7 @@ static int tegra_pcie_phys_get(struct tegra_pcie *pcie)
>  	struct tegra_pcie_port *port;
>  	int err;
>  
> -	if (!soc->has_gen2 || of_find_property(np, "phys", NULL) != NULL)
> +	if (!soc->has_gen2 || of_property_present(np, "phys"))
>  		return tegra_pcie_phys_get_legacy(pcie);
>  
>  	list_for_each_entry(port, &pcie->ports, list) {
> @@ -1944,7 +1944,7 @@ static bool of_regulator_bulk_available(struct device_node *np,
>  	for (i = 0; i < num_supplies; i++) {
>  		snprintf(property, 32, "%s-supply", supplies[i].supply);
>  
> -		if (of_find_property(np, property, NULL) == NULL)
> +		if (!of_property_present(np, property))
>  			return false;
>  	}
>  
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index ae5ad05ddc1d..31de7a29192c 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -643,7 +643,7 @@ static int mtk_pcie_setup_irq(struct mtk_pcie_port *port,
>  		return err;
>  	}
>  
> -	if (of_find_property(dev->of_node, "interrupt-names", NULL))
> +	if (of_property_present(dev->of_node, "interrupt-names"))
>  		port->irq = platform_get_irq_byname(pdev, "pcie_irq");
>  	else
>  		port->irq = platform_get_irq(pdev, port->slot);
> diff --git a/drivers/pci/hotplug/rpaphp_core.c b/drivers/pci/hotplug/rpaphp_core.c
> index 491986197c47..2316de0fd198 100644
> --- a/drivers/pci/hotplug/rpaphp_core.c
> +++ b/drivers/pci/hotplug/rpaphp_core.c
> @@ -278,7 +278,7 @@ int rpaphp_check_drc_props(struct device_node *dn, char *drc_name,
>  		return -EINVAL;
>  	}
>  
> -	if (of_find_property(dn->parent, "ibm,drc-info", NULL))
> +	if (of_property_present(dn->parent, "ibm,drc-info"))
>  		return rpaphp_check_drc_props_v2(dn, drc_name, drc_type,
>  						be32_to_cpu(*my_index));
>  	else
> @@ -440,7 +440,7 @@ int rpaphp_add_slot(struct device_node *dn)
>  	if (!of_node_name_eq(dn, "pci"))
>  		return 0;
>  
> -	if (of_find_property(dn, "ibm,drc-info", NULL))
> +	if (of_property_present(dn, "ibm,drc-info"))
>  		return rpaphp_drc_info_add_slot(dn);
>  	else
>  		return rpaphp_drc_add_slot(dn);
> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> index 196834ed44fe..e085f2eca372 100644
> --- a/drivers/pci/of.c
> +++ b/drivers/pci/of.c
> @@ -447,7 +447,7 @@ static int of_irq_parse_pci(const struct pci_dev *pdev, struct of_phandle_args *
>  		return -ENODEV;
>  
>  	/* Local interrupt-map in the device node? Use it! */
> -	if (of_get_property(dn, "interrupt-map", NULL)) {
> +	if (of_property_present(dn, "interrupt-map")) {
>  		pin = pci_swizzle_interrupt_pin(pdev, pin);
>  		ppnode = dn;
>  	}
> -- 
> 2.39.2
> 

