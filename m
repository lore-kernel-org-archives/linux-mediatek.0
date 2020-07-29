Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5288C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 06:41:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F10820786
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 06:41:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0RK4VSBQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ujOkxuaa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F10820786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yS8xr6BOItotPEYt4WqvVs8v0XEukiFb+g8HNlJVu94=; b=0RK4VSBQS1Gv8V3y+ZOJqo7xs
	KK7/zbex99HoIiqs/e7UKViU8iFjnkEFbUsfvHAonZM2ufbGYF1drYolBcyb/2gB/4ze7zurLnCFD
	PalMTuGDfmjAHuYuMZgWxXK63CoH97THJOBno0onzrXAUx5VZW/sC4k5ItjHN7AE6ETUWbgi+nkyC
	hTPPLDTcAWcM9X8JiLjhOFX5ykigk+6DI2jxO9jBWeI/bCbmO5icducZPTl6W/dZxwtFGAV2sUinq
	4K9IcIlzYERECkb3tG4Lj4dm2qqK1mHIHeaZXthZGVQj8sCMm3G6THe/mzOic8HPNJSK0gvDYMdW+
	tXCDliyvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0fmT-0003V2-MW; Wed, 29 Jul 2020 06:41:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0fmK-0003S1-GH; Wed, 29 Jul 2020 06:41:31 +0000
X-UUID: 752bbab902904872991f8a3bc2d0119b-20200728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=BdJ2r7/FoQTlh/kyQIChiopClhLjq/Zo9T1MCUvBGSY=; 
 b=ujOkxuaaFzS5pxa5T+ahY3/pNAxY5y5qTy8w0N2AZfsgIo+Dmftp3b5zXPrb4dCzuYlrN/HejxVlEz3E4GQaY/XXwGDTrN6Rxqb1JkA/wlL/GbK+QY0TCZZP611nBDg1+DwiRmv/0h5W+96erCDHFZaqGEPndL+fN0utH1mhZko=;
X-UUID: 752bbab902904872991f8a3bc2d0119b-20200728
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 890166875; Tue, 28 Jul 2020 22:41:24 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Jul 2020 23:31:23 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 14:31:21 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Jul 2020 14:31:22 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <linux@roeck-us.net>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [v3,
 3/3] watchdog: mtk_wdt: merge all the reset numbers in one head file
Date: Wed, 29 Jul 2020 14:30:49 +0800
Message-ID: <1596004249-28655-4-git-send-email-crystal.guo@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1596004249-28655-1-git-send-email-crystal.guo@mediatek.com>
References: <1596004249-28655-1-git-send-email-crystal.guo@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_024128_700441_40393E80 
X-CRM114-Status: GOOD (  13.72  )
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
Cc: linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, erin.lo@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Crystal Guo <crystal.guo@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mt8xxx-resets.h actually just used to define TOPRGU_SW_RST_NUM.
Instead of resubmit a new mt8xxx-reset.h for a new IC, merge all
the reset numbers in one head file.

Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
---
 drivers/watchdog/mtk_wdt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index d6a6393..5000a49 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -9,8 +9,7 @@
  * Based on sunxi_wdt.c
  */
 
-#include <dt-bindings/reset-controller/mt2712-resets.h>
-#include <dt-bindings/reset-controller/mt8183-resets.h>
+#include <dt-bindings/reset-controller/mtk-resets.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/init.h>
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
