Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98292C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 18:55:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B10561373
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 18:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B10561373
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VEVJlgwA30NfBBdU/8k7zi4WHiQw5EUXoBuvaSXTUFk=; b=Oec196dYu/lWnD
	rk/9/jOoAUrapIP8G/5TpQn7kACQsudR1utHToG7wYD9c3+KOTksDl5jgdhNFi55y5k1gDwejml08
	LAk6YSOpgmoEqaLKLgUVaO995cPg9ByHmBw0KuZvv2WosoHaOqjO0HZpAK+9yssYD14hj5t1LxrhK
	JR9xFYtcl4+M24FFCHEsZ9Ho2rhs8ETYGCZxPX5tWiH6SgVvIe9cTwPackrTbnMJxu8dtGeVH16qc
	Kdllgg+H/gfuml6aaP7I7sXCYMMRoHzTi/oeUgHrNkjU6lunzn3h46euOpD8bbfnXmRIV6T/RZnvJ
	lrLXBzx7pEKi6Qz1OadQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIbZs-004QLb-V3; Tue, 24 Aug 2021 18:55:17 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIbZc-004QIV-KC
 for linux-mediatek@lists.infradead.org; Tue, 24 Aug 2021 18:55:03 +0000
Received: by mail-pf1-x42b.google.com with SMTP id v123so4474663pfb.11
 for <linux-mediatek@lists.infradead.org>; Tue, 24 Aug 2021 11:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ejbmRhsl8eEDMqOR7QsW6DWjxRhBPlTC6UD85b2Pd5Q=;
 b=kNsugfaWB0H/9sPnfoLhZ9nefDvQnoBFWQuUmPR4LiwAcXn1pIl0qkofQVNOXvPMB+
 kCgEniCrmIVdYtN1JwtMGOxMgerr/LA+FfrCAAsCmO7vLcYY7/F2tKGWorVgzQLWXa3z
 pAFhAFub+AMG/T5C54Wim81sLTRYtleoU2FRwpFJb67XTrBPUpbTzxWpKGQ/q2Rljoy4
 SyZWHqHMs0jl743Bo4Vpt+ifIxfC/B+xQhdQfKLkbMNsiY2aZWNw7w2g1gtCmDeqb8+5
 P0Mz8G/9zcMUuTT0RgBeWyiAIakQnfWpHop8hyjmIP0D3AgOkjoXjBFhSXNBzCES38tM
 iUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ejbmRhsl8eEDMqOR7QsW6DWjxRhBPlTC6UD85b2Pd5Q=;
 b=kV5WoFCacPXPEhTx23FmwjDhFmNhuNBEDkZXi7lBcjI2ydX8rNn13ARNj/yKmuK1Ex
 vLhs6wGkbqocUI9MUlbyE1QynIBbK354RDQYLTCdQKmFV/Mv4XeKKzwbFa9StYrEtLqQ
 Xo8raL9Z6G5Ft6/03PVgNl59upiGolXU5OrVItTnwfYKD47eB5qZ2ctgrHI9WitO51aW
 jFxkCEqwJodH0D8lfe6nBrI3zKHTBGrAPLn/O/ov2q4Th0G7D0TCLip/cvwkwDvqMK8q
 faiKR5Kej8qhsPLHdvYBYhhQTLy8rojQpZ2jMENCMWCF3+bITP0UfNDheD1mwpJEyj1y
 oDTQ==
X-Gm-Message-State: AOAM5324Ax3xgJIcy5/NaYVR7LrQb//PMuE11Mr+lA8Hmq7Rn7nxsfpy
 NEgEYnI4z2lB2GKVZ6yJhE1YBQ==
X-Google-Smtp-Source: ABdhPJzluksJ5TfJKXl7vWcFB/DM2Kcv0sl121p0v3FHEV7C+1JBJSeJc28kJ4/SuoYwwAVqlQOtnw==
X-Received: by 2002:a62:5c6:0:b029:341:e0b1:a72c with SMTP id
 189-20020a6205c60000b0290341e0b1a72cmr40745680pff.71.1629831298934; 
 Tue, 24 Aug 2021 11:54:58 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:4a93:46f4:da9a:4371])
 by smtp.gmail.com with ESMTPSA id 21sm19775743pfh.103.2021.08.24.11.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 11:54:58 -0700 (PDT)
Date: Wed, 25 Aug 2021 02:54:53 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Irui Wang <irui.wang@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Alexandre Courbot <acourbot@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Yong Wu <yong.wu@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 6/9] media: mtk-vcodec: Add new venc drv interface for
 frame_racing mode
Message-ID: <YSVAfbC93/PzPuuZ@google.com>
References: <20210816105934.28265-1-irui.wang@mediatek.com>
 <20210816105934.28265-7-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210816105934.28265-7-irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_115500_747066_D1ABF03F 
X-CRM114-Status: GOOD (  23.65  )
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

On Mon, Aug 16, 2021 at 06:59:31PM +0800, Irui Wang wrote:
> Frame-racing mode encoding need more venc working buffers, it
> will break the compatibility if we just add venc_vsi in AP-Kernel
> but not in firmware, so add a new venc driver interface to
> distinguish the sigle_core_mode and frame_racing mode.
> 
> The new driver interface can be used for different codecs in
> the future.
The patch contains more code than the commit message explains that I couldn't understand.  Only find some nits.

> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
> @@ -9,6 +9,7 @@
>  
>  #include "mtk_vcodec_drv.h"
>  #include "mtk_vcodec_util.h"
> +#include "mtk_vcodec_enc_hw.h"
Please try to maintain the order.

