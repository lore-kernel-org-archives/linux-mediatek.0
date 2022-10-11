Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB33C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 09:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmaW+SPGguSuzLYiI/8/dUWUIRc8zLgHUTUp8nLBCOY=; b=We2BKSrNTME/rqYa3ig1O9XmsC
	nOD86AOjVXrFpezlD3pGw/NM5cFSWSh8WMgPDbEw0QAgXmxomNCf9vHrymgiBI2mpUxlYJzlhuewU
	hP51u0LwpNQ3pfwkfoPNAaExYf3UAP333udTP5oFRlNssI2fB046rBiK8aJgahBm7HrG8b9E4TIZE
	IeTLAOtja2QfWDtmOpBLAt0yRiIU2twdhFKJKR47ltWf+NC5pvLPRntcm9d3oqE4w+SH+QJd4/OYG
	I0vnNnqk0j2SWd/0bhEr5YJBXhPDTpdlc1YLppeWFu+Ktc2ppEcCdakJPvuFmiRj5LeA8xXzfYmao
	HqoPWecA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiBGp-003ofi-Ua; Tue, 11 Oct 2022 09:09:51 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiBGm-003oeF-86
	for linux-mediatek@lists.infradead.org; Tue, 11 Oct 2022 09:09:50 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A15746602357;
	Tue, 11 Oct 2022 10:09:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665479383;
	bh=7c9btVfUMqJ329O4RZC3no8wkRy+lLOPgY1jlkkTnFM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dgNQK77CL9C0HDHwPSOWtGsyXKQOO4upM597SuvKfEjIpf+aPfkmEyB/2qKr48Ed5
	 HC+xAoVBcLuHAQr58T0QFYo2TtDsXjwP7WFpW+AQx6YdZK/R5NP27cHIN9CDvuNnkg
	 iRc8R3QXgN3zR+oMZCMaF+9nG5H8DU2sXYBiQNMSMu5f531rElT7Q+50H0Gy8NdjFr
	 +Vh0Zmf0xYeujMklXpTva9VYcuNie0VFR61j8mgDY8PXHbUw3Odj9RQO9zENm3UoMk
	 /m4J+pNJqRrU7G4w1G0bn0K9pfIWWFo92Ln4V+lH3a2ufD2ysV35dNXYVkEH3NSMq2
	 /Ez4WAPrlBxkA==
Message-ID: <664e32dc-3f91-48ae-64a1-6dcecc9dfb5b@collabora.com>
Date: Tue, 11 Oct 2022 11:09:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [RESEND PATCH v2] drm/mediatek: Add AFBC support to Mediatek DRM
 driver
To: Justin Green <greenjustin@chromium.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: jason-jh.lin@mediatek.com, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, matthias.bgg@gmail.com,
 wenst@chromium.org, justin.yeh@mediatek.com, daniel@ffwll.ch
References: <20221010150157.1864492-1-greenjustin@google.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221010150157.1864492-1-greenjustin@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_020948_605281_1FBAE321 
X-CRM114-Status: GOOD (  27.95  )
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

Il 10/10/22 17:01, Justin Green ha scritto:
> From: Justin Green <greenjustin@chromium.org>
> 
> Add AFBC support to Mediatek DRM driver and enable on MT8195.
> 
> Tested on MT8195 and confirmed both correct video output and improved DRAM
> bandwidth performance.
> 
> v2:
> Marked mtk_ovl_set_afbc as static, reflowed some lines to fit column
> limit.
> 
> Signed-off-by: Justin Green <greenjustin@chromium.org>

Hello Justin,
thanks for the patch!

However, there's something to improve...

> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c  | 108 ++++++++++++++++++++---
>   drivers/gpu/drm/mediatek/mtk_drm_plane.c |  37 +++++++-
>   drivers/gpu/drm/mediatek/mtk_drm_plane.h |   8 ++
>   3 files changed, 140 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 002b0f6cae1a..1724ea85a840 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c

..snip..

