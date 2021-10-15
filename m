Return-Path: <SRS0=QAkp=PD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D08C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 11:46:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 764BC601FA
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 11:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 764BC601FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ObC2za3gkIioo1JFEyvsJ3vfk+hkLWd/IAhZqOj9c+8=; b=GtCgmWYIC+IRlrXNwM5xJYBItg
	2NQh51BPmQwaKY8QzGY37BJAXjK4G6JZq+O3H71ZQ9Mt3WtQ3WvmBcBVHkrhVK3LAYqSa9thgUKLb
	P8veFsYiX3PhSm3M2ARaVw9SKFiPQjehLrH3bHhnjCY5KaAql8jRb6km5a4KgkbUcp/PbUZpCoiKR
	5TwihRILgrVyc526eCu/hk5KirBrtKWqU7LEErgRv7P3R3gVlxBn5fNOQsTKsaLmcDTRcZ343gWdI
	dy2QBYvsoG4OPB6jyag0M+QhZ4+u0ZwKJiVxDIV7kXrmVTjYemn184/GV+2D8jVbgQMPZE2H9WeTL
	NAyrEpow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbLei-006nRm-L9; Fri, 15 Oct 2021 11:45:44 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbLed-006nQQ-43
 for linux-mediatek@lists.infradead.org; Fri, 15 Oct 2021 11:45:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9C7F41F41944
Subject: Re: [PATCH v1 8/9] media: platform: mtk-mdp3: support mt8195
To: "roy-cw.yeh" <roy-cw.yeh@mediatek.com>,
 "river . cheng" <river.cheng@mediatek.com>
Cc: linux-mediatek@lists.infradead.org
References: <20210917032728.22367-1-roy-cw.yeh@mediatek.com>
 <20210917032728.22367-9-roy-cw.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <6bcd2053-a30f-6352-0977-0a8e2a65264f@collabora.com>
Date: Fri, 15 Oct 2021 13:45:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210917032728.22367-9-roy-cw.yeh@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_044539_495667_F1B523F8 
X-CRM114-Status: GOOD (  22.30  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 17/09/21 05:27, roy-cw.yeh ha scritto:
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> Add mt8195 driver
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> ---
>   drivers/media/platform/mtk-mdp3/mdp_reg_aal.h |   24 +
>   .../media/platform/mtk-mdp3/mdp_reg_color.h   |   29 +
>   drivers/media/platform/mtk-mdp3/mdp_reg_fg.h  |   23 +
>   drivers/media/platform/mtk-mdp3/mdp_reg_hdr.h |   31 +
>   .../media/platform/mtk-mdp3/mdp_reg_merge.h   |   23 +
>   drivers/media/platform/mtk-mdp3/mdp_reg_ovl.h |   24 +
>   drivers/media/platform/mtk-mdp3/mdp_reg_pad.h |   20 +
>   .../media/platform/mtk-mdp3/mdp_reg_rdma.h    |   31 +
>   drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h |    2 +
>   .../media/platform/mtk-mdp3/mdp_reg_tdshp.h   |  114 ++
>   .../media/platform/mtk-mdp3/mdp_reg_wrot.h    |   18 +
>   drivers/media/platform/mtk-mdp3/mtk-img-ipi.h |  215 ++-
>   .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   |  484 ++++++-
>   .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 1173 ++++++++++++++++-
>   .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |   83 +-
>   .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  707 +++++++++-
>   .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   25 +-
>   .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |    4 +
>   .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  115 +-
>   .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |    2 +
>   20 files changed, 2999 insertions(+), 148 deletions(-)
>   create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_aal.h
>   create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_color.h
>   create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_fg.h
>   create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_hdr.h
>   create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_merge.h
>   create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_ovl.h
>   create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_pad.h
>   create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_tdshp.h
> 

In this patch, you are introducing a lot of pr_{err,info}.
Can you please use dev_{err,info} prints instead?

> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
> index f690502ee42b..28c65e8d4eff 100644
> --- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c

snip..

> @@ -170,6 +218,29 @@ static int config_rdma_frame(struct mdp_comp_ctx *ctx,
>   	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_TRANSFORM_0,
>   		     rdma->transform, 0x0F110000);
>   
> +	if (mdp_cfg->rdma_esl_setting) {

Oops! You forgot to check if mdp_cfg is NULL there!

> +		MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_DMABUF_CON_0,
> +			     rdma->dmabuf_con0, 0x0FFF00FF);
> +		MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_ULTRA_TH_HIGH_CON_0,
> +			     rdma->ultra_th_high_con0, 0x3FFFFFFF);
> +		MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_ULTRA_TH_LOW_CON_0,
> +			     rdma->ultra_th_low_con0, 0x3FFFFFFF);
> +		MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_DMABUF_CON_1,
> +			     rdma->dmabuf_con1, 0x0F7F007F);
> +		MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_ULTRA_TH_HIGH_CON_1,
> +			     rdma->ultra_th_high_con1, 0x3FFFFFFF);
> +		MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_ULTRA_TH_LOW_CON_1,
> +			     rdma->ultra_th_low_con1, 0x3FFFFFFF);
> +		MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_DMABUF_CON_2,
> +			     rdma->dmabuf_con2, 0x0F3F003F);
> +		MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_ULTRA_TH_HIGH_CON_2,
> +			     rdma->ultra_th_high_con2, 0x3FFFFFFF);
> +		MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_ULTRA_TH_LOW_CON_2,
> +			     rdma->ultra_th_low_con2, 0x3FFFFFFF);
> +		MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_DMABUF_CON_3,
> +			     rdma->dmabuf_con3, 0x0F3F003F);
> +	}
> +
>   	return 0;
>   }
>   

snip...

