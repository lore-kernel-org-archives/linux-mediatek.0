Return-Path: <SRS0=4tSC=Y7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09CBDC5DF61
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Nov 2019 07:09:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D287521D6C
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Nov 2019 07:09:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AoMgd13f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D287521D6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pUStbXfh2/eLaEGNNbcXMoE0vuouFWylDmuvi8UC0UA=; b=AoMgd13fnxflDb
	kUMPVXHWE0WcGNzeq07xvzizSBEhgeILFgNZ/ZIneyi6iTxDvt3HSLHrO8B1w+S8YYm3TerFKOgxU
	240aNggHCx7M4DeS+wKRgdH42GjJHMHpg998qgN6Oyq69hbbWK0HwUF/5tk3AI9V19fBRe7rSQSL9
	3qf3I+75Xxcf4olioTVaE8TFYdhtCmjsf1ckWgqy1AEzEiiO9TgSqLftr4rY1casNY0Tpr7xlTsp9
	VEpjFYd/OA8RiexmEN0aCt0Fkn0psgnMTrBxmEHkPg0i22HFh/Y0ykrqQrGRouiPY0we+8SqLUGAN
	NOPxWIpNFd9RFyZx9N9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSbvM-0005Tj-I5; Thu, 07 Nov 2019 07:09:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSbvK-0005T4-6D; Thu, 07 Nov 2019 07:09:43 +0000
X-UUID: b1b30c33ad3c461cbb3c0cc808a4b862-20191106
X-UUID: b1b30c33ad3c461cbb3c0cc808a4b862-20191106
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1547336275; Wed, 06 Nov 2019 23:10:01 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 6 Nov 2019 23:09:36 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 7 Nov 2019 15:09:35 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 7 Nov 2019 15:09:35 +0800
Message-ID: <1573110577.14882.2.camel@mtksdaap41>
Subject: Re: [PATCH v16 2/5] soc: mediatek: cmdq: define the instruction struct
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Thu, 7 Nov 2019 15:09:37 +0800
In-Reply-To: <20191024052732.7767-3-bibby.hsieh@mediatek.com>
References: <20191024052732.7767-1-bibby.hsieh@mediatek.com>
 <20191024052732.7767-3-bibby.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_230942_232028_83A30980 
X-CRM114-Status: GOOD (  16.95  )
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>,
 Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Bibby:

