Return-Path: <SRS0=BNI/=IS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BACDC433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Mar 2021 08:07:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01DF96199B
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Mar 2021 08:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01DF96199B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1aXrTOVBsP98DHasB5KIaqcXuw57ToCafDZ3u9FsEyE=; b=ULIKTFBhEt5GKXQXMi1aybjlRV
	DzX2C3J+wlbfNYB0TjulmN1teP2aCnzaqB9HcW0Mu3/HD3oOuPvMAT6k51AKaiR3vhfIv5kQyfFUq
	erd1PhZyqMQL+tktme0wsxUq5p+YSDwJJdaP6CdH/G6WN1XkgJ/u5oXdm7B+Ezf7vs7DyR4h69KRO
	n1fioiDzNc8QOC97GpeJTL3hFL9rjr0z3G2IeTB1/I98gErEcY46zhBvMJmytO7sn048Jk95+T8c+
	yEwDIcfGY/e9JF5II4F5hJIm+mAlAXfo78IvHfKybUlQiabkXLKqeWYhb8H5akzzGrXMvhtQqfI/i
	oYdaEkxw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNWdq-008e7s-96; Sat, 20 Mar 2021 08:07:26 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNWdf-008e7N-Mo; Sat, 20 Mar 2021 08:07:18 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
 by mxout2.routing.net (Postfix) with ESMTP id 1F3185FC87;
 Sat, 20 Mar 2021 08:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1616227633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=5rx54XOq4cGnoyPqTNXPmFBrLR2RTFNWgo85VwjcYYA=;
 b=fSq/cy9z1JhQI222WTEyqmkz+WPc4kVwaDBiNLRXQhn97ey2tRbg5VxNT6FiHw8Hzwef5G
 btKEzXN762UAgMAxR3GTxyrk1n8QNU3xReOn/lzlSsZIXC+BmEQzvgdiaTzIW0QyKNLCIi
 DHzgCyNJK0KLFXi9MZ7Ss+R6esX6JrA=
Received: from localhost.localdomain (fttx-pool-217.61.145.178.bambit.de
 [217.61.145.178])
 by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 2BB0F80269;
 Sat, 20 Mar 2021 08:07:12 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Zhang Rui <rui.zhang@intel.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] thermal: mediatek: add sensors-support
Date: Sat, 20 Mar 2021 09:06:46 +0100
Message-Id: <20210320080646.49615-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mail-ID: d03ccc71-1dc6-4253-aa41-7875f90d3cb0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210320_080715_894467_BE504AF9 
X-CRM114-Status: GOOD (  10.98  )
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

From: Frank Wunderlich <frank-w@public-files.de>

add HWMON-support to mediateks thermanl driver to allow lm-sensors
userspace tools read soc temperature

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/thermal/mtk_thermal.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index 149c6d7fd5a0..e22d77d57458 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -23,6 +23,8 @@
 #include <linux/reset.h>
 #include <linux/types.h>
 
+#include "thermal_hwmon.h"
+
 /* AUXADC Registers */
 #define AUXADC_CON1_SET_V	0x008
 #define AUXADC_CON1_CLR_V	0x00c
@@ -983,6 +985,13 @@ static void mtk_thermal_release_periodic_ts(struct mtk_thermal *mt,
 	writel((tmp & (~0x10e)), mt->thermal_base + TEMP_MSRCTL1);
 }
 
+static void mtk_thermal_hwmon_action(void *data)
+{
+	struct thermal_zone_device *zone = data;
+
+	thermal_remove_hwmon_sysfs(zone);
+}
+
 static int mtk_thermal_probe(struct platform_device *pdev)
 {
 	int ret, i, ctrl_id;
@@ -1087,6 +1096,19 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 		goto err_disable_clk_peri_therm;
 	}
 
+#ifdef CONFIG_THERMAL_HWMON
+	tzdev->tzp->no_hwmon = false;
+	ret = thermal_add_hwmon_sysfs(tzdev);
+	if (ret)
+		dev_err(&pdev->dev, "error in thermal_add_hwmon_sysfs");
+
+	ret = devm_add_action(&pdev->dev, mtk_thermal_hwmon_action, tzdev);
+	if (ret) {
+		dev_err(&pdev->dev, "error in devm_add_action");
+		mtk_thermal_hwmon_action(tzdev);
+	}
+#endif
+
 	return 0;
 
 err_disable_clk_peri_therm:
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
