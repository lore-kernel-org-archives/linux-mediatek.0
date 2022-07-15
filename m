Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD358C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 11:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lc8S/e+Q+B4269zfQkE3g4f0B1keix3sY8kLQtfSJ8o=; b=0PqSPanUfLcfNX1OFd70PrJL5b
	mcyTz3y4vWuzvTtFU4kgmBlI7+5MKshZ2AlvBgw9rlgLj3XJOKierP19PCTFzyIcMhBNqb/Zmm+TV
	uMeeHeX5Q+zmrzqCIP8iUxe8k6qEl4FlN9cR6TTC41q7GdEw8v95+GsgAYuR8JlNDkc7LPJTWsz1q
	UWJqnbyP7Q7oSjVkUXeuIAiM5GeUp7aFrxCyjG2EK2kiDIbm00pftchLHnSqUDSI4vj9BctvVu4P9
	yySznrcpCSNG7it2IPGcs0tQIEEIjX1Gv4XpIIPsc6k7+hG2yjPEkW3bWxG67O8MDfd374Hggd68T
	lBetjMpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCJv3-006lrD-EF; Fri, 15 Jul 2022 11:55:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCJuy-006loQ-H2; Fri, 15 Jul 2022 11:55:40 +0000
X-UUID: 0e78b6f78db842209fa35c054f5116e5-20220715
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:db4f9db2-e2aa-48f1-91ce-5381e983ae1d,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:94701733-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 0e78b6f78db842209fa35c054f5116e5-20220715
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 693471042; Fri, 15 Jul 2022 04:55:30 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 15 Jul 2022 19:54:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 15 Jul 2022 19:54:50 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@canonical.com>, Mark Brown <broonie@kernel.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	"Chen-Yu Tsai" <wenst@chromium.org>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>
Subject: [PATCH] spi: dt-bindings: mediatek,spi-mtk-nor: Update bindings for nor flash
Date: Fri, 15 Jul 2022 19:54:43 +0800
Message-ID: <20220715115443.4154-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_045536_618178_F52A080B 
X-CRM114-Status: UNSURE (   9.64  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The spi-mtk-nor controller of mt8173, mt8186 and mt8192 have their
DT data. They don't use mt8173 as fallback.

Using the fallback of mt8186 to enables the controllers to support
mt8188.

Not all of spi-mtk-nor controller need interrupt property, so we
don't mark interrupt as required.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 .../bindings/spi/mediatek,spi-mtk-nor.yaml        | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
index 41e60fe4b09f..970b1119898b 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
@@ -23,6 +23,10 @@ allOf:
 properties:
   compatible:
     oneOf:
+      - enum:
+          - mediatek,mt8173-nor
+          - mediatek,mt8186-nor
+          - mediatek,mt8192-nor
       - items:
           - enum:
               - mediatek,mt2701-nor
@@ -30,13 +34,13 @@ properties:
               - mediatek,mt7622-nor
               - mediatek,mt7623-nor
               - mediatek,mt7629-nor
-              - mediatek,mt8186-nor
-              - mediatek,mt8192-nor
               - mediatek,mt8195-nor
-          - enum:
-              - mediatek,mt8173-nor
-      - items:
           - const: mediatek,mt8173-nor
+      - items:
+          - enum:
+              - mediatek,mt8188-nor
+          - const: mediatek,mt8186-nor
+
   reg:
     maxItems: 1
 
@@ -64,7 +68,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
   - clocks
   - clock-names
 
-- 
2.18.0


