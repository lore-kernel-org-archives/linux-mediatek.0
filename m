Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E363EC4320A
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 16:42:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAFC861090
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 16:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AAFC861090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nt1kyTMUmksdOod+PqVD+5tjejv8nZPtZo7lzD2ODSo=; b=vD+4/xlQEOvWm4
	AzodfJ4yNOMSCDv5Pj2tnITsfSFM/hVH6uik/3nqjAfJYMHl9R88YHVIRXfBACRdPPApwt6R0pw4W
	iU3ubb6qffeaIKR8LrZKQXg/9xFTrXAM01RN/jQJbYzbNdGMRusdPKnXfacuegcMNxVic3kZ5RbJa
	pfrvhy2CRKis1pd7QcMd4bm/8oZ08MY0z7XxcHB7DWyTmAF/xV+5Qz76y8NulPZ15ZtAb6K25PZm4
	fXc06HxMf8s+92tP9rcPm2amsiOu5N8KihwOnIBs44kd1/cIAAEIxZnho0NZd4ixKVYBvRyCHJzUE
	AlvOZflZ3RzpRXQTOpDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mL6qT-002jBJ-GL; Tue, 31 Aug 2021 16:42:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mL6q1-002j46-FZ; Tue, 31 Aug 2021 16:42:22 +0000
X-UUID: f89279f1cdb249ebb15d622c03e3c552-20210831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=mdKbCrJHzX7PQET/h4H3Cnf7k47hyAvxLIMKCm96udQ=; 
 b=eqP1u6qOesMt2+Tov6VoBkUH9Bx6/LkRdjHbICNGG+5+rpilvO2ynINnYKKv1cuyDw8X33smo9TfaRbHGxnIBRfsttOHTtYzp8gVoLrU7lr06Q9hH55Qcq3JSSjQdcGiy/7kDPaONPdEKLPHNOATMcivlB1QG+9RqSadq8w0umc=;
X-UUID: f89279f1cdb249ebb15d622c03e3c552-20210831
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 200246622; Tue, 31 Aug 2021 09:42:14 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 09:42:14 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 00:42:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 1 Sep 2021 00:42:12 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Wendell Lin <wendell.lin@mediatek.com>, Hanks Chen
 <hanks.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>, Miles Chen
 <miles.chen@mediatek.com>, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 4/4] clk: mediatek: use tristate for COMMON_CLK_MEDAITEK
 and COMMON_CLK_MT6779
Date: Wed, 1 Sep 2021 00:42:10 +0800
Message-ID: <20210831164210.15455-5-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210831164210.15455-1-miles.chen@mediatek.com>
References: <20210831164210.15455-1-miles.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_094218_977714_2D39E2C6 
X-CRM114-Status: GOOD (  10.43  )
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

Now we have all necessary exported symbols, change
COMMON_CLK_MEDAITEK and COMMON_CLK_MT6779* to tristate.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Hanks Chen <hanks.chen@mediatek.com>
Cc: Wendell Lin <wendell.lin@mediatek.com>
Cc: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/Kconfig | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 886e2d9fced5..62ed2054a849 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -6,7 +6,7 @@ menu "Clock driver for MediaTek SoC"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 
 config COMMON_CLK_MEDIATEK
-	bool
+	tristate
 	select RESET_CONTROLLER
 	help
 	  MediaTek SoCs' clock support.
@@ -204,7 +204,7 @@ config COMMON_CLK_MT6765_MIPI2BSYS
          This driver supports MediaTek MT6765 mipi2bsys clocks.
 
 config COMMON_CLK_MT6779
-	bool "Clock driver for MediaTek MT6779"
+	tristate "Clock driver for MediaTek MT6779"
 	depends on (ARCH_MEDIATEK && ARM64) || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
 	default ARCH_MEDIATEK && ARM64
@@ -212,49 +212,49 @@ config COMMON_CLK_MT6779
 	  This driver supports MediaTek MT6779 basic clocks.
 
 config COMMON_CLK_MT6779_MMSYS
-	bool "Clock driver for MediaTek MT6779 mmsys"
+	tristate "Clock driver for MediaTek MT6779 mmsys"
 	depends on COMMON_CLK_MT6779
 	help
 	  This driver supports MediaTek MT6779 mmsys clocks.
 
 config COMMON_CLK_MT6779_IMGSYS
-	bool "Clock driver for MediaTek MT6779 imgsys"
+	tristate "Clock driver for MediaTek MT6779 imgsys"
 	depends on COMMON_CLK_MT6779
 	help
 	  This driver supports MediaTek MT6779 imgsys clocks.
 
 config COMMON_CLK_MT6779_IPESYS
-	bool "Clock driver for MediaTek MT6779 ipesys"
+	tristate "Clock driver for MediaTek MT6779 ipesys"
 	depends on COMMON_CLK_MT6779
 	help
 	  This driver supports MediaTek MT6779 ipesys clocks.
 
 config COMMON_CLK_MT6779_CAMSYS
-	bool "Clock driver for MediaTek MT6779 camsys"
+	tristate "Clock driver for MediaTek MT6779 camsys"
 	depends on COMMON_CLK_MT6779
 	help
 	  This driver supports MediaTek MT6779 camsys clocks.
 
 config COMMON_CLK_MT6779_VDECSYS
-	bool "Clock driver for MediaTek MT6779 vdecsys"
+	tristate "Clock driver for MediaTek MT6779 vdecsys"
 	depends on COMMON_CLK_MT6779
 	help
 	  This driver supports MediaTek MT6779 vdecsys clocks.
 
 config COMMON_CLK_MT6779_VENCSYS
-	bool "Clock driver for MediaTek MT6779 vencsys"
+	tristate "Clock driver for MediaTek MT6779 vencsys"
 	depends on COMMON_CLK_MT6779
 	help
 	  This driver supports MediaTek MT6779 vencsys clocks.
 
 config COMMON_CLK_MT6779_MFGCFG
-	bool "Clock driver for MediaTek MT6779 mfgcfg"
+	tristate "Clock driver for MediaTek MT6779 mfgcfg"
 	depends on COMMON_CLK_MT6779
 	help
 	  This driver supports MediaTek MT6779 mfgcfg clocks.
 
 config COMMON_CLK_MT6779_AUDSYS
-	bool "Clock driver for Mediatek MT6779 audsys"
+	tristate "Clock driver for Mediatek MT6779 audsys"
 	depends on COMMON_CLK_MT6779
 	help
 	  This driver supports Mediatek MT6779 audsys clocks.
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
