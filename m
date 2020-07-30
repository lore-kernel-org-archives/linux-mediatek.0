Return-Path: <SRS0=dQnm=BJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF1AC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 16:40:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A365206F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 16:40:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ryu2/CFo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Xv2eFc52"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A365206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J8IZ346TdC8L+hXefv1BSwBdKUxPYueuVfRz8Vh+NIk=; b=Ryu2/CFoUHoZ1Py5CFa+2tBhp
	mvQem+cIT9HH3nHD1oRSroTWEFqIJ4XvklJPydqfNzGTN+T6Y0t+gKpMXbcRE3/ScwRJ1yX3MLKxz
	S/OPRfJEfi3azn5uRkMKI5D1OBZ1PevnIk6FLBroSUbeMJCJE7E8FoCjPm/lHgNyUOmQf8SayaTN4
	WhnMTcX1gdVO/n5X/3wyW9qMxDeMY8zEMzy36EfcJiGOHNTso7OjdPS3K7MQ68PB8srEtwG4teN9t
	NwmSLXX9RAZYN2mVqGTTVEts2nmn5mOck2YcmxCCKCtIRCm9tlt0RivkU6vzBVjsuG2J6PVTBvKGN
	Wf3Pthf4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1Bbc-0004oN-Lr; Thu, 30 Jul 2020 16:40:32 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1Bba-0004n7-AB
 for linux-mediatek@lists.infradead.org; Thu, 30 Jul 2020 16:40:31 +0000
Received: by mail-wm1-x342.google.com with SMTP id 184so6824915wmb.0
 for <linux-mediatek@lists.infradead.org>; Thu, 30 Jul 2020 09:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=z7c6G7LA4wMI31rE/G3DFB1zXivUhfsc+gRf5Yk3dzQ=;
 b=Xv2eFc52v202z0TsmV3ZVb/X/kfvDRq60L5cb8HHWuJFHy7Nft5APTCNJVJpdQ2FoU
 +4F5xWb7DgQu0I8dv78ZWgE+RELjBjNFa3PyKTAUCgR+0yFC00pRlnPtihNKHsOVOHE3
 KONmwpSssoSbwoZ6OfwU8UbNDHWvCknicBeYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z7c6G7LA4wMI31rE/G3DFB1zXivUhfsc+gRf5Yk3dzQ=;
 b=qK1aUanRMjPRujO1HUu7QoRZYIpvmHaJkNLVhDbhfNu5ZTAjBkldJCMd9egfdT0nis
 vbBOFqCsfmZ6bX1gipPeV0piwS8NVxcaYBzUDY6OjfsUG921zBE5dPxXBbx84OYiSAFp
 UoRKOI8Zx1p0wws2qq2rrrFN/Wnv4PAH/MSPruYq0x/QXpdsBESVoaa895NT7/fVjGaQ
 6Nk0r7BhcpBT8KnFhVPHTxukoV+cH6torYbzH/rDu/zxLA3BTYL0bC3DjPwmDG3qC6wt
 rlclmphJZOB709vHpIFQzMhjay/iOf1SjalGHtmqVvgMaM1h0tTnXzdw/C2PqQrsGtXd
 w43A==
X-Gm-Message-State: AOAM531tNoYbp4mGwS4vfERypE9eRjThfhCMnatf3ER0gOHIUXE1ahfW
 cqagwrpgEiZzAZ9fdopuYeE9rA==
X-Google-Smtp-Source: ABdhPJzaQjBxQauL+AG6AmnnI1vp9FaY8avLYCkRXAg/NRbM+27Ya8LMA5DQET7r/Tro7gvu+Dq4JA==
X-Received: by 2002:a1c:bcd6:: with SMTP id m205mr108371wmf.47.1596127229300; 
 Thu, 30 Jul 2020 09:40:29 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com.
 [35.190.215.205])
 by smtp.gmail.com with ESMTPSA id n18sm10825044wrw.45.2020.07.30.09.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 09:40:28 -0700 (PDT)
