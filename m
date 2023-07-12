Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F93EB64D9
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jul 2023 10:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zIVoN8xJJ1apuh5u3RRjUDBxovBp1snddoUz1sWtVUc=; b=dWGhQb7A1Fe4tJhW/GR/lE5YM3
	jCyKwgUghuh/5bBsaBphhBxht6hQkpSX19YM03EEjGJQaVclrrl2ZC5DFtafDbny/LiO/pSXNuOTx
	kRY6EioEKCzCh1b3C04d5Ru7BIQM4Pk1Adlx0mkOy38dzQWe0MaY5/ZSJSo7i23i2Hew1O+tuMGX9
	Zvkj+1bnbwN7UJKm9dUdol7g/m5Ko6KzB5fsxwh/bJApKf1Zb05cgi2CpHH/KQHiusDn4f2gr7Dj6
	NBvnHY6SxkGRr3UcYQXnKAzu4XMdJzlat0SJOeUvcmZ1GgjtnZT+ULkoQrWQAzW7hye9s8aBNA4gC
	3kQ7Z5Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJXOK-00HK8o-27;
	Wed, 12 Jul 2023 10:48:16 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJXOH-00HK6t-29
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Jul 2023 10:48:15 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b8a8154f9cso4158515ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jul 2023 03:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689158887; x=1691750887;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zIVoN8xJJ1apuh5u3RRjUDBxovBp1snddoUz1sWtVUc=;
        b=BMvGqPrzLoLp9tbS8Yi6csf86apIKKPA5HWYXK9DYb8XNFkNsvZ0WDcihp4d25hQ11
         Kp4M7rgCghETeCFFVfSft7bWcb5rqBRLKR8vDgX2JBSsSWdZ+NwoRbLyRT0cAW48o5tx
         k8VWkqL4n8vyampu/AnPvTgSXMGnRjNu6zCuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689158887; x=1691750887;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zIVoN8xJJ1apuh5u3RRjUDBxovBp1snddoUz1sWtVUc=;
        b=AIn7zC00Jz9F1Muj2Lg/oXJPddPqbq0dm5FUuacgkxWyrqisXonNwPKW3UI/OzZvyR
         6FCN4X82XdolNFS8mR2K83pNCXuN2kXL66fzqBucgcCxNyM77Y+OYsShoUq5OveQ3NzJ
         eaAwWNgAKD+bloDgaMzjBqlIW0SlpAB/QlhGJywXyjDhAGyRS5uykY4NxmxIW9AwRx2v
         bpN/I31oiyNTY2x1pMpKU/7/Gzv4mQM2v7iGDbGhEuKCtD5uXX24/tBQGem+F5v2b3jA
         0vRZPHUCcZ34H4GoHjxmP34Zx/hhTtVJ2CR/ekEehaFbsT5hdt23wzYJRJk/vBUne15H
         0q+Q==
X-Gm-Message-State: ABy/qLbYVvCpfE9MV35PYUT6dEwl6xxnfJKWbBEi3oeUVmhCz4pjYc87
	l1ely4i33DXPnboaXlusP3kvhg==
X-Google-Smtp-Source: APBJJlEAi57Syr+e1VCEgUMbZ1p6tYBNaJWe5nyxeKIdojZAG0t41NYxzQsL8d3LNtrPXXR9NgKs8g==
X-Received: by 2002:a17:902:eccf:b0:1b8:5a42:5145 with SMTP id a15-20020a170902eccf00b001b85a425145mr1488788plh.31.1689158887019;
        Wed, 12 Jul 2023 03:48:07 -0700 (PDT)
