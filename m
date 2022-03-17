Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23983C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 23:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n1dk4L7P1OG2wZPUBkzNRD/km3XyuSBRfbXouyGNSmU=; b=ITc5OEWMlYn+LR
	8rOSpw8RPp4ca/3OvSOIPAsFeNmrfOCVlqe3JejfkMsUjbuoQ2PgUP5INdKOTyZ/wVmxjWrRTieRv
	NdkId66ZvLxZAHDRMTJvbXd+Cu0qMmUuWaIbB1ZbDZpn+Vs3AIJTQWaMjGZ6NpaFyzailZEm02i1r
	CjRqyRVwAMFyeyNBaJlss/bR4jLW/059vO936J12qO6WTaMTaXck7xbaOAMqiwhO0n1W660QLLD/Q
	9Unv5g/EGcnVVtBDxFlHQ2bpNdxKbhOM0sjfU26Wbtlsk9CTs4w1bEsnBPuSJkGONYnTYSniKa9RE
	ZrGCJuMP2WYnv2gKR2IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUzaP-00HaeD-PP; Thu, 17 Mar 2022 23:31:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUzaL-00HadH-PD; Thu, 17 Mar 2022 23:31:16 +0000
X-UUID: b7c711e7818940ab960aa72d7731cd42-20220317
X-UUID: b7c711e7818940ab960aa72d7731cd42-20220317
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1902914437; Thu, 17 Mar 2022 16:31:08 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Mar 2022 16:31:06 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 18 Mar 2022 07:31:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 18 Mar 2022 07:31:04 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <moudy.ho@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <acourbot@chromium.org>, <allen-kh.cheng@mediatek.com>,
 <angelogioacchino.delregno@collabora.com>, <chunkuang.hu@kernel.org>,
 <daoyuan.huang@mediatek.com>, <devicetree@vger.kernel.org>,
 <drinkcat@chromium.org>, <geert+renesas@glider.be>, <hsinyi@google.com>,
 <hverkuil-cisco@xs4all.nl>, <jason-jh.lin@mediatek.com>,
 <jernej.skrabec@siol.net>, <laurent.pinchart@ideasonboard.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <maoguang.meng@mediatek.com>, <matthias.bgg@gmail.com>, <mchehab@kernel.org>, 
 <menghui.lin@mediatek.com>, <pihsun@chromium.org>,
 <ping-hsun.wu@mediatek.com>, <randy.wu@mediatek.com>,
 <river.cheng@mediatek.com>, <rob@landley.net>, <robh+dt@kernel.org>,
 <roy-cw.yeh@mediatek.com>, <sj.huang@mediatek.com>,
 <srv_heupstream@mediatek.com>, <tfiga@chromium.org>
Subject: Re: [PATCH v14 6/6] soc: mediatek: mutex: add functions that operate
 registers by CMDQ
Date: Fri, 18 Mar 2022 07:31:04 +0800
Message-ID: <20220317233104.5994-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220317143926.15835-7-moudy.ho@mediatek.com>
References: <20220317143926.15835-7-moudy.ho@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_163113_853144_77AEBC18 
X-CRM114-Status: GOOD (  14.83  )
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

Hi Moudy,

>  #define MT2701_MUTEX0_MOD0			0x2c
>  #define MT2701_MUTEX0_SOF0			0x30
> @@ -180,6 +184,9 @@ struct mtk_mutex_ctx {
>  	void __iomem			*regs;
>  	struct mtk_mutex		mutex[10];
>  	const struct mtk_mutex_data	*data;
> +	phys_addr_t			addr;
> +	struct cmdq_client_reg		cmdq_reg;
> +	bool				has_gce_client_reg;
>  };
>

...snip...

>  static const unsigned int mt2701_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> @@ -638,6 +645,29 @@ void mtk_mutex_enable(struct mtk_mutex *mutex)
>  }
>  EXPORT_SYMBOL_GPL(mtk_mutex_enable);
>  
> +void mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex, void *pkt)
> +{
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
> +						 mutex[mutex->id]);
> +	struct cmdq_pkt *cmdq_pkt = (struct cmdq_pkt *)pkt;
> +
> +	WARN_ON(&mtx->mutex[mutex->id] != mutex);
> +
> +	if (!mtx->has_gce_client_reg) {
> +		dev_dbg(mtx->dev, "mediatek,gce-client-reg hasn't been set in dts");
> +		return;
> +	}
> +
> +	cmdq_pkt_write_mask(cmdq_pkt, mtx->cmdq_reg.subsys,
> +			    mtx->addr + DISP_REG_MUTEX_EN(mutex->id),
> +			    MTK_MUTEX_ENABLE, MTK_MUTEX_ENABLE);

We do not check if mtx->addr is valid.

> +#else
> +	dev_dbg(mtx->dev, "Not support for enable MUTEX by CMDQ");
> +#endif
> +}
> +EXPORT_SYMBOL_GPL(mtk_mutex_enable_by_cmdq);
> +
>  void mtk_mutex_disable(struct mtk_mutex *mutex)
>  {
>  	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
> @@ -676,7 +706,7 @@ static int mtk_mutex_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct mtk_mutex_ctx *mtx;
> -	struct resource *regs;
> +	struct resource *regs, addr;
>  	int i;
>  
>  	mtx = devm_kzalloc(dev, sizeof(*mtx), GFP_KERNEL);
> @@ -697,6 +727,19 @@ static int mtk_mutex_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	if (of_address_to_resource(dev->of_node, 0, &addr) < 0)
> +		mtx->addr = 0L;

addr is phys_addr_t, which means that it holds a physical address.
0 may be a valid address in some platforms, so I think
we should not set mtx->addr = 0L when of_address_to_resource fails.
Maybe probe fail by returning dev_err_probe()?

Thanks,
Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
