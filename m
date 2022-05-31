Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5705C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 03:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rOEUOKLN02qm3Q/xRjL8bkAocZ6L2yAUpDGA6/OzUAQ=; b=RHQnWShGnKmSwC
	8JGFFn0DLyBKn6TgozcyEnA7c5hWxx5dR+wzHgkS9WwsG86FO1tVFcyHqs3Zb9vwsMzWi7YbAVfxX
	ic7pm+ypiniaCa633ZPKeYFs4duRxNrq4/mzO9KOTLSY5CKmlexoPV7zcD+UeivRbme0iS6o9g4A9
	TBqyg4AcXfcvGl122D/a9V32LOv97xInqrNBKS40saWUoEqRTZ7U3kYsFAdWLyxkJ6dqeslLNJrh2
	No+ySswmazODC/ibC+GWG+aj+S6dgKrjGT5k3+PpFUqvfARApEtLZvrI9laA10hEUFt+vaUiVKk3i
	Lk1RWd6uhBTu9Gfxqj9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvsLM-0093Hv-2d; Tue, 31 May 2022 03:14:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvsL9-0093F1-QC; Tue, 31 May 2022 03:14:42 +0000
X-UUID: 8ffa9a9d3f434e84b9cec1820d063a4e-20220530
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:354642b6-578c-47f5-aab8-a393e9699bb4,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:ad8fe889-32d7-4fc0-b2ef-8776ac194f8f,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 8ffa9a9d3f434e84b9cec1820d063a4e-20220530
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1432629237; Mon, 30 May 2022 20:14:32 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 May 2022 20:14:30 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 May 2022 11:14:28 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 31 May 2022 11:14:28 +0800
Message-ID: <0be08ae65ccaa7c429ad1280b32ca67a2b75244a.camel@mediatek.com>
Subject: Re: [PATCH v18 6/6] soc: mediatek: mutex: add functions that
 operate registers by CMDQ
From: moudy.ho <moudy.ho@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Alexandre Courbot
	<acourbot@chromium.org>, <tfiga@chromium.org>, <drinkcat@chromium.org>,
	<pihsun@chromium.org>, <hsinyi@google.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, daoyuan huang
	<daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
	<allen-kh.cheng@mediatek.com>, <xiandong.wang@mediatek.com>,
	<randy.wu@mediatek.com>, <jason-jh.lin@mediatek.com>,
	<roy-cw.yeh@mediatek.com>, <river.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<cellopoint.kai@gmail.com>
Date: Tue, 31 May 2022 11:14:24 +0800
In-Reply-To: <997da91ccc893a53cf4e7713ba08b5e32043c507.camel@mediatek.com>
References: <20220512084139.15086-1-moudy.ho@mediatek.com>
	 <20220512084139.15086-7-moudy.ho@mediatek.com>
	 <997da91ccc893a53cf4e7713ba08b5e32043c507.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_201439_911723_D5C04655 
X-CRM114-Status: GOOD (  33.52  )
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

