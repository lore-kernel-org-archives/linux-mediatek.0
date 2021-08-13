Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D87DC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 03:25:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB70D610A4
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 03:25:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB70D610A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nt1kyTMUmksdOod+PqVD+5tjejv8nZPtZo7lzD2ODSo=; b=sfMRrCJZS2HbLR
	qWiFHXowGr04jkaaRoUkv2vEU5vJ9QrpT9CNjPJUa7PmeS+NnjWPtHZo3oYQoBy0WgNwhkwNJltT8
	TQsZvYw4zaZQHqC3eHk/U2MxOnsoMCH7uidT+rbcYGkSRQzME1wf/8g+Ivvn6IPcuOIbSlWR5IgK8
	WFn5QDwEXcj1ApeMFHwtOsOi984Yn/VpJNBbRfEOB/VNio7QaVPTgZVM6lcL1sL+1t/dgdbLZux2b
	2qJFILypkhIdvQJx5V7tF5IDwvTkJNOJ4whVR9ezqQc5tqVIG6RtiIz6k4nO1SKR5OW9HRA2s8DXx
	tiZDhsTxfFtafKkcYHPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mENoq-00Bcq5-07; Fri, 13 Aug 2021 03:25:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mENoF-00Bcgl-NB; Fri, 13 Aug 2021 03:24:43 +0000
X-UUID: 5d54b92a67284ceeb69b866c4631c077-20210812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=mdKbCrJHzX7PQET/h4H3Cnf7k47hyAvxLIMKCm96udQ=; 
 b=kaO3ex7HTx2KOHhwl+njIk9K5d7/utVBw1kpOqGev+D6L2SrfL+wgp6WRvbAzi0FlplxXUEkz18/WOhTclatLXiSgUKEOtcOL/rpxIP7e09iwJPHrJXSVsbZyHEJZ28XzLaiLZj0KYkoqzUtRgjR+xuN/Dp7Nq5ZzDLjNo+Biw4=;
X-UUID: 5d54b92a67284ceeb69b866c4631c077-20210812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1578890146; Thu, 12 Aug 2021 20:24:34 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 20:24:32 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 13 Aug 2021 11:24:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 13 Aug 2021 11:24:31 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Wendell Lin <wendell.lin@mediatek.com>, Hanks Chen
 <hanks.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>, Miles Chen
 <miles.chen@mediatek.com>, Lee Jones <lee.jones@linaro.org>
Subject: [RESEND PATCH 4/4] clk: mediatek: use tristate for
 COMMON_CLK_MEDAITEK and COMMON_CLK_MT6779
Date: Fri, 13 Aug 2021 11:24:29 +0800
Message-ID: <20210813032429.14715-5-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210813032429.14715-1-miles.chen@mediatek.com>
References: <20210813032429.14715-1-miles.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_202439_786533_7F8E1AB7 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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
