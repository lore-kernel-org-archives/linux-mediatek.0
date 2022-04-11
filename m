Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBCBC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 08:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ArdXSIY6FnE6ubyyEmDqo3LH7MVm3qw4Bn5/XgLT0mM=; b=kPsPiKaeN4k7d7
	fBzNvdkXjwoQRsBy7GUj8HsRi4Y9UEXszVtV7U/NhQUiIU+vxpcz1SVkv1Ar4KB11MA84xgfwrmhU
	a7g9LOhKTux/Vi852xIHenQS2vrcZ/un6YEm/klZBc05SrAARWacudrkoKrgHZj0ioRvyopHOZCSK
	ypuezpEgZYbvs0oT1P3m9MEwHvwmPTVjZ0tMwXMb6NjKmRIHEAgeeMaI5rnI/3ft+yeauqi+nRF/S
	rBiJZ1CFv21ZAxJWLudrzs2p4hqkR2JtWdAHmPJbuBV4zydUjRHpBNN5P3hFbgMX7MkAc5YRkmoI0
	+pxZNlPI0y2kr/PXFPdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndpAa-007TMF-KT; Mon, 11 Apr 2022 08:13:08 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndpAI-007TE6-Rq; Mon, 11 Apr 2022 08:12:52 +0000
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D23259D;
 Mon, 11 Apr 2022 10:12:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1649664769;
 bh=0VhYaczbLXbhIz/P8q9GI8+HUZ1jnwY0l6SoEA5+fx8=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=tEKsOgPuTtmlrYFqi6at19GitGX5vo6zzXltTVLePPnQPwwf3y38Clha5q9xKinkA
 fRSeY77S2/y2NFDd+KjVYdGowgebEeXF+jeYBWH/dJHZ0TTrDZ35M4qXIPheVDrrg7
 YAu6Pm44dbYrZpF7h30ZKa1mD4Bnv3R44YS/TEYc=
MIME-Version: 1.0
In-Reply-To: <20220411080120.26008-3-Ping-lei.Lin@mediatek.com>
References: <20220411080120.26008-1-Ping-lei.Lin@mediatek.com>
 <20220411080120.26008-3-Ping-lei.Lin@mediatek.com>
Subject: Re: [PATCH v2 2/2] media: v4l: Add H265 pixel format
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Arnd Bergmann <arnd@arndb.de>,
 Ricardo Ribalda <ribalda@chromium.org>, Ming Qian <ming.qian@nxp.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 ping-lei.lin@mediatek.com, lecopzer.chen@mediatek.com, max.yan@mediatek.com,
 sherlock.chang@mediatek.com, tm.wu@mediatek.com,
 James_Lin <Ping-lei.Lin@mediatek.com>
To: James_Lin <Ping-lei.Lin@mediatek.com>, linux-kernel@vger.kernel.org
Date: Mon, 11 Apr 2022 09:12:46 +0100
Message-ID: <164966476674.22830.512211103923160119@Monstersaurus>
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_011251_078151_071F0A1D 
X-CRM114-Status: GOOD (  15.01  )
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

Quoting James_Lin (2022-04-11 09:01:20)
> Add H265 pixel format.
> So driver can recognize external camera devices 
> whom use h265 to describe High Efficiency Video Coding method.
> 
> Signed-off-by: James_Lin <Ping-lei.Lin@mediatek.com>
> ---
>  .../userspace-api/media/v4l/pixfmt-compressed.rst      | 10 ++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c                   |  1 +
>  include/uapi/linux/videodev2.h                         |  1 +
>  3 files changed, 12 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> index 967fc803ef94..75292aafe2eb 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> @@ -36,6 +36,16 @@ Compressed Formats
>        - MPEG multiplexed stream. The actual format is determined by
>         extended control ``V4L2_CID_MPEG_STREAM_TYPE``, see
>         :ref:`mpeg-control-id`.
> +    * .. _V4L2-PIX-FMT-H265:
> +
> +      - ``V4L2_PIX_FMT_H265``
> +      - 'H265'
> +      - H.265 Access Unit.
> +       The decoder expects one Access Unit per buffer.
> +       The encoder generates one Access Unit per buffer.
> +       If :ref:`VIDIOC_ENUM_FMT` reports ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM``
> +       then the decoder has no requirements since it can parse all the
> +       information from the raw bytestream.
>      * .. _V4L2-PIX-FMT-H264:
>  
>        - ``V4L2_PIX_FMT_H264``
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 96e307fe3aab..aeaeb29307a4 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1402,6 +1402,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>                 case V4L2_PIX_FMT_JPEG:         descr = "JFIF JPEG"; break;
>                 case V4L2_PIX_FMT_DV:           descr = "1394"; break;
>                 case V4L2_PIX_FMT_MPEG:         descr = "MPEG-1/2/4"; break;
> +               case V4L2_PIX_FMT_H265:         descr = "H.265"; break;

I'd probably expect H265 to be sorted after H264 ? But I'm not sure this
list is sorted otherwise.

>                 case V4L2_PIX_FMT_H264:         descr = "H.264"; break;
>                 case V4L2_PIX_FMT_H264_NO_SC:   descr = "H.264 (No Start Codes)"; break;
>                 case V4L2_PIX_FMT_H264_MVC:     descr = "H.264 MVC"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 3768a0a80830..636e4236bfb8 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -691,6 +691,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_JPEG     v4l2_fourcc('J', 'P', 'E', 'G') /* JFIF JPEG     */
>  #define V4L2_PIX_FMT_DV       v4l2_fourcc('d', 'v', 's', 'd') /* 1394          */
>  #define V4L2_PIX_FMT_MPEG     v4l2_fourcc('M', 'P', 'E', 'G') /* MPEG-1/2/4 Multiplexed */
> +#define V4L2_PIX_FMT_H265     v4l2_fourcc('H', '2', '6', '5') /* H265 with start codes */

Likewise.


>  #define V4L2_PIX_FMT_H264     v4l2_fourcc('H', '2', '6', '4') /* H264 with start codes */
>  #define V4L2_PIX_FMT_H264_NO_SC v4l2_fourcc('A', 'V', 'C', '1') /* H264 without start codes */
>  #define V4L2_PIX_FMT_H264_MVC v4l2_fourcc('M', '2', '6', '4') /* H264 MVC */
> -- 
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
