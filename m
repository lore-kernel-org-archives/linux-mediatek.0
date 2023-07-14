Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AD1EB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jul 2023 17:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m91Fe28mbDN6J06I/qqMHBHYZy2UCCGYOh2MW5zdC+Q=; b=HZnRjcQw4+NOUPP1hZDy3RolSR
	6lCp4J+SG+q8TGMHfm0slBnx+m2Zw4cO86TTP/X3PWoWrv06lKPpHjRlzJPXalLnoDqewuYO4WZtE
	60RCKRNKA9cAJb2vg1s0J5Tii7vp6juHJrLDcFkPcV0FROn2QKTxSyIoZDdGKbNcMqjnIuMaXMKSr
	KJiT0w+NvT08z+X7rQamxToy9wARDQzFd6tXtCLtQoCB0CaL4JpowFFYCT0yP7FDRTWKaW6K0yfV/
	jfHLnYAx1KGZhgrG+dQ0lxEIGQwNajW2jS+fzi/abkggEXIs3aY4QYbLVKQd/yLulhwYRzmgU6JJL
	HCAYY9XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMxg-006sIX-0V;
	Fri, 14 Jul 2023 17:52:12 +0000
Received: from mail-io1-f49.google.com ([209.85.166.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMxT-006rzs-1i;
	Fri, 14 Jul 2023 17:52:04 +0000
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-78374596182so89053639f.0;
        Fri, 14 Jul 2023 10:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689357116; x=1691949116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m91Fe28mbDN6J06I/qqMHBHYZy2UCCGYOh2MW5zdC+Q=;
        b=TYOViCdlud09LWgg1JMTG/mqdlJ8V42AKaI0v29HhJFrMl6qcPS2/lQ3SiIfZw5Ycn
         3p/p1GlkNtkYgJjxFPGA85nMh5UbAOzAEKVuDeVhYZzhfr/aoxaZ0QU0lKO5qu1cUmXA
         82bDLbtafVaPoUTpj2aDYo1jWJm3NVGolEaBmfeqBkdlqtnvzD9fpDlboCM858IG/8ea
         QLtwGYEd8N/XTd/n3g8L4gpqF/XNs9gyKQ9qiY4/goe91tsKkBhNh/SnkXYqHIrEHLuY
         1p1Ts+kYNpGRLJ8Fikz5F9a6fpFvL0JNHkND08cFIUMnPDn+f5yb9mU59hmw8Zg++fm4
         qrOA==
X-Gm-Message-State: ABy/qLZllETdps9hjK1j4djnDsT6YZF4QIeTuucbcEtD0ZEAh/uE1RY7
	qfW73XXEwMYRCLDnoJ9I8XsxpKZaNizG
X-Google-Smtp-Source: APBJJlFxyacMEQ+zYcQJoIRVORvhjrZEoUI6Phmqd6hkSdWntbiciQEOL75GGQ5pnb5KOIWFxqGRbg==
X-Received: by 2002:a05:6602:2114:b0:783:65ba:8614 with SMTP id x20-20020a056602211400b0078365ba8614mr5483685iox.10.1689357116538;
        Fri, 14 Jul 2023 10:51:56 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id ep9-20020a0566384e0900b0042b326ed1ebsm2758360jab.48.2023.07.14.10.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:51:55 -0700 (PDT)
Received: (nullmailer pid 4067642 invoked by uid 1000);
	Fri, 14 Jul 2023 17:51:38 -0000
From: Rob Herring <robh@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] soc: mediatek: Explicitly include correct DT includes
Date: Fri, 14 Jul 2023 11:51:35 -0600
Message-Id: <20230714175136.4067557-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_105159_573430_327A0E75 
X-CRM114-Status: GOOD (  12.84  )
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

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 1 +
 drivers/soc/mediatek/mtk-devapc.c      | 2 +-
 drivers/soc/mediatek/mtk-mmsys.c       | 2 +-
 drivers/soc/mediatek/mtk-mutex.c       | 3 +--
 drivers/soc/mediatek/mtk-pm-domains.c  | 2 +-
 drivers/soc/mediatek/mtk-pmic-wrap.c   | 3 ++-
 drivers/soc/mediatek/mtk-scpsys.c      | 2 +-
 7 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index c1837a468267..b0cd071c4719 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -7,6 +7,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
 #include <linux/mailbox_controller.h>
+#include <linux/of.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
 #define CMDQ_WRITE_ENABLE_MASK	BIT(0)
diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
index bad139cb117e..b28feb967540 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -8,7 +8,7 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/of_address.h>
 
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 9619faa796e8..ffb75711a1da 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -8,7 +8,7 @@
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 4aa0913817ae..9d9f5ae578ac 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -6,8 +6,7 @@
 #include <linux/clk.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
-#include <linux/of_address.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 354249cc1b12..ee962804b830 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -8,8 +8,8 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/mfd/syscon.h>
+#include <linux/of.h>
 #include <linux/of_clk.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/regmap.h>
diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 11095b8de71a..efd9cae212dc 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -8,7 +8,8 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index 7a668888111c..b374d01fdac7 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -7,7 +7,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/mfd/syscon.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/regulator/consumer.h>
-- 
2.40.1


