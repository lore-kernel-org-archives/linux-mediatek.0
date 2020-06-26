Return-Path: <SRS0=tuDC=AH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF67C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 10:45:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A79E9206B7
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 10:45:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bkJAtqY2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XNK0By4T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A79E9206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NxMUNaFuqj6ZQK8JEBNJ4NpCZdpjDqHFFH8vKvdtvlA=; b=bkJAtqY2uUs3LehLjvb/80map
	hgjPbOanKoTydOIRgtpks0mAXVfjWHFE6HZJyZybBepOYhfq5MeSuFeER1WEJWatOfw2y/eCRf43D
	go730HisI6EmO3CfhHltlUExz5X6FGm+l11haavJeHMbPALPHMOStUyWmPuzfrK96FKK6jiP6iLYi
	FEoCjI/PQyqSzd99fAXXAwiOcrN79Be6x0Zva6GH52HIQFbC0jNmhu9CaHqmU09FsvLogad8v7egE
	oQoELFLdC4K/der9HwyDKfXu24AE3dOl4qnvvy/WiTLPcqPMeP2Pd8Pq1jlKVjMPGrIEvv6D0OPL3
	AYCK+Mtww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jolrI-0003gl-7n; Fri, 26 Jun 2020 10:45:24 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jolqo-0003TG-RH
 for linux-mediatek@lists.infradead.org; Fri, 26 Jun 2020 10:45:05 +0000
Received: by mail-io1-xd42.google.com with SMTP id i25so9351941iog.0
 for <linux-mediatek@lists.infradead.org>; Fri, 26 Jun 2020 03:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pEts2rsoj175wFY+tlSjww5eEC9Of/8129OmoLMEaDU=;
 b=XNK0By4Tfxd2iWp3T22+F1bERZBKAD7Jz8EaFPh72TTTSKXdCfOzYeRsmpykTCPlNA
 k2lvpVjLz9VIT73e2PvR7YodONDvJsCUNzpdH6swc3JmuuMGAEe0iElCda89ov1TNZUY
 mO/uxRgMs4T+WbtNBkclp57Zvo9MJNl/XdGDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pEts2rsoj175wFY+tlSjww5eEC9Of/8129OmoLMEaDU=;
 b=XJwJOxUHzVxhrkkMrebNeoYnFZG4iXx0YEk2LEIPuDE+hsTi3BBPxTK7vjz3JyvbM6
 iZgRcmxM/rxQRWqgym8nsetJNLKu8EVTRFf02zYkajpWM6aWhsPF8opkaY81NRFMp8/+
 FOClSFQ6KkV/lUU+P9MwiudIPLmvj0LM6ftSpEWaYYDdg+blUlVTtj4zry7p1D8GtJHu
 ciC1DSIJ5YjjiaXD30DoDPALBMKfMG7kEfdNu7BnuKYOxmFYT8MDIJvT13SkPFyqOkUV
 Sgw7HgUWGRVFm9phneT7Nb8c8j1pl+zjAQnhZpY/Z4MvwqkfHWCJl3+KRbRASo8cW2j0
 rybA==
X-Gm-Message-State: AOAM532gtY6RJNPIS/7fJyJU98D0LNaOMKbOWk+2wemY4kWPM6WAdCt6
 YvJJjm48NnXgHwWctaDCTCS/Cid2nZV5jA==
X-Google-Smtp-Source: ABdhPJykJQg43pFhOyhwxIPWgq2E+X/Fp119mjJ+a9oU+/wtk+ningLAkXZsFmN9HxrH/R+ppAdZ+g==
X-Received: by 2002:a63:84c3:: with SMTP id k186mr1616922pgd.394.1593158736407; 
 Fri, 26 Jun 2020 01:05:36 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:93d9:de4d:e834:3086])
 by smtp.gmail.com with ESMTPSA id 137sm21809843pgg.72.2020.06.26.01.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 01:05:35 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>
Subject: [PATCH v2 02/18] media: mtk-vcodec: add SCP firmware ops
Date: Fri, 26 Jun 2020 17:04:26 +0900
Message-Id: <20200626080442.292309-3-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200626080442.292309-1-acourbot@chromium.org>
References: <20200626080442.292309-1-acourbot@chromium.org>
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

Add support for communicating with the SCP firmware, which will be used
by MT8183.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
[acourbot: refactor, cleanup and split]
Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
---
 drivers/media/platform/Kconfig                |  1 +
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  3 +
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  3 +
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 56 +++++++++++++++++++
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |  2 +
 5 files changed, 65 insertions(+)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index c57ee78fa99d..f0dbe048efea 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -256,6 +256,7 @@ config VIDEO_MEDIATEK_VCODEC
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
 	select VIDEO_MEDIATEK_VPU
