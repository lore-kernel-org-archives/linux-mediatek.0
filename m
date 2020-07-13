Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 188B8C433FC
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:09:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D508B2068F
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:09:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CHZO/rRF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Aai3HAWx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D508B2068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DKM3I31HGFuDIQ/f4ELb5nRC+nxxXCSodP29Yo2hxTI=; b=CHZO/rRF1++veL48puFhRXPp7
	n+vESVUaQRgrWrkl8KRzaMROyZHMjPOLvEWBdn55VkCL2BF+ok+aGY7DCNCVSoiTUtffDFpYNewlA
	WIZYCOZGuRHeOJ48Z9ZSOB/azKlPYiqzquIhsCEVUJsX073A/3EecuukqZHTNpS/ON6FYwjKh6R4E
	cTmtRNylwiQIUnanVg0s52hQeLJ/PnxsP4Z0K5lWhJVh4+18tA+KRjj4M0otqTlXiSL4ONT+OBR4s
	mu92N4dG0bTRhP/ZtevzI7uG0yW+KiPS11sbKeroidx5PmtxZAmLtASKz97EwLUmjS6uBM6NkdFfD
	i5T+Pwttw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jureW-0000NV-3b; Mon, 13 Jul 2020 06:09:24 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jureT-0000Lp-7Z
 for linux-mediatek@lists.infradead.org; Mon, 13 Jul 2020 06:09:22 +0000
Received: by mail-pf1-x443.google.com with SMTP id u18so5541285pfk.10
 for <linux-mediatek@lists.infradead.org>; Sun, 12 Jul 2020 23:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=od+s8D7sQgTmw85zfRSLd23Y+ImDYFPzNWcvRKsmRCA=;
 b=Aai3HAWxaz+GjbxPniSs9/JhAru3ScS+cyevS+ZxJ/l5ccQVp9CucQqLRC/b8i9m0g
 pPkCrb3A6OEQhRzJos63eQ85MSK7RlhNH4iHm2a4TMuJXRFvZ8EuJ2ZC/JxKdzw2uFtr
 gUd66HFgfByRQnCCefpO5/pBFw0SPpKnIU8Jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=od+s8D7sQgTmw85zfRSLd23Y+ImDYFPzNWcvRKsmRCA=;
 b=KZPL/5Gya/g/LPDpIPBPukytwCjq6Ykc4Bo3CWHFlpojK/EINGO5JIsJU1eEie5lYu
 GKcVMBKHlbVomdBbfjl1xPslqV4e5kt8mO/ejsoD5/gnln6zn5MEq8h55LT4zJXLFX/o
 2iKn5j6eBV5npVacdTsWzFngcsNVXJ2BDz8yzzvp4GWi7x5Dn1PJS+MsD4LEm2zyXAL7
 43ag8GI+dfL+6UeNfw//91L/p5a1jA021CqcURG5L7+9L17uYEa431SILD/1v9hv6GEy
 O3wggC4JIzVDx+DAe7OvnBhRLAzOwQr3ITPppHofD4S2IoY5glRhRXLfh5YeHOxct7LK
 lqxg==
X-Gm-Message-State: AOAM5337in9hvk5Uy86qdCvQPOZ4z8s3kttkoy0WB+gy4oJa8hKJt1jV
 RQrwpW78qX0m1bGayweDWUjHZ/bxKNw=
X-Google-Smtp-Source: ABdhPJxyNM8fIDHdgOQy1/cK6WWjOgJvKXYgZI7TVpcd1Y8lDhvPZ0utoPQ6H5JQk35/uyGkYF88JQ==
X-Received: by 2002:a63:b06:: with SMTP id 6mr65423158pgl.116.1594620559230;
 Sun, 12 Jul 2020 23:09:19 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
 by smtp.gmail.com with ESMTPSA id c134sm13134934pfc.115.2020.07.12.23.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2020 23:09:18 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>
Subject: [PATCH v3 03/16] media: mtk-vcodec: add SCP firmware ops
Date: Mon, 13 Jul 2020 15:08:29 +0900
Message-Id: <20200713060842.471356-4-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200713060842.471356-1-acourbot@chromium.org>
References: <20200713060842.471356-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_020921_304026_2D7ECBA3 
X-CRM114-Status: GOOD (  17.74  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>,
 linux-media@vger.kernel.org
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
2.27.0.383.g050319c2ae-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
