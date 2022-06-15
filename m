Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF906C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 20:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9n3WoSY2l3FkGN+L1hygguY54hdetUG2F1BTOkJs/Q=; b=B75oWf/A2gUrjVKccjEh475Kqc
	yj43cRCfyutPyIvcgUUOPizqI0YS9QsbVKfX9FSk9Na0sB6aoC2mVMflzI7Wm4x+EnUtCq42anGAb
	vkl9mhlBPSJvB/OtFNHo80L39Y5PylCd0p8twoHuLTHqoCIlVLBZxVmEE3SIZ+mel5w3l/GU02uRt
	coDabQJHK9dcUPIDsz3CB88DDqx3gxYLDm9AHE34bcUbIIhFJnQ2xoOpkVghkZ+gZRUKn/NMGsyFD
	zg9y4lGykdw7ub1tY8fRNyVgu0BrLNXJsGX0IoI2KwbY9oKRfQFErQHL5pxuiXvRF/nFT2/762pmb
	xMekftZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ZRM-00GDVb-Sy; Wed, 15 Jun 2022 20:16:36 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ZRA-00GDQy-7a; Wed, 15 Jun 2022 20:16:26 +0000
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 940A75A9;
	Wed, 15 Jun 2022 22:16:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1655324178;
	bh=v1jkPA/EFojabfAV7CqrNhRRtf1nu53ymbo3OjQaZ+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AAYDj2ecF7Wh3k/aBm0G8psU0EIBwv4jaVsp1cZ4ba8hgolUoANUU95Wur/tNquvL
	 BcYLNq81dNw2GbgsDDtGcDCQwcl5Ks2g3SM5oOYeBfo58qVrDiw8VSp3XjJLnQjM/M
	 UWVqDCnd+FDZKd4fbr0oCPP3TEWoGpeVQTA3eA/Q=
Date: Wed, 15 Jun 2022 23:16:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Moudy Ho <moudy.ho@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Maoguang Meng <maoguang.meng@mediatek.com>,
	Hsin-Yi Wang <hsinyi@google.com>,
	daoyuan huang <daoyuan.huang@mediatek.com>,
	Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Landley <rob@landley.net>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	tfiga@chromium.org, drinkcat@chromium.org, acourbot@chromium.org,
	pihsun@chromium.org, menghui.lin@mediatek.com,
	sj.huang@mediatek.com, ben.lok@mediatek.com, randy.wu@mediatek.com,
	srv_heupstream@mediatek.com, Rex-BC Chen <Rex-BC.Chen@mediatek.com>
Subject: Re: [V1] media: mtk-mdp3: Add Mediatek MDP3 Driver
Message-ID: <Yqo+CPSNDeqFLPGB@pendragon.ideasonboard.com>
References: <20210623091457.18002-1-moudy.ho@mediatek.com>
 <2735b66aef88ef5dc623702d27efc3a931d2fdd3.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2735b66aef88ef5dc623702d27efc3a931d2fdd3.camel@ndufresne.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_131624_483015_057B8E2C 
X-CRM114-Status: GOOD (  25.98  )
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

