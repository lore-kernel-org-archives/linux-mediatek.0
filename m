Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92935C54E41
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Mar 2024 11:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+hp66j9++WZliCmwpp0zPELdiJp82Q+Ev10B3zAD8c=; b=vpjQNXUUUAhQaH1w2CgJpLj4F5
	CeXjYZKXmKyJ1XbGmMwxYfrg1S0cqJBn/vCoB5huKI3xsWIDKlHu645aRtzQAdWIUhz8lVTL2uye9
	stxYhBVKXBmWDSFo406wmly+NLg0kpNjWKfr/IaHhccwFHbZiV6sfT0SRJHP+H6c7w2IYm2D9Ir6M
	B6GsrvyCqWjz84jfkfHOenkfJpZsHNQLTF1IUs3Ak5vL/jibXe0xDNVPVDUhdt+RcF44/W1CWPfE6
	IVztwaaI5yAgbnYTbyPCU8ApV52CMbhdTEmxs/qhjc0IFXIbXejszyjNBFpSymwZu2nJSsm8cddBH
	S6GppzlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh6b7-00000008q5x-40IT;
	Mon, 04 Mar 2024 11:35:10 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5Ct-00000008X8w-1pJk;
	Mon, 04 Mar 2024 10:06:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709546750;
	bh=lEVGehSBFjA/oLsvuBM7tDdI4uNapzzSDtjugpkUM1E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u648iBALFnbEregncZZ5/ZV7XZFR61wPlXgXehGOrGlVtWgfP+paEkV89he4qoqLb
	 0lPbMaDLlnftYQWfPlqMnuioFJ4dnrD/UWsuI9C8Targm7H9+6WkIq0lac1odESx4o
	 +yGwu81yVrUkh9BoyfRdxYX/RivPa/3420rlBzS5d5qMgAnPXpZqL7rugIkBJJ1ZlC
	 zZd51qRCuThyQz86ag2om49x6hI3nsgbrxV6MX0cA6MPabE76+UIP7wQhZpXnzVcE1
	 rWqodqh6P3K5ssyJxKnQHbCwMmxGuJr67WsfV3/4WjDZcZZa5mam7T+XcH7Z3ficBq
	 bRid2umc47ZMw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BEA5837803EE;
	Mon,  4 Mar 2024 10:05:49 +0000 (UTC)
Message-ID: <41a2017f-5627-42fe-a624-642c3c47f436@collabora.com>
Date: Mon, 4 Mar 2024 11:05:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] soc: mediatek: mtk-cmdq: Add cmdq_pkt_mem_move()
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
 <20240301111126.22035-3-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240301111126.22035-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_020604_747370_3CF728FF 
X-CRM114-Status: GOOD (  18.62  )
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
> Add cmdq_pkt_mem_move() function to support CMDQ user making
> an instruction for moving a value from a source address to a
> destination address.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Change-Id: I0128db6a3412303fc6da61f8a57a0c08e0c0067e

Drop Change-id please

> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c | 26 ++++++++++++++++++++++++++
>   include/linux/soc/mediatek/mtk-cmdq.h  | 10 ++++++++++
>   2 files changed, 36 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index b0cd071c4719..3a1e47ad8a41 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -299,6 +299,32 @@ int cmdq_pkt_write_s_mask_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
>   }
>   EXPORT_SYMBOL(cmdq_pkt_write_s_mask_value);
>   
> +s32 cmdq_pkt_mem_move(struct cmdq_pkt *pkt, dma_addr_t src_addr, dma_addr_t dst_addr)
> +{
> +	s32 err;
> +	const u16 tmp_reg_idx = CMDQ_THR_SPR_IDX0;
> +	const u16 swap_reg_idx = CMDQ_THR_SPR_IDX1;

s32 err at the end please

> +
> +	/* read the value of src_addr into swap_reg_idx */
> +	err = cmdq_pkt_assign(pkt, tmp_reg_idx, CMDQ_ADDR_HIGH(src_addr));
> +	if (err < 0)
> +		return err;
> +	err = cmdq_pkt_read_s(pkt, tmp_reg_idx, CMDQ_ADDR_LOW(src_addr), swap_reg_idx);
> +	if (err < 0)
> +		return err;
> +
> +	/* write the value of swap_reg_idx into dst_addr */
> +	err = cmdq_pkt_assign(pkt, tmp_reg_idx, CMDQ_ADDR_HIGH(dst_addr));
> +	if (err < 0)
> +		return err;
> +	err = cmdq_pkt_write_s(pkt, tmp_reg_idx, CMDQ_ADDR_LOW(dst_addr), swap_reg_idx);
> +	if (err < 0)
> +		return err;
> +
> +	return err;

In the documentation, you say "0 for success", so...

return 0; here :-)

> +}
> +EXPORT_SYMBOL(cmdq_pkt_mem_move);
> +
>   int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear)
>   {
>   	struct cmdq_instruction inst = { {0} };
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index 1dae80185f9f..b6dbe2d8f16a 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -182,6 +182,16 @@ int cmdq_pkt_write_s_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
>   int cmdq_pkt_write_s_mask_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
>   				u16 addr_low, u32 value, u32 mask);
>   
> +/**
> + * cmdq_pkt_mem_move() - append memory move command to the CMDQ packet
> + * @pkt:	the CMDQ packet
> + * @src_addr:	source address
> + * @dma_addr_t: destination address
> + *

  * @dst_addr: destination address
  *
  * Appends a CMDQ command to copy the value found in `src_addr` to `dst_addr`
  *
  * Return ....

> + * Return: 0 for success; else the error code is returned
> + */
> +int cmdq_pkt_mem_move(struct cmdq_pkt *pkt, dma_addr_t src_addr, dma_addr_t dst_addr);
> +
>   /**
>    * cmdq_pkt_wfe() - append wait for event command to the CMDQ packet
>    * @pkt:	the CMDQ packet


