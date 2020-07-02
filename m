Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8663C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 06:23:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AEC52089D
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 06:23:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="taOunxTW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="HpO8j+oo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AEC52089D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J6URT4kQa29dwLkzp46oFBDDPRQbhu1g97olkOlTDeg=; b=taOunxTWKKOWDxk/TXf1i91GZ
	yy8hgwWW8QQlGYlBAwz5BVNf8wjTzRHiFMH+1wVdzNh0ZYFR67v9radAfXW12Hi9b+TbuqwoW28i3
	Aebs+4nKh9kYjYdaDuYE4mMGImv52TI1SakUhRvaX4Nnh/7coF9L2mCR26SY99qmfZRbQnXP4ED1c
	iVEhqFJqnHl5QlM73NRnVH2CE3KfJOHRmrfAv9yK0apZU83wF6znh3Ubut9gHzawM0uuB2NyviW8V
	kdbawTfmIXcGak05atiR47Hy11AaXKwdwNGog0nHAPoJ3LAkq8mChAkT7EtLQ2Nev2zif0SsEnWaN
	Gb7i8ufsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqsdU-0003Jh-VO; Thu, 02 Jul 2020 06:23:53 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqsdT-0003IX-LY
 for linux-mediatek@lists.infradead.org; Thu, 02 Jul 2020 06:23:52 +0000
Received: by mail-yb1-xb49.google.com with SMTP id z7so28840043ybz.1
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Jul 2020 23:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=MaFXFUTySiLKYk3Z8Ey8ljkWyigRLA9QlN8KpEVxaas=;
 b=HpO8j+ooh+DAxXHg28sv9p6lhCrB1r7AJwKn3FWvCL7Paa0RV1y7CZudbCkjxY0KV+
 n72PRRaqDGQhUZQHNggZCAWf7jI+GiM6bpUiRpXsNkrvTrI6WpupwUDmvs6ayML5k9hA
 uWuCFog9HN3f7U6A3Ch77vna3rMlKTNhfdfWrCbG3KJc9LXr1fbsrLjvHAbeazQmzTrD
 Qeya3T0QHKtAWY5tfs04Ewd9Fqqvh+LsDCBn2pnd6xoeOrTCHYtQGCkG/CJ2e5AIyOd9
 14OCWdylxbNxCvsVJyeGHS6zkW5Uox2NesJFpP2g6rzPGStCszqKfAdz7mbYVKv9fpu8
 pasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=MaFXFUTySiLKYk3Z8Ey8ljkWyigRLA9QlN8KpEVxaas=;
 b=FLFfq82TjVpsChzOB2hrFEAN9D4T1micbI6zcRpK952JSrjTk+4xWXrw+H1slIEsmi
 bDwRF4qBJJ0KaxugSswB7Dc3QidU1DcfX5Um/T/Olk8M55FZq3DMNZgWJ6hq0Ha7rMIc
 pwCVjmF5NIQm1sLRWeD6W5qVXq1K1jKHZbDsLWVGImD7GXtVdQfB4s8dNSkbVnbBDUof
 3ESG1KxDMGq4cVqVlrTCGykUP3SYvjumrgXhHzblt3nYucK81EYJzMQtBNvCzGs4MwY5
 XzPiKPGr4DD8sTKmHkEiBEAsCZ6zeMzYqPBaRM3zckKGdLjoQ2FYsNUz3ibWEmONppGp
 vxew==
X-Gm-Message-State: AOAM530JTbPXxrCYs3y0YNiCytGjSq2BfI9IVO2XvVaP9gOF7OqHbuI+
 ShuTGg2yPfregES+3+WMty3KA7TA668RWMABihyJFWy8/s1QIb8/e/fUG0LvGZxHba1FshErFLp
 LGSIMVvQ+0YcZVDWq9z3sZZZOnjkD0ZYXWRWAghzY1p/VEUl3/F4C6EsRW/MDcJ7QYseUMAgB66
 Lpx1Ub
X-Google-Smtp-Source: ABdhPJyX4ZwBQKR2MfzfX9ehWTPofcH8pisBfi1+UkVEQTv0xTZgjt23xNzESqt2av4NzoI9gb5MuUXtyPXs
X-Received: by 2002:a25:9904:: with SMTP id z4mr47219203ybn.146.1593671028182; 
 Wed, 01 Jul 2020 23:23:48 -0700 (PDT)
Date: Thu,  2 Jul 2020 16:23:17 +1000
In-Reply-To: <20200702062320.2903147-1-amistry@google.com>
Message-Id: <20200702162231.v2.1.Icf69e2041b1af4548347018186c3ba6310f53e66@changeid>
Mime-Version: 1.0
References: <20200702062320.2903147-1-amistry@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v2 1/4] regulator: mt6397: Move buck modes into header file
From: Anand K Mistry <amistry@google.com>
To: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_022351_765791_2C95B216 
X-CRM114-Status: GOOD (  12.91  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org,
 Anand K Mistry <amistry@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, hsin-hsiung.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This will allow device trees to make use of these constants.

Signed-off-by: Anand K Mistry <amistry@google.com>
---

Changes in v2: None

 drivers/regulator/mt6397-regulator.c              |  4 +---
 .../regulator/mediatek,mt6397-regulator.h         | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 3 deletions(-)
 create mode 100644 include/dt-bindings/regulator/mediatek,mt6397-regulator.h

diff --git a/drivers/regulator/mt6397-regulator.c b/drivers/regulator/mt6397-regulator.c
index 269c2a6028e8..d51e98ce1138 100644
--- a/drivers/regulator/mt6397-regulator.c
+++ b/drivers/regulator/mt6397-regulator.c
@@ -13,9 +13,7 @@
 #include <linux/regulator/machine.h>
 #include <linux/regulator/mt6397-regulator.h>
 #include <linux/regulator/of_regulator.h>
-
-#define MT6397_BUCK_MODE_AUTO	0
-#define MT6397_BUCK_MODE_FORCE_PWM	1
+#include <dt-bindings/regulator/mediatek,mt6397-regulator.h>
 
 /*
  * MT6397 regulators' information
diff --git a/include/dt-bindings/regulator/mediatek,mt6397-regulator.h b/include/dt-bindings/regulator/mediatek,mt6397-regulator.h
new file mode 100644
index 000000000000..99869a8665cf
--- /dev/null
+++ b/include/dt-bindings/regulator/mediatek,mt6397-regulator.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _DT_BINDINGS_REGULATOR_MEDIATEK_MT6397_H_
+#define _DT_BINDINGS_REGULATOR_MEDIATEK_MT6397_H_
+
+/*
+ * Buck mode constants which may be used in devicetree properties (eg.
+ * regulator-initial-mode, regulator-allowed-modes).
+ * See the manufacturer's datasheet for more information on these modes.
+ */
+
+#define MT6397_BUCK_MODE_AUTO		0
+#define MT6397_BUCK_MODE_FORCE_PWM	1
+
+#endif
-- 
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
