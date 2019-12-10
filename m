Return-Path: <SRS0=F6Lp=2A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C8A0C43603
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 05:18:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F032720663
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 05:18:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OQhEg+71";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qyd8Ajmd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F032720663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e+yNtaf+3ZIMbypOm85f3VrcU46QM7VH1bk7ORibsi8=; b=OQhEg+71VHJ2ce
	qrGEI6SrRUNlnb3w6Lss0S2pPqJrjl8QCZpsVunnU78p4hZ5SqSrnLLHUok/UmViBEjhGpkZ723hy
	TQM9Emt9sfHk6a++ThqMY//6fvhj1poJUp6ZCv4M2apR+rN+N5VgAJnmMnbg5PLbpoAoP3Q8l2O+t
	urylxlZviPiV2IcbkYV0SM+y9bDjTM7jw56gb9NIXTPBG0xSJH++HE8/6ZJ6LdCaYLuYdYHAxprfF
	hF5BeeWotIlgOlNSTX4Kt/ai3UklDg+g8M0UxUt/WxRRzuJbrw8fcGqKRxTczhFnEdXBURmEVLXXu
	dIJaRGZwcpfl9qdKj3vA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieXuv-0000YC-R0; Tue, 10 Dec 2019 05:18:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieXuo-0000PZ-1L; Tue, 10 Dec 2019 05:18:31 +0000
X-UUID: ee288fb1aa5d440f886f8862e024b5e7-20191209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=U5dn9iiS6Lkny5IY/aF5ZMW3uyg18odEyEQls0K5nvY=; 
 b=qyd8AjmdbjWrwWMz26LJC1Y0teT8iupvnBZhwcdqezVOyapKuZ6JuPGHwB5lJ6OCUd0ND2MzXmjqO1/6kcSU3SRRJ6PcUlVmsYdtA9CaZw8+Te+6SFz7r7vCKWlNTVGA+RerLfZYQ9QrGmO727OeofMwRSW3msB5i1qnXiESX+U=;
