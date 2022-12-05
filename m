Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E11BC4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 14:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nkwXc5TZxNX4tMRMWwSNEu1Rwmgz9VXzJQtbNYVfltc=; b=hLtBWKMNuzXdJWGc4qmqdtdAMy
	K41MLNczcsUvPwyVQBBfrCp/+DzPgApotob57/SLLM7FEKVRg5T6SYiAeCDzZTMyZKuan86I2YEkL
	xKJ6SqPr6RrGQ2u86tMh3uRNRucR58WFrCeDRMlg4c1xnLmbtb4szR6WOjnYyRlRVE6xN+/lb1RQN
	lpBqjbF5VRa1bejkLc0iVBeVRvpkH1eAsRSZrx6V+xS0IuT39aarv8pDyQHL7nm3WsEXSMkMaDhmd
	sdcwsp7dK7tpdcT0c8UCIpMeG4U68GEHYj7iAxbZ8XbqLAPqpt7u88x2jOiQIFWeWnq2mfzNruYSZ
	cUElRxCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2C2T-003lYy-6l; Mon, 05 Dec 2022 14:01:45 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2C2I-003lVo-U8; Mon, 05 Dec 2022 14:01:36 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7EAA96601E6A;
	Mon,  5 Dec 2022 14:01:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670248891;
	bh=rC8AWaMkj6jL9tBLy544uoByGzNsAgwTTbsHvW13wjY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DoKLkzE55yiXld463vrqnTy6JekyIpCZK77Vei8mWx0Yjqzf2Coi+F6FzRculJICZ
	 peLeplcOYdUHEpbSUDS9SAg/PZJ5kjI9PB1hkZeKJEwhnskwzhF9A2p+Ho+0MK1S3Z
	 BlMyui0tZe8vx8lXPeF+SuauD7rPsuCqIQXOGQc97bAoSdnX7ntJXqoF/6RO7rGwCA
	 znYLcSGAyok4Bgh/1fWBZOWTk2MKRjv4+2dIZsNTM33+GrjYJGiKZ3HjR9phXnmD7X
	 SVFkrQKYNF2mw5RehbBt7BciLhiouLV3SCSVQo7Tu3u1gG57gDcP3s6tiZX8yz1Pey
	 EdxJkM1c9JS4g==
Message-ID: <d5bcc6aa-bdb5-9705-a7dd-79a276f4ea01@collabora.com>
Date: Mon, 5 Dec 2022 15:01:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1] spi: spi-mtk-nor: Add recovery mechanism for dma read
 timeout
Content-Language: en-US
To: Bayi Cheng <bayi.cheng@mediatek.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ikjoon Jang <ikjn@chromium.org>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chuanhong Guo <gch981213@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221205082419.29170-1-bayi.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221205082419.29170-1-bayi.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_060135_213309_B0E8E242 
X-CRM114-Status: GOOD (  22.56  )
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

Il 05/12/22 09:24, Bayi Cheng ha scritto:
> From: bayi cheng <bayi.cheng@mediatek.com>
> 
> The state machine of MTK spi nor controller may be disturbed by some
> glitch signals from the relevant BUS during dma read, Although the
> possibility of causing the dma read to fail is next to nothing,
> However, if error-handling is not implemented, which makes the feature
> somewhat risky.
> 
> Add an error-handling mechanism here, reset the state machine and
> re-read the data when an error occurs.
> 
> Signed-off-by: bayi cheng <bayi.cheng@mediatek.com>
> ---
> Change in v1:
>    -Reset the state machine when dma read fails and read again.
> ---
> ---
>   drivers/spi/spi-mtk-nor.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
> index d167699a1a96..c77d79da9a4c 100644
> --- a/drivers/spi/spi-mtk-nor.c
> +++ b/drivers/spi/spi-mtk-nor.c
> @@ -80,6 +80,9 @@
>   #define MTK_NOR_REG_DMA_FADR		0x71c
>   #define MTK_NOR_REG_DMA_DADR		0x720
>   #define MTK_NOR_REG_DMA_END_DADR	0x724
> +#define MTK_NOR_REG_CG_DIS		0x728
> +#define MTK_NOR_SFC_SW_RST		BIT(2)
> +
>   #define MTK_NOR_REG_DMA_DADR_HB		0x738
>   #define MTK_NOR_REG_DMA_END_DADR_HB	0x73c
>   
> @@ -616,7 +619,18 @@ static int mtk_nor_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
>   			mtk_nor_set_addr(sp, op);
>   			return mtk_nor_read_pio(sp, op);
>   		} else {
> -			return mtk_nor_read_dma(sp, op);
> +			ret = mtk_nor_read_dma(sp, op);
> +			if (ret) {
> +				dev_err(sp->dev, "try to read again\n");
> +				mtk_nor_rmw(sp, MTK_NOR_REG_CG_DIS, 0, MTK_NOR_SFC_SW_RST);
> +				mb(); /* flush previous writes */
> +				mtk_nor_rmw(sp, MTK_NOR_REG_CG_DIS, MTK_NOR_SFC_SW_RST, 0);
> +				mb(); /* flush previous writes */
> +				writel(MTK_NOR_ENABLE_SF_CMD, sp->base + MTK_NOR_REG_WP);

 From what I understand, you're introducing a way to perform a flush+reset on
the controller.

At this point, I'd put that in a separate function like `mtk_nor_reset()`, as
to both increase readability and to possibly reuse it somewhere else in the
future, if needed.

So this would become...

		} else {
			ret = mtk_nor_read_dma(sp, op);
			if (unlikely(ret)) {
				/* Handle rare bus glitch */
				mtk_nor_reset(sp);
				mtk_nor_setup_bus(sp, op);
				return mtk_nor_read_dma(sp, op);
			}
			return ret;
		}

...or something alike :-)

Regards,
Angelo


