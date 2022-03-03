Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F951C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 09:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=69dbhbUHZHvbTSobU+2S2LQMlvBp5ePH+mtNmb3oEZA=; b=FS2YcsYK+S00Ac
	UuJKJSn2gj/edeZZlusrx9kTPdmsm44cjsKOzghWFoHGQn0n0eoRvoUAwYZnZ5TbmGGuc+MTWwSpo
	39yHZ5WdHOZFeRQhx27wGwh3GAD9l1/mMkpsuwZneqw3kwaOiKTcKwsDl8xKUERm7uCVYqAXKqzv5
	EgDCb2wM59dzFi7Oak7M4ziHKpHrceco3mYH91FRZjvDbPS5qGPzPPsd6OY6ik0ZbIvcFOVjTFa/N
	085+aNnnEzF3vwvq40ArGAlGt27hnUR34SWoP/gcGAp4CK7/eRSoCxRoVRiPV6fc4XeSSldJalsRy
	/0YQqYcEA3EuEBPz7npA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPhRz-005q3j-6x; Thu, 03 Mar 2022 09:08:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPhRu-005q30-Ge; Thu, 03 Mar 2022 09:08:41 +0000
X-UUID: 83e694a9e02f49279244d35fe3e751f0-20220303
X-UUID: 83e694a9e02f49279244d35fe3e751f0-20220303
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 162589665; Thu, 03 Mar 2022 02:08:34 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Mar 2022 01:04:00 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 3 Mar 2022 17:03:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Mar 2022 17:03:58 +0800
Message-ID: <de1816aeb02206935567eee5af7fac10f3bae4ff.camel@mediatek.com>
Subject: Re: [PATCH v12 2/4] soc: mediatek: mmsys: add support for ISP control
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
Date: Thu, 3 Mar 2022 17:03:58 +0800
In-Reply-To: <20220301100246.2153-3-moudy.ho@mediatek.com>
References: <20220301100246.2153-1-moudy.ho@mediatek.com>
 <20220301100246.2153-3-moudy.ho@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_010838_577335_BD71D2E6 
X-CRM114-Status: GOOD (  23.99  )
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

