Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8C7C48BF6
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Mar 2024 11:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QmKyHMZR7wrNWPvO0paIqA+LLrOahggQb4Qz1CB3MXU=; b=fHwWun6AWYiqU5Xd8+VL/glblW
	61lgXZ0kcKwwG1VaBymOi6UvUqmvJbA40XeSYUqbuF5AopQDwsk+SkZXzXmazmZ99cfPl4b6NJSKn
	5qyGCUqKvL6flRfjo6cB2ij+ZwqGydLgmNPXYrm8peyliohinhgTv0KmYQv9dBzeMVp4BicDtsCn5
	S8hCHHDr5U9NwHyaZpQ5ypGZp3ZoCOpDBD8INAf0hL37KAiBxiLkr0yaCqCKdCqb5THBKCpnVt7lK
	kb1TASZnuYjc7Jevl2xD0XK2Vo277Tr5qKjgjaD37J3zZTx+oZY6jnjejWypVEJq+D2NrY1LbBWLf
	esV2woTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh6b7-00000008q5S-0DQa;
	Mon, 04 Mar 2024 11:35:09 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5Ct-00000008XA9-1qVM;
	Mon, 04 Mar 2024 10:06:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709546757;
	bh=RWN2Ea3qOUjs6zLtAAXLBFQstrOSR//0aV6xqRJRRoM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GqrZRx2uqquFaYJnQ+ZQZ4Z5duNI4garPorJYbWGIcwBXVtikqwGmsSv+TSPAg24/
	 RXtRy6utMLXjpXYUgoqYIi3/d9O+yDEDdapjK8iyOOQWm95lkCw9vP+pqVAYSvaQD8
	 2MeMrgwT075yFyFqbgrhlhUourXnkm0DYcWti2SKsj7qwmwpzr5NkdzCU723O1qGkl
	 hsm+FVUUP+eKRI3nVfLaQw+qnAQ2d+V7KV28h+QT9kSsPpO37FbQ9Z+39g4eJeebS6
	 BZl01pEvqkNz72VepmGyH3Z82Mge3rfc4KlUMUxuOyG3FMtsearuwQFdR9Dq5xmou0
	 Zf8TRylfj2Qtw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D61573782091;
	Mon,  4 Mar 2024 10:05:56 +0000 (UTC)
Message-ID: <3dab3afd-7d0c-4bf1-b4f6-984f8d5d2d02@collabora.com>
Date: Mon, 4 Mar 2024 11:05:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] soc: mediatek: mtk-cmdq: Add cmdq_pkt_acquire_event()
 function
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240301111126.22035-1-jason-jh.lin@mediatek.com>
 <20240301111126.22035-5-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240301111126.22035-5-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_020607_820989_92C1F296 
X-CRM114-Status: GOOD (  19.29  )
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

Il 01/03/24 12:11, Jason-JH.Lin ha scritto:
> Add cmdq_pkt_acquire_event() function to support CMDQ user making
> an instruction for acquiring event.
> 
> CMDQ users can use cmdq_pkt_acquire_event() and cmdq_pkt_clear_event()
> to acquire GCE event and release GCE event and achieve the MUTEX_LOCK
> protection between GCE threads.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Change-Id: Icdae6b60345c7ec1d7541ac76d1f06da56959cde

Drop Change-Id please.

> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c | 15 +++++++++++++++
>   include/linux/soc/mediatek/mtk-cmdq.h  |  9 +++++++++
>   2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 2e9fc9bb1183..0183b40a0eff 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -342,6 +342,21 @@ int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear)
>   }
>   EXPORT_SYMBOL(cmdq_pkt_wfe);
>   
> +int cmdq_pkt_acquire_event(struct cmdq_pkt *pkt, u16 event)
> +{
> +	struct cmdq_instruction inst = {};
> +
> +	if (event >= CMDQ_MAX_EVENT)
> +		return -EINVAL;
> +
> +	inst.op = CMDQ_CODE_WFE;
> +	inst.value = CMDQ_WFE_UPDATE | CMDQ_WFE_UPDATE_VALUE | CMDQ_WFE_WAIT;
> +	inst.event = event;
> +
> +	return cmdq_pkt_append_command(pkt, inst);
> +}
> +EXPORT_SYMBOL(cmdq_pkt_acquire_event);
> +
>   int cmdq_pkt_clear_event(struct cmdq_pkt *pkt, u16 event)
>   {
>   	struct cmdq_instruction inst = { {0} };
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index 2fe9be240fbc..de93c0a8e8a9 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -202,6 +202,15 @@ int cmdq_pkt_mem_move(struct cmdq_pkt *pkt, dma_addr_t src_addr, dma_addr_t dst_
>    */
>   int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear);
>   
> +/**
> + * cmdq_pkt_acquire_event() - append acquire event command to the CMDQ packet
> + * @pkt:	the CMDQ packet
> + * @event:	the desired event to be acquired

What you wrote in the commit message is good documentation for this function,
please also put it here in kerneldoc format as a documentation paragraph.

> + *
> + * Return: 0 for success; else the error code is returned
> + */
> +int cmdq_pkt_acquire_event(struct cmdq_pkt *pkt, u16 event);
> +
>   /**
>    * cmdq_pkt_clear_event() - append clear event command to the CMDQ packet
>    * @pkt:	the CMDQ packet


