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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 847C1C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 10:45:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7D2761874
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 10:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7D2761874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zuYlJZsfc4uQDruMxKjMiUfeT0k+6721WunySoHLZUk=; b=I3X9Jmipo7ej8FJfwMalNXaRGP
	FzK8bt3bsDq8BkSWVrM58SJppkI3VkcOPJrJA3T6PPqW5/oAyWXfULXjXtsziJUkzNJXSzGh4U4UD
	tsnDNkKc9Ygwjt0L8aAc7yz0qrRMGCe6CeeUxKlzdzZGTc6iqPqH/t4rfgW2is7TIk+QOfQ71fBf5
	uPEwDV+9F7ohIEAAGz9HxQQ9eQO4FcmIEDT6jlXV1p9axDZIBIfSS7swhufGgjfnV+a2TywbuNwaV
	uKHg2I+6LRlBNrcFCkKXONj/Rl+mCvCwT2moyV0f3KrtohvecjZoKDbCILeOPpELdHSMYxecS78Rs
	8nFUjvKw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRBsP-003Rds-5W; Tue, 30 Mar 2021 10:45:37 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRBrT-003RJl-7K
 for linux-mediatek@lists.infradead.org; Tue, 30 Mar 2021 10:44:41 +0000
Received: by mail-pl1-x634.google.com with SMTP id w11so5954179ply.6
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Mar 2021 03:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U4UTdCcB3WVCxZspli0lltbVfgTksXjTHIiVIuKPdEc=;
 b=X81T9M1HusNIU7yzUkbMq8G+76rIBCtyQIMCX77rAbeRKgbkOPxfPjWVnbOV5U9Jff
 gQLM+3ofkKLvHQTPoOi7Tx1THZy/RWRYRKHesFoPHfTjLC0RqRzqit1HJi6Cql3RzOFD
 ECaeNpMoi7KM668vR8hQcdFJKt1mx2sqcqxOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U4UTdCcB3WVCxZspli0lltbVfgTksXjTHIiVIuKPdEc=;
 b=Xz1r4i2BiZFU5jqDmJ0c9dC9JrFCKOwyn9PCBWI8TeuyqH0piAY7ZnV5pYUfxtV5uI
 UsFYVc0iePicnB6pXMD6WM8mAiSz+pWhWl7Dg5ODNZJPZrveG1qqQ7QNiRTtWCIh+BZu
 nhaDzmQRdo6ow/qMYQtaKXlsV2RA/CZ0zQQVG7EkmgKqPqT8fSorWGnHpl1zJFXX76+3
 E+PLbD2THMhvtm2UsbnWfFU9wxsVpXRQKmdXc8RS3ThH0O907MxYZbe2mJYsWgsHWU6T
 27FTqbwOJ7qgYlMlAZ5vdNcBnlfmdmrpSGE7ElhqbaMisbDZU0Qbadd9QwZkJmvX1aws
 eumw==
X-Gm-Message-State: AOAM531D857FYqamRZUYrpTZu/BWlWYEIKNoIdR6p2nSJht5C5yyYWDJ
 tz1jfpj8JIHJgyv41S0DTQWOEQ==
X-Google-Smtp-Source: ABdhPJwJqKKOmVhnPqI3eRF4RXx9ihm/N3Q4eFXU2TLtl6wIII4nsHdWykklWZV/9tWhFzoWrnvAUQ==
X-Received: by 2002:a17:90a:1f0e:: with SMTP id
 u14mr3746666pja.155.1617101076842; 
 Tue, 30 Mar 2021 03:44:36 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:71d0:f547:14ae:a717])
 by smtp.gmail.com with ESMTPSA id t184sm1231078pgt.32.2021.03.30.03.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 03:44:36 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: matthias.bgg@gmail.com, drinkcat@chromium.org, weiyi.lu@mediatek.com,
 ck.hu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, enric.balletbo@collabora.com
Subject: [PATCH v2] soc: mediatek: mmsys: Add mt8183 mmsys routing table
Date: Tue, 30 Mar 2021 18:44:32 +0800
Message-Id: <20210330104432.3432574-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_114439_407058_BE520306 
X-CRM114-Status: GOOD (  14.00  )
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
v1->v2:
Move mt8183 routing table to mt8183-mmsys.h

This patch is based on https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git v5.12-next/soc
---
 drivers/soc/mediatek/mt8183-mmsys.h | 56 +++++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c    |  3 ++
 2 files changed, 59 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt8183-mmsys.h

diff --git a/drivers/soc/mediatek/mt8183-mmsys.h b/drivers/soc/mediatek/mt8183-mmsys.h
new file mode 100644
index 000000000000..38e9f683e5bd
--- /dev/null
+++ b/drivers/soc/mediatek/mt8183-mmsys.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SOC_MEDIATEK_MT8183_MMSYS_H
+#define __SOC_MEDIATEK_MT8183_MMSYS_H
+
+#include "mtk-mmsys.h"
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
index c46d8ab8b0c2..ac68a989854e 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -10,6 +10,7 @@
 #include <linux/platform_device.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
 
+#include "mt8183-mmsys.h"
 #include "mtk-mmsys.h"
 
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
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
