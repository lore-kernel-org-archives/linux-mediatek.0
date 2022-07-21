Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060B3C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 02:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26P2Ahn7YOYqfpktYoyL6KD/45axJJt64iCnQYvNJhE=; b=wWBhVghfiQMUPVCagCIoP+eRXr
	v+T97YbC4d8wMHs92DXIbFbmu3e1muW5ZcnupHuPttu+LA6xUcEJkClE2tWkOCEsfbqtfnGLW5rzh
	QGoiIFMQ7cTOABW6BeZATt8hh7gFVmTMnrGQ+2CMhPWeppVuGHBLpN7jyetWDpUk9P5SapC9q40KH
	S905oHIo/VKjSDddAO7i11ny8cAR5iFW6p2OKFnvYwAr7ba3c5AZUiWpx7kHqRKyjHv4RQ7B/mzlR
	qslK0kZerrHrDqdsEcHB9np6yxC4syiUPlI1NqtKDt65JDo5qDiySIw/2WfgoExEg5K0tQ2V6c86t
	jrKgO+qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEMGR-00FK3b-VB; Thu, 21 Jul 2022 02:50:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEMGO-00FJww-8u; Thu, 21 Jul 2022 02:50:10 +0000
X-UUID: fcf8877383a447b4abfecb5f5b4b70a9-20220720
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:d30472b9-ebbe-4165-a708-5d8fee793be6,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:a8310cd8-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: fcf8877383a447b4abfecb5f5b4b70a9-20220720
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1436914434; Wed, 20 Jul 2022 19:50:01 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 21 Jul 2022 09:48:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 21 Jul 2022 09:48:55 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	<nfraprado@collabora.com>
CC: <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v4 1/4] dt-bindings: mediatek: watchdog: Fix compatible fallbacks and example
Date: Thu, 21 Jul 2022 09:48:42 +0800
Message-ID: <20220721014845.19044-2-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220721014845.19044-1-allen-kh.cheng@mediatek.com>
References: <20220721014845.19044-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_195008_359833_229FC26B 
X-CRM114-Status: GOOD (  10.29  )
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

The watchdog timer of mt8186. mt8195 and mt7986 have their DT data.
We should not use 'mediatek,mt6589-wdt' as fallback.

For mediatek,wdt example of mt8183, We remove mediatek,mt6589-wdt fallback.

Fixes:a45b408a020b("dt-bindings: watchdog: Add compatible for MediaTek MT8186")
Fixes:b326f2c85f3d("dt-bindings: watchdog: Add compatible for Mediatek MT8195")
Fixes:41e73feb1024("dt-bindings: watchdog: Add compatible for Mediatek MT7986")
Fixes:f43f97a0fc0e("dt-bindings: mediatek: mt8183: Add #reset-cells")
Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
index 762c62e428ef..67ef991ec4cf 100644
--- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
@@ -14,12 +14,12 @@ Required properties:
 	"mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
 	"mediatek,mt7623-wdt", "mediatek,mt6589-wdt": for MT7623
 	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
-	"mediatek,mt7986-wdt", "mediatek,mt6589-wdt": for MT7986
+	"mediatek,mt7986-wdt": for MT7986
 	"mediatek,mt8183-wdt": for MT8183
-	"mediatek,mt8186-wdt", "mediatek,mt6589-wdt": for MT8186
+	"mediatek,mt8186-wdt": for MT8186
 	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
 	"mediatek,mt8192-wdt": for MT8192
-	"mediatek,mt8195-wdt", "mediatek,mt6589-wdt": for MT8195
+	"mediatek,mt8195-wdt": for MT8195
 
 - reg : Specifies base physical address and size of the registers.
 
@@ -32,8 +32,7 @@ Optional properties:
 Example:
 
 watchdog: watchdog@10007000 {
-	compatible = "mediatek,mt8183-wdt",
-		     "mediatek,mt6589-wdt";
+	compatible = "mediatek,mt8183-wdt";
 	mediatek,disable-extrst;
 	reg = <0 0x10007000 0 0x100>;
 	interrupts = <GIC_SPI 139 IRQ_TYPE_NONE>;
-- 
2.18.0


