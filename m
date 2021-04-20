Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B43C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 17:17:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4651613AF
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 17:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4651613AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xg/u97IMUSzfiMjhVB+3tTHtBm3D1HOAVXB7uQElB1w=; b=XXCMt6Db4nZF0LIvMpXhipbddf
	K675rMFM945zJM7K3zqTk4PhemxOuqTtb0uhE15QQyMl8rvvW/qOkgeqmTD6wKUhqeJYaVHqvIzFR
	kEI5sUNNEbSP90JfdyQUuD3fzJTJy2TuPZeU80sZs+Y2s6glu3AtdJTCXCeB771BGAIGECptSBcYA
	SU9WQoPyGjxefK9PscwEn+RVVyzdmFUG6yma/HS+cwaMQ5AlVafpKCNjTL1FrikAvnxESsZ6geCdn
	25fA2yHYXkRsY4nBIeomz6SxkiePGvje0cTgO406g1xJA19orXtCHipC1AExbAvk5npLU2G5iNI8t
	5FUZcRqw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYtzc-00Ch4R-N2; Tue, 20 Apr 2021 17:16:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYtzP-00Ch0t-HD; Tue, 20 Apr 2021 17:16:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=of1hyRAmkUxYfFb6DiwQtokusN7zzKLSP6s9xK0+XcU=; b=uPzSEWk/oxGKhOH/Qe7k02dsSN
 Oi9C9euJpjQEvhpVpEpeiYHd8vaLyBYLG4PS7ORXRO4a5Y30k3ny6V1+MM6OJ04wM2TINKJ11qxhb
 AL0sPIg64buDG+J3o30GTi8i9J5biJnk5Lpk9qnoOaieFHG0sC54NwBrhRwp7W0/oaBTtexHwogTB
 qRGIPs9En5ImtTJJyUNe0nWoKlkb9a1iX3OwfTR0UmPZzpVaghGQxaVbU1nXzYtDG1YKgcYvuuFFF
 YHetTlhUHgKeuZOxCzu2GmfTncQlAF4Kxso96L3ehLJXM3nBrAnNJxbQamE411yEj0VSSvGBEZa1K
 nsob2+mA==;
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYtzK-00CJ0x-87; Tue, 20 Apr 2021 17:16:42 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
 by mxout1.routing.net (Postfix) with ESMTP id 6B5283FE33;
 Tue, 20 Apr 2021 17:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1618938994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=of1hyRAmkUxYfFb6DiwQtokusN7zzKLSP6s9xK0+XcU=;
 b=H6MS+7gvc0xflGa2AqdWz1BNuOeChc7asm4MShGgd+vd35WW2Tt+g0vKdA5oGR+Qmyrasd
 Cbz730AcNaLngxSx7fk9Hhlxm/v2JsVaGFuCzp9NBhHkBdu7mmJ9biC/HyimEHWlCPUDM8
 TPsQHUjJTaf4LKF0/vADfyFUlfMIDK0=
Received: from localhost.localdomain (fttx-pool-80.245.77.151.bambit.de
 [80.245.77.151])
 by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 815F3100396;
 Tue, 20 Apr 2021 17:16:33 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] thermal: mediatek: add sensors-support
Date: Tue, 20 Apr 2021 19:16:25 +0200
Message-Id: <20210420171625.133860-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mail-ID: dd281ef3-14fe-49a8-a0ae-7fed3d2a241c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_101638_452529_5DBD6442 
X-CRM114-Status: UNSURE (   9.78  )
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
v3: drop no_hwmon
v2: drop ifdef and used devm_thermal_add_hwmon_sysfs
---
 drivers/thermal/mtk_thermal.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index 149c6d7fd5a0..32be8a715c7d 100644
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
@@ -1087,6 +1089,11 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 		goto err_disable_clk_peri_therm;
 	}
 
+	tzdev->tzp->no_hwmon = false;
+	ret = devm_thermal_add_hwmon_sysfs(tzdev);
+	if (ret)
+		dev_err(&pdev->dev, "error in thermal_add_hwmon_sysfs");
+
 	return 0;
 
 err_disable_clk_peri_therm:
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