> @@ -256,10 +354,123 @@ static const struct mdp_comp_ops rdma_ops = {
>   	.post_process = NULL,
>   };
>   
> +static int init_split(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
> +{
> +	return 0;
> +}
> +
> +static int config_split_frame(struct mdp_comp_ctx *ctx,
> +			      struct mmsys_cmdq_cmd *cmd,
> +			      const struct v4l2_rect *compose)
> +{
> +	return 0;
> +}
> +
> +static int config_split_subfrm(struct mdp_comp_ctx *ctx,
> +			       struct mmsys_cmdq_cmd *cmd, u32 index)
> +{
> +	return 0;
> +}
> +
> +static const struct mdp_comp_ops split_ops = {
> +	.get_comp_flag = get_comp_flag,
> +	.init_comp = init_split,
> +	.config_frame = config_split_frame,
> +	.config_subfrm = config_split_subfrm,
> +	/* .reconfig_frame = NULL, */
> +	/* .reconfig_subfrms = NULL, */

Please remove these commented out lines.

> +	.wait_comp_event = NULL,
> +	.advance_subfrm = NULL,
> +	.post_process = NULL,
> +};
> +
> +static int init_stitch(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
> +{
> +	return 0;
> +}
> +
> +static int config_stitch_frame(struct mdp_comp_ctx *ctx,
> +			       struct mmsys_cmdq_cmd *cmd,
> +			       const struct v4l2_rect *compose)
> +{
> +	return 0;
> +}
> +
> +static int config_stitch_subfrm(struct mdp_comp_ctx *ctx,
> +				struct mmsys_cmdq_cmd *cmd, u32 index)
> +{
> +	return 0;
> +}
> +
> +static const struct mdp_comp_ops stitch_ops = {
> +	.get_comp_flag = get_comp_flag,
> +	.init_comp = init_stitch,
> +	.config_frame = config_stitch_frame,
> +	.config_subfrm = config_stitch_subfrm,
> +	/* .reconfig_frame = NULL, */
> +	/* .reconfig_subfrms = NULL, */

Please remove these commented out lines.

> +	.wait_comp_event = NULL,
> +	.advance_subfrm = NULL,
> +	.post_process = NULL,
> +};
> +
> +static int init_fg(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
> +{
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u16 subsys_id = ctx->comp->subsys_id;
> +
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_FG_TRIGGER,
> +		     (0x00000001 << 2), 0x00000004);
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_FG_TRIGGER,
> +		     0x00000000, 0x00000004);
> +
> +	return 0;
> +}
> +
> +static int config_fg_frame(struct mdp_comp_ctx *ctx,
> +			   struct mmsys_cmdq_cmd *cmd,
> +			   const struct v4l2_rect *compose)
> +{
> +	const struct mdp_fg_data *fg = &ctx->param->fg;
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u16 subsys_id = ctx->comp->subsys_id;
> +
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_FG_FG_CTRL_0, fg->ctrl_0, 0x1);
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_FG_FG_CK_EN, fg->ck_en, 0x7);
> +	return 0;
> +}
> +
> +static int config_fg_subfrm(struct mdp_comp_ctx *ctx,
> +			    struct mmsys_cmdq_cmd *cmd, u32 index)
> +{
> +	const struct mdp_fg_subfrm *subfrm = &ctx->param->fg.subfrms[index];
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u16 subsys_id = ctx->comp->subsys_id;
> +
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_FG_TILE_INFO_0, subfrm->info_0, 0xFFFFFFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_FG_TILE_INFO_1, subfrm->info_1, 0xFFFFFFFF);
> +
> +	return 0;
> +}
> +
> +static const struct mdp_comp_ops fg_ops = {
> +	.get_comp_flag = get_comp_flag,
> +	.init_comp = init_fg,
> +	.config_frame = config_fg_frame,
> +	.config_subfrm = config_fg_subfrm,
> +	/* .reconfig_frame = NULL, */
> +	/* .reconfig_subfrms = NULL, */

Please remove these commented out lines.

> +	.wait_comp_event = NULL,
> +	.advance_subfrm = NULL,
> +	.post_process = NULL,
> +};
> +
>   static int init_rsz(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
>   {
> +	const struct mdp_platform_config *mdp_cfg = __get_plat_cfg(ctx);
>   	phys_addr_t base = ctx->comp->reg_base;
>   	u8 subsys_id = ctx->comp->subsys_id;
> +	u32 value = 0, mask = 0, alias_id = 0;
>   
>   	/* Reset RSZ */
>   	MM_REG_WRITE(cmd, subsys_id, base, PRZ_ENABLE, 0x00010000,
> @@ -269,6 +480,32 @@ static int init_rsz(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
>   	/* Enable RSZ */
>   	MM_REG_WRITE(cmd, subsys_id, base, PRZ_ENABLE, 0x00000001,
>   		     0x00000001);
> +
> +	if (mdp_cfg && mdp_cfg->mdp_version_8195) {

As suggested before... if (mdp_cfg && mdp_cfg->version == MTK_MDP_VERSION_8195)

> +		enum mdp_comp_id id = ctx->comp->id;
> +		const struct mtk_mdp_driver_data *data = ctx->comp->mdp_dev->mdp_data;
> +
> +		value = (1 << 25);
> +		mask = (1 << 25);
> +		alias_id = data->config_table[CONFIG_VPP1_HW_DCM_1ST_DIS0];
> +		mtk_mmsys_write_reg(ctx->comp->mdp_dev->mdp_mmsys2,
> +				    cmd, alias_id, value, mask);
> +
> +		alias_id = data->config_table[CONFIG_VPP1_HW_DCM_2ND_DIS0];
> +		mtk_mmsys_write_reg(ctx->comp->mdp_dev->mdp_mmsys2,
> +				    cmd, alias_id, value, mask);
> +
> +		value = (1 << 4 | 1 << 5);
> +		mask = (1 << 4 | 1 << 5);
> +		alias_id = data->config_table[CONFIG_VPP1_HW_DCM_1ST_DIS1];
> +		mtk_mmsys_write_reg(ctx->comp->mdp_dev->mdp_mmsys2,
> +				    cmd, alias_id, value, mask);
> +
> +		alias_id = data->config_table[CONFIG_VPP1_HW_DCM_2ND_DIS1];
> +		mtk_mmsys_write_reg(ctx->comp->mdp_dev->mdp_mmsys2,
> +				    cmd, alias_id, value, mask);
> +	}
> +
>   	return 0;
>   }
>   
> @@ -277,9 +514,13 @@ static int config_rsz_frame(struct mdp_comp_ctx *ctx,
>   			    const struct v4l2_rect *compose)
>   {
>   	const struct mdp_rsz_data *rsz = &ctx->param->rsz;
> +	const struct mdp_platform_config *mdp_cfg = __get_plat_cfg(ctx);
>   	phys_addr_t base = ctx->comp->reg_base;
>   	u8 subsys_id = ctx->comp->subsys_id;
>   
> +	if (mdp_cfg && mdp_cfg->rsz_etc_control)
> +		MM_REG_WRITE(cmd, subsys_id, base, RSZ_ETC_CONTROL, 0x0, 0xFFFFFFFF);
> +
>   	if (ctx->param->frame.bypass) {
>   		/* Disable RSZ */
>   		MM_REG_WRITE(cmd, subsys_id, base, PRZ_ENABLE, 0x00000000,
> @@ -320,23 +561,58 @@ static int config_rsz_subfrm(struct mdp_comp_ctx *ctx,
>   
>   	MM_REG_WRITE(cmd, subsys_id, base, PRZ_LUMA_HORIZONTAL_INTEGER_OFFSET,
>   		     csf->luma.left, 0x0000FFFF);
> -	MM_REG_WRITE(cmd, subsys_id,
> -		     base, PRZ_LUMA_HORIZONTAL_SUBPIXEL_OFFSET,
> +	MM_REG_WRITE(cmd, subsys_id, base, PRZ_LUMA_HORIZONTAL_SUBPIXEL_OFFSET,
>   		     csf->luma.left_subpix, 0x001FFFFF);
>   	MM_REG_WRITE(cmd, subsys_id, base, PRZ_LUMA_VERTICAL_INTEGER_OFFSET,
>   		     csf->luma.top, 0x0000FFFF);
>   	MM_REG_WRITE(cmd, subsys_id, base, PRZ_LUMA_VERTICAL_SUBPIXEL_OFFSET,
>   		     csf->luma.top_subpix, 0x001FFFFF);
> -	MM_REG_WRITE(cmd, subsys_id,
> -		     base, PRZ_CHROMA_HORIZONTAL_INTEGER_OFFSET,
> +	MM_REG_WRITE(cmd, subsys_id, base, PRZ_CHROMA_HORIZONTAL_INTEGER_OFFSET,
>   		     csf->chroma.left, 0x0000FFFF);
> -	MM_REG_WRITE(cmd, subsys_id,
> -		     base, PRZ_CHROMA_HORIZONTAL_SUBPIXEL_OFFSET,
> +	MM_REG_WRITE(cmd, subsys_id, base, PRZ_CHROMA_HORIZONTAL_SUBPIXEL_OFFSET,
>   		     csf->chroma.left_subpix, 0x001FFFFF);
>   
>   	MM_REG_WRITE(cmd, subsys_id, base, PRZ_OUTPUT_IMAGE, subfrm->clip,
>   		     0xFFFFFFFF);
>   
> +	if (mdp_cfg && mdp_cfg->mdp_version_8195) {

And here too... (and everywhere else).

> +		struct mdp_comp *merge;
> +		const struct mtk_mdp_driver_data *data = ctx->comp->mdp_dev->mdp_data;
> +		enum mtk_mdp_comp_id id = data->comp_data[ctx->comp->id].match.public_id;
> +		u32 alias_id = 0;
> +
> +		if (id == MDP_COMP_RSZ2) {
> +			merge = ctx->comp->mdp_dev->comp[MDP_MERGE2];
> +
> +			alias_id = data->config_table[CONFIG_SVPP2_BUF_BF_RSZ_SWITCH];
> +			mtk_mmsys_write_reg(ctx->comp->mdp_dev->mdp_mmsys2, cmd,
> +					    alias_id, subfrm->rsz_switch, 0xFFFFFFFF);
> +		} else if (id == MDP_COMP_RSZ3) {
> +			merge = ctx->comp->mdp_dev->comp[MDP_MERGE3];
> +
> +			alias_id = data->config_table[CONFIG_SVPP3_BUF_BF_RSZ_SWITCH];
> +			mtk_mmsys_write_reg(ctx->comp->mdp_dev->mdp_mmsys2, cmd,
> +					    alias_id, subfrm->rsz_switch, 0xFFFFFFFF);
> +		} else {
> +			goto subfrm_done;
> +		}
> +
> +		MM_REG_WRITE(cmd, merge->subsys_id, merge->reg_base,
> +			     VPP_MERGE_CFG_0, subfrm->merge_cfg, 0xFFFFFFFF);
> +		MM_REG_WRITE(cmd, merge->subsys_id, merge->reg_base,
> +			     VPP_MERGE_CFG_4, subfrm->merge_cfg, 0xFFFFFFFF);
> +		MM_REG_WRITE(cmd, merge->subsys_id, merge->reg_base,
> +			     VPP_MERGE_CFG_24, subfrm->merge_cfg, 0xFFFFFFFF);
> +		MM_REG_WRITE(cmd, merge->subsys_id, merge->reg_base,
> +			     VPP_MERGE_CFG_25, subfrm->merge_cfg, 0xFFFFFFFF);
> +
> +		MM_REG_WRITE(cmd, merge->subsys_id, merge->reg_base,
> +			     VPP_MERGE_CFG_12, 0x1, 0xFFFFFFFF); // bypass mode
> +		MM_REG_WRITE(cmd, merge->subsys_id, merge->reg_base,
> +			     VPP_MERGE_ENABLE, 0x1, 0xFFFFFFFF);
> +	}
> +
> +subfrm_done:
>   	return 0;
>   }
>   
> @@ -370,6 +646,485 @@ static const struct mdp_comp_ops rsz_ops = {
>   	.post_process = NULL,
>   };
>   
> +static int init_aal(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
> +{
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u16 subsys_id = ctx->comp->subsys_id;
> +
> +	// Always set MDP_AAL enable to 1
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_AAL_EN, 0x1, 0x1);
> +
> +	return 0;
> +}
> +
> +static int config_aal_frame(struct mdp_comp_ctx *ctx,
> +			    struct mmsys_cmdq_cmd *cmd,
> +			    const struct v4l2_rect *compose)
> +{
> +	const struct mdp_aal_data *aal = &ctx->param->aal;
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u16 subsys_id = ctx->comp->subsys_id;
> +
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_AAL_CFG_MAIN, aal->cfg_main, 0x80);
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_AAL_CFG, aal->cfg, 0x1);
> +
> +	return 0;
> +}
> +
> +static int config_aal_subfrm(struct mdp_comp_ctx *ctx,
> +			     struct mmsys_cmdq_cmd *cmd, u32 index)
> +{
> +	const struct mdp_aal_subfrm *subfrm = &ctx->param->aal.subfrms[index];
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u16 subsys_id = ctx->comp->subsys_id;
> +
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_AAL_SIZE,
> +		     subfrm->src, MDP_AAL_SIZE_MASK);
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_AAL_OUTPUT_OFFSET,
> +		     subfrm->clip_ofst, 0x00FF00FF);
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_AAL_OUTPUT_SIZE,
> +		     subfrm->clip, MDP_AAL_OUTPUT_SIZE_MASK);
> +
> +	return 0;
> +}
> +
> +static const struct mdp_comp_ops aal_ops = {
> +	.get_comp_flag = get_comp_flag,
> +	.init_comp = init_aal,
> +	.config_frame = config_aal_frame,
> +	.config_subfrm = config_aal_subfrm,
> +	/* .reconfig_frame = NULL, */
> +	/* .reconfig_subfrms = NULL, */

Please remove these commented out lines.

> +	.wait_comp_event = NULL,
> +	.advance_subfrm = NULL,
> +	.post_process = NULL,
> +};
> +
> +static int init_hdr(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
> +{
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u16 subsys_id = ctx->comp->subsys_id;
> +
> +	// Always set MDP_HDR enable to 1
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_TOP, 1, 0x1);
> +
> +	return 0;
> +}
> +
> +static int config_hdr_frame(struct mdp_comp_ctx *ctx,
> +			    struct mmsys_cmdq_cmd *cmd,
> +			    const struct v4l2_rect *compose)
> +{
> +	const struct mdp_hdr_data *hdr = &ctx->param->hdr;
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u16 subsys_id = ctx->comp->subsys_id;
> +
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_TOP,
> +		     hdr->top, 0x30000000);
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_RELAY,
> +		     hdr->relay, 0x1);
> +
> +	return 0;
> +}
> +
> +static int config_hdr_subfrm(struct mdp_comp_ctx *ctx,
> +			     struct mmsys_cmdq_cmd *cmd, u32 index)
> +{
> +	const struct mdp_hdr_subfrm *subfrm = &ctx->param->hdr.subfrms[index];
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u16 subsys_id = ctx->comp->subsys_id;
> +
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_TILE_POS,
> +		     subfrm->win_size, MDP_HDR_TILE_POS_MASK);
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_SIZE_0,
> +		     subfrm->src, 0x1FFF1FFF);
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_SIZE_1,
> +		     subfrm->clip_ofst0, 0x1FFF1FFF);
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_SIZE_2,
> +		     subfrm->clip_ofst1, 0x1FFF1FFF);
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_HIST_CTRL_0,
> +		     subfrm->hist_ctrl_0, 0x00003FFF);
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_HIST_CTRL_1,
> +		     subfrm->hist_ctrl_1, 0x00003FFF);
> +
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_TOP,
> +		     subfrm->hdr_top, 0x00000060);
> +	// enable hist_clr_en
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_HIST_ADDR,
> +		     subfrm->hist_addr, 0x00000200);
> +
> +	return 0;
> +}
> +
> +static const struct mdp_comp_ops hdr_ops = {
> +	.get_comp_flag = get_comp_flag,
> +	.init_comp = init_hdr,
> +	.config_frame = config_hdr_frame,
> +	.config_subfrm = config_hdr_subfrm,
> +	/* .reconfig_frame = NULL, */
> +	/* .reconfig_subfrms = NULL, */

Please remove these commented out lines.

> +	.wait_comp_event = NULL,
> +	.advance_subfrm = NULL,
> +	.post_process = NULL,
> +};
> +
> +void reset_luma_hist(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
> +{
> +	const struct mdp_platform_config *mdp_cfg = __get_plat_cfg(ctx);
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u16 subsys_id = ctx->comp->subsys_id;
> +
> +	// reset LUMA HIST
> +	MM_REG_WRITE(cmd, subsys_id, base,
> +		     MDP_LUMA_HIST_INIT_00, 0, 0xFFFFFFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base,
> +		     MDP_LUMA_HIST_INIT_01, 0, 0xFFFFFFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base,
> +		     MDP_LUMA_HIST_INIT_02, 0, 0xFFFFFFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base,
> +		     MDP_LUMA_HIST_INIT_03, 0, 0xFFFFFFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base,
> +		     MDP_LUMA_HIST_INIT_04, 0, 0xFFFFFFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base,
> +		     MDP_LUMA_HIST_INIT_05, 0, 0xFFFFFFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base,
> +		     MDP_LUMA_HIST_INIT_06, 0, 0xFFFFFFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base,
> +		     MDP_LUMA_HIST_INIT_07, 0, 0xFFFFFFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base,
> +		     MDP_LUMA_HIST_INIT_08, 0, 0xFFFFFFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base,
> +		     MDP_LUMA_HIST_INIT_09, 0, 0xFFFFFFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base,
> +		     MDP_LUMA_HIST_INIT_10, 0, 0xFFFFFFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base,
> +		     MDP_LUMA_HIST_INIT_11, 0, 0xFFFFFFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base,
> +		     MDP_LUMA_HIST_INIT_12, 0, 0xFFFFFFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base,
> +		     MDP_LUMA_HIST_INIT_13, 0, 0xFFFFFFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base,
> +		     MDP_LUMA_HIST_INIT_14, 0, 0xFFFFFFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base,
> +		     MDP_LUMA_HIST_INIT_15, 0, 0xFFFFFFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base,
> +		     MDP_LUMA_HIST_INIT_16, 0, 0xFFFFFFFF);
> +
> +	if (mdp_cfg && mdp_cfg->tdshp_1_1 == 2) {
> +		MM_REG_WRITE(cmd, subsys_id, base,
> +			     MDP_LUMA_SUM_INIT, 0, 0xFFFFFFFF);
> +	}
> +
> +	if (mdp_cfg && mdp_cfg->tdshp_dyn_contrast_version == 2) {
> +		MM_REG_WRITE(cmd, subsys_id, base,
> +			     MDP_CONTOUR_HIST_INIT_00, 0, 0xFFFFFFFF);
> +		MM_REG_WRITE(cmd, subsys_id, base,
> +			     MDP_CONTOUR_HIST_INIT_01, 0, 0xFFFFFFFF);
> +		MM_REG_WRITE(cmd, subsys_id, base,
> +			     MDP_CONTOUR_HIST_INIT_02, 0, 0xFFFFFFFF);
> +		MM_REG_WRITE(cmd, subsys_id, base,
> +			     MDP_CONTOUR_HIST_INIT_03, 0, 0xFFFFFFFF);
> +		MM_REG_WRITE(cmd, subsys_id, base,
> +			     MDP_CONTOUR_HIST_INIT_04, 0, 0xFFFFFFFF);
> +		MM_REG_WRITE(cmd, subsys_id, base,
> +			     MDP_CONTOUR_HIST_INIT_05, 0, 0xFFFFFFFF);
> +		MM_REG_WRITE(cmd, subsys_id, base,
> +			     MDP_CONTOUR_HIST_INIT_06, 0, 0xFFFFFFFF);
> +		MM_REG_WRITE(cmd, subsys_id, base,
> +			     MDP_CONTOUR_HIST_INIT_07, 0, 0xFFFFFFFF);
> +		MM_REG_WRITE(cmd, subsys_id, base,
> +			     MDP_CONTOUR_HIST_INIT_08, 0, 0xFFFFFFFF);
> +		MM_REG_WRITE(cmd, subsys_id, base,
> +			     MDP_CONTOUR_HIST_INIT_09, 0, 0xFFFFFFFF);
> +		MM_REG_WRITE(cmd, subsys_id, base,
> +			     MDP_CONTOUR_HIST_INIT_10, 0, 0xFFFFFFFF);
> +		MM_REG_WRITE(cmd, subsys_id, base,
> +			     MDP_CONTOUR_HIST_INIT_11, 0, 0xFFFFFFFF);
> +		MM_REG_WRITE(cmd, subsys_id, base,
> +			     MDP_CONTOUR_HIST_INIT_12, 0, 0xFFFFFFFF);
> +		MM_REG_WRITE(cmd, subsys_id, base,
> +			     MDP_CONTOUR_HIST_INIT_13, 0, 0xFFFFFFFF);
> +		MM_REG_WRITE(cmd, subsys_id, base,
> +			     MDP_CONTOUR_HIST_INIT_14, 0, 0xFFFFFFFF);
> +		MM_REG_WRITE(cmd, subsys_id, base,
> +			     MDP_CONTOUR_HIST_INIT_15, 0, 0xFFFFFFFF);
> +		MM_REG_WRITE(cmd, subsys_id, base,
> +			     MDP_CONTOUR_HIST_INIT_16, 0, 0xFFFFFFFF);
> +	}
> +}
> +
> +static int init_tdshp(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
> +{
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u16 subsys_id = ctx->comp->subsys_id;
> +
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_TDSHP_CTRL, 0x00000001,
> +		     0x00000001);
> +	// Enable fifo
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_TDSHP_CFG, 0x00000002,
> +		     0x00000002);
> +	reset_luma_hist(ctx, cmd);
> +
> +	return 0;
> +}
> +
> +static int config_tdshp_frame(struct mdp_comp_ctx *ctx,
> +			      struct mmsys_cmdq_cmd *cmd,
> +			      const struct v4l2_rect *compose)
> +{
> +	const struct mdp_tdshp_data *tdshp = &ctx->param->tdshp;
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u16 subsys_id = ctx->comp->subsys_id;
> +
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_TDSHP_CFG, tdshp->cfg, 0x00000001);
> +
> +	return 0;
> +}
> +
> +static int config_tdshp_subfrm(struct mdp_comp_ctx *ctx,
> +			       struct mmsys_cmdq_cmd *cmd, u32 index)
> +{
> +	const struct mdp_tdshp_subfrm *subfrm = &ctx->param->tdshp.subfrms[index];
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u16 subsys_id = ctx->comp->subsys_id;
> +
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_TDSHP_INPUT_SIZE,
> +		     subfrm->src, MDP_TDSHP_INPUT_SIZE_MASK);
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_TDSHP_OUTPUT_OFFSET,
> +		     subfrm->clip_ofst, 0x00FF00FF);
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_TDSHP_OUTPUT_SIZE,
> +		     subfrm->clip, MDP_TDSHP_OUTPUT_SIZE_MASK);
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_HIST_CFG_00,
> +		     subfrm->hist_cfg_0, 0xFFFFFFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_HIST_CFG_01,
> +		     subfrm->hist_cfg_1, 0xFFFFFFFF);
> +
> +	return 0;
> +}
> +
> +static const struct mdp_comp_ops tdshp_ops = {
> +	.get_comp_flag = get_comp_flag,
> +	.init_comp = init_tdshp,
> +	.config_frame = config_tdshp_frame,
> +	.config_subfrm = config_tdshp_subfrm,
> +	/* .reconfig_frame = NULL, */
> +	/* .reconfig_subfrms = NULL, */

Please remove these commented out lines.

> +	.wait_comp_event = NULL,
> +	.advance_subfrm = NULL,
> +	.post_process = NULL,
> +};
> +
> +static int init_color(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
> +{
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u16 subsys_id = ctx->comp->subsys_id;
> +
> +	MM_REG_WRITE(cmd, subsys_id, base,
> +		     DISP_COLOR_START, 0x1, 0x3);
> +	MM_REG_WRITE(cmd, subsys_id, base,
> +		     DISP_COLOR_WIN_X_MAIN, 0xFFFF0000, 0xFFFFFFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base,
> +		     DISP_COLOR_WIN_Y_MAIN, 0xFFFF0000, 0xFFFFFFFF);
> +
> +	// R2Y/Y2R are disabled in MDP
> +	MM_REG_WRITE(cmd, subsys_id, base,
> +		     DISP_COLOR_CM1_EN, 0x0, 0x1);
> +	MM_REG_WRITE(cmd, subsys_id, base,
> +		     DISP_COLOR_CM2_EN, 0x0, 0x1);
> +
> +	//enable interrupt
> +	MM_REG_WRITE(cmd, subsys_id, base,
> +		     DISP_COLOR_INTEN, 0x00000007, 0x00000007);
> +
> +	//Set 10bit->8bit Rounding
> +	MM_REG_WRITE(cmd, subsys_id, base,
> +		     DISP_COLOR_OUT_SEL, 0x333, 0x333);
> +
> +	return 0;
> +}
> +
> +static int config_color_frame(struct mdp_comp_ctx *ctx,
> +			      struct mmsys_cmdq_cmd *cmd,
> +			      const struct v4l2_rect *compose)
> +{
> +	const struct mdp_color_data *color = &ctx->param->color;
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u16 subsys_id = ctx->comp->subsys_id;
> +
> +	MM_REG_WRITE(cmd, subsys_id, base,
> +		     DISP_COLOR_START, color->start, DISP_COLOR_START_MASK);
> +
> +	return 0;
> +}
> +
> +static int config_color_subfrm(struct mdp_comp_ctx *ctx,
> +			       struct mmsys_cmdq_cmd *cmd, u32 index)
> +{
> +	const struct mdp_color_subfrm *subfrm = &ctx->param->color.subfrms[index];
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u16 subsys_id = ctx->comp->subsys_id;
> +
> +	MM_REG_WRITE(cmd, subsys_id, base, DISP_COLOR_INTERNAL_IP_WIDTH,
> +		     subfrm->in_hsize, 0x00003FFF);
> +	MM_REG_WRITE(cmd, subsys_id, base, DISP_COLOR_INTERNAL_IP_HEIGHT,
> +		     subfrm->in_vsize, 0x00003FFF);
> +
> +	return 0;
> +}
> +
> +static const struct mdp_comp_ops color_ops = {
> +	.get_comp_flag = get_comp_flag,
> +	.init_comp = init_color,
> +	.config_frame = config_color_frame,
> +	.config_subfrm = config_color_subfrm,
> +	/* .reconfig_frame = NULL, */
> +	/* .reconfig_subfrms = NULL, */

Please remove these commented out lines.

> +	.wait_comp_event = NULL,
> +	.advance_subfrm = NULL,
> +	.post_process = NULL,
> +};
> +
> +static int init_ovl(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
> +{
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u16 subsys_id = ctx->comp->subsys_id;
> +
> +	MM_REG_WRITE(cmd, subsys_id, base, OVL_EN,
> +		     0x1, OVL_EN_MASK);
> +	//Relay Mode
> +	MM_REG_WRITE(cmd, subsys_id, base, OVL_SRC_CON,
> +		     0x200, OVL_SRC_CON_MASK);
> +	//Connect OVL, enable smi_id mode
> +	MM_REG_WRITE(cmd, subsys_id, base, OVL_DATAPATH_CON,
> +		     0x1, OVL_DATAPATH_CON_MASK);
> +
> +	return 0;
> +}
> +
> +static int config_ovl_frame(struct mdp_comp_ctx *ctx,
> +			    struct mmsys_cmdq_cmd *cmd,
> +			    const struct v4l2_rect *compose)
> +{
> +	const struct mdp_ovl_data *ovl = &ctx->param->ovl;
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u16 subsys_id = ctx->comp->subsys_id;
> +
> +	//Layer0 for PQ-direct-in
> +	MM_REG_WRITE(cmd, subsys_id, base, OVL_L0_CON,
> +		     ovl->L0_con, 0x30000000);
> +	//Enable Layer0
> +	MM_REG_WRITE(cmd, subsys_id, base, OVL_SRC_CON,
> +		     ovl->src_con, 0x1);
> +
> +	return 0;
> +}
> +
> +static int config_ovl_subfrm(struct mdp_comp_ctx *ctx,
> +			     struct mmsys_cmdq_cmd *cmd, u32 index)
> +{
> +	const struct mdp_ovl_subfrm *subfrm = &ctx->param->ovl.subfrms[index];
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u16 subsys_id = ctx->comp->subsys_id;
> +
> +	//Setup Layer0 source size
> +	MM_REG_WRITE(cmd, subsys_id, base, OVL_L0_SRC_SIZE,
> +		     subfrm->L0_src_size, OVL_L0_SRC_SIZE_MASK);
> +	//Setup ROI size (output size)
> +	MM_REG_WRITE(cmd, subsys_id, base, OVL_ROI_SIZE,
> +		     subfrm->roi_size, OVL_ROI_SIZE_MASK);
> +
> +	return 0;
> +}
> +
> +static const struct mdp_comp_ops ovl_ops = {
> +	.get_comp_flag = get_comp_flag,
> +	.init_comp = init_ovl,
> +	.config_frame = config_ovl_frame,
> +	.config_subfrm = config_ovl_subfrm,
> +	/* .reconfig_frame = NULL, */
> +	/* .reconfig_subfrms = NULL, */

Please remove these commented out lines.

> +	.wait_comp_event = NULL,
> +	.advance_subfrm = NULL,
> +	.post_process = NULL,
> +};
> +
> +static int init_pad(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
> +{
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u16 subsys_id = ctx->comp->subsys_id;
> +
> +	MM_REG_WRITE(cmd, subsys_id, base, VPP_PADDING0_PADDING_CON,
> +		     0x2, VPP_PADDING0_PADDING_CON_MASK);
> +	//Clear padding area
> +	MM_REG_WRITE(cmd, subsys_id, base, VPP_PADDING0_W_PADDING_SIZE,
> +		     0x0, VPP_PADDING0_W_PADDING_SIZE_MASK);
> +	MM_REG_WRITE(cmd, subsys_id, base, VPP_PADDING0_H_PADDING_SIZE,
> +		     0x0, VPP_PADDING0_H_PADDING_SIZE_MASK);
> +
> +	return 0;
> +}
> +
> +static int config_pad_frame(struct mdp_comp_ctx *ctx,
> +			    struct mmsys_cmdq_cmd *cmd,
> +			    const struct v4l2_rect *compose)
> +{
> +	return 0;
> +}
> +
> +static int config_pad_subfrm(struct mdp_comp_ctx *ctx,
> +			     struct mmsys_cmdq_cmd *cmd, u32 index)
> +{
> +	const struct mdp_pad_subfrm *subfrm = &ctx->param->pad.subfrms[index];
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u16 subsys_id = ctx->comp->subsys_id;
> +
> +	MM_REG_WRITE(cmd, subsys_id, base, VPP_PADDING0_PADDING_PIC_SIZE,
> +		     subfrm->pic_size, VPP_PADDING0_PADDING_CON_MASK);
> +
> +	return 0;
> +}
> +
> +static const struct mdp_comp_ops pad_ops = {
> +	.get_comp_flag = get_comp_flag,
> +	.init_comp = init_pad,
> +	.config_frame = config_pad_frame,
> +	.config_subfrm = config_pad_subfrm,
> +	/* .reconfig_frame = NULL, */
> +	/* .reconfig_subfrms = NULL, */

Please remove these commented out lines.

> +	.wait_comp_event = NULL,
> +	.advance_subfrm = NULL,
> +	.post_process = NULL,
> +};
> +
> +static int init_tcc(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
> +{
> +	return 0;
> +}
> +
> +static int config_tcc_frame(struct mdp_comp_ctx *ctx,
> +			    struct mmsys_cmdq_cmd *cmd,
> +			    const struct v4l2_rect *compose)
> +{
> +	return 0;
> +}
> +
> +static int config_tcc_subfrm(struct mdp_comp_ctx *ctx,
> +			     struct mmsys_cmdq_cmd *cmd, u32 index)
> +{
> +	return 0;
> +}
> +
> +static const struct mdp_comp_ops tcc_ops = {
> +	.get_comp_flag = get_comp_flag,
> +	.init_comp = init_tcc,
> +	.config_frame = config_tcc_frame,
> +	.config_subfrm = config_tcc_subfrm,
> +	/* .reconfig_frame = NULL, */
> +	/* .reconfig_subfrms = NULL, */

Please remove these commented out lines.

> +	.wait_comp_event = NULL,
> +	.advance_subfrm = NULL,
> +	.post_process = NULL,
> +};
>   static int init_wrot(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
>   {
>   	phys_addr_t base = ctx->comp->reg_base;
> @@ -379,6 +1134,8 @@ static int init_wrot(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
>   	MM_REG_WRITE(cmd, subsys_id, base, VIDO_SOFT_RST, 0x01, 0x00000001);
>   	MM_REG_POLL(cmd, subsys_id, base, VIDO_SOFT_RST_STAT, 0x01,
>   		    0x00000001);
> +	/* Reset setting */
> +	MM_REG_WRITE(cmd, subsys_id, base, VIDO_CTRL, 0x0, 0xFFFFFFFF);
>   	MM_REG_WRITE(cmd, subsys_id, base, VIDO_SOFT_RST, 0x00, 0x00000001);
>   	MM_REG_POLL(cmd, subsys_id, base, VIDO_SOFT_RST_STAT, 0x00,
>   		    0x00000001);
> @@ -391,8 +1148,12 @@ static int config_wrot_frame(struct mdp_comp_ctx *ctx,
>   {
>   	const struct mdp_wrot_data *wrot = &ctx->param->wrot;
>   	const struct mdp_platform_config *mdp_cfg = __get_plat_cfg(ctx);
> +	const struct mtk_mdp_driver_data *data = ctx->comp->mdp_dev->mdp_data;
>   	phys_addr_t base = ctx->comp->reg_base;
>   	u8 subsys_id = ctx->comp->subsys_id;
> +	bool comp = 0;
> +	u32 colorformat = ctx->outputs[0]->buffer.format.colorformat;
> +	u32 alias_id = 0;
>   
>   	/* Write frame base address */
>   	MM_REG_WRITE(cmd, subsys_id, base, VIDO_BASE_ADDR, wrot->iova[0],
> @@ -401,9 +1162,35 @@ static int config_wrot_frame(struct mdp_comp_ctx *ctx,
>   		     0xFFFFFFFF);
>   	MM_REG_WRITE(cmd, subsys_id, base, VIDO_BASE_ADDR_V, wrot->iova[2],
>   		     0xFFFFFFFF);
> +
> +	if (mdp_cfg && mdp_cfg->wrot_support_afbc) {

Since all these subsequent writes and such do depend on mdp_cfg being present,
rechecking it everytime is suboptimal (even though it may be optimized away with
some compilers), and also human readability may be impacted.

Why don't you just do...

	if (mdp_cfg) {
		if (mdp-cfg->wrot_support_afbc) {
			...
		}

		if (mdp_cfg->wrot_support_10bit)

		...
	}

Looks a lot cleaner and a little more readable.

> +		comp = MDP_COLOR_IS_COMPRESS(colorformat);
> +		if (comp) {
> +			MM_REG_WRITE(cmd, subsys_id, base, VIDO_FRAME_SIZE,
> +				     wrot->framesize, 0xFFFFFFFF);
> +			MM_REG_WRITE(cmd, subsys_id, base, VIDO_AFBC_YUVTRANS,
> +				     wrot->afbc_yuvtrans, 0x1);
> +		}
> +		MM_REG_WRITE(cmd, subsys_id, base, VIDO_PVRIC,  wrot->pvric, 0x03);
> +	}
> +
> +	if (mdp_cfg && mdp_cfg->wrot_support_10bit) {
> +		MM_REG_WRITE(cmd, subsys_id, base, VIDO_SCAN_10BIT,
> +			     wrot->scan_10bit, 0x0000000F);
> +		MM_REG_WRITE(cmd, subsys_id, base, VIDO_PENDING_ZERO,
> +			     wrot->pending_zero, 0x04000000);
> +	}
> +	if (mdp_cfg && mdp_cfg->mdp_version_6885)
> +		MM_REG_WRITE(cmd, subsys_id, base, VIDO_CTRL_2, wrot->bit_number, 0x00000007);
> +
>   	/* Write frame related registers */
>   	MM_REG_WRITE(cmd, subsys_id, base, VIDO_CTRL, wrot->control,
>   		     0xF131510F);
> +
> +	/* Write pre-ultra threshold */
> +	MM_REG_WRITE(cmd, subsys_id, base, VIDO_DMA_PREULTRA, wrot->pre_ultra,
> +		     0x00FFFFFF);
> +
>   	/* Write frame Y pitch */
>   	MM_REG_WRITE(cmd, subsys_id, base, VIDO_STRIDE, wrot->stride[0],
>   		     0x0000FFFF);

snip..

>   
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
> index f6d70af80b3e..0b072c33e4e8 100644
> --- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
> @@ -25,12 +25,23 @@ enum mdp_buffer_usage {
>   };
>   
>   struct mdp_platform_config {
> -	bool	rdma_support_10bit;
> -	bool	rdma_rsz1_sram_sharing;
> -	bool	rdma_upsample_repeat_only;
> -	bool	rsz_disable_dcm_small_sample;
> -	bool	wrot_filter_constraint;
> -	u32	gce_event_offset;
> +	bool rdma_support_10bit;
> +	bool rdma_rsz1_sram_sharing;
> +	bool rdma_upsample_repeat_only;
> +	bool rdma_support_extend_ufo;
> +	bool rdma_support_hyfbc;
> +	bool rdma_support_afbc;
> +	bool rdma_esl_setting;
> +	bool rsz_disable_dcm_small_sample;
> +	bool rsz_etc_control;
> +	bool tdshp_1_1;
> +	bool wrot_filter_constraint;
> +	bool wrot_support_afbc;
> +	bool wrot_support_10bit;
> +	bool mdp_version_6885;
> +	bool mdp_version_8195;

I can imagine future SoCs getting another boolean in here... which is suboptimal.

I would go for a nice enumeration, like:
enum mtk_mdp3_version {
	MTK_MDP_VERSION_6885,
	MTK_MDP_VERSION_8195,
	MTK_MDP_VERSION_MAX,
};

... since apparently you're later setting true to both 6885 and 8195 on
the mt8195_plat_cfg, you'd simply need to set
	.version = MTK_MDP_VERSION_8195

and when you're doing checks such as
	if (mdp_cfg && mdp_cfg->mdp_version_6885)
you would be able to do something like
	if (mdp_cfg && mdp_cfg->version >= MTK_MDP_VERSION_6885)

That's way more convenient for when new incremental versions of this IP
will have to be added.

> +	u8 tdshp_dyn_contrast_version;
> +	u32 gce_event_offset;
>   };
>   
>   struct mtk_mdp_driver_data {
> @@ -52,7 +63,9 @@ struct mtk_mdp_driver_data {
>   struct mdp_dev {
>   	struct platform_device			*pdev;
>   	struct device				*mdp_mmsys;
> +	struct device				*mdp_mmsys2;
>   	struct mtk_mutex			*mdp_mutex[MDP_PIPE_MAX];
> +	struct mtk_mutex			*mdp_mutex2[MDP_PIPE_MAX];
>   	struct mdp_comp				*comp[MDP_MAX_COMP_COUNT];
>   	const struct mtk_mdp_driver_data	*mdp_data;
>   	s32					event[MDP_MAX_EVENT_COUNT];

> 
Thank you!

Regards,
- Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
