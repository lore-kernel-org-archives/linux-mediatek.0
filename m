Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F0FC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 07:36:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAA436143E
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 07:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAA436143E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ohQW+Fd6FAUcG4eYIhgnJqy0M0V2HdkJnpAjsfwg6g4=; b=SWCCaOBYkggVsPV1yjZqALknq
	nmAbKgxWfMvCKGTBI3bCc0UlIvQplxkxdioOQcmW4sDEnvzcbc3F0MAFDesYflNQMseaxELpnOiux
	U9P1EMAZ39cjgGtNprCdTOq5Ov7sbJkv14/LWEs7Tzbu1HsGKblnzWqKEeoE690LFK8kf3pJpEGKC
	8AVHVccvrET7yoXowMk7UKnRsWKEXjuaPMUOJrprt3VJ1J3Tn5/uuRmjQac5dZahHQ4TmEyssZF6C
	DRkxJOB9NDHtcn5lQTj9Grl4R0CCdIz/fczt5PUknDLLmU4gnd32+O2wmRNbdkRkMA0deNBzhnM15
	zG32U2h/Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc1DJ-005DnQ-WB; Thu, 29 Apr 2021 07:35:58 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc1DI-005Dn6-1i
 for linux-mediatek@desiato.infradead.org; Thu, 29 Apr 2021 07:35:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=e+nJscNVv3JQsbWlwn5P4urVvkcZ/Jr/l81JInVCgRw=; b=Ifk46o8qzYD6eEn0cvTInB2gkE
 kdHQXwYcLQyNsa19cyVLhpBz09lcBcoKxGByNm/vc91RxAYL8klGof5krMdrtsB6kwQVpmrunUsGg
 8z21j1cAaqpC+E3eeBlWE9qhSRobjEA3Vkg5K7+dpyPqjF802155aIWmseefT4Jajg84JyPZUgBXB
 8kCkHoB3pD6I30Pl0pK7p7QZlw/r1w3e/LgOCEKS8yEQHsicjeJBUB5JtcBC8VGaK7eAY2jXVP2UX
 QZBQR0C+JE3iaLHhuPKHr/GzSq/RCDYAGak5jTZakJghvlVTeGBZvD7Vt/EZ7J0/Mm1YmbQEM0x6S
 wRWW6zLw==;
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc1DD-000SIz-9m
 for linux-mediatek@lists.infradead.org; Thu, 29 Apr 2021 07:35:53 +0000
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud8.xs4all.net with ESMTPA
 id c1D6lpGQjiDzSc1DAlkTFj; Thu, 29 Apr 2021 09:35:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1619681749; bh=e+nJscNVv3JQsbWlwn5P4urVvkcZ/Jr/l81JInVCgRw=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=GVTSyQ24Ogjk7I4tcaOqHj0W0Att+FfuPHcIwMezqkIbVqhrMd/W5X4ncDoneaURz
 z2vD4hpyFjhRT4tdg3jI89Sc0LEnEC3he9AeSK7zlddKZKvubirLayp9QpllJv0OVr
 QfOWL1H/pPhLltuBzYQs+VbZJKTkcn3q+g6RDAqsiMLbK/8qPC4vVFdxhvBUalfqW9
 F5zzcwrDFVTsMMBDzLB9eTYB2YpJUG3904OAcKO/4nbrGutTLR0LAIzQltkewsDsR2
 MzRRfwqhs4EdZpwCo/ATM+aO4EKW005T8uQRAHdK3/xLC46BS4UsbrMvp+0zCCOH2c
 JX685SJ56JWqg==
Subject: Re: [PATCH v4 00/15] media: mtk-vcodec: support for MT8183 decoder
To: Alexandre Courbot <acourbot@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20210427111526.1772293-1-acourbot@chromium.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <34782bc5-d891-8eef-d370-6cfcc547166a@xs4all.nl>
Date: Thu, 29 Apr 2021 09:35:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210427111526.1772293-1-acourbot@chromium.org>
Content-Language: en-US
X-CMAE-Envelope: MS4xfBegxNwO7sjie5TrkNagJYw+HjzrJ7Zn+5Qg+SpHhR+WqQNGXlOvvaRUlXTd3rM9W28JFL81MTlv7IIDbIRAoZQRCq6qOMfu5R5wBxhuqrgrdOWVQFvV
 dVRMFwiWslx7Fwdr0AzDsqwgbLBjBtX/brx/cV8umxRe8FwHBG2SRX3960fsiLD8JXFVEMavXUzt1XF/D5AErhsZp8D1k7BVglju9naOtYGgNwmxtfIUyEME
 VjH/zBOQhW5Qz74NO8CTjQFLrjMGmlNlUgvR9YphAodAYbwJzjkIfRK5Q5ImnWKROWEqxhvXmaRg9TsRqMQc8yY7EC2h86Ygrpl2hxqsPFIuLv92CwguIBXF
 8vCu31qhm5SSYKEMrCTBMzOpKipLUlGVUPYqZO1dUL0sqwrv5Zvuk4v5uNEwmt30kM5Bmg7GjxF3AHV4hfQL0D+m4C11Z0snRZtzWyNSl3JW6o8LtK4EA1bl
 qxxH0YJD5uQ01RLCtdRG2FS6OfEXfNxkfTUGeA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_003551_522043_9F058F09 
