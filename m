Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50EFEC4829E
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 10:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LmyOTHwU0hKVK9JMXA+iFr4gGxTOjILqBerZPzLlmnM=; b=p3B1MWmY7a/F10e1xAOLmT/GlX
	G6WeNZu6PfmmrwVNKyiloUVNXhHht2D47IOcwHxO1kOUK298QwLc5dPsdmTu7yT+9G0ns5q2UY+4m
	PgSZGht96rf9fm/Y3rCFDSGWyD/q17o97LWLpc7vlNoElx6ia5iAJqWlX3XsqdXvgH0UKL4lAN1Cg
	K5hW6CysaBsfDZEWaztAmvg2FW7lD5dNy1DUWes/lMgvQXfEpBHSaCJcBbzRfq5n1zrvC/AqoZP5q
	sthMBmn7D6ZXClOwD6TkBVMGi9EWW0E+dgcAfIKpNVO60Kha2q32CevLGrPRS5+gHmGVP3KOI5o98
	GTBYQk1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZAw-0000000FpRe-24l4;
	Thu, 15 Feb 2024 10:41:06 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZAj-0000000FpFR-3u8c;
	Thu, 15 Feb 2024 10:40:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707993652;
	bh=5wcOrmWAdm8TpcUI51bhbt1tBGqjQwvGwURuQv6OC9E=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=tORbjEKozUXgDVSjisgTfnm0szQ4Ks63i5wjFUPknRP0oqD85lAO5FCeS3tw0+Zkk
	 mYDHyFv15I2FqeSYc1C4X1EPicF7PIyVoZy0sfIqsha9T3/genKmlJAfVB1OBxPwSl
	 zE0f/X1QNjC5Sk6FMeBTBvGKqz+CGs+MTZsY0PNflkCz10o9yDNhr1zxuLXabYy445
	 EMYoQSD4pvHP5Uwaf6unpAlX2FBinyZQ4tYo+w5ZsIHCR42xfrNR26vNX45drWYEG6
	 oHUjxmGhAz5gAId3lNZTKTGDkCAhUV3ocSjDuGSYjdYlZicE91WKovSA0X6UjrJR5K
	 ueEYntvmlGqVw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2C6AD3780FC7;
	Thu, 15 Feb 2024 10:40:52 +0000 (UTC)
Message-ID: <21d17701-e40b-49c5-bf16-5e70a6daa2c4@collabora.com>
Date: Thu, 15 Feb 2024 11:40:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] soc: mediatek: cmdq: Add parameter shift_pa to
 cmdq_pkt_jump()
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20240215004931.3808-1-chunkuang.hu@kernel.org>
 <20240215004931.3808-3-chunkuang.hu@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240215004931.3808-3-chunkuang.hu@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_024054_265703_9DFBA9C7 
X-CRM114-Status: GOOD (  18.12  )
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
> In original design, cmdq_pkt_jump() call cmdq_get_shift_pa() every
> time to get shift_pa. But the shift_pa is constant value for each
> SoC, so client driver just need to call cmdq_get_shift_pa() once
> and pass shift_pa to cmdq_pkt_jump() to prevent frequent function
> call.
> 

As far as I understand, the CMDQ supports both relative and absolute jumps, right?

Here's my proposal:
  - Add a new function cmdq_pkt_jump_rel() or cmdq_pkt_jump_relative()
    * note: I prefer "rel", as maybe in a future we'll get a jump_abs function? :-)
  - Don't touch the cmdq_pkt_jump() function for one cycle
    - Migrate mediatek-drm to use cmdq_pkt_jump_rel()
  - Remove cmdq_pkt_jump() in the next cycle.

What do you think?

Regards,
Angelo

> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c | 5 ++---
>   include/linux/soc/mediatek/mtk-cmdq.h  | 6 ++++--
>   2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 67e17974d1e6..ed4ef95adf5b 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -348,14 +348,13 @@ int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
>   }
>   EXPORT_SYMBOL(cmdq_pkt_assign);
>   
> -int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr)
> +int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
>   {
>   	struct cmdq_instruction inst = {};
>   
>   	inst.op = CMDQ_CODE_JUMP;
>   	inst.offset = CMDQ_JUMP_RELATIVE;
> -	inst.value = addr >>
> -		cmdq_get_shift_pa(((struct cmdq_client *)pkt->cl)->chan);
> +	inst.value = addr >> shift_pa;
>   	return cmdq_pkt_append_command(pkt, inst);
>   }
>   EXPORT_SYMBOL(cmdq_pkt_jump);
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index 6c42d817d368..6215191a328d 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -238,10 +238,12 @@ int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value);
>    *		     a physical address which should contains more instruction.
>    * @pkt:        the CMDQ packet
>    * @addr:       physical address of target instruction buffer
> + * @shift_pa:	shift bits of physical address in CMDQ instruction. This value
> + *		is got by cmdq_get_shift_pa().
>    *
>    * Return: 0 for success; else the error code is returned
>    */
> -int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr);
> +int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa);
>   
>   /**
>    * cmdq_pkt_finalize() - Append EOC and jump command to pkt.
> @@ -339,7 +341,7 @@ static inline int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
>   	return -EINVAL;
>   }
>   
> -static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr)
> +static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
>   {
>   	return -EINVAL;
>   }




