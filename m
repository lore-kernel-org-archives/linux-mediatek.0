Return-Path: <SRS0=hXrw=JF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D34CC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 05:57:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD81061181
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 05:57:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD81061181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rZejzAzqCmqMsEwKxwwYDLp4n7ysOwW5OoOS5CNfe9U=; b=q8lAKaP/Ts3JuJIVk3Bq1Ab5d
	XyOkj3smel/KosXrAf1Tp06gQZOQXkpCyCbtDrlTGF6k7eaYjx2dIC9djXPdWoiNPawK40bA2yH+t
	FdRLy8qAMIDqVOs12oPvSXHt/yHmnuya8USs/5H2azXI93lp4+hqgkTE/exFedaKhCDou2/jVIQcN
	HRAbgCtaTKgCjUGhjz5r5vTGZVyqumGqq6LaRxZnkHfz+m76x86qnvBGxCYvBfNoSAXMyi5Oeq8ui
	DdojKgee7aUOXPLPke+oHNUEVHq4zmsG3lsBKNp+4b4ibqtUiogDyVC8xu5In5BA3eYUSE5ZWDFG8
	sZD44qbkg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUNfM-0071zq-Ci; Thu, 08 Apr 2021 05:57:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUNfG-0071y6-Qe; Thu, 08 Apr 2021 05:57:17 +0000
X-UUID: edf8e6de4bdf44ec9843b6f7e5bbae92-20210407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NF6+KA1hmcxu8LOS4sh14AzA0G1CRSU3hyieSqe1wFQ=; 
 b=rk4R+Bhuk0RgMXW6IW8wB7poaU/a0Lp42O7LQDSO4ysz1h12KNbbSwd7NgyoXKS4WLMt+CUdNHUYEwMVorL9ge/0cJLwlu1uGJ7AKym9ZrseU0J1htMIn9OBLZTaR5h+pcogN0G8SdCtb8sigCVLJzVblvPg0JPTj68BOJHpIpM=;
X-UUID: edf8e6de4bdf44ec9843b6f7e5bbae92-20210407
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <nina-cm.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1181786787; Wed, 07 Apr 2021 22:57:04 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Apr 2021 22:57:02 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Apr 2021 13:57:01 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 8 Apr 2021 13:57:01 +0800
Message-ID: <1617861421.8874.3.camel@mtksdccf07>
Subject: Re: [PATCH v2 2/6] soc: mediatek: devapc: move 'vio_idx_num' info
 to DT
From: Nina Wu <nina-cm.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>, Zhen Lei <thunder.leizhen@huawei.com>,
 Neal Liu <neal.liu@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <Jackson-kt.Chang@mediatek.com>
Date: Thu, 8 Apr 2021 13:57:01 +0800
In-Reply-To: <39794302-7993-4f9c-b28c-577fdb0265a3@gmail.com>
References: <1617259087-5502-1-git-send-email-nina-cm.wu@mediatek.com>
 <1617259087-5502-2-git-send-email-nina-cm.wu@mediatek.com>
 <39794302-7993-4f9c-b28c-577fdb0265a3@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_065715_424947_05FEE9EA 
X-CRM114-Status: GOOD (  32.02  )
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

Hi, Matthias


On Tue, 2021-04-06 at 15:41 +0200, Matthias Brugger wrote:
> 
> On 01/04/2021 08:38, Nina Wu wrote:
> > From: Nina Wu <Nina-CM.Wu@mediatek.com>
> > 
> > For new ICs, there are multiple devapc HWs for different subsys.
> > The number of devices controlled by each devapc (i.e. 'vio_idx_num'
> > in the code) varies.
> > We move this info from compatible data to DT so that we do not need
> > to add n compatible for a certain IC which has n devapc HWs with
> > different 'vio_idx_num', respectively.
> > 
> > Signed-off-by: Nina Wu <Nina-CM.Wu@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mtk-devapc.c | 18 +++++++++---------
> >  1 file changed, 9 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
> > index f1cea04..a0f6fbd 100644
> > --- a/drivers/soc/mediatek/mtk-devapc.c
> > +++ b/drivers/soc/mediatek/mtk-devapc.c
> > @@ -32,9 +32,6 @@ struct mtk_devapc_vio_dbgs {
> >  };
> >  
> >  struct mtk_devapc_data {
> > -	/* numbers of violation index */
> > -	u32 vio_idx_num;
> > -
> >  	/* reg offset */
> >  	u32 vio_mask_offset;
> >  	u32 vio_sta_offset;
> > @@ -49,6 +46,7 @@ struct mtk_devapc_data {
> >  struct mtk_devapc_context {
> >  	struct device *dev;
> >  	void __iomem *infra_base;
> > +	u32 vio_idx_num;
> 
> We should try to stay backwards compatible (newer kernel with older DTS). I
> think we don't need to move vio_idx_num to mtk_devapc_context. Just don't
> declare it in the per SoC match data. More details see below...
> 
> >  	struct clk *infra_clk;
> >  	const struct mtk_devapc_data *data;
> >  };
> > @@ -60,10 +58,10 @@ static void clear_vio_status(struct mtk_devapc_context *ctx)
> >  
> >  	reg = ctx->infra_base + ctx->data->vio_sta_offset;
> >  
> > -	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->data->vio_idx_num) - 1; i++)
> > +	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->vio_idx_num - 1); i++)
> >  		writel(GENMASK(31, 0), reg + 4 * i);
> >  
> > -	writel(GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num) - 1, 0),
> > +	writel(GENMASK(VIO_MOD_TO_REG_OFF(ctx->vio_idx_num - 1), 0),
> >  	       reg + 4 * i);
> >  }
> >  
> > @@ -80,15 +78,15 @@ static void mask_module_irq(struct mtk_devapc_context *ctx, bool mask)
> >  	else
> >  		val = 0;
> >  
> > -	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->data->vio_idx_num) - 1; i++)
> > +	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->vio_idx_num - 1); i++)
> >  		writel(val, reg + 4 * i);
> >  
> >  	val = readl(reg + 4 * i);
> >  	if (mask)
> > -		val |= GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num) - 1,
> > +		val |= GENMASK(VIO_MOD_TO_REG_OFF(ctx->vio_idx_num - 1),
> >  			       0);
> >  	else
> > -		val &= ~GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num) - 1,
> > +		val &= ~GENMASK(VIO_MOD_TO_REG_OFF(ctx->vio_idx_num - 1),
> >  				0);
> >  
> >  	writel(val, reg + 4 * i);
> > @@ -216,7 +214,6 @@ static void stop_devapc(struct mtk_devapc_context *ctx)
> >  }
> >  
> >  static const struct mtk_devapc_data devapc_mt6779 = {
> > -	.vio_idx_num = 511,
> >  	.vio_mask_offset = 0x0,
> >  	.vio_sta_offset = 0x400,
> >  	.vio_dbg0_offset = 0x900,
> > @@ -256,6 +253,9 @@ static int mtk_devapc_probe(struct platform_device *pdev)
> >  	if (!ctx->infra_base)
> >  		return -EINVAL;
> >  
> > +	if (of_property_read_u32(node, "vio_idx_num", &ctx->vio_idx_num))
> > +		return -EINVAL;
> > +
> 
> ...only read the property if  vio_idx_num == 0.
> What do you think?
> 
> Regards,
> Matthias
> 

Good idea. I will fix it in the next version.

Thanks


> >  	devapc_irq = irq_of_parse_and_map(node, 0);
> >  	if (!devapc_irq)
> >  		return -EINVAL;
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
