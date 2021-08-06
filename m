Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D6E6C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 04:22:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB22C611C5
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 04:22:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB22C611C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=S18Yuw84FniTzFfnqyN6L0gfWmyoIizv1FKiMZMba1E=; b=sqod1BB/K/bnQcGhsvqlwvWP5E
	jo1adk37gztLD5pFjCWKcjYOxIpGVhDbg94gG2rtncBU4wVBafJ9SPbMBuOB44Cm4Vg82ZBVv+O+1
	q/fEh4p1YGRlUCAzOi7arZWmAvFsJJLmDlcAdjkFjZ7gWF43z8BxQ+basK+5b77Oah//578nw6kf0
	rEtPbPC7mfTYc2hkoH2vJXaEOdZLwmkA/kjPnQqAz7ePYa3Duhyjx++KHiwt4Wsc/S091MUENHNHo
	LpsrBykQGZb6YoMoYO8OE9pW/TyKNzviCG+b+1lBEVvLy4f3nY2xmqxZLh0idu5w4PAL/8tyBbPyg
	CwjzvWbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBrNI-00BW4q-9x; Fri, 06 Aug 2021 04:22:24 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBrHi-00BT9Z-QC
 for linux-mediatek@lists.infradead.org; Fri, 06 Aug 2021 04:16:41 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id
 f3-20020a25cf030000b029055a2303fc2dso8346644ybg.11
 for <linux-mediatek@lists.infradead.org>; Thu, 05 Aug 2021 21:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=oPE1v1kYszg9FU+kfYGAPyUdSszW/QUX8TrG+ItsMlc=;
 b=wRAmpjl5Tp1P0V4/0Qs40Z8RIx8HO8peuCxUkTEw7vDEqOCrwiCPA6gZgElPB66Zu8
 DiYTMDT7MJz8qs0/0a3pAjaEaTiahRcoHEIBvZLClQvBViNQ/ooXSHaYTjpUdZNuQOTZ
 7pRl7jPMdnHiSYLc4XwQDUJlIuhggLdHEDrBiVHLmYd7lKGMKmL5d9YKqpwtwQIRbGdK
 HqJaQgvzzab9C7FjnfggAUodA5WAIrLnQjlQ8NASjQNq4wYxmIDYPLWEjvtMgTooabTY
 BSZE+OqLjLuw4GUdAk1ZVhNNXfVdPj4ji2eSQ8UXLtUudY7j9djtOkjWAaG1KS+MsXzj
 s5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=oPE1v1kYszg9FU+kfYGAPyUdSszW/QUX8TrG+ItsMlc=;
 b=DZ5I3H6mU7rV9qdrOMV8vum+Ohh4nJWC4zTgA8p2AqCE8kCeg3CHw5a7z2I8rE9JX9
 1SxYJkJoSW38EXo+rnU8XXhN7E8z87ci+AYJ5hb2C1pClk4M+1RdlQ6SEwX2YjfNDy7N
 QdkCz0y9c0+DkCuI9nbVIfG6wvNr42+wSbyVGVp4cED4+fEcDcXa6LkNzUUH3aS+c85b
 Wnh0TPsJTk1qfK3OTdy0KnW/EfvBfwhxQgKVv476kh9qZa1+Ob6c80QB0DEmLhxhe8Rb
 cNyMioj/Th7hkAK46KyLEsPZwYSGRu4SbxCWuECtaWBvsPRAhLRBjcQDdoQfUdeOklax
 PwVw==
X-Gm-Message-State: AOAM5336Xmo8bzZx3qVUnCxRkYrTk6KpLTSSkaX/x5ERzrvwZMzVnrrX
 Fy9XR9uqRxJ7SM6xiKi8uixGOJM1CDRR
X-Google-Smtp-Source: ABdhPJzHv93sp38BXCMDnFkgYFIopCnlFNt4d9gy77XHq5f8skX6+aGKHwCmhbZiIiEDqty9RHDOn1a0J+A6
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ebc2:859f:4153:773e])
 (user=tzungbi job=sendgmr) by 2002:a25:1e89:: with SMTP id
 e131mr10513765ybe.90.1628223397026; Thu, 05 Aug 2021 21:16:37 -0700 (PDT)
