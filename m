Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B158C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 16:19:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 884AB61244
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 16:19:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 884AB61244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I2hoLzmuHvosQTRmfhZ2T9FZtV4h85qqlB6r4VKLQ4M=; b=N2T+oJXqQMTY3m9kAf9LEWgwx
	mkkEjXfeT/sQkaFnVp57VSl0i+HQ967Qj7LcD44/G9Zv1GBWhdcuvU2B2AKbXaE73uPVxQSEyT6dF
	gpSszgKUEApjtAqKyJ3WJPQlH8D0uHYZ5pl38bEjqVukXLDkUbNgmhuMqNHjKAkzwz1DA3tqhUOsc
	vRtS2COVXdZownfPOf5cr1xN0nvMbeu0fVB8Y+ZcFiqWS6UVrxQQ4lj6Tp4prPkMZqEjG7K9Kdyeq
	yoIrKKEIw0/v3gNpja6hCvMrUynGwKPUQMwd7/vPhhmDWvujETUYIVGfVff4T+EBo5Nv6FPfH8L1w
	A0HZ99e+w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljOus-004UlK-S3; Wed, 19 May 2021 16:19:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljOuQ-004UfD-7I
 for linux-mediatek@desiato.infradead.org; Wed, 19 May 2021 16:18:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=1tDzYjlDgxmjzjobVmYcSz4r7xXPp8M3cZtPHLcuKcM=; b=V4M9X8XrpOLlHOfHyVUxOpjrF/
 /kHCt/1ON2xaXo4yndVBMSRSN4AP1w9w9uo7RyOPZrcac1dZ5BVO7R5WZD1c2uw2V6kGprLL/7p8m
 hjrUjTv9tLN0+FpGwBr9Vg0Pr8aec6jLC239G6RSyKiopvVNRJGqEGJMzQ/s2fZ6rAeRe9wL4CWvU
 tvj+HWFdsx+hnjfLHyX97Mva8X8eUb6LY7U7aNzzyhT4kYr4E37ZprDwWZx/4g9i37jo2jJ5wDkka
 K2DZT+nIHockXFtEW7KQGhWaxbZggIsb5Mz3nb2KlHuJDULr5useeiEisoSk4TM5+xBqQLJ24hM7q
 ihxuVOSg==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljOuN-00FcXJ-9L
 for linux-mediatek@lists.infradead.org; Wed, 19 May 2021 16:18:56 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so3652158wmh.4
 for <linux-mediatek@lists.infradead.org>; Wed, 19 May 2021 09:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1tDzYjlDgxmjzjobVmYcSz4r7xXPp8M3cZtPHLcuKcM=;
 b=VEjoOzDCPyBnjHP/G+BRd8AKbPY6qS8lTWusp2nzrpszqPBx3pksX3LvcjKvTFtI4h
 x+kr1EYslL8oMYIPdVG1M1ncBdLkReUq/bcmfEmLyVrfvRxJhyfS+5jQFQvVPVImSk01
 Wt2NDHNbIn5QIHUDYnWOSogfESFmWpESmHZgpgVvgnw/msKDXXkj9ulWEB4UE6IYkswJ
 oMW6al367zYMbFEfHtWTxi2BvY25srwWc1GkULdPeNSTq8HhFesYmbiryAbr6Bbr8eDk
 ArNWLn54QKUA0Q0mRTPPRYMOE55ypC7xQnpYMudhPpYBfCzdjAA3RVF8ImwGYDCH+I0Z
 rgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1tDzYjlDgxmjzjobVmYcSz4r7xXPp8M3cZtPHLcuKcM=;
 b=VOzDU3ELifRpSHstdUfOM71Uv+Qnve3O0oXPOrAsxzxEErmjXmFISqnhU9AOeAk5yt
 XsdJPx4XQOwqDO4XBMPSEH8btJ0JEbEAsrCPuig+wFJprJ8MyEH0VLPtO5zbd/h6Iq5U
 UmD2h5/VdkbEXtBOkEMPiv9jLS/zowMwUuklsMiv/HFBLh/7OhHJlXo3ogQbIaUa1DaR
 2YQCB0zepItiGAh2L6NfYi8EsO8sULNckh91VcTUB/TCdKQQzhfpWoU8FRrEQmkoa/ch
 cS9LN9X2CZUrHB8qvcJ+G+1JUcGEg1uxvwoKa+DhFP43OW4Ngs/vOmdmOm2VWD9SEPz/
 QqLQ==
X-Gm-Message-State: AOAM532/Ijw1LJC10pSDQNDj3T9ouJMDJqtFGsbgx4hLpoSezZQfU+JZ
 S9hvz+/jTDuvDSeNX0PKL2DQxA==
