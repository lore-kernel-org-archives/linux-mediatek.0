Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D66B1C433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 05:52:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64E9C619B3
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 05:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64E9C619B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QtfWAdZaCBeOnuv6PcyhsQJ/1ayRmDLQQc2GK+KcInw=; b=VDNeYlctDuXe+nttAac+PFkXQO
	0Bg7YDyM+m1rHTfUEkFXRIfZvuH/2LP0fbMsDt5cT1d30oaCwp4S9ekgEH9wNpy9RyacfCUnP3gBk
	8bH/7UUQpGRtO5I/bquBvEj0KRG45/h7YLBHiu08YTpDrZxAvvIisPYzVe4Mnw6trfFfiXfcl1dJP
	5K+zvWWuPWwuIo50tpNxvPi6U/aegjVHiULDIvXtW64B+porXoZzlv5akKUke4100MJVVTuKE5mzk
	vYIJKF6sIzr/KU4mr66WEn8Ypwckq1SmCS6oyJPaOmFaC3rC53BdtQZPT/c8m4AV+blq+BkWlEOWi
	DCWYJEfg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOZxM-00Dt8L-JR; Tue, 23 Mar 2021 05:51:57 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOZxG-00Dt6V-Gn
 for linux-mediatek@lists.infradead.org; Tue, 23 Mar 2021 05:51:53 +0000
Received: by mail-pf1-x432.google.com with SMTP id g15so13158862pfq.3
 for <linux-mediatek@lists.infradead.org>; Mon, 22 Mar 2021 22:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FtIC9ocJ4+NOnMRBa7jQB43OlZx1SC3ik3qdbBBdMIA=;
 b=X/5/uuwrxFYcF8Awxi1cwtq18Vl4EymKBcOaK9VmY+oiNsIsueGIxRe1utA/39s1qG
 7FbBz+ekJlBjND28eTk8IF0Ah/P72WMDBm6F0UtBW+rUSBRpCuQmI6L9F4AWAjn/S2Le
 9960srFiKAxVa69Tps1YeIwAqpv/24hSuXRKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FtIC9ocJ4+NOnMRBa7jQB43OlZx1SC3ik3qdbBBdMIA=;
 b=MizIo4eK3GNC5D0qtITz98/+gD4vfMia3bB9l0w9MzIAJwfWSvP+uMwpUfFKW/XNnK
 UsAdtWSnziMVx+/VJf4lRPfni1mBWUEdnq5YbI0pmJ2yWjVE3Ph3ARQpAVog5xZj+kJU
 k2Dq4V87583awc89IaggUUutcF8tVscjZHYx1t7s2wIIX+YDVjdNcO3a2ySbyQMOtkUZ
 m9OGypDWxgXp36icJCP7/CSPSg5mXStdzmlUPHNFOF2Jn99elnnR425UTN1z1wSZcK1D
 unqZjT/F48ua3RitGqSf3YmbWEmnj6owL56Gzwwwy1pzfXiPdJrVk93TqG9LSTcox4mF
 6ZGQ==
X-Gm-Message-State: AOAM530kuAwHnmOPa8PqE5g4LD08giN0aM5e5y0morb9xkgyb7erP0+D
 ZqS26pLl5VuMkj/KhEo9onwIUw==
X-Google-Smtp-Source: ABdhPJwmGyPV1d4xdJ5P70Yke6owQpM9u/Z2Pscxia8QZ1e+ryjZ+XQiEohTES5v5I74LSSlE1mXbQ==
X-Received: by 2002:a17:902:834a:b029:e6:b6bc:f58c with SMTP id
 z10-20020a170902834ab02900e6b6bcf58cmr3622329pln.85.1616478708902; 
 Mon, 22 Mar 2021 22:51:48 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:c8d1:279a:cb3a:39cd])
 by smtp.gmail.com with ESMTPSA id k11sm7621837pgc.38.2021.03.22.22.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 22:51:48 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: matthias.bgg@gmail.com, drinkcat@chromium.org, weiyi.lu@mediatek.com,
 ck.hu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, enric.balletbo@collabora.com
Subject: [PATCH] soc: mediatek: mmsys: Add mt8183 mmsys routing table
Date: Tue, 23 Mar 2021 13:51:43 +0800
Message-Id: <20210323055143.607529-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_055151_150327_A8A84113 
X-CRM114-Status: GOOD (  11.57  )
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

