Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98405C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 08:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CpnK/zZAoDM64kuSUtWBGO6S7Drdh/t1PNEkxsj+OGw=; b=ySgSPYaMg2mrvR
	gSkE9AVzP7VWWRJPMWuwKQsSlJvBq9vJJkpp13qCmr+pF1DFitorFXCSCxehqLQmx/kQuneOsv1Va
	IcM83aWLHjONsqBJVF7AseObbv5J3b0mRqkLm/LxmnOD7TDK9E6oTIkBf147IaftTgeOGGSM5RLmH
	4xsYToLhAhZ8uJNooWrhmZj0jXeJWoA8boZXsDQSRULFz9cLf+5HPuxNlRH7Z+TZW3wpBMWMPHlzI
	UWRHU12vuaM/nIwQ2evfiS9DKDWzmLa9GexA/vh7LFKLZ23PVV9HsHhz98P10NYNZPnq0Nyisq8xd
	T6KaDuva7WdoVGKrBPQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndozl-007R3N-JF; Mon, 11 Apr 2022 08:01:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndozZ-007QvF-9s; Mon, 11 Apr 2022 08:01:46 +0000
X-UUID: 8fb17889e6644dd8b554725fd315c3ff-20220411
X-UUID: 8fb17889e6644dd8b554725fd315c3ff-20220411
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ping-lei.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1072011481; Mon, 11 Apr 2022 01:01:37 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Apr 2022 01:01:36 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Apr 2022 16:01:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 11 Apr 2022 16:01:34 +0800
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
Subject: [PATCH v2 1/2] media: usb: uvc: Add H265 pixel format
Date: Mon, 11 Apr 2022 16:01:19 +0800
Message-ID: <20220411080120.26008-2-Ping-lei.Lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220411080120.26008-1-Ping-lei.Lin@mediatek.com>
References: <20220411080120.26008-1-Ping-lei.Lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_010145_369197_CE75DC98 
X-CRM114-Status: GOOD (  10.72  )
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
 drivers/media/usb/uvc/uvc_driver.c | 5 +++++
 drivers/media/usb/uvc/uvcvideo.h   | 3 +++
 2 files changed, 8 insertions(+)

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
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
