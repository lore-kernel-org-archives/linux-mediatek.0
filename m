Return-Path: <SRS0=lxIO=2Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E2E6C2D0CE
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2020 06:53:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D626217F4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2020 06:53:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H+mcgyud";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dyVDyXkz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D626217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HXflpMlpGsjvm86ahaznL/eL1njg8LQWrtFgXA3M2V0=; b=H+mcgyudMUGIMV
	6bk91FcKJjCd2i/p4XRtSlMZIsc0QGLrOSjuKmAi71NLA2ZNGm+JHSCTtK4qTPyJQ1t/yRcSYNsuY
	QTtbo+X0PjoAC/jPCHfNdvLoVS1znpoGp+d6FUEyO3pD9ei5yFcRJjSPOvF2ffYMzNRggEKI9qKOv
	3HvKa6JcYTe4ZPGGNXHBGoxZ4KZLXDlSAg+wi2Fhchbgb9nyWYuM4Sj7Y3e7kxRlN64yfEvji2HK2
	VfphvUmclabmRLeDOUw6V37goOvNtW6DVbUsBGzaiGi1aeB3hYf+0xmqpWiZ9lbSBATjjvVtqCp0t
	j7mlkVe948G0DcV1KH/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inGpn-0001F8-WA; Fri, 03 Jan 2020 06:53:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inGp3-0000TV-Qm; Fri, 03 Jan 2020 06:52:39 +0000
X-UUID: 63b1e6dc2eb84938a3184d7a4f6d16e6-20200102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Uj1PHnlMjHZZtgpd4ky9cMYDx21GFrXK0KB5WSI+oCE=; 
 b=dyVDyXkzguDuOvCxzYMkUs1cIY789nwpD4HkRsHseoDwjc6CFW3lEoq8dOHJofJG0u5J0ax41YKtqTmHUZfmmp0hOQ7eEa3GwoZ9o9FSD0OHwK61ihCaLhYEwvZMqMHP+ZrG4osqDwAeDYkvAX/9G6//GFvOZ0m1qCZrVoXLC/I=;
X-UUID: 63b1e6dc2eb84938a3184d7a4f6d16e6-20200102
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 89289239; Thu, 02 Jan 2020 22:52:32 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 2 Jan 2020 22:44:16 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 3 Jan 2020 14:43:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 3 Jan 2020 14:44:09 +0800
From: Michael Kao <michael.kao@mediatek.com>
To: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <hsinyi@chromium.org>, <linux-pm@vger.kernel.org>,
 <srv_heupstream@mediatek.com>
Subject: [PATCH v3,8/8] thermal: mediatek: use spinlock to protect PTPCORESEL
Date: Fri, 3 Jan 2020 14:44:07 +0800
Message-ID: <20200103064407.19861-9-michael.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200103064407.19861-1-michael.kao@mediatek.com>
References: <20200103064407.19861-1-michael.kao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200102_225237_875581_ED3F817D 
X-CRM114-Status: GOOD (  11.67  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "michael.kao" <michael.kao@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "michael.kao" <michael.kao@mediatek.com>

The driver of thermal and svs will use the
same register for the project which should select
bank before reading sensor value.

Signed-off-by: Michael Kao <michael.kao@mediatek.com>
---
 drivers/thermal/mtk_thermal.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index 9be9fcb18d9e..639d34ed223b 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -22,6 +22,7 @@
 #include <linux/thermal.h>
 #include <linux/reset.h>
 #include <linux/types.h>
+#include <linux/power/mtk_svs.h>
 
 /* AUXADC Registers */
 #define AUXADC_CON1_SET_V	0x008
@@ -262,7 +263,7 @@ struct mtk_thermal {
 	struct clk *clk_peri_therm;
 	struct clk *clk_auxadc;
 	/* lock: for getting and putting banks */
-	struct mutex lock;
+	unsigned long flags;
 
 	/* Calibration values */
 	s32 adc_ge;
@@ -561,7 +562,7 @@ static void mtk_thermal_get_bank(struct mtk_thermal_bank *bank)
 	u32 val;
 
 	if (mt->conf->need_switch_bank) {
-		mutex_lock(&mt->lock);
+		mt->flags = claim_mtk_svs_lock();
 
 		val = readl(mt->thermal_base + PTPCORESEL);
 		val &= ~0xf;
@@ -581,7 +582,7 @@ static void mtk_thermal_put_bank(struct mtk_thermal_bank *bank)
 	struct mtk_thermal *mt = bank->mt;
 
 	if (mt->conf->need_switch_bank)
-		mutex_unlock(&mt->lock);
+		release_mtk_svs_lock(mt->flags);
 }
 
 /**
@@ -936,8 +937,6 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	mutex_init(&mt->lock);
-
 	mt->dev = &pdev->dev;
 
 	auxadc = of_parse_phandle(np, "mediatek,auxadc", 0);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