mt8183 has different routing registers than mt8173.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
This patch is based on series ("soc: mediatek: Prepare MMSYS for DDP routing using tables")[1]
and tested with mt8183 krand and mt8183 juniper device.
The register value is referenced from [2].

[1] https://patchwork.kernel.org/project/linux-mediatek/cover/20210317181711.795245-1-enric.balletbo@collabora.com/
[2] https://patchwork.kernel.org/project/linux-mediatek/patch/1609815993-22744-6-git-send-email-yongqiang.niu@mediatek.com/
---
 drivers/soc/mediatek/mtk-mmsys.c |  2 ++
 drivers/soc/mediatek/mtk-mmsys.h | 47 ++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index c46d8ab8b0c2..16bb55b0463a 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -40,6 +40,8 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 
 static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.clk_driver = "clk-mt8183-mm",
+	.routes = mmsys_mt8183_routing_table,
+	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
 };
 
 struct mtk_mmsys {
diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index a760a34e6eca..c55baf5932b8 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -66,6 +66,28 @@
 #define DPI_SEL_IN_BLS				0x0
 #define DSI_SEL_IN_RDMA				0x1
 
+#define MT8183_DISP_OVL0_MOUT_EN		0xf00
+#define MT8183_DISP_OVL0_2L_MOUT_EN		0xf04
+#define MT8183_DISP_OVL1_2L_MOUT_EN		0xf08
+#define MT8183_DISP_DITHER0_MOUT_EN		0xf0c
+#define MT8183_DISP_PATH0_SEL_IN		0xf24
+#define MT8183_DISP_DSI0_SEL_IN			0xf2c
+#define MT8183_DISP_DPI0_SEL_IN			0xf30
+#define MT8183_DISP_RDMA0_SOUT_SEL_IN		0xf50
+#define MT8183_DISP_RDMA1_SOUT_SEL_IN		0xf54
+
+#define MT8183_OVL0_MOUT_EN_OVL0_2L		BIT(4)
+#define MT8183_OVL0_2L_MOUT_EN_DISP_PATH0	BIT(0)
+#define MT8183_OVL1_2L_MOUT_EN_RDMA1		BIT(4)
+#define MT8183_DITHER0_MOUT_IN_DSI0		BIT(0)
+#define MT8183_DISP_PATH0_SEL_IN_OVL0_2L	0x1
+#define MT8183_DSI0_SEL_IN_RDMA0		0x1
+#define MT8183_DSI0_SEL_IN_RDMA1		0x3
+#define MT8183_DPI0_SEL_IN_RDMA0		0x1
+#define MT8183_DPI0_SEL_IN_RDMA1		0x2
+#define MT8183_RDMA0_SOUT_COLOR0		0x1
+#define MT8183_RDMA1_SOUT_DSI0			0x1
+
 struct mtk_mmsys_routes {
 	u32 from_comp;
 	u32 to_comp;
@@ -212,4 +234,29 @@ static const struct mtk_mmsys_routes mmsys_default_routing_table[] = {
 	}
 };
 
+static const struct mtk_mmsys_routes mmsys_mt8183_routing_table[] = {
+	{
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_OVL_2L0,
+		MT8183_DISP_OVL0_MOUT_EN, MT8183_OVL0_MOUT_EN_OVL0_2L
+	}, {
+		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
+		MT8183_DISP_OVL0_2L_MOUT_EN, MT8183_OVL0_2L_MOUT_EN_DISP_PATH0
+	}, {
+		DDP_COMPONENT_OVL_2L1, DDP_COMPONENT_RDMA1,
+		MT8183_DISP_OVL1_2L_MOUT_EN, MT8183_OVL1_2L_MOUT_EN_RDMA1
+	}, {
+		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		MT8183_DISP_DITHER0_MOUT_EN, MT8183_DITHER0_MOUT_IN_DSI0
+	}, {
+		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
+		MT8183_DISP_PATH0_SEL_IN, MT8183_DISP_PATH0_SEL_IN_OVL0_2L
+	}, {
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
+		MT8183_DISP_DPI0_SEL_IN, MT8183_DPI0_SEL_IN_RDMA1
+	}, {
+		DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
+		MT8183_DISP_RDMA0_SOUT_SEL_IN, MT8183_RDMA0_SOUT_COLOR0
+	}
+};
+
 #endif /* __SOC_MEDIATEK_MTK_MMSYS_H */
-- 
2.31.0.rc2.261.g7f71774620-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
