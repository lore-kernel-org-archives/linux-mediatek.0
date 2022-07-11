Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24647C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 09:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QDZ8DW6Ab47P0WX+J7LhyvukGdz6YrdRp1QgndPHt20=; b=uKu1I5lRywrOoy1FjW+7LvjO7s
	h+V20ZdrRSSpxBovUT/6Lr15Ffqi/eugTDklyJHRFzWyJgpt4xsO3x5vp2BE+ceR+Bsi9W+0GJRVo
	CEKh/2Livucrc2N57SPte8+UVH1B9x3oIKZ2hbA9ziY9RIhHnyTUFow0nvBci60pLClqCTJqId/DM
	49o9gkM8CJ0I6whdiUEvrS9CG8aaQzhuWLqqrR7pZjQiIoNdXEC14/aZnGHWxnV4aChJCMHci5jJz
	jImVTW9aeqhE0h2qsUEGclLquiFURTyvDhys1uc3r3nYllNDjEExtPaMU2HnWYDsg9zO/cytpXU+l
	0sqSlfLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oApSb-00HXMN-Pm; Mon, 11 Jul 2022 09:12:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oApSQ-00HXGn-CQ; Mon, 11 Jul 2022 09:12:00 +0000
X-UUID: d2c6358aa2e544fd9a2b46f4f4e33963-20220711
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:d7f4867b-287e-408b-97cb-9fac068344c1,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:adb5f463-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: d2c6358aa2e544fd9a2b46f4f4e33963-20220711
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 421037050; Mon, 11 Jul 2022 02:11:50 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 11 Jul 2022 16:11:12 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 11 Jul 2022 16:11:12 +0800
Message-ID: <ddb4b31e85f1614cb9a84bdf7644d0f16e5f5427.camel@mediatek.com>
Subject: Re: [DKIM] [PATCH v21 4/4] media: platform: mtk-mdp3: add Mediatek
 MDP3 driver
From: moudy.ho <moudy.ho@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
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
Date: Mon, 11 Jul 2022 16:11:11 +0800
In-Reply-To: <d93b51b3-9c94-4842-891c-cd3547ae8712@xs4all.nl>
References: <20220706075454.15569-1-moudy.ho@mediatek.com>
	 <20220706075454.15569-5-moudy.ho@mediatek.com>
	 <d93b51b3-9c94-4842-891c-cd3547ae8712@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_021158_440858_CA16326A 
X-CRM114-Status: GOOD (  32.88  )
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

Hi Hans,

Thanks for your review, and appreciate for all comments and
suggestions.
I'll go through each "dev_info" one by one and replace the unnecessary
with "dev_dbg" or just remove it.
In addition, I will adjust other inappropriate settings as suggested.

On Fri, 2022-07-08 at 10:08 +0200, Hans Verkuil wrote:
> Hi Moudy,
> 
> Some comments below:
> 
> On 7/6/22 09:54, Moudy Ho wrote:
> > This patch adds driver for Mediatek's Media Data Path ver.3 (MDP3).
> > It provides the following functions:
> >   color transform, format conversion, resize, crop, rotate, flip
> >   and additional image quality enhancement.
> > 
> > The MDP3 driver is mainly used for Google Chromebook products to
> > import the new architecture to set the HW settings as shown below:
> >   User -> V4L2 framework
> >     -> MDP3 driver -> SCP (setting calculations)
> >       -> MDP3 driver -> CMDQ (GCE driver) -> HW
> > 
> > Each modules' related operation control is sited in mtk-mdp3-comp.c
> > Each modules' register table is defined in file with "mdp_reg_"
> > prefix
> > GCE related API, operation control  sited in mtk-mdp3-cmdq.c
> > V4L2 m2m device functions are implemented in mtk-mdp3-m2m.c
> > Probe, power, suspend/resume, system level functions are defined in
> > mtk-mdp3-core.c
> > 
> > v4l2-compliance 1.22.1, 32 bits, 32-bit time_t
> > 
> > Compliance test for mtk-mdp3 device /dev/video2:
> > 
> > Driver Info:
> > 	Driver name      : mtk-mdp3
> > 	Card type        : 14001000.mdp3-rdma0
> 
> Card type is expected to be a human readable name, and that's not the
> case
> here.
> 
> > 	Bus info         : platform:mtk-mdp3
> 
> <snip>

