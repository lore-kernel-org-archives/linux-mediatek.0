Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D0A0C43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 00:12:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE588610FB
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 00:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE588610FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+wJTfFLeemOgocHh7iwVntKB/VDhmc5HgNELwpTk2Vo=; b=T7DRP2XKiW04tVnIt9PlUEIoS
	q93LHR/eK8sVTaZN5eDoNgtdCLDMXw2HNn3V8jNySer3zLPOi5wTM3Fz39rNAeQAWPhFCzarajf9B
	vBx9NWld9QkzFn/66FIkBHdxxQV2sMp53f0Q2RF7ysVL11zx0htHqRI2ovXob8tvh05c5mih3GCNu
	72VSG2xaoBLN/iT8BC3vFno2d4R1z8Gro6r0erkTHc6V5wMb9lK4f5oqO8n+3MA1AKvCw57teWtTM
	O8vrNUMRQo3Si9Ea2GoL7zVevLdHudcKO58khjeBLktj3dnH8CFZM93kcJHDG2LsMzAlnYWAQunHQ
	/idv5Iz3w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXC5z-000Bmh-8H; Fri, 16 Apr 2021 00:12:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXC5n-000Bln-93; Fri, 16 Apr 2021 00:12:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=XS9jf7c2Kn/z8NibUqzFqwM3JlkffV+BoajyGhE4uFo=; b=oJZLQJ16FZefYMtNj3ihYIrcBx
 Ga4K65R/X5vVsmzJPK57Ri9hv/D7GBtwBGvlh02mHhomZJ4SP7mVlv/va7rAC7Ya34GUdOx6WuR/p
 tJR+FxWvS6hMQcTpn9xl98IsZcL8KiqhZwC0rPRNXv3xAXdm/BEhzsEXV50s1PNaSWbImvLw3Elcc
 o1FeYouZnbu7+D1/VDiSY09MAMD+Y34/fWgXQ0Xrh4xVWXwre/YmJI3M+kW4bjSJggzUVRRBzrWQ5
 g3NcewKfiY3rNcuaQMBJlzFvRc7weNNIYfth3MJd8aIEn4VYIHqfaZpWSLk0oXmBRlfRr8VIGQmEk
 TPqOWyIA==;
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXC5k-008ziw-E5; Fri, 16 Apr 2021 00:12:13 +0000
Received: by mail-pj1-x102e.google.com with SMTP id cu16so10979344pjb.4;
 Thu, 15 Apr 2021 17:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XS9jf7c2Kn/z8NibUqzFqwM3JlkffV+BoajyGhE4uFo=;
 b=mo1BkFPwqS6c6CkwjkDF6esSCOHgCMlmbcTjcV9SxD1/CnFRa/6ug4NA0e/hEPwMdp
 0sbTfZYhpk+BhRcYsVQBvzvNRnu13U0vqEyOeRQmlKW1HiDsttuvOKUeAoGk5lUbv0Y7
 yANgaw/Ir7dh/mlDX/DiONSXnlSofjD6W5Kh/qVzRKY/1W338p4whzwJQJsb1z0UC+lH
 CHGTKC7xEyIdw5TR46dcW6w8xtYOpgjGYkD8y6mjH1LGarYIYCLcvmmeJG4qbEfTmwCg
 d7RvXPVJd4Ye7HUpQ+gkqqmizhlfa/ZR2KuAYWbmDQXWPCoRFYHX22ID0LsfLuvI6e+n
 P1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XS9jf7c2Kn/z8NibUqzFqwM3JlkffV+BoajyGhE4uFo=;
 b=ZI/zPLpQZ+TKh9V8FEwBXZCpENqPeeR8D9GWurCtJNxogijHv1lOErOW54MxmteYkD
 FowjGu7RuJZ2ndwIDUSuulDKVFL3gRuKaUPcJOJdKXvPfNoFIzq1kOTJrJhx1mx/D1XG
 Ggk1fik5EGb5957YlUYl/QDMlnX0jK6wsqxLPpMMPof+MhPpb+DhfOhn1MxUY91rIr0f
 zpxg39v9i3XegZnQvVJmGqCTibKSTTZ+FQeWTCc+otZOwI/jM6ttLzxIb8EDJsp1f0e5
 w2el984MFx9w/IyrCaAAJ+kUTZtHK6DM2iv8qyDQbSPX4thX5K1hfDVLGGm/M5r4VGJ9
 aSNQ==
X-Gm-Message-State: AOAM5308eOqzdQt1aWPOftCzkVFwBoITyIXb34fnpBIqoJEp9EhuFsEG
 tgG2sOVLivdiSNg5wOlQq0k=
X-Google-Smtp-Source: ABdhPJw86uCZIyZhfUfXRNdYT3BvkAgjE0TmQM8Ra+Ml2xGDSSsiy3C5xqlsxYPFzzSIgbQl2QEvaQ==
X-Received: by 2002:a17:903:4101:b029:ea:fc8a:9adb with SMTP id
 r1-20020a1709034101b02900eafc8a9adbmr6686043pld.49.1618531931378; 
 Thu, 15 Apr 2021 17:12:11 -0700 (PDT)
Received: from ilya-fury.hpicorp.net ([2602:61:7344:f100::b87])
 by smtp.gmail.com with ESMTPSA id q63sm3563100pjq.17.2021.04.15.17.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 17:12:10 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next,v2] net: ethernet: mediatek: ppe: fix busy wait loop
Date: Thu, 15 Apr 2021 17:11:48 -0700
Message-Id: <20210416001148.333969-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <YHjH3DxteZrID2hW@lunn.ch>
References: <YHjH3DxteZrID2hW@lunn.ch>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_171212_493448_159B1E43 
X-CRM114-Status: GOOD (  14.64  )
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
---
 drivers/net/ethernet/mediatek/mtk_ppe.c | 18 +++++++++---------
 drivers/net/ethernet/mediatek/mtk_ppe.h |  1 +
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
index 71e1ccea6e72..f4b3fc0eeb50 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -5,6 +5,7 @@
 #include <linux/jiffies.h>
 #include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/etherdevice.h>
 #include <linux/platform_device.h>
 #include "mtk_ppe.h"
@@ -44,18 +45,17 @@ static u32 ppe_clear(struct mtk_ppe *ppe, u32 reg, u32 val)
 
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
