Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0586C77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 07:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4MO5VLgryXuxTcJ+GoZlaAPtFrTBxCnEbex09xY6zhY=; b=4AHklSS8gN/1e/ueIwE3USEEGS
	p2pw7j80ZgBLCMeqgSEt60FIi4RC7/zZDUZcZriBEHnpT1JF2f64flWsraTn2FDdsTISvLr573XDg
	9m5JJGRPCswCNGEcJrVzCjkPJfmCtJldvVslOfq8TfEh/gql6er1reY4Mj13t26eCwa/zHrUkKkiL
	lOJk0tLhkiW8RivDjB+KwSbuZzmw/REMpEWEgivXxEVplnuPFsG8xHHEmQJQtIN0vVAuALrR/llz0
	DsaweslMcWAtCnoDndJrxIu4IHkATuz7c5cIIv4Rk63OSFIQ32wkKfXyHuPHhuBqErZDPTgw3lTxN
	DITZMAbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6nqG-004n6k-1d;
	Wed, 07 Jun 2023 07:44:28 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6nqC-004n5e-1d;
	Wed, 07 Jun 2023 07:44:26 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E840F6606EF8;
	Wed,  7 Jun 2023 08:43:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686123861;
	bh=7dPWa7Ho4xBDIwK8t0uY7p+Ufp8fjYMMkz9g433WDdc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=it66zNf05C0WbUEo45SO0n+cYnBFkdVr9T/1cae9pXO81lGueWIqtO8kd6e2XLmjn
	 5uS2a5NtfQCBaUAlv+nknmaQxEPqmogbGOZnn6mYGuX7OpmPsJHnnu2gqp/xgZgv9V
	 SvwVKJkUW3m5jBA2yoSbSWLkaCVx4QjlOpupkVanGB7gbd5AFelGqV/wRM8eLnxG7q
	 +Nujz30NWI0900wGvIVMYSuR6/bbl2MhQ+MCQ2g2+qXoa/LjV5LZBM/4l5HK3cKAWC
	 avFLm7DEzdYZ51S/+cPdjXVyDVubl+vz9kS5jizsP8g6XMRiBj9nEB0q1N7GF0hHi7
	 WtLDzsDBJDWjA==
Message-ID: <d8053fc1-cace-b14b-57c6-387c0d664837@collabora.com>
Date: Wed, 7 Jun 2023 09:43:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v13 05/11] remoteproc: mediatek: Introduce cluster on
 single-core SCP
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230607072222.8628-1-tinghan.shen@mediatek.com>
 <20230607072222.8628-6-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230607072222.8628-6-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_004424_834611_6EE8D841 
X-CRM114-Status: GOOD (  26.29  )
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

Il 07/06/23 09:22, Tinghan Shen ha scritto:
> This is the preliminary step for probing multi-core SCP.
> The initialization procedure for remoteproc is similar for both
> single-core and multi-core architectures and is reusing to avoid
> redundant code.
> 
> Rewrite the probing flow of single-core SCP to adapt with the 'cluster'
> concept needed by probing the multi-core SCP. The main differences
> are,
> - the SCP core object(s) is maintained at the cluster list instead of at
>    the platofmr device driver data property.

s/platofmr/platform/g

> - save the cluster information at the platofmr device driver data property.
> - In order to keep the compatibility of exported SCP APIs which getting
>    the SCP core object by SCP node phandle, move the SCP core object
>    pointers to the platform device platform data property.
> 
> The registers of config and l1tcm are shared for multi-core
> SCP. Reuse the mapped addresses for all cores.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>   drivers/remoteproc/mtk_common.h |   2 +
>   drivers/remoteproc/mtk_scp.c    | 151 +++++++++++++++++++++++---------
>   2 files changed, 112 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index c0905aec3b4b..56395e8664cb 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -128,6 +128,8 @@ struct mtk_scp {
>   	size_t dram_size;
>   
>   	struct rproc_subdev *rpmsg_subdev;
> +
> +	struct list_head elem;
>   };
>   
>   /**
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index d66822dad943..c8fc6b46f82b 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -23,6 +23,14 @@
>   #define MAX_CODE_SIZE 0x500000
>   #define SECTION_NAME_IPI_BUFFER ".ipi_buffer"
>   
> +struct mtk_scp_of_cluster {
> +	void __iomem *reg_base;
> +	void __iomem *l1tcm_base;
> +	size_t l1tcm_size;
> +	phys_addr_t l1tcm_phys;
> +	struct list_head mtk_scp_list;
> +};
> +
>   /**
>    * scp_get() - get a reference to SCP.
>    *
> @@ -51,7 +59,7 @@ struct mtk_scp *scp_get(struct platform_device *pdev)
>   		return NULL;
>   	}
>   
> -	return platform_get_drvdata(scp_pdev);
> +	return *(struct mtk_scp **)dev_get_platdata(&scp_pdev->dev);
>   }
>   EXPORT_SYMBOL_GPL(scp_get);
>   
> @@ -810,14 +818,14 @@ static void scp_unmap_memory_region(struct mtk_scp *scp)
>   static int scp_register_ipi(struct platform_device *pdev, u32 id,
>   			    ipi_handler_t handler, void *priv)
>   {
> -	struct mtk_scp *scp = platform_get_drvdata(pdev);
> +	struct mtk_scp *scp = *(struct mtk_scp **)dev_get_platdata(&pdev->dev);
>   
>   	return scp_ipi_register(scp, id, handler, priv);
>   }
>   
>   static void scp_unregister_ipi(struct platform_device *pdev, u32 id)
>   {
> -	struct mtk_scp *scp = platform_get_drvdata(pdev);
> +	struct mtk_scp *scp = *(struct mtk_scp **)dev_get_platdata(&pdev->dev);
>   
>   	scp_ipi_unregister(scp, id);
>   }
> @@ -825,7 +833,7 @@ static void scp_unregister_ipi(struct platform_device *pdev, u32 id)
>   static int scp_send_ipi(struct platform_device *pdev, u32 id, void *buf,
>   			unsigned int len, unsigned int wait)
>   {
> -	struct mtk_scp *scp = platform_get_drvdata(pdev);
> +	struct mtk_scp *scp = *(struct mtk_scp **)dev_get_platdata(&pdev->dev);
>   
>   	return scp_ipi_send(scp, id, buf, len, wait);
>   }
> @@ -855,7 +863,8 @@ static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
>   	}
>   }
>   
> -static int scp_probe(struct platform_device *pdev)
> +static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
> +				      struct mtk_scp_of_cluster *scp_cluster)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct device_node *np = dev->of_node;
> @@ -867,52 +876,42 @@ static int scp_probe(struct platform_device *pdev)
>   
>   	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
>   	if (ret < 0 && ret != -EINVAL)
> -		return ret;
> +		return ERR_PTR(ret);
>   
>   	rproc = devm_rproc_alloc(dev, np->name, &scp_ops, fw_name, sizeof(*scp));
> -	if (!rproc)
> -		return dev_err_probe(dev, -ENOMEM, "unable to allocate remoteproc\n");
> +	if (!rproc) {
> +		dev_err(dev, "unable to allocate remoteproc\n");
> +		return ERR_PTR(-ENOMEM);

Why are you converting those dev_err_probe to dev_err->return?!

Regards,
Angelo