On Fri, 2022-05-27 at 17:30 +0800, CK Hu wrote:
> Hi, Moudy:
> 
> On Thu, 2022-05-12 at 16:41 +0800, Moudy Ho wrote:
> > Due to HW limitations, MDP3 is necessary to enable MUTEX in each
> > frame
> > for SOF triggering and cooperate with CMDQ control to reduce the
> > amount
> > of interrupts generated(also, reduce frame latency).
> > 
> > In response to the above situation, a new interface
> > "mtk_mutex_enable_by_cmdq" has been added to achieve the purpose.
> > 
> > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/soc/mediatek/mtk-mutex.c       | 47
> > +++++++++++++++++++++++++-
> >  include/linux/soc/mediatek/mtk-mutex.h |  2 ++
> >  2 files changed, 48 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mutex.c
> > b/drivers/soc/mediatek/mtk-mutex.c
> > index 92afdee14d43..4ec2954f2f43 100644
> > --- a/drivers/soc/mediatek/mtk-mutex.c
> > +++ b/drivers/soc/mediatek/mtk-mutex.c
> > @@ -7,10 +7,12 @@
> >  #include <linux/iopoll.h>
> >  #include <linux/module.h>
> >  #include <linux/of_device.h>
> > +#include <linux/of_address.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> >  #include <linux/soc/mediatek/mtk-mmsys.h>
> >  #include <linux/soc/mediatek/mtk-mutex.h>
> > +#include <linux/soc/mediatek/mtk-cmdq.h>
> >  
> >  #define MT2701_MUTEX0_MOD0			0x2c
> >  #define MT2701_MUTEX0_SOF0			0x30
> > @@ -176,6 +178,9 @@ struct mtk_mutex_ctx {
> >  	void __iomem			*regs;
> >  	struct mtk_mutex		mutex[10];
> >  	const struct mtk_mutex_data	*data;
> > +	phys_addr_t			addr;
> > +	struct cmdq_client_reg		cmdq_reg;
> > +	bool				has_gce_client_reg;
> 
> I think this is not necessary. If cmdq_reg.size == 0, that would
> imply
> cmdq_reg is invalid.
> 

Hi CK,

Thanks for the reminder, I'll remove this unnecessary flag.

> >  };
> >  
> >  static const unsigned int mt2701_mutex_mod[DDP_COMPONENT_ID_MAX] =
> > {
> > @@ -531,6 +536,30 @@ void mtk_mutex_enable(struct mtk_mutex *mutex)
> >  }
> >  EXPORT_SYMBOL_GPL(mtk_mutex_enable);
> >  
> > +int mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex, void *pkt)
> > +{
> > +	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> > mtk_mutex_ctx,
> > +						 mutex[mutex->id]);
> > +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > +	struct cmdq_pkt *cmdq_pkt = (struct cmdq_pkt *)pkt;
> > +
> > +	WARN_ON(&mtx->mutex[mutex->id] != mutex);
> > +
> > +	if (!mtx->has_gce_client_reg) {
> > +		dev_err(mtx->dev, "mediatek,gce-client-reg hasn't been
> > set in dts");
> > +		return -EINVAL;
> > +	}
> > +
> > +	cmdq_pkt_write(cmdq_pkt, mtx->cmdq_reg.subsys,
> > +		       mtx->addr + DISP_REG_MUTEX_EN(mutex->id), 1);
> > +	return 0;
> > +#else
> > +	dev_err(mtx->dev, "Not support for enable MUTEX by CMDQ");
> > +	return -ENODEV;
> > +#endif
> > +}
> > +EXPORT_SYMBOL_GPL(mtk_mutex_enable_by_cmdq);
> > +
> >  void mtk_mutex_disable(struct mtk_mutex *mutex)
> >  {
> >  	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> > mtk_mutex_ctx,
> > @@ -655,8 +684,11 @@ static int mtk_mutex_probe(struct
> > platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> >  	struct mtk_mutex_ctx *mtx;
> > -	struct resource *regs;
> > +	struct resource *regs, addr;
> >  	int i;
> > +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > +	int ret;
> > +#endif
> >  
> >  	mtx = devm_kzalloc(dev, sizeof(*mtx), GFP_KERNEL);
> >  	if (!mtx)
> > @@ -676,6 +708,19 @@ static int mtk_mutex_probe(struct
> > platform_device *pdev)
> >  		}
> >  	}
> >  
> > +	if (of_address_to_resource(dev->of_node, 0, &addr) < 0)
> > +		mtx->addr = 0L;
> 
> You may return error, or you should check mtx->addr when use it.
> 
> Regards,
> CK
> 

This will be fixed in the next version.

Thanks,
Moudy
> > +	else
> > +		mtx->addr = addr.start;
> > +
> > +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > +	ret = cmdq_dev_get_client_reg(dev, &mtx->cmdq_reg, 0);
> > +	if (ret)
> > +		dev_dbg(dev, "No mediatek,gce-client-reg!\n");
> > +	else
> > +		mtx->has_gce_client_reg = true;
> > +#endif
> > +
> >  	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >  	mtx->regs = devm_ioremap_resource(dev, regs);
> >  	if (IS_ERR(mtx->regs)) {
> > diff --git a/include/linux/soc/mediatek/mtk-mutex.h
> > b/include/linux/soc/mediatek/mtk-mutex.h
> > index f174452212d6..80425ae19fb7 100644
> > --- a/include/linux/soc/mediatek/mtk-mutex.h
> > +++ b/include/linux/soc/mediatek/mtk-mutex.h
> > @@ -29,6 +29,8 @@ int mtk_mutex_prepare(struct mtk_mutex *mutex);
> >  void mtk_mutex_add_comp(struct mtk_mutex *mutex,
> >  			enum mtk_ddp_comp_id id);
> >  void mtk_mutex_enable(struct mtk_mutex *mutex);
> > +int mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex,
> > +			     void *pkt);
> >  void mtk_mutex_disable(struct mtk_mutex *mutex);
> >  void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
> >  			   enum mtk_ddp_comp_id id);
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
