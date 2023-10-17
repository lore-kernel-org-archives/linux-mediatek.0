Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D25CDB485
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 13:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H9jzd7717P9p0I6JJxHH6fJFt5ut40dhZ3wF3+nCAmg=; b=Ghny4sIAOpvT3RCeqxAofLT5o6
	6K0aCmgaQjcDcIqKO/Wlnr7zKhHpu/1qGn3oA65ylR3zjTS4k6w85gALW1omV0oiGQAxy3TwIgC6r
	lmKsWR3Wqx2IC68+KYs6/7zh3z2D7LFG9+n5RmJDDOVySmy2EXuCwLnD4E4yTCcRr+FrFg9tQmNDG
	qjPyaKJb8SPOI7x0obNGBppWSvzZiRT/rIOwC9w7WspGEnDIgm2chw8+RlTFbNTfJsGVhfDMwVg1C
	HvT+n4F4OWDcZiYKMuOBRzdzLSLqwOMAFmi4Ed/+Yw0lHbtn5z16ayP06wj5LZdQddfeom1xKzLIj
	vHQnfThA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsk0R-00CPbD-13;
	Tue, 17 Oct 2023 13:21:07 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsk0M-00CPYK-0D
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Oct 2023 13:21:04 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00AC6327;
	Tue, 17 Oct 2023 15:20:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1697548852;
	bh=5WLUZ9MmAI1Wlfpv/0JUaIvQs/VDMWoZPdfG7Wee6HY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iK3uLJ/IxDnMSgLqHGGvph3AnUsI0ceCN6LoEzeW4GwpNokJTohfOQVkC1Ht7dwf4
	 K65jjQGgTdHzFbB5fzffWw6bVGBHvvJ3shbXL589CAfhggx3pLA9vcqHod/N0ySVTK
	 ghRLSSDFuxLghJQy+EitIvfwrFuC39iHNsOFYcz4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Paul Elder <paul.elder@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Stephan <jstephan@baylibre.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 2/3] media: uapi: Add controls for the THP7312 ISP
Date: Tue, 17 Oct 2023 16:21:02 +0300
Message-ID: <20231017132103.9914-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231017132103.9914-1-laurent.pinchart@ideasonboard.com>
References: <20231017132103.9914-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_062102_248234_C7F0F3E4 
X-CRM114-Status: GOOD (  17.07  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The THP7312 is an external ISP from THine. As such, it implements a
large number of parameters to control all aspects of the image
processing. Many of those controls are already standard in V4L2, but
some are fairly device-specific.

Reserve a range of 32 controls for the device. The driver will implement
4 device-specific controls to start with, define and document them. 28
additional device-specific controls should be enough for future
development.

Co-developed-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/drivers/index.rst     |  1 +
 .../userspace-api/media/drivers/thp7312.rst   | 32 +++++++++++++++++++
 MAINTAINERS                                   |  2 ++
 include/uapi/linux/thp7312.h                  | 19 +++++++++++
 include/uapi/linux/v4l2-controls.h            |  6 ++++
 5 files changed, 60 insertions(+)
 create mode 100644 Documentation/userspace-api/media/drivers/thp7312.rst
 create mode 100644 include/uapi/linux/thp7312.h

diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index 1726f8ec86fa..6b62c818899f 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -41,4 +41,5 @@ For more details see the file COPYING in the source distribution of Linux.
 	npcm-video
 	omap3isp-uapi
 	st-vgxy61
+	thp7312
 	uvcvideo
diff --git a/Documentation/userspace-api/media/drivers/thp7312.rst b/Documentation/userspace-api/media/drivers/thp7312.rst
new file mode 100644
index 000000000000..7a40c42b1db9
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/thp7312.rst
@@ -0,0 +1,32 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+THine THP7312 ISP driver
+========================
+
+The THP7312 driver implements the following driver-specific controls:
+
+``V4L2_CID_THP7312_LOW_LIGHT_COMPENSATION``
+    Enable/Disable auto-adjustment, based on lighting conditions, of the frame
+    rate when auto-exposure is enabled.
+
+``V4L2_CID_THP7312_AUTO_FOCUS_METHOD``
+    Set method of auto-focus. Only takes effect when auto-focus is enabled.
+
+    .. flat-table::
+        :header-rows:  0
+        :stub-columns: 0
+        :widths:       1 4
+
+        * - ``0``
+          - Contrast-based auto focus
+        * - ``1``
+          - PDAF
+        * - ``2``
+          - Hybrid of contrast-based and PDAF
+
+``V4L2_CID_THP7312_NOISE_REDUCTION_AUTO``
+    Enable/Disable auto noise reduction.
+
+``V4L2_CID_THP7312_NOISE_REDUCTION_ABSOLUTE``
+    Set the noise reduction strength, where 0 is the weakest and 10 is the
+    strongest.
diff --git a/MAINTAINERS b/MAINTAINERS
index 7451367e6780..d2c15c0b22c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21454,6 +21454,8 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
+F:	Documentation/userspace-api/media/drivers/thp7312.rst
+F:	include/uapi/linux/thp7312.h
 
 THUNDERBOLT DMA TRAFFIC TEST DRIVER
 M:	Isaac Hazan <isaac.hazan@intel.com>
diff --git a/include/uapi/linux/thp7312.h b/include/uapi/linux/thp7312.h
new file mode 100644
index 000000000000..2b629e05daf9
--- /dev/null
+++ b/include/uapi/linux/thp7312.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * THine THP7312 user space header file.
+ *
+ * Copyright (C) 2021 THine Electronics, Inc.
+ * Copyright (C) 2023 Ideas on Board Oy
+ */
+
+#ifndef __UAPI_THP7312_H_
+#define __UAPI_THP7312_H_
+
+#include <linux/v4l2-controls.h>
+
+#define V4L2_CID_THP7312_LOW_LIGHT_COMPENSATION		(V4L2_CID_USER_THP7312_BASE + 0x01)
+#define V4L2_CID_THP7312_AUTO_FOCUS_METHOD		(V4L2_CID_USER_THP7312_BASE + 0x02)
+#define V4L2_CID_THP7312_NOISE_REDUCTION_AUTO		(V4L2_CID_USER_THP7312_BASE + 0x03)
+#define V4L2_CID_THP7312_NOISE_REDUCTION_ABSOLUTE	(V4L2_CID_USER_THP7312_BASE + 0x04)
+
+#endif /* __UAPI_THP7312_H_ */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 68db66d4aae8..99c3f5e99da7 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -209,6 +209,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_NPCM_BASE			(V4L2_CID_USER_BASE + 0x11b0)
 
+/*
+ * The base for THine THP7312 driver controls.
+ * We reserve 32 controls for this driver.
+ */
+#define V4L2_CID_USER_THP7312_BASE		(V4L2_CID_USER_BASE + 0x11c0)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
Regards,

Laurent Pinchart