> +void __iomem *mtk_get_venc_comp_reg_addr(struct mtk_vcodec_ctx *data,
> +					 unsigned int hw_id)
> +{
> +	struct mtk_vcodec_ctx *ctx = (struct mtk_vcodec_ctx *)data;
typeof(ctx) == typeof(data), rename the function argument 'data' to 'ctx'.

> +static int venc_alloc_work_buf(struct venc_common_inst *inst)
> +{
> +	int i;
> +	int ret = 0;
It doesn't need to be initialized.  See comment below.

> +	mtk_vcodec_debug_leave(inst);
> +
> +	return ret;
It is more clear if just return 0 here.  In the meantime, ret doesn't need to be initialized.

> +static unsigned int venc_wait_comp_done(struct venc_common_inst *inst,
> +					unsigned int hw_id)
> +{
> +	unsigned int irq_status = 0;
> +	struct mtk_vcodec_ctx *ctx = (struct mtk_vcodec_ctx *)inst->ctx;
No need to cast.

> +static int venc_encode_sps(struct venc_common_inst *inst,
> +			   struct mtk_vcodec_mem *bs_buf,
> +			   unsigned int *bs_size)
> +{
> +	int ret = 0;
Same.

> +	*bs_size = venc_read_reg(inst, VENC_PIC_BITSTREAM_BYTE_CNT,
> +				 MTK_VENC_CORE0);
> +	mtk_vcodec_debug(inst, "bs size %d <-", *bs_size);
> +
> +	return ret;
Same.

> +static int venc_encode_pps(struct venc_common_inst *inst,
> +			   struct mtk_vcodec_mem *bs_buf,
> +			   unsigned int *bs_size)
> +{
> +	int ret = 0;
Same.

> +	*bs_size = venc_read_reg(inst, VENC_PIC_BITSTREAM_BYTE_CNT,
> +				 MTK_VENC_CORE0);
> +	mtk_vcodec_debug(inst, "bs size %d <-", *bs_size);
> +
> +	return ret;
Same.

> +static int venc_encode_header(struct venc_common_inst *inst,
> +			      struct mtk_vcodec_mem *bs_buf,
> +			      unsigned int *bs_size)
> +{
> +	int ret = 0;
Same.

> +	memcpy(bs_buf->va + bs_size_sps, inst->pps_buf.va, bs_size_pps);
> +	*bs_size = bs_size_sps + bs_size_pps;
> +
> +	return ret;
Same.

> +static int venc_encode_frame(struct venc_common_inst *inst,
> +			     struct venc_frm_buf *frm_buf,
> +			     struct mtk_vcodec_mem *bs_buf,
> +			     unsigned int *bs_size,
> +			     int hw_id)
> +{
> +	int ret = 0;
Same.

> +	++inst->frm_cnt;
> +	mtk_vcodec_debug(inst, "frm %d bs_size %d key_frm %d <-",
> +			 inst->frm_cnt, *bs_size, inst->vpu_inst.is_key_frm);
> +
> +	return ret;
Same.

> +static void h264_encode_filler(struct venc_common_inst *inst, void *buf,
> +			       int size)
> +{
> +	unsigned char *p = buf;
> +
> +	if (size < H264_FILLER_MARKER_SIZE) {
> +		mtk_vcodec_err(inst, "filler size too small %d", size);
> +		return;
> +	}
> +
> +	memcpy(p, h264_filler_marker, ARRAY_SIZE(h264_filler_marker));
Replace ARRAY_SIZE(h264_filler_marker) to H264_FILLER_MARKER_SIZE.

> +static int venc_init(struct mtk_vcodec_ctx *ctx)
> +{
> +	int i;
> +	int ret = 0;
> +	struct venc_common_inst *inst;
> +
> +	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
> +	if (!inst)
> +		return -ENOMEM;
> +
> +	inst->ctx = ctx;
> +	inst->vpu_inst.ctx = ctx;
> +	inst->vpu_inst.id = SCP_IPI_VENC_H264;
> +
> +	mtk_vcodec_debug_enter(inst);
> +
> +	ret = vpu_enc_init(&inst->vpu_inst);
> +
> +	inst->vsi = (struct venc_vsi *)inst->vpu_inst.vsi;
No need to cast.

> +static int venc_encode(void *handle,
> +		       enum venc_start_opt opt,
> +		       struct venc_frm_buf *frm_buf,
> +		       struct mtk_vcodec_mem *bs_buf,
> +		       struct venc_done_result *result)
> +{
> +	int ret;
> +	struct venc_common_inst *inst = (struct venc_common_inst *)handle;
No need to cast.

> +	default:
> +		mtk_vcodec_err(inst, "venc_start_opt %d not supported", opt);
> +		return -EINVAL;
> +	}
> +
> +	return ret;
It is more clear if just return 0 here.

> +static int venc_set_param(void *handle,
> +			  enum venc_set_param_type type,
> +			  struct venc_enc_param *enc_prm)
> +{
> +	int ret = 0;
> +	struct venc_common_inst *inst = (struct venc_common_inst *)handle;
No need to cast.

> +static int venc_deinit(void *handle)
> +{
> +	int ret = 0;
Same.

> +	struct venc_common_inst *inst = (struct venc_common_inst *)handle;
No need to cast.

> +	mtk_vcodec_debug_leave(inst);
> +	kfree(inst);
> +
> +	return ret;
Same.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