X-UUID: ee288fb1aa5d440f886f8862e024b5e7-20191209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 560084488; Mon, 09 Dec 2019 21:18:27 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 9 Dec 2019 21:18:41 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Dec 2019 13:17:28 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 10 Dec 2019 13:18:28 +0800
Message-ID: <1575955103.31262.10.camel@mtksdaap41>
Subject: Re: [PATCH v2 08/14] soc: mediatek: cmdq: add write_s function
From: CK Hu <ck.hu@mediatek.com>
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Date: Tue, 10 Dec 2019 13:18:23 +0800
In-Reply-To: <1574819937-6246-10-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1574819937-6246-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1574819937-6246-10-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 19114C2D8273052152C91583BBC66896FDADFDC8BD073E8DD6DB629FEDD384B22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_211830_084553_D1BDB49D 
X-CRM114-Status: GOOD (  18.39  )
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
> add write_s function in cmdq helper functions which
> writes value contains in internal register to address
> with large dma access support.
> 
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-cmdq-helper.c   | 40 ++++++++++++++++++++++++
>  include/linux/mailbox/mtk-cmdq-mailbox.h |  2 ++
>  include/linux/soc/mediatek/mtk-cmdq.h    | 12 +++++++
>  3 files changed, 54 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 9cc234f08ec5..2edbc0954d97 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -15,11 +15,18 @@
>  #define CMDQ_EOC_CMD		((u64)((CMDQ_CODE_EOC << CMDQ_OP_CODE_SHIFT)) \
>  				<< 32 | CMDQ_EOC_IRQ_EN)
>  #define CMDQ_REG_TYPE		1
> +#define CMDQ_ADDR_HIGH(addr)	((u32)(((addr) >> 16) & GENMASK(31, 0)))
> +#define CMDQ_ADDR_LOW_BIT	BIT(1)
> +#define CMDQ_ADDR_LOW(addr)	((u16)(addr) | CMDQ_ADDR_LOW_BIT)
>  
>  struct cmdq_instruction {
>  	union {
>  		u32 value;
>  		u32 mask;
> +		struct {
> +			u16 arg_c;
> +			u16 arg_b;
> +		};
>  	};
>  	union {
>  		u16 offset;
> @@ -224,6 +231,39 @@ int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
>  }
>  EXPORT_SYMBOL(cmdq_pkt_write_mask);
>  
> +int cmdq_pkt_write_s(struct cmdq_pkt *pkt, phys_addr_t addr, u16 reg_idx,
> +		     u32 mask)
> +{
> +	struct cmdq_instruction inst = { {0} };
> +	const u16 dst_reg_idx = CMDQ_SPR_TEMP;
> +	int err;
> +
> +	if (mask != U32_MAX) {
> +		inst.op = CMDQ_CODE_MASK;
> +		inst.mask = ~mask;
> +		err = cmdq_pkt_append_command(pkt, inst);
> +		if (err < 0)
> +			return err;
> +
> +		inst.mask = 0;
> +		inst.op = CMDQ_CODE_WRITE_S_MASK;
> +	} else {
> +		inst.op = CMDQ_CODE_WRITE_S;
> +	}
> +
> +	err = cmdq_pkt_assign(pkt, dst_reg_idx, CMDQ_ADDR_HIGH(addr));

You combine assign and write_s in this function, so you always occupy
register CMDQ_SPR_TEMP for this purpose, client could not use
CMDQ_SPR_TEMP for other purpose. So I would like you just do write_s in
this function. So the code in client would be:

cmdq_pkt_assign(pkt, high_addr_reg_idx, CMDQ_ADDR_HIGH(addr));
cmdq_pkt_write_s(pkt, high_addr_reg_idx, CMDQ_ADDR_LOW(addr),
src_reg_idx, mask);

Let client to decide which register for high address.

Another benefit of not combining instruction is that client driver owner
would be more clear about which command is in command buffer and it's
easier for them to debug.

> +	if (err < 0)
> +		return err;
> +
> +	inst.arg_b_t = CMDQ_REG_TYPE;
> +	inst.sop = dst_reg_idx;
> +	inst.offset = CMDQ_ADDR_LOW(addr);
> +	inst.arg_b = reg_idx;

I seems arg_b has a meaningful name.

Regards,
CK

> +
> +	return cmdq_pkt_append_command(pkt, inst);
> +}
> +EXPORT_SYMBOL(cmdq_pkt_write_s);
> +
>  int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
>  {
>  	struct cmdq_instruction inst = { {0} };
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> index 121c3bb6d3de..8ef87e1bd03b 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -59,6 +59,8 @@ enum cmdq_code {
>  	CMDQ_CODE_JUMP = 0x10,
>  	CMDQ_CODE_WFE = 0x20,
>  	CMDQ_CODE_EOC = 0x40,
> +	CMDQ_CODE_WRITE_S = 0x90,
> +	CMDQ_CODE_WRITE_S_MASK = 0x91,
>  	CMDQ_CODE_LOGIC = 0xa0,
>  };
>  
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index c66b3a0da2a2..56ff1970197c 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -106,6 +106,18 @@ int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value);
>  int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
>  			u16 offset, u32 value, u32 mask);
>  
> +/**
> + * cmdq_pkt_write_s_mask() - append write_s command to the CMDQ packet
> + * @pkt:	the CMDQ packet
> + * @addr:	the physical address of register or dma
> + * @reg_idx:	the CMDQ internal register ID which cache source value
> + * @mask:	the specified target register mask
> + *
> + * Return: 0 for success; else the error code is returned
> + */
> +int cmdq_pkt_write_s(struct cmdq_pkt *pkt, phys_addr_t addr, u16 reg_idx,
> +		     u32 mask);
> +
>  /**
>   * cmdq_pkt_wfe() - append wait for event command to the CMDQ packet
>   * @pkt:	the CMDQ packet

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
