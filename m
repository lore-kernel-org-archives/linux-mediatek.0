Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86C9C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jun 2022 15:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jnP/Ld9465EBMz6TjK+KwXQkRXygAkv3ZZMrcnrVMyM=; b=KIy6R4d261do0XhcZWaiwWzPFq
	3KY5wws5SYHdiTPtppVpNecH2mYDIa31wwA4QwalCgjgiJaAyN5IrJwiVrXq0HSKTmznMetuOdZbL
	QZ2a4NrYYGz+HbVDx0ng4y/HK20+wD22R82qlDkCsXa/9cnoXxrkD0g0145rlwm/s6zVi6GbxW7B0
	uwHTVp4AQqui+oKn6mpJQGu9dSzs4hEfzSGVj4CvCOtY/VNXOdQAZBLUQNrZe1D8YgKEd/wP1TOEe
	js9uzCn5jF0dzyxOpEIBtvkFkV5v9GtUEQxSpXYfiaiVteW4r9tCsMxUQGAyJVoug0uPnsaNxOSuE
	BDa3cqCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3fha-0067nw-VL; Tue, 21 Jun 2022 15:22:03 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3fgv-0067Yv-AD
	for linux-mediatek@lists.infradead.org; Tue, 21 Jun 2022 15:21:27 +0000
Received: by mail-qv1-xf33.google.com with SMTP id p31so20808986qvp.5
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jun 2022 08:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=jnP/Ld9465EBMz6TjK+KwXQkRXygAkv3ZZMrcnrVMyM=;
        b=Ak1lMW2ybqFvglOiu0tSPY+tKIu/DrWuJAzgUr04JZUyx0oT/lDxeCghhJWQkMkYLk
         NllkwqSE8r08TZ2UQ8qtiirmc2pWO9OWJe0K6T2Kcyaw5c7sZtNPAJayFXU/X7c0oa0T
         lnykWB1pssTkx6OLkgdHKvgoxi7dqrT2gKxjDSBymUxtRPDXBqkEasFXSBVAJ0c6b3pG
         XlfLtMT/TiSvuAyjOqrze6KFIBmwk7NmdVGNu9la9KaaKxUDTHGhixAmlLZDDS+N2d5u
         f9lPLsxHeuEBFrLGm2eDRu4tZTfnU2vOE1soMb0YyuWKwwHNiN1v87KpJszRtm3Gi3Lt
         Zu1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=jnP/Ld9465EBMz6TjK+KwXQkRXygAkv3ZZMrcnrVMyM=;
        b=s3xkcbIWsWBhLT9KqmI+ahZuYeB/JgaJyQTEi20BpoC010xsKd7u/KIfw9SuWq3KDu
         PrUVipCJxOfXDMEsYM1UVT/kIO2U0JcFm3e2CAbkWy4T8HHzwefC9pLC9d3GqXMPPCac
         WxnXLc5KTAX6SxY35xz+n2usLOaxBRAglYTwWIqhKYuv85lL9TgCl5+PqiniBOQkoDzH
         /VHBdSZHTscGIU7nDsFuodZ17BXUuN0BDaWL+R08HoWJj+Afv4dK9sZtAB6JiNVrbc/t
         RbJHQyiFXQVH/aoqzrMecywVNulNDrhXcFUGxG04SZLVNnEeEhirz/QA/eitMp4avqJR
         Z12Q==
X-Gm-Message-State: AJIora8/4r6KOT9381EeSX3jDFhVBW/iF9KjJMgnxFj+S3TMqqf24LNz
	SNjBV8Qg+xLRJGpLdbS90muj5g==
X-Google-Smtp-Source: AGRyM1tUdKEs6xTtDWsQK3IZKFCwDjuFOtrWyrLEnq8cssy71Q1GYw6tUjy9X5CAGkU4+X1s7XDSbg==
X-Received: by 2002:a0c:c68a:0:b0:46b:8e6b:306 with SMTP id d10-20020a0cc68a000000b0046b8e6b0306mr23469680qvj.7.1655824878349;
        Tue, 21 Jun 2022 08:21:18 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id h3-20020a05622a170300b002f905347586sm14358984qtk.14.2022.06.21.08.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 08:21:17 -0700 (PDT)
Message-ID: <0489baa83e471cb96c9542097dc5095ec350ef7d.camel@ndufresne.ca>
Subject: Re: [PATCH v18 4/4] media: platform: mtk-mdp3: add Mediatek MDP3
 driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "moudy.ho" <moudy.ho@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Alexandre Courbot
 <acourbot@chromium.org>,  tfiga@chromium.org, drinkcat@chromium.org,
 pihsun@chromium.org, hsinyi@google.com,  Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, daoyuan huang
 <daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, 
 allen-kh.cheng@mediatek.com, xiandong.wang@mediatek.com,
 randy.wu@mediatek.com,  jason-jh.lin@mediatek.com, roy-cw.yeh@mediatek.com,
 river.cheng@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, cellopoint.kai@gmail.com
Date: Tue, 21 Jun 2022 11:21:15 -0400
In-Reply-To: <ab2e8db8bed71d4d6dfd89af30bc01cb9cececdf.camel@mediatek.com>
References: <20220610064504.8302-1-moudy.ho@mediatek.com>
	 <20220610064504.8302-5-moudy.ho@mediatek.com>
	 <00425854140b029ffbcde5b88c45aa213dbb7d9f.camel@ndufresne.ca>
	 <ab2e8db8bed71d4d6dfd89af30bc01cb9cececdf.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_082121_520807_070BBD59 
X-CRM114-Status: GOOD (  41.14  )
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

Le vendredi 17 juin 2022 =C3=A0 14:19 +0800, moudy.ho a =C3=A9crit=C2=A0:
> Hi Nicolas,
>=20
> On Mon, 2022-06-13 at 11:06 -0400, Nicolas Dufresne wrote:
> > Le vendredi 10 juin 2022 =C3=A0 14:45 +0800, Moudy Ho a =C3=A9crit :
> > > This patch adds driver for Mediatek's Media Data Path ver.3 (MDP3).
> > > It provides the following functions:
> > >   color transform, format conversion, resize, crop, rotate, flip
> > >   and additional image quality enhancement.
>=20

[snip]

> > > +static void mdp_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
> > > +{
> > > +	struct cmdq_client *client =3D (struct cmdq_client *)pkt->cl;
> > > +
> > > +	dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt-
> > > > buf_size,
> > > +			 DMA_TO_DEVICE);
> >=20
> > nit: On a theoretical base, since this may have no effect on this
> > architecture,
> > shouldn't a "destroy" function just discard any cached data ? Hence,
> > shouldn't
> > you use DMA_NONE here ?
> >=20
>=20
> When I tried to adjust the direction of dma_unmap to DMA_NONE, the
> unmap error occurred.
>=20
> [   37.892801] kernel BUG at kernel/dma/mapping.c:167!
> ...
> [   37.893014] Workqueue: mtk-mdp3-clock mdp_auto_release_work
> [mtk_mdp3]
> [   37.893021] pstate: 60400005 (nZCv daif +PAN -UAO -TCO BTYPE=3D--)
> [   37.893034] pc : dma_unmap_page_attrs+0x1ac/0x1b0
> [   37.893043] lr : mdp_cmdq_pkt_destroy+0x3c/0x54 [mtk_mdp3]
> [   37.893046] sp : ffffffc010ac3d40
> ...
> [   37.926819] Kernel panic - not syncing: Oops - BUG: Fatal exception
> ...
>=20
> Looking back, I found that the directions were limited to only 3 by the
> following checking:
>=20
> </linux/dma-direction.h>
>=20
> static inline int valid_dma_direction(enum dma_data_direction dir)
> {
>         return dir =3D=3D DMA_BIDIRECTIONAL || dir =3D=3D DMA_TO_DEVICE |=
|
>                 dir =3D=3D DMA_FROM_DEVICE;
> }

My apology, I should have looked at the documentation before commenting.