> @@ -208,6 +231,8 @@ int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
>   {
>   	struct drm_plane_state *state = &mtk_state->base;
>   	unsigned int rotation = 0;
> +	unsigned long long modifier;
> +	unsigned int fourcc;
>   
>   	rotation = drm_rotation_simplify(state->rotation,
>   					 DRM_MODE_ROTATE_0 |
> @@ -226,6 +251,30 @@ int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
>   	if (state->fb->format->is_yuv && rotation != 0)
>   		return -EINVAL;
>   
> +	if (state->fb->modifier) {
> +		struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);

Since you're introducing modifier and fourcc for this branch only, you
may as well just declare them here instead, but either way is fine.

> +
> +		if (!ovl->data->supports_afbc)
> +			return -EINVAL;
> +
> +		modifier = state->fb->modifier;
> +
> +		if (modifier != DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
> +							AFBC_FORMAT_MOD_SPLIT |
> +							AFBC_FORMAT_MOD_SPARSE))
> +			return -EINVAL;
> +
> +		fourcc = state->fb->format->format;
> +		if (fourcc != DRM_FORMAT_BGRA8888 &&
> +		    fourcc != DRM_FORMAT_ABGR8888 &&
> +		    fourcc != DRM_FORMAT_ARGB8888 &&
> +		    fourcc != DRM_FORMAT_XRGB8888 &&
> +		    fourcc != DRM_FORMAT_XBGR8888 &&
> +		    fourcc != DRM_FORMAT_RGB888 &&
> +		    fourcc != DRM_FORMAT_BGR888)
> +			return -EINVAL;
> +	}
> +
>   	state->rotation = rotation;
>   
>   	return 0;
> @@ -310,11 +359,14 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
>   	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
>   	struct mtk_plane_pending_state *pending = &state->pending;
>   	unsigned int addr = pending->addr;
> -	unsigned int pitch = pending->pitch & 0xffff;
> +	unsigned int hdr_addr = pending->hdr_addr;
> +	unsigned int pitch = pending->pitch;
> +	unsigned int hdr_pitch = pending->hdr_pitch;
>   	unsigned int fmt = pending->format;
>   	unsigned int offset = (pending->y << 16) | pending->x;
>   	unsigned int src_size = (pending->height << 16) | pending->width;
>   	unsigned int con;
> +	bool is_afbc = pending->modifier;
>   
>   	if (!pending->enable) {
>   		mtk_ovl_layer_off(dev, idx, cmdq_pkt);
> @@ -335,16 +387,39 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
>   		addr += pending->pitch - 1;
>   	}
>   
> -	mtk_ddp_write_relaxed(cmdq_pkt, con, &ovl->cmdq_reg, ovl->regs,
> -			      DISP_REG_OVL_CON(idx));
> -	mtk_ddp_write_relaxed(cmdq_pkt, pitch, &ovl->cmdq_reg, ovl->regs,
> -			      DISP_REG_OVL_PITCH(idx));
> -	mtk_ddp_write_relaxed(cmdq_pkt, src_size, &ovl->cmdq_reg, ovl->regs,
> -			      DISP_REG_OVL_SRC_SIZE(idx));
> -	mtk_ddp_write_relaxed(cmdq_pkt, offset, &ovl->cmdq_reg, ovl->regs,
> -			      DISP_REG_OVL_OFFSET(idx));
> -	mtk_ddp_write_relaxed(cmdq_pkt, addr, &ovl->cmdq_reg, ovl->regs,
> -			      DISP_REG_OVL_ADDR(ovl, idx));
> +	mtk_ovl_set_afbc(dev, cmdq_pkt, idx, is_afbc);
> +	if (!is_afbc) {
> +		mtk_ddp_write_relaxed(cmdq_pkt, con, &ovl->cmdq_reg, ovl->regs,
> +				      DISP_REG_OVL_CON(idx));
> +		mtk_ddp_write_relaxed(cmdq_pkt, pitch & 0xFFFF, &ovl->cmdq_reg, ovl->regs,
> +				      DISP_REG_OVL_PITCH(idx));
> +		mtk_ddp_write_relaxed(cmdq_pkt, src_size, &ovl->cmdq_reg, ovl->regs,
> +				      DISP_REG_OVL_SRC_SIZE(idx));
> +		mtk_ddp_write_relaxed(cmdq_pkt, offset, &ovl->cmdq_reg, ovl->regs,
> +				      DISP_REG_OVL_OFFSET(idx));
> +		mtk_ddp_write_relaxed(cmdq_pkt, addr, &ovl->cmdq_reg, ovl->regs,
> +				      DISP_REG_OVL_ADDR(ovl, idx));
> +	} else {
> +		mtk_ddp_write_relaxed(cmdq_pkt, addr, &ovl->cmdq_reg, ovl->regs,
> +				      DISP_REG_OVL_ADDR(ovl, idx));
> +		mtk_ddp_write_relaxed(cmdq_pkt, hdr_addr, &ovl->cmdq_reg, ovl->regs,
> +				      DISP_REG_OVL_HDR_ADDR(ovl, idx));
> +		mtk_ddp_write_relaxed(cmdq_pkt, src_size, &ovl->cmdq_reg, ovl->regs,
> +				      DISP_REG_OVL_SRC_SIZE(idx));
> +		mtk_ddp_write_relaxed(cmdq_pkt,
> +				      OVL_PITCH_MSB_2ND_SUBBUF | ((pitch >> 16) & 0xFFFF),

I say that this would be more readable if you use bitfield macros instead but,
anyway, that magic "16" number must get a definition.
I have the same comment about the GENMASK(15, 0) (== 0xffff), but I know that
doesn't come from you... would still be nice to also add a definition, which
is anyway "practically mandatory" if you use FIELD_PREP(mask, val).

> +				      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_PITCH_MSB(idx));
> +		mtk_ddp_write_relaxed(cmdq_pkt, pitch & 0xFFFF, &ovl->cmdq_reg, ovl->regs,
> +				      DISP_REG_OVL_PITCH(idx));
> +		mtk_ddp_write_relaxed(cmdq_pkt, hdr_pitch, &ovl->cmdq_reg, ovl->regs,
> +				      DISP_REG_OVL_HDR_PITCH(ovl, idx));
> +		mtk_ddp_write_relaxed(cmdq_pkt, con, &ovl->cmdq_reg, ovl->regs,
> +				      DISP_REG_OVL_CON(idx));
> +		mtk_ddp_write_relaxed(cmdq_pkt, offset, &ovl->cmdq_reg, ovl->regs,
> +				      DISP_REG_OVL_OFFSET(idx));
> +		mtk_ddp_write_relaxed(cmdq_pkt, 0, &ovl->cmdq_reg, ovl->regs,
> +				      DISP_REG_OVL_CLIP(idx));
> +	}

