Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E418CC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 19:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=eGZCioTqauoxX5bbUf9Kczi/I0k9GSOAmttQNbmhbEY=; b=vfA4U6+/TsxSnf
	cwm5O4/Fj3oCq+tXvfwDLVPnC0Gl/1WUvZUsiQg6rsfLd4lEe6EcZdyrsaifzoXYEFtjGOdYpHPCp
	eXfHErthEn5nFjqyb0KZSXAAY5GFnCxn1gead0bS8XONVCi6KU7rvjbc+i1/lVwk90CTTz11rlAvH
	7zqgGRc4VOYxWVcyYhlglRj77lVzW9Y0VjPKwWGC0MRpDq1NFbtrpeH9bYYEfHQVqc4wk/pV+Cl5N
	wAaKHSsCnor9Cz3pme7WXq05gnoQm5Xo11TEF5im5vOSVtmMAYQxhcnbQyKKSdINhcdvz1nXNQD3n
	m2o/bGuR2buHnGZL7+XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ZAm-00GA7U-B0; Wed, 15 Jun 2022 19:59:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ZAa-00GA4w-QT; Wed, 15 Jun 2022 19:59:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6D00BB82171;
	Wed, 15 Jun 2022 19:59:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B44C34115;
	Wed, 15 Jun 2022 19:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655323154;
	bh=gLU9FNk8nWDVMI83UqR0Bx/ijIXX/FVmaX52WhrT0cU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=QaoHgEsict8qsyWnZOYdhQU7L1N50RebxDgbgmc1CiSDMm9eFnQpkZ3mSPTtLxHnK
	 dFHzuQGXgLz5ZzzVJE67ulLHDwjqAsiDDtEnXcWJLh9s9I323EAK7RsrHJPZT7t69m
	 w0jC7meTqK0uTC8wPWRQhL6q9Rq/jUEEOfQ0VRfaUt685+BE/VP/Glzo1q7c0mRkfQ
	 wWlaBgKMXmNXQtLaMQqzPSSlxV9AbM9O1eR/WphxRYtJTaZRwGtfMDZWPY2VL1zEKS
	 pkwwv+K3m8t9Rn0HGL6wB14aJLVP7NIZTJeWhlmQ2N7fs8iepePyiFNVt063tle3zc
	 BH31L829XiCdQ==
Date: Wed, 15 Jun 2022 14:59:12 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	jieyy.yang@mediatek.com, chuanjia.liu@mediatek.com,
	qizhong.cheng@mediatek.com, jian.yang@mediatek.com
Subject: Re: [PATCH v2] PCI: mediatek-gen3: Print LTSSM state when PCIe link
 down
Message-ID: <20220615195912.GA1024264@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220329030715.7975-1-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_125917_183069_5F31E64C 
X-CRM114-Status: GOOD (  23.06  )
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

On Tue, Mar 29, 2022 at 11:07:15AM +0800, Jianjun Wang wrote:
> Print current LTSSM state when PCIe link down instead of the register
> value, make it easier to get the link status.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> Changes in v2:
> Print both of the register value and the LTSSM state.

Applied to pci/ctrl/mediatek-gen3 for v5.20, thanks!

> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 41 ++++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 6745076a02b9..c24e03c198b7 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -153,6 +153,37 @@ struct mtk_gen3_pcie {
>  	DECLARE_BITMAP(msi_irq_in_use, PCIE_MSI_IRQS_NUM);
>  };
>  
> +/* LTSSM state in PCIE_LTSSM_STATUS_REG bit[28:24] */
> +static const char *const ltssm_str[] = {
> +	"detect.quiet",			/* 0x00 */
> +	"detect.active",		/* 0x01 */
> +	"polling.active",		/* 0x02 */
> +	"polling.compliance",		/* 0x03 */
> +	"polling.configuration",	/* 0x04 */
> +	"config.linkwidthstart",	/* 0x05 */
> +	"config.linkwidthaccept",	/* 0x06 */
> +	"config.lanenumwait",		/* 0x07 */
> +	"config.lanenumaccept",		/* 0x08 */
> +	"config.complete",		/* 0x09 */
> +	"config.idle",			/* 0x0A */
> +	"recovery.receiverlock",	/* 0x0B */
> +	"recovery.equalization",	/* 0x0C */
> +	"recovery.speed",		/* 0x0D */
> +	"recovery.receiverconfig",	/* 0x0E */
> +	"recovery.idle",		/* 0x0F */
> +	"L0",				/* 0x10 */
> +	"L0s",				/* 0x11 */
> +	"L1.entry",			/* 0x12 */
> +	"L1.idle",			/* 0x13 */
> +	"L2.idle",			/* 0x14 */
> +	"L2.transmitwake",		/* 0x15 */
> +	"disable",			/* 0x16 */
> +	"loopback.entry",		/* 0x17 */
> +	"loopback.active",		/* 0x18 */
> +	"loopback.exit",		/* 0x19 */
> +	"hotreset",			/* 0x1A */
> +};
> +
>  /**
>   * mtk_pcie_config_tlp_header() - Configure a configuration TLP header
>   * @bus: PCI bus to query
> @@ -327,8 +358,16 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
>  				 !!(val & PCIE_PORT_LINKUP), 20,
>  				 PCI_PM_D3COLD_WAIT * USEC_PER_MSEC);
>  	if (err) {
> +		const char *ltssm_state;
> +		int ltssm_index;
> +
>  		val = readl_relaxed(pcie->base + PCIE_LTSSM_STATUS_REG);
> -		dev_err(pcie->dev, "PCIe link down, ltssm reg val: %#x\n", val);
> +		ltssm_index = PCIE_LTSSM_STATE(val);
> +		ltssm_state = ltssm_index >= ARRAY_SIZE(ltssm_str) ?
> +			      "Unknown state" : ltssm_str[ltssm_index];
> +		dev_err(pcie->dev,
> +			"PCIe link down, current ltssm state: %s (%#x)\n",
> +			ltssm_state, val);
>  		return err;
>  	}
>  
> -- 
> 2.18.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

