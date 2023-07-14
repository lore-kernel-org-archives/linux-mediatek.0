Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66055EB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jul 2023 17:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lbZU0XtXzjBRJilDOgmpVrKHFrnYrm31NTuN+kNT6Ao=; b=aB3iMhY790+Z2+3LzatZxxdNi3
	k+xizXWTwOjp2UWXHT9j5wTjuAKf6yjK8lzqbR6j8yu5HjcWzvheMaavB/j367kCjbNWpZc+CsiUu
	VkxyiN6KAYQV9GSAMtdZqAb+22IGhB5n2BsNAvb60cem/afZXGeyZUACpSUKZLQbflImKRcbFiCft
	XPE8z5/0uMJfACjFq6TB47T7Y9aIJnWcBOmSVwAEl8XUaGwyEPnE2CdyB7CVtzobkMSGRdyahUiTG
	OE7U+oI890hqd0NFLCr7aKKW/T/lbK741It+hQztSieVSdvPoTJh/a32sC/k2jDvApQTk25cCSX1Q
	ey3XHjig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMqh-006nac-1h;
	Fri, 14 Jul 2023 17:44:59 +0000
Received: from mail-io1-f46.google.com ([209.85.166.46])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMqa-006nUE-2W;
	Fri, 14 Jul 2023 17:44:54 +0000
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-78362f57500so88989639f.3;
        Fri, 14 Jul 2023 10:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689356691; x=1691948691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lbZU0XtXzjBRJilDOgmpVrKHFrnYrm31NTuN+kNT6Ao=;
        b=hwdU4JYmmVwgA+h87q5TMZJKxc++nOI7eHAyBbJWeOEVYYBbeCRYfQIdYDLbArvW/x
         4kDiVfsw3W/Ka1mVqt6zMZNKdUrxq6YrrwN9wwhZm0qqAEeo7gspFOVR78iXb+HO7jbz
         Qu/Y8e6MlLJAsnNiOo2odp1/sbX1VGE0TFa2WxuO9VdxTef63VQ9LZFOAlV9ZrmbxFxw
         N/ITU18u0UbIttLDQVzhjzFONtyLCDWDGDllWUiAS6yjSbKp2sMEQbZ7bLwHlJWgQ7lj
         TGGicAGY4fLBTOgaMwAJ9KA1Q0rE1NoSze6aioIxcB2u+F+agpHxqNh0wvoKQVEUkixH
         PqDg==
X-Gm-Message-State: ABy/qLbf+q1NLWbH5L1AE4VqZNRH4JfOlpY57mfI9t+ozcTRJamZCTAa
	4UqE+8SbFCtYnG7CqD5TVw==
X-Google-Smtp-Source: APBJJlEneyYfkFVpPFyvX92A6HKtgdIQ1HejXqIhAvVOgzLjJuL+rrrd6jC8t5f8VdpG+Ms7XluKwg==
X-Received: by 2002:a5e:a705:0:b0:786:e669:3059 with SMTP id b5-20020a5ea705000000b00786e6693059mr6292798iod.6.1689356691575;
        Fri, 14 Jul 2023 10:44:51 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id q3-20020a6b7103000000b00786ff73252bsm2805680iog.10.2023.07.14.10.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:44:50 -0700 (PDT)
Received: (nullmailer pid 4055095 invoked by uid 1000);
	Fri, 14 Jul 2023 17:44:48 -0000
From: Rob Herring <robh@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michal Simek <michal.simek@amd.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: [PATCH] firmware: Explicitly include correct DT includes
Date: Fri, 14 Jul 2023 11:44:37 -0600
Message-Id: <20230714174438.4054854-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_104452_823416_20C3EE21 
X-CRM114-Status: GOOD (  12.24  )
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
 drivers/firmware/arm_scmi/driver.c | 4 ++--
 drivers/firmware/imx/imx-dsp.c     | 1 -
 drivers/firmware/imx/imx-scu-irq.c | 1 +
 drivers/firmware/imx/imx-scu.c     | 1 +
 drivers/firmware/mtk-adsp-ipc.c    | 1 -
 drivers/firmware/raspberrypi.c     | 1 +
 drivers/firmware/scpi_pm_domain.c  | 3 ++-
 drivers/firmware/stratix10-rsu.c   | 1 -
 drivers/firmware/tegra/bpmp.c      | 3 +--
 drivers/firmware/xilinx/zynqmp.c   | 1 +
 10 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index b5957cc12fee..87383c05424b 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -28,8 +28,8 @@
 #include <linux/hashtable.h>
 #include <linux/list.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/processor.h>
 #include <linux/refcount.h>
 #include <linux/slab.h>
diff --git a/drivers/firmware/imx/imx-dsp.c b/drivers/firmware/imx/imx-dsp.c
index a6c06d7476c3..3dba590a2a95 100644
--- a/drivers/firmware/imx/imx-dsp.c
+++ b/drivers/firmware/imx/imx-dsp.c
@@ -10,7 +10,6 @@
 #include <linux/kernel.h>
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
-#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
diff --git a/drivers/firmware/imx/imx-scu-irq.c b/drivers/firmware/imx/imx-scu-irq.c
index d9dcc20945c6..a149537e0639 100644
--- a/drivers/firmware/imx/imx-scu-irq.c
+++ b/drivers/firmware/imx/imx-scu-irq.c
@@ -10,6 +10,7 @@
 #include <linux/firmware/imx/ipc.h>
 #include <linux/firmware/imx/sci.h>
 #include <linux/mailbox_client.h>
+#include <linux/of.h>
 #include <linux/suspend.h>
 
 #define IMX_SC_IRQ_FUNC_ENABLE	1
diff --git a/drivers/firmware/imx/imx-scu.c b/drivers/firmware/imx/imx-scu.c
index 47db49911e7b..2e5914f3a110 100644
--- a/drivers/firmware/imx/imx-scu.c
+++ b/drivers/firmware/imx/imx-scu.c
@@ -16,6 +16,7 @@
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 
diff --git a/drivers/firmware/mtk-adsp-ipc.c b/drivers/firmware/mtk-adsp-ipc.c
index 3c071f814455..85e94ddc7204 100644
--- a/drivers/firmware/mtk-adsp-ipc.c
+++ b/drivers/firmware/mtk-adsp-ipc.c
@@ -8,7 +8,6 @@
 #include <linux/kernel.h>
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
-#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index c3bc29e0a488..f66efaa5196d 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -10,6 +10,7 @@
 #include <linux/kref.h>
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
diff --git a/drivers/firmware/scpi_pm_domain.c b/drivers/firmware/scpi_pm_domain.c
index 800673910b51..2231e6dd2070 100644
--- a/drivers/firmware/scpi_pm_domain.c
+++ b/drivers/firmware/scpi_pm_domain.c
@@ -8,7 +8,8 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/scpi_protocol.h>
 
diff --git a/drivers/firmware/stratix10-rsu.c b/drivers/firmware/stratix10-rsu.c
index e51c95f8d445..ab3074705380 100644
--- a/drivers/firmware/stratix10-rsu.c
+++ b/drivers/firmware/stratix10-rsu.c
@@ -10,7 +10,6 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/firmware/intel/stratix10-svc-client.h>
 #include <linux/string.h>
diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index 17bd3590aaa2..51d062e0c3f1 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -8,8 +8,7 @@
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/semaphore.h>
diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index f8c4eb2b43f8..eb9ad5ae393f 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -18,6 +18,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/hashtable.h>
-- 
2.40.1


