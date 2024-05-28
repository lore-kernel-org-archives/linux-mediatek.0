Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A85C27C44
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 May 2024 10:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YuyCdFlQC/UfT3GWzMW9DgqmXzWGBbDd7qmciqCf5B4=; b=YcWaP+OlaNW1OdzO+jjVJyeIdj
	CofYBVsOWZDuwdFi/Lmf89qjDdEeulZ6V05TSw8h16SthS8pv7wVJxHFicGMsr9Vt8ZJIF8eUo7dM
	5vQG7xtmC1AMrU09SvmaGoAhzWkxfyeUHaBm2DeWzQbwOPzjQYKidCq4OI98Djfw2JAIh+tL336hD
	tWmMfB13FC1yu3BCCvvtCGND1Tfw3zwV+Cdeckzm3BA/9n4M4XiPNeXmcfdK76UgxXPcuLS8VyBGa
	opPOOUI6iNQeYVWvc/JlN0Dye6dOtHxBYwUuA4kcnEvbbD+Jqk7sZcfLF8mKCykqbEIYAN1DMHORy
	2dUAjpLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBu10-00000000DIA-1l3l;
	Tue, 28 May 2024 10:25:10 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBu0j-00000000D4I-2n4S;
	Tue, 28 May 2024 10:24:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716891888;
	bh=BTP5T/FnJEg0tTgg03f/vFW9oqFqFOqTuqLp+c8wd0I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eKXOV4619CjkWDXyulcDZI972BUE8J+WDNlZmJRgqPiQ1VnLW4lOdRQ9fgT0lcCJR
	 MZEwHU7KyoGG+kAh0vxH1ypBSQITuoNKHXDNGx3l+/ZPQ6P7gsmABpntUexUjJvpU8
	 y1B3gRKAScWuRfGd/Iz1C3yBZY2Pm49GSmBuW9OsiF6k4H/MLAkT4n5eUuAEwIAlhx
	 /Cf/25PzttE/AwRZPIWiiUpoVZ5lSEgvEkD4FKebjwQOF7Z0N6bc+pQPkPMVZS2RJf
	 Uz5ZXCVD9lrBWRyH7c91k+r7h+UaYWREaSunJ4/ul7tHtZ8n5NDllBHk1WXI+bGMj/
	 33HLaqUTc688w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D7911378215E;
	Tue, 28 May 2024 10:24:47 +0000 (UTC)
Message-ID: <cd15d9c5-f7a8-45fd-b0e1-011a9832d023@collabora.com>
Date: Tue, 28 May 2024 12:24:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/8] soc: mediatek: cmdq: Add cmdq_pkt_logic_command to
 support math operation
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240525230810.24623-1-jason-jh.lin@mediatek.com>
 <20240525230810.24623-4-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240525230810.24623-4-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_032453_910625_306AEBA1 
X-CRM114-Status: GOOD (  25.31  )
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

Il 26/05/24 01:08, Jason-JH.Lin ha scritto:
> Add cmdq_pkt_logic_command to support math operation.
> 
> cmdq_pkt_logic_command can append logic command to the CMDQ packet,
> ask GCE to execute a arithmetic calculate instruction,
> such as add, subtract, multiply, AND, OR and NOT, etc.
> 
> Note that all arithmetic instructions are unsigned calculations.
> If there are any overflows, GCE will sent the invalid IRQ to notify
> CMDQ driver.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c | 36 ++++++++++++++++++++++
>   include/linux/soc/mediatek/mtk-cmdq.h  | 42 ++++++++++++++++++++++++++
>   2 files changed, 78 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 046522664dc1..42fae05f61a8 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -15,10 +15,19 @@
>   /* dedicate the last GPR_R15 to assign the register address to be poll */
>   #define CMDQ_POLL_ADDR_GPR	(15)
>   #define CMDQ_EOC_IRQ_EN		BIT(0)
> +#define CMDQ_IMMEDIATE_VALUE	0
>   #define CMDQ_REG_TYPE		1
>   #define CMDQ_JUMP_RELATIVE	0
>   #define CMDQ_JUMP_ABSOLUTE	1
>   
> +#define CMDQ_OPERAND_GET_IDX_VALUE(operand) \
> +	({ \
> +		struct cmdq_operand *op = operand; \
> +		op->reg ? op->idx : op->value; \
> +	})

I think this CMDQ_OPERAND_GET_IDX_VALUE would be better expressed as a (inline?)
function instead...

static inline u16 cmdq_operand_get_idx_value(struct cmdq_operand *op)
{
	return op->reg ? op->idx : op->value;
}

