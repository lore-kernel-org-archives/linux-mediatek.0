Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3EE4C38A2D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 06:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6e7wfegJhKXSWN3e5NJom6LRAKKJMHCkUrFGhn4Auf0=; b=4AmwuWNbVALdMK1/dOoQt25LW1
	KIcKvscOlqpGGVJfH8ON6e9iAQpMTEg/rXtxrEaqlL4nccZpsDA8+RDqo93e6E21pkI9CF8/F24Iz
	wdlqPTRA4FNZT7jvnbM4b69Wj3iBw37RrQsueKNatPkF3biSTEcRM2Jz33dPvYw0VAAS903d2B0oW
	F3r9eKRBMp8jl1LXpESLJxtc0S8y/SybGhaUlRq4htkp5/PgG5278CJ28zyNeEELo0wx661aGQrjF
	x4FM/uVm/d2XPAscyVGQ+oyhDdTdKwEIitLm51rmbOnumRLyT2whC42MNqhd0HWcjvSEpBwci7lVy
	dm/6FmUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omqiq-00HGs7-06; Mon, 24 Oct 2022 06:14:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omqie-00HGq1-Oh; Mon, 24 Oct 2022 06:13:54 +0000
X-UUID: aafa8ce2543b4bbe812d920819d2e6a0-20221023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=6e7wfegJhKXSWN3e5NJom6LRAKKJMHCkUrFGhn4Auf0=;
	b=sVIlPoOL9B815YH2jKHjdlyTOse42LMcnADQKeh/6iIGg3Crmvg0+tfNmx1E6VsrtaxNDkU8nUpMz1JdT6IjZyX0Z03DPMk3wjbVAlR4MDMl0QiF8NZpFXooFwIl9MqKJZj/ngAKfHNF4rXuEoCbA1QtFb+OPttj1qtptFURJL8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:ebffb029-a942-4437-bc50-7fa99b51ad5b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:62cd327,CLOUDID:6cb077c8-03ab-4171-989e-341ab5339257,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: aafa8ce2543b4bbe812d920819d2e6a0-20221023
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <mingjia.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1913346288; Sun, 23 Oct 2022 23:13:44 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 24 Oct 2022 14:13:06 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 24 Oct 2022 14:13:05 +0800
Message-ID: <9eabf0b05bfb3071257cbccf5b19a434522f79ff.camel@mediatek.com>
Subject: Re: [PATCH, v2] media: mediatek: vcodec: Add to support VP9 inner
 racing mode
From: "mingjia.zhang@mediatek.com" <mingjia.zhang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Yunfei Dong
	<yunfei.dong@mediatek.com>, Alexandre Courbot <acourbot@chromium.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
	Steve Cho <stevecho@chromium.org>, <devicetree@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
	Xiaoyong Lu <xiaoyong.lu@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Date: Mon, 24 Oct 2022 14:13:05 +0800
In-Reply-To: <27263bbf-10d0-174d-38b4-5d6b0a6bc9bd@xs4all.nl>
References: <20220727061310.2307-1-mingjia.zhang@mediatek.com>
	 <27263bbf-10d0-174d-38b4-5d6b0a6bc9bd@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_231352_815456_772A91CD 
X-CRM114-Status: GOOD (  31.48  )
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

Thanks for you reply and useful suggestions.

The previous patch v3 may not fully modified. Now I push patch v4.
Please help to review it, thanks.

Thanks,
mingjia

On Wed, 2022-08-24 at 15:02 +0200, Hans Verkuil wrote:
> Hi Mingjia,
> 
> On 27/07/2022 08:13, Mingjia Zhang wrote:
> > In order to reduce decoder latency, enable VP9 inner racing mode.
> > Send lat trans buffer information to core when trigger lat to work,
> > need not to wait until lat decode done.
> > 
> > Signed-off-by: mingjia zhang <mingjia.zhang@mediatek.com>
> 
> I'm getting this compile warning:
> 
> drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c: In
> function 'vdec_vp9_slice_core_decode':
> drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c:221
> 8:50: warning: 'instance' may be used uninitialized in this function
> [-Wmaybe-uninitialized]
>  2218 |                 if (IS_VDEC_INNER_RACING(instance->ctx->dev-
> >dec_capability))
>       |                                                  ^~
> 

