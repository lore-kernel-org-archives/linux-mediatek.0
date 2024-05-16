Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0431C25B74
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 May 2024 10:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HEU+LgmmgDVyOfKi+zsItewHaYSNavSa9EUs7P2UYn4=; b=EDv589vV90fI4pCBYl2bNvFri2
	sZ2cnM+UMJtpA6vxwTHi0DdzGV9ckmI3PqKTsNHcqeF12ZY/Iu3E0NvYXZSTWHixCJIShVf+dWviC
	1kvJDEZGjW9yV7CLJ6yAz32FLZW8ac0EqWpItpCA2YHdL42WfuRE7a9Jm9aOqhECuWlC9gWxu3Op1
	x7P5clTBiXoBjdC6PdBYov8CQcC35pNu//YUel2AhOMeGt+OL8C2nid3B+NW0kHYNjkoDOlk/EXkR
	rI8Lm8PLF2KTUjRGhhLEkBPvTXENsqalV0YuBRLlPi7VvEg5eED0zATZgpI09FhXlSbUb4/sHoFCk
	hROtwEqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Y4P-00000004RAt-49i1;
	Thu, 16 May 2024 10:10:41 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Y4M-00000004RAB-1kMw;
	Thu, 16 May 2024 10:10:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715854237;
	bh=ugAWDM1qcmrWTtKMSTkkvc0MnR1N8NG07aVhZyc9Avw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ofNxsnreO1XE/kyXC7ZuR3rY6V4IutCD9oOaUATenbvbQsjVohi9FgRTlITcOb9PZ
	 dNnJPWBBR4z18EGOqiPm1gF1E+VvieBbt4bFQAVqyX7UewABZnh1SsuxxMtpIE3piP
	 qpfXmqZdlGzgC2/IpnR1n3PxjbrI9hx0f/q1BWYpvhaIH4FlDLto4UEYIzyZDhp4Yh
	 2i5McbxDiyUGAkfk2H4sn/dwIx531RWun2FaJjDjVvJmAHQxHwssYJYGsGwv181f//
	 WPFGDeUzq/0Kb45dPjOFyVyT+t/fgwObBv9y5JFs1zIZZPvvwyvvDb1pHQcRlowEbi
	 9ZopzBNxptJ/w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1D90C3780C13;
	Thu, 16 May 2024 10:10:36 +0000 (UTC)
Message-ID: <f9e09d27-4e28-4ed9-95a5-66c8dba6d499@collabora.com>
Date: Thu, 16 May 2024 12:10:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: ethernet: mtk_eth_soc: add missing check
 for rhashtable_init
To: Chen Ni <nichen@iscas.ac.cn>, nbd@nbd.name, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240516092427.3897322-1-nichen@iscas.ac.cn>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240516092427.3897322-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_031038_681073_5F3D4FB6 
X-CRM114-Status: GOOD (  16.25  )
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

Il 16/05/24 11:24, Chen Ni ha scritto:
> Add check for the return value of rhashtable_init() and return the error
> if it fails in order to catch the error.
> 
> Fixes: 33fc42de3327 ("net: ethernet: mtk_eth_soc: support creating mac address based offload entries")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>   drivers/net/ethernet/mediatek/mtk_ppe.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
> index 0acee405a749..f7e5e6e52cdf 100644
> --- a/drivers/net/ethernet/mediatek/mtk_ppe.c
> +++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
> @@ -884,12 +884,15 @@ struct mtk_ppe *mtk_ppe_init(struct mtk_eth *eth, void __iomem *base, int index)
>   	struct mtk_ppe *ppe;
>   	u32 foe_flow_size;
>   	void *foe;
> +	int ret;
>   
>   	ppe = devm_kzalloc(dev, sizeof(*ppe), GFP_KERNEL);
>   	if (!ppe)
>   		return NULL;
>   
> -	rhashtable_init(&ppe->l2_flows, &mtk_flow_l2_ht_params);
> +	ret = rhashtable_init(&ppe->l2_flows, &mtk_flow_l2_ht_params);
> +	if (ret)
> +		return NULL;

return PTR_ERR(ret);

..then in mtk_eth_soc.c, you will have to fix the check:
			if (!eth->ppe[i]) {

to IS_ERR_OR_NULL( ... )

Cheers,
Angelo

>   
>   	/* need to allocate a separate device, since it PPE DMA access is
>   	 * not coherent.