+	select MTK_SCP
 	help
 	    Mediatek video codec driver provides HW capability to
 	    encode and decode in a range of video formats
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 4f07a5fcce7f..5b5765b98e57 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -225,6 +225,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
 				  &rproc_phandle)) {
 		fw_type = VPU;
+	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
+					 &rproc_phandle)) {
+		fw_type = SCP;
 	} else {
 		mtk_v4l2_err("Could not get vdec IPI device");
 		return -ENODEV;
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index 4340ea10afd0..42530cd01a30 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -233,6 +233,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
 				  &rproc_phandle)) {
 		fw_type = VPU;
+	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
+					 &rproc_phandle)) {
+		fw_type = SCP;
 	} else {
 		mtk_v4l2_err("Could not get venc IPI device");
 		return -ENODEV;
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
index 967bb100a990..f2a62ea62fc6 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
@@ -19,6 +19,7 @@ struct mtk_vcodec_fw {
 	enum mtk_vcodec_fw_type type;
 	const struct mtk_vcodec_fw_ops *ops;
 	struct platform_device *pdev;
+	struct mtk_scp *scp;
 };
 
 static int mtk_vcodec_vpu_load_firmware(struct mtk_vcodec_fw *fw)
@@ -71,6 +72,48 @@ static const struct mtk_vcodec_fw_ops mtk_vcodec_vpu_msg = {
 	.ipi_send = mtk_vcodec_vpu_ipi_send,
 };
 
+static int mtk_vcodec_scp_load_firmware(struct mtk_vcodec_fw *fw)
+{
+	return rproc_boot(scp_get_rproc(fw->scp));
+}
+
+static unsigned int mtk_vcodec_scp_get_vdec_capa(struct mtk_vcodec_fw *fw)
+{
+	return scp_get_vdec_hw_capa(fw->scp);
+}
+
+static unsigned int mtk_vcodec_scp_get_venc_capa(struct mtk_vcodec_fw *fw)
+{
+	return scp_get_venc_hw_capa(fw->scp);
+}
+
+static void *mtk_vcodec_vpu_scp_dm_addr(struct mtk_vcodec_fw *fw,
+					u32 dtcm_dmem_addr)
+{
+	return scp_mapping_dm_addr(fw->scp, dtcm_dmem_addr);
+}
+
+static int mtk_vcodec_scp_set_ipi_register(struct mtk_vcodec_fw *fw, int id,
+		mtk_vcodec_ipi_handler handler, const char *name, void *priv)
+{
+	return scp_ipi_register(fw->scp, id, handler, priv);
+}
+
+static int mtk_vcodec_scp_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
+		unsigned int len, unsigned int wait)
+{
+	return scp_ipi_send(fw->scp, id, buf, len, wait);
+}
+
+static const struct mtk_vcodec_fw_ops mtk_vcodec_rproc_msg = {
+	.load_firmware = mtk_vcodec_scp_load_firmware,
+	.get_vdec_capa = mtk_vcodec_scp_get_vdec_capa,
+	.get_venc_capa = mtk_vcodec_scp_get_venc_capa,
+	.map_dm_addr = mtk_vcodec_vpu_scp_dm_addr,
+	.ipi_register = mtk_vcodec_scp_set_ipi_register,
+	.ipi_send = mtk_vcodec_scp_ipi_send,
+};
+
 static void mtk_vcodec_reset_handler(void *priv)
 {
 	struct mtk_vcodec_dev *dev = priv;
@@ -94,6 +137,7 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
 	const struct mtk_vcodec_fw_ops *ops;
 	struct mtk_vcodec_fw *fw;
 	struct platform_device *fw_pdev = NULL;
+	struct mtk_scp *scp = NULL;
 
 	switch (type) {
 	case VPU:
@@ -106,6 +150,14 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
 		vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_reset_handler,
 				    dev, rst_id);
 		break;
+	case SCP:
+		ops = &mtk_vcodec_rproc_msg;
+		scp = scp_get(dev->plat_dev);
+		if (!scp) {
+			mtk_v4l2_err("could not get vdec scp handle");
+			return ERR_PTR(-EPROBE_DEFER);
+		}
+		break;
 	default:
 		mtk_v4l2_err("invalid vcodec fw type");
 		return ERR_PTR(-EINVAL);
@@ -118,6 +170,7 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
 	fw->type = type;
 	fw->ops = ops;
 	fw->pdev = fw_pdev;
+	fw->scp = scp;
 
 	return fw;
 }
@@ -129,6 +182,9 @@ void mtk_vcodec_fw_release(struct mtk_vcodec_fw *fw)
 	case VPU:
 		put_device(&fw->pdev->dev);
 		break;
+	case SCP:
+		scp_put(fw->scp);
+		break;
 	}
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_fw_release);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
index ff25b0c19f74..ced1b6a10e07 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
@@ -4,6 +4,7 @@
 #define _MTK_VCODEC_FW_H_
 
 #include <linux/remoteproc.h>
+#include <linux/remoteproc/mtk_scp.h>
 
 #include "../mtk-vpu/mtk_vpu.h"
 
@@ -11,6 +12,7 @@ struct mtk_vcodec_dev;
 
 enum mtk_vcodec_fw_type {
 	VPU,
+	SCP,
 };
 
 struct mtk_vcodec_fw;
-- 
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
