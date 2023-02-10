Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888FFC05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 14:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2R5A3rAx6PdMp4hilj5V8/LgVCS+X26GXY9y2hWmpMY=; b=RiAk5H9gQd0OINl/e6JJmpw7Cq
	Zel2puqRHKQV0vq90bqV9+Y9cZOG5nr8iTAibtcH8XDWuhkBJDJxtRxi+XWK5xf7BDvF0BSCjom5e
	fmJcTJEZCKd0w8kbJfeMOAiZ+90lNz4a2vTL72v3JNgFO+nYBmSa5R2dpURXqWYeUnY3sp+DH/nbx
	J8rdSBkTrEjGR6gL7lejA5x4ez/2dPFPl66lZ6ET820FEtMunthoTpxsZBEXkMQOl5RUZe6jX7EOm
	o728AfgUyFN3JqNiTkkLPF1p2ZP/NtlUGI1IHYwU3UC7lKGV3D5tP2hQCX/UwXgolM+wsXOO/20lR
	c0GBjzeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQTzJ-005vnZ-Rf; Fri, 10 Feb 2023 14:02:53 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQTz9-005vjb-7q; Fri, 10 Feb 2023 14:02:44 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9BCFE66020EA;
	Fri, 10 Feb 2023 14:02:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676037761;
	bh=xqNu2fqRkJIAlxG1Wal3xUvF6rhQlJzVMX/kroJoi/I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fKkoy4ICgkkU4/8XGvSYHPQtU7RdSRvRDCiH2jw4fzIRwcRydluBlGryaQjc7qIRp
	 LJ9CSGM548ZsIzVwnQ0EKY30YKB+n2CgoNbIZEd1+ox+EeVB6yUOSPf2v9YHhrxoLO
	 fdRMs59/caNexe0bUhvT3E6Ab4CPZ+FT8zD+bvIkMG8zb2/NGztuspOgNtx0x6f1cZ
	 xHafaOdhPqy3hp6xCmPOfREQoLL7ZfPEDYx38hsx3+gTkzNENzt+daEnBZyO40hSec
	 YylUveN53q7IuSdP7QJXHo8DQ8lBlfxLh4h6JvqMpA4Y4bNruaAM9itUB1BdazPGIZ
	 EQ5RsvgcfDsMw==
Message-ID: <ace701a0-45cb-3b48-cdc5-e4d39384b8aa@collabora.com>
Date: Fri, 10 Feb 2023 15:02:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v5 06/12] remoteproc: mediatek: Extract remoteproc
 initialization flow
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230210085931.8941-1-tinghan.shen@mediatek.com>
 <20230210085931.8941-7-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230210085931.8941-7-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_060243_575392_426AA157 
X-CRM114-Status: GOOD (  26.16  )
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

Il 10/02/23 09:59, Tinghan Shen ha scritto:
> This is the preparation for probing multi-core SCP. The remoteproc
> initialization flow is similar on cores and is reuesd to avoid
> redundant code.
> 
> The registers of config and l1tcm are shared for multi-core
> SCP. Reuse the mapped addresses for all cores.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>   drivers/remoteproc/mtk_common.h |  7 +++++
>   drivers/remoteproc/mtk_scp.c    | 55 +++++++++++++++++++++------------
>   2 files changed, 42 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index 3778894c96f3..20c1a90be77d 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -112,6 +112,13 @@ struct mtk_scp_of_data {
>   	size_t ipi_buf_offset;
>   };
>   
> +struct mtk_scp_of_regs {

In v4, I already commented on this one, saying that this structure is used
only in mtk_scp.c as a commodity and *only* as a commodity for passing data
between two functions, and I already asked to move this structure definition
to mtk_scp.c.

Thanks,
Angelo

> +	void __iomem *reg_base;
> +	void __iomem *l1tcm_base;
> +	size_t l1tcm_size;
> +	phys_addr_t l1tcm_phys;
> +};
> +
>   struct mtk_scp {
>   	struct device *dev;
>   	struct rproc *rproc;
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index b92274067522..898039879142 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -854,7 +854,8 @@ static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
>   	}
>   }
>   
> -static int scp_probe(struct platform_device *pdev)
> +static int scp_rproc_init(struct platform_device *pdev,
> +			  struct mtk_scp_of_regs *of_regs)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct device_node *np = dev->of_node;
> @@ -878,6 +879,11 @@ static int scp_probe(struct platform_device *pdev)
>   	scp->data = of_device_get_match_data(dev);
>   	platform_set_drvdata(pdev, scp);
>   
> +	scp->reg_base = of_regs->reg_base;
> +	scp->l1tcm_base = of_regs->l1tcm_base;
> +	scp->l1tcm_size = of_regs->l1tcm_size;
> +	scp->l1tcm_phys = of_regs->l1tcm_phys;
> +
>   	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
>   	scp->sram_base = devm_ioremap_resource(dev, res);
>   	if (IS_ERR(scp->sram_base))
> @@ -887,24 +893,6 @@ static int scp_probe(struct platform_device *pdev)
>   	scp->sram_size = resource_size(res);
>   	scp->sram_phys = res->start;
>   
> -	/* l1tcm is an optional memory region */
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
> -	scp->l1tcm_base = devm_ioremap_resource(dev, res);
> -	if (IS_ERR(scp->l1tcm_base)) {
> -		ret = PTR_ERR(scp->l1tcm_base);
> -		if (ret != -EINVAL) {
> -			return dev_err_probe(dev, ret, "Failed to map l1tcm memory\n");
> -		}
> -	} else {
> -		scp->l1tcm_size = resource_size(res);
> -		scp->l1tcm_phys = res->start;
> -	}
> -
> -	scp->reg_base = devm_platform_ioremap_resource_byname(pdev, "cfg");
> -	if (IS_ERR(scp->reg_base))
> -		return dev_err_probe(dev, PTR_ERR(scp->reg_base),
> -				     "Failed to parse and map cfg memory\n");
> -
>   	ret = scp->data->scp_clk_get(scp);
>   	if (ret)
>   		return ret;
> @@ -932,7 +920,6 @@ static int scp_probe(struct platform_device *pdev)
>   	ret = devm_request_threaded_irq(dev, platform_get_irq(pdev, 0), NULL,
>   					scp_irq_handler, IRQF_ONESHOT,
>   					pdev->name, scp);
> -
>   	if (ret) {
>   		dev_err(dev, "failed to request irq\n");
>   		goto remove_subdev;
> @@ -956,6 +943,34 @@ static int scp_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> +static int scp_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	struct mtk_scp_of_regs scp_regs;
> +	int ret;
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cfg");
> +	scp_regs.reg_base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(scp_regs.reg_base))
> +		return dev_err_probe(dev, PTR_ERR(scp_regs.reg_base),
> +				     "Failed to parse and map cfg memory\n");
> +
> +	/* l1tcm is an optional memory region */
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
> +	scp_regs.l1tcm_base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(scp_regs.l1tcm_base)) {
> +		ret = PTR_ERR(scp_regs.l1tcm_base);
> +		if (ret != -EINVAL)
> +			return dev_err_probe(dev, ret, "Failed to map l1tcm memory\n");
> +	} else {
> +		scp_regs.l1tcm_size = resource_size(res);
> +		scp_regs.l1tcm_phys = res->start;
> +	}
> +
> +	return scp_rproc_init(pdev, &scp_regs);
> +}
> +
>   static int scp_remove(struct platform_device *pdev)
>   {
>   	struct mtk_scp *scp = platform_get_drvdata(pdev);


