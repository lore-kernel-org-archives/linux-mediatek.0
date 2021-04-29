Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E459C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 12:07:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6071F61446
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 12:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6071F61446
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s5SbMX/djwTdQbfHZSmwpVSlisP5oWyFbA55liCgEUo=; b=XFKu2xBgOA37t4kUKqLaZ6yGm
	eDuCtJEeICowPpP/AoqAlSNe8wF3eXxwkhdvOUsUn73vqGqDHEUeSQarqIzOwjk6RYWACtmykGohJ
	1nmVxfW/PRu2UaDfvLx4v90kBhFty+rGxbEqBWr+ds4LabGjWpqaUxX8cVJ647ozr5HFH9xpEuGjj
	LwYofFFwuR5GV/6mfWKGvUIbBPHJl8KZTpvA4MFlKH4nYv3Ezl2hSn9mrqKByFMijiYaIGOE8chMF
	UcIDoYjllbTdMpSe1+6Ggu+epCWPoeI+yvys27sQym9ALNzdrwC9KNk1DNVCzx79X0RuXgxBDWdBr
	TIvD+TbtA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc5SE-005anb-GT; Thu, 29 Apr 2021 12:07:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc5SB-005amp-Nf
 for linux-mediatek@desiato.infradead.org; Thu, 29 Apr 2021 12:07:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=IKHpIGFbjWMcpqjFfrGG1vTrFs8CgzniV60VSVVW2pw=; b=rrVdPPoguTAMGDSB1gMaiI0pgK
 fOs3h6dM/GK4miwfv6n1CvIjfYtg7A6bZRmUFCTZ0vdypCFpUK9GTQxiyw26D3i4qsSzlJWshcxSV
 EDz1b8Im8cqpQhNqpYzDZcFbZXxQ76dOh9d+BBSYsyb6eKcLEPNYuF1I6gGTY0P/08gHJwpUqcyDK
 XXjxwnf9DYF2pXnWBQ3LAGBg0SXRFwk2VCRdPWsP9vjdl3uY7bT3zV8eYKAvwoO+mkXOH8Z2KrNm8
 UYyJOnTqT1N0gS0B8nmszAluM9+zGQfn+TdMqmg+y9b1eQkvKpb/9pBrNtk4uygEpxupkE4aW8dKh
 tJSiE6pg==;
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc5S8-000bkX-5O
 for linux-mediatek@lists.infradead.org; Thu, 29 Apr 2021 12:07:34 +0000
Received: from [IPv6:2a02:810a:880:f54:11ef:dfbe:29a3:d3d] (unknown
 [IPv6:2a02:810a:880:f54:11ef:dfbe:29a3:d3d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 867411F43410;
 Thu, 29 Apr 2021 13:07:27 +0100 (BST)
Subject: Re: [PATCH v4 00/15] media: mtk-vcodec: support for MT8183 decoder
To: Alexandre Courbot <acourbot@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20210427111526.1772293-1-acourbot@chromium.org>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <976d420c-b4fc-bc23-c398-9b3a7ab4ffc9@collabora.com>
Date: Thu, 29 Apr 2021 14:07:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210427111526.1772293-1-acourbot@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_050732_474592_BE1D7895 
X-CRM114-Status: GOOD (  26.75  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On 27.04.21 13:15, Alexandre Courbot wrote:
> This series adds support for the stateless API into mtk-vcodec, by first
> separating the stateful ops into their own source file, and introducing
> a new set of ops suitable for stateless decoding. As such, support for
> stateful decoders should remain completely unaffected.
> 
> This series has been tested with both MT8183 and MT8173. Decoding was
> working for both chips, and in the case of MT8173 no regression has been
> noticed.

I am trying to test the decoder with this patchset using v4l2-ctl on mt8173.

I am trying to decode an h264 file into V4L2_PIX_FMT_MT21C format.
I am not able to do it. It seems that the driver expects each buffer to start
with a nal starting code, and the v4l2-ctl command just read the files into
buffers without any parsing.

Can you share the command and the files you used for testing?

Thank you,
Dafna

> 
> Patches 1-9 add MT8183 support to the decoder using the stateless API.
> MT8183 only support H.264 acceleration.
> 
> Patches 10-15 are follow-ups that further improve compliance for the
> decoder and encoder, by fixing support for commands on both. Patch 11
> also makes sure that supported H.264 profiles are exported on MT8173.
> 
> Changes since v3:
> * Stop checking that controls are set for every request.
> * Add V4L2_CID_STATELESS_H264_START_CODE control.
> * Stop mapping OUTPUT buffers and getting the NAL type from them, use the
>    nal_ref_idc field instead.
> * Make V4L2_CID_MIN_BUFFERS_FOR_CAPTURE control stateful-only.
> * Set vb2_buffer's field to V4L2_FIELD_NONE in buffer validation hook.
> 
> Changes since v2:
> * Add follow-up patches fixing support for START/STOP commands for the
>    encoder, and stateful decoder.
> 
> Alexandre Courbot (8):
>    media: mtk-vcodec: vdec: handle firmware version field
>    media: mtk-vcodec: support version 2 of decoder firmware ABI
>    media: add Mediatek's MM21 format
>    dt-bindings: media: document mediatek,mt8183-vcodec-dec
>    media: mtk-vcodec: vdec: use helpers in VIDIOC_(TRY_)DECODER_CMD
>    media: mtk-vcodec: vdec: clamp OUTPUT resolution to hardware limits
>    media: mtk-vcodec: make flush buffer reusable by encoder
>    media: mtk-vcodec: venc: support START and STOP commands
> 
> Hirokazu Honda (1):
>    media: mtk-vcodec: vdec: Support H264 profile control
> 
> Hsin-Yi Wang (1):
>    media: mtk-vcodec: venc: make sure buffer exists in list before
>      removing
> 
> Yunfei Dong (5):
>    media: mtk-vcodec: vdec: move stateful ops into their own file
>    media: mtk-vcodec: vdec: support stateless API
>    media: mtk-vcodec: vdec: support stateless H.264 decoding
>    media: mtk-vcodec: vdec: add media device if using stateless api
>    media: mtk-vcodec: enable MT8183 decoder
> 
>   .../bindings/media/mediatek-vcodec.txt        |   1 +
>   .../media/v4l/pixfmt-reserved.rst             |   7 +
>   drivers/media/platform/Kconfig                |   2 +
>   drivers/media/platform/mtk-vcodec/Makefile    |   3 +
>   .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 818 +++---------------
>   .../platform/mtk-vcodec/mtk_vcodec_dec.h      |  28 +-
>   .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  66 +-
>   .../mtk-vcodec/mtk_vcodec_dec_stateful.c      | 667 ++++++++++++++
>   .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 370 ++++++++
>   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  58 +-
>   .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 135 ++-
>   .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |   4 +
>   .../mtk-vcodec/vdec/vdec_h264_req_if.c        | 780 +++++++++++++++++
>   .../media/platform/mtk-vcodec/vdec_drv_if.c   |   3 +
>   .../media/platform/mtk-vcodec/vdec_drv_if.h   |   1 +
>   .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  23 +-
>   .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  43 +-
>   .../media/platform/mtk-vcodec/vdec_vpu_if.h   |   5 +
>   drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
>   include/uapi/linux/videodev2.h                |   1 +
>   20 files changed, 2293 insertions(+), 723 deletions(-)
>   create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
>   create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
>   create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> 
> --
> 2.31.1.498.g6c1eba8ee3d-goog
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
