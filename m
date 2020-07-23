Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A9FC433E5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 07:41:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C301E206C1
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 07:41:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pnCIGtAF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jbKQwJnA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C301E206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTDnCuoTua27SqIPb/RW6hmcNlORFiCN47BaK+O8CCo=; b=pnCIGtAFQtlox6wTCzYfe/1r/y
	HVfP/y4XX5KVSkhFSObhVQIlwh/lwMVCaZwXVdFLRSoIwDiSApOhS5+3W0cLcQrUySwwFkQlm3stO
	xpSvYeOsYdXVxGSfURhW4JChIC0K2r4obpnV9aZGNac+VMTjE6cXkg/FAiMCy/dIfZnBu5J5Irn6T
	giqruSC+XGLC0faflxsIVwM+9Cwj8ZnqwY2u4k270Co8hhddYFYTUmkkROE5dpMxT0r9b7BfKVg7f
	ACnhBpZW1E10cMiyJvgcbwx0GEj1uxHcpIwOTJbYvy1aRG9DurPQk0mr1d/pDhPQNFxst5v7XSpoL
	r0XFX69w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyVqN-0005oF-RG; Thu, 23 Jul 2020 07:40:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyVoT-0004rK-Oo; Thu, 23 Jul 2020 07:38:47 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2541620888;
 Thu, 23 Jul 2020 07:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595489925;
 bh=Z8MuOz+oKCf2eX1Gix1+yisOoYg6lXsXqmuJC5dVEe4=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jbKQwJnAtJ8kzg+QIqHrvrZep8m9TPS+c5fv1JPjZ1djhud+PmhM3cIqYlBeVc9Qu
 bYGdC+D8iEAG0v7ZZIHd9ezVDaaf9N4cvNAiEYbYrd8U2XRX7nydCTuZnqu+srGgvh
 t5m+kRWzORydByvRkFVokRJLO15cbQGUkO4pFU/E=
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm@kernel.org, soc@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Markus Mayer <mmayer@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Roger Quadros <rogerq@ti.com>,
 Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 09/23] memory: of: Remove unneeded extern from function
 declarations
Date: Thu, 23 Jul 2020 09:37:30 +0200
Message-Id: <20200723073744.13400-10-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723073744.13400-1-krzk@kernel.org>
References: <20200723073744.13400-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_033846_246745_99A1515C 
X-CRM114-Status: GOOD (  12.13  )
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
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
