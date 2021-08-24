Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D38C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 19:21:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 000E66113A
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 19:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 000E66113A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=16Z8k6+Nbv2olSuZCbB7vcyx0NeN5CQ8lc+RH6IbbDA=; b=O5dUvJx9Ck793C
	JWcse1CV0AgZggEQRvwpK6wIVOOCLU3alIfKRhZPNgMb1L4WRWrdnt/VuHnWSU25MLuwX9qkZE+St
	HhD7DhYFh7kfCGZlybFFqZRlABdn5tRGkMrtsrzZj+qRAFSt56sJGhHq3HFBhiJxTyJObHKjTjxqu
	O2eXqiU90c7gHgm5RpV0gp92bzJ4P5pdtaSKLjycScomYEle+ABOp7Fj4nZCJkbozFy3zMLXwRN/7
	TCJ5r7XMuFOPfbVusnN02SFGpolRvSp9VXSv4E/BY0uu/GHXQGvSs6A32dozGyFBdHVft0uKf6//Q
	xOZPu7HcELF8K25aaf+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIbyl-004WZm-5D; Tue, 24 Aug 2021 19:20:59 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIbyY-004WWj-7E
 for linux-mediatek@lists.infradead.org; Tue, 24 Aug 2021 19:20:47 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 28-20020a17090a031cb0290178dcd8a4d1so2539564pje.0
 for <linux-mediatek@lists.infradead.org>; Tue, 24 Aug 2021 12:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mVPoYVWoIvb5FZ8mV7/5paxx0nV7NsVnW/KlyUCKuhA=;
 b=ItO9aTgPCLyylgqQH5P4MQ6LZ82koN27g+C017e7/xl7kVMH5aX3KWis8yt4wUVkjz
 wXxAZo1Q8eLMiOAddoLWaM84tLRf81rhbCmAohc/2+/UwUqeEdhOAiL2+G12JlKhzbpH
 ekC6QRzWvElQU52222Pns750NpbfIXJVUjyIbd4tPpOEExnSXybjVvgl56ljNmeLDmUN
 esoFzVFtQVpkl3aOw9YJyy9pQN97CxAds/fk+M8Q7QfvwMGmer7737do2vcvZU5l+FuF
 DbHrw2ZIHuglgesi++0vAVfK3geqR/zo/P07zpo8GBT95HUJApgtaMVW1g0nSBFqGu82
 wQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mVPoYVWoIvb5FZ8mV7/5paxx0nV7NsVnW/KlyUCKuhA=;
 b=p0jL1N1hR7cJCz+Xyzrs7TNQB8axmMtxTdcVqUyGVmXfmvHymEYfigq1uzxnAKge0A
 uGVexQuufs3+6JgSjbYfuo/hCXZ4y+VqaDs7XayEqP75/wnce9iDSosZ/1o0rr/+sRRV
 wRio11yQn3361sc23ftZOQuB9LFW/vcjmH381XpJ8anEsJ/pVHRtd2kGruCo4tGsSWUr
 5e01s39RFebjtkOotBdqsO39zoc7cr3/d50s7r6uR+PP0vcPHZoT15P4Q2vyaixiTjid
 9k0YSclaK/b+mVR5p+ZiY7LpA+K6CgxLkfm+cRpnPR0EgWChi+bdnehFH71sxocX2W2o
 HkWQ==
X-Gm-Message-State: AOAM532mZfOQcjsvHVDSzIpHriWe56kvYLHKpOIW4YCc7Po80r4Vc3Er
 oUZPENQQXU9R3dDVEtnacQ96+A==
X-Google-Smtp-Source: ABdhPJzSrMM4MxmIH6A8jSFtIdKi3nUJc7HYA8i2icWXwYCfSIFFuVlTcRtN6GWtJN/aAKArKjaNiw==
X-Received: by 2002:a17:902:e0cc:b0:134:7191:f39 with SMTP id
 e12-20020a170902e0cc00b0013471910f39mr10468342pla.36.1629832844892; 
 Tue, 24 Aug 2021 12:20:44 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:4a93:46f4:da9a:4371])
 by smtp.gmail.com with ESMTPSA id 22sm23515422pgn.88.2021.08.24.12.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 12:20:44 -0700 (PDT)
Date: Wed, 25 Aug 2021 03:20:39 +0800
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
Subject: Re: [PATCH 7/9] media: mtk-vcodec: Add frame racing mode encode
 process
