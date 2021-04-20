Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB167C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 15:54:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 562EF61003
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 15:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 562EF61003
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AmoXhIoIXYd4A6UnY12a9gEeLyL+Vzf3Pip4jlYQYPk=; b=Ovk9RJxk0ZF6Mvyol0fdskUETo
	gUn1u0gN2Ex8aMzSeguYw+6SweCdRZCuBlx/i2ky9Lpvs82ZUrYp2ojVjepX+tchoriOedPAQ+nt9
	cuevrKzLqB1NSYTqKtd24AB4emnlOFzkGFK/MRXJ9obVQieWxY3B9uMkfoUPCIPDZzOuatEHri5bB
	ujh6f+mdRRxIx1WTqcGGTqrjv2bzmpewlhVilb8SAleVMHk5IrMt4iT6nMhVRzPjPhnNJjBudNSSN
	aAo3K8uMDDY8zjDSpeacb/pEhvacnYJ7i+qcS+58SXYag/evjd2qdA2t+erRwwB035Gnhoojx5ymy
	axuULqVw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYsi0-00CWOa-8t; Tue, 20 Apr 2021 15:54:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYsho-00CWNn-L5; Tue, 20 Apr 2021 15:54:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=kQYv4OtNr6e//YkMopHLbwWlrJMzWOHnE8M1UCzYfGU=; b=XBkTX/fgwbYR173CbdpIjSsqfm
 dcvuaaOneRl11x3ZuWOKlJeCMQuwgErmH6UvwST/PS80FVM7ZBDcjQKNuNl2HB3rqULANlVy/WH0H
 orVJee5YP9xeZsJLvvOt0fsgvVyTkMgsmyFATVf+Gn+cewf1dl/d15JvrZ1WOu7f3Yto8elj8Z2Pq
 eWEQGtsH4c7kGHq94wVC8NfLaj8knW7/8/Od0T1S0jca095YBpj3l2t/UiwH5rfZgo+VnYeNx0pS2
 t4a4JovPBNLr/IX0jPoYmJVN8mTWNt//WlvwLRTwOjdW/nLnfLZ3cTD76CLpQcegTrLqesz2WJiIy
 c7aRh2jQ==;
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYshi-00CFcN-TO; Tue, 20 Apr 2021 15:54:27 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
 by mxout1.routing.net (Postfix) with ESMTP id 7B6583FE0A;
 Tue, 20 Apr 2021 15:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1618934057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=kQYv4OtNr6e//YkMopHLbwWlrJMzWOHnE8M1UCzYfGU=;
 b=NFmpEG8uJGS8FmvRAXIb9Ilqih45UNHL7PMvflMewmrdAAN+fveZC0qe0TIkbKNKjHreuX
 uySf7rYOuumh3KADGmogaJ1lkRutiRxOE8XN8e3xbgWhNvGayANhpv1Hg/TpczHP778rGR
 mqS+7i9INHrirEqcbbZOCS7aNyB/FKE=
Received: from localhost.localdomain (fttx-pool-80.245.77.151.bambit.de
 [80.245.77.151])
 by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 88927100396;
 Tue, 20 Apr 2021 15:54:16 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] thermal: mediatek: add sensors-support
Date: Tue, 20 Apr 2021 17:54:10 +0200
Message-Id: <20210420155410.132141-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mail-ID: a26884df-a290-43e7-8bcd-1a1379261d7e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_085423_277653_A1B97886 
X-CRM114-Status: UNSURE (   9.88  )
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
