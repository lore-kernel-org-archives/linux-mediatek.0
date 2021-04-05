Return-Path: <SRS0=PUi9=JC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C59C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Apr 2021 20:04:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42606613BD
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Apr 2021 20:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42606613BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ww5dw9W0Cmb0npWB8eL2AUSUmBjf5eS3cSONCVf55OQ=; b=MPsmtMCyewxZMzlkEsTg57ksW
	0RFTngBPGfj55fIgRQs3YYnKo9qY2ChSeYDICChI3KTk+zzJNwWy+AJI/F0jDt3HRCvPjwZ49laNa
	sR9Up7cWhMOMR/lGxWCbsv15OJfNVT7lgitlEysO9vV9jhSbW3V1lssr5QsWGgV7xk1t9NQQfO/Dq
	rY8RLhOC3ie/Q3yGHCw3/E9GHa5pTe1s+AcZKuYi9sSZ/qVRu5hXGAe5U3NRJQTLvKfbhkeymmg+D
	QSbL0Yg9j/4eSk9gR5v7ZRSOf2emOEIMrKIO+uhfqeuc13Tfbww65yZmRdN6nh0rop9OzU3me2wWP
	xus9Gob2A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTVSH-000XS6-8l; Mon, 05 Apr 2021 20:04:13 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTVS4-000XQH-4S
 for linux-mediatek@lists.infradead.org; Mon, 05 Apr 2021 20:04:03 +0000
Received: by mail-wr1-x431.google.com with SMTP id q26so6197425wrz.9
 for <linux-mediatek@lists.infradead.org>; Mon, 05 Apr 2021 13:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Iq6sk4M0ER3Zgi3ABFpbJFrQaqzKVp7U7JBAXlyNsPU=;
 b=yNG4gsb3MPsFf6S7doVmfsjzSXPpXEGo0eLReJl60qPeOlc9PC4EqkVMFF9OIi2Y7X
 uI/JL5kRwpb1nCbVfE42nsXO9vtdob9Qw1MTZlen3S3ivgWPQV48F751vi/agdDx3P8J
 sXssXEwk+dWNYe3pyPRi94QmCk7ePtJv4nY/8+wCHnUw3QGENDaKpufffxz/yggfx7i3
 +BY5LOciFL4D3IQbzsy+3tT+VF8SaVlwombozEiO6g5Wa2EQAp5ayueKjgTHRWF8fAE7
 r+yMrEbTB2lcfofdPfpQyAPreTU4+s/WED+roBn6iIxSRqCwuAzgapKsEdAF/8nZsWTp
 UCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Iq6sk4M0ER3Zgi3ABFpbJFrQaqzKVp7U7JBAXlyNsPU=;
 b=UwtssmKRy/H8Mek2Yh4Yja2PoKMwKNQFFCm7KSgGYiCC5lomUFnX3UGqpMBK1AO5Ig
 qcgKH+88u9m4VsIYLs3giSeHtJBIV2cgFpg5/jI8u2MdQRJZwgtBzXBU0fCKquVCIoFk
 6sgmfGLi5EBBS/LjBM1elQkwUaVzZ6+4AhZlnKJ6hKqv907yTlw4PnDZW7eiRj/3SzTT
 ijycZ9KJTq7BC4Z9AYD+pdiasEyxbq3SvuWP2eNBQblinUR1o7Y6aDzKH0gwTWvS8uG6
 sixUkEGwx8UIK+In5tdT3w2geuYs/5hb1hUssVcFQYIhN3ti9Ni1TKRi6D5yLjYWgqoJ
 Osbw==
X-Gm-Message-State: AOAM530zIqnvMUsm/xC6ti5C8lpKUg//iEuhPXMMGXGrwsHy2XZYVeP9
 oz0D2WlFrrtk73Q6RPYKQsMpQw==
X-Google-Smtp-Source: ABdhPJwL/GfhUNJgnX1/PyHGr2s1okb14TrKuliA5RPUs5s3fGatDI+r4aJgQDjX2DYgwcTu8ridgQ==
X-Received: by 2002:a5d:5046:: with SMTP id h6mr8570852wrt.265.1617653039583; 
 Mon, 05 Apr 2021 13:03:59 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id i26sm657406wmb.18.2021.04.05.13.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 13:03:59 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/2] soc: mediatek: mmsys: Add support for MT8167 SoC
Date: Mon,  5 Apr 2021 22:03:53 +0200
Message-Id: <20210405200354.2194930-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210405200354.2194930-1-fparent@baylibre.com>
References: <20210405200354.2194930-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_210400_269719_8A77C0E7 
X-CRM114-Status: GOOD (  15.82  )
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

Add routing table for DSI on MT8167 SoC. The registers are mostly
incompatible with the current defines, so new one for MT8167 are added.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

V2: Rebased on top of [0]

[0] https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/log/?h=for-next

 drivers/soc/mediatek/mt8167-mmsys.h | 35 +++++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c    | 11 +++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt8167-mmsys.h

diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/mt8167-mmsys.h
new file mode 100644
index 000000000000..2772ef5e3934
--- /dev/null
+++ b/drivers/soc/mediatek/mt8167-mmsys.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SOC_MEDIATEK_MT8167_MMSYS_H
+#define __SOC_MEDIATEK_MT8167_MMSYS_H
+
+#define MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0x030
+#define MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN	0x038
+#define MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0x058
+#define MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN		0x064
+#define MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN	0x06c
+
+#define MT8167_DITHER_MOUT_EN_RDMA0			0x1
+#define MT8167_RDMA0_SOUT_DSI0				0x2
+#define MT8167_DSI0_SEL_IN_RDMA0			0x1
+
+static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] = {
+	{
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
+		MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_COLOR0,
+	}, {
+		DDP_COMPONENT_DITHER, DDP_COMPONENT_RDMA0,
+		MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_RDMA0
+	}, {
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
+		MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, COLOR0_SEL_IN_OVL0
+	}, {
+		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI0,
+		MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN, MT8167_DSI0_SEL_IN_RDMA0
+	}, {
+		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI0,
+		MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN, MT8167_RDMA0_SOUT_DSI0
+	},
+};
+
+#endif /* __SOC_MEDIATEK_MT8167_MMSYS_H */
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 79e55150210e..080660ef11bf 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -11,6 +11,7 @@
 #include <linux/soc/mediatek/mtk-mmsys.h>
 
 #include "mtk-mmsys.h"
+#include "mt8167-mmsys.h"
 #include "mt8183-mmsys.h"
 
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
@@ -33,6 +34,12 @@ static const struct mtk_mmsys_driver_data mt6797_mmsys_driver_data = {
 	.clk_driver = "clk-mt6797-mm",
 };
 
+static const struct mtk_mmsys_driver_data mt8167_mmsys_driver_data = {
+	.clk_driver = "clk-mt8167-mm",
+	.routes = mt8167_mmsys_routing_table,
+	.num_routes = ARRAY_SIZE(mt8167_mmsys_routing_table),
+};
+
 static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.clk_driver = "clk-mt8173-mm",
 	.routes = mmsys_default_routing_table,
@@ -138,6 +145,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
 		.compatible = "mediatek,mt6797-mmsys",
 		.data = &mt6797_mmsys_driver_data,
 	},
+	{
+		.compatible = "mediatek,mt8167-mmsys",
+		.data = &mt8167_mmsys_driver_data,
+	},
 	{
 		.compatible = "mediatek,mt8173-mmsys",
 		.data = &mt8173_mmsys_driver_data,
-- 
2.31.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