X-Google-Smtp-Source: ABdhPJx339v7qsUtnr6FF5kKHb2G5akgAZXS2RG7+qV4roVMKFwgXBX6GCtrEbz0xlJFj1y+X7Zepg==
X-Received: by 2002:a1c:65c2:: with SMTP id z185mr143143wmb.2.1621441133512;
 Wed, 19 May 2021 09:18:53 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id m9sm5638547wmq.40.2021.05.19.09.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 09:18:53 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH 3/3] soc: mediatek: mmsys: add MT8365 support
Date: Wed, 19 May 2021 18:18:46 +0200
Message-Id: <20210519161847.3747352-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519161847.3747352-1-fparent@baylibre.com>
References: <20210519161847.3747352-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_091855_333437_D1659D3F 
X-CRM114-Status: GOOD (  15.88  )
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

Add DSI mmsys connections for the MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/soc/mediatek/mt8365-mmsys.h | 60 +++++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c    | 11 ++++++
 2 files changed, 71 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt8365-mmsys.h

diff --git a/drivers/soc/mediatek/mt8365-mmsys.h b/drivers/soc/mediatek/mt8365-mmsys.h
new file mode 100644
index 000000000000..2475aeb79791
--- /dev/null
+++ b/drivers/soc/mediatek/mt8365-mmsys.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SOC_MEDIATEK_MT8365_MMSYS_H
+#define __SOC_MEDIATEK_MT8365_MMSYS_H
+
+#define MT8365_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0xf3c
+#define MT8365_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL	0xf4c
+#define MT8365_DISP_REG_CONFIG_DISP_DITHER0_MOUT_EN	0xf50
+#define MT8365_DISP_REG_CONFIG_DISP_RDMA0_SEL_IN	0xf54
+#define MT8365_DISP_REG_CONFIG_DISP_RDMA0_RSZ0_SEL_IN	0xf60
+#define MT8365_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0xf64
+#define MT8365_DISP_REG_CONFIG_DISP_DSI0_SEL_IN		0xf68
+
+#define MT8365_RDMA0_SOUT_COLOR0			0x1
+#define MT8365_DITHER_MOUT_EN_DSI0			0x1
+#define MT8365_DSI0_SEL_IN_DITHER			0x1
+#define MT8365_RDMA0_SEL_IN_OVL0			0x0
+#define MT8365_RDMA0_RSZ0_SEL_IN_RDMA0			0x0
+#define MT8365_DISP_COLOR_SEL_IN_COLOR0			0x0
+#define MT8365_OVL0_MOUT_PATH0_SEL			BIT(0)
+
+static const struct mtk_mmsys_routes mt8365_mmsys_routing_table[] = {
+	{
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
+		MT8365_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN,
+		MT8365_OVL0_MOUT_PATH0_SEL
+	},
+	{
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
+		MT8365_DISP_REG_CONFIG_DISP_RDMA0_SEL_IN,
+		MT8365_RDMA0_SEL_IN_OVL0
+	},
+	{
+		DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
+		MT8365_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL,
+		MT8365_RDMA0_SOUT_COLOR0
+	},
+	{
+		DDP_COMPONENT_COLOR0, DDP_COMPONENT_CCORR,
+		MT8365_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN,
+		MT8365_DISP_COLOR_SEL_IN_COLOR0
+	},
+	{
+		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		MT8365_DISP_REG_CONFIG_DISP_DITHER0_MOUT_EN,
+		MT8365_DITHER_MOUT_EN_DSI0
+	},
+	{
+		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		MT8365_DISP_REG_CONFIG_DISP_DSI0_SEL_IN,
+		MT8365_DSI0_SEL_IN_DITHER
+	},
+	{
+		DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
+		MT8365_DISP_REG_CONFIG_DISP_RDMA0_RSZ0_SEL_IN,
+		MT8365_RDMA0_RSZ0_SEL_IN_RDMA0
+	},
+};
+
+#endif /* __SOC_MEDIATEK_MT8365_MMSYS_H */
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 080660ef11bf..44aff822d035 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -13,6 +13,7 @@
 #include "mtk-mmsys.h"
 #include "mt8167-mmsys.h"
 #include "mt8183-mmsys.h"
+#include "mt8365-mmsys.h"
 
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.clk_driver = "clk-mt2701-mm",
@@ -52,6 +53,12 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
 };
 
+static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
+	.clk_driver = "clk-mt8365-mm",
+	.routes = mt8365_mmsys_routing_table,
+	.num_routes = ARRAY_SIZE(mt8365_mmsys_routing_table),
+};
+
 struct mtk_mmsys {
 	void __iomem *regs;
 	const struct mtk_mmsys_driver_data *data;
@@ -157,6 +164,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
 		.compatible = "mediatek,mt8183-mmsys",
 		.data = &mt8183_mmsys_driver_data,
 	},
+	{
+		.compatible = "mediatek,mt8365-mmsys",
+		.data = &mt8365_mmsys_driver_data,
+	},
 	{ }
 };
 
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
