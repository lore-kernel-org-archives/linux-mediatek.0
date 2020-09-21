Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CBEC43466
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 16:19:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07A1220708
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 16:19:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o9Forbdg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.b="G3YQ4qbr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07A1220708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=InS8wbsgaXL+Eed3HGU3I5VcC4ooJtPkbaqqXJgcy+E=; b=o9ForbdgMhHBCEm9D6Vf5cReH
	SKQP72nLcaw5mlwO7oobmC7wUrI+CMhZoRgioYqrBqz/8RWJxdncVgZ+yw/pppPcyHEtkFtqhWLkN
	WwieGajF9Kt0Rpm1buegRKYiKY0QqSTNfoiMeThHGkgPFaVbWMsV6UKRNSTLxcuPXaSpXHOW3WDUM
	nXZkev1wPPX2jvGzuMqbGRG0R/CtT1hMa8WUog1SHWMLqtveAc9lRiXDagzxO37hO8+fJM6AWa521
	crMPPnp1Fkqgbc8SXyu6HRlQP3ZS1LzGhNciMoy9keHFu3/4c60Lg7QjkwWExp3ILLgK9EB2oC/rn
	8+asqfzlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKOXC-0003Zg-MP; Mon, 21 Sep 2020 16:19:22 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKOWp-0003M5-FA; Mon, 21 Sep 2020 16:19:00 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600705136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pqOJVf49CUVVxcz8kEiVqivoHMj3m8RD+N1BRvW+DgU=;
 b=G3YQ4qbryrlPa84ws3fLjF9qOAcMppOY6InukLyCoPgytd6pRmzIpgEBlei/bLk7TMcbMc
 TxQDU7dd/hc+AYNgY6A6L/l25AeIVBpOQkGXNQLZEj7UNRDwLXSXwqWifLpbnxeDwy6WmJ
 Hlvik19sHEe2VhWJSSozAd+ntterhOI=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 78C23B2C3;
 Mon, 21 Sep 2020 16:19:32 +0000 (UTC)
Subject: Re: [PATCH v3 7/9] soc: mediatek: cmdq: add jump function
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>
References: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1594136714-11650-8-git-send-email-dennis-yc.hsieh@mediatek.com>
From: Matthias Brugger <mbrugger@suse.com>
Message-ID: <1b66c203-e0ea-79f9-6856-a9be3e410dd2@suse.com>
Date: Mon, 21 Sep 2020 18:18:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1594136714-11650-8-git-send-email-dennis-yc.hsieh@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_121859_756609_61849130 
X-CRM114-Status: GOOD (  23.61  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, HS Liao <hs.liao@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 07/07/2020 17:45, Dennis YC Hsieh wrote:
> Add jump function so that client can jump to any address which
> contains instruction.
> 
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>

Now pushed to v5.9-next/soc

Thanks!

> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c |   13 +++++++++++++
>   include/linux/soc/mediatek/mtk-cmdq.h  |   11 +++++++++++
>   2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index b6e25f216605..d55dc3296105 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -13,6 +13,7 @@
>   #define CMDQ_POLL_ENABLE_MASK	BIT(0)
>   #define CMDQ_EOC_IRQ_EN		BIT(0)
>   #define CMDQ_REG_TYPE		1
> +#define CMDQ_JUMP_RELATIVE	1
>   
>   struct cmdq_instruction {
>   	union {
> @@ -407,6 +408,18 @@ int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
>   }
>   EXPORT_SYMBOL(cmdq_pkt_assign);
>   
> +int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr)
> +{
> +	struct cmdq_instruction inst = {};
> +
> +	inst.op = CMDQ_CODE_JUMP;
> +	inst.offset = CMDQ_JUMP_RELATIVE;
> +	inst.value = addr >>
> +		cmdq_get_shift_pa(((struct cmdq_client *)pkt->cl)->chan);
> +	return cmdq_pkt_append_command(pkt, inst);
> +}
> +EXPORT_SYMBOL(cmdq_pkt_jump);
> +
>   int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
>   {
>   	struct cmdq_instruction inst = { {0} };
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index d9390d76ee14..34354e952f60 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -253,6 +253,17 @@ int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
>   int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value);
>   
>   /**
> + * cmdq_pkt_jump() - Append jump command to the CMDQ packet, ask GCE
> + *		     to execute an instruction that change current thread PC to
> + *		     a physical address which should contains more instruction.
> + * @pkt:        the CMDQ packet
> + * @addr:       physical address of target instruction buffer
> + *
> + * Return: 0 for success; else the error code is returned
> + */
> +int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr);
> +
> +/**
>    * cmdq_pkt_finalize() - Append EOC and jump command to pkt.
>    * @pkt:	the CMDQ packet
>    *
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
