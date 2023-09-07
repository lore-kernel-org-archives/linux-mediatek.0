Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EAFEC8722
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 12:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOIJcQz+7UM+kDbnzXmHN06SUVpAB3ExpvNuNjj18as=; b=3UkOrQQBuizaz+IHY+6q4cAwvU
	QS8jFZwLyQRNX6/RtpEuZ5rO4sEI0QkzZnV8pCeFN2y0LIqeoqwRzitDEwZOyltpBXsrYJsFwd9e3
	6L1Gf7Kykpj33LLYl/5KHuVfwHBIg2RRGCbculxUrRmbTr2riU9ngexechKWfq2wvNCnQF1GRFPQg
	PRi9fFyU8Lu139tF7xKFtisekBNH31bHfbkuK8M1WyT4Z+tVtmIoYkyEGsXO75njU/CNS9j4BLU5x
	dru3t7FajukYlUCWUW9t2tM+k4y9kkKF9sbw9qFpndgovbjWmXl50FszyL9r/J6xCMG8fdufWlUfG
	yQTcstMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeEAu-00C5Mr-1m;
	Thu, 07 Sep 2023 12:31:56 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeEAr-00C5Ln-0u;
	Thu, 07 Sep 2023 12:31:55 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 24F376607311;
	Thu,  7 Sep 2023 13:31:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694089911;
	bh=g5wgXvE+PnsiQfgNy85QLupMTPAmTtmiCVWhPvcvY1o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xxjv4s9PLbIBMvCBuYS/tJJ2uN4q1h6s4aGXm8H45urPu9grw8UPMwt0bJ0b0mCFR
	 57/gAftiJdhjz3uLTgvQn6thqUfzCkkn2f4ym4fcxGqEY3db8j0I9Cm8Bhs8G7ENym
	 dZfpDnj01qXbtRyU4QD9chk0xySiOcS9Tj1UvdId5lNZhxA4OR/y093dhABmwMBAZA
	 AJnaFqks4twtThgVCHeVHmdkIUW4buxLQ0oyo0QPZNKyrjlL82nT0ptG3+Lg7VynbQ
	 LrB1fmHIJ39tNTLEU9KzzMOGHrGxZkwGnKcf+Fz8lMoMR/qMCXHGaCj5hDP3wX+XOe
	 qrCXDJzUyb/cQ==
Message-ID: <8c56474f-4df8-10b0-d223-1f83099d73a5@collabora.com>
Date: Thu, 7 Sep 2023 14:31:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 12/15] drm/mediatek: Support CRC in VDOSYS1
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>
References: <20230823151332.28811-1-shawn.sung@mediatek.com>
 <20230823151332.28811-13-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230823151332.28811-13-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_053153_574666_BA20640B 
