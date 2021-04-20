Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B598DC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 17:23:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5457061076
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 17:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5457061076
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3C86aSq36jpPvdRzLhqosWVZUpdQ+2SpH1o8v1t0Gho=; b=JMVX1rRY0Pzgs5tMMar+sGJ4r8
	7YvVKHPnYBcg/a7lcTqV3W6LBZLzsAoIBxB1U1FcVjTZI7jL4DjLONanaqwhNPeAnbarOjoLo0901
	lOZfrOxmYhueK/q5/OqpCU4+FV2eJ7KM23eTkLJfO9e5bnFtZTSODPXHKaEYlFipRgC7GNSmQhrGz
	JhH79gY+3BMuflIsbj8+dG+FicetL5YRheCw3/mzVtCCJUQB/9xBCXwV8eJOcoLhJPCllheTFUnFd
	+kqDcmyTnBgI3tBw2KD/f7b5ZtxE5/LijEQs72tpdANpTcyYgDgxCWNFj5aXOhZod7VQEMz5RNRIK
	h+wu8Vfg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYu5x-00Ci7o-II; Tue, 20 Apr 2021 17:23:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYu5n-00Ci5c-Kn; Tue, 20 Apr 2021 17:23:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=u2UmPgWhv8jDff+sft2q0VUDxc4XXaa5vanqClNiNS8=; b=ITLK7eXGRy2LVsJfgVmCo0Z4nR
 7vV6B+iCTqCGlT4InTIojQlxWUqwcoNqozk/xxj47xo93QBhLoSE5azjyk2QfFVYFfh/YNzKtAhgd
 JHxCyAmaYHz6EGWbY2MU1MLC1X+5aASHtNiByKz8e8k7+ZCk+DMQZTlZvwE61LMe+UhRWVCs4WsaT
 LL0Qt8xXbK5Q21z23bnp5D2RUP1mrqa9s+247Ri0SnrdeeEu8V0Vha/rQ+gBFnMSRweCsgbXvdR3f
 9BCMRXGJK8VPhjAMwjrx5QT4bc777m+mj1cv5oyHVgv1aDiZdv2Zg/vgU6nidkI+cfEpSsNY77mtm
 dTlkZosw==;
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYu5i-00CJFS-Bk; Tue, 20 Apr 2021 17:23:16 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
 by mxout2.routing.net (Postfix) with ESMTP id 036CC5FCE7;
 Tue, 20 Apr 2021 17:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1618939391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=u2UmPgWhv8jDff+sft2q0VUDxc4XXaa5vanqClNiNS8=;
 b=ehOsyo0UfwFQR70tYVkEiUXuxZe7CvvTgYS3JansE8oYt6/7S5/87gexXfYc2bdTA7uvlj
 i1oDX0EzuvktTIJzIhT/NkdNMgnGZAkiBEKDiL728YufmOlZVHYw5RuifdO6JJXy3nCqrM
 qrkzrBRLKk3InmL6axymeQWgFSYIAXc=
Received: from localhost.localdomain (fttx-pool-80.245.77.151.bambit.de
 [80.245.77.151])
 by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 1F0148064D;
 Tue, 20 Apr 2021 17:23:10 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] thermal: mediatek: add sensors-support
Date: Tue, 20 Apr 2021 19:23:08 +0200
Message-Id: <20210420172308.134685-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mail-ID: 10d04dc0-d980-42d8-8607-1dad480fb628
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_102314_563795_2E878958 
X-CRM114-Status: GOOD (  10.00  )
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
v3: drop no_hwmon - now really, sorry
v2: drop ifdef and used devm_thermal_add_hwmon_sysfs
---
 drivers/thermal/mtk_thermal.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index 149c6d7fd5a0..85964988684b 100644
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
