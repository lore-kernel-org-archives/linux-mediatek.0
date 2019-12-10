Return-Path: <SRS0=F6Lp=2A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E39AC43603
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 03:24:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2DD9206E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 03:24:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lc2HKpyS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QTLKkzN1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2DD9206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pEif7owW5dQdbmohMslRVnBbxxwXdFdB1GSboF5i60A=; b=Lc2HKpySwCYNJT
	1qCHfp1ffOOZPuUJA8S5wt5VO2F1aKsjf2bUT2SOf5dC4xI3x2lFLuD6uilOgIydBJCD76c5/Ngp4
	9TWu/HNzwR/7BruaV4hzTLSETtginK+Hh5/29BlIA87VnOAr7/iz5DCLsFqsGBgLTaRkneznZ4fCI
	qb6kzCVRwI/z7waC6/mB9eun7WEXc149eutvG93h4HioKf92RBmpj3Dv4NR1rCRMyUqbrr3hsfFbw
	KKzj4jrE5X30kWGTbFd1ndq9gYXOMi4+KkZs0/L420N3ZtwswCuELZjDr3hjRHPw153O/ri2IoIK4
	4gLiK+BA/XByCyC7FQ8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieW8J-0007PZ-Ts; Tue, 10 Dec 2019 03:24:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieW8D-0007JR-K9; Tue, 10 Dec 2019 03:24:15 +0000
X-UUID: 65d4073e61784bc09d8fd026dceebeb7-20191209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=N2521TvN7lGfbMtCwquz/uaxFLQnHeWy5RUtdl0dTwM=; 
 b=QTLKkzN1s1QAbU82SxZhyEb1RMZB1gojbsBr3Ns6L9ViA560aiskVJcXvGpIOXE/1k6Pmg7ZcaBXCcxgE7mDjlMXObUMZgwisn3FIP47BT91bQomth+zaqfsacXgW17xfP84W+ld67EDpf7AJrO7vFDe2Ic64QQafFHoFiB+zjY=;
X-UUID: 65d4073e61784bc09d8fd026dceebeb7-20191209
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2107416275; Mon, 09 Dec 2019 19:24:10 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 9 Dec 2019 19:25:11 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Dec 2019 11:23:44 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 10 Dec 2019 11:23:35 +0800
Message-ID: <1575948247.9195.0.camel@mtksdaap41>
Subject: Re: [PATCH v2 07/14] soc: mediatek: cmdq: add assign function
From: CK Hu <ck.hu@mediatek.com>
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Date: Tue, 10 Dec 2019 11:24:07 +0800
In-Reply-To: <1574819937-6246-9-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1574819937-6246-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1574819937-6246-9-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_192413_669505_66E5FDAA 
X-CRM114-Status: GOOD (  16.39  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 Houlong Wei <houlong.wei@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dennis:

On Wed, 2019-11-27 at 09:58 +0800, Dennis YC Hsieh wrote:
> Add assign function in cmdq helper which assign constant value into
> internal register by index.
> 
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-cmdq-helper.c   | 24 +++++++++++++++++++++++-
>  include/linux/mailbox/mtk-cmdq-mailbox.h |  1 +
>  include/linux/soc/mediatek/mtk-cmdq.h    | 18 ++++++++++++++++++
>  3 files changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 8421b4090304..9cc234f08ec5 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -14,6 +14,7 @@
>  #define CMDQ_EOC_IRQ_EN		BIT(0)
>  #define CMDQ_EOC_CMD		((u64)((CMDQ_CODE_EOC << CMDQ_OP_CODE_SHIFT)) \
>  				<< 32 | CMDQ_EOC_IRQ_EN)
> +#define CMDQ_REG_TYPE		1
>  
>  struct cmdq_instruction {
>  	union {
> @@ -23,8 +24,17 @@ struct cmdq_instruction {
>  	union {
>  		u16 offset;
>  		u16 event;
> +		u16 reg_dst;
> +	};
> +	union {
> +		u8 subsys;
> +		struct {
> +			u8 sop:5;
> +			u8 arg_c_t:1;
> +			u8 arg_b_t:1;
> +			u8 dst_t:1;
> +		};
>  	};
> -	u8 subsys;
>  	u8 op;
>  };
>  
> @@ -279,6 +289,18 @@ int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
>  }
>  EXPORT_SYMBOL(cmdq_pkt_poll_mask);
>  
> +int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
> +{
> +	struct cmdq_instruction inst = { {0} };
> +
> +	inst.op = CMDQ_CODE_LOGIC;
> +	inst.dst_t = CMDQ_REG_TYPE;
> +	inst.reg_dst = reg_idx;
> +	inst.value = value;
> +	return cmdq_pkt_append_command(pkt, inst);
> +}
> +EXPORT_SYMBOL(cmdq_pkt_assign);
> +
>  static int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
>  {
>  	struct cmdq_client *cl = pkt->cl;
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> index dfe5b2eb85cc..121c3bb6d3de 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -59,6 +59,7 @@ enum cmdq_code {
>  	CMDQ_CODE_JUMP = 0x10,
>  	CMDQ_CODE_WFE = 0x20,
>  	CMDQ_CODE_EOC = 0x40,
> +	CMDQ_CODE_LOGIC = 0xa0,
>  };
>  
>  enum cmdq_cb_status {
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index a74c1d5acdf3..c66b3a0da2a2 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -12,6 +12,10 @@
>  #include <linux/timer.h>
>  
>  #define CMDQ_NO_TIMEOUT		0xffffffffu
> +#define CMDQ_SPR_TEMP		0
> +#define CMDQ_SPR1		1
> +#define CMDQ_SPR2		2
> +#define CMDQ_SPR3		3

These does not relate to assign function, so remove them.

Regards,
CK

>  
>  struct cmdq_pkt;
>  
> @@ -152,6 +156,20 @@ int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
>   */
>  int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
>  		       u16 offset, u32 value, u32 mask);
> +
> +/**
> + * cmdq_pkt_assign() - Append logic assign command to the CMDQ packet, ask GCE
> + *		       to execute an instruction that set a constant value into
> + *		       internal register and use as value, mask or address in
> + *		       read/write instruction.
> + * @pkt:	the CMDQ packet
> + * @reg_idx:	the CMDQ internal register ID
> + * @value:	the specified value
> + *
> + * Return: 0 for success; else the error code is returned
> + */
> +int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value);
> +
>  /**
>   * cmdq_pkt_flush_async() - trigger CMDQ to asynchronously execute the CMDQ
>   *                          packet and call back at the end of done packet

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
