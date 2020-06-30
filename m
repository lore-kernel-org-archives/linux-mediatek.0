Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D908CC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 06:28:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9A1F20759
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 06:28:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RZad43il";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NgxNazi/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9A1F20759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xDbVkyjxuY8nJWn3tFAVHxaTRWnoV2L8OfAiitnGDto=; b=RZad43ildF8Ffz5XSVB58edIx
	bggJ75UHBWIBC2rCS8MmyNuKtYPEJaSApv19DjkBSFcF6+qWveG5jkyR9K3R5pFPFCy3gCuJXBfb8
	+HSnX9DcVFdejCG9Vym/fUTzM4hRfjai6XCYarvcttDOb//QioP712BRf6i5sHD1xH3OfV9MGGEOr
	h55auqgGyEAu0wSJKYHMdc1rtUcvXlZV6+afi6OKSf45VIoBh2zMlIS+1i3MDXWsA3kbenP0DQTCA
	7ihRMbYWyWFMrt++fJj7e9I96rUqA7iqy4FG0PZcUW6CgSVGH2M74iE18bl5DyG2BZN6gdLu7iiDp
	8CKWSUxFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq9ka-0006fX-Mb; Tue, 30 Jun 2020 06:28:12 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq9kX-0006cf-HL
 for linux-mediatek@lists.infradead.org; Tue, 30 Jun 2020 06:28:10 +0000
Received: by mail-pf1-x443.google.com with SMTP id a127so8956299pfa.12
 for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2020 23:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fI8HnXoHL36NipPIacNI9gsuTmN2YmF4x8kkOxnjHJM=;
 b=NgxNazi/4NDPHZazkyx72vObQoLThGuPLwjaDWkOz/me6q5ikQwO9toW9ubWJKpPz4
 MAeQsnLtgzDJNq20N5wTPrTFydudGufvClwM7ODIDFm81qNGD5AKNBLJDNda4IjeNTzH
 6jQ6PUVlksjmph6b9wW1UAGs3tNkWU68ujN1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fI8HnXoHL36NipPIacNI9gsuTmN2YmF4x8kkOxnjHJM=;
 b=k7v2VWwMMJ8UGoOwP15Cy+TuMig09/i87BBdOkGtqOQxs+1l4/dni7cojQVWT2dzad
 DUA71dO+5PChxefoJ7xLIUAaBH2ZNTlVjTGoPB3Ndy1uHAWAZ9HBgn8TRQyHd2zQHMrN
 YT2Wj8z5+Fno+yaV9vtgFzNGo54twGoNK/SOfZjXGjP/IXKQxeslx8KHN53F9yfY/+sJ
 EiwaHOZTEm9t3TnOJIqgQJei1AFNsLX4bDT6fOLxZvMCZAaga/c+ebPqYKqFEhSO6E5f
 jyaBGEWz6K4et3ZT42OXq1bypqhj4FInGg4NatSeneBvzIU3cMGcDamDY+04AGEwbsIy
 wbcA==
X-Gm-Message-State: AOAM533+io/B3k4WVCPwr7RNTuV0+JPFIsLQiXg+PRYAAFw6q7ydM5Qd
 k2GrgrJfAYb7Q4uARoDF8PY/wQ==
X-Google-Smtp-Source: ABdhPJyqQPQLx66yCaLhyl3uQCAVHiz7CJM/ZYhIR5tsBTwfptdnq5A03XpzQZFsy3TRMntZxzoPcg==
X-Received: by 2002:aa7:9e5c:: with SMTP id z28mr5770994pfq.49.1593498487276; 
 Mon, 29 Jun 2020 23:28:07 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:93d9:de4d:e834:3086])
 by smtp.gmail.com with ESMTPSA id d1sm1463366pfq.113.2020.06.29.23.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 23:28:06 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>
Subject: [PATCH 7/9] media: mtk-vcodec: vdec: add media device if using
 stateless api
Date: Tue, 30 Jun 2020 15:27:09 +0900
Message-Id: <20200630062711.4169601-8-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200630062711.4169601-1-acourbot@chromium.org>
References: <20200630062711.4169601-1-acourbot@chromium.org>
MIME-Version: 1.0
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
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Courbot <acourbot@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yunfei Dong <yunfei.dong@mediatek.com>

