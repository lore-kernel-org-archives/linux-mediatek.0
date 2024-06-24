Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731D9C2BD05
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 07:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9o/s5GBz3Bk0lu4dj+SGgPoF7POFTxFoymgAJ3zmhM=; b=kkbFLd8Ee5TxNccyhkU1Nw8GsB
	OQsuWnpAtjSx0L8K2GK2DNSTSUHE4idOgd9xIkRIQf81kmC7yqiOz0QvQJfGtw1AMSrSt4anSmg6O
	GWMt4cQ+1TVTfNmH1xklyEKDefJVtwL6DFem+V45556VrdH2R6kEEdKRBdMN+dvSjrYpZYeUoAJIi
	VkqZZHmmt4wbr5xFV3oxaiBHNbGpin6A/ji+apoWdAlrzyk14yXkSpSeSDXOFNfpwwF9msXE0yzAj
	tXkON8iRBuf0v0GFAzt+ypl8h3UPSdwp97VBxOEOUHZ9CiRMF/7qKZPyyeoLTEoEY25a7lvKQxXWB
	BF9N83nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLeZc-0000000Fwn2-00Tu;
	Mon, 24 Jun 2024 07:57:12 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLeZV-0000000Fwla-2R4u;
	Mon, 24 Jun 2024 07:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719215823;
	bh=KlmMThD71Ri51F5dZcgy1vSyJkP6qPTbsfnWV9hwHVg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R19dKTyZiZnzEISb1VEFACE6BLXvcseT8hqDlsIm7Q09tmbQtZYQ53hCkbmXTJWfd
	 pQBQemxsZCk2U0D9El6g1I8zA9zffG/XyhyomsfRZX4r+FfohHVrcF1VdUOQAUhl/3
	 6C0ko3+o4OOuz+2POk9I79VCo9MrAEOUoHBYG3PlximWZKpHAq+XPKxo8ucze7dXiA
	 PQXjpfOvAePaX+uGSukrWcbHjj1StTeIPAHFwK2BfEOe9CZvjNvOeD+B66jvDH/O7n
	 ghKEwMbw7amd7+rzR1qEH24BHdPIzaabt/M/rO+tCCrSLDK+L+X43gvcDUqFCtEvgm
	 sHE5KiAn+HxUg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4F5EE378216B;
	Mon, 24 Jun 2024 07:57:02 +0000 (UTC)
Message-ID: <c63ed7fc-f568-48b1-ad5d-a37b4b475016@collabora.com>
Date: Mon, 24 Jun 2024 09:57:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] PCI: mediatek-gen3: Add mtk_pcie_soc data structure
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-pci@vger.kernel.org
Cc: ryder.lee@mediatek.com, lpieralisi@kernel.org, kw@linux.com,
 robh@kernel.org, bhelgaas@google.com, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi83@gmail.com, linux-arm-kernel@lists.infradead.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, nbd@nbd.name,
 dd@embedd.com, upstream@airoha.com
References: <cover.1718980864.git.lorenzo@kernel.org>
 <a49a36c4ca336dee909e16865d6fec0dd83b3f38.1718980864.git.lorenzo@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <a49a36c4ca336dee909e16865d6fec0dd83b3f38.1718980864.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_005705_795516_1548CA32 
X-CRM114-Status: GOOD (  17.02  )
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

Il 21/06/24 16:48, Lorenzo Bianconi ha scritto:
> Introduce mtk_pcie_soc data structure in order to define multiple
> callbacks for each supported SoC. This is a preliminary patch to
> introduce EN7581 pcie support.
> 
> Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>   drivers/pci/controller/pcie-mediatek-gen3.c | 24 ++++++++++++++++++---
>   1 file changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 975b3024fb08..4859bd875bc4 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -100,6 +100,16 @@
>   #define PCIE_ATR_TLP_TYPE_MEM		PCIE_ATR_TLP_TYPE(0)
>   #define PCIE_ATR_TLP_TYPE_IO		PCIE_ATR_TLP_TYPE(2)
>   
> +struct mtk_gen3_pcie;
> +
> +/**
> + * struct mtk_pcie_soc - differentiate between host generations

mtk_gen3_pcie_pdata ?

> + * @power_up: pcie power_up callback
> + */
> +struct mtk_pcie_soc {
> +	int (*power_up)(struct mtk_gen3_pcie *pcie);
> +};
> +
>   /**
>    * struct mtk_msi_set - MSI information for each set
>    * @base: IO mapped register base
> @@ -131,6 +141,7 @@ struct mtk_msi_set {
>    * @msi_sets: MSI sets information
>    * @lock: lock protecting IRQ bit map
>    * @msi_irq_in_use: bit map for assigned MSI IRQ
> + * @soc: pointer to SoC-dependent operations
>    */
>   struct mtk_gen3_pcie {
>   	struct device *dev;
> @@ -151,6 +162,8 @@ struct mtk_gen3_pcie {
>   	struct mtk_msi_set msi_sets[PCIE_MSI_SET_NUM];
>   	struct mutex lock;
>   	DECLARE_BITMAP(msi_irq_in_use, PCIE_MSI_IRQS_NUM);
> +
> +	const struct mtk_pcie_soc *soc;
>   };
>   
>   /* LTSSM state in PCIE_LTSSM_STATUS_REG bit[28:24] */
> @@ -904,7 +917,7 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
>   	usleep_range(10, 20);
>   
>   	/* Don't touch the hardware registers before power up */
> -	err = mtk_pcie_power_up(pcie);
> +	err = pcie->soc->power_up(pcie);
>   	if (err)
>   		return err;
>   
> @@ -939,6 +952,7 @@ static int mtk_pcie_probe(struct platform_device *pdev)
>   	pcie = pci_host_bridge_priv(host);
>   
>   	pcie->dev = dev;
> +	pcie->soc = of_device_get_match_data(dev);

device_get_match_data() can also be used here :-)

Cheers,
Angelo