>=20
> > > +	kfree(pkt->va_base);
> > > +}
> > > +
> > > +static void mdp_auto_release_work(struct work_struct *work)
> > > +{
> > > +	struct mdp_cmdq_cmd *cmd;
> > > +	struct mdp_dev *mdp;
> > > +
> > > +	cmd =3D container_of(work, struct mdp_cmdq_cmd,
> > > auto_release_work);
> > > +	mdp =3D cmd->mdp;
> > > +
> > > +	mtk_mutex_unprepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
> > > +	mdp_comp_clocks_off(&mdp->pdev->dev, cmd->comps,
> > > +			    cmd->num_comps);
> > > +
> > > +	atomic_dec(&mdp->job_count);
> > > +	wake_up(&mdp->callback_wq);
> > > +
> > > +	mdp_cmdq_pkt_destroy(&cmd->pkt);
> > > +	kfree(cmd->comps);
> > > +	kfree(cmd);
> > > +}
> > > +
>=20
> [snip]
>=20
> > > diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> > > b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> > > new file mode 100644
> > > index 000000000000..e8081f246023
> > > --- /dev/null
> > > +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> > > @@ -0,0 +1,987 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (c) 2021 MediaTek Inc.
> > > + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> > > + */
> > > +
> > > +#include <linux/clk.h>
> > > +#include <linux/of_platform.h>
> > > +#include <linux/of_address.h>
> > > +#include <linux/pm_runtime.h>
> > > +#include "mtk-mdp3-comp.h"
> > > +#include "mtk-mdp3-core.h"
> > > +#include "mtk-mdp3-regs.h"
> > > +
> > > +#include "mdp_reg_rdma.h"
> > > +#include "mdp_reg_ccorr.h"
> > > +#include "mdp_reg_rsz.h"
> > > +#include "mdp_reg_wrot.h"
> > > +#include "mdp_reg_wdma.h"
> > > +
> > > +u32 mdp_comp_alias_id[MDP_COMP_TYPE_COUNT];
> > > +
> > > +static const struct mdp_platform_config *__get_plat_cfg(const
> > > struct mdp_comp_ctx *ctx)
> > > +{
> > > +	if (!ctx)
> > > +		return NULL;
> > > +
> > > +	return ctx->comp->mdp_dev->mdp_data->mdp_cfg;
> > > +}
> > > +
> > > +static s64 get_comp_flag(const struct mdp_comp_ctx *ctx)
> > > +{
> > > +	const struct mdp_platform_config *mdp_cfg =3D
> > > __get_plat_cfg(ctx);
> > > +
> > > +	if (mdp_cfg && mdp_cfg->rdma_rsz1_sram_sharing)
> > > +		if (ctx->comp->id =3D=3D MDP_COMP_RDMA0)
> > > +			return BIT(MDP_COMP_RDMA0) |
> > > BIT(MDP_COMP_RSZ1);
> > > +
> > > +	return BIT(ctx->comp->id);
> > > +}
> > > +
> > > +static int init_rdma(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd
> > > *cmd)
> > > +{
> > > +	const struct mdp_platform_config *mdp_cfg =3D
> > > __get_plat_cfg(ctx);
> > > +	phys_addr_t base =3D ctx->comp->reg_base;
> > > +	u8 subsys_id =3D ctx->comp->subsys_id;
> > > +
> > > +	if (mdp_cfg && mdp_cfg->rdma_support_10bit) {
> > > +		struct mdp_comp *prz1 =3D ctx->comp->mdp_dev-
> > > > comp[MDP_COMP_RSZ1];
> > > +
> > > +		/* Disable RSZ1 */
> > > +		if (ctx->comp->id =3D=3D MDP_COMP_RDMA0 && prz1)
> > > +			MM_REG_WRITE(cmd, subsys_id, prz1->reg_base,
> > > PRZ_ENABLE,
> > > +				     0x0, BIT(0));
> > > +	}
> > > +
> > > +	/* Reset RDMA */
> > > +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_RESET, BIT(0),
> > > BIT(0));
> > > +	MM_REG_POLL(cmd, subsys_id, base, MDP_RDMA_MON_STA_1, BIT(8),
> > > BIT(8));
> > > +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_RESET, 0x0,
> > > BIT(0));
> > > +	return 0;
> > > +}
> > > +
> > > +static int config_rdma_frame(struct mdp_comp_ctx *ctx,
> > > +			     struct mdp_cmdq_cmd *cmd,
> > > +			     const struct v4l2_rect *compose)
> > > +{
> > > +	const struct mdp_rdma_data *rdma =3D &ctx->param->rdma;
> > > +	const struct mdp_platform_config *mdp_cfg =3D
> > > __get_plat_cfg(ctx);
> > > +	u32 colorformat =3D ctx->input->buffer.format.colorformat;
> > > +	bool block10bit =3D MDP_COLOR_IS_10BIT_PACKED(colorformat);
> > > +	bool en_ufo =3D MDP_COLOR_IS_UFP(colorformat);
> > > +	phys_addr_t base =3D ctx->comp->reg_base;
> > > +	u8 subsys_id =3D ctx->comp->subsys_id;
> > > +
> > > +	if (mdp_cfg && mdp_cfg->rdma_support_10bit) {
> > > +		if (block10bit)
> > > +			MM_REG_WRITE(cmd, subsys_id, base,
> > > +				     MDP_RDMA_RESV_DUMMY_0, 0x7, 0x7);
> > > +		else
> > > +			MM_REG_WRITE(cmd, subsys_id, base,
> > > +				     MDP_RDMA_RESV_DUMMY_0, 0x0, 0x7);
> > > +	}
> > > +
> > > +	/* Setup smi control */
> > > +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_GMCIF_CON,
> > > +		     (7 <<  4) + //burst type to 8
> > > +		     (1 << 16),  //enable pre-ultra
> > > +		     0x00030071);
> > > +
> > > +	/* Setup source frame info */
> > > +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_CON, rdma-
> > > > src_ctrl,
> > > +		     0x03C8FE0F);
> > > +
> > > +	if (mdp_cfg)
> > > +		if (mdp_cfg->rdma_support_10bit && en_ufo) {
> > > +			/* Setup source buffer base */
> > > +			MM_REG_WRITE(cmd, subsys_id,
> > > +				     base,
> > > MDP_RDMA_UFO_DEC_LENGTH_BASE_Y,
> > > +				     rdma->ufo_dec_y, 0xFFFFFFFF);
> > > +			MM_REG_WRITE(cmd, subsys_id,
> > > +				     base,
> > > MDP_RDMA_UFO_DEC_LENGTH_BASE_C,
> > > +				     rdma->ufo_dec_c, 0xFFFFFFFF);
> > > +			/* Set 10bit source frame pitch */
> > > +			if (block10bit)
> > > +				MM_REG_WRITE(cmd, subsys_id,
> > > +					     base,
> > > MDP_RDMA_MF_BKGD_SIZE_IN_PXL,
> > > +					     rdma->mf_bkgd_in_pxl,
> > > 0x001FFFFF);
> >=20
> > I'm not against, but this is dead code as you didn't add a 10bit
> > variant of MTK
> > block format. Perhaps I'd be more happy if you commit into enabling
> > this, or
> > enabled it. This is personal opinion though.
> >=20
>=20
> Maybe I should just remove these advanced features related to 10bit
> format?

Looking at it, the implementation looks quite complete, so adding and
documenting the pixel format(s) that allow using this feature seems relativ=
ely
short and recommended. Though, if that is impossible for you, I think yes, =
the
code must be removed as it is dead code, and only re-added later with the
required application facing code.

>=20
> > > +		}
> > > +
> > > +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_CON, rdma->control,
> > > +		     0x1110);
> > > +	/* Setup source buffer base */
> > > +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_BASE_0, rdma-
> > > > iova[0],
> > > +		     0xFFFFFFFF);
> > > +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_BASE_1, rdma-
> > > > iova[1],
> > > +		     0xFFFFFFFF);
> > > +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_BASE_2, rdma-
> > > > iova[2],
> > > +		     0xFFFFFFFF);
> > > +	/* Setup source buffer end */
> > > +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_END_0,
> > > +		     rdma->iova_end[0], 0xFFFFFFFF);
> > > +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_END_1,
> > > +		     rdma->iova_end[1], 0xFFFFFFFF);
> > > +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_END_2,
> > > +		     rdma->iova_end[2], 0xFFFFFFFF);
> > > +	/* Setup source frame pitch */
> > > +	MM_REG_WRITE(cmd, subsys_id, base,
> > > MDP_RDMA_MF_BKGD_SIZE_IN_BYTE,
> > > +		     rdma->mf_bkgd, 0x001FFFFF);
> > > +	MM_REG_WRITE(cmd, subsys_id, base,
> > > MDP_RDMA_SF_BKGD_SIZE_IN_BYTE,
> > > +		     rdma->sf_bkgd, 0x001FFFFF);
> > > +	/* Setup color transform */
> > > +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_TRANSFORM_0,
> > > +		     rdma->transform, 0x0F110000);
> > > +
> > > +	return 0;
> > > +}
> > > +
>=20
> [snip]
>=20
> > > +static int mdp_comp_get_id(enum mdp_comp_type type, int alias_id)
> > > +{
> > > +	int i;
> > > +
> > > +	for (i =3D 0; i < ARRAY_SIZE(mdp_comp_matches); i++)
> > > +		if (mdp_comp_matches[i].type =3D=3D type &&
> > > +		    mdp_comp_matches[i].alias_id =3D=3D alias_id)
> > > +			return i;
> > > +	return -ENODEV;
> > > +}
> > > +
> > > +void mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp)
> >=20
> > This function can fail, yet it has no return value. I have a bit of a
> > concern,
> > in other drivers if you failed to enable the clocks, you risk system
> > hangs on
> > sram read/writes. I'd like to see this fixed, or a little comment
> > saying its
> > safe to ignore.
> >=20
>=20
> Thanks for your suggestion, I will adjust this section and add error
> control.
>=20
> > > +{
> > > +	int i, err;
> > > +
> > > +	if (comp->comp_dev) {
> > > +		err =3D pm_runtime_get_sync(comp->comp_dev);
> > > +		if (err < 0)
> > > +			dev_err(dev,
> > > +				"Failed to get power, err %d. type:%d
> > > id:%d\n",
> > > +				err, comp->type, comp->id);
> > > +	}
> > > +
> > > +	for (i =3D 0; i < ARRAY_SIZE(comp->clks); i++) {
> > > +		if (IS_ERR_OR_NULL(comp->clks[i]))
> > > +			continue;
> > > +		err =3D clk_prepare_enable(comp->clks[i]);
> > > +		if (err)
> > > +			dev_err(dev,
> > > +				"Failed to enable clk %d. type:%d
> > > id:%d\n",
> > > +				i, comp->type, comp->id);
> > > +	}
> > > +}
> > > +
> > > +void mdp_comp_clock_off(struct device *dev, struct mdp_comp *comp)
> > > +{
> > > +	int i;
> > > +
> > > +	for (i =3D 0; i < ARRAY_SIZE(comp->clks); i++) {
> > > +		if (IS_ERR_OR_NULL(comp->clks[i]))
> > > +			continue;
> > > +		clk_disable_unprepare(comp->clks[i]);
> > > +	}
> > > +
> > > +	if (comp->comp_dev)
> > > +		pm_runtime_put(comp->comp_dev);
> > > +}
> > > +
> > > +void mdp_comp_clocks_on(struct device *dev, struct mdp_comp
> > > *comps, int num)
> >=20
> > ... and this one would have to aggregate the error.
> >=20
>=20
> Ditto
>=20
> > > +{
> > > +	int i;
> > > +
> > > +	for (i =3D 0; i < num; i++)
> > > +		mdp_comp_clock_on(dev, &comps[i]);
> > > +}
> > > +
>=20
> [snip]
>=20
> > > +static void mdp_comp_deinit(struct mdp_comp *comp)
> > > +{
> > > +	if (!comp)
> > > +		return;
> > > +
> > > +	if (comp->regs)
> > > +		iounmap(comp->regs);
> > > +}
> > > +
> > > +void mdp_component_deinit(struct mdp_dev *mdp)
> >=20
> > Perhaps you want to name that one mdp_components_deinit() or
> > mdp_comps_deinit().
> > Calling it mdp_component_deinit() is too confusing with another
> > function called
> > mdp_comp_deinit().
> >=20
>=20
> What if it is adjusted as follows:
>=20
> mdp_comp_deinit      -> keep
> mdp_component_deinit -> mdp_comp_destroy
> mdp_component_init   -> mdp_comp_config
> mdp_comp_ctx_init    -> mdp_comp_ctx_config

This looks good.

