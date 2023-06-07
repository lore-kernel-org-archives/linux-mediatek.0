Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6862BC7EE23
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 07:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r7trNr0Ema86Rjx0WiKww+9mY0Izu55U1dJAyfFt4Fk=; b=0fPPzMFvwlkqg6AYEpE1wSnAxR
	M6yKO3Yn2NOooigaYNMXOHUgUcC+2SW1qBD8QOiy9H3ffFfOzQbdiKsfFBpOTqk4lq1fJ2DQ0mQSz
	MGhoMe6jn4KnZXz5Aoi/rUhqhi67uQ4ANS3GCh9ypi8b4fw17Z5DFXH4KXoRw1pR05rjRmhYorjFH
	Kqgc8MnbDclsxXqgGq/hrdD9TaPW3rMKpc9jtd5gUJZN8vK59zxEZNuPA07eHkFjOWD0iUe5myemu
	/H6kS3h/IODmq814DCIEcs4zsJnxglRZND0+vKOXMIhHXhhTRqQKNOa/6svWcZ4usEyeAk5BVaEh4
	g7/DQCjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6nvI-004o7x-1g;
	Wed, 07 Jun 2023 07:49:40 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6nvF-004o6e-0H;
	Wed, 07 Jun 2023 07:49:38 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1FA686606EF8;
	Wed,  7 Jun 2023 08:49:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686124175;
	bh=btdp22YPcE4rcsqawF/Dzg9wpsgaMB/+rd1QkI94JJs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YB4veNFvvKChhZJyxJdNkRiWGLv0BqdmQ2Jvm3MluU20wVsRbStjIAdp0YBsMIO1s
	 UAmp5RRx0zee1Mj5aSasJlPssCpjLjs36+rwXH6g8L8h725EaOR+7J5o87rtgtNfSV
	 p5Q6Vt6RVOkxeMQMju4jD81D56lvNb3FjvN7P+QAko0nbMF5plJk1JnYRgJx83+q7R
	 jZtzKDNObC0D6o4zdZKJQNqiJTzFcoYhVJCTOVC5JRqoYPJn+oWMK45ykvmlYpZKC2
	 z3dfrTXRMsUYW1edEUalyb/rpyZa4V932lwbR6M8ZJNdmXyps6tLE1NE1Jn9CgAWGQ
	 uJytNuNohHNnw==
Message-ID: <3024a2a8-8e64-dfab-a9a3-0d4f51b345d9@collabora.com>
Date: Wed, 7 Jun 2023 09:49:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v13 07/11] remoteproc: mediatek: Add scp_boot_peers and
 scp_shutdown_peers operations
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
 <20230607072222.8628-8-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230607072222.8628-8-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_004937_255827_D5E511D2 
X-CRM114-Status: GOOD (  16.57  )
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
> Due to that SCP core 0 controls the SCP clock and SRAM power, add two
> new mtk_scp_of_data operations, scp_boot_peers and scp_shutdown_peers,
> to manage the boot sequence and watchdog timeout handling of SCP core 1.
> It ensures that core 1 boots after or shuts down before core 0 for
> maintaining the proper control flow over SCP core 1.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>   drivers/remoteproc/mtk_common.h |  3 ++
>   drivers/remoteproc/mtk_scp.c    | 55 +++++++++++++++++++++++++++++++++
>   2 files changed, 58 insertions(+)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index 56395e8664cb..0bfd242c41cc 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -93,6 +93,8 @@ struct mtk_scp_of_data {
>   	void (*scp_reset_deassert)(struct mtk_scp *scp);
>   	void (*scp_stop)(struct mtk_scp *scp);
>   	void *(*scp_da_to_va)(struct mtk_scp *scp, u64 da, size_t len);
> +	void (*scp_boot_peers)(struct mtk_scp *scp);
> +	void (*scp_shutdown_peers)(struct mtk_scp *scp);
>   
>   	u32 host_to_scp_reg;
>   	u32 host_to_scp_int_bit;
> @@ -130,6 +132,7 @@ struct mtk_scp {
>   	struct rproc_subdev *rpmsg_subdev;
>   
>   	struct list_head elem;
> +	struct list_head *cluster;
>   };
>   
>   /**
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index d644e232dfec..edbf71f4c21e 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -74,8 +74,21 @@ void scp_put(struct mtk_scp *scp)
>   }
>   EXPORT_SYMBOL_GPL(scp_put);
>   
> +static void mt8195_scp_shutdown_peers(struct mtk_scp *scp)
> +{
> +	struct mtk_scp *next_scp;
> +
> +	next_scp = list_next_entry(scp, elem);
> +	list_for_each_entry_from(next_scp, scp->cluster, elem) {
> +		rproc_shutdown(next_scp->rproc);
> +	}

braces are not needed here; after fixing that,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