X-CRM114-Status: GOOD (  21.77  )
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

On 27/04/2021 13:15, Alexandre Courbot wrote:
> This series adds support for the stateless API into mtk-vcodec, by first
> separating the stateful ops into their own source file, and introducing
> a new set of ops suitable for stateless decoding. As such, support for
> stateful decoders should remain completely unaffected.
> 
> This series has been tested with both MT8183 and MT8173. Decoding was
> working for both chips, and in the case of MT8173 no regression has been
> noticed.
> 
> Patches 1-9 add MT8183 support to the decoder using the stateless API.
> MT8183 only support H.264 acceleration.
> 
> Patches 10-15 are follow-ups that further improve compliance for the
> decoder and encoder, by fixing support for commands on both. Patch 11
> also makes sure that supported H.264 profiles are exported on MT8173.

For a v5 I would recommend that - where possible - these 'improve compliance'
patches are moved to the beginning of the series. That way they can be picked
up quickly without having to wait for the whole series to be accepted.

Regards,

	Hans

> 
> Changes since v3:
> * Stop checking that controls are set for every request.
> * Add V4L2_CID_STATELESS_H264_START_CODE control.
> * Stop mapping OUTPUT buffers and getting the NAL type from them, use the
>   nal_ref_idc field instead.
> * Make V4L2_CID_MIN_BUFFERS_FOR_CAPTURE control stateful-only.
> * Set vb2_buffer's field to V4L2_FIELD_NONE in buffer validation hook.
> 
> Changes since v2:
> * Add follow-up patches fixing support for START/STOP commands for the
>   encoder, and stateful decoder.
> 
> Alexandre Courbot (8):
>   media: mtk-vcodec: vdec: handle firmware version field
>   media: mtk-vcodec: support version 2 of decoder firmware ABI
>   media: add Mediatek's MM21 format
>   dt-bindings: media: document mediatek,mt8183-vcodec-dec
>   media: mtk-vcodec: vdec: use helpers in VIDIOC_(TRY_)DECODER_CMD
>   media: mtk-vcodec: vdec: clamp OUTPUT resolution to hardware limits
>   media: mtk-vcodec: make flush buffer reusable by encoder
>   media: mtk-vcodec: venc: support START and STOP commands
> 
> Hirokazu Honda (1):
>   media: mtk-vcodec: vdec: Support H264 profile control
> 
> Hsin-Yi Wang (1):
>   media: mtk-vcodec: venc: make sure buffer exists in list before
>     removing
> 
> Yunfei Dong (5):
>   media: mtk-vcodec: vdec: move stateful ops into their own file
>   media: mtk-vcodec: vdec: support stateless API
>   media: mtk-vcodec: vdec: support stateless H.264 decoding
>   media: mtk-vcodec: vdec: add media device if using stateless api
>   media: mtk-vcodec: enable MT8183 decoder
> 
>  .../bindings/media/mediatek-vcodec.txt        |   1 +
>  .../media/v4l/pixfmt-reserved.rst             |   7 +
>  drivers/media/platform/Kconfig                |   2 +
>  drivers/media/platform/mtk-vcodec/Makefile    |   3 +
>  .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 818 +++---------------
>  .../platform/mtk-vcodec/mtk_vcodec_dec.h      |  28 +-
>  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  66 +-
>  .../mtk-vcodec/mtk_vcodec_dec_stateful.c      | 667 ++++++++++++++
>  .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 370 ++++++++
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  58 +-
>  .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 135 ++-
>  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |   4 +
>  .../mtk-vcodec/vdec/vdec_h264_req_if.c        | 780 +++++++++++++++++
>  .../media/platform/mtk-vcodec/vdec_drv_if.c   |   3 +
>  .../media/platform/mtk-vcodec/vdec_drv_if.h   |   1 +
>  .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  23 +-
>  .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  43 +-
>  .../media/platform/mtk-vcodec/vdec_vpu_if.h   |   5 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
>  include/uapi/linux/videodev2.h                |   1 +
>  20 files changed, 2293 insertions(+), 723 deletions(-)
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
>  create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> 
> --
> 2.31.1.498.g6c1eba8ee3d-goog
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
