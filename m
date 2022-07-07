Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34CBC43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 08:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lOpYsWn6BHAdr6d2V0UZ84NtHlacZqlpB4Ny7C4sz8M=; b=NttNggp4jmRfAEkM1gRLVXq89n
	VEi7jRm42xpn0tk0Q9oYloj7ndap8r868zWYJCOWjELRkny4Lj2+ZdJ+rOhnz4/1QQIr7zbinmjaH
	aDvV2nfyQUQlbSnB9Dg7TxCKjuuRFpArPgmPM/dQTlMjy2UBlu71wulBNTfPPUYoNm8sGzXl1GDtg
	6lDMyquVr6taxSVI73l0u5BggZgUhAOenrinXJmh2OIZpUcFXpxffmHwZ7AhTAuLekB5UlDiYPz3Q
	C2NWPY5dUXr+YaU8f1EUnUgMmzKj91cn/CD/EWfoCIO6x5pOqMtf0KAk80UXMfwROT8yAgxXZAPv8
	ZlWT2Lng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9NF6-00FIcu-NK; Thu, 07 Jul 2022 08:52:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9NEu-00FIZa-G5; Thu, 07 Jul 2022 08:52:02 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 560266601978;
	Thu,  7 Jul 2022 09:51:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657183918;
	bh=IyCikbtsNty1uF4QF+ll1RScKAJAt+8wzCO+kWXeihc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ip24JOa4qpg3cLo8Ml/zL217c/7MnwMFfRXhT9Yst82z7ZBXaiITi+yUOo9y9MRdJ
	 eDMwQME2rpo1bM26yHi+aMyHERjkRYq92SHeuIwj1Q5kJVzbFZ+mU9+9IzRug2JUzc
	 Krf/BE9ilga/381HC1v8B4uAwyNceUjtSmPQ9eE5kmfQarU3izbZR8TYOii0vUVOmG
	 peg6x1gQu14frZ/X05V/juAkvi0fWk8uS7MtmeS0MQhPF7BDtUOX9Mt4FW+JfDn3NW
	 fI1fWXXri30CuqcKINQNAiIPavuQGNfBqB9cnwVifo8fCpNw4x0h5rGAGDOKyGtAfY
	 jRWCXSBOVSTvw==
Message-ID: <5f526e22-8cd9-b42a-3ba5-fb8988d34705@collabora.com>
Date: Thu, 7 Jul 2022 10:51:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] soc: mediatek: mutex: add mt8186 mutex mod settings
 for mdp3
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Xiandong Wang <xiandong.wang@mediatek.com>
References: <20220705122627.2273-1-allen-kh.cheng@mediatek.com>
 <20220705122627.2273-3-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220705122627.2273-3-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_015200_836613_4343D8EA 
X-CRM114-Status: GOOD (  17.07  )
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