>=20
> > > +{
> > > +	int i;
> > > +
> > > +	for (i =3D 0; i < MDP_PIPE_MAX; i++)
> > > +		mtk_mutex_put(mdp->mdp_mutex[i]);
> >=20
> > Without context, my impression is that this should happen after
> > things get
> > disabled/freed ?
> >=20
>=20
> Thanks for the correction, I should move from this function
>=20
> > > +
> > > +	for (i =3D 0; i < ARRAY_SIZE(mdp->comp); i++) {
> > > +		if (mdp->comp[i]) {
> > > +			pm_runtime_disable(mdp->comp[i]->comp_dev);
> > > +			mdp_comp_deinit(mdp->comp[i]);
> > > +			kfree(mdp->comp[i]);
> >=20
> > I'd make this function safer and do mdp->comp[i] =3D NULL;
> >=20
>=20
> Thanks for the suggestion, this adjustment will indeed be more robust.
>=20
> > > +		}
> > > +	}
> > > +}
> > > +
> > > +int mdp_component_init(struct mdp_dev *mdp)
> > > +{
> > > +	struct device *dev =3D &mdp->pdev->dev;
> > > +	struct device_node *node, *parent;
> > > +	struct platform_device *pdev;
> > > +	int ret;
> > > +
> > > +	memset(mdp_comp_alias_id, 0, sizeof(mdp_comp_alias_id));
> > > +
> > > +	parent =3D dev->of_node->parent;
> > > +	/* Iterate over sibling MDP function blocks */
> > > +	for_each_child_of_node(parent, node) {
> > > +		const struct of_device_id *of_id;
> > > +		enum mdp_comp_type type;
> > > +		int id, alias_id;
> > > +		struct mdp_comp *comp;
> > > +
> > > +		of_id =3D of_match_node(mdp_comp_dt_ids, node);
> > > +		if (!of_id)
> > > +			continue;
> > > +
> > > +		if (!of_device_is_available(node)) {
> > > +			dev_info(dev, "Skipping disabled component
> > > %pOF\n", node);
> > > +			continue;
> > > +		}
> > > +
> > > +		type =3D (enum mdp_comp_type)of_id->data;
> > > +		alias_id =3D mdp_comp_alias_id[type];
> > > +		id =3D mdp_comp_get_id(type, alias_id);
> > > +		if (id < 0) {
> > > +			dev_err(dev,
> > > +				"Fail to get component id: type %d
> > > alias %d\n",
> > > +				type, alias_id);
> > > +			continue;
> > > +		}
> > > +		mdp_comp_alias_id[type]++;
> > > +
> > > +		comp =3D mdp_comp_create(mdp, node, id);
> > > +		if (IS_ERR(comp)) {
> > > +			ret =3D PTR_ERR(comp);
> > > +			goto err_init_comps;
> > > +		}
> > > +
> > > +		/* Only DMA capable components need the pm control */
> > > +		comp->comp_dev =3D NULL;
> > > +		if (comp->type !=3D MDP_COMP_TYPE_RDMA &&
> > > +		    comp->type !=3D MDP_COMP_TYPE_WROT &&
> > > +		    comp->type !=3D MDP_COMP_TYPE_WDMA)
> > > +			continue;
> > > +
> > > +		pdev =3D of_find_device_by_node(node);
> > > +		if (!pdev) {
> > > +			dev_warn(dev, "can't find platform device of
> > > node:%s\n",
> > > +				 node->name);
> > > +			return -ENODEV;
> > > +		}
> > > +
> > > +		comp->comp_dev =3D &pdev->dev;
> > > +		pm_runtime_enable(comp->comp_dev);
> > > +	}
> > > +
> > > +	ret =3D mdp_sub_comps_create(mdp);
> > > +	if (ret)
> > > +		goto err_init_comps;
> > > +
> > > +	return 0;
> > > +
> > > +err_init_comps:
> > > +	mdp_component_deinit(mdp);
> > > +	return ret;
> > > +}
> > > +
>=20
> [snip]
>=20
> > > diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
> > > b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
> > > new file mode 100644
> > > index 000000000000..c2b2a18dd4f5
> > > --- /dev/null
> > > +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
> > > @@ -0,0 +1,772 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (c) 2021 MediaTek Inc.
> > > + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> > > + */
> > > +
> > > +#include <linux/platform_device.h>
> > > +#include <media/v4l2-ioctl.h>
> > > +#include <media/v4l2-event.h>
> > > +#include <media/videobuf2-dma-contig.h>
> > > +#include "mtk-mdp3-m2m.h"
> > > +
> > > +static inline struct mdp_m2m_ctx *fh_to_ctx(struct v4l2_fh *fh)
> > > +{
> > > +	return container_of(fh, struct mdp_m2m_ctx, fh);
> > > +}
> > > +
> > > +static inline struct mdp_m2m_ctx *ctrl_to_ctx(struct v4l2_ctrl
> > > *ctrl)
> > > +{
> > > +	return container_of(ctrl->handler, struct mdp_m2m_ctx,
> > > ctrl_handler);
> > > +}
> > > +
> > > +static inline struct mdp_frame *ctx_get_frame(struct mdp_m2m_ctx
> > > *ctx,
> > > +					      enum v4l2_buf_type type)
> > > +{
> > > +	if (V4L2_TYPE_IS_OUTPUT(type))
> > > +		return &ctx->curr_param.output;
> > > +	else
> > > +		return &ctx->curr_param.captures[0];
> > > +}
> > > +
> > > +static void mdp_m2m_ctx_set_state(struct mdp_m2m_ctx *ctx, u32
> > > state)
> > > +{
> > > +	atomic_or(state, &ctx->curr_param.state);
> > > +}
> > > +
> > > +static bool mdp_m2m_ctx_is_state_set(struct mdp_m2m_ctx *ctx, u32
> > > mask)
> > > +{
> > > +	bool ret;
> > > +
> > > +	ret =3D ((atomic_read(&ctx->curr_param.state) & mask) =3D=3D mask);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static void mdp_m2m_process_done(void *priv, int vb_state)
> > > +{
> > > +	struct mdp_m2m_ctx *ctx =3D priv;
> > > +	struct vb2_v4l2_buffer *src_vbuf, *dst_vbuf;
> > > +
> > > +	src_vbuf =3D (struct vb2_v4l2_buffer *)
> > > +			v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> > > +	dst_vbuf =3D (struct vb2_v4l2_buffer *)
> > > +			v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
> > > +	ctx->curr_param.frame_no =3D ctx->frame_count[MDP_M2M_SRC];
> > > +	src_vbuf->sequence =3D ctx->frame_count[MDP_M2M_SRC]++;
> > > +	dst_vbuf->sequence =3D ctx->frame_count[MDP_M2M_DST]++;
> > > +	v4l2_m2m_buf_copy_metadata(src_vbuf, dst_vbuf, true);
> > > +
> > > +	v4l2_m2m_buf_done(src_vbuf, vb_state);
> > > +	v4l2_m2m_buf_done(dst_vbuf, vb_state);
> > > +	v4l2_m2m_job_finish(ctx->mdp_dev->m2m_dev, ctx->m2m_ctx);
> > > +}
> > > +
> > > +static void mdp_m2m_device_run(void *priv)
> > > +{
> > > +	struct mdp_m2m_ctx *ctx =3D priv;
> > > +	struct mdp_frame *frame;
> > > +	struct vb2_v4l2_buffer *src_vb, *dst_vb;
> > > +	struct img_ipi_frameparam param =3D {0};
> > > +	struct mdp_cmdq_param task =3D {0};
> > > +	enum vb2_buffer_state vb_state =3D VB2_BUF_STATE_ERROR;
> > > +	int ret;
> > > +
> > > +	if (mdp_m2m_ctx_is_state_set(ctx, MDP_M2M_CTX_ERROR)) {
> > > +		dev_err(&ctx->mdp_dev->pdev->dev,
> > > +			"mdp_m2m_ctx is in error state\n");
> > > +		goto worker_end;
> > > +	}
> > > +
> > > +	param.frame_no =3D ctx->curr_param.frame_no;
> > > +	param.type =3D ctx->curr_param.type;
> > > +	param.num_inputs =3D 1;
> > > +	param.num_outputs =3D 1;
> > > +
> > > +	frame =3D ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> > > +	src_vb =3D v4l2_m2m_next_src_buf(ctx->m2m_ctx);
> > > +	mdp_set_src_config(&param.inputs[0], frame, &src_vb->vb2_buf);
> > > +
> > > +	frame =3D ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> > > +	dst_vb =3D v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> > > +	mdp_set_dst_config(&param.outputs[0], frame, &dst_vb->vb2_buf);
> > > +
> > > +	param.timestamp.tv_sec =3D (u32)(src_vb->vb2_buf.timestamp >>
> > > 32);
> > > +	param.timestamp.tv_usec =3D (u32)(src_vb->vb2_buf.timestamp &
> > > 0xFFFFFFFF);
> >=20
> > This does not looks right, but perhaps a workaround ? See
> > v4l2_buffer_set_timestamp() on how that conversion is usually done.
> > Is that a
> > limitation of the firmware API ? In any case, if you serialized 64bit
> > into a
> > timespec I'd rather place a comment here to explain that this is not
> > a mistake
> > but a workaround.
> >=20
>=20
> Yes, it's a limitation of "ISP" API in FW, and maybe we should just
> remove it.

Noted, please add a comment so the readers knows this is intentional, (or r=
emove
it if its not strictly needed, I cannot judge this aspect here).

>=20
> > > +
> > > +	ret =3D mdp_vpu_process(&ctx->vpu, &param);
> > > +	if (ret) {
> > > +		dev_err(&ctx->mdp_dev->pdev->dev,
> > > +			"VPU MDP process failed: %d\n", ret);
> > > +		goto worker_end;
> > > +	}
> > > +
> > > +	task.config =3D ctx->vpu.config;
> > > +	task.param =3D &param;
> > > +	task.composes[0] =3D &frame->compose;
> > > +	task.cmdq_cb =3D NULL;
> > > +	task.cb_data =3D NULL;
> > > +	task.mdp_ctx =3D ctx;
> > > +
> > > +	ret =3D mdp_cmdq_send(ctx->mdp_dev, &task);
> > > +	if (ret) {
> > > +		dev_err(&ctx->mdp_dev->pdev->dev,
> > > +			"CMDQ sendtask failed: %d\n", ret);
> > > +		goto worker_end;
> > > +	}
> > > +
> > > +	return;
> > > +
> > > +worker_end:
> > > +	mdp_m2m_process_done(ctx, vb_state);
> > > +}
> > > +
> > > +static int mdp_m2m_start_streaming(struct vb2_queue *q, unsigned
> > > int count)
> > > +{
> > > +	struct mdp_m2m_ctx *ctx =3D vb2_get_drv_priv(q);
> > > +
> > > +	ctx->frame_count[MDP_M2M_SRC] =3D 0;
> > > +	ctx->frame_count[MDP_M2M_DST] =3D 0;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static struct vb2_v4l2_buffer *mdp_m2m_buf_remove(struct
> > > mdp_m2m_ctx *ctx,
> > > +						  unsigned int type)
> > > +{
> > > +	if (V4L2_TYPE_IS_OUTPUT(type))
> > > +		return (struct vb2_v4l2_buffer *)
> > > +			v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> > > +	else
> > > +		return (struct vb2_v4l2_buffer *)
> > > +			v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
> > > +}
> > > +
> > > +static void mdp_m2m_stop_streaming(struct vb2_queue *q)
> > > +{
> > > +	struct mdp_m2m_ctx *ctx =3D vb2_get_drv_priv(q);
> > > +	struct vb2_v4l2_buffer *vb;
> > > +
> > > +	vb =3D mdp_m2m_buf_remove(ctx, q->type);
> > > +	while (vb) {
> > > +		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
> > > +		vb =3D mdp_m2m_buf_remove(ctx, q->type);
> > > +	}
> > > +}
> > > +
> > > +static int mdp_m2m_queue_setup(struct vb2_queue *q,
> > > +			       unsigned int *num_buffers,
> > > +			       unsigned int *num_planes, unsigned int
> > > sizes[],
> > > +			       struct device *alloc_devs[])
> > > +{
> > > +	struct mdp_m2m_ctx *ctx =3D vb2_get_drv_priv(q);
> > > +	struct v4l2_pix_format_mplane *pix_mp;
> > > +	struct device *dev =3D &ctx->mdp_dev->pdev->dev;
> > > +	u32 i;
> > > +
> > > +	pix_mp =3D &ctx_get_frame(ctx, q->type)->format.fmt.pix_mp;
> > > +
> > > +	/* from VIDIOC_CREATE_BUFS */
> > > +	if (*num_planes) {
> > > +		if (*num_planes !=3D pix_mp->num_planes)
> > > +			return -EINVAL;
> > > +		for (i =3D 0; i < pix_mp->num_planes; ++i)
> > > +			if (sizes[i] < pix_mp->plane_fmt[i].sizeimage)
> > > +				return -EINVAL;
> > > +	} else {/* from VIDIOC_REQBUFS */
> > > +		*num_planes =3D pix_mp->num_planes;
> > > +		for (i =3D 0; i < pix_mp->num_planes; ++i)
> > > +			sizes[i] =3D pix_mp->plane_fmt[i].sizeimage;
> > > +	}
> > > +
> > > +	dev_info(dev, "[%d] type:%d, planes:%u, buffers:%u,
> > > size:%u,%u,%u",
> > > +		 ctx->id, q->type, *num_planes, *num_buffers,
> > > +		 sizes[0], sizes[1], sizes[2]);
> > > +	return 0;
> > > +}
> > > +
> > > +static int mdp_m2m_buf_prepare(struct vb2_buffer *vb)
> > > +{
> > > +	struct mdp_m2m_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> > > +	struct v4l2_pix_format_mplane *pix_mp;
> > > +	struct vb2_v4l2_buffer *v4l2_buf =3D to_vb2_v4l2_buffer(vb);
> > > +	u32 i;
> > > +
> > > +	v4l2_buf->field =3D V4L2_FIELD_NONE;
> > > +
> > > +	if (!V4L2_TYPE_IS_OUTPUT(vb->type)) {
> > > +		pix_mp =3D &ctx_get_frame(ctx, vb->type)-
> > > > format.fmt.pix_mp;
> > > +		for (i =3D 0; i < pix_mp->num_planes; ++i) {
> > > +			vb2_set_plane_payload(vb, i,
> > > +					      pix_mp-
> > > > plane_fmt[i].sizeimage);
> > > +		}
> > > +	}
> > > +	return 0;
> > > +}
> > > +
> > > +static int mdp_m2m_buf_out_validate(struct vb2_buffer *vb)
> > > +{
> > > +	struct vb2_v4l2_buffer *v4l2_buf =3D to_vb2_v4l2_buffer(vb);
> > > +
> > > +	v4l2_buf->field =3D V4L2_FIELD_NONE;
> >=20
> > Could it be more flexible and just copy field from src to dst ? Or do
> > we
> > strictly can't support interlaced buffer ?
> >=20
>=20
> Due to HW limitation, MDP can't handle formats other than progressive.

Noted.

>=20
> > > +
> > > +	return 0;
> > > +}
> > > +
>=20
> [snip]
>=20
> > > diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c
> > > b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c
> > > new file mode 100644
> > > index 000000000000..9adde4b61560
> > > --- /dev/null
> > > +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c
> > > @@ -0,0 +1,736 @@
>=20
> [snip]
>=20
> > > +enum mdp_ycbcr_profile mdp_map_ycbcr_prof_mplane(struct
> > > v4l2_format *f,
> > > +						 u32 mdp_color)
> > > +{
> > > +	struct v4l2_pix_format_mplane *pix_mp =3D &f->fmt.pix_mp;
> > > +
> > > +	if (MDP_COLOR_IS_RGB(mdp_color))
> > > +		return MDP_YCBCR_PROFILE_FULL_BT601;
> > > +
> > > +	switch (pix_mp->colorspace) {
> > > +	case V4L2_COLORSPACE_JPEG:
> > > +		return MDP_YCBCR_PROFILE_JPEG;
> > > +	case V4L2_COLORSPACE_REC709:
> > > +	case V4L2_COLORSPACE_DCI_P3:
> > > +		if (pix_mp->quantization =3D=3D
> > > V4L2_QUANTIZATION_FULL_RANGE)
> > > +			return MDP_YCBCR_PROFILE_FULL_BT709;
> > > +		return MDP_YCBCR_PROFILE_BT709;
> > > +	case V4L2_COLORSPACE_BT2020:
> > > +		if (pix_mp->quantization =3D=3D
> > > V4L2_QUANTIZATION_FULL_RANGE)
> > > +			return MDP_YCBCR_PROFILE_FULL_BT2020;
> > > +		return MDP_YCBCR_PROFILE_BT2020;
> > > +	default:
> > > +		if (pix_mp->quantization =3D=3D
> > > V4L2_QUANTIZATION_FULL_RANGE)
> > > +			return MDP_YCBCR_PROFILE_FULL_BT601;
> > > +		return MDP_YCBCR_PROFILE_BT601;
> > > +	}
> > > +}
> > > +
> > > +static void mdp_bound_align_image(u32 *w, unsigned int wmin,
> > > unsigned int wmax,
> > > +				  unsigned int walign,
> > > +				  u32 *h, unsigned int hmin, unsigned
> > > int hmax,
> > > +				  unsigned int halign, unsigned int
> > > salign)
> > > +{
> > > +	unsigned int org_w, org_h, wstep, hstep;
> > > +
> > > +	org_w =3D *w;
> > > +	org_h =3D *h;
> > > +	v4l_bound_align_image(w, wmin, wmax, walign, h, hmin, hmax,
> > > halign,
> > > +			      salign);
> > > +
> > > +	wstep =3D 1 << walign;
> > > +	hstep =3D 1 << halign;
> > > +	if (*w < org_w && (*w + wstep) <=3D wmax)
> > > +		*w +=3D wstep;
> > > +	if (*h < org_h && (*h + hstep) <=3D hmax)
> > > +		*h +=3D hstep;
> >=20
> > Drivers with "steps" normally uses struct v4l2_frmsize_stepwise with
> > v4l2_apply_frmsize_constraints I think. Perhaps give it a look, its
> > seems fine
> > otherwise.
> >=20
>=20
> Thanks for the suggestion, I'll correct it accordingly.
>=20
> > > +}
> > > +
> > > +static int mdp_clamp_align(s32 *x, int min, int max, unsigned int
> > > align)
> > > +{
> > > +	unsigned int mask;
> > > +
> > > +	if (min < 0 || max < 0)
> > > +		return -ERANGE;
> > > +
> > > +	/* Bits that must be zero to be aligned */
> > > +	mask =3D ~((1 << align) - 1);
> > > +
> > > +	min =3D 0 ? 0 : ((min + ~mask) & mask);
> > > +	max =3D max & mask;
> > > +	if ((unsigned int)min > (unsigned int)max)
> > > +		return -ERANGE;
> > > +
> > > +	/* Clamp to aligned min and max */
> > > +	*x =3D clamp(*x, min, max);
> > > +
> > > +	/* Round to nearest aligned value */
> > > +	if (align)
> > > +		*x =3D (*x + (1 << (align - 1))) & mask;
> > > +	return 0;
> > > +}
> > > +
> > > +int mdp_enum_fmt_mplane(struct v4l2_fmtdesc *f)
> > > +{
> > > +	const struct mdp_format *fmt;
> > > +
> > > +	fmt =3D mdp_find_fmt_by_index(f->index, f->type);
> > > +	if (!fmt)
> > > +		return -EINVAL;
> > > +
> > > +	f->pixelformat =3D fmt->pixelformat;
> > > +	return 0;
> > > +}
> > > +
> > > +const struct mdp_format *mdp_try_fmt_mplane(struct v4l2_format *f,
> > > +					    struct mdp_frameparam
> > > *param,
> > > +					    u32 ctx_id)
> > > +{
> > > +	struct device *dev =3D &param->ctx->mdp_dev->pdev->dev;
> > > +	struct v4l2_pix_format_mplane *pix_mp =3D &f->fmt.pix_mp;
> > > +	const struct mdp_format *fmt;
> > > +	const struct mdp_pix_limit *pix_limit;
> > > +	u32 wmin, wmax, hmin, hmax, org_w, org_h;
> > > +	unsigned int i;
> > > +
> > > +	fmt =3D mdp_find_fmt(pix_mp->pixelformat, f->type);
> > > +	if (!fmt) {
> > > +		fmt =3D mdp_find_fmt_by_index(0, f->type);
> > > +		if (!fmt) {
> > > +			dev_dbg(dev, "%d: pixelformat %c%c%c%c
> > > invalid", ctx_id,
> > > +				(pix_mp->pixelformat & 0xff),
> > > +				(pix_mp->pixelformat >>  8) & 0xff,
> > > +				(pix_mp->pixelformat >> 16) & 0xff,
> > > +				(pix_mp->pixelformat >> 24) & 0xff);
> > > +			return NULL;
> > > +		}
> > > +	}
> > > +
> > > +	pix_mp->field =3D V4L2_FIELD_NONE;
> > > +	pix_mp->flags =3D 0;
> > > +	pix_mp->pixelformat =3D fmt->pixelformat;
> > > +	if (!V4L2_TYPE_IS_OUTPUT(f->type)) {
> > > +		pix_mp->colorspace =3D param->colorspace;
> > > +		pix_mp->xfer_func =3D param->xfer_func;
> > > +		pix_mp->ycbcr_enc =3D param->ycbcr_enc;
> > > +		pix_mp->quantization =3D param->quant;
> > > +	}
> > > +
> > > +	pix_limit =3D V4L2_TYPE_IS_OUTPUT(f->type) ? &param->limit-
> > > > out_limit :
> > > +						&param->limit-
> > > > cap_limit;
> > > +	wmin =3D pix_limit->wmin;
> > > +	wmax =3D pix_limit->wmax;
> > > +	hmin =3D pix_limit->hmin;
> > > +	hmax =3D pix_limit->hmax;
> > > +	org_w =3D pix_mp->width;
> > > +	org_h =3D pix_mp->height;
> > > +
> > > +	mdp_bound_align_image(&pix_mp->width, wmin, wmax, fmt->walign,
> > > +			      &pix_mp->height, hmin, hmax, fmt->halign,
> > > +			      fmt->salign);
> > > +	if (org_w !=3D pix_mp->width || org_h !=3D pix_mp->height)
> > > +		dev_dbg(dev, "%d: size change: %ux%u to %ux%u", ctx_id,
> > > +			org_w, org_h, pix_mp->width, pix_mp->height);
> > > +
> > > +	if (pix_mp->num_planes && pix_mp->num_planes !=3D fmt-
> > > > num_planes)
> > > +		dev_dbg(dev, "%d num of planes change: %u to %u",
> > > ctx_id,
> > > +			pix_mp->num_planes, fmt->num_planes);
> > > +	pix_mp->num_planes =3D fmt->num_planes;
> > > +
> > > +	for (i =3D 0; i < pix_mp->num_planes; ++i) {
> > > +		u32 min_bpl =3D (pix_mp->width * fmt->row_depth[i]) / 8;
> > > +		u32 bpl =3D pix_mp->plane_fmt[i].bytesperline;
> > > +		u32 si;
> > > +
> > > +		if (bpl < min_bpl)
> > > +			bpl =3D min_bpl;
> >=20
> > I see that you will accept user provided bytesperline if large
> > enough, but I
> > failed to find a place you validate the alignment of the provided
> > bytesperline.
> > Did you forget to validate it ?
> >=20
>=20
> Indeed, It's a little confusing.
> Maybe the result calculated by the formula should be used directly
> instead of referring to the user's settings?

That is one option, but if I remember correctly, application provided strid=
es
(bytesperline) is a usercase that came from ChromeOS, so removing it will b=
reak
something there.

I'd like to highlight the danger of user provided strides (byteperline) her=
e,
which hopefully will be useful to other devs. This is for me hot topic, as
similar vulnerability have been address in GStreamer (a project into which =
I'm
one of the maintainer). Over a handful of cases was found were a user provi=
ded
size was used to calculate an alloation size (just like here).

What happens is that u32 can wrap around. So Malicious user could potential=
ly
find a large enough value of bytesperline / height pair that will overflow.=
 The
consequence is that a very small buffer is allocate, which is enough to get=
 the
driver to overflow its buffer. The overflow might not be exploitable, but t=
his
kind of issue is often the root of a potential exploit.

In short, on top of validating the alignment, there is some size check need=
ed to
ensure that the following allocation size calculation won't overflow.

kind regards,
Nicolas

>=20
> Thanks,
> Moudy
>=20
> > > +		si =3D (bpl * pix_mp->height * fmt->depth[i]) / fmt-
> > > > row_depth[i];
> > > +
> > > +		pix_mp->plane_fmt[i].bytesperline =3D bpl;
> > > +		if (pix_mp->plane_fmt[i].sizeimage < si)
> > > +			pix_mp->plane_fmt[i].sizeimage =3D si;
> > > +		dev_dbg(dev, "%d: p%u, bpl:%u (%u), sizeimage:%u (%u)",
> > > ctx_id,
> > > +			i, bpl, min_bpl, pix_mp-
> > > > plane_fmt[i].sizeimage, si);
> > > +	}
> > > +
> > > +	return fmt;
> > > +}
> > > +
> > > +static int mdp_clamp_start(s32 *x, int min, int max, unsigned int
> > > align,
> > > +			   u32 flags)
> > > +{
> > > +	if (flags & V4L2_SEL_FLAG_GE)
> > > +		max =3D *x;
> > > +	if (flags & V4L2_SEL_FLAG_LE)
> > > +		min =3D *x;
> > > +	return mdp_clamp_align(x, min, max, align);
> > > +}
> > > +
> > > +static int mdp_clamp_end(s32 *x, int min, int max, unsigned int
> > > align,
> > > +			 u32 flags)
> > > +{
> > > +	if (flags & V4L2_SEL_FLAG_GE)
> > > +		min =3D *x;
> > > +	if (flags & V4L2_SEL_FLAG_LE)
> > > +		max =3D *x;
> > > +	return mdp_clamp_align(x, min, max, align);
> > > +}
> > > +
> > > +int mdp_try_crop(struct mdp_m2m_ctx *ctx, struct v4l2_rect *r,
> > > +		 const struct v4l2_selection *s, struct mdp_frame
> > > *frame)
> > > +{
> > > +	struct device *dev =3D &ctx->mdp_dev->pdev->dev;
> > > +	s32 left, top, right, bottom;
> > > +	u32 framew, frameh, walign, halign;
> > > +	int ret;
> > > +
> > > +	dev_dbg(dev, "%d target:%d, set:(%d,%d) %ux%u", ctx->id,
> > > +		s->target, s->r.left, s->r.top, s->r.width, s-
> > > > r.height);
> > > +
> > > +	left =3D s->r.left;
> > > +	top =3D s->r.top;
> > > +	right =3D s->r.left + s->r.width;
> > > +	bottom =3D s->r.top + s->r.height;
> > > +	framew =3D frame->format.fmt.pix_mp.width;
> > > +	frameh =3D frame->format.fmt.pix_mp.height;
> > > +
> > > +	if (mdp_target_is_crop(s->target)) {
> > > +		walign =3D 1;
> > > +		halign =3D 1;
> > > +	} else {
> > > +		walign =3D frame->mdp_fmt->walign;
> > > +		halign =3D frame->mdp_fmt->halign;
> > > +	}
> > > +
> > > +	dev_dbg(dev, "%d align:%u,%u, bound:%ux%u", ctx->id,
> > > +		walign, halign, framew, frameh);
> > > +
> > > +	ret =3D mdp_clamp_start(&left, 0, right, walign, s->flags);
> > > +	if (ret)
> > > +		return ret;
> > > +	ret =3D mdp_clamp_start(&top, 0, bottom, halign, s->flags);
> > > +	if (ret)
> > > +		return ret;
> > > +	ret =3D mdp_clamp_end(&right, left, framew, walign, s->flags);
> > > +	if (ret)
> > > +		return ret;
> > > +	ret =3D mdp_clamp_end(&bottom, top, frameh, halign, s->flags);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	r->left =3D left;
> > > +	r->top =3D top;
> > > +	r->width =3D right - left;
> > > +	r->height =3D bottom - top;
> > > +
> > > +	dev_dbg(dev, "%d crop:(%d,%d) %ux%u", ctx->id,
> > > +		r->left, r->top, r->width, r->height);
> > > +	return 0;
> > > +}
> > > +
> > > +int mdp_check_scaling_ratio(const struct v4l2_rect *crop,
> > > +			    const struct v4l2_rect *compose, s32
> > > rotation,
> > > +	const struct mdp_limit *limit)
> > > +{
> > > +	u32 crop_w, crop_h, comp_w, comp_h;
> > > +
> > > +	crop_w =3D crop->width;
> > > +	crop_h =3D crop->height;
> > > +	if (90 =3D=3D rotation || 270 =3D=3D rotation) {
> > > +		comp_w =3D compose->height;
> > > +		comp_h =3D compose->width;
> > > +	} else {
> > > +		comp_w =3D compose->width;
> > > +		comp_h =3D compose->height;
> > > +	}
> > > +
> > > +	if ((crop_w / comp_w) > limit->h_scale_down_max ||
> > > +	    (crop_h / comp_h) > limit->v_scale_down_max ||
> > > +	    (comp_w / crop_w) > limit->h_scale_up_max ||
> > > +	    (comp_h / crop_h) > limit->v_scale_up_max)
> > > +		return -ERANGE;
> > > +	return 0;
> > > +}
> > > +
> > > +/* Stride that is accepted by MDP HW */
> > > +static u32 mdp_fmt_get_stride(const struct mdp_format *fmt,
> > > +			      u32 bytesperline, unsigned int plane)
> > > +{
> > > +	enum mdp_color c =3D fmt->mdp_color;
> > > +	u32 stride;
> > > +
> > > +	stride =3D (bytesperline * MDP_COLOR_BITS_PER_PIXEL(c))
> > > +		/ fmt->row_depth[0];
> > > +	if (plane =3D=3D 0)
> > > +		return stride;
> > > +	if (plane < MDP_COLOR_GET_PLANE_COUNT(c)) {
> > > +		if (MDP_COLOR_IS_BLOCK_MODE(c))
> > > +			stride =3D stride / 2;
> > > +		return stride;
> > > +	}
> > > +	return 0;
> > > +}
> > > +
> > > +/* Stride that is accepted by MDP HW of format with contiguous
> > > planes */
> > > +static u32 mdp_fmt_get_stride_contig(const struct mdp_format *fmt,
> > > +				     u32 pix_stride, unsigned int
> > > plane)
> > > +{
> > > +	enum mdp_color c =3D fmt->mdp_color;
> > > +	u32 stride =3D pix_stride;
> > > +
> > > +	if (plane =3D=3D 0)
> > > +		return stride;
> > > +	if (plane < MDP_COLOR_GET_PLANE_COUNT(c)) {
> > > +		stride =3D stride >> MDP_COLOR_GET_H_SUBSAMPLE(c);
> > > +		if (MDP_COLOR_IS_UV_COPLANE(c) &&
> > > !MDP_COLOR_IS_BLOCK_MODE(c))
> > > +			stride =3D stride * 2;
> > > +		return stride;
> > > +	}
> > > +	return 0;
> > > +}
> > > +
> > > +/* Plane size that is accepted by MDP HW */
> > > +static u32 mdp_fmt_get_plane_size(const struct mdp_format *fmt,
> > > +				  u32 stride, u32 height, unsigned int
> > > plane)
> > > +{
> > > +	enum mdp_color c =3D fmt->mdp_color;
> > > +	u32 bytesperline;
> > > +
> > > +	bytesperline =3D (stride * fmt->row_depth[0])
> > > +		/ MDP_COLOR_BITS_PER_PIXEL(c);
> > > +	if (plane =3D=3D 0)
> > > +		return bytesperline * height;
> > > +	if (plane < MDP_COLOR_GET_PLANE_COUNT(c)) {
> > > +		height =3D height >> MDP_COLOR_GET_V_SUBSAMPLE(c);
> > > +		if (MDP_COLOR_IS_BLOCK_MODE(c))
> > > +			bytesperline =3D bytesperline * 2;
> > > +		return bytesperline * height;
> > > +	}
> > > +	return 0;
> > > +}
> > > +
> > > +static void mdp_prepare_buffer(struct img_image_buffer *b,
> > > +			       struct mdp_frame *frame, struct
> > > vb2_buffer *vb)
> > > +{
> > > +	struct v4l2_pix_format_mplane *pix_mp =3D &frame-
> > > > format.fmt.pix_mp;
> > > +	unsigned int i;
> > > +
> > > +	b->format.colorformat =3D frame->mdp_fmt->mdp_color;
> > > +	b->format.ycbcr_prof =3D frame->ycbcr_prof;
> > > +	for (i =3D 0; i < pix_mp->num_planes; ++i) {
> > > +		u32 stride =3D mdp_fmt_get_stride(frame->mdp_fmt,
> > > +			pix_mp->plane_fmt[i].bytesperline, i);
> > > +
> > > +		b->format.plane_fmt[i].stride =3D stride;
> > > +		/*
> > > +		 * TODO : The way to pass an offset within a DMA-buf
> > > +		 * is not defined in V4L2 specification, so we abuse
> > > +		 * data_offset for now. Fix it when we have the right
> > > interface,
> > > +		 * including any necessary validation and potential
> > > alignment
> > > +		 * issues.
> > > +		 */
> > > +		b->format.plane_fmt[i].size =3D
> > > +			mdp_fmt_get_plane_size(frame->mdp_fmt, stride,
> > > +					       pix_mp->height, i) -
> > > +					       vb-
> > > > planes[i].data_offset;
> > > +		b->iova[i] =3D vb2_dma_contig_plane_dma_addr(vb, i) +
> > > +			     vb->planes[i].data_offset;
> > > +	}
> > > +	for (; i < MDP_COLOR_GET_PLANE_COUNT(b->format.colorformat);
> > > ++i) {
> > > +		u32 stride =3D mdp_fmt_get_stride_contig(frame->mdp_fmt,
> > > +			b->format.plane_fmt[0].stride, i);
> > > +
> > > +		b->format.plane_fmt[i].stride =3D stride;
> > > +		b->format.plane_fmt[i].size =3D
> > > +			mdp_fmt_get_plane_size(frame->mdp_fmt, stride,
> > > +					       pix_mp->height, i);
> > > +		b->iova[i] =3D b->iova[i - 1] + b->format.plane_fmt[i -
> > > 1].size;
> > > +	}
> > > +	b->usage =3D frame->usage;
> > > +}
> > > +
> > > +void mdp_set_src_config(struct img_input *in,
> > > +			struct mdp_frame *frame, struct vb2_buffer *vb)
> > > +{
> > > +	in->buffer.format.width =3D frame->format.fmt.pix_mp.width;
> > > +	in->buffer.format.height =3D frame->format.fmt.pix_mp.height;
> > > +	mdp_prepare_buffer(&in->buffer, frame, vb);
> > > +}
> > > +
> > > +static u32 mdp_to_fixed(u32 *r, struct v4l2_fract *f)
> > > +{
> > > +	u32 q;
> > > +
> > > +	if (f->denominator =3D=3D 0) {
> > > +		*r =3D 0;
> > > +		return 0;
> > > +	}
> > > +
> > > +	q =3D f->numerator / f->denominator;
> > > +	*r =3D div_u64(((u64)f->numerator - q * f->denominator) <<
> > > +		     IMG_SUBPIXEL_SHIFT, f->denominator);
> > > +	return q;
> > > +}
> > > +
> > > +static void mdp_set_src_crop(struct img_crop *c, struct mdp_crop
> > > *crop)
> > > +{
> > > +	c->left =3D crop->c.left
> > > +		+ mdp_to_fixed(&c->left_subpix, &crop->left_subpix);
> > > +	c->top =3D crop->c.top
> > > +		+ mdp_to_fixed(&c->top_subpix, &crop->top_subpix);
> > > +	c->width =3D crop->c.width
> > > +		+ mdp_to_fixed(&c->width_subpix, &crop->width_subpix);
> > > +	c->height =3D crop->c.height
> > > +		+ mdp_to_fixed(&c->height_subpix, &crop-
> > > > height_subpix);
> > > +}
> > > +
> > > +static void mdp_set_orientation(struct img_output *out,
> > > +				s32 rotation, bool hflip, bool vflip)
> > > +{
> > > +	u8 flip =3D 0;
> > > +
> > > +	if (hflip)
> > > +		flip ^=3D 1;
> > > +	if (vflip) {
> > > +		/*
> > > +		 * A vertical flip is equivalent to
> > > +		 * a 180-degree rotation with a horizontal flip
> > > +		 */
> > > +		rotation +=3D 180;
> > > +		flip ^=3D 1;
> > > +	}
> > > +
> > > +	out->rotation =3D rotation % 360;
> > > +	if (flip !=3D 0)
> > > +		out->flags |=3D IMG_CTRL_FLAG_HFLIP;
> > > +	else
> > > +		out->flags &=3D ~IMG_CTRL_FLAG_HFLIP;
> > > +}
> > > +
> > > +void mdp_set_dst_config(struct img_output *out,
> > > +			struct mdp_frame *frame, struct vb2_buffer *vb)
> > > +{
> > > +	out->buffer.format.width =3D frame->compose.width;
> > > +	out->buffer.format.height =3D frame->compose.height;
> > > +	mdp_prepare_buffer(&out->buffer, frame, vb);
> > > +	mdp_set_src_crop(&out->crop, &frame->crop);
> > > +	mdp_set_orientation(out, frame->rotation, frame->hflip, frame-
> > > > vflip);
> > > +}
> > > +
> > > +int mdp_frameparam_init(struct mdp_frameparam *param)
> > > +{
> > > +	struct mdp_frame *frame;
> > > +
> > > +	if (!param)
> > > +		return -EINVAL;
> > > +
> > > +	INIT_LIST_HEAD(&param->list);
> > > +	param->limit =3D &mdp_def_limit;
> > > +	param->type =3D MDP_STREAM_TYPE_BITBLT;
> > > +
> > > +	frame =3D &param->output;
> > > +	frame->format.type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> > > +	frame->mdp_fmt =3D mdp_try_fmt_mplane(&frame->format, param, 0);
> > > +	frame->ycbcr_prof =3D
> > > +		mdp_map_ycbcr_prof_mplane(&frame->format,
> > > +					  frame->mdp_fmt->mdp_color);
> > > +	frame->usage =3D MDP_BUFFER_USAGE_HW_READ;
> > > +
> > > +	param->num_captures =3D 1;
> > > +	frame =3D &param->captures[0];
> > > +	frame->format.type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> > > +	frame->mdp_fmt =3D mdp_try_fmt_mplane(&frame->format, param, 0);
> > > +	frame->ycbcr_prof =3D
> > > +		mdp_map_ycbcr_prof_mplane(&frame->format,
> > > +					  frame->mdp_fmt->mdp_color);
> > > +	frame->usage =3D MDP_BUFFER_USAGE_MDP;
> > > +	frame->crop.c.width =3D param->output.format.fmt.pix_mp.width;
> > > +	frame->crop.c.height =3D param->output.format.fmt.pix_mp.height;
> > > +	frame->compose.width =3D frame->format.fmt.pix_mp.width;
> > > +	frame->compose.height =3D frame->format.fmt.pix_mp.height;
> > > +
> > > +	return 0;
> > > +}
> > > diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.h
> > > b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.h
> > > new file mode 100644
> > > index 000000000000..88f8b760f613
> > > --- /dev/null
> > > +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.h
> > > @@ -0,0 +1,370 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +/*
> > > + * Copyright (c) 2021 MediaTek Inc.
> > > + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> > > + */
> > > +
> > > +#ifndef __MTK_MDP3_REGS_H__
> > > +#define __MTK_MDP3_REGS_H__
> > > +
> > > +#include <linux/videodev2.h>
> > > +#include <media/videobuf2-core.h>
> > > +#include "mtk-img-ipi.h"
> > > +
> > > +/*
> > > + * MDP native color code
> > > + * Plane count: 1, 2, 3
> > > + * H-subsample: 0, 1, 2
> > > + * V-subsample: 0, 1
> > > + * Color group: 0-RGB, 1-YUV, 2-raw
> > > + */
> > > +#define MDP_COLOR(PACKED, LOOSE, VIDEO, PLANE, HF, VF, BITS,
> > > GROUP, SWAP, ID)\
> > > +	(((PACKED) << 27) | ((LOOSE) << 26) | ((VIDEO) << 23) |\
> > > +	 ((PLANE) << 21) | ((HF) << 19) | ((VF) << 18) | ((BITS) << 8)
> > > > \
> > > +	 ((GROUP) << 6) | ((SWAP) << 5) | ((ID) << 0))
> > > +
> > > +#define MDP_COLOR_IS_10BIT_PACKED(c)	((0x08000000 & (c)) >>
> > > 27)
> > > +#define MDP_COLOR_IS_10BIT_LOOSE(c)	(((0x0c000000 & (c)) >>
> > > 26) =3D=3D 1)
> > > +#define MDP_COLOR_IS_10BIT_TILE(c)	(((0x0c000000 & (c)) >> 26) =3D=
=3D
> > > 3)
> > > +#define MDP_COLOR_IS_UFP(c)		((0x02000000 & (c)) >>
> > > 25)
> > > +#define MDP_COLOR_IS_INTERLACED(c)	((0x01000000 & (c)) >> 24)
> > > +#define MDP_COLOR_IS_BLOCK_MODE(c)	((0x00800000 & (c)) >> 23)
> > > +#define MDP_COLOR_GET_PLANE_COUNT(c)	((0x00600000 & (c)) >>
> > > 21)
> > > +#define MDP_COLOR_GET_H_SUBSAMPLE(c)	((0x00180000 & (c)) >>
> > > 19)
> > > +#define MDP_COLOR_GET_V_SUBSAMPLE(c)	((0x00040000 & (c)) >>
> > > 18)
> > > +#define MDP_COLOR_BITS_PER_PIXEL(c)	((0x0003ff00 & (c))
> > > > >  8)
> > > +#define MDP_COLOR_GET_GROUP(c)		((0x000000c0 & (c))
> > > > >  6)
> > > +#define MDP_COLOR_IS_SWAPPED(c)		((0x00000020 & (c))
> > > > >  5)
> > > +#define MDP_COLOR_GET_UNIQUE_ID(c)	((0x0000001f & (c)) >>  0)
> > > +#define MDP_COLOR_GET_HW_FORMAT(c)	((0x0000001f & (c)) >>  0)
> > > +
> > > +#define MDP_COLOR_IS_RGB(c)		(MDP_COLOR_GET_GROUP(c)
> > > =3D=3D 0)
> > > +#define MDP_COLOR_IS_YUV(c)		(MDP_COLOR_GET_GROUP(c)
> > > =3D=3D 1)
> > > +#define MDP_COLOR_IS_UV_COPLANE(c)	((MDP_COLOR_GET_PLANE_COUNT(c)
> > > =3D=3D 2) &&\
> > > +					 MDP_COLOR_IS_YUV(c))
> > > +
> > > +enum mdp_color {
> > > +	MDP_COLOR_UNKNOWN	=3D 0,
> > > +
> > > +	//MDP_COLOR_FULLG8,
> > > +	MDP_COLOR_FULLG8_RGGB	=3D MDP_COLOR(0, 0, 0, 1, 0, 0,  8,
> > > 2,  0, 21),
> > > +	MDP_COLOR_FULLG8_GRBG	=3D MDP_COLOR(0, 0, 0, 1, 0, 1,  8,
> > > 2,  0, 21),
> > > +	MDP_COLOR_FULLG8_GBRG	=3D MDP_COLOR(0, 0, 0, 1, 1, 0,  8,
> > > 2,  0, 21),
> > > +	MDP_COLOR_FULLG8_BGGR	=3D MDP_COLOR(0, 0, 0, 1, 1, 1,  8,
> > > 2,  0, 21),
> > > +	MDP_COLOR_FULLG8	=3D MDP_COLOR_FULLG8_BGGR,
> > > +
> > > +	//MDP_COLOR_FULLG10,
> > > +	MDP_COLOR_FULLG10_RGGB	=3D MDP_COLOR(0, 0, 0, 1, 0, 0, 10,
> > > 2,  0, 21),
> > > +	MDP_COLOR_FULLG10_GRBG	=3D MDP_COLOR(0, 0, 0, 1, 0, 1, 10,
> > > 2,  0, 21),
> > > +	MDP_COLOR_FULLG10_GBRG	=3D MDP_COLOR(0, 0, 0, 1, 1, 0, 10,
> > > 2,  0, 21),
> > > +	MDP_COLOR_FULLG10_BGGR	=3D MDP_COLOR(0, 0, 0, 1, 1, 1, 10,
> > > 2,  0, 21),
> > > +	MDP_COLOR_FULLG10	=3D MDP_COLOR_FULLG10_BGGR,
> > > +
> > > +	//MDP_COLOR_FULLG12,
> > > +	MDP_COLOR_FULLG12_RGGB	=3D MDP_COLOR(0, 0, 0, 1, 0, 0, 12,
> > > 2,  0, 21),
> > > +	MDP_COLOR_FULLG12_GRBG	=3D MDP_COLOR(0, 0, 0, 1, 0, 1, 12,
> > > 2,  0, 21),
> > > +	MDP_COLOR_FULLG12_GBRG	=3D MDP_COLOR(0, 0, 0, 1, 1, 0, 12,
> > > 2,  0, 21),
> > > +	MDP_COLOR_FULLG12_BGGR	=3D MDP_COLOR(0, 0, 0, 1, 1, 1, 12,
> > > 2,  0, 21),
> > > +	MDP_COLOR_FULLG12	=3D MDP_COLOR_FULLG12_BGGR,
> > > +
> > > +	//MDP_COLOR_FULLG14,
> > > +	MDP_COLOR_FULLG14_RGGB	=3D MDP_COLOR(0, 0, 0, 1, 0, 0, 14,
> > > 2,  0, 21),
> > > +	MDP_COLOR_FULLG14_GRBG	=3D MDP_COLOR(0, 0, 0, 1, 0, 1, 14,
> > > 2,  0, 21),
> > > +	MDP_COLOR_FULLG14_GBRG	=3D MDP_COLOR(0, 0, 0, 1, 1, 0, 14,
> > > 2,  0, 21),
> > > +	MDP_COLOR_FULLG14_BGGR	=3D MDP_COLOR(0, 0, 0, 1, 1, 1, 14,
> > > 2,  0, 21),
> > > +	MDP_COLOR_FULLG14	=3D MDP_COLOR_FULLG14_BGGR,
> > > +
> > > +	MDP_COLOR_UFO10		=3D MDP_COLOR(0, 0, 0, 1, 0, 0, 10,
> > > 2,  0, 24),
> > > +
> > > +	//MDP_COLOR_BAYER8,
> > > +	MDP_COLOR_BAYER8_RGGB	=3D MDP_COLOR(0, 0, 0, 1, 0, 0,  8,
> > > 2,  0, 20),
> > > +	MDP_COLOR_BAYER8_GRBG	=3D MDP_COLOR(0, 0, 0, 1, 0, 1,  8,
> > > 2,  0, 20),
> > > +	MDP_COLOR_BAYER8_GBRG	=3D MDP_COLOR(0, 0, 0, 1, 1, 0,  8,
> > > 2,  0, 20),
> > > +	MDP_COLOR_BAYER8_BGGR	=3D MDP_COLOR(0, 0, 0, 1, 1, 1,  8,
> > > 2,  0, 20),
> > > +	MDP_COLOR_BAYER8	=3D MDP_COLOR_BAYER8_BGGR,
> > > +
> > > +	//MDP_COLOR_BAYER10,
> > > +	MDP_COLOR_BAYER10_RGGB	=3D MDP_COLOR(0, 0, 0, 1, 0, 0, 10,
> > > 2,  0, 20),
> > > +	MDP_COLOR_BAYER10_GRBG	=3D MDP_COLOR(0, 0, 0, 1, 0, 1, 10,
> > > 2,  0, 20),
> > > +	MDP_COLOR_BAYER10_GBRG	=3D MDP_COLOR(0, 0, 0, 1, 1, 0, 10,
> > > 2,  0, 20),
> > > +	MDP_COLOR_BAYER10_BGGR	=3D MDP_COLOR(0, 0, 0, 1, 1, 1, 10,
> > > 2,  0, 20),
> > > +	MDP_COLOR_BAYER10	=3D MDP_COLOR_BAYER10_BGGR,
> > > +
> > > +	//MDP_COLOR_BAYER12,
> > > +	MDP_COLOR_BAYER12_RGGB	=3D MDP_COLOR(0, 0, 0, 1, 0, 0, 12,
> > > 2,  0, 20),
> > > +	MDP_COLOR_BAYER12_GRBG	=3D MDP_COLOR(0, 0, 0, 1, 0, 1, 12,
> > > 2,  0, 20),
> > > +	MDP_COLOR_BAYER12_GBRG	=3D MDP_COLOR(0, 0, 0, 1, 1, 0, 12,
> > > 2,  0, 20),
> > > +	MDP_COLOR_BAYER12_BGGR	=3D MDP_COLOR(0, 0, 0, 1, 1, 1, 12,
> > > 2,  0, 20),
> > > +	MDP_COLOR_BAYER12	=3D MDP_COLOR_BAYER12_BGGR,
> > > +
> > > +	//MDP_COLOR_BAYER14,
> > > +	MDP_COLOR_BAYER14_RGGB	=3D MDP_COLOR(0, 0, 0, 1, 0, 0, 14,
> > > 2,  0, 20),
> > > +	MDP_COLOR_BAYER14_GRBG	=3D MDP_COLOR(0, 0, 0, 1, 0, 1, 14,
> > > 2,  0, 20),
> > > +	MDP_COLOR_BAYER14_GBRG	=3D MDP_COLOR(0, 0, 0, 1, 1, 0, 14,
> > > 2,  0, 20),
> > > +	MDP_COLOR_BAYER14_BGGR	=3D MDP_COLOR(0, 0, 0, 1, 1, 1, 14,
> > > 2,  0, 20),
> > > +	MDP_COLOR_BAYER14	=3D MDP_COLOR_BAYER14_BGGR,
> > > +
> > > +	MDP_COLOR_RGB48		=3D MDP_COLOR(0, 0, 0, 1, 0, 0, 48,
> > > 0,  0, 23),
> > > +	/* For bayer+mono raw-16 */
> > > +	MDP_COLOR_RGB565_RAW	=3D MDP_COLOR(0, 0, 0, 1, 0, 0, 16,
> > > 2,  0, 0),
> > > +
> > > +	MDP_COLOR_BAYER8_UNPAK	=3D MDP_COLOR(0, 0, 0, 1, 0, 0,  8,
> > > 2,  0, 22),
> > > +	MDP_COLOR_BAYER10_UNPAK	=3D MDP_COLOR(0, 0, 0, 1, 0, 0, 10,
> > > 2,  0, 22),
> > > +	MDP_COLOR_BAYER12_UNPAK	=3D MDP_COLOR(0, 0, 0, 1, 0, 0, 12,
> > > 2,  0, 22),
> > > +	MDP_COLOR_BAYER14_UNPAK	=3D MDP_COLOR(0, 0, 0, 1, 0, 0, 14,
> > > 2,  0, 22),
> > > +
> > > +	/* Unified formats */
> > > +	MDP_COLOR_GREY		=3D MDP_COLOR(0, 0, 0, 1, 0, 0,  8,
> > > 1,  0, 7),
> > > +
> > > +	MDP_COLOR_RGB565	=3D MDP_COLOR(0, 0, 0, 1, 0, 0, 16, 0,  0,
> > > 0),
> > > +	MDP_COLOR_BGR565	=3D MDP_COLOR(0, 0, 0, 1, 0, 0, 16, 0,  1,
> > > 0),
> > > +	MDP_COLOR_RGB888	=3D MDP_COLOR(0, 0, 0, 1, 0, 0, 24, 0,  1,
> > > 1),
> > > +	MDP_COLOR_BGR888	=3D MDP_COLOR(0, 0, 0, 1, 0, 0, 24, 0,  0,
> > > 1),
> > > +	MDP_COLOR_RGBA8888	=3D MDP_COLOR(0, 0, 0, 1, 0, 0, 32, 0,  1,
> > > 2),
> > > +	MDP_COLOR_BGRA8888	=3D MDP_COLOR(0, 0, 0, 1, 0, 0, 32, 0,  0,
> > > 2),
> > > +	MDP_COLOR_ARGB8888	=3D MDP_COLOR(0, 0, 0, 1, 0, 0, 32, 0,  1,
> > > 3),
> > > +	MDP_COLOR_ABGR8888	=3D MDP_COLOR(0, 0, 0, 1, 0, 0, 32, 0,  0,
> > > 3),
> > > +
> > > +	MDP_COLOR_UYVY		=3D MDP_COLOR(0, 0, 0, 1, 1, 0, 16,
> > > 1,  0, 4),
> > > +	MDP_COLOR_VYUY		=3D MDP_COLOR(0, 0, 0, 1, 1, 0, 16,
> > > 1,  1, 4),
> > > +	MDP_COLOR_YUYV		=3D MDP_COLOR(0, 0, 0, 1, 1, 0, 16,
> > > 1,  0, 5),
> > > +	MDP_COLOR_YVYU		=3D MDP_COLOR(0, 0, 0, 1, 1, 0, 16,
> > > 1,  1, 5),
> > > +
> > > +	MDP_COLOR_I420		=3D MDP_COLOR(0, 0, 0, 3, 1, 1,  8,
> > > 1,  0, 8),
> > > +	MDP_COLOR_YV12		=3D MDP_COLOR(0, 0, 0, 3, 1, 1,  8,
> > > 1,  1, 8),
> > > +	MDP_COLOR_I422		=3D MDP_COLOR(0, 0, 0, 3, 1, 0,  8,
> > > 1,  0, 9),
> > > +	MDP_COLOR_YV16		=3D MDP_COLOR(0, 0, 0, 3, 1, 0,  8,
> > > 1,  1, 9),
> > > +	MDP_COLOR_I444		=3D MDP_COLOR(0, 0, 0, 3, 0, 0,  8,
> > > 1,  0, 10),
> > > +	MDP_COLOR_YV24		=3D MDP_COLOR(0, 0, 0, 3, 0, 0,  8,
> > > 1,  1, 10),
> > > +
> > > +	MDP_COLOR_NV12		=3D MDP_COLOR(0, 0, 0, 2, 1, 1,  8,
> > > 1,  0, 12),
> > > +	MDP_COLOR_NV21		=3D MDP_COLOR(0, 0, 0, 2, 1, 1,  8,
> > > 1,  1, 12),
> > > +	MDP_COLOR_NV16		=3D MDP_COLOR(0, 0, 0, 2, 1, 0,  8,
> > > 1,  0, 13),
> > > +	MDP_COLOR_NV61		=3D MDP_COLOR(0, 0, 0, 2, 1, 0,  8,
> > > 1,  1, 13),
> > > +	MDP_COLOR_NV24		=3D MDP_COLOR(0, 0, 0, 2, 0, 0,  8,
> > > 1,  0, 14),
> > > +	MDP_COLOR_NV42		=3D MDP_COLOR(0, 0, 0, 2, 0, 0,  8,
> > > 1,  1, 14),
> > > +
> > > +	/* Mediatek proprietary formats */
> > > +	/* UFO encoded block mode */
> > > +	MDP_COLOR_420_BLK_UFO	=3D MDP_COLOR(0, 0, 5, 2, 1, 1, 256,
> > > 1, 0, 12),
> > > +	/* Block mode */
> > > +	MDP_COLOR_420_BLK	=3D MDP_COLOR(0, 0, 1, 2, 1, 1, 256, 1, 0,
> > > 12),
> > > +	/* Block mode + field mode */
> > > +	MDP_COLOR_420_BLKI	=3D MDP_COLOR(0, 0, 3, 2, 1, 1, 256, 1, 0,
> > > 12),
> > > +	/* Block mode */
> > > +	MDP_COLOR_422_BLK	=3D MDP_COLOR(0, 0, 1, 1, 1, 0, 512, 1, 0,
> > > 4),
> > > +
> > > +	MDP_COLOR_IYU2		=3D MDP_COLOR(0, 0, 0, 1, 0, 0,
> > > 24,  1, 0, 25),
> > > +	MDP_COLOR_YUV444	=3D MDP_COLOR(0, 0, 0, 1, 0, 0, 24,  1, 0,
> > > 30),
> > > +
> > > +	/* Packed 10-bit formats */
> > > +	MDP_COLOR_RGBA1010102	=3D MDP_COLOR(1, 0, 0, 1, 0, 0,
> > > 32,  0, 1, 2),
> > > +	MDP_COLOR_BGRA1010102	=3D MDP_COLOR(1, 0, 0, 1, 0, 0,
> > > 32,  0, 0, 2),
> > > +	/* Packed 10-bit UYVY */
> > > +	MDP_COLOR_UYVY_10P	=3D MDP_COLOR(1, 0, 0, 1, 1, 0, 20,  1, 0,
> > > 4),
> > > +	/* Packed 10-bit NV21 */
> > > +	MDP_COLOR_NV21_10P	=3D MDP_COLOR(1, 0, 0, 2, 1, 1, 10,  1, 1,
> > > 12),
> > > +	/* 10-bit block mode */
> > > +	MDP_COLOR_420_BLK_10_H	=3D MDP_COLOR(1, 0, 1, 2, 1, 1, 320,
> > > 1, 0, 12),
> > > +	/* 10-bit HEVC tile mode */
> > > +	MDP_COLOR_420_BLK_10_V	=3D MDP_COLOR(1, 1, 1, 2, 1, 1, 320,
> > > 1, 0, 12),
> > > +	/* UFO encoded 10-bit block mode */
> > > +	MDP_COLOR_420_BLK_U10_H	=3D MDP_COLOR(1, 0, 5, 2, 1, 1, 320,
> > > 1, 0, 12),
> > > +	/* UFO encoded 10-bit HEVC tile mode */
> > > +	MDP_COLOR_420_BLK_U10_V	=3D MDP_COLOR(1, 1, 5, 2, 1, 1, 320,
> > > 1, 0, 12),
> > > +
> > > +	/* Loose 10-bit formats */
> > > +	MDP_COLOR_UYVY_10L	=3D MDP_COLOR(0, 1, 0, 1, 1, 0, 20,  1, 0,
> > > 4),
> > > +	MDP_COLOR_VYUY_10L	=3D MDP_COLOR(0, 1, 0, 1, 1, 0, 20,  1, 1,
> > > 4),
> > > +	MDP_COLOR_YUYV_10L	=3D MDP_COLOR(0, 1, 0, 1, 1, 0, 20,  1, 0,
> > > 5),
> > > +	MDP_COLOR_YVYU_10L	=3D MDP_COLOR(0, 1, 0, 1, 1, 0, 20,  1, 1,
> > > 5),
> > > +	MDP_COLOR_NV12_10L	=3D MDP_COLOR(0, 1, 0, 2, 1, 1, 10,  1, 0,
> > > 12),
> > > +	MDP_COLOR_NV21_10L	=3D MDP_COLOR(0, 1, 0, 2, 1, 1, 10,  1, 1,
> > > 12),
> > > +	MDP_COLOR_NV16_10L	=3D MDP_COLOR(0, 1, 0, 2, 1, 0, 10,  1, 0,
> > > 13),
> > > +	MDP_COLOR_NV61_10L	=3D MDP_COLOR(0, 1, 0, 2, 1, 0, 10,  1, 1,
> > > 13),
> > > +	MDP_COLOR_YV12_10L	=3D MDP_COLOR(0, 1, 0, 3, 1, 1, 10,  1, 1,
> > > 8),
> > > +	MDP_COLOR_I420_10L	=3D MDP_COLOR(0, 1, 0, 3, 1, 1, 10,  1, 0,
> > > 8),
> > > +};
> > > +
> > > +/* Minimum Y stride that is accepted by MDP HW */
> > > +static inline u32 mdp_color_get_min_y_stride(enum mdp_color c, u32
> > > width)
> > > +{
> > > +	return ((MDP_COLOR_BITS_PER_PIXEL(c) * width) + 4) >> 3;
> > > +}
> > > +
> > > +/* Minimum UV stride that is accepted by MDP HW */
> > > +static inline u32 mdp_color_get_min_uv_stride(enum mdp_color c,
> > > u32 width)
> > > +{
> > > +	u32 min_stride;
> > > +
> > > +	if (MDP_COLOR_GET_PLANE_COUNT(c) =3D=3D 1)
> > > +		return 0;
> > > +	min_stride =3D mdp_color_get_min_y_stride(c, width)
> > > +		>> MDP_COLOR_GET_H_SUBSAMPLE(c);
> > > +	if (MDP_COLOR_IS_UV_COPLANE(c) && !MDP_COLOR_IS_BLOCK_MODE(c))
> > > +		min_stride =3D min_stride * 2;
> > > +	return min_stride;
> > > +}
> > > +
> > > +/* Minimum Y plane size that is necessary in buffer */
> > > +static inline u32 mdp_color_get_min_y_size(enum mdp_color c,
> > > +					   u32 width, u32 height)
> > > +{
> > > +	if (MDP_COLOR_IS_BLOCK_MODE(c))
> > > +		return ((MDP_COLOR_BITS_PER_PIXEL(c) * width) >> 8) *
> > > height;
> > > +	return mdp_color_get_min_y_stride(c, width) * height;
> > > +}
> > > +
> > > +/* Minimum UV plane size that is necessary in buffer */
> > > +static inline u32 mdp_color_get_min_uv_size(enum mdp_color c,
> > > +					    u32 width, u32 height)
> > > +{
> > > +	height =3D height >> MDP_COLOR_GET_V_SUBSAMPLE(c);
> > > +	if (MDP_COLOR_IS_BLOCK_MODE(c) && (MDP_COLOR_GET_PLANE_COUNT(c)
> > > > 1))
> > > +		return ((MDP_COLOR_BITS_PER_PIXEL(c) * width) >> 8) *
> > > height;
> > > +	return mdp_color_get_min_uv_stride(c, width) * height;
> > > +}
> > > +
> > > +/* Combine colorspace, xfer_func, ycbcr_encoding, and quantization
> > > */
> > > +enum mdp_ycbcr_profile {
> > > +	/* V4L2_YCBCR_ENC_601 and V4L2_QUANTIZATION_LIM_RANGE */
> > > +	MDP_YCBCR_PROFILE_BT601,
> > > +	/* V4L2_YCBCR_ENC_709 and V4L2_QUANTIZATION_LIM_RANGE */
> > > +	MDP_YCBCR_PROFILE_BT709,
> > > +	/* V4L2_YCBCR_ENC_601 and V4L2_QUANTIZATION_FULL_RANGE */
> > > +	MDP_YCBCR_PROFILE_JPEG,
> > > +	MDP_YCBCR_PROFILE_FULL_BT601 =3D MDP_YCBCR_PROFILE_JPEG,
> > > +
> > > +	/* Colorspaces not support for capture */
> > > +	/* V4L2_YCBCR_ENC_BT2020 and V4L2_QUANTIZATION_LIM_RANGE */
> > > +	MDP_YCBCR_PROFILE_BT2020,
> > > +	/* V4L2_YCBCR_ENC_709 and V4L2_QUANTIZATION_FULL_RANGE */
> > > +	MDP_YCBCR_PROFILE_FULL_BT709,
> > > +	/* V4L2_YCBCR_ENC_BT2020 and V4L2_QUANTIZATION_FULL_RANGE */
> > > +	MDP_YCBCR_PROFILE_FULL_BT2020,
> > > +};
> > > +
> > > +#define MDP_FMT_FLAG_OUTPUT	BIT(0)
> > > +#define MDP_FMT_FLAG_CAPTURE	BIT(1)
> > > +
> > > +struct mdp_format {
> > > +	u32	pixelformat;
> > > +	u32	mdp_color;
> > > +	u8	depth[VIDEO_MAX_PLANES];
> > > +	u8	row_depth[VIDEO_MAX_PLANES];
> > > +	u8	num_planes;
> > > +	u8	walign;
> > > +	u8	halign;
> > > +	u8	salign;
> > > +	u32	flags;
> > > +};
> > > +
> > > +struct mdp_pix_limit {
> > > +	u32	wmin;
> > > +	u32	hmin;
> > > +	u32	wmax;
> > > +	u32	hmax;
> > > +};
> > > +
> > > +struct mdp_limit {
> > > +	struct mdp_pix_limit	out_limit;
> > > +	struct mdp_pix_limit	cap_limit;
> > > +	u32			h_scale_up_max;
> > > +	u32			v_scale_up_max;
> > > +	u32			h_scale_down_max;
> > > +	u32			v_scale_down_max;
> > > +};
> > > +
> > > +enum mdp_stream_type {
> > > +	MDP_STREAM_TYPE_UNKNOWN,
> > > +	MDP_STREAM_TYPE_BITBLT,
> > > +	MDP_STREAM_TYPE_GPU_BITBLT,
> > > +	MDP_STREAM_TYPE_DUAL_BITBLT,
> > > +	MDP_STREAM_TYPE_2ND_BITBLT,
> > > +	MDP_STREAM_TYPE_ISP_IC,
> > > +	MDP_STREAM_TYPE_ISP_VR,
> > > +	MDP_STREAM_TYPE_ISP_ZSD,
> > > +	MDP_STREAM_TYPE_ISP_IP,
> > > +	MDP_STREAM_TYPE_ISP_VSS,
> > > +	MDP_STREAM_TYPE_ISP_ZSD_SLOW,
> > > +	MDP_STREAM_TYPE_WPE,
> > > +	MDP_STREAM_TYPE_WPE2,
> > > +};
> > > +
> > > +struct mdp_crop {
> > > +	struct v4l2_rect	c;
> > > +	struct v4l2_fract	left_subpix;
> > > +	struct v4l2_fract	top_subpix;
> > > +	struct v4l2_fract	width_subpix;
> > > +	struct v4l2_fract	height_subpix;
> > > +};
> > > +
> > > +struct mdp_frame {
> > > +	struct v4l2_format	format;
> > > +	const struct mdp_format	*mdp_fmt;
> > > +	u32			ycbcr_prof;	/* enum mdp_ycbcr_profile
> > > */
> > > +	u32			usage;		/* enum mdp_buffer_usage */
> > > +	struct mdp_crop		crop;
> > > +	struct v4l2_rect	compose;
> > > +	s32			rotation;
> > > +	u32			hflip:1;
> > > +	u32			vflip:1;
> > > +	u32			hdr:1;
> > > +	u32			dre:1;
> > > +	u32			sharpness:1;
> > > +	u32			dither:1;
> > > +};
> > > +
> > > +static inline bool mdp_target_is_crop(u32 target)
> > > +{
> > > +	return (target =3D=3D V4L2_SEL_TGT_CROP) ||
> > > +		(target =3D=3D V4L2_SEL_TGT_CROP_DEFAULT) ||
> > > +		(target =3D=3D V4L2_SEL_TGT_CROP_BOUNDS);
> > > +}
> > > +
> > > +static inline bool mdp_target_is_compose(u32 target)
> > > +{
> > > +	return (target =3D=3D V4L2_SEL_TGT_COMPOSE) ||
> > > +		(target =3D=3D V4L2_SEL_TGT_COMPOSE_DEFAULT) ||
> > > +		(target =3D=3D V4L2_SEL_TGT_COMPOSE_BOUNDS);
> > > +}
> > > +
> > > +#define MDP_MAX_CAPTURES	IMG_MAX_HW_OUTPUTS
> > > +
> > > +#define MDP_VPU_INIT		BIT(0)
> > > +#define MDP_M2M_CTX_ERROR	BIT(1)
> > > +
> > > +struct mdp_frameparam {
> > > +	struct list_head	list;
> > > +	struct mdp_m2m_ctx	*ctx;
> > > +	atomic_t		state;
> > > +	const struct mdp_limit	*limit;
> > > +	u32			type;	/* enum mdp_stream_type */
> > > +	u32			frame_no;
> > > +	struct mdp_frame	output;
> > > +	struct mdp_frame	captures[MDP_MAX_CAPTURES];
> > > +	u32			num_captures;
> > > +	enum v4l2_colorspace		colorspace;
> > > +	enum v4l2_ycbcr_encoding	ycbcr_enc;
> > > +	enum v4l2_xfer_func		xfer_func;
> > > +	enum v4l2_quantization		quant;
> > > +};
> > > +
> > > +int mdp_enum_fmt_mplane(struct v4l2_fmtdesc *f);
> > > +const struct mdp_format *mdp_try_fmt_mplane(struct v4l2_format *f,
> > > +					    struct mdp_frameparam
> > > *param,
> > > +					    u32 ctx_id);
> > > +enum mdp_ycbcr_profile mdp_map_ycbcr_prof_mplane(struct
> > > v4l2_format *f,
> > > +						 u32 mdp_color);
> > > +int mdp_try_crop(struct mdp_m2m_ctx *ctx, struct v4l2_rect *r,
> > > +		 const struct v4l2_selection *s, struct mdp_frame
> > > *frame);
> > > +int mdp_check_scaling_ratio(const struct v4l2_rect *crop,
> > > +			    const struct v4l2_rect *compose, s32
> > > rotation,
> > > +	const struct mdp_limit *limit);
> > > +void mdp_set_src_config(struct img_input *in,
> > > +			struct mdp_frame *frame, struct vb2_buffer
> > > *vb);
> > > +void mdp_set_dst_config(struct img_output *out,
> > > +			struct mdp_frame *frame, struct vb2_buffer
> > > *vb);
> > > +int mdp_frameparam_init(struct mdp_frameparam *param);
> > > +
> > > +#endif  /* __MTK_MDP3_REGS_H__ */
> > > diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
> > > b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
> > > new file mode 100644
> > > index 000000000000..fc008d96c7c0
> > > --- /dev/null
> > > +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
> > > @@ -0,0 +1,312 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (c) 2021 MediaTek Inc.
> > > + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> > > + */
> > > +
> > > +#include <linux/remoteproc.h>
> > > +#include <linux/remoteproc/mtk_scp.h>
> > > +#include "mtk-mdp3-vpu.h"
> > > +#include "mtk-mdp3-core.h"
> > > +
> > > +#define MDP_VPU_MESSAGE_TIMEOUT 500U
> > > +#define vpu_alloc_size		0x600000
> > > +
> > > +static inline struct mdp_dev *vpu_to_mdp(struct mdp_vpu_dev *vpu)
> > > +{
> > > +	return container_of(vpu, struct mdp_dev, vpu);
> > > +}
> > > +
> > > +static int mdp_vpu_shared_mem_alloc(struct mdp_vpu_dev *vpu)
> > > +{
> > > +	if (vpu->work && vpu->work_addr)
> > > +		return 0;
> > > +
> > > +	vpu->work =3D dma_alloc_coherent(scp_get_device(vpu->scp),
> > > vpu_alloc_size,
> > > +				       &vpu->work_addr, GFP_KERNEL);
> > > +
> > > +	if (!vpu->work)
> > > +		return -ENOMEM;
> > > +	else
> > > +		return 0;
> > > +}
> > > +
> > > +void mdp_vpu_shared_mem_free(struct mdp_vpu_dev *vpu)
> > > +{
> > > +	if (vpu->work && vpu->work_addr)
> > > +		dma_free_coherent(scp_get_device(vpu->scp),
> > > vpu_alloc_size,
> > > +				  vpu->work, vpu->work_addr);
> > > +}
> > > +
> > > +static void mdp_vpu_ipi_handle_init_ack(void *data, unsigned int
> > > len,
> > > +					void *priv)
> > > +{
> > > +	struct mdp_ipi_init_msg *msg =3D (struct mdp_ipi_init_msg *)data;
> > > +	struct mdp_vpu_dev *vpu =3D
> > > +		(struct mdp_vpu_dev *)(unsigned long)msg->drv_data;
> > > +
> > > +	if (!vpu->work_size)
> > > +		vpu->work_size =3D msg->work_size;
> > > +
> > > +	vpu->status =3D msg->status;
> > > +	complete(&vpu->ipi_acked);
> > > +}
> > > +
> > > +static void mdp_vpu_ipi_handle_deinit_ack(void *data, unsigned int
> > > len,
> > > +					  void *priv)
> > > +{
> > > +	struct mdp_ipi_deinit_msg *msg =3D (struct mdp_ipi_deinit_msg
> > > *)data;
> > > +	struct mdp_vpu_dev *vpu =3D
> > > +		(struct mdp_vpu_dev *)(unsigned long)msg->drv_data;
> > > +
> > > +	vpu->status =3D msg->status;
> > > +	complete(&vpu->ipi_acked);
> > > +}
> > > +
> > > +static void mdp_vpu_ipi_handle_frame_ack(void *data, unsigned int
> > > len,
> > > +					 void *priv)
> > > +{
> > > +	struct img_sw_addr *addr =3D (struct img_sw_addr *)data;
> > > +	struct img_ipi_frameparam *param =3D
> > > +		(struct img_ipi_frameparam *)(unsigned long)addr->va;
> > > +	struct mdp_vpu_ctx *ctx =3D
> > > +		(struct mdp_vpu_ctx *)(unsigned long)param->drv_data;
> > > +
> > > +	if (param->state) {
> > > +		struct mdp_dev *mdp =3D vpu_to_mdp(ctx->vpu_dev);
> > > +
> > > +		dev_err(&mdp->pdev->dev, "VPU MDP failure:%d\n", param-
> > > > state);
> > > +	}
> > > +	complete(&ctx->vpu_dev->ipi_acked);
> > > +}
> > > +
> > > +int mdp_vpu_register(struct mdp_dev *mdp)
> > > +{
> > > +	int err;
> > > +	struct mtk_scp *scp =3D mdp->scp;
> > > +	struct device *dev =3D &mdp->pdev->dev;
> > > +
> > > +	err =3D scp_ipi_register(scp, SCP_IPI_MDP_INIT,
> > > +			       mdp_vpu_ipi_handle_init_ack, NULL);
> > > +	if (err) {
> > > +		dev_err(dev, "scp_ipi_register failed %d\n", err);
> > > +		goto err_ipi_init;
> > > +	}
> > > +	err =3D scp_ipi_register(scp, SCP_IPI_MDP_DEINIT,
> > > +			       mdp_vpu_ipi_handle_deinit_ack, NULL);
> > > +	if (err) {
> > > +		dev_err(dev, "scp_ipi_register failed %d\n", err);
> > > +		goto err_ipi_deinit;
> > > +	}
> > > +	err =3D scp_ipi_register(scp, SCP_IPI_MDP_FRAME,
> > > +			       mdp_vpu_ipi_handle_frame_ack, NULL);
> > > +	if (err) {
> > > +		dev_err(dev, "scp_ipi_register failed %d\n", err);
> > > +		goto err_ipi_frame;
> > > +	}
> > > +	return 0;
> > > +
> > > +err_ipi_frame:
> > > +	scp_ipi_unregister(scp, SCP_IPI_MDP_DEINIT);
> > > +err_ipi_deinit:
> > > +	scp_ipi_unregister(scp, SCP_IPI_MDP_INIT);
> > > +err_ipi_init:
> > > +
> > > +	return err;
> > > +}
> > > +
> > > +void mdp_vpu_unregister(struct mdp_dev *mdp)
> > > +{
> > > +	scp_ipi_unregister(mdp->scp, SCP_IPI_MDP_INIT);
> > > +	scp_ipi_unregister(mdp->scp, SCP_IPI_MDP_DEINIT);
> > > +	scp_ipi_unregister(mdp->scp, SCP_IPI_MDP_FRAME);
> > > +}
> > > +
> > > +static int mdp_vpu_sendmsg(struct mdp_vpu_dev *vpu, enum
> > > scp_ipi_id id,
> > > +			   void *buf, unsigned int len)
> > > +{
> > > +	struct mdp_dev *mdp =3D vpu_to_mdp(vpu);
> > > +	unsigned int t =3D MDP_VPU_MESSAGE_TIMEOUT;
> > > +	int ret;
> > > +
> > > +	if (!vpu->scp) {
> > > +		dev_dbg(&mdp->pdev->dev, "vpu scp is NULL");
> > > +		return -EINVAL;
> > > +	}
> > > +	ret =3D scp_ipi_send(vpu->scp, id, buf, len, 2000);
> > > +
> > > +	if (ret) {
> > > +		dev_err(&mdp->pdev->dev, "scp_ipi_send failed %d\n",
> > > ret);
> > > +		return -EPERM;
> > > +	}
> > > +	ret =3D wait_for_completion_timeout(&vpu->ipi_acked,
> > > +					  msecs_to_jiffies(t));
> > > +	if (!ret)
> > > +		ret =3D -ETIME;
> > > +	else if (vpu->status)
> > > +		ret =3D -EINVAL;
> > > +	else
> > > +		ret =3D 0;
> > > +	return ret;
> > > +}
> > > +
> > > +int mdp_vpu_dev_init(struct mdp_vpu_dev *vpu, struct mtk_scp *scp,
> > > +		     struct mutex *lock)
> > > +{
> > > +	struct mdp_ipi_init_msg msg =3D {
> > > +		.drv_data =3D (unsigned long)vpu,
> > > +	};
> > > +	size_t mem_size;
> > > +	phys_addr_t pool;
> > > +	const size_t pool_size =3D sizeof(struct mdp_config_pool);
> > > +	struct mdp_dev *mdp =3D vpu_to_mdp(vpu);
> > > +	int err;
> > > +
> > > +	init_completion(&vpu->ipi_acked);
> > > +	vpu->scp =3D scp;
> > > +	vpu->lock =3D lock;
> > > +	vpu->work_size =3D 0;
> > > +	err =3D mdp_vpu_sendmsg(vpu, SCP_IPI_MDP_INIT, &msg,
> > > sizeof(msg));
> > > +	if (err)
> > > +		goto err_work_size;
> > > +	/* vpu work_size was set in mdp_vpu_ipi_handle_init_ack */
> > > +
> > > +	mem_size =3D vpu_alloc_size;
> > > +	if (mdp_vpu_shared_mem_alloc(vpu)) {
> > > +		dev_err(&mdp->pdev->dev, "VPU memory alloc fail!");
> > > +		goto err_mem_alloc;
> > > +	}
> > > +
> > > +	pool =3D ALIGN((uintptr_t)vpu->work + vpu->work_size, 8);
> > > +	if (pool + pool_size - (uintptr_t)vpu->work > mem_size) {
> > > +		dev_err(&mdp->pdev->dev,
> > > +			"VPU memory insufficient: %zx + %zx > %zx",
> > > +			vpu->work_size, pool_size, mem_size);
> > > +		err =3D -ENOMEM;
> > > +		goto err_mem_size;
> > > +	}
> > > +
> > > +	dev_dbg(&mdp->pdev->dev,
> > > +		"VPU work:%pK pa:%pad sz:%zx pool:%pa sz:%zx (mem
> > > sz:%zx)",
> > > +		vpu->work, &vpu->work_addr, vpu->work_size,
> > > +		&pool, pool_size, mem_size);
> > > +	vpu->pool =3D (struct mdp_config_pool *)(uintptr_t)pool;
> > > +	msg.work_addr =3D vpu->work_addr;
> > > +	msg.work_size =3D vpu->work_size;
> > > +	err =3D mdp_vpu_sendmsg(vpu, SCP_IPI_MDP_INIT, &msg,
> > > sizeof(msg));
> > > +	if (err)
> > > +		goto err_work_size;
> > > +
> > > +	memset(vpu->pool, 0, sizeof(*vpu->pool));
> > > +	return 0;
> > > +
> > > +err_work_size:
> > > +	switch (vpu->status) {
> > > +	case -MDP_IPI_EBUSY:
> > > +		err =3D -EBUSY;
> > > +		break;
> > > +	case -MDP_IPI_ENOMEM:
> > > +		err =3D -ENOSPC;	/* -ENOMEM */
> > > +		break;
> > > +	}
> > > +	return err;
> > > +err_mem_size:
> > > +err_mem_alloc:
> > > +	return err;
> > > +}
> > > +
> > > +int mdp_vpu_dev_deinit(struct mdp_vpu_dev *vpu)
> > > +{
> > > +	struct mdp_ipi_deinit_msg msg =3D {
> > > +		.drv_data =3D (unsigned long)vpu,
> > > +		.work_addr =3D vpu->work_addr,
> > > +	};
> > > +
> > > +	return mdp_vpu_sendmsg(vpu, SCP_IPI_MDP_DEINIT, &msg,
> > > sizeof(msg));
> > > +}
> > > +
> > > +static struct img_config *mdp_config_get(struct mdp_vpu_dev *vpu,
> > > +					 enum mdp_config_id id,
> > > uint32_t *addr)
> > > +{
> > > +	struct img_config *config;
> > > +
> > > +	if (id < 0 || id >=3D MDP_CONFIG_POOL_SIZE)
> > > +		return ERR_PTR(-EINVAL);
> > > +
> > > +	mutex_lock(vpu->lock);
> > > +	vpu->pool->cfg_count[id]++;
> > > +	config =3D &vpu->pool->configs[id];
> > > +	*addr =3D vpu->work_addr + ((uintptr_t)config - (uintptr_t)vpu-
> > > > work);
> > > +	mutex_unlock(vpu->lock);
> > > +
> > > +	return config;
> > > +}
> > > +
> > > +static int mdp_config_put(struct mdp_vpu_dev *vpu,
> > > +			  enum mdp_config_id id,
> > > +			  const struct img_config *config)
> > > +{
> > > +	int err =3D 0;
> > > +
> > > +	if (id < 0 || id >=3D MDP_CONFIG_POOL_SIZE)
> > > +		return -EINVAL;
> > > +	if (vpu->lock)
> > > +		mutex_lock(vpu->lock);
> > > +	if (!vpu->pool->cfg_count[id] || config !=3D &vpu->pool-
> > > > configs[id])
> > > +		err =3D -EINVAL;
> > > +	else
> > > +		vpu->pool->cfg_count[id]--;
> > > +	if (vpu->lock)
> > > +		mutex_unlock(vpu->lock);
> > > +	return err;
> > > +}
> > > +
> > > +int mdp_vpu_ctx_init(struct mdp_vpu_ctx *ctx, struct mdp_vpu_dev
> > > *vpu,
> > > +		     enum mdp_config_id id)
> > > +{
> > > +	ctx->config =3D mdp_config_get(vpu, id, &ctx->inst_addr);
> > > +	if (IS_ERR(ctx->config)) {
> > > +		int err =3D PTR_ERR(ctx->config);
> > > +
> > > +		ctx->config =3D NULL;
> > > +		return err;
> > > +	}
> > > +	ctx->config_id =3D id;
> > > +	ctx->vpu_dev =3D vpu;
> > > +	return 0;
> > > +}
> > > +
> > > +int mdp_vpu_ctx_deinit(struct mdp_vpu_ctx *ctx)
> > > +{
> > > +	int err =3D mdp_config_put(ctx->vpu_dev, ctx->config_id, ctx-
> > > > config);
> > > +
> > > +	ctx->config_id =3D 0;
> > > +	ctx->config =3D NULL;
> > > +	ctx->inst_addr =3D 0;
> > > +	return err;
> > > +}
> > > +
> > > +int mdp_vpu_process(struct mdp_vpu_ctx *ctx, struct
> > > img_ipi_frameparam *param)
> > > +{
> > > +	struct mdp_vpu_dev *vpu =3D ctx->vpu_dev;
> > > +	struct mdp_dev *mdp =3D vpu_to_mdp(vpu);
> > > +	struct img_sw_addr addr;
> > > +
> > > +	if (!ctx->vpu_dev->work || !ctx->vpu_dev->work_addr) {
> > > +		if (mdp_vpu_shared_mem_alloc(vpu)) {
> > > +			dev_err(&mdp->pdev->dev, "VPU memory alloc
> > > fail!");
> > > +			return -ENOMEM;
> > > +		}
> > > +	}
> > > +	memset((void *)ctx->vpu_dev->work, 0, ctx->vpu_dev->work_size);
> > > +	memset(ctx->config, 0, sizeof(*ctx->config));
> > > +	param->config_data.va =3D (unsigned long)ctx->config;
> > > +	param->config_data.pa =3D ctx->inst_addr;
> > > +	param->drv_data =3D (unsigned long)ctx;
> > > +
> > > +	memcpy((void *)ctx->vpu_dev->work, param, sizeof(*param));
> > > +	addr.pa =3D ctx->vpu_dev->work_addr;
> > > +	addr.va =3D (uintptr_t)ctx->vpu_dev->work;
> > > +	return mdp_vpu_sendmsg(ctx->vpu_dev, SCP_IPI_MDP_FRAME,
> > > +		&addr, sizeof(addr));
> > > +}
> > > diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.h
> > > b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.h
> > > new file mode 100644
> > > index 000000000000..e831070b44d0
> > > --- /dev/null
> > > +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.h
> > > @@ -0,0 +1,78 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +/*
> > > + * Copyright (c) 2021 MediaTek Inc.
> > > + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> > > + */
> > > +
> > > +#ifndef __MTK_MDP3_VPU_H__
> > > +#define __MTK_MDP3_VPU_H__
> > > +
> > > +#include <linux/platform_device.h>
> > > +#include "mtk-img-ipi.h"
> > > +
> > > +enum mdp_ipi_result {
> > > +	MDP_IPI_SUCCESS	=3D 0,
> > > +	MDP_IPI_ENOMEM	=3D 12,
> > > +	MDP_IPI_EBUSY	=3D 16,
> > > +	MDP_IPI_EINVAL	=3D 22,
> > > +	MDP_IPI_EMINST	=3D 24,
> > > +	MDP_IPI_ERANGE	=3D 34,
> > > +	MDP_IPI_NR_ERRNO,
> > > +
> > > +	MDP_IPI_EOTHER	=3D MDP_IPI_NR_ERRNO,
> > > +	MDP_IPI_PATH_CANT_MERGE,
> > > +	MDP_IPI_OP_FAIL,
> > > +};
> > > +
> > > +struct mdp_ipi_init_msg {
> > > +	u32	status;
> > > +	u64	drv_data;
> > > +	u32	work_addr;	/* [in] working buffer address */
> > > +	u32	work_size;	/* [in] working buffer size */
> > > +} __packed;
> > > +
> > > +struct mdp_ipi_deinit_msg {
> > > +	u32	status;
> > > +	u64	drv_data;
> > > +	u32	work_addr;
> > > +} __packed;
> > > +
> > > +enum mdp_config_id {
> > > +	MDP_DEV_M2M =3D 0,
> > > +	MDP_CONFIG_POOL_SIZE	/* ALWAYS keep at the end */
> > > +};
> > > +
> > > +struct mdp_config_pool {
> > > +	u64			cfg_count[MDP_CONFIG_POOL_SIZE];
> > > +	struct img_config	configs[MDP_CONFIG_POOL_SIZE];
> > > +};
> > > +
> > > +struct mdp_vpu_dev {
> > > +	/* synchronization protect for accessing vpu working buffer
> > > info */
> > > +	struct mutex		*lock;
> > > +	struct mtk_scp		*scp;
> > > +	struct completion	ipi_acked;
> > > +	void			*work;
> > > +	dma_addr_t		work_addr;
> > > +	size_t			work_size;
> > > +	struct mdp_config_pool	*pool;
> > > +	u32			status;
> > > +};
> > > +
> > > +struct mdp_vpu_ctx {
> > > +	struct mdp_vpu_dev	*vpu_dev;
> > > +	u32			config_id;
> > > +	struct img_config	*config;
> > > +	u32			inst_addr;
> > > +};
> > > +
> > > +void mdp_vpu_shared_mem_free(struct mdp_vpu_dev *vpu);
> > > +int mdp_vpu_dev_init(struct mdp_vpu_dev *vpu, struct mtk_scp *scp,
> > > +		     struct mutex *lock /* for sync */);
> > > +int mdp_vpu_dev_deinit(struct mdp_vpu_dev *vpu);
> > > +int mdp_vpu_ctx_init(struct mdp_vpu_ctx *ctx, struct mdp_vpu_dev
> > > *vpu,
> > > +		     enum mdp_config_id id);
> > > +int mdp_vpu_ctx_deinit(struct mdp_vpu_ctx *ctx);
> > > +int mdp_vpu_process(struct mdp_vpu_ctx *vpu, struct
> > > img_ipi_frameparam *param);
> > > +
> > > +#endif  /* __MTK_MDP3_VPU_H__ */
> >=20
> >=20
>=20


