Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8385C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 03:16:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9836120747
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 03:16:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i72UEqS+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="j7CIePE2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9836120747
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ce48GY7/OJCK7UIoHwJcFzv3hc/OJmnpFdAmbsQOnWo=; b=i72UEqS+ooVsGXKHlvKti6Hds
	nZSEsKgUmoKbUzel2MxXdyrJw/TG/ocV4GlXbiHpgv7x2d/n2qgfPwCHlgzf+tM2U6AW0WZeRxv1P
	eWW4NVtEGkROp/pwAbe6B9z+o5yQPSQSf8eKxfE6KOiJ6PKp3wWCrqnXrXccd+uuf8tq/WiJKEznm
	KHQayBHuHXR2XjXsZNNSitzPZ/p1x88aWVra/lmrZAsi3qxPhrXVg4ZfLdObDgUSzALZOtg3QF1yv
	AGztnGJPOYsshvzsVn7/Pepd+gY0y+mV0zoaF0e0PZH/z/bFKWKpgp/dcnUcERADK7wQpvKbCs5KP
	zs3HahTiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqphc-0004Bf-OM; Thu, 02 Jul 2020 03:15:56 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqpha-0004Ac-CT
 for linux-mediatek@lists.infradead.org; Thu, 02 Jul 2020 03:15:55 +0000
Received: by mail-yb1-xb49.google.com with SMTP id z7so28454259ybz.1
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Jul 2020 20:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=CdvIUOflYKIpzoou6WtUxcq+gVwfhVp2A4cJfb6QLOQ=;
 b=j7CIePE2feBXIQoNkIEb9ht1a2F3NGiMraG57XHLRoNnulgQBq3IFW8CQuBoDdO+GV
 R0Ij5FmaSWYor33Z54uc2bupMuj4TPrjrpMTZ1cg180DmgQI61lzCY1n7mb2Qf/KIN0H
 QhVnQ2/QfP2S/F6gH/Euq+hf0aKuai9RQyAE10NesyHLF+1y9LXo3jt6NoD4Bx54SeAP
 N0/D/ZxNn5+ur4bihNwamMHV60sdlDdHYz1h/Swm+j0Ae6zeDytN5vsvy52dR9tqgWou
 wE8hsx+tiNOjw/ne8XOR/FjOLp21lTeqOCaSJgZ3fPkjYbkwnibTTZ1f/InmQE2IncV4
 K/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=CdvIUOflYKIpzoou6WtUxcq+gVwfhVp2A4cJfb6QLOQ=;
 b=Jb33wz1HrA2WhELYR8YirVISfD7U0FpigTr5zXM7vfXHPaUcwnbnN5tzhCkSbztk/v
 GqDkHvK1WAC+sWhR2fsjpvbeHbbVr3te3xZO55QRmfgvvhiLHtlfRmcmcwUR9HZ/P5az
 lrrV24gHQmPvWWaEeuUQp5pbE3Ubmk1KNd+74OVnJ577TZJjz7pph/0yNCXQehYsC2id
 MS73DU2k7YM/d9ul48xNGhdqP0BYduJM1Ca7EpaLPx1aHrnZ5v0/wpW23kZsGAc0sVAX
 eIIgqNS2K99SlGRwBNQ+oMOTJjGogfr16lN84K2oABRpMuzNgCQUZ02S93Yo7ASUF41V
 gRBw==
X-Gm-Message-State: AOAM533qiQMUuumqFZMs9sBkbY6cFTWv+l2C9pc3ksrY5L+VaNUGlvYL
 7ZZVIk6/U921JZIoIcwyX4ZdeAHsN3He57iS/cJr3mOZttAncK1y2TpRAZ1RsJYol9KWDSGfob7
 k+fteY7D1OmRG/diKd3W4H7B55tIC28e+TUTFVFiu83yJvmvh1p0umxqLXt8qG6E/KDnN1VthI0
 uGXlf3
X-Google-Smtp-Source: ABdhPJzXNz99QATFcwOzy0xMvaJnAbV8I/wYK/CJKezLCha1UrJlnlmTSpest394fpFEmmeLEDBYCcsfeCXx
X-Received: by 2002:a25:aa70:: with SMTP id
 s103mr48095292ybi.492.1593659751405; 
 Wed, 01 Jul 2020 20:15:51 -0700 (PDT)
Date: Thu,  2 Jul 2020 13:15:22 +1000
In-Reply-To: <20200702031525.2662441-1-amistry@google.com>
Message-Id: <20200702131350.1.I96e67ab7b4568287eb939e8a572cbc03e87f1aa0@changeid>
Mime-Version: 1.0
References: <20200702031525.2662441-1-amistry@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH 1/4] regulator: da9211: Move buck modes into header file
From: Anand K Mistry <amistry@google.com>
To: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_231554_435284_2D0D589B 
X-CRM114-Status: GOOD (  13.18  )
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
 Mark Brown <broonie@kernel.org>, hsinyi@chromium.org,
 Support Opensource <support.opensource@diasemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This will allow device trees to make use of these constants.

Signed-off-by: Anand K Mistry <amistry@google.com>
---

 drivers/regulator/da9211-regulator.c             |  5 +----
 .../dt-bindings/regulator/dlg,da9211-regulator.h | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 4 deletions(-)
 create mode 100644 include/dt-bindings/regulator/dlg,da9211-regulator.h

diff --git a/drivers/regulator/da9211-regulator.c b/drivers/regulator/da9211-regulator.c
index 2ea4362ffa5c..1f9b75b41346 100644
--- a/drivers/regulator/da9211-regulator.c
+++ b/drivers/regulator/da9211-regulator.c
@@ -17,6 +17,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/regulator/of_regulator.h>
 #include <linux/regulator/da9211.h>
+#include <dt-bindings/regulator/dlg,da9211-regulator.h>
 #include "da9211-regulator.h"
 
 /* DEVICE IDs */
@@ -24,10 +25,6 @@
 #define DA9213_DEVICE_ID	0x23
 #define DA9215_DEVICE_ID	0x24
 
-#define DA9211_BUCK_MODE_SLEEP	1
-#define DA9211_BUCK_MODE_SYNC	2
-#define DA9211_BUCK_MODE_AUTO	3
-
 /* DA9211 REGULATOR IDs */
 #define DA9211_ID_BUCKA	0
 #define DA9211_ID_BUCKB	1
diff --git a/include/dt-bindings/regulator/dlg,da9211-regulator.h b/include/dt-bindings/regulator/dlg,da9211-regulator.h
new file mode 100644
index 000000000000..cdce2d54c8ba
--- /dev/null
+++ b/include/dt-bindings/regulator/dlg,da9211-regulator.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _DT_BINDINGS_REGULATOR_DLG_DA9211_H
+#define _DT_BINDINGS_REGULATOR_DLG_DA9211_H
+
+/*
+ * These buck mode constants may be used to specify values in device tree
+ * properties (e.g. regulator-initial-mode, regulator-allowed-modes).
+ * A description of the following modes is in the manufacturers datasheet.
+ */
+
+#define DA9211_BUCK_MODE_SLEEP		1
+#define DA9211_BUCK_MODE_SYNC		2
+#define DA9211_BUCK_MODE_AUTO		3
+
+#endif
-- 
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