On Tue, 2022-03-01 at 18:02 +0800, Moudy Ho wrote:
> This patch adds 8183 ISP settings in MMSYS domain and interface.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Acked-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/soc/mediatek/mt8183-mmsys.h    |  26 ++++++
>  drivers/soc/mediatek/mtk-mmsys.c       | 115
> +++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.h       |   1 +
>  include/linux/soc/mediatek/mtk-mmsys.h |  30 +++++++
>  4 files changed, 172 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mt8183-mmsys.h
> b/drivers/soc/mediatek/mt8183-mmsys.h
> index 9dee485807c9..179d5996c659 100644
> --- a/drivers/soc/mediatek/mt8183-mmsys.h
> +++ b/drivers/soc/mediatek/mt8183-mmsys.h
> @@ -13,6 +13,18 @@
>  #define MT8183_DISP_RDMA0_SOUT_SEL_IN		0xf50
>  #define MT8183_DISP_RDMA1_SOUT_SEL_IN		0xf54
>  
> +#define MT8183_ISP_REG_MMSYS_SW0_RST_B		0x140
> +#define MT8183_ISP_REG_MMSYS_SW1_RST_B		0x144
> +#define MT8183_ISP_REG_MDP_ASYNC_CFG_WD		0x934
> +#define MT8183_ISP_REG_MDP_ASYNC_IPU_CFG_WD	0x93C
> +#define MT8183_ISP_REG_ISP_RELAY_CFG_WD		0x994
> +#define MT8183_ISP_REG_IPU_RELAY_CFG_WD		0x9a0
> +#define MT8183_ISP_BIT_MDP_DL_ASYNC_TX		BIT(3)
> +#define MT8183_ISP_BIT_MDP_DL_ASYNC_TX2		BIT(4)
> +#define MT8183_ISP_BIT_MDP_DL_ASYNC_RX		BIT(10)
> +#define MT8183_ISP_BIT_MDP_DL_ASYNC_RX2		BIT(11)
> +#define MT8183_ISP_BIT_NO_SOF_MODE		BIT(31)
> +
>  #define MT8183_OVL0_MOUT_EN_OVL0_2L		BIT(4)
>  #define MT8183_OVL0_2L_MOUT_EN_DISP_PATH0	BIT(0)
>  #define MT8183_OVL1_2L_MOUT_EN_RDMA1		BIT(4)
> @@ -57,5 +69,19 @@ static const struct mtk_mmsys_routes
> mmsys_mt8183_routing_table[] = {
>  	}
>  };
>  
> +static const unsigned int
> mmsys_mt8183_mdp_isp_ctrl_table[ISP_CTRL_MAX] = {
> +	[ISP_REG_MMSYS_SW0_RST_B] = MT8183_ISP_REG_MMSYS_SW0_RST_B,
> +	[ISP_REG_MMSYS_SW1_RST_B] = MT8183_ISP_REG_MMSYS_SW1_RST_B,
> +	[ISP_REG_MDP_ASYNC_CFG_WD] = MT8183_ISP_REG_MDP_ASYNC_CFG_WD,
> +	[ISP_REG_MDP_ASYNC_IPU_CFG_WD] =
> MT8183_ISP_REG_MDP_ASYNC_IPU_CFG_WD,
> +	[ISP_REG_ISP_RELAY_CFG_WD] = MT8183_ISP_REG_ISP_RELAY_CFG_WD,
> +	[ISP_REG_IPU_RELAY_CFG_WD] = MT8183_ISP_REG_IPU_RELAY_CFG_WD,
> +	[ISP_BIT_MDP_DL_ASYNC_TX] = MT8183_ISP_BIT_MDP_DL_ASYNC_TX,
> +	[ISP_BIT_MDP_DL_ASYNC_TX2] = MT8183_ISP_BIT_MDP_DL_ASYNC_TX2,
> +	[ISP_BIT_MDP_DL_ASYNC_RX] = MT8183_ISP_BIT_MDP_DL_ASYNC_RX,
> +	[ISP_BIT_MDP_DL_ASYNC_RX2] = MT8183_ISP_BIT_MDP_DL_ASYNC_RX2,
> +	[ISP_BIT_NO_SOF_MODE] = MT8183_ISP_BIT_NO_SOF_MODE,
> +};
> +
>  #endif /* __SOC_MEDIATEK_MT8183_MMSYS_H */
>  
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> b/drivers/soc/mediatek/mtk-mmsys.c
> index 04c0c7de395e..0e271d1a86e5 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -58,6 +58,7 @@ static const struct mtk_mmsys_driver_data
> mt8183_mmsys_driver_data = {
>  	.routes = mmsys_mt8183_routing_table,
>  	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
>  	.has_gce_client_reg = true,
> +	.mdp_isp_ctrl = mmsys_mt8183_mdp_isp_ctrl_table,
>  };
>  
>  static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data =
> {
> @@ -136,6 +137,120 @@ void mtk_mmsys_write_reg_by_cmdq(struct device
> *dev,
>  }
>  EXPORT_SYMBOL_GPL(mtk_mmsys_write_reg_by_cmdq);
>  
> +void mtk_mmsys_mdp_isp_ctrl(struct device *dev, struct
> mmsys_cmdq_cmd *cmd,
> +			    enum mtk_mdp_comp_id id)
> +{
> +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> +	const unsigned int *isp_ctrl = mmsys->data->mdp_isp_ctrl;
> +	u32 reg;
> +
> +	/* Direct link */
> +	if (id == MDP_COMP_CAMIN) {
> +		/* Reset MDP_DL_ASYNC_TX */

Why do you reset this hardware by CMDQ? Usually we reset one hardware
before it start or after it stop. In this timing, we could easily use
CPU to reset this hardware.

Regards,
CK

> +		if (isp_ctrl[ISP_REG_MMSYS_SW0_RST_B]) {
> +			reg = mmsys->addr +
> isp_ctrl[ISP_REG_MMSYS_SW0_RST_B];
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys-
> >cmdq_base.subsys, reg,
> +					    0x0,
> +					    isp_ctrl[ISP_BIT_MDP_DL_ASY
> NC_TX]);
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys-
> >cmdq_base.subsys, reg,
> +					    isp_ctrl[ISP_BIT_MDP_DL_ASY
> NC_TX],
> +					    isp_ctrl[ISP_BIT_MDP_DL_ASY
> NC_TX]);
> +		}
> +
> +		/* Reset MDP_DL_ASYNC_RX */
> +		if (isp_ctrl[ISP_REG_MMSYS_SW1_RST_B]) {
> +			reg = mmsys->addr +
> isp_ctrl[ISP_REG_MMSYS_SW1_RST_B];
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys-
> >cmdq_base.subsys, reg,
> +					    0x0,
> +					    isp_ctrl[ISP_BIT_MDP_DL_ASY
> NC_RX]);
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys-
> >cmdq_base.subsys, reg,
> +					    isp_ctrl[ISP_BIT_MDP_DL_ASY
> NC_RX],
> +					    isp_ctrl[ISP_BIT_MDP_DL_ASY
> NC_RX]);
> +		}
> +
> +		/* Enable sof mode */
> +		if (isp_ctrl[ISP_REG_ISP_RELAY_CFG_WD]) {
> +			reg = mmsys->addr +
> isp_ctrl[ISP_REG_ISP_RELAY_CFG_WD];
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys-
> >cmdq_base.subsys, reg,
> +					    0x0,
> +					    isp_ctrl[ISP_BIT_NO_SOF_MOD
> E]);
> +		}
> +	}
> +
> +	if (id == MDP_COMP_CAMIN2) {
> +		/* Reset MDP_DL_ASYNC2_TX */
> +		if (isp_ctrl[ISP_REG_MMSYS_SW0_RST_B]) {
> +			reg = mmsys->addr +
> isp_ctrl[ISP_REG_MMSYS_SW0_RST_B];
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys-
> >cmdq_base.subsys, reg,
> +					    0x0,
> +					    isp_ctrl[ISP_BIT_MDP_DL_ASY
> NC_TX2]);
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys-
> >cmdq_base.subsys, reg,
> +					    isp_ctrl[ISP_BIT_MDP_DL_ASY
> NC_TX2],
> +					    isp_ctrl[ISP_BIT_MDP_DL_ASY
> NC_TX2]);
> +		}
> +
> +		/* Reset MDP_DL_ASYNC2_RX */
> +		if (isp_ctrl[ISP_REG_MMSYS_SW1_RST_B]) {
> +			reg = mmsys->addr +
> isp_ctrl[ISP_REG_MMSYS_SW1_RST_B];
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys-
> >cmdq_base.subsys, reg,
> +					    0x0,
> +					    isp_ctrl[ISP_BIT_MDP_DL_ASY
> NC_RX2]);
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys-
> >cmdq_base.subsys, reg,
> +					    isp_ctrl[ISP_BIT_MDP_DL_ASY
> NC_RX2],
> +					    isp_ctrl[ISP_BIT_MDP_DL_ASY
> NC_RX2]);
> +		}
> +
> +		/* Enable sof mode */
> +		if (isp_ctrl[ISP_REG_IPU_RELAY_CFG_WD]) {
> +			reg = mmsys->addr +
> isp_ctrl[ISP_REG_IPU_RELAY_CFG_WD];
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys-
> >cmdq_base.subsys, reg,
> +					    0x0,
> +					    isp_ctrl[ISP_BIT_NO_SOF_MOD
> E]);
> +		}
> +	}
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_mdp_isp_ctrl);
> +
> +void mtk_mmsys_mdp_camin_ctrl(struct device *dev, struct
> mmsys_cmdq_cmd *cmd,
> +			      enum mtk_mdp_comp_id id, u32 camin_w, u32
> camin_h)
> +{
> +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> +	const unsigned int *isp_ctrl = mmsys->data->mdp_isp_ctrl;
> +	u32 reg;
> +
> +	/* Config for direct link */
> +	if (id == MDP_COMP_CAMIN) {
> +		if (isp_ctrl[ISP_REG_MDP_ASYNC_CFG_WD]) {
> +			reg = mmsys->addr +
> isp_ctrl[ISP_REG_MDP_ASYNC_CFG_WD];
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys-
> >cmdq_base.subsys, reg,
> +					    (camin_h << 16) + camin_w,
> +					    0x3FFF3FFF);
> +		}
> +
> +		if (isp_ctrl[ISP_REG_ISP_RELAY_CFG_WD]) {
> +			reg = mmsys->addr +
> isp_ctrl[ISP_REG_ISP_RELAY_CFG_WD];
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys-
> >cmdq_base.subsys, reg,
> +					    (camin_h << 16) + camin_w,
> +					    0x3FFF3FFF);
> +		}
> +	}
> +	if (id == MDP_COMP_CAMIN2) {
> +		if (isp_ctrl[ISP_REG_MDP_ASYNC_IPU_CFG_WD]) {
> +			reg = mmsys->addr +
> isp_ctrl[ISP_REG_MDP_ASYNC_IPU_CFG_WD];
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys-
> >cmdq_base.subsys, reg,
> +					    (camin_h << 16) + camin_w,
> +					    0x3FFF3FFF);
> +		}
> +		if (isp_ctrl[ISP_REG_IPU_RELAY_CFG_WD]) {
> +			reg = mmsys->addr +
> isp_ctrl[ISP_REG_IPU_RELAY_CFG_WD];
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys-
> >cmdq_base.subsys, reg,
> +					    (camin_h << 16) + camin_w,
> +					    0x3FFF3FFF);
> +		}
> +	}
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_mdp_camin_ctrl);
> +
>  static int mtk_mmsys_reset_update(struct reset_controller_dev
> *rcdev, unsigned long id,
>  				  bool assert)
>  {
> diff --git a/drivers/soc/mediatek/mtk-mmsys.h
> b/drivers/soc/mediatek/mtk-mmsys.h
> index 9fce400507d2..ad8b92389b54 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.h
> +++ b/drivers/soc/mediatek/mtk-mmsys.h
> @@ -93,6 +93,7 @@ struct mtk_mmsys_driver_data {
>  	const struct mtk_mmsys_routes *routes;
>  	const unsigned int num_routes;
>  	bool has_gce_client_reg;
> +	const unsigned int *mdp_isp_ctrl;
>  };
>  
>  /*
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h
> b/include/linux/soc/mediatek/mtk-mmsys.h
> index 7f8ecc98d023..45e77d1cd6c1 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -91,6 +91,29 @@ enum mtk_mdp_comp_id {
>  	MDP_MAX_COMP_COUNT	/* ALWAYS keep at the end */
>  };
>  
> +enum mtk_mdp_pipe_id {
> +	MDP_PIPE_RDMA0,
> +	MDP_PIPE_IMGI,
> +	MDP_PIPE_WPEI,
> +	MDP_PIPE_WPEI2,
> +	MDP_PIPE_MAX
> +};
> +
> +enum mtk_isp_ctrl {
> +	ISP_REG_MMSYS_SW0_RST_B,
> +	ISP_REG_MMSYS_SW1_RST_B,
> +	ISP_REG_MDP_ASYNC_CFG_WD,
> +	ISP_REG_MDP_ASYNC_IPU_CFG_WD,
> +	ISP_REG_ISP_RELAY_CFG_WD,
> +	ISP_REG_IPU_RELAY_CFG_WD,
> +	ISP_BIT_MDP_DL_ASYNC_TX,
> +	ISP_BIT_MDP_DL_ASYNC_TX2,
> +	ISP_BIT_MDP_DL_ASYNC_RX,
> +	ISP_BIT_MDP_DL_ASYNC_RX2,
> +	ISP_BIT_NO_SOF_MODE,
> +	ISP_CTRL_MAX
> +};
> +
>  void mtk_mmsys_ddp_connect(struct device *dev,
>  			   enum mtk_ddp_comp_id cur,
>  			   enum mtk_ddp_comp_id next);
> @@ -103,4 +126,11 @@ void mtk_mmsys_write_reg_by_cmdq(struct device
> *dev,
>  				 struct mmsys_cmdq_cmd *cmd,
>  				 u32 alias_id, u32 value, u32 mask);
>  
> +void mtk_mmsys_mdp_isp_ctrl(struct device *dev, struct
> mmsys_cmdq_cmd *cmd,
> +			    enum mtk_mdp_comp_id id);
> +
> +void mtk_mmsys_mdp_camin_ctrl(struct device *dev, struct
> mmsys_cmdq_cmd *cmd,
> +			      enum mtk_mdp_comp_id id,
> +			      u32 camin_w, u32 camin_h);
> +
>  #endif /* __MTK_MMSYS_H */


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