[snip]

> > diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c
> > b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c
> > new file mode 100644
> > index 000000000000..18874eb7851c
> > --- /dev/null
> > +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c

[snip]

> > +/* Plane size that is accepted by MDP HW */
> > +static u32 mdp_fmt_get_plane_size(const struct mdp_format *fmt,
> > +				  u32 stride, u32 height, unsigned int
> > plane)
> > +{
> > +	enum mdp_color c = fmt->mdp_color;
> > +	u32 bytesperline;
> > +
> > +	bytesperline = (stride * fmt->row_depth[0])
> > +		/ MDP_COLOR_BITS_PER_PIXEL(c);
> > +	if (plane == 0)
> > +		return bytesperline * height;
> > +	if (plane < MDP_COLOR_GET_PLANE_COUNT(c)) {
> > +		height = height >> MDP_COLOR_GET_V_SUBSAMPLE(c);
> > +		if (MDP_COLOR_IS_BLOCK_MODE(c))
> > +			bytesperline = bytesperline * 2;
> > +		return bytesperline * height;
> > +	}
> > +	return 0;
> > +}
> > +
> > +static void mdp_prepare_buffer(struct img_image_buffer *b,
> > +			       struct mdp_frame *frame, struct
> > vb2_buffer *vb)
> > +{
> > +	struct v4l2_pix_format_mplane *pix_mp = &frame-
> > >format.fmt.pix_mp;
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
> > +		 * TODO : The way to pass an offset within a DMA-buf
> > +		 * is not defined in V4L2 specification, so we abuse
> > +		 * data_offset for now. Fix it when we have the right
> > interface,
> > +		 * including any necessary validation and potential
> > alignment
> > +		 * issues.
> > +		 */
> > +		b->format.plane_fmt[i].size =
> > +			mdp_fmt_get_plane_size(frame->mdp_fmt, stride,
> > +					       pix_mp->height, i) -
> > +					       vb-
> > >planes[i].data_offset;
> > +		b->iova[i] = vb2_dma_contig_plane_dma_addr(vb, i) +
> > +			     vb->planes[i].data_offset;
> 
> Why do you need data_offset? What is the use case? Obviously I can't
> merge a driver that abuses an API.
> 

Apologize for not incorporating the previously discussed results into
this version due to my carelessness, I will correct it in the next
version.

https://patchwork.kernel.org/project/linux-mediatek/patch/20210623091457.18002-1-moudy.ho@mediatek.com/

> > +	}
> > +	for (; i < MDP_COLOR_GET_PLANE_COUNT(b->format.colorformat);
> > ++i) {
> > +		u32 stride = mdp_fmt_get_stride_contig(frame->mdp_fmt,
> > +			b->format.plane_fmt[0].stride, i);
> > +
> > +		b->format.plane_fmt[i].stride = stride;
> > +		b->format.plane_fmt[i].size =
> > +			mdp_fmt_get_plane_size(frame->mdp_fmt, stride,
> > +					       pix_mp->height, i);
> > +		b->iova[i] = b->iova[i - 1] + b->format.plane_fmt[i -
> > 1].size;
> > +	}
> > +	b->usage = frame->usage;
> > +}
> > +
> > +void mdp_set_src_config(struct img_input *in,
> > +			struct mdp_frame *frame, struct vb2_buffer *vb)
> > +{
> > +	in->buffer.format.width = frame->format.fmt.pix_mp.width;
> > +	in->buffer.format.height = frame->format.fmt.pix_mp.height;
> > +	mdp_prepare_buffer(&in->buffer, frame, vb);
> > +}

[snip]

> 
> Regards,
> 
> 	Hans

Many thanks,
Moudy