After reviewing the error handling in vdec_vp9_slice_core_decode(), I
found that the problem you pointed out does exist in error handle part.
'instance' may be used uninitialized in this function. I have fixed
this build warning and reviewed other code, thanks.

> I think you need to take a close look at the error handling in
> vdec_vp9_slice_core_decode().
> 
> After each error there is a 'goto err;' and that will run the new
> code, and that doesn't
> feel right.
> 

I have modified the code logic, and reduced some redundant code,
thanks.

> Regards,
> 
> 	Hans
> 
> > ---
> > 1. CTS/GTS test pass
> > 2. Fluster result: Ran 240/303 tests successfully
> > ---
> >  .../vcodec/vdec/vdec_vp9_req_lat_if.c         | 64 ++++++++++++---
> > ----
> >  1 file changed, 40 insertions(+), 24 deletions(-)
> > 
> > diff --git
> > a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> > b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> > index fb1c36a3592d..92b47f0fdf40 100644
> > ---
> > a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> > +++
> > b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> > @@ -436,6 +436,7 @@ struct vdec_vp9_slice_ref {
> >   * @frame_ctx:		4 frame context according to VP9 Spec
> >   * @frame_ctx_helper:	4 frame context according to newest
> > kernel spec
> >   * @dirty:		state of each frame context
> > + * @local_vsi:		local instance vsi information
> >   * @init_vsi:		vsi used for initialized VP9 instance
> >   * @vsi:		vsi used for decoding/flush ...
> >   * @core_vsi:		vsi used for Core stage
> > @@ -482,6 +483,8 @@ struct vdec_vp9_slice_instance {
> >  	struct v4l2_vp9_frame_context frame_ctx_helper;
> >  	unsigned char dirty[4];
> >  
> > +	struct vdec_vp9_slice_vsi local_vsi;
> > +
> >  	/* MicroP vsi */
> >  	union {
> >  		struct vdec_vp9_slice_init_vsi *init_vsi;
> > @@ -1616,16 +1619,10 @@ static int
> > vdec_vp9_slice_update_single(struct vdec_vp9_slice_instance
> > *instance
> >  }
> >  
> >  static int vdec_vp9_slice_update_lat(struct
> > vdec_vp9_slice_instance *instance,
> > -				     struct vdec_lat_buf *lat_buf,
> > -				     struct vdec_vp9_slice_pfc *pfc)
> > +				     struct vdec_vp9_slice_vsi *vsi)
> >  {
> > -	struct vdec_vp9_slice_vsi *vsi;
> > -
> > -	vsi = &pfc->vsi;
> > -	memcpy(&pfc->state[0], &vsi->state, sizeof(vsi->state));
> > -
> >  	mtk_vcodec_debug(instance, "Frame %u LAT CRC 0x%08x %lx %lx\n",
> > -			 pfc->seq, vsi->state.crc[0],
> > +			 (instance->seq - 1), vsi->state.crc[0],
> >  			 (unsigned long)vsi->trans.dma_addr,
> >  			 (unsigned long)vsi->trans.dma_addr_end);
> >  
> > @@ -2090,6 +2087,13 @@ static int vdec_vp9_slice_lat_decode(void
> > *h_vdec, struct mtk_vcodec_mem *bs,
> >  		return ret;
> >  	}
> >  
> > +	if (IS_VDEC_INNER_RACING(instance->ctx->dev->dec_capability)) {
> > +		vdec_vp9_slice_vsi_from_remote(vsi, instance->vsi, 0);
> > +		memcpy(&instance->local_vsi, vsi, sizeof(*vsi));
> > +		vdec_msg_queue_qbuf(&ctx->dev->msg_queue_core_ctx,
> > lat_buf);
> > +		vsi = &instance->local_vsi;
> > +	}
> > +
> >  	if (instance->irq) {
> >  		ret = mtk_vcodec_wait_for_done_ctx(ctx,	MTK_INST_IR
> > Q_RECEIVED,
> >  						   WAIT_INTR_TIMEOUT_MS
> > , MTK_VDEC_LAT0);
> > @@ -2102,22 +2106,25 @@ static int vdec_vp9_slice_lat_decode(void
> > *h_vdec, struct mtk_vcodec_mem *bs,
> >  	}
> >  
> >  	vdec_vp9_slice_vsi_from_remote(vsi, instance->vsi, 0);
> > -	ret = vdec_vp9_slice_update_lat(instance, lat_buf, pfc);
> > +	ret = vdec_vp9_slice_update_lat(instance, vsi);
> >  
> > -	/* LAT trans full, no more UBE or decode timeout */
> > -	if (ret) {
> > -		mtk_vcodec_err(instance, "VP9 decode error: %d\n",
> > ret);
> > -		return ret;
> > -	}
> > +	if (!IS_VDEC_INNER_RACING(instance->ctx->dev->dec_capability))
> > +		/* LAT trans full, no more UBE or decode timeout */
> > +		if (ret) {
> > +			mtk_vcodec_err(instance, "frame[%d] decode
> > error: %d\n",
> > +				       ret, (instance->seq - 1));
> > +			return ret;
> > +		}
> >  
> > -	mtk_vcodec_debug(instance, "lat dma addr: 0x%lx 0x%lx\n",
> > -			 (unsigned long)pfc->vsi.trans.dma_addr,
> > -			 (unsigned long)pfc->vsi.trans.dma_addr_end);
> >  
> > -	vdec_msg_queue_update_ube_wptr(&ctx->msg_queue,
> > -				       vsi->trans.dma_addr_end +
> > -				       ctx-
> > >msg_queue.wdma_addr.dma_addr);
> > -	vdec_msg_queue_qbuf(&ctx->dev->msg_queue_core_ctx, lat_buf);
> > +	vsi->trans.dma_addr_end += ctx->msg_queue.wdma_addr.dma_addr;
> > +	vdec_msg_queue_update_ube_wptr(&ctx->msg_queue, vsi-
> > >trans.dma_addr_end);
> > +	if (!IS_VDEC_INNER_RACING(instance->ctx->dev->dec_capability))
> > +		vdec_msg_queue_qbuf(&ctx->dev->msg_queue_core_ctx,
> > lat_buf);
> > +
> > +	mtk_vcodec_debug(instance, "lat trans end addr(0x%lx), ube
> > start addr(0x%lx)\n",
> > +			 (unsigned long)vsi->trans.dma_addr_end,
> > +			 (unsigned long)ctx-
> > >msg_queue.wdma_addr.dma_addr);
> >  
> >  	return 0;
> >  }
> > @@ -2193,10 +2200,14 @@ static int
> > vdec_vp9_slice_core_decode(struct vdec_lat_buf *lat_buf)
> >  		goto err;
> >  	}
> >  
> > -	pfc->vsi.trans.dma_addr_end += ctx-
> > >msg_queue.wdma_addr.dma_addr;
> >  	mtk_vcodec_debug(instance, "core dma_addr_end 0x%lx\n",
> >  			 (unsigned long)pfc->vsi.trans.dma_addr_end);
> > -	vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc-
> > >vsi.trans.dma_addr_end);
> > +
> > +	if (IS_VDEC_INNER_RACING(instance->ctx->dev->dec_capability))
> > +		vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc-
> > >vsi.trans.dma_addr);
> > +	else
> > +		vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc-
> > >vsi.trans.dma_addr_end);
> > +
> >  	ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf-
> > >src_buf_req);
> >  
> >  	return 0;
> > @@ -2204,7 +2215,12 @@ static int vdec_vp9_slice_core_decode(struct
> > vdec_lat_buf *lat_buf)
> >  err:
> >  	if (ctx && pfc) {
> >  		/* always update read pointer */
> > -		vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc-
> > >vsi.trans.dma_addr_end);
> > +		if (IS_VDEC_INNER_RACING(instance->ctx->dev-
> > >dec_capability))
> > +			vdec_msg_queue_update_ube_rptr(&ctx->msg_queue,
> > +						       pfc-
> > >vsi.trans.dma_addr);
> > +		else
> > +			vdec_msg_queue_update_ube_rptr(&ctx->msg_queue,
> > +						       pfc-
> > >vsi.trans.dma_addr_end);
> >  
> >  		if (fb)
> >  			ctx->dev->vdec_pdata->cap_to_disp(ctx, 1,
> > lat_buf->src_buf_req);


