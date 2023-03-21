Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C22CC7618D
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 10:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFct7KqjEju5S/ZUMIXga4Kdf+tdOlKXgOKhgpWxO10=; b=XqlCODozh5u3mbRzoZt3bJB/nL
	CJY4LhL+eNyMoL1D/LUFbiURnSNnkNpPHhHG8eW6PSymTTGupX0ITzdkN55OiKxjgimgjrzxzfHtd
	8WoEJeEW6QBG2K48HAphJkb08A+Khg4b26SDhVVv7OiaN56RqVrnsDxC0vSP45WpftDMXM5W5Yyg8
	PwVzmVGrSIIw3HU1u8ifRUfeQrtC6mRhMgo4NW4/VH1AOZMjcnBFlOQP4P7ZkSNxMs/gV09blP3DW
	OP2xFQFT09Zdm1GxvLO6sR8tfGrOhc+3wACSxmeozpx3R/X2EMymvWzLcqlm0pRRdHY8jMjgueGq2
	CUozG9yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peZFA-00C1s9-2A;
	Tue, 21 Mar 2023 10:29:28 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peZEu-00C1gM-0k;
	Tue, 21 Mar 2023 10:29:14 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:f5ef:1040:e3c1:3d00])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6BFB966030DF;
	Tue, 21 Mar 2023 10:29:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679394551;
	bh=MdFdpEYlrqYIfUsfLO5+Vx1D2TLTsHnVGjsRgywQ91c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PpvIKeuLF2UAhXtI2Y3ERb8aCPYRxgU20Z4XUyNaM2oM2Enq8/UU6PH5GGAxzIBEq
	 HsOcuMibVJhqGWAj4NQHpB924mcHt0cbQTIpzKdpZZnpvkjT+xiS3HRBKE1Xb1EbcM
	 f5XsyeJK5ZiHnZHrBSQDOAYq9S6kn4osoCgz1qsa16e2dTvivRB05WDvaB7C/TQvG0
	 TbfFzW5LWn0Vl3CYIn1v5qTRz/ycFwUqw/1fwp3xmByYx01yLHyCNcRAO+up+FY8iv
	 S28bzY8wcy4LUIZqt/sG4XT5j//2zCXHiiqdZwLwhuhDDY+q+ADt/GZwdeVxSkCcCY
	 xq2IYhO543Z/w==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: tfiga@chromium.org,
	m.szyprowski@samsung.com,
	mchehab@kernel.org,
	ming.qian@nxp.com,
	shijie.qin@nxp.com,
	eagle.zhou@nxp.com,
	bin.liu@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	stanimir.k.varbanov@gmail.com,
	quic_vgarodia@quicinc.com,
	agross@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	daniel.almeida@collabora.com,
	hverkuil-cisco@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	jernel@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 4/8] media: videobuf2: Stop define VB2_MAX_FRAME as global
Date: Tue, 21 Mar 2023 11:28:51 +0100
Message-Id: <20230321102855.346732-5-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230321102855.346732-1-benjamin.gaignard@collabora.com>
References: <20230321102855.346732-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_032912_524869_172E8C47 
X-CRM114-Status: GOOD (  11.97  )
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

After changing bufs arrays to a dynamic allocated array
VB2_MAX_FRAME doesn't mean anything for videobuf2 core.
Remove it from the core definitions but keep it for drivers internal
needs.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/common/videobuf2/videobuf2-core.c               | 2 ++
 drivers/media/platform/amphion/vdec.c                         | 1 +
 .../media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c | 2 ++
 drivers/media/platform/qcom/venus/hfi.h                       | 2 ++
 drivers/media/platform/verisilicon/hantro_hw.h                | 2 ++
 drivers/staging/media/ipu3/ipu3-v4l2.c                        | 2 ++
 include/media/videobuf2-core.h                                | 1 -
 include/media/videobuf2-v4l2.h                                | 4 ----
 8 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index f4da917ccf3f..3c6ced360770 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -31,6 +31,8 @@
 
 #include <trace/events/vb2.h>
 
+#define VB2_MAX_FRAME	32
+
 static int debug;
 module_param(debug, int, 0644);
 
diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
index 87f9f8e90ab1..bef0c1b869be 100644
--- a/drivers/media/platform/amphion/vdec.c
+++ b/drivers/media/platform/amphion/vdec.c
@@ -28,6 +28,7 @@
 
 #define VDEC_MIN_BUFFER_CAP		8
 #define VDEC_MIN_BUFFER_OUT		8
+#define VB2_MAX_FRAME			32
 
 struct vdec_fs_info {
 	char name[8];
diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
index f5958b6d834a..ba208caf3043 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
@@ -16,6 +16,8 @@
 #include "../vdec_drv_if.h"
 #include "../vdec_vpu_if.h"
 
+#define VB2_MAX_FRAME	32
+
 /* reset_frame_context defined in VP9 spec */
 #define VP9_RESET_FRAME_CONTEXT_NONE0 0
 #define VP9_RESET_FRAME_CONTEXT_NONE1 1
diff --git a/drivers/media/platform/qcom/venus/hfi.h b/drivers/media/platform/qcom/venus/hfi.h
index f25d412d6553..bd5ca5a8b945 100644
--- a/drivers/media/platform/qcom/venus/hfi.h
+++ b/drivers/media/platform/qcom/venus/hfi.h
@@ -10,6 +10,8 @@
 
 #include "hfi_helper.h"
 
+#define VB2_MAX_FRAME				32
+
 #define VIDC_SESSION_TYPE_VPE			0
 #define VIDC_SESSION_TYPE_ENC			1
 #define VIDC_SESSION_TYPE_DEC			2
diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
index e83f0c523a30..9e8faf7ba6fb 100644
--- a/drivers/media/platform/verisilicon/hantro_hw.h
+++ b/drivers/media/platform/verisilicon/hantro_hw.h
@@ -15,6 +15,8 @@
 #include <media/v4l2-vp9.h>
 #include <media/videobuf2-core.h>
 
+#define VB2_MAX_FRAME	32
+
 #define DEC_8190_ALIGN_MASK	0x07U
 
 #define MB_DIM			16
diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index e530767e80a5..6627b5c2d4d6 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -10,6 +10,8 @@
 #include "ipu3.h"
 #include "ipu3-dmamap.h"
 
+#define VB2_MAX_FRAME	32
+
 /******************** v4l2_subdev_ops ********************/
 
 #define IPU3_RUNNING_MODE_VIDEO		0
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index b8b34a993e04..4aa43c5c7c58 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -21,7 +21,6 @@
 #include <media/media-request.h>
 #include <media/frame_vector.h>
 
-#define VB2_MAX_FRAME	(32)
 #define VB2_MAX_PLANES	(8)
 
 /**
diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v4l2.h
index 5a845887850b..88a7a565170e 100644
--- a/include/media/videobuf2-v4l2.h
+++ b/include/media/videobuf2-v4l2.h
@@ -15,10 +15,6 @@
 #include <linux/videodev2.h>
 #include <media/videobuf2-core.h>
 
-#if VB2_MAX_FRAME != VIDEO_MAX_FRAME
-#error VB2_MAX_FRAME != VIDEO_MAX_FRAME
-#endif
-
 #if VB2_MAX_PLANES != VIDEO_MAX_PLANES
 #error VB2_MAX_PLANES != VIDEO_MAX_PLANES
 #endif
-- 
2.34.1


