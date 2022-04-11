Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A24EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 08:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EIlgd4jw+x9EFmEmwCDu9BFGUtQnR3PmZ+ZiptCC/W0=; b=qTOXfB7f9iRjGG
	hKc2h0QrIx/N8sm2K7eY/91BsrcX+eR1By3my8vYy8kWFiIK8loQ3HHjQeUDG03HjD8liYujwMO99
	BCazmWw4CSa/4fikFUcgIvJaR9G51XbryzttWX8GEgBGfZQcrWtTzBHj/9Qf4iie/b4wZz+HMuMwF
	haWGIvgk2XG0QlzpGnn+CcWkSlQfwtO21Nrx8XTad7GqJVczPSIQ8RtBH/tFGrXKFMmc9cVrNwC42
	EYzJBYSXNZhA80i00pwVW4iWtdfb0SYWV5SVrBbBs3gFxZTi6n12/D7vkZaY/i9lj+x6VSjY1VUkm
	0xu71WQmuCKEardzzDEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndp9c-007Sqi-8G; Mon, 11 Apr 2022 08:12:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndp96-007Sel-T2; Mon, 11 Apr 2022 08:11:39 +0000
X-UUID: c05b776ba9f147ca93686e508689dcf3-20220411
X-UUID: c05b776ba9f147ca93686e508689dcf3-20220411
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ping-lei.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 724000758; Mon, 11 Apr 2022 01:11:31 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Apr 2022 01:01:41 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Apr 2022 16:01:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 11 Apr 2022 16:01:39 +0800
From: James_Lin <Ping-lei.Lin@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "Hans Verkuil" <hverkuil-cisco@xs4all.nl>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Arnd Bergmann <arnd@arndb.de>, "Ricardo
 Ribalda" <ribalda@chromium.org>, Ming Qian <ming.qian@nxp.com>, "Andrzej
 Pietrasiewicz" <andrzej.p@collabora.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, <linux-media@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <ping-lei.lin@mediatek.com>, <lecopzer.chen@mediatek.com>,
 <max.yan@mediatek.com>, <sherlock.chang@mediatek.com>, <tm.wu@mediatek.com>,
 James_Lin <Ping-lei.Lin@mediatek.com>
Subject: [PATCH v2 2/2] media: v4l: Add H265 pixel format
Date: Mon, 11 Apr 2022 16:01:20 +0800
Message-ID: <20220411080120.26008-3-Ping-lei.Lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220411080120.26008-1-Ping-lei.Lin@mediatek.com>
References: <20220411080120.26008-1-Ping-lei.Lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_011136_970188_C30E8663 
X-CRM114-Status: GOOD (  10.63  )
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

Add H265 pixel format.
So driver can recognize external camera devices 
whom use h265 to describe High Efficiency Video Coding method.

Signed-off-by: James_Lin <Ping-lei.Lin@mediatek.com>
---
 .../userspace-api/media/v4l/pixfmt-compressed.rst      | 10 ++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c                   |  1 +
 include/uapi/linux/videodev2.h                         |  1 +
 3 files changed, 12 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
index 967fc803ef94..75292aafe2eb 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
@@ -36,6 +36,16 @@ Compressed Formats
       - MPEG multiplexed stream. The actual format is determined by
 	extended control ``V4L2_CID_MPEG_STREAM_TYPE``, see
 	:ref:`mpeg-control-id`.
+    * .. _V4L2-PIX-FMT-H265:
+
+      - ``V4L2_PIX_FMT_H265``
+      - 'H265'
+      - H.265 Access Unit.
+	The decoder expects one Access Unit per buffer.
+	The encoder generates one Access Unit per buffer.
+	If :ref:`VIDIOC_ENUM_FMT` reports ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM``
+	then the decoder has no	requirements since it can parse all the
+	information from the raw bytestream.
     * .. _V4L2-PIX-FMT-H264:
 
       - ``V4L2_PIX_FMT_H264``
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 96e307fe3aab..aeaeb29307a4 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1402,6 +1402,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_JPEG:		descr = "JFIF JPEG"; break;
 		case V4L2_PIX_FMT_DV:		descr = "1394"; break;
 		case V4L2_PIX_FMT_MPEG:		descr = "MPEG-1/2/4"; break;
+		case V4L2_PIX_FMT_H265:		descr = "H.265"; break;
 		case V4L2_PIX_FMT_H264:		descr = "H.264"; break;
 		case V4L2_PIX_FMT_H264_NO_SC:	descr = "H.264 (No Start Codes)"; break;
 		case V4L2_PIX_FMT_H264_MVC:	descr = "H.264 MVC"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 3768a0a80830..636e4236bfb8 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -691,6 +691,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_JPEG     v4l2_fourcc('J', 'P', 'E', 'G') /* JFIF JPEG     */
 #define V4L2_PIX_FMT_DV       v4l2_fourcc('d', 'v', 's', 'd') /* 1394          */
 #define V4L2_PIX_FMT_MPEG     v4l2_fourcc('M', 'P', 'E', 'G') /* MPEG-1/2/4 Multiplexed */
+#define V4L2_PIX_FMT_H265     v4l2_fourcc('H', '2', '6', '5') /* H265 with start codes */
 #define V4L2_PIX_FMT_H264     v4l2_fourcc('H', '2', '6', '4') /* H264 with start codes */
 #define V4L2_PIX_FMT_H264_NO_SC v4l2_fourcc('A', 'V', 'C', '1') /* H264 without start codes */
 #define V4L2_PIX_FMT_H264_MVC v4l2_fourcc('M', '2', '6', '4') /* H264 MVC */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
