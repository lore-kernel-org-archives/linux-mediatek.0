Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AB6C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 07:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Of3F+7sPVVjfsHtBLdfkKfBmX3fY1czHUbh00fJZAUE=; b=IHpQFrZJ2Us2f3QaU+axah6ipM
	0wjPlFCnlf3tbkqpe7XnnYj2ELFBCQ2q9vFMW9s1Pnew7cF5OvK6fmBlcFF0DGDx568cpdUeDdScT
	kNTgm6RlFNJ7AA8g/2Yj1qJs8vzuwcWPo116Efdg2RMWjw0mVjQ8FLYFVJ9zKWM15UgtgrzleMI/w
	UuqJ37QFWrB0k+f6R09m5Gs1HJCExyeJJiW+1oB93PTQKVQj2jY+Gw8UX7HuIMzW8B64nS2+HH2vA
	XprP+DLmXiF+ABg5XmTuknO3464TtjK0osJJYmYTSlpQiJYdYQfk8Y7wq+QQhSzC6UW+r+B3wf4M8
	nhRsIc8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeA0y-007gjN-2M; Fri, 30 Sep 2022 07:00:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeA0l-007geG-7X; Fri, 30 Sep 2022 07:00:41 +0000
X-UUID: c13357ebbf9c4634b3a39da1a7499e35-20220930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=Of3F+7sPVVjfsHtBLdfkKfBmX3fY1czHUbh00fJZAUE=;
	b=bDo2qFqa/2Ci1EsPqzdagbjS1wcInvYNSPmaxh0qb6XhQCi/Soh0H+uQKepV7HR87lw81D6l/LYV+pNC5aNBnyonH75DdDwelSijxWQsz8WVOAkO+rmE8F4fIl7Md92dNv6IE3lJM9QTyBemfZrPJpjDTxfP9ZA8JoJXDJw3ndU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:8eaedf73-5aa0-45fa-a1e6-ed4b7cd810df,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:2cb999a3-dc04-435c-b19b-71e131a5fc35,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c13357ebbf9c4634b3a39da1a7499e35-20220930
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xiaoyong.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1028373228; Fri, 30 Sep 2022 00:00:07 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 30 Sep 2022 14:19:28 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 30 Sep 2022 14:19:27 +0800
Message-ID: <75bbf320eb1c54d2834012c1aafcc87105204e8d.camel@mediatek.com>
Subject: Re: [RFC PATCH v3] media: mediatek: vcodec: support stateless AV1
 decoder
From: "xiaoyong.lu@mediatek.com" <xiaoyong.lu@mediatek.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, Yunfei Dong
	<yunfei.dong@mediatek.com>, Alexandre Courbot <acourbot@chromium.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
	Steve Cho <stevecho@chromium.org>, <srv_heupstream@mediatek.com>,
	<devicetree@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-media@vger.kernel.org>
Date: Fri, 30 Sep 2022 14:19:26 +0800
In-Reply-To: <927f95dd-283a-a3c0-6c2f-41a36bcc42ef@collabora.com>
References: <20220901110416.21191-1-xiaoyong.lu@mediatek.com>
	 <927f95dd-283a-a3c0-6c2f-41a36bcc42ef@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_000039_295409_33DDF369 
X-CRM114-Status: GOOD (  32.04  )
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

Dear Daniel,
Thanks for your good suggestion!

I have updated v4 to fix
your comment.

Changes from v3:

- modify comment for struct vdec_av1_slice_slot
- add define SEG_LVL_ALT_Q
- change use_lr/use_chroma_lr parse from av1 spec
- use ARRAY_SIZE to replace size for loop_filter_level and
loop_filter_mode_deltas
- change array size of loop_filter_mode_deltas from 4 to 2
- add define SECONDARY_FILTER_STRENGTH_NUM_BITS
- change some hex values from upper case to lower case
- change *dpb_sz equal to V4L2_AV1_TOTAL_REFS_PER_FRAME + 1
- convert vb2_find_timestamp to vb2_find_buffer
- test by av1 fluster, result is 173/239

detail in link:

https://patchwork.kernel.org/project/linux-mediatek/patch/20220930033000.22579-1-xiaoyong.lu@mediatek.com/


thanks !
Xiaoyong Lu

