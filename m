Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2344DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 07:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ah1+GyBkiaGOm+m8hUNIRWXyPDSBLyzXjFAXaqvJK8A=; b=E5m2wj5AcbROb/PyAuUk5MhEsc
	25w3ybMTcSZyu5WEHV+ktGSn1AEZrpwcW9wWolQNRmRvGUSsaPWftFfF4/DamHgGMWkxbTt7e7Kg8
	Z6Qick6xt9PQ7MrrTndPWebmvDkknv+TwtTH15HFVTgJvt5bQ8VdS99dp+v2a6hT0Arz6Dl5AQQsE
	gdBZ132xYhiDH5i9Z+IcFcWUyjNI5xGj0mLLdLDtw54LiyLxey5aQiisi+og10dC0KIWdQXQVZaR5
	SretNrKVAcfSbzPEvhSWg4UL7q6xgOGz7fq9V1WBg3HaFwTW4YNrBuYkrAtJWfPi7GnIN7R1abvVr
	S/uI9LVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ6MF-00BLia-Sk; Tue, 29 Mar 2022 07:33:39 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ6M0-00BLdE-FI; Tue, 29 Mar 2022 07:33:26 +0000
Received: from localhost (unknown [IPv6:2a02:3030:a:f397:f6bc:b726:2678:839f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: sebastianfricke)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D434B1F434C3;
 Tue, 29 Mar 2022 08:33:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648539203;
 bh=6168akkeItinnefCNizxCX6qty+XlEyo8LTc/EhMHyA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TfICraTN9dPWVshI9ejFuM3OX2hFoRD5nKosTH5g67vwjeXewf8wTD/SF5u6n7PrN
 EnMshmHt8DYMnG89m0nwlWnmkcwRGUkrvqsP+n2t9g01xI37wA+XLebyOxR0ZMia6F
 vP+/wYs8obUoAX4lgY0vJ0W7weHyn6x9KQXStKF2JVswKPJxDhtkTocV1ZBDoysAUg
 kcIX6skZLT/4VG9kV1o0tywt6I9JGrroedxusx6cq27IYJ70KDj3WYyy5rXMLfbYpE
 kM/RczV2Nq51Vpsnp6jx+hXJ1FDIiczEzEaUoPfNe58xxLiWmnOjqR1I+OvEstUk0Z
 G8K+1WzbNLfVw==
Date: Tue, 29 Mar 2022 09:33:19 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: James_Lin <Ping-lei.Lin@mediatek.com>
Cc: linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Arnd Bergmann <arnd@arndb.de>, Ricardo Ribalda <ribalda@chromium.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Ming Qian <ming.qian@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Sherlock.Chang@mediatek.com,
 TM.Wu@mediatek.com
Subject: Re: [PATCH] Signed-off-by: James_Lin <Ping-lei.Lin@mediatek.com>
Message-ID: <20220329073319.7da77tpgt523zksg@basti-XPS-13-9310>
References: <20220329071407.17703-1-Ping-lei.Lin@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220329071407.17703-1-Ping-lei.Lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_003324_665771_B21ADEC6 
X-CRM114-Status: GOOD (  11.87  )
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

Hey James,

Looks like something went wrong during the creation of the patch.

The patch needs a commit subject line, a description what it does and
the SOB has to beneath that description.

Greetings,
Sebastian

On 29.03.2022 15:14, James_Lin wrote:
>diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
>index dda0f0aa78b8..ebb807c33e57 100644
>--- a/drivers/media/usb/uvc/uvc_driver.c
>+++ b/drivers/media/usb/uvc/uvc_driver.c
>@@ -154,6 +154,11 @@ static struct uvc_format_desc uvc_fmts[] = {
> 		.guid		= UVC_GUID_FORMAT_H264,
> 		.fcc		= V4L2_PIX_FMT_H264,
> 	},
>+	{
>+		.name		= "H.265",
>+		.guid		= UVC_GUID_FORMAT_H265,
>+		.fcc		= V4L2_PIX_FMT_H265,
>+	},
> 	{
> 		.name		= "Greyscale 8 L/R (Y8I)",
> 		.guid		= UVC_GUID_FORMAT_Y8I,
>diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
>index 143230b3275b..41f4d8c33f2a 100644
>--- a/drivers/media/usb/uvc/uvcvideo.h
>+++ b/drivers/media/usb/uvc/uvcvideo.h
>@@ -139,6 +139,9 @@
> #define UVC_GUID_FORMAT_H264 \
> 	{ 'H',  '2',  '6',  '4', 0x00, 0x00, 0x10, 0x00, \
> 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
>+#define UVC_GUID_FORMAT_H265 \
>+	{ 'H',  '2',  '6',  '5', 0x00, 0x00, 0x10, 0x00, \
>+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> #define UVC_GUID_FORMAT_Y8I \
> 	{ 'Y',  '8',  'I',  ' ', 0x00, 0x00, 0x10, 0x00, \
> 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
>diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>index 96e307fe3aab..aeaeb29307a4 100644
>--- a/drivers/media/v4l2-core/v4l2-ioctl.c
>+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>@@ -1402,6 +1402,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> 		case V4L2_PIX_FMT_JPEG:		descr = "JFIF JPEG"; break;
> 		case V4L2_PIX_FMT_DV:		descr = "1394"; break;
> 		case V4L2_PIX_FMT_MPEG:		descr = "MPEG-1/2/4"; break;
>+		case V4L2_PIX_FMT_H265:		descr = "H.265"; break;
> 		case V4L2_PIX_FMT_H264:		descr = "H.264"; break;
> 		case V4L2_PIX_FMT_H264_NO_SC:	descr = "H.264 (No Start Codes)"; break;
> 		case V4L2_PIX_FMT_H264_MVC:	descr = "H.264 MVC"; break;
>diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>index 3768a0a80830..636e4236bfb8 100644
>--- a/include/uapi/linux/videodev2.h
>+++ b/include/uapi/linux/videodev2.h
>@@ -691,6 +691,7 @@ struct v4l2_pix_format {
> #define V4L2_PIX_FMT_JPEG     v4l2_fourcc('J', 'P', 'E', 'G') /* JFIF JPEG     */
> #define V4L2_PIX_FMT_DV       v4l2_fourcc('d', 'v', 's', 'd') /* 1394          */
> #define V4L2_PIX_FMT_MPEG     v4l2_fourcc('M', 'P', 'E', 'G') /* MPEG-1/2/4 Multiplexed */
>+#define V4L2_PIX_FMT_H265     v4l2_fourcc('H', '2', '6', '5') /* H265 with start codes */
> #define V4L2_PIX_FMT_H264     v4l2_fourcc('H', '2', '6', '4') /* H264 with start codes */
> #define V4L2_PIX_FMT_H264_NO_SC v4l2_fourcc('A', 'V', 'C', '1') /* H264 without start codes */
> #define V4L2_PIX_FMT_H264_MVC v4l2_fourcc('M', '2', '6', '4') /* H264 MVC */
>-- 
>2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