Date: Thu, 30 Jul 2020 16:40:27 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Xia Jiang <xia.jiang@mediatek.com>
Subject: Re: [PATCH v10 00/28] Add support for mt2701 JPEG ENC support
Message-ID: <20200730164027.GB3779380@chromium.org>
References: <20200723030451.5616-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200723030451.5616-1-xia.jiang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_124030_410804_9714420D 
X-CRM114-Status: GOOD (  21.04  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: drinkcat@chromium.org, devicetree@vger.kernel.org, mojahsu@chromium.org,
 srv_heupstream@mediatek.com, Rick Chang <rick.chang@mediatek.com>,
 senozhatsky@chromium.org, linux-kernel@vger.kernel.org,
 maoguang.meng@mediatek.com, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-mediatek@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Xia,

On Thu, Jul 23, 2020 at 11:04:23AM +0800, Xia Jiang wrote:
> This patchset add support for mt2701 JPEG ENC support.      
>                                                             
> This is the compliance test result for jpeg dec and enc.    
>                                                             
> The JPEG dec log:                                           
> ------------------------------------------------------------
> v4l2-compliance -d /dev/video0
> v4l2-compliance SHA: 697ae940b60a172ef31948dd74316fe9de365b7e, 32 bits, 32-bit time_t
> 
> Compliance test for mtk-jpeg-dec device /dev/video0:
> 
> Driver Info:
>         Driver name      : mtk-jpeg-dec
>         Card type        : mtk-jpeg-dec
>         Bus info         : platform:15004000.jpegdec
>         Driver version   : 5.8.0
>         Capabilities     : 0x84204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>         Detected JPEG Decoder
> 
> Required ioctls:
>         test VIDIOC_QUERYCAP: OK
> 
> Allow for multiple opens:
>         test second /dev/video0 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
> 
>         test invalid ioctls: OK
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
> 
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK
>         test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
> 
> Total for mtk-jpeg-dec device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 0
> ------------------------------------------------------------
>                                                             
> The JPEG enc log:                                           
>                                                             
> ------------------------------------------------------------
> v4l2-compliance -d /dev/video1 
> v4l2-compliance SHA: 697ae940b60a172ef31948dd74316fe9de365b7e, 32 bits, 32-bit time_t
> 
> Compliance test for mtk-jpeg-enc device /dev/video1:
> 
> Driver Info:
>         Driver name      : mtk-jpeg-enc
>         Card type        : mtk-jpeg-enc
>         Bus info         : platform:1500a000.jpegenc
>         Driver version   : 5.8.0
>         Capabilities     : 0x84204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>         Detected JPEG Encoder
> 
> Required ioctls:
>         test VIDIOC_QUERYCAP: OK
> 
> Allow for multiple opens:
>         test second /dev/video1 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
> 
>         test invalid ioctls: OK
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 4 Private Controls: 0
> 
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
> 
> Total for mtk-jpeg-enc device /dev/video1: 45, Succeeded: 45, Failed: 0, Warnings: 0
> ------------------------------------------------------------
> 
> Change compared to v9:
> - use pm_runtime_force_*()helpers of patch 07/28
> - add one patch for handling jpeg hardware's locking up
> - delete mtk_jpeg_qbuf() in patch 09/28
> - add one patch for deletting vidioc_s_selection ioctl of jpeg dec
> - add one patch for changing the maximum width and height supported by jpeg dec
> - add one patch for refactoring mtk_jpeg_try_fmt_mplane function
> - add one patch for refactoring mtk_jpeg_find_format function
> - add one patch for redefinition of mtk_jpeg_q_data structure
> - add one patch for changing the colorspace of jpeg to the fixed value
> - add one patch for refactoring mtk_jpeg_set_default_params function
> - add one patch for changing the call function of getting/enable/disable the jpeg's clock
> - add one patch for using the variant structure to contain the varability between jpeg dec and enc
> - return active crop information in mtk_jpeg_enc_g_selection function
> - cancel mtk_jpeg_enc_bs structure
> - refactor the setting hardware register functions in mtk_jpeg_enc_hw.c
> - remove mtk_jpeg_enc_job_ready function
> - refactor mtk_jpeg_enc_irq function
> - cancel setting up a control handler for jpeg dec
> - add the mechanism to ensure that the buffer is enough to hold the EXIF data in .buf_prepare callback
> 
> Xia Jiang (28):
>   media: platform: Improve subscribe event flow for bug fixing
>   media: platform: Improve queue set up flow for bug fixing
>   media: platform: Improve getting and requesting irq flow for bug
>     fixing
>   media: platform: Change the fixed device node number to unfixed value
>   media: platform: Improve power on and power off flow
>   media: platform: Delete the resetting hardware flow in the system PM
>     ops
>   media: platform: Improve the implementation of the system PM ops
>   media: platform: Add mechanism to handle jpeg hardware's locking up
>   media: platform: Cancel the last frame handling flow
>   media: platform: Delete zeroing the reserved fields
>   media: platform: Stylistic changes for improving code quality
>   media: platform: Use generic rounding helpers
>   media: platform: Change MTK_JPEG_COMP_MAX macro definition location
>   media: platform: Delete redundant code and add annotation for an enum
>   media: platform: Delete vidioc_s_selection ioctl of jpeg dec
>   media: platform: Change the maximum width and height supported by JPEG
>     dec
>   media: platform: Refactor mtk_jpeg_try_fmt_mplane()
>   media: platform: Refactor mtk_jpeg_find_format()
>   media: platform: Redefinition of mtk_jpeg_q_data structure
>   media: platform: Change the colorspace of jpeg to the fixed value
>   media: platform: Refactor mtk_jpeg_set_default_params()
>   media: platform: Change the call functions of getting/enable/disable
>     the jpeg's clock

Except one comment to that one patch, the series looks good to me. After
fixing that last comment, feel free to add my Reviewed-by to all the
patches which still don't have it.

Thanks a lot for patiently addressing the comments. I think the series
improves the driver a lot.

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