Received: from chromium.org (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
        by smtp.gmail.com with ESMTPSA id io12-20020a17090312cc00b001b9dfa24523sm3622055plb.213.2023.07.12.03.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 03:48:06 -0700 (PDT)
Date: Wed, 12 Jul 2023 10:48:01 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Hsia-Jun Li <Randy.Li@synaptics.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	hverkuil-cisco@xs4all.nl, ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de, linux-rockchip@lists.infradead.org,
	mchehab@kernel.org, linux-staging@lists.linux.dev,
	ming.qian@nxp.com, kernel@collabora.com, gregkh@linuxfoundation.org,
	nicolas.dufresne@collabora.com
Subject: Re: [PATCH v3 04/11] media: videobuf2: Stop define VB2_MAX_FRAME as
 global
Message-ID: <20230712104801.tgawhexpm53ocgd6@chromium.org>
References: <20230622131349.144160-1-benjamin.gaignard@collabora.com>
 <20230622131349.144160-5-benjamin.gaignard@collabora.com>
 <e7444263-0ce5-1575-8cca-1e51b1cfbe9a@synaptics.com>
 <5cb3f216-5041-a155-5d2c-059dc1f15024@collabora.com>
 <25b21252-0d3a-3e50-0012-57055f386fee@synaptics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25b21252-0d3a-3e50-0012-57055f386fee@synaptics.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_034813_705757_ABD73452 
X-CRM114-Status: GOOD (  38.60  )
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

On Mon, Jul 03, 2023 at 04:35:30PM +0800, Hsia-Jun Li wrote:
> 
> On 7/3/23 16:09, Benjamin Gaignard wrote:
> > CAUTION: Email originated externally, do not click links or open
> > attachments unless you recognize the sender and know the content is
> > safe.
> > 
> > 
> > Le 30/06/2023 à 11:51, Hsia-Jun Li a écrit :
> > > 
> > > On 6/22/23 21:13, Benjamin Gaignard wrote:
> > > > CAUTION: Email originated externally, do not click links or open
> > > > attachments unless you recognize the sender and know the content is
> > > > safe.
> > > > 
> > > > 
> > > > After changing bufs arrays to a dynamic allocated array
> > > > VB2_MAX_FRAME doesn't mean anything for videobuf2 core.
> > > 
> > > I think make it 64 which is the VB2_MAX_FRAME in Android GKI kernel is
> > > more reasonable.
> > > 
> > > It would be hard to iterate the whole array, it would go worse with a
> > > filter. Such iterate may need to go twice because you mix
> > > post-processing buffer and decoding buffer(with MV) in the same array.
> > 
> > Here I don't want to change drivers behavior so I keep the same value.
> > If it happens that they need more buffers, like for dynamic resolution
> > change
> > feature for Verisilicon VP9 decoder, case by case patches will be needed.
> > 
> I just don't like the idea that using a variant length array here.
> 

"I don't like" is not an argument. We had a number of arguments for
using a generic helper (originally idr, but later decided to go with
XArray, because the former is now deprecated) that we pointed out in
our review comments for previous revisions. It wasn't really about the
size being variable, but rather avoiding open coding things in vb2 and
duplicating what's already implemented in generic code.

> And I could explain why you won't need so many buffers for the performance
> of decoding.
> 
> VP9 could support 10 reference frames in dpb.
> 
> Even for those frequent resolution changing test set, it would only happen
> to two resolutions,
> 
> 32 would be enough for 20 buffers of two resolution plus golden frames. It
> also leaves enough slots for re-order latency.
> 
> If your case had more two resolutions, likes low->medium->high.
> 
> I would suggest just skip the medium resolutions, just allocate the lower
> one first for fast playback then the highest for all the possible
> 
> medium cases. Reallocation happens frequently would only cause memory
> fragment, nothing benefits your performance.
> 

We have mechanisms in the kernel to deal with memory fragmentation
(migration/compaction) and it would still only matters for the
pathologic cases of hardware that require physically contiguous memory.
Modern hardware with proper DMA capabilities can either scatter-gather
or are equipped with an IOMMU, so the allocation always happens in page
granularity and fragmentation is avoided.

Best regards,
Tomasz

> > 
> > > 
> > > > Remove it from the core definitions but keep it for drivers internal
> > > > needs.
> > > > 
> > > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > > > ---
> > > >   drivers/media/common/videobuf2/videobuf2-core.c | 2 ++
> > > >   drivers/media/platform/amphion/vdec.c | 1 +
> > > > .../media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c | 2 ++
> > > >   drivers/media/platform/qcom/venus/hfi.h | 2 ++
> > > >   drivers/media/platform/verisilicon/hantro_hw.h | 2 ++
> > > >   drivers/staging/media/ipu3/ipu3-v4l2.c | 2 ++
> > > >   include/media/videobuf2-core.h | 1 -
> > > >   include/media/videobuf2-v4l2.h | 4 ----
> > > >   8 files changed, 11 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/common/videobuf2/videobuf2-core.c
> > > > b/drivers/media/common/videobuf2/videobuf2-core.c
> > > > index 86e1e926fa45..899783f67580 100644
> > > > --- a/drivers/media/common/videobuf2/videobuf2-core.c
> > > > +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> > > > @@ -31,6 +31,8 @@
> > > > 
> > > >   #include <trace/events/vb2.h>
> > > > 
> > > > +#define VB2_MAX_FRAME  32
> > > > +
> > > >   static int debug;
> > > >   module_param(debug, int, 0644);
> > > > 
> > > > diff --git a/drivers/media/platform/amphion/vdec.c
> > > > b/drivers/media/platform/amphion/vdec.c
> > > > index 3fa1a74a2e20..b3219f6d17fa 100644
> > > > --- a/drivers/media/platform/amphion/vdec.c
> > > > +++ b/drivers/media/platform/amphion/vdec.c
> > > > @@ -28,6 +28,7 @@
> > > > 
> > > >   #define VDEC_MIN_BUFFER_CAP            8
> > > >   #define VDEC_MIN_BUFFER_OUT            8
> > > > +#define VB2_MAX_FRAME                  32
> > > > 
> > > >   struct vdec_fs_info {
> > > >          char name[8];
> > > > diff --git
> > > > a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> > > > b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> > > > index 6532a69f1fa8..a1e0f24bb91c 100644
> > > > --- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> > > > +++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> > > > @@ -16,6 +16,8 @@
> > > >   #include "../vdec_drv_if.h"
> > > >   #include "../vdec_vpu_if.h"
> > > > 
> > > > +#define VB2_MAX_FRAME  32
> > > > +
> > > >   /* reset_frame_context defined in VP9 spec */
> > > >   #define VP9_RESET_FRAME_CONTEXT_NONE0 0
> > > >   #define VP9_RESET_FRAME_CONTEXT_NONE1 1
> > > > diff --git a/drivers/media/platform/qcom/venus/hfi.h
> > > > b/drivers/media/platform/qcom/venus/hfi.h
> > > > index f25d412d6553..bd5ca5a8b945 100644
> > > > --- a/drivers/media/platform/qcom/venus/hfi.h
> > > > +++ b/drivers/media/platform/qcom/venus/hfi.h
> > > > @@ -10,6 +10,8 @@
> > > > 
> > > >   #include "hfi_helper.h"
> > > > 
> > > > +#define VB2_MAX_FRAME                          32
> > > > +
> > > >   #define VIDC_SESSION_TYPE_VPE                  0
> > > >   #define VIDC_SESSION_TYPE_ENC                  1
> > > >   #define VIDC_SESSION_TYPE_DEC                  2
> > > > diff --git a/drivers/media/platform/verisilicon/hantro_hw.h
> > > > b/drivers/media/platform/verisilicon/hantro_hw.h
> > > > index e83f0c523a30..9e8faf7ba6fb 100644
> > > > --- a/drivers/media/platform/verisilicon/hantro_hw.h
> > > > +++ b/drivers/media/platform/verisilicon/hantro_hw.h
> > > > @@ -15,6 +15,8 @@
> > > >   #include <media/v4l2-vp9.h>
> > > >   #include <media/videobuf2-core.h>
> > > > 
> > > > +#define VB2_MAX_FRAME  32
> > > > +
> > > >   #define DEC_8190_ALIGN_MASK    0x07U
> > > > 
> > > >   #define MB_DIM                 16
> > > > diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c
> > > > b/drivers/staging/media/ipu3/ipu3-v4l2.c
> > > > index e530767e80a5..6627b5c2d4d6 100644
> > > > --- a/drivers/staging/media/ipu3/ipu3-v4l2.c
> > > > +++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
> > > > @@ -10,6 +10,8 @@
> > > >   #include "ipu3.h"
> > > >   #include "ipu3-dmamap.h"
> > > > 
> > > > +#define VB2_MAX_FRAME  32
> > > > +
> > > >   /******************** v4l2_subdev_ops ********************/
> > > > 
> > > >   #define IPU3_RUNNING_MODE_VIDEO                0
> > > > diff --git a/include/media/videobuf2-core.h
> > > > b/include/media/videobuf2-core.h
> > > > index 77921cf894ef..080b783d608d 100644
> > > > --- a/include/media/videobuf2-core.h
> > > > +++ b/include/media/videobuf2-core.h
> > > > @@ -20,7 +20,6 @@
> > > >   #include <media/media-request.h>
> > > >   #include <media/frame_vector.h>
> > > > 
> > > > -#define VB2_MAX_FRAME  (32)
> > > >   #define VB2_MAX_PLANES (8)
> > > > 
> > > >   /**
> > > > diff --git a/include/media/videobuf2-v4l2.h
> > > > b/include/media/videobuf2-v4l2.h
> > > > index 5a845887850b..88a7a565170e 100644
> > > > --- a/include/media/videobuf2-v4l2.h
> > > > +++ b/include/media/videobuf2-v4l2.h
> > > > @@ -15,10 +15,6 @@
> > > >   #include <linux/videodev2.h>
> > > >   #include <media/videobuf2-core.h>
> > > > 
> > > > -#if VB2_MAX_FRAME != VIDEO_MAX_FRAME
> > > > -#error VB2_MAX_FRAME != VIDEO_MAX_FRAME
> > > > -#endif
> > > > -
> > > >   #if VB2_MAX_PLANES != VIDEO_MAX_PLANES
> > > >   #error VB2_MAX_PLANES != VIDEO_MAX_PLANES
> > > >   #endif
> > > > -- 
> > > > 2.39.2
> > > > 
> -- 
> Hsia-Jun(Randy) Li
> 