On Wed, Jun 15, 2022 at 03:55:14PM -0400, Nicolas Dufresne wrote:
> Le mercredi 23 juin 2021 à 17:14 +0800, Moudy Ho a écrit :
> > From: mtk18742 <moudy.ho@mediatek.com>
> > 
> > Add MDP3 driver for MT8183
> > 
> > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > ---
> >  drivers/media/platform/Kconfig                |   17 +
> >  drivers/media/platform/Makefile               |    2 +
> >  drivers/media/platform/mtk-mdp3/Makefile      |    9 +
> >  drivers/media/platform/mtk-mdp3/isp_reg.h     |   37 +
> >  .../media/platform/mtk-mdp3/mdp-platform.h    |   58 +
> >  .../media/platform/mtk-mdp3/mdp_reg_ccorr.h   |   75 +
> >  .../media/platform/mtk-mdp3/mdp_reg_rdma.h    |  206 +++
> >  drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h |  109 ++
> >  .../media/platform/mtk-mdp3/mdp_reg_wdma.h    |  125 ++
> >  .../media/platform/mtk-mdp3/mdp_reg_wrot.h    |  115 ++
> >  .../media/platform/mtk-mdp3/mmsys_config.h    |  188 +++
> >  drivers/media/platform/mtk-mdp3/mmsys_mutex.h |   35 +
> >  .../media/platform/mtk-mdp3/mmsys_reg_base.h  |   38 +
> >  drivers/media/platform/mtk-mdp3/mtk-img-ipi.h |  282 ++++
> >  .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   |  538 ++++++
> >  .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.h   |   53 +
> >  .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 1437 +++++++++++++++++
> >  .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |  157 ++
> >  .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  266 +++
> >  .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   86 +
> >  .../media/platform/mtk-mdp3/mtk-mdp3-debug.c  |  973 +++++++++++
> >  .../media/platform/mtk-mdp3/mtk-mdp3-debug.h  |   39 +
> >  .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |  803 +++++++++
> >  .../media/platform/mtk-mdp3/mtk-mdp3-m2m.h    |   42 +
> >  .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  748 +++++++++
> >  .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |  373 +++++
> >  .../media/platform/mtk-mdp3/mtk-mdp3-vpu.c    |  313 ++++
> >  .../media/platform/mtk-mdp3/mtk-mdp3-vpu.h    |   79 +
> >  28 files changed, 7203 insertions(+)
> >  create mode 100644 drivers/media/platform/mtk-mdp3/Makefile
> >  create mode 100644 drivers/media/platform/mtk-mdp3/isp_reg.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mdp-platform.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_ccorr.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rdma.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wdma.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wrot.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mmsys_config.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mmsys_mutex.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mmsys_reg_base.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-debug.c
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-debug.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h

[snip]

> > diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
> > new file mode 100644
> > index 000000000000..0c4c942b5f9c
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
> > @@ -0,0 +1,748 @@

[snip]

> > +static void mdp_prepare_buffer(struct img_image_buffer *b,
> > +			       struct mdp_frame *frame, struct vb2_buffer *vb)
> > +{
> > +	struct v4l2_pix_format_mplane *pix_mp = &frame->format.fmt.pix_mp;
> > +	unsigned int i;
> > +
> > +	b->format.colorformat = frame->mdp_fmt->mdp_color;
> > +	b->format.ycbcr_prof = frame->ycbcr_prof;
> > +	for (i = 0; i < pix_mp->num_planes; ++i) {
> > +		u32 stride = mdp_fmt_get_stride(frame->mdp_fmt,
> > +			pix_mp->plane_fmt[i].bytesperline, i);
> > +
> > +		b->format.plane_fmt[i].stride = stride;
> > +		/*
> > +		 * TODO(crbug.com/901264): The way to pass an offset within a
> > +		 * DMA-buf is not defined in V4L2 specification, so we abuse
> > +		 * data_offset for now. Fix it when we have the right interface,
> > +		 * including any necessary validation and potential alignment
> > +		 * issues.
> > +		 */
> > +		b->format.plane_fmt[i].size =
> > +			mdp_fmt_get_plane_size(frame->mdp_fmt, stride,
> > +					       pix_mp->height, i) -
> > +					       vb->planes[i].data_offset;
> > +		b->iova[i] = vb2_dma_contig_plane_dma_addr(vb, i) +
> > +			     vb->planes[i].data_offset;
> 
> As the comment says, data_offset is not valdiated at all for capture devices and
> is only validated so that (length - data_offset > 0) for OUTPUT devices. So this
> is going out of spec and leave the door open for buffer overflow triggered by
> users.

And as documented by the TODO comment, it's clearly an API abuse. This
can't go in as-is, we need to revive the v4l2_buffer extended API that
Boris used to work on.

> > +	}
> > +	for (; i < MDP_COLOR_GET_PLANE_COUNT(b->format.colorformat); ++i) {
> > +		u32 stride = mdp_fmt_get_stride_contig(frame->mdp_fmt,
> > +			b->format.plane_fmt[0].stride, i);
> > +
> > +		b->format.plane_fmt[i].stride = stride;
> > +		b->format.plane_fmt[i].size =
> > +			mdp_fmt_get_plane_size(frame->mdp_fmt, stride,
> > +					       pix_mp->height, i);
> > +		b->iova[i] = b->iova[i - 1] + b->format.plane_fmt[i - 1].size;
> > +	}
> > +	b->usage = frame->usage;
> > +}

-- 
Regards,

Laurent Pinchart

