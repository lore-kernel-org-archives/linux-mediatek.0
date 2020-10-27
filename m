Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31606C55178
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 16:07:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0851206C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 16:07:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r4/bhr9Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Z7PBAuqg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0851206C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LTSG8igj16j/Pc6N6MVk3N8MdUOCzg84VZ+QGZyjJnw=; b=r4/bhr9Zo0tTHafSm9EmPpedA
	zCILwwR7wdDMnCOpEK6iXrP+yi6si7NeMPgTCvV8bFBmqTUMah513XLS2twsGyqSTPeP3lwuAWEVR
	AieWoO0cEABib+b7oBrp+fqaJfchSiCRxQ9hElRWGmg+B73y2whd5wxuxwiLEkZm2+VcV/AlprnKL
	W92RbA9iAjAzRR+uTNfjT/gIhFFLUgQNDoxDYyYgT1CzRLvyUzX6ZQyw+cX8AOzDoGT2GvTTU83Sx
	uyuzHURMQP4D6Nhm39W/pg3Ghk7kg7LEH1GGYQx2pHsqV6unwdzJMKsowJmY58TWVNStfsZch6M9A
	+By3FMc6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXRUk-0008Bw-WC; Tue, 27 Oct 2020 16:06:47 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXRUd-00087e-8E
 for linux-mediatek@lists.infradead.org; Tue, 27 Oct 2020 16:06:41 +0000
Received: by mail-wm1-x343.google.com with SMTP id h22so2002904wmb.0
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Oct 2020 09:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gXSEQ4RUigdrvEfUyIgbTcDJA4ZN5o0EgF33NFMe/HI=;
 b=Z7PBAuqgcEVXrYXq5zpM+K2aVf6AMg0r/JAMVFHkIIX/SHkuy21wembDxlSchyeVQh
 skD9R5Gul6GtMbRtqXsI+hBPJj2U0IUVhsxaZ1nGFh3tgll1CkOvokBHZMgal5o10fFO
 +oRUWXI9R7Pr1xIfIN4Sq5jUmRkZ2JP3ro70EHknjrLAnlrD9DnwrP8tRqYdDJm4Fb7d
 QarJtt56QEdZRJJnvD/cAG8DaqgCJf9xdNx08meoEWciBLS6UaSTN/a8fE1egL2q1ksd
 wZBetg/t1OPkekJaTkVjbJL94qD6ETjcTrM0/PEfrYQdK7TXRYlFLsJ0YYwUfNnA7tVC
 LNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gXSEQ4RUigdrvEfUyIgbTcDJA4ZN5o0EgF33NFMe/HI=;
 b=Fgn+zwKXcHlaDqkLsYAiLI2qGgZbwUDvUT9mBEMOKxQIADLYMBlLt2ZBMnDYDIMxQ/
 qzTrWGl+IrQzEWVZhRiFSf5XS4fZCWCjJIiJ+pEKi27D0vnOJFnhPLqSJban7WF99z1N
 wsqN+LzwUZcUsvRuJZ0OPqpeZuhfCe6Jtu38iWktv6ifpjaJSs6XAC6KzBYmyRzx9Fuj
 RDc/qt2/8tYZOkODTlis4OU62ZgBA90scueiwoXWCR+gNv2+u6xMgx2A6emxf+6ABjWY
 yMvbiODAvjam0lDq5rY6LtJT/VuK6ItP+b1vC0AaiyF+wDga0mpXCsZ0xvVrTALvI1XF
 2/Ug==
X-Gm-Message-State: AOAM530YPjWD2umQ/m/gV5Dsb0ls4EmNbRxm2D/NQbgbZ8DhllecCMKY
 OVwCTKaYfApLl8RNhk9fJdqbMQ==
