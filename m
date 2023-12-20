Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA8DC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 11:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xCgkzoiWlCyl7V5aJSYqp14uzbUtGwEEmV5rmCQDDSI=; b=vSfEUO2eX0tgu4tfTpx/wn+xXe
	d5JgWDOPzUULcdt0o0nPHPJ59WEsBA9Khx3eYpjWqLhRFdBwdSAduzLr6PJ4wLdbQVpH/kPwrCp1K
	IBImSrpF5lehvWmwUQ8QKPfv5cryvNS1unKct+krlL4F+1pxuLUTRL7nuupcI1hGrO+0kUW1unYyl
	lgYm3vyyAN9oCsfzK6/uQyfbZkEdpiBRvkHQQTRYCiLtzZnNrvWlw4mDHPjoqgK2/QkIJ7/kOZumq
	nJqzCfKC2ah4Co79KpffxB+uRPmG1aD58D6yTu8JUGDPmu0IZg8sl+j0B265x3IFlW6vAL7vQr1KB
	vrlE+wbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFuLM-00H0pk-2h;
	Wed, 20 Dec 2023 11:02:28 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFuLJ-00H0p0-2o;
	Wed, 20 Dec 2023 11:02:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703070144;
	bh=SislEKrbcBCyeF1cvA7sktZWbgCq5DooZegn8jxygCM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=2hTYVkq2uP3CruHjaY/H/vSbxgKxgARWX/amioDU5W2RFfbRDpG9XU9BswCMc1PBc
	 tM1Uz7hL0ZkjoKD540e4fh/aEdpdF4jvskIOAfMN11BDUKzApZFLXAuV7QYFvKvEqL
	 Y8vDEfIdriVZiiCqCwWTnd2OKcC5FcNDCSnC3YQHvjPoejeSLRbSbLc9pgk8naiUB5
	 ifehch5ldnba6WoqCVjVCMBgSHQmtGmdmG7AqwsjqkpjNqx3Cr/hs16i8Oz5KJNyw5
	 7P6ASVqW1PdSogJuIGUF1v6R1fGqAkOvnKs8oKxS7G7+5ZnLrSc/0EdaifW8KoQ0mm
	 jPtUyVV1bTfig==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B76663781FC9;
	Wed, 20 Dec 2023 11:02:23 +0000 (UTC)
Message-ID: <80b61d00-ac87-4880-a535-0a5fdd3bed83@collabora.com>
Date: Wed, 20 Dec 2023 12:02:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] nvmem: mtk-efuse: Modify driver for getting chip
 information
Content-Language: en-US
To: William-tw Lin <william-tw.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231220103901.22180-1-william-tw.lin@mediatek.com>
 <20231220103901.22180-4-william-tw.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231220103901.22180-4-william-tw.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_030226_063388_E53CB84E 
X-CRM114-Status: GOOD (  21.46  )
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

Il 20/12/23 11:39, William-tw Lin ha scritto:
> Retrieval of soc info is needed. This patch includes the following:
> 1. Register socinfo device in mtk-efuse.c
> 

nvmem: mtk-efuse: Register MediaTek socinfo driver from efuse

The socinfo driver reads chip information from eFuses and does not need
any devicetree node. Register it from mtk-efuse.

While at it, also add the name for this driver's nvmem_config.


^^^ that's a proper commit title and description :-)

> Signed-off-by: William-tw Lin <william-tw.lin@mediatek.com>
> ---
>   drivers/nvmem/mtk-efuse.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> index 84f05b40a411..3914e039e288 100644
> --- a/drivers/nvmem/mtk-efuse.c
> +++ b/drivers/nvmem/mtk-efuse.c
> @@ -68,6 +68,7 @@ static int mtk_efuse_probe(struct platform_device *pdev)
>   	struct nvmem_config econfig = {};
>   	struct mtk_efuse_priv *priv;
>   	const struct mtk_efuse_pdata *pdata;
> +	struct platform_device *socinfo;
>   
>   	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>   	if (!priv)
> @@ -85,11 +86,19 @@ static int mtk_efuse_probe(struct platform_device *pdev)
>   	econfig.size = resource_size(res);
>   	econfig.priv = priv;
>   	econfig.dev = dev;
> +	econfig.name = "mtk-efuse";
>   	if (pdata->uses_post_processing)
>   		econfig.fixup_dt_cell_info = &mtk_efuse_fixup_dt_cell_info;
>   	nvmem = devm_nvmem_register(dev, &econfig);
> +	if (IS_ERR(nvmem))
> +		return PTR_ERR(nvmem);
>   
> -	return PTR_ERR_OR_ZERO(nvmem);
> +	socinfo = platform_device_register_data(&pdev->dev, "mtk-socinfo",
> +						PLATFORM_DEVID_AUTO, NULL, 0);
> +	if (IS_ERR(socinfo))
> +		dev_info(dev, "MediaTek SoC Information will be unavailable\n");
> +

	if (IS_ERR(socinfo))
		dev_info(dev, "MediaTek SoC Information will be unavailable\n");

	platform_set_drvdata(pdev, socinfo);
	return 0;

> +	return 0;
>   }
>   
>   static const struct mtk_efuse_pdata mtk_mt8186_efuse_pdata = {


static void mtk_efuse_remove(struct platform_device *pdev)
{
	struct platform_device *socinfo = platform_get_drvdata(pdev);

	if (!IS_ERR_OR_NULL(socinfo))
		platform_device_unregister(socinfo);
}

static struct platform_driver mtk_efuse_driver = {
	.probe = mtk_efuse_probe,
	.remove_new = mtk_efuse_remove, <---- add this
	.driver = {
		.name = "mediatek,efuse",
		.of_match_table = mtk_efuse_of_match,
	}
};

After those additions, it's good for me.

Thanks,
Angelo