Message-ID: <YSVGh0/6mAgHFmPb@google.com>
References: <20210816105934.28265-1-irui.wang@mediatek.com>
 <20210816105934.28265-8-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210816105934.28265-8-irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_122046_335336_D088209F 
X-CRM114-Status: GOOD (  20.86  )
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

On Mon, Aug 16, 2021 at 06:59:32PM +0800, Irui Wang wrote:
> The frame_racing mode encoding is try to use the two venc cores:
s/is try/tries/

> frame#0 use core#0, frame#1 use core#1, frame#2 use core#0...,
s/use/uses/g

> Lock the device and enabe the clock by used core, for sequence
s/enabe/enable/

> header encoding, it always used core#0.
s/used/uses/

> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -273,6 +273,7 @@ struct vdec_pic_info {
>   * @decoded_frame_cnt: number of decoded frames
>   * @lock: protect variables accessed by V4L2 threads and worker thread such as
>   *	  mtk_video_dec_buf.
> + * @enc_idx: used to record encoded frame count
>   */
>  struct mtk_vcodec_ctx {
>  	enum mtk_instance_type type;
> @@ -313,6 +314,8 @@ struct mtk_vcodec_ctx {
>  	int decoded_frame_cnt;
>  	struct mutex lock;
>  
> +	int hw_id;
> +	int enc_idx;
hw_id lacks of kerneldoc which could introduce smatch warning.

> --- a/drivers/media/platform/mtk-vcodec/venc_drv_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc_drv_if.c
> @@ -15,6 +15,7 @@
>  
>  #include "mtk_vcodec_enc.h"
>  #include "mtk_vcodec_enc_pm.h"
> +#include "mtk_vcodec_enc_hw.h"
Please try to maintain the order.

> @@ -34,9 +35,9 @@ int venc_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
>  		return -EINVAL;
>  	}
>  
> -	mtk_venc_lock(ctx);
> +	mtk_venc_lock(ctx, 0);
Does it make more sense to use ctx->hw_id instead 0 (even if it is always 0 in the path)?

>  	ret = ctx->enc_if->init(ctx);
> -	mtk_venc_unlock(ctx);
> +	mtk_venc_unlock(ctx, 0);
Same.

> @@ -46,9 +47,9 @@ int venc_if_set_param(struct mtk_vcodec_ctx *ctx,
>  {
>  	int ret = 0;
>  
> -	mtk_venc_lock(ctx);
> +	mtk_venc_lock(ctx, 0);
Same.

>  	ret = ctx->enc_if->set_param(ctx->drv_handle, type, in);
> -	mtk_venc_unlock(ctx);
> +	mtk_venc_unlock(ctx, 0);
Same.

> @@ -87,11 +76,67 @@ int venc_if_deinit(struct mtk_vcodec_ctx *ctx)
>  	if (!ctx->drv_handle)
>  		return 0;
>  
> -	mtk_venc_lock(ctx);
> +	mtk_venc_lock(ctx, 0);
Same.

>  	ret = ctx->enc_if->deinit(ctx->drv_handle);
> -	mtk_venc_unlock(ctx);
> +	mtk_venc_unlock(ctx, 0);
Same.

> +void venc_encode_unprepare(struct mtk_vcodec_ctx *ctx,
> +			   enum venc_start_opt opt)
> +{
> +	unsigned long flags;
> +	struct mtk_venc_comp_dev *venc;
> +
> +	/*clock off and unlock after irq done*/
> +	if (ctx->dev->venc_pdata->hw_mode == VENC_FRAME_RACING_MODE) {
> +		if (opt == VENC_START_OPT_ENCODE_SEQUENCE_HEADER) {
> +			mtk_vcodec_enc_clock_off(ctx->dev, ctx->hw_id);
> +			spin_lock_irqsave(&ctx->dev->irqlock, flags);
> +			venc = ctx->dev->enc_comp_dev[ctx->hw_id];
> +			venc->curr_ctx = NULL;
> +			spin_unlock_irqrestore(&ctx->dev->irqlock, flags);
> +			mtk_venc_unlock(ctx, ctx->hw_id);
> +		}
> +	} else {
> +		mtk_vcodec_enc_clock_off(ctx->dev, ctx->hw_id);
> +		spin_lock_irqsave(&ctx->dev->irqlock, flags);
> +		ctx->dev->curr_ctx = NULL;
> +		spin_unlock_irqrestore(&ctx->dev->irqlock, flags);
> +		mtk_venc_unlock(ctx, ctx->hw_id);
The few statements are identical.  Should try to reuse them.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
