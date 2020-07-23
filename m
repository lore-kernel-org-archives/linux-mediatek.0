Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B535C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 07:39:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 172AD206C1
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 07:39:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x2hAdPLK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="bXf/SFlM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 172AD206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/p9S6ztdEWuNAjaUEPY6Csx8IMNMsmsXYsgFn1h/HiQ=; b=x2hAdPLK/2F27sMhPrhvTUHMdC
	mAZ9vdMzJAlLkRi7QvMhbk4jDgANKCHKsLbg6xZFt4A8E+flQUDhHDGcOnTe6JsY1yxslkttz/LwF
	Y6d6rlkOxAvv/cQNTOPVqvr/R6UM7W795Tse+yQOxu1PF+PhT5L7Ckbvfzoz0pDcYLecIALgvO3KN
	ovCLlahJtOdt2CcV12zONqtZ3EmaZ2PxA2diZHGFoBvwxC7GMQmByfiQpYkWY53ikzf6UTA/IfF5y
	+GUx4wId8HdExxZpvlUB2aTTqtWhIAVXwwUlLzOXu/Fxq/VsZPEuPEoSbYeNBr+LKLgVioYrHOjcP
	B4qJzSlQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyVpN-0005KA-Hm; Thu, 23 Jul 2020 07:39:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyVoJ-0004mQ-Jo; Thu, 23 Jul 2020 07:38:37 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AC68F208E4;
 Thu, 23 Jul 2020 07:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595489914;
 bh=fStTa63/zlpMTDTDyAH0TKomthctGMET63ewzq4d76A=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bXf/SFlMnTz2Ly+2aeAn/h2BpT10kVT7CKpRBmjY65PweCs8de/cxEHGgd5vjqhjb
 8dqSKD5NQkXxA5nIxClG+hmQDD6vddbuK9EpX7OD9O16pXtmw7uNTQTHCnKpRIArIB
 XbBGQAKxrbaELJzCz/ZYgEvwFOicfChZVD8Vc07Y=
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
Subject: [PATCH 07/23] memory: of: Remove __func__ in device related messages
Date: Thu, 23 Jul 2020 09:37:28 +0200
Message-Id: <20200723073744.13400-8-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723073744.13400-1-krzk@kernel.org>
References: <20200723073744.13400-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_033835_848107_BB495FEC 
X-CRM114-Status: GOOD (  13.07  )
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

Messages printed by generic of_memory code will still be using device
context so their location/meaning will be known.  Printing __func__ is
not needed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/of_memory.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/memory/of_memory.c b/drivers/memory/of_memory.c
index cfcb91eeccfb..8a5b654eca6b 100644
--- a/drivers/memory/of_memory.c
+++ b/drivers/memory/of_memory.c
@@ -4,6 +4,7 @@
  *
  * Copyright (C) 2012 Texas Instruments, Inc.
  * Copyright (C) 2019 Samsung Electronics Co., Ltd.
+ * Copyright (C) 2020 Krzysztof Kozlowski <krzk@kernel.org>
  */
 
 #include <linux/device.h>
@@ -54,7 +55,7 @@ const struct lpddr2_min_tck *of_get_min_tck(struct device_node *np,
 	return min;
 
 default_min_tck:
-	dev_warn(dev, "%s: using default min-tck values\n", __func__);
+	dev_warn(dev, "Using default min-tck values\n");
 	return &lpddr2_jedec_min_tck;
 }
 EXPORT_SYMBOL(of_get_min_tck);
@@ -114,7 +115,7 @@ const struct lpddr2_timings *of_get_ddr_timings(struct device_node *np_ddr,
 		tim_compat = "jedec,lpddr2-timings";
 		break;
 	default:
-		dev_warn(dev, "%s: un-supported memory type\n", __func__);
+		dev_warn(dev, "Unsupported memory type\n");
 	}
 
 	for_each_child_of_node(np_ddr, np_tim)
@@ -143,7 +144,7 @@ const struct lpddr2_timings *of_get_ddr_timings(struct device_node *np_ddr,
 	return timings;
 
 default_timings:
-	dev_warn(dev, "%s: using default timings\n", __func__);
+	dev_warn(dev, "Using default memory timings\n");
 	*nr_frequencies = ARRAY_SIZE(lpddr2_jedec_timings);
 	return lpddr2_jedec_timings;
 }
@@ -191,8 +192,7 @@ const struct lpddr3_min_tck *of_lpddr3_get_min_tck(struct device_node *np,
 	ret |= of_property_read_u32(np, "tMRD-min-tck", &min->tMRD);
 
 	if (ret) {
-		dev_warn(dev, "%s: errors while parsing min-tck values\n",
-			 __func__);
+		dev_warn(dev, "Errors while parsing min-tck values\n");
 		devm_kfree(dev, min);
 		goto default_min_tck;
 	}
@@ -200,7 +200,7 @@ const struct lpddr3_min_tck *of_lpddr3_get_min_tck(struct device_node *np,
 	return min;
 
 default_min_tck:
-	dev_warn(dev, "%s: using default min-tck values\n", __func__);
+	dev_warn(dev, "Using default min-tck values\n");
 	return NULL;
 }
 EXPORT_SYMBOL(of_lpddr3_get_min_tck);
@@ -262,7 +262,7 @@ const struct lpddr3_timings
 		tim_compat = "jedec,lpddr3-timings";
 		break;
 	default:
-		dev_warn(dev, "%s: un-supported memory type\n", __func__);
+		dev_warn(dev, "Unsupported memory type\n");
 	}
 
 	for_each_child_of_node(np_ddr, np_tim)
@@ -291,7 +291,7 @@ const struct lpddr3_timings
 	return timings;
 
 default_timings:
-	dev_warn(dev, "%s: failed to get timings\n", __func__);
+	dev_warn(dev, "Failed to get timings\n");
 	*nr_frequencies = 0;
 	return NULL;
 }
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
