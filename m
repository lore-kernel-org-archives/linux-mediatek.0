Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5CF6C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:46:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8438A206F0
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:46:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iLMb/Qww";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uNwQdAcs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8438A206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTDnCuoTua27SqIPb/RW6hmcNlORFiCN47BaK+O8CCo=; b=iLMb/QwwJSP7vi0a9s55EyA98v
	pTq4LirjMP7OOKlFzJKW8Vrb+8b5/NZF1MQvUm48ELHxfKxWTEBDEk0uXtmoVKMLZG8NIFnKG8Zbb
	cRS/+VKSjkQjdTjX89Dky5ziI9VTrc0leSgzad7eUiUPLmnZq/oEuqyuSrHYXq5FkhpqwARgY66JO
	cK2hozhA/0xdjcIz7AhOTFC3OcI9Cr4I+0h1gEr9253cQV22FtEqYWODVgyAHNzfihypz0zmwH5ks
	94rXlTLFSInvGBglVEzPoYPOYIGwVEm9zhlSQk9PUNvYMRdOmzIcdus9jYtlz2YVxh6qTnFa/kZAS
	iXru83Rg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jysPV-0004JC-9s; Fri, 24 Jul 2020 07:46:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jysLB-0002EG-Vp; Fri, 24 Jul 2020 07:42:05 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EBA0C2074F;
 Fri, 24 Jul 2020 07:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595576519;
 bh=Z8MuOz+oKCf2eX1Gix1+yisOoYg6lXsXqmuJC5dVEe4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uNwQdAcsnATv7hQA0Lrn9Cdl3YK45IejFRqKxfvibToH4PDyoEn8e5bJwZTTa+wvl
 nq9SHZ26y3lvVvdpTBoPAGSIs400WQT567lMKaioL3HHr4cbsW4bsTnzrB1RxLGmNg
 eq6HTShxDRY+VW88G4GM4tfm7tGasGGkO59Z6Mx4=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Markus Mayer <mmayer@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Roger Quadros <rogerq@ti.com>,
 Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Kukjin Kim <kgene@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v2 10/29] memory: of: Remove unneeded extern from function
 declarations
Date: Fri, 24 Jul 2020 09:40:19 +0200
Message-Id: <20200724074038.5597-11-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_034202_538320_28EFFFE6 
X-CRM114-Status: GOOD (  12.36  )
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Function declarations in headers do not need to come with extern
keyword.  Remove them to make the declaration slightly shorter.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/of_memory.h | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/memory/of_memory.h b/drivers/memory/of_memory.h
index e39ecc4c733d..4a99b232ab0a 100644
--- a/drivers/memory/of_memory.h
+++ b/drivers/memory/of_memory.h
@@ -3,22 +3,23 @@
  * OpenFirmware helpers for memory drivers
  *
  * Copyright (C) 2012 Texas Instruments, Inc.
+ * Copyright (C) 2020 Krzysztof Kozlowski <krzk@kernel.org>
  */
 
 #ifndef __LINUX_MEMORY_OF_REG_H
 #define __LINUX_MEMORY_OF_REG_H
 
 #if defined(CONFIG_OF) && defined(CONFIG_DDR)
-extern const struct lpddr2_min_tck *of_get_min_tck(struct device_node *np,
-		struct device *dev);
-extern const struct lpddr2_timings
-	*of_get_ddr_timings(struct device_node *np_ddr, struct device *dev,
-	u32 device_type, u32 *nr_frequencies);
-extern const struct lpddr3_min_tck
-	*of_lpddr3_get_min_tck(struct device_node *np, struct device *dev);
-extern const struct lpddr3_timings
-	*of_lpddr3_get_ddr_timings(struct device_node *np_ddr,
-	struct device *dev, u32 device_type, u32 *nr_frequencies);
+const struct lpddr2_min_tck *of_get_min_tck(struct device_node *np,
+					    struct device *dev);
+const struct lpddr2_timings *of_get_ddr_timings(struct device_node *np_ddr,
+						struct device *dev,
+						u32 device_type, u32 *nr_frequencies);
+const struct lpddr3_min_tck *of_lpddr3_get_min_tck(struct device_node *np,
+						   struct device *dev);
+const struct lpddr3_timings *
+of_lpddr3_get_ddr_timings(struct device_node *np_ddr,
+			  struct device *dev, u32 device_type, u32 *nr_frequencies);
 #else
 static inline const struct lpddr2_min_tck
 	*of_get_min_tck(struct device_node *np, struct device *dev)
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