and maybe the same for the other definition too..

static inline u16 cmdq_operand_type(struct cmdq_operand *op)
{
	return op->reg ? CMDQ_REG_TYPE : CMDQ_IMMEDIATE_VALUE;
}

but definitely the first one is what I don't like much, the second one can pass.

Cheers,
Angelo

> +#define CMDQ_OPERAND_TYPE(operand) \
> +	((operand)->reg ? CMDQ_REG_TYPE : CMDQ_IMMEDIATE_VALUE)
> +
>   struct cmdq_instruction {
>   	union {
>   		u32 value;
> @@ -461,6 +470,33 @@ int cmdq_pkt_poll_addr(struct cmdq_pkt *pkt, dma_addr_t addr, u32 value, u32 mas
>   }
>   EXPORT_SYMBOL(cmdq_pkt_poll_addr);
>   
> +int cmdq_pkt_logic_command(struct cmdq_pkt *pkt, u16 result_reg_idx,
> +			   struct cmdq_operand *left_operand,
> +			   enum cmdq_logic_op s_op,
> +			   struct cmdq_operand *right_operand)
> +{
> +	struct cmdq_instruction inst = { {0} };
> +	u32 left_idx_value;
> +	u32 right_idx_value;
> +
> +	if (!left_operand || !right_operand || s_op >= CMDQ_LOGIC_MAX)
> +		return -EINVAL;
> +
> +	left_idx_value = CMDQ_OPERAND_GET_IDX_VALUE(left_operand);
> +	right_idx_value = CMDQ_OPERAND_GET_IDX_VALUE(right_operand);
> +	inst.op = CMDQ_CODE_LOGIC;
> +	inst.dst_t = CMDQ_REG_TYPE;
> +	inst.src_t = CMDQ_OPERAND_TYPE(left_operand);
> +	inst.arg_c_t = CMDQ_OPERAND_TYPE(right_operand);
> +	inst.sop = s_op;
> +	inst.reg_dst = result_reg_idx;
> +	inst.src_reg = left_idx_value;
> +	inst.arg_c = right_idx_value;
> +
> +	return cmdq_pkt_append_command(pkt, inst);
> +}
> +EXPORT_SYMBOL(cmdq_pkt_logic_command);
> +
>   int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
>   {
>   	struct cmdq_instruction inst = {};
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index d4a8e34505e6..5bee6f7fc400 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -25,6 +25,31 @@
>   
>   struct cmdq_pkt;
>   
> +enum cmdq_logic_op {
> +	CMDQ_LOGIC_ASSIGN = 0,
> +	CMDQ_LOGIC_ADD = 1,
> +	CMDQ_LOGIC_SUBTRACT = 2,
> +	CMDQ_LOGIC_MULTIPLY = 3,
> +	CMDQ_LOGIC_XOR = 8,
> +	CMDQ_LOGIC_NOT = 9,
> +	CMDQ_LOGIC_OR = 10,
> +	CMDQ_LOGIC_AND = 11,
> +	CMDQ_LOGIC_LEFT_SHIFT = 12,
> +	CMDQ_LOGIC_RIGHT_SHIFT = 13,
> +	CMDQ_LOGIC_MAX,
> +};
> +
> +struct cmdq_operand {
> +	/* register type */
> +	bool reg;
> +	union {
> +		/* index */
> +		u16 idx;
> +		/* value */
> +		u16 value;
> +	};
> +};
> +
>   struct cmdq_client_reg {
>   	u8 subsys;
>   	u16 offset;
> @@ -272,6 +297,23 @@ int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
>   int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
>   		       u16 offset, u32 value, u32 mask);
>   
> +/**
> + * cmdq_pkt_logic_command() - Append logic command to the CMDQ packet, ask GCE to
> + *		          execute an instruction that store the result of logic operation
> + *		          with left and right operand into result_reg_idx.
> + * @pkt:		the CMDQ packet
> + * @result_reg_idx:	SPR index that store operation result of left_operand and right_operand
> + * @left_operand:	left operand
> + * @s_op:		the logic operator enum
> + * @right_operand:	right operand
> + *
> + * Return: 0 for success; else the error code is returned
> + */
> +int cmdq_pkt_logic_command(struct cmdq_pkt *pkt, u16 result_reg_idx,
> +			   struct cmdq_operand *left_operand,
> +			   enum cmdq_logic_op s_op,
> +			   struct cmdq_operand *right_operand);
> +
>   /**
>    * cmdq_pkt_assign() - Append logic assign command to the CMDQ packet, ask GCE
>    *		       to execute an instruction that set a constant value into




