Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D96AC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 03:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=94L+Ew38SHg8HRsvIgdmKlzSJ9Y/cLxuLKndqVDRSac=; b=AwOjLNLTAFB9uG
	HhjCyvFFB+pFReviyx8JwGTU6cq8WKrWr8FFpWmC3FGneDsTJfclWOxaz0nSo0gqkp/M6/KiL3ePZ
	7LiQ/SDZxJKmr7tJIJDjLAe5XqFVRKyyA1RAm5jg3eCvldNZdW2shGO55i0OJMAl+lnQ2I7vqJ5Yc
	MzQlZczIKIbl1aZ6sOJOFPfbtmbFc619PgZ0MXki33RsJfv/ZDmXajQhCG7fXlObwSaA89Bvtb+ZW
	Ak8m3z1VuenQKL59YJAMxie9DjL6gcYNWbDBmWCplebAjPfiBwiDk9LKEUYjBh4wq0h1UyP6uB5bq
	DhdgYEMr0xh1rMrskJ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUh6X-00EqHK-Vb; Thu, 17 Mar 2022 03:47:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUh6T-00EqGa-BL; Thu, 17 Mar 2022 03:47:12 +0000
X-UUID: aa5e5bae445545ebbf2c9106eb9fe302-20220316
X-UUID: aa5e5bae445545ebbf2c9106eb9fe302-20220316
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1484292358; Wed, 16 Mar 2022 20:47:02 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Mar 2022 20:39:09 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Mar 2022 11:39:07 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Mar 2022 11:39:07 +0800
Message-ID: <e5b33e4be119c3dc425b9d2810df4556240861c3.camel@mediatek.com>
Subject: Re: [PATCH v13 6/6] soc: mediatek: mutex: add functions that
 operate registers by CMDQ
From: CK Hu <ck.hu@mediatek.com>
To: Moudy Ho <moudy.ho@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Jernej
 Skrabec" <jernej.skrabec@siol.net>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Rob Landley <rob@landley.net>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Alexandre Courbot <acourbot@chromium.org>, <tfiga@chromium.org>,
 <drinkcat@chromium.org>, <pihsun@chromium.org>, <hsinyi@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>, daoyuan huang
 <daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 <menghui.lin@mediatek.com>, <sj.huang@mediatek.com>,
 <allen-kh.cheng@mediatek.com>, <randy.wu@mediatek.com>,
 <jason-jh.lin@mediatek.com>, <roy-cw.yeh@mediatek.com>,
 <river.cheng@mediatek.com>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 17 Mar 2022 11:39:07 +0800
In-Reply-To: <20220315061031.21642-7-moudy.ho@mediatek.com>
References: <20220315061031.21642-1-moudy.ho@mediatek.com>
 <20220315061031.21642-7-moudy.ho@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_204709_406774_04AECBE9 
X-CRM114-Status: GOOD (  26.18  )
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

On Tue, 2022-03-15 at 14:10 +0800, Moudy Ho wrote:
> Due to hardware limitations, MDP3 is necessary to enable MUTEX in
> each frame for SOF triggering and cooperate with CMDQ control to
> reduce the amount of interrupts generated(also, reduce frame
> latency).
> 
> In response to the above situation, a new interface
> "mtk_mutex_enable_by_cmdq" has been added to achieve the purpose.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-mutex.c       | 42
> +++++++++++++++++++++++++-
>  include/linux/soc/mediatek/mtk-mutex.h |  2 ++
>  2 files changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c
> b/drivers/soc/mediatek/mtk-mutex.c
> index 88fb4fc8f216..0d85111cfbe2 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -7,10 +7,16 @@
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> +#include <linux/of_address.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/soc/mediatek/mtk-mmsys.h>
>  #include <linux/soc/mediatek/mtk-mutex.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
> +
> +#define MTK_MUTEX_ENABLE			BIT(0)

This is not related to cmdq. Separate this to another patch and apply
to mtk_mutex_enable() also.

> +#define MTK_MUTEX_MOD_MASK			0x07FFFFFF

Useless, remove.

> +#define MTK_MUTEX_SOF_MASK			0x00000007

Ditto.