In any case - are you use that we *must* program the registers in this exact
sequence?

Here, the OVL layer is supposed to be OFF (OVL_SRC_CON == 0, OVL_RDMA_CTRL == 0)
so the contents of the registers that you're modifying should not matter at all
until the layer is turned on.

Note that, in case it doesn't matter, this gets greatly simplified, exactly as:

at the top -- after DISP_REG_OVL_PITCH_MSB(n):
#define OVL_SRC_PITCH_MSB	GENMASK(3, 0)

after DISP_REG_OVL_PITCH(n):
#define OVL_SRC_PITCH_LSB	GENMASK(15, 0)

	mtk_ddp_write_relaxed(cmdq_pkt, con, &ovl->cmdq_reg, ovl->regs,
			      DISP_REG_OVL_CON(idx));
	mtk_ddp_write_relaxed(cmdq_pkt, FIELD_PREP(OVL_SRC_PITCH_LSB, pitch),
			      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_PITCH(idx));
	mtk_ddp_write_relaxed(cmdq_pkt, src_size, &ovl->cmdq_reg, ovl->regs,
			      DISP_REG_OVL_SRC_SIZE(idx));
	mtk_ddp_write_relaxed(cmdq_pkt, offset, &ovl->cmdq_reg, ovl->regs,
			      DISP_REG_OVL_OFFSET(idx));
	mtk_ddp_write_relaxed(cmdq_pkt, addr, &ovl->cmdq_reg, ovl->regs,
			      DISP_REG_OVL_ADDR(ovl, idx));

	if (is_afbc) {
		pitch_msb = FIELD_PREP(OVL_SRC_PITCH_MSB, (pitch >> 16));
		pitch_msb |= FIELD_PREP(OVL_PITCH_MSB_2ND_SUBBUF, 1);
		mtk_ddp_write_relaxed(cmdq_pkt, hdr_addr, &ovl->cmdq_reg, ovl->regs,
				      DISP_REG_OVL_HDR_ADDR(ovl, idx));
		mtk_ddp_write_relaxed(cmdq_pkt, val, &ovl->cmdq_reg, ovl->regs,
				      DISP_REG_OVL_PITCH_MSB(idx));
		mtk_ddp_write_relaxed(cmdq_pkt, hdr_pitch, &ovl->cmdq_reg, ovl->regs,
				      DISP_REG_OVL_HDR_PITCH(ovl, idx));
		mtk_ddp_write_relaxed(cmdq_pkt, 0, &ovl->cmdq_reg, ovl->regs,
				      DISP_REG_OVL_CLIP(idx));
	}