On Thu, 2019-10-24 at 13:27 +0800, Bibby Hsieh wrote:
> Define an instruction structure for gce driver to append command.
> This structure can make the client's code more readability.
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-cmdq-helper.c   | 75 ++++++++++++++++--------
>  include/linux/mailbox/mtk-cmdq-mailbox.h | 10 ++++
>  2 files changed, 60 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 5ea509e86488..11bfcc150ebd 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -9,12 +9,24 @@
>  #include <linux/mailbox_controller.h>
>  #include <linux/soc/mediatek/mtk-cmdq.h>
>  
> -#define CMDQ_ARG_A_WRITE_MASK	0xffff
>  #define CMDQ_WRITE_ENABLE_MASK	BIT(0)
>  #define CMDQ_EOC_IRQ_EN		BIT(0)
>  #define CMDQ_EOC_CMD		((u64)((CMDQ_CODE_EOC << CMDQ_OP_CODE_SHIFT)) \
>  				<< 32 | CMDQ_EOC_IRQ_EN)
>  
> +struct cmdq_instruction {
> +	union {
> +		u32 value;
> +		u32 mask;
> +	};
> +	union {
> +		u16 offset;
> +		u16 event;
> +	};
> +	u8 subsys;
> +	u8 op;
> +};
> +
>  static void cmdq_client_timeout(struct timer_list *t)
>  {
>  	struct cmdq_client *client = from_timer(client, t, timer);
> @@ -110,10 +122,10 @@ void cmdq_pkt_destroy(struct cmdq_pkt *pkt)
>  }
>  EXPORT_SYMBOL(cmdq_pkt_destroy);
>  
> -static int cmdq_pkt_append_command(struct cmdq_pkt *pkt, enum cmdq_code code,
> -				   u32 arg_a, u32 arg_b)
> +static int cmdq_pkt_append_command(struct cmdq_pkt *pkt,
> +				   struct cmdq_instruction inst)
>  {
> -	u64 *cmd_ptr;
> +	struct cmdq_instruction *cmd_ptr;
>  
>  	if (unlikely(pkt->cmd_buf_size + CMDQ_INST_SIZE > pkt->buf_size)) {
>  		/*
> @@ -129,8 +141,9 @@ static int cmdq_pkt_append_command(struct cmdq_pkt *pkt, enum cmdq_code code,
>  			__func__, (u32)pkt->buf_size);
>  		return -ENOMEM;
>  	}
> +
>  	cmd_ptr = pkt->va_base + pkt->cmd_buf_size;
> -	(*cmd_ptr) = (u64)((code << CMDQ_OP_CODE_SHIFT) | arg_a) << 32 | arg_b;
> +	*cmd_ptr = inst;
>  	pkt->cmd_buf_size += CMDQ_INST_SIZE;
>  
>  	return 0;
> @@ -138,27 +151,34 @@ static int cmdq_pkt_append_command(struct cmdq_pkt *pkt, enum cmdq_code code,
>  
>  int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value)
>  {
> -	u32 arg_a = (offset & CMDQ_ARG_A_WRITE_MASK) |
> -		    (subsys << CMDQ_SUBSYS_SHIFT);
> +	struct cmdq_instruction inst;
>  
> -	return cmdq_pkt_append_command(pkt, CMDQ_CODE_WRITE, arg_a, value);
> +	inst.op = CMDQ_CODE_WRITE;
> +	inst.value = value;
> +	inst.offset = offset;
> +	inst.subsys = subsys;
> +
> +	return cmdq_pkt_append_command(pkt, inst);
>  }
>  EXPORT_SYMBOL(cmdq_pkt_write);
>  
>  int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
>  			u16 offset, u32 value, u32 mask)
>  {
> -	u32 offset_mask = offset;
> +	struct cmdq_instruction inst = { {0} };
> +	u16 offset_mask = offset;
>  	int err;
>  
>  	if (mask != 0xffffffff) {
> -		err = cmdq_pkt_append_command(pkt, CMDQ_CODE_MASK, 0, ~mask);
> +		inst.op = CMDQ_CODE_MASK;
> +		inst.mask = ~mask;
> +		err = cmdq_pkt_append_command(pkt, inst);
>  		if (err < 0)
>  			return err;
>  
>  		offset_mask |= CMDQ_WRITE_ENABLE_MASK;
>  	}
> -	err = cmdq_pkt_write(pkt, value, subsys, offset_mask);
> +	err = cmdq_pkt_write(pkt, subsys, offset_mask, value);

This looks like a bug fix, so move to a separate patch.

Regards,
CK

>  
>  	return err;
>  }
> @@ -166,45 +186,50 @@ EXPORT_SYMBOL(cmdq_pkt_write_mask);
>  
>  int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
>  {
> -	u32 arg_b;
> +	struct cmdq_instruction inst = { {0} };
>  
>  	if (event >= CMDQ_MAX_EVENT)
>  		return -EINVAL;
>  
> -	/*
> -	 * WFE arg_b
> -	 * bit 0-11: wait value
> -	 * bit 15: 1 - wait, 0 - no wait
> -	 * bit 16-27: update value
> -	 * bit 31: 1 - update, 0 - no update
> -	 */
> -	arg_b = CMDQ_WFE_UPDATE | CMDQ_WFE_WAIT | CMDQ_WFE_WAIT_VALUE;
> +	inst.op = CMDQ_CODE_WFE;
> +	inst.value = CMDQ_WFE_OPTION;
> +	inst.event = event;
>  
> -	return cmdq_pkt_append_command(pkt, CMDQ_CODE_WFE, event, arg_b);
> +	return cmdq_pkt_append_command(pkt, inst);
>  }
>  EXPORT_SYMBOL(cmdq_pkt_wfe);
>  
>  int cmdq_pkt_clear_event(struct cmdq_pkt *pkt, u16 event)
>  {
> +	struct cmdq_instruction inst = { {0} };
> +
>  	if (event >= CMDQ_MAX_EVENT)
>  		return -EINVAL;
>  
> -	return cmdq_pkt_append_command(pkt, CMDQ_CODE_WFE, event,
> -				       CMDQ_WFE_UPDATE);
> +	inst.op = CMDQ_CODE_WFE;
> +	inst.value = CMDQ_WFE_UPDATE;
> +	inst.event = event;
> +
> +	return cmdq_pkt_append_command(pkt, inst);
>  }
>  EXPORT_SYMBOL(cmdq_pkt_clear_event);
>  
>  static int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
>  {
> +	struct cmdq_instruction inst = { {0} };
>  	int err;
>  
>  	/* insert EOC and generate IRQ for each command iteration */
> -	err = cmdq_pkt_append_command(pkt, CMDQ_CODE_EOC, 0, CMDQ_EOC_IRQ_EN);
> +	inst.op = CMDQ_CODE_EOC;
> +	inst.value = CMDQ_EOC_IRQ_EN;
> +	err = cmdq_pkt_append_command(pkt, inst);
>  	if (err < 0)
>  		return err;
>  
>  	/* JUMP to end */
> -	err = cmdq_pkt_append_command(pkt, CMDQ_CODE_JUMP, 0, CMDQ_JUMP_PASS);
> +	inst.op = CMDQ_CODE_JUMP;
> +	inst.value = CMDQ_JUMP_PASS;
> +	err = cmdq_pkt_append_command(pkt, inst);
>  
>  	return err;
>  }
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> index e6f54ef6698b..678760548791 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -20,6 +20,16 @@
>  #define CMDQ_WFE_WAIT			BIT(15)
>  #define CMDQ_WFE_WAIT_VALUE		0x1
>  
> +/*
> + * WFE arg_b
> + * bit 0-11: wait value
> + * bit 15: 1 - wait, 0 - no wait
> + * bit 16-27: update value
> + * bit 31: 1 - update, 0 - no update
> + */
> +#define CMDQ_WFE_OPTION			(CMDQ_WFE_UPDATE | CMDQ_WFE_WAIT | \
> +					CMDQ_WFE_WAIT_VALUE)
> +
>  /** cmdq event maximum */
>  #define CMDQ_MAX_EVENT			0x3ff
>  



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