X-Google-Smtp-Source: ABdhPJxihresPsw4/wvhbg7EfhnGhObn99mfaRvDs9xBb/F2uJ0PuDX4OWXZtPU1lCMWjoAHckfkaQ==
X-Received: by 2002:a7b:cb81:: with SMTP id m1mr3644718wmi.140.1603814797773; 
 Tue, 27 Oct 2020 09:06:37 -0700 (PDT)
Received: from localhost.localdomain (159.174.185.81.rev.sfr.net.
 [81.185.174.159])
 by smtp.gmail.com with ESMTPSA id u15sm2656988wrm.77.2020.10.27.09.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 09:06:37 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 2/2] soc: mediatek: mmsys: Add support for MT8167 SoC
Date: Tue, 27 Oct 2020 17:06:30 +0100
Message-Id: <20201027160631.608503-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201027160631.608503-1-fparent@baylibre.com>
References: <20201027160631.608503-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_120639_366911_C0D9A07C 
X-CRM114-Status: GOOD (  16.21  )
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
Cc: Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add routing table for DSI on MT8167 SoC. The registers are mostly
incompatible with the current defines, so new one for MT8167 are added.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

This patch depends on the patch series
"soc: mediatek: Prepare MMSYS for DDP routing using tables"

[0] https://lore.kernel.org/patchwork/cover/1317813/

 drivers/soc/mediatek/mtk-mmsys.c | 50 ++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index f00d6d08c9c5..9890990a74a9 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -85,6 +85,22 @@
 #define DSI_SEL_IN_RDMA				0x1
 #define DSI_SEL_IN_MASK				0x1
 
+/* MT8167 */
+#define MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0x030
+#define MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN	0x038
+#define MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0x058
+#define MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN		0x064
+#define MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN	0x06c
+
+#define MT8167_DITHER_MOUT_EN_RDMA0			BIT(0)
+#define MT8167_DITHER_MOUT_EN_MASK			0x7
+
+#define MT8167_RDMA0_SOUT_DSI0				0x2
+#define MT8167_RDMA0_SOUT_MASK				0x3
+
+#define MT8167_DSI0_SEL_IN_RDMA0			0x1
+#define MT8167_DSI0_SEL_IN_MASK				0x3
+
 struct mtk_mmsys_routes {
 	u32 from_comp;
 	u32 to_comp;
@@ -124,6 +140,30 @@ struct mtk_mmsys {
 	const struct mtk_mmsys_driver_data *data;
 };
 
+static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] = {
+	{
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
+		MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN,
+		OVL0_MOUT_EN_COLOR0, OVL0_MOUT_EN_COLOR0
+	}, {
+		DDP_COMPONENT_DITHER, DDP_COMPONENT_RDMA0,
+		MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN,
+		MT8167_DITHER_MOUT_EN_MASK, MT8167_DITHER_MOUT_EN_RDMA0
+	}, {
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
+		MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN,
+		COLOR0_SEL_IN_OVL0, COLOR0_SEL_IN_OVL0
+	}, {
+		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI0,
+		MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN,
+		MT8167_DSI0_SEL_IN_MASK, MT8167_DSI0_SEL_IN_RDMA0
+	}, {
+		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI0,
+		MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN,
+		MT8167_RDMA0_SOUT_MASK, MT8167_RDMA0_SOUT_DSI0
+	},
+};
+
 static const struct mtk_mmsys_routes mt8173_mmsys_routing_table[] = {
 	{
 		DDP_COMPONENT_BLS, DDP_COMPONENT_DSI0,
@@ -288,6 +328,12 @@ static const struct mtk_mmsys_routes mt8173_mmsys_routing_table[] = {
 	}
 };
 
+static const struct mtk_mmsys_driver_data mt8167_mmsys_driver_data = {
+	.clk_driver = "clk-mt8167-mm",
+	.routes = mt8167_mmsys_routing_table,
+	.num_routes = ARRAY_SIZE(mt8167_mmsys_routing_table),
+};
+
 static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.clk_driver = "clk-mt8173-mm",
 	.routes = mt8173_mmsys_routing_table,
@@ -385,6 +431,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
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
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