>   
>   	mtk_ovl_layer_on(dev, idx, cmdq_pkt);
>   }
> @@ -492,6 +567,15 @@ static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {

..snip..

> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index 5c0d9ce69931..734d2554b2b8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -12,6 +12,7 @@
>   #include <drm/drm_framebuffer.h>
>   #include <drm/drm_gem_atomic_helper.h>
>   #include <drm/drm_plane_helper.h>
> +#include <linux/align.h>
>   
>   #include "mtk_drm_crtc.h"
>   #include "mtk_drm_ddp_comp.h"
> @@ -52,6 +53,7 @@ static void mtk_plane_reset(struct drm_plane *plane)
>   
>   	state->base.plane = plane;
>   	state->pending.format = DRM_FORMAT_RGB565;
> +	state->pending.modifier = 0;
>   }
>   
>   static struct drm_plane_state *mtk_plane_duplicate_state(struct drm_plane *plane)
> @@ -120,21 +122,52 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
>   	struct drm_gem_object *gem;
>   	struct mtk_drm_gem_obj *mtk_gem;
>   	unsigned int pitch, format;
> +	unsigned long long modifier;
>   	dma_addr_t addr;
> +	dma_addr_t hdr_addr = 0;
> +	unsigned int hdr_pitch = 0;
>   
>   	gem = fb->obj[0];
>   	mtk_gem = to_mtk_gem_obj(gem);
>   	addr = mtk_gem->dma_addr;
>   	pitch = fb->pitches[0];
>   	format = fb->format->format;
> +	modifier = fb->modifier;
>   
> -	addr += (new_state->src.x1 >> 16) * fb->format->cpp[0];
> -	addr += (new_state->src.y1 >> 16) * pitch;
> +	if (!modifier) {
> +		addr += (new_state->src.x1 >> 16) * fb->format->cpp[0];
> +		addr += (new_state->src.y1 >> 16) * pitch;
> +	} else {
> +		int width_in_blocks = ALIGN(fb->width, AFBC_DATA_BLOCK_WIDTH)
> +				      / AFBC_DATA_BLOCK_WIDTH;
> +		int height_in_blocks = ALIGN(fb->height, AFBC_DATA_BLOCK_HEIGHT)
> +				       / AFBC_DATA_BLOCK_HEIGHT;
> +		int x_offset_in_blocks = (new_state->src.x1 >> 16) / AFBC_DATA_BLOCK_WIDTH;
> +		int y_offset_in_blocks = (new_state->src.y1 >> 16) / AFBC_DATA_BLOCK_HEIGHT;
> +		int hdr_size;
> +
> +		hdr_pitch = width_in_blocks * AFBC_HEADER_BLOCK_SIZE;
> +		pitch = width_in_blocks * AFBC_DATA_BLOCK_WIDTH *
> +			AFBC_DATA_BLOCK_HEIGHT * fb->format->cpp[0];
> +
> +		hdr_size = ALIGN(hdr_pitch * height_in_blocks, AFBC_HEADER_ALIGNMENT);
> +
> +		hdr_addr = addr + hdr_pitch * y_offset_in_blocks +
> +			   AFBC_HEADER_BLOCK_SIZE * x_offset_in_blocks;
> +		// The data plane is offset by 1 additional block.

C-style comments please.

> +		addr = addr + hdr_size +
> +		       pitch * y_offset_in_blocks +
> +		       AFBC_DATA_BLOCK_WIDTH * AFBC_DATA_BLOCK_HEIGHT *
> +		       fb->format->cpp[0] * (x_offset_in_blocks + 1);
> +	}
>   

Regards,
Angelo