On Thu, 2022-09-22 at 13:36 -0300, Daniel Almeida wrote:
> Hi Xiaoyong.
> 
> Comments below (other code removed for brevity)
> 
> +/**
> + * struct vdec_av1_slice_slot - slot info need save in global
> instance
> + * @frame_info: frame info for each slot
> + * @timestamp:  time stamp info
> + */
> +struct vdec_av1_slice_slot {
> +	struct vdec_av1_slice_frame_info
> frame_info[AV1_MAX_FRAME_BUF_COUNT];
> +	u64 timestamp[AV1_MAX_FRAME_BUF_COUNT];
> +};
> 
> nit: slot info that needs to be saved in the global instance
> 
> +static int vdec_av1_slice_get_qindex(struct 
> vdec_av1_slice_uncompressed_header *uh,
> +				     int segmentation_id)
> +{
> +	struct vdec_av1_slice_seg *seg = &uh->seg;
> +	struct vdec_av1_slice_quantization *quant = &uh->quant;
> +	int data = 0, qindex = 0;
> +
> +	if (seg->segmentation_enabled &&
> +	    (seg->feature_enabled_mask[segmentation_id] & BIT(0))) {
> +		data = seg->feature_data[segmentation_id][0];
> 
> 
> Maybe you should replace the 0 above by SEG_LVL_ALT_Q to be more 
> explicit. Same goes for BIT(0).
> 
> +static void vdec_av1_slice_setup_lr(struct vdec_av1_slice_lr *lr,
> +				    struct
> v4l2_av1_loop_restoration  *ctrl_lr)
> +{
> +	int i;
> +
> +	for (i = 0; i < V4L2_AV1_NUM_PLANES_MAX; i++) {
> +		lr->frame_restoration_type[i] = ctrl_lr-
> >frame_restoration_type[i];
> +		lr->loop_restoration_size[i] = ctrl_lr-
> >loop_restoration_size[i];
> +	}
> +	lr->use_lr = !!lr->frame_restoration_type[0];
> +	lr->use_chroma_lr = !!lr->frame_restoration_type[1];
> +}
> 
>  From a first glance, this looks a bit divergent from the spec?
> 
> for ( i = 0; i < NumPlanes; i++ ) {
>      lr_type
>      FrameRestorationType[i] = Remap_Lr_Type[lr_type]
>      if ( FrameRestorationType[i] != RESTORE_NONE ) {
>          UsesLr = 1
>          if ( i > 0 ) {
>              usesChromaLr = 1
>          }
>      }
> }
> 
> I will include these two variables in the next iteration of the uapi
> if 
> computing them in the driver is problematic.
> 
> +static void vdec_av1_slice_setup_lf(struct
> vdec_av1_slice_loop_filter *lf,
> +				    struct v4l2_av1_loop_filter
> *ctrl_lf)
> +{
> +	int i;
> +
> +	for (i = 0; i < 4; i++)
> +		lf->loop_filter_level[i] = ctrl_lf->level[i];
> +
> +	for (i = 0; i < V4L2_AV1_TOTAL_REFS_PER_FRAME; i++)
> +		lf->loop_filter_ref_deltas[i] = ctrl_lf->ref_deltas[i];
> +
> +	for (i = 0; i < 2; i++)
> +		lf->loop_filter_mode_deltas[i] = ctrl_lf-
> >mode_deltas[i];
> +
> +	lf->loop_filter_sharpness = ctrl_lf->sharpness;
> +	lf->loop_filter_delta_enabled =
> +		   BIT_FLAG(ctrl_lf,
> V4L2_AV1_LOOP_FILTER_FLAG_DELTA_ENABLED);
> +}
> 
> Maybe ARRAY_SIZE can be of use in the loop indices here?
> 
> +static void vdec_av1_slice_setup_cdef(struct vdec_av1_slice_cdef
> *cdef,
> +				      struct v4l2_av1_cdef *ctrl_cdef)
> +{
> +	int i;
> +
> +	cdef->cdef_damping = ctrl_cdef->damping_minus_3 + 3;
> +	cdef->cdef_bits = ctrl_cdef->bits;
> +
> +	for (i = 0; i < V4L2_AV1_CDEF_MAX; i++) {
> +		if (ctrl_cdef->y_sec_strength[i] == 4)
> +			ctrl_cdef->y_sec_strength[i] -= 1;
> +
> +		if (ctrl_cdef->uv_sec_strength[i] == 4)
> +			ctrl_cdef->uv_sec_strength[i] -= 1;
> +
> +		cdef->cdef_y_strength[i] = ctrl_cdef->y_pri_strength[i] 
> << 2 |
> +					   ctrl_cdef-
> >y_sec_strength[i];
> +		cdef->cdef_uv_strength[i] = ctrl_cdef-
> >uv_pri_strength[i] << 2 |
> +					    ctrl_cdef-
> >uv_sec_strength[i];
> +	}
> +}
> 
> Maybe:
> 
> #define SECONDARY_FILTER_STRENGTH_NUM_BITS 2
> 
> +		cdef->cdef_y_strength[i] = ctrl_cdef->y_pri_strength[i] 
> << 
> SECONDARY_FILTER_STRENGTH_NUM_BITS |
> +					   ctrl_cdef-
> >y_sec_strength[i];
> +		cdef->cdef_uv_strength[i] = ctrl_cdef-
> >uv_pri_strength[i] << 
> SECONDARY_FILTER_STRENGTH_NUM_BITS |
> +					    ctrl_cdef-
> >uv_sec_strength[i];
> 
> This should make it clearer.
> 
> +		sb_boundary_x_m1 =
> +			(tile->mi_col_starts[tile_col + 1] - tile-
> >mi_col_starts[tile_col] - 
> 1) &
> +			0x3F;
> +		sb_boundary_y_m1 =
> +			(tile->mi_row_starts[tile_row + 1] - tile-
> >mi_row_starts[tile_row] - 
> 1) &
> +			0x1FF;
> +
> 
> IIRC there's a preference for lower case hex values in the media
> subsystem.
> 
> +static void vdec_av1_slice_get_dpb_size(struct
> vdec_av1_slice_instance 
> *instance, u32 *dpb_sz)
> +{
> +	/* refer av1 specification */
> +	*dpb_sz = 9;
> +}
> 
> That's actually defined as 8 in the spec, i.e.:
> 
> NUM_REF_FRAMES 8 Number of frames that can be stored for future
> reference.
> 
> It's helpful to indicate the section if you reference the
> specification, 
> as it makes it easier for the reviewer to cross check.
> 
> +	/* get buffer address from vb2buf */
> +	for (i = 0; i < V4L2_AV1_REFS_PER_FRAME; i++) {
> +		struct vdec_av1_slice_fb *vref = &vsi->ref[i];
> +		int idx = vb2_find_timestamp(vq, pfc->ref_idx[i], 0);
> 
> Needs to be converted to vb2_find_buffer in light of 
> 
https://lore.kernel.org/lkml/20220706182657.210650-3-ezequiel@vanguardiasur.com.ar/T/
> 
> -- Daniel
> 


