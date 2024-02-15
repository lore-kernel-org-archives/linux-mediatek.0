Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AE7C48BF1
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 10:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6sH1/SHCBvTxlwyGS5Fy4oqCpvnJ4WM8CLYAlZFwYpc=; b=rHdRcXLU0uRIAC6ciNJhmEvPxS
	Qy2no7CLAXTEE9YATU/pMKb5NppOdFtDnC/U3yAAsB9RtOUmkmStRL8eadUCguduCBs2tVIKRZ4NP
	XQKp6A9WnN/dNzwmgWmT/BUV0BLDC818dYiUtR5cKBkOwqLmSregIOjstvxJLA4eYXeDGsMO3hvX1
	I/qYj/zlbd1LBUuDr3Ewg58EQXIc7hNCT0NM/ynmPaXEzBAOF2woW5dq07iOcC+wKfefU9utnf95V
	19LkT7fa4NeMAEqKpIE8sqKGMBNPu31DjEZctZF2NpeENR0nQNj+gTyaXxKJLvprmyYeZmKNV7BpO
	C+MPmQww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZAl-0000000FpHn-2bks;
	Thu, 15 Feb 2024 10:40:55 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZAb-0000000Fp9A-38w7;
	Thu, 15 Feb 2024 10:40:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707993644;
	bh=CwvRGrbcZZ5Od6h/Tep6iTYxKSkQs10plfNFyaPZ33c=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=hWyFocqbH4mr/y++9uGkUayXVp39ZRe+nLhMFDLlE3qidpdwY85STrDOgEto1LllY
	 gjlI4JecZToT5aQEjmrhC9FK86HLP68SNWBXn5jsgdlOKzwJyclbV5CQ1DhdaGf62F
	 kz79/3p0c37c5R8kFXyNH4g1XqOpBAthPoIuZ/0TPqhQVUcHtkralu2bIFL5awRJpo
	 FvAgNzPPUb9P/+WWU7TaqWrHxZoWikIPhO6lkAJbxBBkCViPd6lRV7HO02od237r+u
	 L5p7GXBDejV43LIVJIM2G3Z33UQ/lm2ktU55yEbIzzH7B3jS1CJHsxbc0vsjA6lgcS
	 1pW2VtTbItWeQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E6C843780FC7;
	Thu, 15 Feb 2024 10:40:43 +0000 (UTC)
Message-ID: <1821c17e-6a40-4d1a-bc5a-06e8dd944456@collabora.com>
Date: Thu, 15 Feb 2024 11:40:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] soc: mediatek: cmdq: Add cmdq_pkt_eoc() helper
 function
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20240215004931.3808-1-chunkuang.hu@kernel.org>
 <20240215004931.3808-4-chunkuang.hu@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240215004931.3808-4-chunkuang.hu@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_024046_117758_B200DDF3 
X-CRM114-Status: GOOD (  18.44  )
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

Il 15/02/24 01:49, Chun-Kuang Hu ha scritto:
> cmdq_pkt_eoc() append eoc command to CMDQ packet. eoc command
> would ask GCE to generate IRQ. It's usually appended to the end
> of packet to notify all command in the packet is done.
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c | 10 ++++++++++
>   include/linux/soc/mediatek/mtk-cmdq.h  | 15 +++++++++++++++
>   2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index ed4ef95adf5b..e982997117c2 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -359,6 +359,16 @@ int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
>   }
>   EXPORT_SYMBOL(cmdq_pkt_jump);
>   
> +int cmdq_pkt_eoc(struct cmdq_pkt *pkt)
> +{
> +	struct cmdq_instruction inst = { {0} };
> +
> +	inst.op = CMDQ_CODE_EOC;
> +	inst.value = CMDQ_EOC_IRQ_EN;
> +	return cmdq_pkt_append_command(pkt, inst);
> +}
> +EXPORT_SYMBOL(cmdq_pkt_eoc);
> +
>   int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
>   {
>   	struct cmdq_instruction inst = { {0} };
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index 6215191a328d..a67f719dec0b 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -245,6 +245,16 @@ int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value);
>    */
>   int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa);
>   
> +/**
> + * cmdq_pkt_eoc() - Append eoc command to the CMDQ packet, ask GCE
> + *		    to generate IRQ. It's usually appended to the end of
> + *		    packet to notify that all command in the packet is done.
> + * @pkt:	the CMDQ packet
> + *
> + * Return: 0 for success; else the error code is returned

/**
  * cmdq_pkt_eoc() - Append EOC and ask GCE to generate an IRQ at end of execution
  * @pkt:	The CMDQ packet
  *
  * Appends an End Of Code (EOC) command to the CMDQ packet and asks the GCE
  * to generate an interrupt at the end of the execution of all commands in
  * the pipeline.
  * The EOC command is usually appended to the end of the pipeline to notify
  * that all commands are done.
  *
  * Return: 0 for success or negative error number
  */

Apart from that,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> + */
> +int cmdq_pkt_eoc(struct cmdq_pkt *pkt);
> +
>   /**
>    * cmdq_pkt_finalize() - Append EOC and jump command to pkt.
>    * @pkt:	the CMDQ packet
> @@ -346,6 +356,11 @@ static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_
>   	return -EINVAL;
>   }
>   
> +static inline int cmdq_pkt_eoc(struct cmdq_pkt *pkt)
> +{
> +	return -EINVAL;
> +}
> +
>   static inline int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
>   {
>   	return -EINVAL;