The stateless API requires a media device for issuing requests. Add one
if we are being instantiated as a stateless decoder.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
[acourbot: refactor, cleanup and split]
Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/Kconfig                |  1 +
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 39 +++++++++++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  2 +
 3 files changed, 42 insertions(+)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index ff77c6db55db..cb5ffb98dc09 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -258,6 +258,7 @@ config VIDEO_MEDIATEK_VCODEC
 	select V4L2_H264
 	select VIDEO_MEDIATEK_VPU
 	select MTK_SCP
+	select MEDIA_CONTROLLER
 	help
 	    Mediatek video codec driver provides HW capability to
 	    encode and decode in a range of video formats
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 3d8eaf0746c2..e723f8573322 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -14,6 +14,7 @@
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-contig.h>
+#include <media/v4l2-device.h>
 
 #include "mtk_vcodec_drv.h"
 #include "mtk_vcodec_dec.h"
@@ -322,6 +323,31 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_event_workq;
 	}
 
+	if (dev->vdec_pdata->uses_stateless_api) {
+		dev->mdev_dec.dev = &pdev->dev;
+		strscpy(dev->mdev_dec.model, MTK_VCODEC_DEC_NAME,
+				sizeof(dev->mdev_dec.model));
+
+		media_device_init(&dev->mdev_dec);
+		dev->mdev_dec.ops = &mtk_vcodec_media_ops;
+		dev->v4l2_dev.mdev = &dev->mdev_dec;
+
+		ret = v4l2_m2m_register_media_controller(dev->m2m_dev_dec,
+			dev->vfd_dec, MEDIA_ENT_F_PROC_VIDEO_DECODER);
+		if (ret) {
+			mtk_v4l2_err("Failed to register media controller");
+			goto err_reg_cont;
+		}
+
+		ret = media_device_register(&dev->mdev_dec);
+		if (ret) {
+			mtk_v4l2_err("Failed to register media device");
+			goto err_media_reg;
+		}
+
+		mtk_v4l2_debug(0, "media registered as /dev/media%d",
+			vfd_dec->num);
+	}
 	ret = video_register_device(vfd_dec, VFL_TYPE_VIDEO, 0);
 	if (ret) {
 		mtk_v4l2_err("Failed to register video device");
@@ -334,6 +360,12 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	return 0;
 
 err_dec_reg:
+	if (dev->vdec_pdata->uses_stateless_api)
+		media_device_unregister(&dev->mdev_dec);
+err_media_reg:
+	if (dev->vdec_pdata->uses_stateless_api)
+		v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
+err_reg_cont:
 	destroy_workqueue(dev->decode_workqueue);
 err_event_workq:
 	v4l2_m2m_release(dev->m2m_dev_dec);
@@ -366,6 +398,13 @@ static int mtk_vcodec_dec_remove(struct platform_device *pdev)
 
 	flush_workqueue(dev->decode_workqueue);
 	destroy_workqueue(dev->decode_workqueue);
+
+	if (media_devnode_is_registered(dev->mdev_dec.devnode)) {
+		media_device_unregister(&dev->mdev_dec);
+		v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
+		media_device_cleanup(&dev->mdev_dec);
+	}
+
 	if (dev->m2m_dev_dec)
 		v4l2_m2m_release(dev->m2m_dev_dec);
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 755631d0fe92..7071434b5c5b 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -382,6 +382,7 @@ struct mtk_vcodec_enc_pdata {
  * struct mtk_vcodec_dev - driver data
  * @v4l2_dev: V4L2 device to register video devices for.
  * @vfd_dec: Video device for decoder
+ * @mdev_dec: Media device for decoder
  * @vfd_enc: Video device for encoder.
  *
  * @m2m_dev_dec: m2m device for decoder
@@ -418,6 +419,7 @@ struct mtk_vcodec_enc_pdata {
 struct mtk_vcodec_dev {
 	struct v4l2_device v4l2_dev;
 	struct video_device *vfd_dec;
+	struct media_device mdev_dec;
 	struct video_device *vfd_enc;
 
 	struct v4l2_m2m_dev *m2m_dev_dec;
-- 
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
