Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D73B8C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 11:05:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5243F61919
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 11:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5243F61919
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dUYJzU4Bjg12q/ZOPLMN74hGdDgwvv6J/JjAw7n9pcI=; b=B4+Rb5aDoMb1h/jBVcBW2UHW2V
	8/XVb7kMM2iWMGnhP0s4i2vmSbK7b+ePSgkxau17HGLuM39KaQg53cowSUmqF0FDrmOKp8FfkfEE1
	PQyBIXegFS7Vd6iKtZr0d85TL87eIGj7MZicgK4qozZ5hMRyTEpyhj282kQLr/Sz0MBO6Zy7uqc9a
	Z9EOz4OImU0qcSzs3bloySgBdUSOX5d+KgD0XsZlJ5tTYbpVqXQef0R+5MCZx7X6YCCus56nGQItO
	LVGznKHO/U7pyuDm3glOxqgfnoiAV+/Gw1mxVcRBRO7zBiq3lCjiJiApsv80kNnSFB0+5bHJYIu3v
	t+reYDQQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRCBp-003VtH-ED; Tue, 30 Mar 2021 11:05:41 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRCAh-003Vdo-63
 for linux-mediatek@lists.infradead.org; Tue, 30 Mar 2021 11:04:49 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 x21-20020a17090a5315b029012c4a622e4aso6731376pjh.2
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Mar 2021 04:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FMhBXNDUu18Nx4oVs0q4h6SRvqYZuwc7QpYMrUAt5VE=;
 b=k8yMndEAD//moVQlp2k9f3Get8rceORt9KZJTpoka6uTGzUcPWO011MOHMLEjjBXiV
 HEyecO5hmwIUF3bW3gY5sZaUIgDgxOnX5pmFIi/sANLnmBizGQeKoktTeN/NoGMF2aXl
 jDzHk/oVO+LqeSV3hyAuszZXSdS0X9DHgXEeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FMhBXNDUu18Nx4oVs0q4h6SRvqYZuwc7QpYMrUAt5VE=;
 b=iOl5sVbxs8kp1H3kCVH1+MW3VcjEr+2DlPjQG3RkPw8CZQ3CM+vKrR9dNk7Y1P1Ojl
 RS9dFWXWJK7DEzwKJmXi+95n9WwJGdYwWB1zRSFXfT65Wh+l0Hnuj+wTTjqY0p3oLlrP
 nB2sXtwnqh0zFK+WtxHOhvL0ExQ3JzhwnDT6MqFtfyA1oiY0GArwyyoxfAkIVun2L49W
 ItkpCbpCEitcM2EIBooc5/921wtYhvGQZafhAbm0CRcEEseoFIYPQtEJ4BMpjqDwirgS
 S5aiMwb44S9u15psrLGceYdkr+UbVta5Z3aYwHvNW0f2nGY2LIGi9ry9E4p2yuPpUIKo
 r2mw==
X-Gm-Message-State: AOAM5300a18HI9mQBRIZvprYV+nY9Ke8Vg8Q/+n/rELo1CcXM4YlbYYn
 JgMKEm+VimeMRppdXy/etKKl7A==
X-Google-Smtp-Source: ABdhPJzqgbpfnNkYAMfYaqM0w634uSngO51qCSynBowzU1lQ41SopXqbKtWvKyh0yr2GrbeS0X5hdw==
X-Received: by 2002:a17:902:ea0e:b029:e4:81d4:ddae with SMTP id
 s14-20020a170902ea0eb02900e481d4ddaemr33970302plg.12.1617102267979; 
 Tue, 30 Mar 2021 04:04:27 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:71d0:f547:14ae:a717])
 by smtp.gmail.com with ESMTPSA id m1sm2613873pjf.8.2021.03.30.04.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 04:04:27 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: matthias.bgg@gmail.com, drinkcat@chromium.org, weiyi.lu@mediatek.com,
 ck.hu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, enric.balletbo@collabora.com
Subject: [PATCH v3] soc: mediatek: mmsys: Add mt8183 mmsys routing table
Date: Tue, 30 Mar 2021 19:04:23 +0800
Message-Id: <20210330110423.3542163-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_120432_335282_231B32B1 
X-CRM114-Status: GOOD (  13.58  )
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
Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
v2->v3:
Fix comments.

v1->v2:
Move mt8183 routing table to mt8183-mmsys.h

This patch is based on https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git v5.12-next/soc
---
 drivers/soc/mediatek/mt8183-mmsys.h | 54 +++++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c    |  3 ++
 2 files changed, 57 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt8183-mmsys.h

diff --git a/drivers/soc/mediatek/mt8183-mmsys.h b/drivers/soc/mediatek/mt8183-mmsys.h
new file mode 100644
index 000000000000..579dfc8dc8fc
--- /dev/null
+++ b/drivers/soc/mediatek/mt8183-mmsys.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SOC_MEDIATEK_MT8183_MMSYS_H
+#define __SOC_MEDIATEK_MT8183_MMSYS_H
+
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
+#endif /* __SOC_MEDIATEK_MT8183_MMSYS_H */
+
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index c46d8ab8b0c2..79e55150210e 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -11,6 +11,7 @@
 #include <linux/soc/mediatek/mtk-mmsys.h>
 
 #include "mtk-mmsys.h"
+#include "mt8183-mmsys.h"
 
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.clk_driver = "clk-mt2701-mm",
@@ -40,6 +41,8 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 
 static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.clk_driver = "clk-mt8183-mm",
+	.routes = mmsys_mt8183_routing_table,
+	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
 };
 
 struct mtk_mmsys {
-- 
2.31.0.291.g576ba9dcdaf-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
