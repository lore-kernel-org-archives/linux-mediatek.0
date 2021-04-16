Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C54C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 00:39:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DFC66113D
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 00:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DFC66113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dxLx75MYfFbyROFVSehbMzS5NOGBKTRvlHLIW0+054c=; b=lO9hjVtYMRYe8H57ti2OvV5XZ
	c/hMjltAaz0OrgyNIj7pTVFAAdJSxNER6HeK9JkYNBnmRJUmIcDdjsgmL4Uu8BknJ+X25VHpITahj
	r6OPQJvOX0E7f+06N6eW3J5exgWUCLKUYh3umQwC+b7BI/LelnIB/bXZQs8q+tpbc+byXJadMQllv
	iQu2m4NSqwWmfNKSJlTkF2jFkH1lJZ2qWksJEiGSOn0Miv4WJVCnBNlw71ptyfg18/mYekf/wZgJU
	SfEGp9L1utcpfxbsFp+i8vX5rfs1KdFCg3OTtg9BOUod1VRqBy3UPO6VWQqaJz2iBY6pcLgLTKszn
	fWmfHFskg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXCWJ-000G2n-PA; Fri, 16 Apr 2021 00:39:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXCW1-000G0z-Vj; Fri, 16 Apr 2021 00:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=aBY6qtFGj7zNDeJrN4gaVYMDLifsluyCEYYVjXGUGhY=; b=O7INyWN9rqoUzgWOysLab44E9S
 UX9qTtmS0uzkRTVS48CQ4W64r3Z1ahqR0JePDTDO+4veZ49uD7sqBjYFlMyk8iU4rzReDNSucx//a
 FkRXh8diIOl5xrsEqKYeWmbfOyMVE47+XKHrj/JNtuuL656XNjx1bwO9plekArQbq5q211tPYXwSw
 duzgqXsI1yeoAbBlfA7Drv7ElSCCmzgImb81XprSNHRzEq+/3ahiZvMZpspesBJD6pNaHuJfyjV28
 H345IKRb5mRTCvJFPTy4jM8jWMdH69ccEGTIAWv7Ze8syjO2viLVVjvci/ibrQrb/1Di6Cob44RVW
 kPGwteZg==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXCVy-0090Jr-LI; Fri, 16 Apr 2021 00:39:19 +0000
Received: by mail-pl1-x62f.google.com with SMTP id 20so9095722pll.7;
 Thu, 15 Apr 2021 17:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aBY6qtFGj7zNDeJrN4gaVYMDLifsluyCEYYVjXGUGhY=;
 b=cav1PYT9iCq8PxAzlZbBd+YxkDZfawTwl6raGIuwLXAtFBYU8V3WJ63WF45R5/ijlT
 DLCCAOX4TmUPoxxmaKH/H+bFtjtUa2RatsivRWU1USF1TPDt7fzBmnwBlPDLFTOYloa6
 Dg8n/HODoNXMkccFin239ZYZ2rtplEJxO60bpmnKC8eLiyPHhebswwqfbUSNkTcO+GBV
 0w3bxDqPvo5f8U0LE3G5EjQ2RZomxdNjFjU4nzIQ5kDILqXpuT2DyjIuTcHa3VpMpQMn
 +iiKar9SqIrYQswPVz1nH5xSzWStlp+qnuzVyOJ7PtAoJfyWh4t9ZBrNd6vNTqnSq4mQ
 fOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aBY6qtFGj7zNDeJrN4gaVYMDLifsluyCEYYVjXGUGhY=;
 b=LaSzdwXYPc3NOJCl2D1xurdF7h4tS78VCDIxy7lM2WqxHBU34UfnEOjCnbl+qJrmbb
 tTQ4UOO6icG6h8ytkjcrzn4o8fkjNxdWzN6Vx2XcyH/1zNxH9gsR4E40l5cAEjieetwU
 tEhRCwzFyytJbdwbV7JYLHnp84S3BkS8F6UMQCcDHCyaPGLOdRvzWQElZwuxv4NPWalU
 Jv1YqghpQ/sn41562oMbms8cpm8Tbs+b+E/IaufT4Q1HwUtnjANViVZwLT+hO1tQnNMP
 3zjUZIIacZZ0xovoOl4t6BfUYzng6nVrK94iSO+aGMj6G2up0WjN2N9JVtwunTY/OsJt
 +7SA==
