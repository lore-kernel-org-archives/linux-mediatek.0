Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFE6C6FA99
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 16:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EIz7uldrpE/4a3Yn78TCMTOPk2yNsXBeiewFP++iTtI=; b=aCzJAC0ccgbjG49Vbh9DOFwRFc
	OCp59Rt6F2REVdqtOimydHRxoTKrthy3yRlcjwx2RAsFfoMAbiGVaVm/jvqFcAo9zMGeeeDqUUwr0
	q94BJbUpYW6C/y+WDKxNf7F7uwNNUIDFlp8B7YZIsQvWvZjIAUDMK58bHE98VpQgLRnuyXUrC3hDd
	wLbb2O+aYGMCUVtHXbLV5e4FndZkI5yTDrRZUr83g3LOgNDUJc4tFAnCUTKwQTDjZVSfkwv2GNBN5
	tbmAi5y0Lzj79kvUHntmArNv9nZSQCUOn7VTF0WjQVUqWw7YhMB7q4Xk60qm0tZuvQVbSFFNLoyUO
	9GXl5rmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pafBr-00FAH6-0w; Fri, 10 Mar 2023 16:01:55 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pae1v-00Emfm-Jc; Fri, 10 Mar 2023 14:47:37 +0000
Received: by mail-oi1-f173.google.com with SMTP id t22so4365685oiw.12;
        Fri, 10 Mar 2023 06:47:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678459654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EIz7uldrpE/4a3Yn78TCMTOPk2yNsXBeiewFP++iTtI=;
        b=O/O3pcl2diCyb2Zvd3jpSYqmR+3pmoW1WC7VyxU4MY2G5dpecfsIFrbOixWgZeVsw+
         pFzmFcU69fVw6V1ZaLFH7NZNnHSC7mkxKTrLW6c/2Pkv2buZ+9cPAafp6rHlWpt4VV2g
         l3TO01ZRO5PDHvcqSCEVZEZ3I5oxfyN/SnCGJO+98W1sCiWRvuYkSjLP00CVITbfOzLp
         AnUMTQeAth44xSA2bk+j+iU93PDVbHQoF8B0IC4I6VMehm1gZPahs8ybeTN5OpLtGv9N
         MP87qxmvP0CI0ZMQGL/ceq3R/IjNRTAsGWFGqn4rYOckCKbowF/e/mO3xcAL4xqNqbJC
         mP/A==
X-Gm-Message-State: AO0yUKVoTtuXAWGOjBjUhy7x1Sap/8hYSXd34gQ4JmVsBsYWTeyImFEt
	Etrs3krv8/2qUx2/oUkdJQ==
X-Google-Smtp-Source: AK7set/GOJZQNFQdvex7AhT10x8uYUWw1aDar530wB//wxV61PlLIWKRODfn7mKYRTKkWueDppQvnA==
X-Received: by 2002:a05:6808:1d2:b0:384:167d:736b with SMTP id x18-20020a05680801d200b00384167d736bmr10994562oic.15.1678459654281;
        Fri, 10 Mar 2023 06:47:34 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q12-20020a4ad54c000000b005252e5b6604sm834079oos.36.2023.03.10.06.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 06:47:33 -0800 (PST)
Received: (nullmailer pid 1543252 invoked by uid 1000);
	Fri, 10 Mar 2023 14:47:11 -0000
From: Rob Herring <robh@kernel.org>
To: Bin Liu <bin.liu@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Hyun Kwon <hyun.kwon@xilinx.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@xilinx.com>
Cc: devicetree@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] media: Use of_property_present() for testing DT property presence
Date: Fri, 10 Mar 2023 08:47:11 -0600
Message-Id: <20230310144711.1543225-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_064735_701668_EB1C488D 
X-CRM114-Status: GOOD (  14.27  )
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

It is preferred to use typed property access functions (i.e.
of_property_read_<type> functions) rather than low-level
of_get_property/of_find_property functions for reading properties. As
part of this, convert of_get_property/of_find_property calls to the
recently added of_property_present() helper when we just want to test
for presence of a property and nothing more.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c        | 2 +-
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c | 2 +-
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c | 2 +-
 drivers/media/platform/xilinx/xilinx-vtc.c                  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 969516a940ba..1a2b3214b6f8 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1757,7 +1757,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 	jpeg->vdev->device_caps = V4L2_CAP_STREAMING |
 				  V4L2_CAP_VIDEO_M2M_MPLANE;
 
-	if (of_get_property(pdev->dev.of_node, "dma-ranges", NULL))
+	if (of_property_present(pdev->dev.of_node, "dma-ranges"))
 		dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
 
 	ret = video_register_device(jpeg->vdev, VFL_TYPE_VIDEO, -1);
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
index 174a6eec2f54..d2db8ccaa4c0 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
@@ -321,7 +321,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (of_get_property(pdev->dev.of_node, "dma-ranges", NULL)) {
+	if (of_property_present(pdev->dev.of_node, "dma-ranges")) {
 		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
 		if (ret) {
 			mtk_v4l2_err("Failed to set mask");
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
index 9095186d5495..199042034a3c 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
@@ -344,7 +344,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_event_workq;
 	}
 
-	if (of_get_property(pdev->dev.of_node, "dma-ranges", NULL))
+	if (of_property_present(pdev->dev.of_node, "dma-ranges"))
 		dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
 
 	ret = video_register_device(vfd_enc, VFL_TYPE_VIDEO, -1);
diff --git a/drivers/media/platform/xilinx/xilinx-vtc.c b/drivers/media/platform/xilinx/xilinx-vtc.c
index 0ae0208d7529..cb4b421a348d 100644
--- a/drivers/media/platform/xilinx/xilinx-vtc.c
+++ b/drivers/media/platform/xilinx/xilinx-vtc.c
@@ -254,7 +254,7 @@ struct xvtc_device *xvtc_of_get(struct device_node *np)
 	struct xvtc_device *found = NULL;
 	struct xvtc_device *xvtc;
 
-	if (!of_find_property(np, "xlnx,vtc", NULL))
+	if (!of_property_present(np, "xlnx,vtc"))
 		return NULL;
 
 	xvtc_node = of_parse_phandle(np, "xlnx,vtc", 0);
-- 
2.39.2