>  
>  #define MT2701_MUTEX0_MOD0			0x2c
>  #define MT2701_MUTEX0_SOF0			0x30
> @@ -167,6 +173,7 @@ struct mtk_mutex_data {
>  	const unsigned int mutex_sof_reg;
>  	const unsigned long long *mutex_table_mod;
>  	const bool no_clk;
> +	const bool has_gce_client_reg;
>  };
>  
>  struct mtk_mutex_ctx {
> @@ -175,6 +182,8 @@ struct mtk_mutex_ctx {
>  	void __iomem			*regs;
>  	struct mtk_mutex		mutex[10];
>  	const struct mtk_mutex_data	*data;
> +	phys_addr_t			addr;
> +	struct cmdq_client_reg		cmdq_reg;
>  };
>  
>  static const unsigned int mt2701_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> @@ -357,6 +366,7 @@ static const struct mtk_mutex_data
> mt8183_mutex_driver_data = {
>  	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
>  	.mutex_table_mod = mt8183_mutex_table_mod,
>  	.no_clk = true,
> +	.has_gce_client_reg = true,
>  };
>  
>  static const struct mtk_mutex_data mt8186_mutex_driver_data = {
> @@ -639,6 +649,22 @@ void mtk_mutex_enable(struct mtk_mutex *mutex)
>  }
>  EXPORT_SYMBOL_GPL(mtk_mutex_enable);
>  
> +void mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex,
> +			      struct cmdq_pkt *pkt)
> +{
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> mtk_mutex_ctx,
> +						 mutex[mutex->id]);
> +
> +	WARN_ON(&mtx->mutex[mutex->id] != mutex);
> +
> +	cmdq_pkt_write_mask(pkt, mtx->cmdq_reg.subsys,
> +			    mtx->aaddr + DISP_REG_MUTEX_EN(mutex->id),
> +			    MTK_MUTEX_ENABLE, MTK_MUTEX_ENABLE);

#else
/* show some error message here */


> +#endif
> +}
> +EXPORT_SYMBOL_GPL(mtk_mutex_enable_by_cmdq);
> +
>  void mtk_mutex_disable(struct mtk_mutex *mutex)
>  {
>  	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> mtk_mutex_ctx,
> @@ -677,7 +703,7 @@ static int mtk_mutex_probe(struct platform_device
> *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct mtk_mutex_ctx *mtx;
> -	struct resource *regs;
> +	struct resource *regs, addr;
>  	int i;
>  
>  	mtx = devm_kzalloc(dev, sizeof(*mtx), GFP_KERNEL);
> @@ -698,6 +724,20 @@ static int mtk_mutex_probe(struct
> platform_device *pdev)
>  		}
>  	}
>  
> +	if (of_address_to_resource(dev->of_node, 0, &addr) < 0)
> +		mtx->addr = 0L;
> +	else
> +		mtx->addr = addr.start;
> +
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +	if (mtx->data->has_gce_client_reg) {

In current upstreamed mt8183.dtsi [1], mutex device node has no
mediatek,gce-client-reg property and display maybe work (?). So I think
this should be backward-compatible.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/mediatek/mt8183.dtsi?h=v5.17-rc8#n1510

Regards,
CK

> +		if (cmdq_dev_get_client_reg(dev, &mtx->cmdq_reg, 0)) {
> +			dev_err(dev, "No mediatek,gce-client-reg!\n");
> +			return ret;
> +		}
> +	}
> +#endif
> +
>  	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	mtx->regs = devm_ioremap_resource(dev, regs);
>  	if (IS_ERR(mtx->regs)) {
> diff --git a/include/linux/soc/mediatek/mtk-mutex.h
> b/include/linux/soc/mediatek/mtk-mutex.h
> index c8355bb0e6d6..18a4b1dc3773 100644
> --- a/include/linux/soc/mediatek/mtk-mutex.h
> +++ b/include/linux/soc/mediatek/mtk-mutex.h
> @@ -45,6 +45,8 @@ void mtk_mutex_set_mod(struct mtk_mutex *mutex,
>  void mtk_mutex_set_sof(struct mtk_mutex *mutex,
>  		       enum mtk_mutex_table_index idx);
>  void mtk_mutex_enable(struct mtk_mutex *mutex);
> +void mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex,
> +			      struct cmdq_pkt *pkt);
>  void mtk_mutex_disable(struct mtk_mutex *mutex);
>  void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
>  			   enum mtk_ddp_comp_id id);


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
