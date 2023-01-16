Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEDDC46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 11:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4G8Y0ViVJzXb6BsOeFBPQvk3DHX0QfUnX0ejt3ACyfU=; b=zrd6gboWhlduBVN2s8dQueFdha
	UORaVtZ7/R1o/KZSqkamPvrPWcP/ek/ZzNCYWAonvqyinS95S+NX0ltj5NyYiA2S6dhOmaMI4VM5C
	qXi6kiQ3tOgva2w/m/D8oxRVnOHTTE33y35KEN3MmbsCbgtL7dxlQRsBBcJV0KRs8Gb9mhsczSbme
	9yPHwzr838d0SXX/fCsJzOQeiklasarQqpbKtwWxb97MBZYWgLX6FQQSwndRunhQvOSF3Ux9EbZfr
	67tquyXrb7WBZAMbF7cCjpT5fluw2KFCA5GG7l16Iw+pTl2bztpQDemXWa7GdXa9zPP+hP9e7DG5x
	UKvdSfTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHNGp-009q4W-4b; Mon, 16 Jan 2023 11:03:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHNGm-009q45-Qr; Mon, 16 Jan 2023 11:03:18 +0000
X-UUID: 5e157d8e958d11edbbe3f76fe852e059-20230116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=4G8Y0ViVJzXb6BsOeFBPQvk3DHX0QfUnX0ejt3ACyfU=;
	b=kzEtSVn8Hu+INqkYtPtHDQ84mcUFru8ZQY4cxOv92Vqa6UWd0+OxRSpEFlYeHAbw0ZIeNiU8seI8zAokpPIEBbz1lSpH7zX6ct3IrOUZ7I+x9PqFEoFC4Y59a7FuUsYtUcSpFC0DpujVOqpVS5qRmYBo0xNX5FnFCmlIcgmC+pM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:806ca2f6-219a-4c98-be02-1d76a1785e4f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:51cb638c-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 5e157d8e958d11edbbe3f76fe852e059-20230116
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 698931496; Mon, 16 Jan 2023 04:03:11 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 16 Jan 2023 18:53:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 16 Jan 2023 18:53:08 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	<linux-watchdog@vger.kernel.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v2 2/2] watchdog: mtk_wdt: Add reset_by_toprgu support
Date: Mon, 16 Jan 2023 18:53:05 +0800
Message-ID: <20230116105305.31818-3-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230116105305.31818-1-allen-kh.cheng@mediatek.com>
References: <20230116105305.31818-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_030316_895598_89DC625A 
X-CRM114-Status: GOOD (  12.74  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In some cases, the MediaTek watchdog requires the toprgu to reset
timer after system resets.

Provide a reset_by_toprgu parameter for configuration.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 drivers/watchdog/mtk_wdt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 3e6212591e69..a9c437598e7e 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -50,6 +50,7 @@
 #define WDT_MODE_IRQ_EN		(1 << 3)
 #define WDT_MODE_AUTO_START	(1 << 4)
 #define WDT_MODE_DUAL_EN	(1 << 6)
+#define WDT_MODE_CNT_SEL	(1 << 8)
 #define WDT_MODE_KEY		0x22000000
 
 #define WDT_SWRST		0x14
@@ -70,6 +71,7 @@ struct mtk_wdt_dev {
 	spinlock_t lock; /* protects WDT_SWSYSRST reg */
 	struct reset_controller_dev rcdev;
 	bool disable_wdt_extrst;
+	bool reset_by_toprgu;
 };
 
 struct mtk_wdt_data {
@@ -279,6 +281,8 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
 		reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
 	if (mtk_wdt->disable_wdt_extrst)
 		reg &= ~WDT_MODE_EXRST_EN;
+	if (mtk_wdt->reset_by_toprgu)
+		reg |= WDT_MODE_CNT_SEL;
 	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
 	iowrite32(reg, wdt_base + WDT_MODE);
 
@@ -408,6 +412,9 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	mtk_wdt->disable_wdt_extrst =
 		of_property_read_bool(dev->of_node, "mediatek,disable-extrst");
 
+	mtk_wdt->reset_by_toprgu =
+		of_property_read_bool(dev->of_node, "mediatek,reset-by-toprgu");
+
 	return 0;
 }
 
-- 
2.18.0


