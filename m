Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF3CC07E9A
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:34:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19976613C9
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19976613C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6JvCNgIdHGnx219JQ7yoskHy6g9CFhCewF3YcLEtfmk=; b=JbmRw5DnRRlpxo
	8q6ehskqRk71tmHwDBY6KVdF0kpLyoGB1T5pWQUZRXyY/j7S7psjDRirdRngHEFJCVazYtCdjPS8M
	u0p/ZH1VK9ySLgRyS16LcmYL8c4TB2qJgRe+0IrsZx4cyFmkSiQdWmS4gBn1+yYV+6cnJZoLWXS6U
	IpPwo1MO789hGaK/P3uYqqBL1DWD4/EHHOq7EfPo/QLK3epRFQu1lWsqnUKSWqpOSNzgwZ+d+G4RG
	gEt3XlWtZVhg0/TH2IlWeSv6s+ciyqGToLl3w15ZWijaVom87n8nncbAh/bnhCz6Eph6dVGOoCuox
	R7YQUjCXogJNOunxFEMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0HF1-007ql9-S4; Mon, 05 Jul 2021 05:33:59 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0HEy-007qga-8J
 for linux-mediatek@lists.infradead.org; Mon, 05 Jul 2021 05:33:58 +0000
Received: by mail-pj1-x1029.google.com with SMTP id q91so11040985pjk.3
 for <linux-mediatek@lists.infradead.org>; Sun, 04 Jul 2021 22:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ns0DapCMubgOZ94OeY0RlTOboqd9zairbJgKcldN3eM=;
 b=g2f310uYbToUSSlRaXZ/YunpI5tUUIBl9ki82JkCrNXhW1Jhjsc/+z0Lx92VabfOZ/
 Gl50L9ZM1tqxs3nlYcKQrXgODbWeGS9AOTgUVqjE5XPPyp+N1aJhFwruTixkQHJ/Qzhr
 BVzCerljCPvKU6kMbIpwid3QyHAGSRquV3FTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ns0DapCMubgOZ94OeY0RlTOboqd9zairbJgKcldN3eM=;
 b=HiyTANsLFmIR0fMxbcTqjFMIRxx/bll17XommjUxiLUN21kn41e0A76EidgwF0PnjQ
 rSavlG5RA5L7HjLAmosxCpvzEF+2x9KqJm5w4uBenPuHddiBlS6objay7/SdmuphdrAH
 kNRWT6mFMbYc+Z04BqhzM6cQNyXM0ys94aDG8tp+/bcKM1mxEjznmiYKEQG3F4Yk6ME2
 W9pmMZr0eQ+k4Z4NxEDEt9+muKg9XW2QlMoaHaz4F1cT10FNIEm4GLLs0UM/KxM6Svq2
 LlLlw0e7zTksSAk0DelBLMNA15n4Dl3ictm52IO3UsdE6teqmbO3Si3oCoE9ZJf7tRIA
 6EvQ==
X-Gm-Message-State: AOAM533c09xOZADPrGEfJDzJSs+l4si2pa3kZMyvxbmNFSWUPEF7oFOJ
 M5WmOiIk9/6Kl66uJLJH+SbvYA==
X-Google-Smtp-Source: ABdhPJxcbmscfUobme0Kyjv6beQRQ0dMgRhVparuFRKNg9+C2HdikN9gdwiwvEm/tDqVPcu84TDDBQ==
X-Received: by 2002:a17:902:760e:b029:126:d03c:9632 with SMTP id
 k14-20020a170902760eb0290126d03c9632mr11020317pll.80.1625463235138; 
 Sun, 04 Jul 2021 22:33:55 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:3fed:7130:60f:265a])
 by smtp.gmail.com with ESMTPSA id x19sm6805245pfp.115.2021.07.04.22.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 22:33:54 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>,
 Tzung-Bi Shih <tzungbi@google.com>
Subject: [PATCH v6 12/14] media: mtk-vcodec: vdec: add media device if using
 stateless api
Date: Mon,  5 Jul 2021 14:32:56 +0900
Message-Id: <20210705053258.1614177-13-acourbot@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210705053258.1614177-1-acourbot@chromium.org>
References: <20210705053258.1614177-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_223356_332463_175E9912 
X-CRM114-Status: GOOD (  14.87  )
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
---
 drivers/media/platform/Kconfig                |  2 +
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 38 +++++++++++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  2 +
 3 files changed, 42 insertions(+)

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
index 1460951f302c..c8a84fa11e4a 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -14,6 +14,7 @@
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-contig.h>
+#include <media/v4l2-device.h>
 
 #include "mtk_vcodec_drv.h"
 #include "mtk_vcodec_dec.h"
@@ -316,6 +317,30 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
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
+		mtk_v4l2_debug(0, "media registered as /dev/media%d", vfd_dec->num);
+	}
 	ret = video_register_device(vfd_dec, VFL_TYPE_VIDEO, 0);
 	if (ret) {
 		mtk_v4l2_err("Failed to register video device");
@@ -328,6 +353,12 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
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
@@ -360,6 +391,13 @@ static int mtk_vcodec_dec_remove(struct platform_device *pdev)
 
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
2.32.0.93.g670b81a890-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