X-CRM114-Status: GOOD (  24.35  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 23/08/23 17:13, Hsiao Chien Sung ha scritto:
> We choose Mixer as CRC generator in VDOSYS1 since
> its frame done event will trigger vblanks, we can know
> when is safe to retrieve CRC of the frame.
> 
> In VDOSYS1, there's no image procession after Mixer,
> unlike OVL in VDOSYS0, Mixer's CRC will include all the
> effects that are applied to the frame.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   1 +
>   .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  10 ++
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |   1 +
>   drivers/gpu/drm/mediatek/mtk_ethdr.c          | 120 ++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_ethdr.h          |   4 +
>   5 files changed, 136 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> index d2753360ae1e..014086d4d7ca 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -127,6 +127,7 @@ unsigned int mtk_ovl_adaptor_layer_nr(struct device *dev);
>   struct device *mtk_ovl_adaptor_dma_dev_get(struct device *dev);
>   const u32 *mtk_ovl_adaptor_get_formats(struct device *dev);
>   size_t mtk_ovl_adaptor_get_num_formats(struct device *dev);
> +u32 mtk_ovl_adaptor_crc_cnt(struct device *dev);
>   
>   void mtk_rdma_bypass_shadow(struct device *dev);
>   int mtk_rdma_clk_enable(struct device *dev);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> index c0a38f5217ee..64f98b26f4ce 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> @@ -159,6 +159,13 @@ void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
>   	mtk_ethdr_layer_config(ethdr, idx, state, cmdq_pkt);
>   }
>   
> +u32 mtk_ovl_adaptor_crc_cnt(struct device *dev)
> +{
> +	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
> +
> +	return mtk_ethdr_crc_cnt(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
> +}
> +
>   void mtk_ovl_adaptor_config(struct device *dev, unsigned int w,
>   			    unsigned int h, unsigned int vrefresh,
>   			    unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> @@ -274,6 +281,9 @@ void mtk_ovl_adaptor_register_vblank_cb(struct device *dev, void (*vblank_cb)(vo
>   
>   	mtk_ethdr_register_vblank_cb(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0],
>   				     vblank_cb, vblank_cb_data);
> +
> +	mtk_ethdr_register_crtc(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0],
> +				(struct drm_crtc *)vblank_cb_data);
>   }
>   
>   void mtk_ovl_adaptor_unregister_vblank_cb(struct device *dev)
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 1b747a34a06b..143136491607 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -398,6 +398,7 @@ static const struct mtk_ddp_comp_funcs ddp_ovl_adaptor = {
>   	.clk_enable = mtk_ovl_adaptor_clk_enable,
>   	.clk_disable = mtk_ovl_adaptor_clk_disable,
>   	.config = mtk_ovl_adaptor_config,
> +	.crc_cnt = mtk_ovl_adaptor_crc_cnt,
>   	.start = mtk_ovl_adaptor_start,
>   	.stop = mtk_ovl_adaptor_stop,
>   	.layer_nr = mtk_ovl_adaptor_layer_nr,
> diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
> index 3058c122a4c3..9e341d86d9f9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
> +++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
> @@ -24,6 +24,9 @@
>   #define MIX_FME_CPL_INTEN			BIT(1)
>   #define MIX_INTSTA			0x8
>   #define MIX_EN				0xc
> +#define MIX_TRIG			0x10
> +#define MIX_TRIG_CRC_EN				BIT(8)
> +#define MIX_TRIG_CRC_RST			BIT(9)
>   #define MIX_RST				0x14
>   #define MIX_ROI_SIZE			0x18
>   #define MIX_DATAPATH_CON		0x1c
> @@ -39,6 +42,11 @@
>   #define PREMULTI_SOURCE				(3 << 12)
>   #define MIX_L_SRC_SIZE(n)		(0x30 + 0x18 * (n))
>   #define MIX_L_SRC_OFFSET(n)		(0x34 + 0x18 * (n))
> +
> +/* CRC register offsets for odd and even lines */
> +#define MIX_CRC_O			0x110
> +#define MIX_CRC_E			0x114
> +
>   #define MIX_FUNC_DCM0			0x120
>   #define MIX_FUNC_DCM1			0x124
>   #define MIX_FUNC_DCM_ENABLE			0xffffffff
> @@ -70,6 +78,9 @@ struct mtk_ethdr_comp {
>   	struct device		*dev;
>   	void __iomem		*regs;
>   	struct cmdq_client_reg	cmdq_base;
> +	struct cmdq_client *cmdq_client;
> +	struct cmdq_pkt *cmdq_pkt;
> +	u32 cmdq_event;
>   };
>   
>   struct mtk_ethdr {
> @@ -80,6 +91,9 @@ struct mtk_ethdr {
>   	void			*vblank_cb_data;
>   	int			irq;
>   	struct reset_control	*reset_ctl;
> +	struct drm_crtc		*crtc;
> +	const u32		*crcs;
> +	size_t			crc_cnt;
>   };
>   
>   static const char * const ethdr_clk_str[] = {
> @@ -98,6 +112,95 @@ static const char * const ethdr_clk_str[] = {
>   	"vdo_be_async",
>   };
>   
> +static const u32 ethdr_crcs[] = {
> +	MIX_CRC_O,
> +	MIX_CRC_E,
> +};
> +
> +u32 mtk_ethdr_crc_cnt(struct device *dev)
> +{
> +	struct mtk_ethdr *priv = dev_get_drvdata(dev);
> +
> +	return (u32)priv->crc_cnt;
> +}
> +
> +void mtk_ethdr_register_crtc(struct device *dev, struct drm_crtc *crtc)
> +{
> +	struct mtk_ethdr *priv = dev_get_drvdata(dev);
> +
> +	priv->crtc = crtc;
> +}
> +
> +static void mtk_ethdr_crc_loop_start(struct device *dev)
> +{
> +	int i;
> +	struct mtk_ethdr *priv;
> +	struct mtk_ethdr_comp *mixer;
> +	struct mtk_drm_crtc *mtk_crtc;

You can initialize those variables at declaration time, since there's no
check in between initializations.

> +
> +	priv = dev_get_drvdata(dev);
> +	mixer = &priv->ethdr_comp[ETHDR_MIXER];
> +	mtk_crtc = container_of(priv->crtc, struct mtk_drm_crtc, base);
> +
> +	if (!mixer->cmdq_event || mixer->cmdq_client)
> +		return;
> +
> +	mixer->cmdq_client = cmdq_mbox_create(dev, 0);
> +	if (IS_ERR(mixer->cmdq_client)) {
> +		pr_err("failed to create mailbox client\n");

Is there any way to *guarantee* that this won't fail?

> +		return;
> +	}
> +	mixer->cmdq_pkt = cmdq_pkt_create(mixer->cmdq_client, PAGE_SIZE);
> +	if (!mixer->cmdq_pkt) {
> +		pr_err("failed to create cmdq packet\n");
> +		return;
> +	}
> +

Regards,
Angelo


