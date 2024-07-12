Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5C6C2BD09
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jul 2024 08:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dCnFlC96bv6u7tzKPXUgEpdia7IIII4EtYFsLjEUOGE=; b=yJz+LRZF9TG+5ywY2VVgDqQERg
	GYBPR9cYrJFtO0pY/9dLgXJgorJl1vY6mnCnlKcuUK0xNHYbj4Flr1FlSAqyW6lilBVqYy4rVXwPl
	byu81POhsFSfaptt2MaSvmEiiatuJQcfqBgJbO5PFSB7xZTT044Tk/QfGGt+9hT5mwBiY+FTUZloz
	aTEpYxA3xKRhqAOauBgMHwLSBbB2lSRd9We3PyFUAwHRGIqetANwYkiyhvb60Rh6ROpDvmSyBEwpx
	bnyeCv1CRfyxHCwY4GfM2LDYjJ2LetpYB/lNQc2gth1lPFTE+JVER5Fe4kq3ot6au7vyxpitLA/g+
	GW9xUVfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSBX0-0000000Gs8A-0kAB;
	Fri, 12 Jul 2024 08:21:30 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSBWg-0000000Gs2q-2TG3;
	Fri, 12 Jul 2024 08:21:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720772468;
	bh=UYd8B6nbv4Ic8XdLU0JyQpuWnMpczUrarlWTU56zvyw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ve9dDWD1aMPL0aCuq0X9Tw+Vhke0eUwIIUSRuo5vv6m6/8JSUbSBzvt7t8kj0Ljm7
	 E+8Z7c2wGe8gnXN1bOpDmUXd4p6Q611eDZyN2O65PAGn5LtfWSZK+revM4ypRIjH43
	 vq/ZcKQR1QuRDke5ZnK1jQJAwlAY8CfF3WNY3gily2fq3vTTflaN5vQyJPQFAMWRfj
	 eWshNOdFAEN/F5r08h8yvtoVvF2ov+TV0QaBn5I4u8Vd6RlSFZeCrYtUaoRSCUKwsO
	 gAyROsWj0CR9eJ36bgaOnt7GU4pQ1OHI7sLLNJG5/MH1IzV9F0koJSqHZRAstj568M
	 SjtfhGCIV7Bmw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EB48237821DB;
	Fri, 12 Jul 2024 08:21:07 +0000 (UTC)
Message-ID: <1b1231e5-cf10-4a26-8a62-311f4d8bcae9@collabora.com>
Date: Fri, 12 Jul 2024 10:21:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] remoteproc: mediatek: Support multiple reserved
 memory regions
To: Shun-yi Wang <shun-yi.wang@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 jason-ch.chen@mediatek.com, yaya.chang@mediatek.com,
 teddy.chen@mediatek.com, olivia.wen@mediatek.com
References: <20240703115308.17436-1-shun-yi.wang@mediatek.com>
 <20240703115308.17436-2-shun-yi.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240703115308.17436-2-shun-yi.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_012110_797334_2B61D363 
X-CRM114-Status: GOOD (  17.37  )
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

Il 03/07/24 13:53, Shun-yi Wang ha scritto:
> From: "shun-yi.wang" <shun-yi.wang@mediatek.com>
> 
> SCP supports multiple reserved memory regions, intended for
> specific hardwards.
> 
> Signed-off-by: shun-yi.wang <shun-yi.wang@mediatek.com>
> ---
>   drivers/remoteproc/mtk_scp.c | 25 +++++++++++++++++--------
>   1 file changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 9ecd5ea04b5f3..1902826cea0af 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1006,22 +1006,31 @@ EXPORT_SYMBOL_GPL(scp_mapping_dm_addr);
>   
>   static int scp_map_memory_region(struct mtk_scp *scp)
>   {
> -	int ret;
> +	int ret, i, err;
>   	const struct mtk_scp_sizes_data *scp_sizes;
> +	struct device_node *node = scp->dev->of_node;
> +	struct of_phandle_iterator it;


	struct device_node *node = scp->dev->of_node;
  	const struct mtk_scp_sizes_data *scp_sizes;
	struct of_phandle_iterator it;
	int i = 0;
	int ret;

	of_for_each_phandle(&it, ret, node, "memory-region", NULL, 0) {
		ret = ...
		if (ret) .....
		i++;
	}

> +
> +	i = 0;
> +	of_for_each_phandle(&it, err, node, "memory-region", NULL, 0) {
> +		ret = of_reserved_mem_device_init_by_idx(scp->dev, node, i);
> +
> +		if (ret) {
> +			dev_err(scp->dev, "failed to assign memory-region: %s\n",
> +				it.node->name);
> +			of_node_put(it.node);
> +			return -ENOMEM;
> +		}
>   
> -	ret = of_reserved_mem_device_init(scp->dev);
> +		i++;
> +	}
>   
>   	/* reserved memory is optional. */
> -	if (ret == -ENODEV) {
> +	if (!i) {

	if (i == 0) {
		dev_dbg(scp->dev, "skipping reserved memory initialization\n");
		return 0;
	}


Regards,
Angelo