Il 05/07/22 14:26, Allen-KH Cheng ha scritto:
> This patch adds mt8186 mutex mod settings for mdp3.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-mutex.c       | 23 +++++++++++++++++++++++
>   include/linux/soc/mediatek/mtk-mutex.h |  2 ++
>   2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index 2fd8318c3bdc..51fd0186d9b5 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -91,6 +91,15 @@
>   #define MT8183_MUTEX_MOD_MDP_AAL0		23
>   #define MT8183_MUTEX_MOD_MDP_CCORR0		24
>   
> +#define MT8186_MUTEX_MOD_MDP_RDMA0		0
> +#define MT8186_MUTEX_MOD_MDP_AAL0		2
> +#define MT8186_MUTEX_MOD_MDP_HDR0		4
> +#define MT8186_MUTEX_MOD_MDP_RSZ0		5
> +#define MT8186_MUTEX_MOD_MDP_RSZ1		6
> +#define MT8186_MUTEX_MOD_MDP_WROT0		7
> +#define MT8186_MUTEX_MOD_MDP_TDSHP0		9
> +#define MT8186_MUTEX_MOD_MDP_COLOR0		14
> +
>   #define MT8173_MUTEX_MOD_DISP_OVL0		11
>   #define MT8173_MUTEX_MOD_DISP_OVL1		12
>   #define MT8173_MUTEX_MOD_DISP_RDMA0		13
> @@ -324,6 +333,17 @@ static const unsigned int mt8186_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>   	[DDP_COMPONENT_RDMA1] = MT8186_MUTEX_MOD_DISP_RDMA1,
>   };
>   
> +static const unsigned int mt8186_mutex_table_mod[MUTEX_MOD_IDX_MAX] = {
> +	[MUTEX_MOD_IDX_MDP_RDMA0] = MT8186_MUTEX_MOD_MDP_RDMA0,
> +	[MUTEX_MOD_IDX_MDP_RSZ0] = MT8186_MUTEX_MOD_MDP_RSZ0,
> +	[MUTEX_MOD_IDX_MDP_RSZ1] = MT8186_MUTEX_MOD_MDP_RSZ1,
> +	[MUTEX_MOD_IDX_MDP_TDSHP0] = MT8186_MUTEX_MOD_MDP_TDSHP0,
> +	[MUTEX_MOD_IDX_MDP_WROT0] = MT8186_MUTEX_MOD_MDP_WROT0,
> +	[MUTEX_MOD_IDX_MDP_HDR0] = MT8186_MUTEX_MOD_MDP_HDR0,
> +	[MUTEX_MOD_IDX_MDP_AAL0] = MT8186_MUTEX_MOD_MDP_AAL0,
> +	[MUTEX_MOD_IDX_MDP_COLOR0] = MT8186_MUTEX_MOD_MDP_COLOR0,
> +};
> +
>   static const unsigned int mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>   	[DDP_COMPONENT_AAL0] = MT8192_MUTEX_MOD_DISP_AAL0,
>   	[DDP_COMPONENT_CCORR] = MT8192_MUTEX_MOD_DISP_CCORR0,
> @@ -463,6 +483,7 @@ static const struct mtk_mutex_data mt8186_mutex_driver_data = {
>   	.mutex_sof = mt8186_mutex_sof,
>   	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
>   	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
> +	.mutex_table_mod = mt8186_mutex_table_mod,
>   };
>   
>   static const struct mtk_mutex_data mt8192_mutex_driver_data = {
> @@ -816,6 +837,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
>   	  .data = &mt8183_mutex_driver_data},
>   	{ .compatible = "mediatek,mt8186-disp-mutex",
>   	  .data = &mt8186_mutex_driver_data},
> +	{ .compatible = "mediatek,mt8186-mdp3-mutex",

You don't need this entry, as mediatek,mt8186-disp-mutex already uses the same
driver data as this one.

Please drop that.

Everything else looks good.

> +	  .data = &mt8186_mutex_driver_data},
>   	{ .compatible = "mediatek,mt8192-disp-mutex",
>   	  .data = &mt8192_mutex_driver_data},
>   	{ .compatible = "mediatek,mt8195-disp-mutex",
> diff --git a/include/linux/soc/mediatek/mtk-mutex.h b/include/linux/soc/mediatek/mtk-mutex.h
> index a0f4f51a3b45..b335c2837cd8 100644
> --- a/include/linux/soc/mediatek/mtk-mutex.h
> +++ b/include/linux/soc/mediatek/mtk-mutex.h
> @@ -20,6 +20,8 @@ enum mtk_mutex_mod_index {
>   	MUTEX_MOD_IDX_MDP_WDMA,
>   	MUTEX_MOD_IDX_MDP_AAL0,
>   	MUTEX_MOD_IDX_MDP_CCORR0,
> +	MUTEX_MOD_IDX_MDP_HDR0,
> +	MUTEX_MOD_IDX_MDP_COLOR0,
>   
>   	MUTEX_MOD_IDX_MAX		/* ALWAYS keep at the end */
>   };
> 



