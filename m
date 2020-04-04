Return-Path: <SRS0=WnB0=5U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2407FC2BA16
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Apr 2020 10:38:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E96E9206C3
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Apr 2020 10:37:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NgR/Iu55";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMhho21o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E96E9206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zOsv135vOmMpeIHvvtAe9N3TK8Y9Tq6vwEW5ggVInSo=; b=NgR/Iu550SdFfV
	zjtIp5nL/hmxScp6tmzp+LHf+tT9k0iC4SPVA3+1Vzx3wJuj6HC57ZiIIqlDnuVllN8RDoBQEPrOO
	5RGqJyf30G8M7nFlwsDSJarV5cZIdUwdJYLKbZjqJhWBRCfA+yjoPFFXIdT9kMNXYX0YcQQ2c+dJ6
	J9ysd9bDs92kGDIjaIox17w70ZHuQ9Fuvd3hSYsA1iEmhCVgC81GkuFb9b+j3ziSdF2rBcepCShud
	XLPqdSRNwKBrh8no2Rf/V4BRcNRaaT1+eC+WtQDAQGiIm9W2b2xlh5ofqjiuuh4KlYfcH/iq+/x98
	A9VYvXZ+FOWht1crxN3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKgBS-0002JB-O3; Sat, 04 Apr 2020 10:37:50 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKgBJ-0002C2-IM; Sat, 04 Apr 2020 10:37:43 +0000
Received: by mail-pf1-x441.google.com with SMTP id 22so4935758pfa.9;
 Sat, 04 Apr 2020 03:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=9e3YjywRlT9unLTEqN08LmJN3s3Ftr6vaLOvEkkDfWs=;
 b=cMhho21ovWgHDV3FaLA06KOpuRyaeGEebizvDrE2bktmRABorboNdJKEDiixgudSw/
 g7YVkmLsY6y7kr59iq2fzfv6HLmd9i5a4cA0SG9hhi4FYwcaxYg1qL3NqpAtGYZ2ucal
 aoXxn7KC7W34kwAW3+TJczxk6zzMyxWrMyK6Kg1fcpgSh9gVzJo+MnKn6hhMfMjK/1VJ
 jmNCATOSRVHESlkVtMh1mBQuoYcDhwBFgJuOAQFwR0aLlMWcWIsbjie6KBrIhtbHKOPH
 HLnhQyypFy8QvlYatlftg9bLuUHNUglCprJse5gk0+CZVkoEUrQKQI9FYfU4ho+7uAsY
 JOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=9e3YjywRlT9unLTEqN08LmJN3s3Ftr6vaLOvEkkDfWs=;
 b=K3AGotjmX8qVLNaggs2s09YPEqn4bx30ZjSfzK7VMxEgMUj0y+i54MCL4bZMDSlXYU
 KHEXUBfvx9nCJOVa7aLqJEB/upo4Fgr2mUuY7K+WuKSfLl85W8SqmYI4iy5zHpJcCvjg
 PNeW+MyXQ2uMRH/fMIonXUFmMIrXorGkagkclYKat+RtwFkfj2u024SrkLzCqY7ex+Kb
 yZbq/bdAp6HOe/WdtS0e0BgslqpyP277CPLiOn9hk7odnWtGW+MgMDOMo7Im0V9wfg2v
 E5NBxLZFfxo4E7EpU3melfJ85rfvXKNrbbHybO7uGw66OiarWMO5r4YE4ygPqmxy2Np7
 rg2g==
X-Gm-Message-State: AGi0PuYHXwC7/4hRYDPD0p62xyP/4+8MNBoRC6snQqQNYNWOo3zIu9G+
 DXGOm2zzqRwv8JJOiJdAdBY=
X-Google-Smtp-Source: APiQypIdV/cxtmiWWQdClIs7ou/+T/O54jGMKfa4HBQfw3T/QzNaY+mxHIEu+x9ivWzjNyyH4GTSOA==
X-Received: by 2002:a63:b954:: with SMTP id v20mr11630510pgo.381.1585996659225; 
 Sat, 04 Apr 2020 03:37:39 -0700 (PDT)
Received: from nishad ([106.51.232.103])
 by smtp.gmail.com with ESMTPSA id x4sm7382302pfi.202.2020.04.04.03.37.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 04 Apr 2020 03:37:38 -0700 (PDT)
Date: Sat, 4 Apr 2020 16:07:31 +0530
From: Nishad Kamdar <nishadkamdar@gmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Joe Perches <joe@perches.com>
Subject: [PATCH] USB: mtu3: Use the correct style for SPDX License Identifier
Message-ID: <20200404103728.GA6011@nishad>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200404_033741_631659_231107E6 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch corrects the SPDX License Identifier style in
header files related to MediaTek USB3 Dual Role controller.
For C header files Documentation/process/license-rules.rst
mandates C-like comments (opposed to C source files where
C++ style should be used).

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/usb/mtu3/mtu3.h         | 2 +-
 drivers/usb/mtu3/mtu3_debug.h   | 2 +-
 drivers/usb/mtu3/mtu3_dr.h      | 2 +-
 drivers/usb/mtu3/mtu3_hw_regs.h | 2 +-
 drivers/usb/mtu3/mtu3_qmu.h     | 2 +-
 drivers/usb/mtu3/mtu3_trace.h   | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index 6087be236a35..d49db92ab26c 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * mtu3.h - MediaTek USB3 DRD header
  *
diff --git a/drivers/usb/mtu3/mtu3_debug.h b/drivers/usb/mtu3/mtu3_debug.h
index e96a69234d05..fb6b28277c9b 100644
--- a/drivers/usb/mtu3/mtu3_debug.h
+++ b/drivers/usb/mtu3/mtu3_debug.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * mtu3_debug.h - debug header
  *
diff --git a/drivers/usb/mtu3/mtu3_dr.h b/drivers/usb/mtu3/mtu3_dr.h
index 5e58c4dbd54a..760fe7d69c6b 100644
--- a/drivers/usb/mtu3/mtu3_dr.h
+++ b/drivers/usb/mtu3/mtu3_dr.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * mtu3_dr.h - dual role switch and host glue layer header
  *
diff --git a/drivers/usb/mtu3/mtu3_hw_regs.h b/drivers/usb/mtu3/mtu3_hw_regs.h
index 8382d066749e..bf34f784f84b 100644
--- a/drivers/usb/mtu3/mtu3_hw_regs.h
+++ b/drivers/usb/mtu3/mtu3_hw_regs.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * mtu3_hw_regs.h - MediaTek USB3 DRD register and field definitions
  *
diff --git a/drivers/usb/mtu3/mtu3_qmu.h b/drivers/usb/mtu3/mtu3_qmu.h
index 9cfde201db63..66e1c0ab5a99 100644
--- a/drivers/usb/mtu3/mtu3_qmu.h
+++ b/drivers/usb/mtu3/mtu3_qmu.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * mtu3_qmu.h - Queue Management Unit driver header
  *
diff --git a/drivers/usb/mtu3/mtu3_trace.h b/drivers/usb/mtu3/mtu3_trace.h
index 050e30f0fbd4..1b897636daf2 100644
--- a/drivers/usb/mtu3/mtu3_trace.h
+++ b/drivers/usb/mtu3/mtu3_trace.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /**
  * mtu3_trace.h - trace support
  *
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
