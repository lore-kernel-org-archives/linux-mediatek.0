Return-Path: <SRS0=vzOr=ZO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7AFAC432C0
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Nov 2019 09:06:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 822D020674
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Nov 2019 09:06:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jqoaICEc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YBAWnere"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 822D020674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5iYX45i55EHxYDxK6T2wY0ofxPFVlt5uVO+VYqcGpWk=; b=jqoaICEc7Hs62i
	erMmyHeJUzV0mBKZ5k6mdA0nyETAEHM+bVo68mLeogU7CZuo5DXYzyicmjdQRwtYU5NN7NSnFC3t0
	E9I3VJQWah1kK6sn3E86bOBxlRWmSwkO43bpQ4+8snRBeJMWza5aazHaQL9ZFMgI3O58P1cyGjFYE
	PPSMoWWj0u2YGYVO63i2+pSrRV5wx6Gd6oMJM0Ct4xTQwPiri+w8Uhy+Jy32/PDA5+jJP9WMGF2+m
	gLwSYKsFI0vMPDEoRBDNJeb18YzmfcoxUT49EVe7mH2jrA7XbU8/FdVFXn1rNDzL8faMnLPqfqSl3
	QrzBYcwuqlnts+4+SL7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iY4u0-0003Lb-1y; Fri, 22 Nov 2019 09:06:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iY4tr-0003E0-9X; Fri, 22 Nov 2019 09:06:48 +0000
X-UUID: a06c90a5beae478ea74db79d1bca564e-20191122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=AMnabSznLaiYa+5DKF19iaqOPkdafm0Q3E/3KuPjx64=; 
 b=YBAWneretwLCisikVHiaj01mPKaubYi0VwK1ptq7txy0R/yDtimxlSy/67PDlySJCNgIEURnpR1GQCDPoFxL5YxXiJsQRFQ5Dn9d8wv5h25GSB5kgwoh/032X8gK62Cq4AXoUgKuGGDMLe2c4WnSugd6SHrjCLrpQ7IA4C0jKdU=;
X-UUID: a06c90a5beae478ea74db79d1bca564e-20191122
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1918156746; Fri, 22 Nov 2019 01:06:40 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 22 Nov 2019 00:57:00 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 22 Nov 2019 16:56:15 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 22 Nov 2019 16:56:28 +0800
Message-ID: <1574412997.19450.16.camel@mtksdaap41>
Subject: Re: [PATCH v1 07/12] soc: mediatek: cmdq: add write_s function
From: CK Hu <ck.hu@mediatek.com>
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Date: Fri, 22 Nov 2019 16:56:37 +0800
In-Reply-To: <1574327552-11806-8-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1574327552-11806-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1574327552-11806-8-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191122_010647_339926_2614E1F8 
X-CRM114-Status: GOOD (  15.03  )
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

On Thu, 2019-11-21 at 17:12 +0800, Dennis YC Hsieh wrote:
> add write_s function in cmdq helper functions which
> support large dma access.
> 
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-cmdq-helper.c   |   34 ++++++++++++++++++++++++++++++
>  include/linux/mailbox/mtk-cmdq-mailbox.h |    2 ++
>  include/linux/soc/mediatek/mtk-cmdq.h    |   13 ++++++++++++
>  3 files changed, 49 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index d419e99..1b074a9 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -15,6 +15,9 @@
>  #define CMDQ_EOC_CMD		((u64)((CMDQ_CODE_EOC << CMDQ_OP_CODE_SHIFT)) \
>  				<< 32 | CMDQ_EOC_IRQ_EN)
>  #define CMDQ_REG_TYPE		1
> +#define CMDQ_ADDR_HIGH(addr)	((u32)(((addr) >> 16) & GENMASK(31, 0)))
> +#define CMDQ_ADDR_LOW_BIT	BIT(1)
> +#define CMDQ_ADDR_LOW(addr)	((u16)(addr) | CMDQ_ADDR_LOW_BIT)
>  
>  struct cmdq_instruction {
>  	union {
> @@ -224,6 +227,37 @@ int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
>  }
>  EXPORT_SYMBOL(cmdq_pkt_write_mask);
>  
> +int cmdq_pkt_write_s(struct cmdq_pkt *pkt, dma_addr_t addr,
> +		     u32 value, u32 mask)
> +{
> +	struct cmdq_instruction inst = { {0} };
> +	int err;
> +	const u16 dst_reg_idx = CMDQ_SPR_TEMP;
> +
> +	err = cmdq_pkt_assign(pkt, dst_reg_idx, CMDQ_ADDR_HIGH(addr));
> +	if (err < 0)
> +		return err;
> +
> +	if (mask != U32_MAX) {
> +		inst.op = CMDQ_CODE_MASK;
> +		inst.mask = ~mask;
> +		err = cmdq_pkt_append_command(pkt, inst);
> +		if (err < 0)
> +			return err;
> +
> +		inst.op = CMDQ_CODE_WRITE_S_MASK;
> +	} else {
> +		inst.op = CMDQ_CODE_WRITE_S;
> +	}
> +
> +	inst.sop = dst_reg_idx;
> +	inst.offset = CMDQ_ADDR_LOW(addr);
> +	inst.value = value;
> +
> +	return cmdq_pkt_append_command(pkt, inst);
> +}
> +EXPORT_SYMBOL(cmdq_pkt_write_s);
> +
>  int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
>  {
>  	struct cmdq_instruction inst = { {0} };
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> index 121c3bb..8ef87e1 100644
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
> index 8334021..8dbd046 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -12,6 +12,7 @@
>  #include <linux/timer.h>
>  
>  #define CMDQ_NO_TIMEOUT		0xffffffffu
> +#define CMDQ_SPR_TEMP		0
>  
>  struct cmdq_pkt;
>  
> @@ -103,6 +104,18 @@ int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
>  			u16 offset, u32 value, u32 mask);
>  
>  /**
> + * cmdq_pkt_write_s() - append write_s command with mask to the CMDQ packet
> + * @pkt:	the CMDQ packet
> + * @addr:	the physical address of register or dma
> + * @value:	the specified target value
> + * @mask:	the specified target mask
> + *
> + * Return: 0 for success; else the error code is returned
> + */
> +int cmdq_pkt_write_s(struct cmdq_pkt *pkt, dma_addr_t addr,
> +		     u32 value, u32 mask);

You have an API cmdq_pkt_read_s() which read data into gce internal
register, so I expect that cmdq_pkt_write_s() is an API which write data
from gce internal register, the expected prototype is

int cmdq_pkt_write_s(struct cmdq_pkt *pkt, phys_addr_t addr, u16
reg_idx);

Your version would confuse the user because you hide the internal
register parameter. If you want to provide this service, I would like
you to change the function name so that user would not be confused and
easily to understand what you want to do in this function.

Another choice is: cmdq_pkt_write_s() is implemented in my definition,
and user could call cmdq_pkt_assign() and cmdq_pkt_write_s() to achieve
this function.

Regards,
CK

> +
> +/**
>   * cmdq_pkt_wfe() - append wait for event command to the CMDQ packet
>   * @pkt:	the CMDQ packet
>   * @event:	the desired event type to "wait and CLEAR"

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
