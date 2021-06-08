Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE89C47082
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 15:47:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1804C60FE8
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 15:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1804C60FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EGcTiGRDsAAfeCLUVQ8/GUpys92GWq4S7oQ+r7iyaWQ=; b=jplbKs1B50N06T
	LkdSVZNmt1R5vW/rGLY+fhnX7JN7xnrwEchTEWK86+f0/GTc8r20Rit4garBJFaQhfZPyk7svvc5A
	2/ov+7oZAuOt1gqlLgHE61qba2PwZvuRY/T5++ifCN9xTpVruiTE9yxKnqNkJqiH1R5l2BjFaGFIn
	uUmmSlN/4MPlINMlaeXr1/YzNtnfviH4vtnVJT6stWQigaMH7/Than18nMp9hLEJF9lPA/LQRGZGL
	nC63IU1dWYNaPCzs64xHcpJBVxJAPJHM87oHpyN8U2tjhceg637Lx+aqRS1/ITRi6HOICbNMoGemE
	+ps2o3OXCp6gkon7qh0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqdwb-009K9n-06; Tue, 08 Jun 2021 15:47:09 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqdvQ-009JR6-CV; Tue, 08 Jun 2021 15:45:59 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
 by mxout4.routing.net (Postfix) with ESMTP id 619DA10081F;
 Tue,  8 Jun 2021 15:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1623167148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=98Qit1hMtPHZc/TS5dL5TLvDSnXeL0iSq1KTlz2Fj4Y=;
 b=Iuhw/LqB8uiWEGDmraAJxW1QmzpUpi9yQ86fUmAiLQUYrSGgN4y3cP6HCt6VbhsVuZriB4
 JmcWW72XI53HVnl+QAB2sqy9KFdUuPMx5Whv0Mu+fyuAq3mVQQPjx+oKgHgcYmnQF6r7Dd
 fuq4cYG7k3Z18G1o0qLI1U7pTEGpmEo=
Received: from localhost.localdomain (fttx-pool-217.61.145.142.bambit.de
 [217.61.145.142])
 by mxbox4.masterlogin.de (Postfix) with ESMTPSA id AA073804E7;
 Tue,  8 Jun 2021 15:45:47 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4] thermal: mediatek: add sensors-support
Date: Tue,  8 Jun 2021 17:45:30 +0200
Message-Id: <20210608154530.70074-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mail-ID: 8400b1d9-070e-406d-af5d-86a2ada1c8ff
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_084557_163829_A14B13B3 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

add HWMON-support to mediateks thermal driver to allow lm-sensors
userspace tools read soc temperature

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v4: change message to dev_warn as suggested by matthias
v3: drop no_hwmon
v2: drop ifdef and used devm_thermal_add_hwmon_sysfs
---
 drivers/thermal/mtk_thermal.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index 97e8678ccf0e..ede94eadddda 100644
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
@@ -1087,6 +1089,10 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 		goto err_disable_clk_peri_therm;
 	}
 
+	ret = devm_thermal_add_hwmon_sysfs(tzdev);
+	if (ret)
+		dev_warn(&pdev->dev, "error in thermal_add_hwmon_sysfs");
+
 	return 0;
 
 err_disable_clk_peri_therm:
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
