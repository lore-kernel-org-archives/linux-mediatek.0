Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76D7C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 07:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Sv6qQ0TUkVEASEqUmFL+QISssp0Calcd6UGjL6Mw9l0=; b=nmZsa1ZsABVpMa
	EA/HVJzDLOO6Lp4pofa01xCtFHbRB0Ilb/BKccAKXy819Fzn4MgQ6e0/wvf4TbUUfPGoDM5WWtBps
	PXvs3lvC3+GUVNx+7SFcmQTE7tjdV9O6k7F4DaoE/tr0fG0SrUdRGq3SQDGa7WaTbebEGQxTgZD8/
	SUAbfaHIV2ptvcjUbYmrsOhTy9IVTsrVxRVEYKpUDCit+iPj3tUFVOVRNMrw7C18eVqpjvVW/oqQa
	bCehmUapx/vpcSH/0Yec7fffeXBKMScx3KOdvP95B7/4ol6yDhHQ05iZHD+/adNflP1wgGwQJns2I
	Wc+SKB9eniphHiNqSuCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ69g-00BIVR-0S; Tue, 29 Mar 2022 07:20:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ69U-00BITV-2M; Tue, 29 Mar 2022 07:20:29 +0000
X-UUID: d2e01933406b4c41ba7e4611897b7931-20220329
X-UUID: d2e01933406b4c41ba7e4611897b7931-20220329
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ping-lei.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 946769717; Tue, 29 Mar 2022 00:20:24 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Mar 2022 00:14:19 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 29 Mar 2022 15:14:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 29 Mar 2022 15:14:17 +0800
From: James_Lin <Ping-lei.Lin@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Arnd Bergmann <arnd@arndb.de>, "Ricardo
 Ribalda" <ribalda@chromium.org>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Ming Qian <ming.qian@nxp.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, <linux-media@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Sherlock.Chang@mediatek.com>, <TM.Wu@mediatek.com>, James_Lin
 <Ping-lei.Lin@mediatek.com>
Subject: [PATCH] Signed-off-by: James_Lin <Ping-lei.Lin@mediatek.com>
Date: Tue, 29 Mar 2022 15:14:07 +0800
Message-ID: <20220329071407.17703-1-Ping-lei.Lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
Description: Add H265, cause some camera use it instead of hevc
Signed-off-by: James_Lin <Ping-lei.Lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_002028_128320_BAC391DD 
X-CRM114-Status: GOOD (  10.48  )
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

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index dda0f0aa78b8..ebb807c33e57 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -154,6 +154,11 @@ static struct uvc_format_desc uvc_fmts[] = {
 		.guid		= UVC_GUID_FORMAT_H264,
 		.fcc		= V4L2_PIX_FMT_H264,
 	},
+	{
+		.name		= "H.265",
+		.guid		= UVC_GUID_FORMAT_H265,
+		.fcc		= V4L2_PIX_FMT_H265,
+	},
 	{
 		.name		= "Greyscale 8 L/R (Y8I)",
 		.guid		= UVC_GUID_FORMAT_Y8I,
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 143230b3275b..41f4d8c33f2a 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -139,6 +139,9 @@
 #define UVC_GUID_FORMAT_H264 \
 	{ 'H',  '2',  '6',  '4', 0x00, 0x00, 0x10, 0x00, \
 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_H265 \
+	{ 'H',  '2',  '6',  '5', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
 #define UVC_GUID_FORMAT_Y8I \
 	{ 'Y',  '8',  'I',  ' ', 0x00, 0x00, 0x10, 0x00, \
 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
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
