Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A260EC4829E
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 10:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jocs12uTpdrkS7kNDt/Yj+3J9mG2TJLt7AD4ksF9R5A=; b=VJ8P4eFO3PALDJlcrBunrPucSR
	qtiiuTvy+6+pCjt50zbN7y0KtC0OyXyNSDbHygW17qST/Ui0yNXM60PBWrUHg73yh72MI4o/6AHdB
	iNlZK42L48HaHp0BhCWoI/UgDtdCtz0mWxWL4BLv014IaOkOVXY9WJ8/5Z/OXS/QL89GJjeKkQR4J
	7dktc6zl3D99QL8rvsu1n3JFEhNdX72fUIgOxs1QTecarurPLWKNo909WKbNfDfB4YiGxoIWiSH6s
	nJMy7ScCkyo57BWeiAtg8WrVWUUv7piYjXlGF4+31RWpiu4W1jrMZgS2BuqCFyaYL6Qf9Tr7eLcvw
	g5TvsSmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZAp-0000000FpKi-0EaV;
	Thu, 15 Feb 2024 10:40:59 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZAe-0000000FpCL-464o;
	Thu, 15 Feb 2024 10:40:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707993647;
	bh=iSVp6dLTFhBiFSnkW1LO3rz+tjlpHFgMWN84cVY5kB8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=X1pu8P4tHnLAJ/NzR3FsmEfCfcYEmDufQsGBm2JjdNgoCsFy9qBRUt4hmItMSH4l4
	 apKgyef/UKTllMBzNjg6Y0AZsGIHG0j709qo8k+S0XeJV8sqdJYXfWu0Sm46yFmKf1
	 /xcqUMq9EBb7PLCC7NfFkKSKYYg7LrQxjD1/K+sX8Mny4Ng6ityj+etq4FBXeOUBBK
	 NvMPWDKY6iInbjcQSDBJMjUHtOkDBaImq7mIeoeVQFHIyZ2/W3u5uXQSUzPPDL/2Bl
	 QpYLHhF/XmcvNLiVjSKU0JFLadl/pn+efiDn+Oa7lisUWKo/yRSb83zkxUktkaK9n4
	 53Lok0WcOI9vw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2A23737820B1;
	Thu, 15 Feb 2024 10:40:47 +0000 (UTC)
Message-ID: <680fcb9a-d7e2-4a15-877e-09c01024ed53@collabora.com>
Date: Thu, 15 Feb 2024 11:40:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] soc: mediatek: cmdq: Add cmdq_pkt_nop() helper
 function
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20240215004931.3808-1-chunkuang.hu@kernel.org>
 <20240215004931.3808-5-chunkuang.hu@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240215004931.3808-5-chunkuang.hu@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_024049_270266_F58FE3BE 
X-CRM114-Status: GOOD (  14.45  )
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
> cmdq_pkt_nop() append nop command to the packet. nop command ask
> GCE to do no operation.
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c | 11 +++++++++++
>   include/linux/soc/mediatek/mtk-cmdq.h  | 16 ++++++++++++++++
>   2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index e982997117c2..1be950b4ec7f 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -369,6 +369,17 @@ int cmdq_pkt_eoc(struct cmdq_pkt *pkt)
>   }
>   EXPORT_SYMBOL(cmdq_pkt_eoc);
>   
> +int cmdq_pkt_nop(struct cmdq_pkt *pkt, u8 shift_pa)
> +{
> +	struct cmdq_instruction inst = { {0} };
> +
> +	/* Jumping to next instruction is equal to no operation */
> +	inst.op = CMDQ_CODE_JUMP;
> +	inst.value = CMDQ_INST_SIZE >> shift_pa;
> +	return cmdq_pkt_append_command(pkt, inst);
> +}
> +EXPORT_SYMBOL(cmdq_pkt_nop);
> +
>   int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
>   {
>   	struct cmdq_instruction inst = { {0} };
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index a67f719dec0b..8179ba5238f9 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -255,6 +255,17 @@ int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa);
>    */
>   int cmdq_pkt_eoc(struct cmdq_pkt *pkt);
>   
> +/**
> + * cmdq_pkt_nop() - Append nop command to the CMDQ packet, ask GCE
> + *		    to do no operation.

  * cmdq_pkt_nop() - Append No-Operation (NOP) command to a CMDQ packet

After which...
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



