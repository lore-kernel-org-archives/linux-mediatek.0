Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85B9C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 09:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L5OouRa8V0DY6xOXp1v0U33NkhOT/S9fsm0smuWXLTY=; b=aT315XfZttBU3h
	/wfQyzeVludKk2uddKqIL7DHIb9k0apKXzc6fAZB139pvC5z5pWcR+I9tOnUZG1fo4aCB4f15lWP1
	9I+FT3lvWLJ2/RpZhYbM33PKfnRXG0x2PJQ23y510K5UwbKRh+rp1ct5ApadCA6lHm/11/R77OwRG
	mOvs3VMSlQUjBxo1Z8RM8YzbujjOC0jLFv/e+7uJ1UZmai1LJFh++Ce8U1m9tHImebkhxum5K08uR
	SRlKcHh5kokVNMSmJHb38NHOlBxEc3XprN+r2oHZSU+XHEllPe2CYsEwA6wnt4/tST4aY/WA1E7mq
	IORxAcB8AE9FDYLFQGdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVi8-006KCm-DL; Tue, 07 Jun 2022 09:41:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVNo-006AHs-K4; Tue, 07 Jun 2022 09:20:18 +0000
X-UUID: 731027390ffe49d988d69bf4a076c055-20220607
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:422ac3e1-ab88-4c37-be1d-9965033c708c,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:2a19b09,CLOUDID:a093777e-c8dc-403a-96e8-6237210dceee,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 731027390ffe49d988d69bf4a076c055-20220607
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 442266028; Tue, 07 Jun 2022 02:20:10 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jun 2022 02:20:09 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 7 Jun 2022 17:20:07 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Jun 2022 17:20:07 +0800
Message-ID: <f807ee3b6fbfe1e5af29e07c07e61eec03abf368.camel@mediatek.com>
Subject: Re: [PATCH v19 6/6] soc: mediatek: mutex: add functions that
 operate registers by CMDQ
From: CK Hu <ck.hu@mediatek.com>
To: Moudy Ho <moudy.ho@mediatek.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
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
Date: Tue, 7 Jun 2022 17:20:07 +0800
In-Reply-To: <20220531055224.19280-7-moudy.ho@mediatek.com>
References: <20220531055224.19280-1-moudy.ho@mediatek.com>
	 <20220531055224.19280-7-moudy.ho@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_022016_754279_B70115B9 
X-CRM114-Status: GOOD (  26.12  )
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

Hi, Moudy:

On Tue, 2022-05-31 at 13:52 +0800, Moudy Ho wrote:
> Due to HW limitations, MDP3 is necessary to enable MUTEX in each
> frame
> for SOF triggering and cooperate with CMDQ control to reduce the
> amount
> of interrupts generated(also, reduce frame latency).
> 
> In response to the above situation, a new interface
> "mtk_mutex_enable_by_cmdq" has been added to achieve the purpose.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-mutex.c       | 45
> +++++++++++++++++++++++++-
>  include/linux/soc/mediatek/mtk-mutex.h |  2 ++
>  2 files changed, 46 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c
> b/drivers/soc/mediatek/mtk-mutex.c
> index 23009445adb4..b93dd391fc86 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -7,10 +7,12 @@
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> +#include <linux/of_address.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/soc/mediatek/mtk-mmsys.h>
>  #include <linux/soc/mediatek/mtk-mutex.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
>  
>  #define MT2701_MUTEX0_MOD0			0x2c
>  #define MT2701_MUTEX0_SOF0			0x30
> @@ -204,6 +206,8 @@ struct mtk_mutex_ctx {
>  	void __iomem			*regs;
>  	struct mtk_mutex		mutex[10];
>  	const struct mtk_mutex_data	*data;
> +	phys_addr_t			addr;
> +	struct cmdq_client_reg		cmdq_reg;
>  };
>  
>  static const unsigned int mt2701_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> @@ -594,6 +598,30 @@ void mtk_mutex_enable(struct mtk_mutex *mutex)
>  }
>  EXPORT_SYMBOL_GPL(mtk_mutex_enable);
>  
> +int mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex, void *pkt)
> +{
> +	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> mtk_mutex_ctx,
> +						 mutex[mutex->id]);
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +	struct cmdq_pkt *cmdq_pkt = (struct cmdq_pkt *)pkt;
> +
> +	WARN_ON(&mtx->mutex[mutex->id] != mutex);
> +
> +	if (!mtx->cmdq_reg.size) {
> +		dev_err(mtx->dev, "mediatek,gce-client-reg hasn't been
> set");
> +		return -EINVAL;
> +	}
> +
> +	cmdq_pkt_write(cmdq_pkt, mtx->cmdq_reg.subsys,
> +		       mtx->addr + DISP_REG_MUTEX_EN(mutex->id), 1);
> +	return 0;
> +#else
> +	dev_err(mtx->dev, "Not support for enable MUTEX by CMDQ");
> +	return -ENODEV;
> +#endif
> +}
> +EXPORT_SYMBOL_GPL(mtk_mutex_enable_by_cmdq);
> +
>  void mtk_mutex_disable(struct mtk_mutex *mutex)
>  {
>  	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> mtk_mutex_ctx,
> @@ -690,8 +718,11 @@ static int mtk_mutex_probe(struct
> platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct mtk_mutex_ctx *mtx;
> -	struct resource *regs;
> +	struct resource *regs, addr;
>  	int i;
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +	int ret;
> +#endif
>  
>  	mtx = devm_kzalloc(dev, sizeof(*mtx), GFP_KERNEL);
>  	if (!mtx)
> @@ -711,6 +742,18 @@ static int mtk_mutex_probe(struct
> platform_device *pdev)
>  		}
>  	}
>  
> +	if (of_address_to_resource(dev->of_node, 0, &addr) < 0) {
> +		dev_err(dev, "Failed to get addr\n");
> +		return -EINVAL;
> +	}
> +	mtx->addr = addr.start;
> +
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +	ret = cmdq_dev_get_client_reg(dev, &mtx->cmdq_reg, 0);
> +	if (ret)
> +		dev_dbg(dev, "No mediatek,gce-client-reg!\n");
> +#endif
> +
>  	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	mtx->regs = devm_ioremap_resource(dev, regs);
>  	if (IS_ERR(mtx->regs)) {
> diff --git a/include/linux/soc/mediatek/mtk-mutex.h
> b/include/linux/soc/mediatek/mtk-mutex.h
> index 829231523e3f..385ec8795c1d 100644
> --- a/include/linux/soc/mediatek/mtk-mutex.h
> +++ b/include/linux/soc/mediatek/mtk-mutex.h
> @@ -35,6 +35,8 @@ int mtk_mutex_prepare(struct mtk_mutex *mutex);
>  void mtk_mutex_add_comp(struct mtk_mutex *mutex,
>  			enum mtk_ddp_comp_id id);
>  void mtk_mutex_enable(struct mtk_mutex *mutex);
> +int mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex,
> +			     void *pkt);
>  void mtk_mutex_disable(struct mtk_mutex *mutex);
>  void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
>  			   enum mtk_ddp_comp_id id);


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