Date: Fri,  6 Aug 2021 12:15:28 +0800
In-Reply-To: <20210806041530.4170869-1-tzungbi@google.com>
Message-Id: <20210806041530.4170869-13-tzungbi@google.com>
Mime-Version: 1.0
References: <20210806041530.4170869-1-tzungbi@google.com>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [PATCH v7 12/14] media: mtk-vcodec: vdec: add media device if using
 stateless api
From: Tzung-Bi Shih <tzungbi@google.com>
To: hverkuil-cisco@xs4all.nl, yunfei.dong@mediatek.com, acourbot@chromium.org
Cc: tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, 
 dafna.hirschfeld@collabora.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, tzungbi@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_211638_970873_71F5E880 
X-CRM114-Status: GOOD (  14.13  )
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

From: Yunfei Dong <yunfei.dong@mediatek.com>

The stateless API requires a media device for issuing requests. Add one
if we are being instantiated as a stateless decoder.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
[acourbot: refactor, cleanup and split]
Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
[tzungbi: fix wrong device minor number reference]
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/media/platform/Kconfig                |  2 +
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 41 ++++++++++++++++++-
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  2 +
 3 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index ae1468aa1b4e..aa277a19e275 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -315,6 +315,8 @@ config VIDEO_MEDIATEK_VCODEC
 	select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
 	select VIDEO_MEDIATEK_VCODEC_SCP if MTK_SCP
 	select V4L2_H264
+	select MEDIA_CONTROLLER
+	select MEDIA_CONTROLLER_REQUEST_API
 	help
 	  Mediatek video codec driver provides HW capability to
 	  encode and decode in a range of video formats on MT8173
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 1460951f302c..fe345aab9853 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -14,6 +14,7 @@
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-contig.h>
+#include <media/v4l2-device.h>
 
 #include "mtk_vcodec_drv.h"
 #include "mtk_vcodec_dec.h"
@@ -316,18 +317,47 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_event_workq;
 	}
 
+	if (dev->vdec_pdata->uses_stateless_api) {
+		dev->mdev_dec.dev = &pdev->dev;
+		strscpy(dev->mdev_dec.model, MTK_VCODEC_DEC_NAME,
+			sizeof(dev->mdev_dec.model));
+
+		media_device_init(&dev->mdev_dec);
+		dev->mdev_dec.ops = &mtk_vcodec_media_ops;
+		dev->v4l2_dev.mdev = &dev->mdev_dec;
+
+		ret = v4l2_m2m_register_media_controller(dev->m2m_dev_dec, dev->vfd_dec,
+							 MEDIA_ENT_F_PROC_VIDEO_DECODER);
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
+		mtk_v4l2_debug(0, "media registered as /dev/media%d", vfd_dec->minor);
+	}
 	ret = video_register_device(vfd_dec, VFL_TYPE_VIDEO, 0);
 	if (ret) {
 		mtk_v4l2_err("Failed to register video device");
 		goto err_dec_reg;
 	}
 
-	mtk_v4l2_debug(0, "decoder registered as /dev/video%d",
-		vfd_dec->num);
+	mtk_v4l2_debug(0, "decoder registered as /dev/video%d", vfd_dec->minor);
 
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
@@ -360,6 +390,13 @@ static int mtk_vcodec_dec_remove(struct platform_device *pdev)
 
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
index 8fb333a99a40..d4f840a7bbcb 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -389,6 +389,7 @@ struct mtk_vcodec_enc_pdata {
  * struct mtk_vcodec_dev - driver data
  * @v4l2_dev: V4L2 device to register video devices for.
  * @vfd_dec: Video device for decoder
+ * @mdev_dec: Media device for decoder
  * @vfd_enc: Video device for encoder.
  *
  * @m2m_dev_dec: m2m device for decoder
@@ -426,6 +427,7 @@ struct mtk_vcodec_enc_pdata {
 struct mtk_vcodec_dev {
 	struct v4l2_device v4l2_dev;
 	struct video_device *vfd_dec;
+	struct media_device mdev_dec;
 	struct video_device *vfd_enc;
 
 	struct v4l2_m2m_dev *m2m_dev_dec;
-- 
2.32.0.605.g8dce9f2422-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
