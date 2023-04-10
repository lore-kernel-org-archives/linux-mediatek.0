Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E114C77B61
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Apr 2023 23:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G/VCg72mZQ/NHm6OpYah9b/VaUR4O+V+V5z1ynzGieo=; b=JyHElz2qqJeYC1x72VpG6e5w/f
	YdfzE1BFBliqdHZMsWnTK9g0NGl4V7sV95ojbFH5NqRm2r2j0mVi9PndNY15wGuR6zs90t4mi919A
	DPAgs2zqOutwq6GWbTWrNzpsxe3GJbPtuAEY8ZxUrz1XhCRcDQa83ntCGkOf4V+NSEPC+9yPgzPDB
	pJuoLQb+QIC5JBfWoOpcxEf7CqwrdX6i99dh9eSfRLw3A+Ri0zaeBvPrJg1lV1j0Y0rUwCLWGUMBk
	Whn2YZHdcWM8FLdilJLms33JbueCLp91UKRdL0Y37OXQ5eHEoHk39ttwUSEZ6gzYKVn/AjMiyYdL4
	rWF12jaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm0uS-00G3uY-1g;
	Mon, 10 Apr 2023 23:26:52 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm0uP-00G3s5-0g;
	Mon, 10 Apr 2023 23:26:50 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1842eb46746so7728500fac.4;
        Mon, 10 Apr 2023 16:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681169205; x=1683761205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/VCg72mZQ/NHm6OpYah9b/VaUR4O+V+V5z1ynzGieo=;
        b=T3TntyprLsjp7oK7Zl7cHrRmSHI9XjZ28iljtPE46YkGQbZ17zDOcLfZdxt53tocsf
         LVaMAuOj9KeomI/11oWk+p5H6g3dDRN1IdzYuRpGEGWn7Bn6rg4Gz0fDGuvQbAgAA2P0
         tALc3wOfAVhvM69eBZY1j2anW19hH07FE8a6nboPoo0Zxam5ihe6MX6hbnW8jSkWGplE
         hRd0ZF6209Bwo/lVykgiqA+lZofKHMSK7VdfGvCPrQjLEYJdCPgTPcAtRXHHZt9HNkXj
         60R8NeAeJnU2RMgjuJ5qrGELGXuXk18XeC3mIsQ5EcUQwRJM6/9yzmPWj02Pk85gtHVu
         rMYg==
X-Gm-Message-State: AAQBX9eDPg3bl2CJ9MtL/2vbVe7/IPEONEINa47QbSyyt8mCZPY5gqNs
	1idN4hfadGqWO1N+2a0YIQ==
X-Google-Smtp-Source: AKy350ZijxNsFnPL5Ij5iaQI01Ek5MJitj3WEyI04D46LQ/K6Wh0QH2ZObqAjn0jf+SuVtadgtdxEg==
X-Received: by 2002:a05:6870:8087:b0:184:3995:4d70 with SMTP id q7-20020a056870808700b0018439954d70mr4161695oab.38.1681169204870;
        Mon, 10 Apr 2023 16:26:44 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id zg22-20020a0568716b1600b0017197629658sm4490790oab.56.2023.04.10.16.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 16:26:44 -0700 (PDT)
Received: (nullmailer pid 1561249 invoked by uid 1000);
	Mon, 10 Apr 2023 23:26:43 -0000
From: Rob Herring <robh@kernel.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] usb: Add explicit of.h of_platform.h include
Date: Mon, 10 Apr 2023 18:26:38 -0500
Message-Id: <20230410232639.1561152-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_162649_249185_D337FF63 
X-CRM114-Status: GOOD (  12.08  )
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

Several USB drivers use of_platform_* functions which are declared in
of_platform.h. of_platform.h gets implicitly included by of_device.h,
but that is going to be removed soon. Nothing else depends on of_device.h
so it can be dropped.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/usb/dwc3/dwc3-am62.c           | 2 +-
 drivers/usb/gadget/udc/rzv2m_usb3drd.c | 2 +-
 drivers/usb/mtu3/mtu3_host.c           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-am62.c b/drivers/usb/dwc3/dwc3-am62.c
index 173cf3579c55..4d674a243784 100644
--- a/drivers/usb/dwc3/dwc3-am62.c
+++ b/drivers/usb/dwc3/dwc3-am62.c
@@ -11,7 +11,7 @@
 #include <linux/platform_device.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 #include <linux/clk.h>
 #include <linux/regmap.h>
diff --git a/drivers/usb/gadget/udc/rzv2m_usb3drd.c b/drivers/usb/gadget/udc/rzv2m_usb3drd.c
index 3c8bbf843038..8aafd1ddf126 100644
--- a/drivers/usb/gadget/udc/rzv2m_usb3drd.c
+++ b/drivers/usb/gadget/udc/rzv2m_usb3drd.c
@@ -6,7 +6,7 @@
  */
 
 #include <linux/io.h>
-#include <linux/of_device.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
diff --git a/drivers/usb/mtu3/mtu3_host.c b/drivers/usb/mtu3/mtu3_host.c
index f3903367a6a0..177d2caf887c 100644
--- a/drivers/usb/mtu3/mtu3_host.c
+++ b/drivers/usb/mtu3/mtu3_host.c
@@ -11,7 +11,7 @@
 #include <linux/irq.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
-#include <linux/of_device.h>
+#include <linux/of_platform.h>
 #include <linux/regmap.h>
 
 #include "mtu3.h"
-- 
2.39.2