X-Gm-Message-State: AOAM531JX57ENyCX92XKSX9UWtnm2gSMte5ayLfWeyRltWKjI/YIZi6o
 2aq12pzpd6H/Fq7pS2qXLEU=
X-Google-Smtp-Source: ABdhPJzZxuzx5BmhL6ooNAafP7LdyiGBNpGXHo1p0bXduDUsTRQt6kHmK1A1kskzEY5G8oe6ZFHByg==
X-Received: by 2002:a17:90a:318d:: with SMTP id
 j13mr6947037pjb.174.1618533557891; 
 Thu, 15 Apr 2021 17:39:17 -0700 (PDT)
Received: from ilya-fury.hpicorp.net ([2602:61:7344:f100::b87])
 by smtp.gmail.com with ESMTPSA id k3sm3187094pfh.12.2021.04.15.17.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 17:39:17 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next,v3] net: ethernet: mediatek: ppe: fix busy wait loop
Date: Thu, 15 Apr 2021 17:37:48 -0700
Message-Id: <20210416003747.340041-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <YHjaBWdMzrhajq2Q@lunn.ch>
References: <YHjaBWdMzrhajq2Q@lunn.ch>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_173918_733538_BF726591 
X-CRM114-Status: GOOD (  14.68  )
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

The intention is for the loop to timeout if the body does not succeed.
The current logic calls time_is_before_jiffies(timeout) which is false
until after the timeout, so the loop body never executes.

Fix by using readl_poll_timeout as a more standard and less error-prone
solution.

Fixes: ba37b7caf1ed ("net: ethernet: mtk_eth_soc: add support for initializing the PPE")
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
v2:
  - Use readl_poll_timeout as suggested by Andrew Lunn
v3:
  - Remove unused #include's

 drivers/net/ethernet/mediatek/mtk_ppe.c | 20 +++++++++-----------
 drivers/net/ethernet/mediatek/mtk_ppe.h |  1 +
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
index 71e1ccea6e72..3ad10c793308 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -2,9 +2,8 @@
 /* Copyright (C) 2020 Felix Fietkau <nbd@nbd.name> */
 
 #include <linux/kernel.h>
-#include <linux/jiffies.h>
-#include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/etherdevice.h>
 #include <linux/platform_device.h>
 #include "mtk_ppe.h"
@@ -44,18 +43,17 @@ static u32 ppe_clear(struct mtk_ppe *ppe, u32 reg, u32 val)
 
 static int mtk_ppe_wait_busy(struct mtk_ppe *ppe)
 {
-	unsigned long timeout = jiffies + HZ;
-
-	while (time_is_before_jiffies(timeout)) {
-		if (!(ppe_r32(ppe, MTK_PPE_GLO_CFG) & MTK_PPE_GLO_CFG_BUSY))
-			return 0;
+	int ret;
+	u32 val;
 
-		usleep_range(10, 20);
-	}
+	ret = readl_poll_timeout(ppe->base + MTK_PPE_GLO_CFG, val,
+				 !(val & MTK_PPE_GLO_CFG_BUSY),
+				 20, MTK_PPE_WAIT_TIMEOUT_US);
 
-	dev_err(ppe->dev, "PPE table busy");
+	if (ret)
+		dev_err(ppe->dev, "PPE table busy");
 
-	return -ETIMEDOUT;
+	return ret;
 }
 
 static void mtk_ppe_cache_clear(struct mtk_ppe *ppe)
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.h b/drivers/net/ethernet/mediatek/mtk_ppe.h
index 51bd5e75bbbd..242fb8f2ae65 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.h
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.h
@@ -12,6 +12,7 @@
 #define MTK_PPE_ENTRIES_SHIFT		3
 #define MTK_PPE_ENTRIES			(1024 << MTK_PPE_ENTRIES_SHIFT)
 #define MTK_PPE_HASH_MASK		(MTK_PPE_ENTRIES - 1)
+#define MTK_PPE_WAIT_TIMEOUT_US		1000000
 
 #define MTK_FOE_IB1_UNBIND_TIMESTAMP	GENMASK(7, 0)
 #define MTK_FOE_IB1_UNBIND_PACKETS	GENMASK(23, 8)
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
