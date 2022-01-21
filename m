Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF3FC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jan 2022 02:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IWoI9HJkB1E5pzEluWWQ6/9kw1IcmyMdldmezycjY+I=; b=MtNJYbzIm/2uBB
	bmrTVttoxEATJE4wkDIu+8GKUr9miMAWb4UmRbWa51PxTw2V5tnbqJZz+aiCJ4RJv6Yr7juZXSaa0
	Lvkmbec7dNDVTXFBQNL+bT4OiusHVzSYTen++9T5mMwG5HsU5uckbWPVI+aCIf7Rh5seIUEsqCqE8
	LAMw9sc7gCrZGtIwTcKi3DJb0ymfO6xT9sAFEUJAY9Xwmv08kQobcALJPmLgP0A50pTzixtjan4kI
	/TwQpHC/DIyfyMcAqTFci/B+Zrj3DaiSaBFosRO1sCHXZFUL+YKzrJ7ENdFDnVa8CxK2DqYrBnQXD
	2b/qRBv4h2tnfCiBX9Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAjMK-00Dbiu-LR; Fri, 21 Jan 2022 02:09:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAjMH-00DbhO-91; Fri, 21 Jan 2022 02:08:58 +0000
X-UUID: e0b8d0adaaba47c5b0905935aeaa52f8-20220120
X-UUID: e0b8d0adaaba47c5b0905935aeaa52f8-20220120
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 868062671; Thu, 20 Jan 2022 19:08:50 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Jan 2022 18:08:49 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 21 Jan 2022 10:08:47 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 21 Jan 2022 10:08:47 +0800
Message-ID: <e4328a0fd2c97d073793532d238abd781797fe13.camel@mediatek.com>
Subject: Re: [PATCH v1, 1/1] soc: mediatek: cmdq: add cmdq_pkt_poll_addr
 function
From: CK Hu <ck.hu@mediatek.com>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
CC: <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, David Airlie
 <airlied@linux.ie>, Jassi Brar <jassisinghbrar@gmail.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Dennis YC
 Hsieh" <dennis-yc.hsieh@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, mtk18742 <moudy.ho@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>
Date: Fri, 21 Jan 2022 10:08:47 +0800
In-Reply-To: <20220120074311.2243-2-yongqiang.niu@mediatek.com>
References: <20220120074311.2243-1-yongqiang.niu@mediatek.com>
 <20220120074311.2243-2-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_180857_365250_A3191CBC 
X-CRM114-Status: GOOD (  21.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Yongqiang:

On Thu, 2022-01-20 at 15:43 +0800, Yongqiang Niu wrote:
> From: mtk18742 <moudy.ho@mediatek.com>
> 
> add cmdq_pkt_poll_addr function in cmdq helper functions
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-cmdq-helper.c   | 39
> ++++++++++++++++++++++++
>  include/linux/mailbox/mtk-cmdq-mailbox.h |  1 +
>  include/linux/soc/mediatek/mtk-cmdq.h    |  2 ++
>  3 files changed, 42 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c
> b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 3c8e4212d941..6c5cfb284140 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -344,6 +344,45 @@ int cmdq_pkt_set_event(struct cmdq_pkt *pkt, u16
> event)
>  }
>  EXPORT_SYMBOL(cmdq_pkt_set_event);
>  
> +s32 cmdq_pkt_poll_addr(struct cmdq_pkt *pkt, u32 value, u32 addr,
> u32 mask, u8 reg_gpr)
> +{
> +	struct cmdq_instruction inst = { {0} };
> +
> +	s32 err;
> +
> +	if (mask != 0xffffffff) {
> +		inst.op = CMDQ_CODE_MASK;
> +		inst.mask = ~mask;
> +		err = cmdq_pkt_append_command(pkt, inst);
> +		if (err != 0)
> +			return err;
> +
> +		addr = addr | 0x1;
> +	}
> +
> +	/* Move extra handle APB address to GPR */
> +	inst.op = CMDQ_CODE_MOVE;
> +	inst.value = addr;
> +	inst.sop = reg_gpr;
> +	inst.dst_t = 1;
> +	err = cmdq_pkt_append_command(pkt, inst);
> +	if (err != 0)
> +		pr_err("%s fail append command move addr to reg
> err:%d",
> +			__func__, err);

cmdq_pkt_assign() could assign a value to GPR, so remove this part.

> +
> +	inst.op = CMDQ_CODE_POLL;
> +	inst.value = value;
> +	inst.sop = reg_gpr;
> +	inst.dst_t = 1;
> +	err = cmdq_pkt_append_command(pkt, inst);
> +	if (err != 0)
> +		pr_err("%s fail append command poll err:%d",
> +			__func__, err);
> +
> +	return err;
> +}
> +EXPORT_SYMBOL(cmdq_pkt_poll_addr);
> +
>  int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
>  		  u16 offset, u32 value)
>  {
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h
> b/include/linux/mailbox/mtk-cmdq-mailbox.h
> index 44365aab043c..a27329fd7c7f 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -54,6 +54,7 @@
>   */
>  enum cmdq_code {
>  	CMDQ_CODE_MASK = 0x02,
> +	CMDQ_CODE_MOVE = 0x02,
>  	CMDQ_CODE_WRITE = 0x04,
>  	CMDQ_CODE_POLL = 0x08,
>  	CMDQ_CODE_JUMP = 0x10,
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h
> b/include/linux/soc/mediatek/mtk-cmdq.h
> index ac6b5f3cba95..28dc5ce0ff03 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -280,4 +280,6 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
>  int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb
> cb,
>  			 void *data);
>  

Add comment for this function, parameters, and return value like other
interface.

Regards,
CK

> +s32 cmdq_pkt_poll_addr(struct cmdq_pkt *pkt, u32 value, u32 addr,
> u32 mask, u8 reg_gpr);
> +
>  #endif	/* __MTK_CMDQ_H__ */


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
