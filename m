Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BF5C46467
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jan 2023 01:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KIYgMczl2d+gSz+cbdTqjNO5HXOYoOO5PWiSiasILCQ=; b=FPVB3mkEyCDOxiM7jPr6Jc89Wo
	p4Qj7f97Ec+KGlMS5P8wymZkgj/zc0i2qr6uT5nPUEDsKFM0mcfQxeAhV2GA7lGbeoAo9+CE/zvyf
	O8JV3Y2m9rFKaYsG4bUDVn6Z191r6qyhvyU76iRFCJvFxi13e2GztR5N6UEfGcbLXHoqBQbsyIrgh
	GkZJ6Jclaiq6cZZd/HvbB9tnrl9Cfsc810NTnh1FYXumBT0wgEUvPo2DzbjP2nM6ZZ/85GtVYzIEQ
	H+AEk4T9vZVXxETsZNMg/S9cLpO3DwDqadl+4Aut79+PY/xqiCNwC51ecIRQiwkmXeSDKidSMRdih
	Qjf1qXEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHayW-00CWSD-Pf; Tue, 17 Jan 2023 01:41:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHayT-00CWQf-Ih; Tue, 17 Jan 2023 01:41:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KIYgMczl2d+gSz+cbdTqjNO5HXOYoOO5PWiSiasILCQ=; b=iwRwlIuyX7A+/6zTv0z0VunVnb
	HiFyDpJeDcttW2bzOsawpgyqzJovOowrmf2WrZnH02FhtzAfSF9IYS1rhj9v1xEeGwDS1RcbjftBg
	VYtQ3hSG8cH6Da6sVV5HLin8KdzlNuTuqUuVJcpQ59BLN6SGSQj+E5V/Wj1a9SVj7UAKHVW0igiSf
	TqbJfI8k30zmh7eUpBsG4DQPAonc7tyYHRF7SOpSa8648L7xG0A+rT0R9+O0sepKrZ8Bd+cjlY9tD
	/E7bkJGDKNw4ulx23UfF5OaB6lCylQUpQfe0/o95WTwCar3dZBiAcqJ0ltPDYFyb8dchD+bLSkXzI
	PVvKqCKg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pHay7-005mtK-1k;
	Tue, 17 Jan 2023 01:41:06 +0000
X-UUID: f5b07ad4960711eda08d4d6090ec5a5c-20230116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=KIYgMczl2d+gSz+cbdTqjNO5HXOYoOO5PWiSiasILCQ=;
	b=sOiXUME4H62SMbbAj7eRHhgSuX9R3qs6TjJrvHdY2PlH5JGnU3yw4XQKbNl0vbAc0v87CttgAwQtX2G3Xj3jQz1nezyJj7CbkkGhkiTiIwA442NSLrAFjQo+Cd1+MQX1+1vFcW2WJfDqtzalh2xRZG36MPnuhtOhPjOM6zM0hTQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:63e969e1-1704-46f5-a74b-511eb4f27664,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.18,REQID:63e969e1-1704-46f5-a74b-511eb4f27664,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:3ca2d6b,CLOUDID:654b6f8c-8530-4eff-9f77-222cf6e2895b,B
	ulkID:230117094045A3OSJRC7,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0
X-CID-BVR: 0
X-UUID: f5b07ad4960711eda08d4d6090ec5a5c-20230116
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1284268761; Mon, 16 Jan 2023 18:40:44 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 17 Jan 2023 09:40:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 17 Jan 2023 09:40:26 +0800
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
Subject: [PATCH v3 2/2] watchdog: mtk_wdt: Add reset_by_toprgu support
Date: Tue, 17 Jan 2023 09:40:23 +0800
Message-ID: <20230117014023.2993-3-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230117014023.2993-1-allen-kh.cheng@mediatek.com>
References: <20230117014023.2993-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_014102_166302_40903047 
X-CRM114-Status: GOOD (  13.49  )
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

In some cases, the MediaTek watchdog requires the TOPRGU to reset
timer after system resets.

Provide a reset_by_toprgu parameter for configuration.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
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


