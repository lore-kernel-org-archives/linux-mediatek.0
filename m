Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DD8C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 12:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WUyG3KR/qpjRZDV0qwNHNgXxdY0Ch17XZ/wfnUvWiRQ=; b=oOD5OlpBAzvSiu/hbYdaj9C07R
	86J7IwDYEgK+yMveFMAIWfRXy3+rNkeWHXDeAcjc5qbHCRIRcKQ/o6LK/fUvZK/LuUA+KHaxsmC1K
	jCl2GZdv3cMcg5tZQmwA4/LmJ8eb0ApYVEZtkX4B7Y9Ss2pvvrJNh1o68pxrfqzyByG5o95F2+x9d
	iQ7mETVncMp1akPAx2SMpRCTDkKX3MSSn1w4UyiJpBVMehl8AvTh8MktZABAWU8CeFtDGy7qSXiIp
	ZGVms7u8m+EZvOSOSr3d7KmSVr15sKhrUXK9yEcf1/dO5mnosHzIV6JFKZVGRsbY4ImxwKmj5ix76
	+uo7pAFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBy0J-00ED2K-DT; Thu, 14 Jul 2022 12:31:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBxy1-00EBYF-KW; Thu, 14 Jul 2022 12:29:20 +0000
X-UUID: 94f29836592e41dc87d355bd77cdf141-20220714
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:d1704a4c-0f26-4ae4-af59-4b938b187ea7,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:423bfd32-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 94f29836592e41dc87d355bd77cdf141-20220714
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1225653768; Thu, 14 Jul 2022 05:29:11 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 14 Jul 2022 20:28:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 14 Jul 2022 20:28:39 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, "Will
 Deacon" <will@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Lee Jones
	<lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Tinghan
 Shen" <tinghan.shen@mediatek.com>, Chun-Jie Chen
	<chun-jie.chen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "MandyJH Liu"
	<mandyjh.liu@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
CC: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 02/19] dt-bindings: memory: mediatek: Update condition for mt8195 smi node
Date: Thu, 14 Jul 2022 20:28:20 +0800
Message-ID: <20220714122837.20094-3-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220714122837.20094-1-tinghan.shen@mediatek.com>
References: <20220714122837.20094-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_052917_695771_EDFC37D7 
X-CRM114-Status: GOOD (  10.83  )
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

The max clock items for the dts node with compatible
'mediatek,mt8195-smi-sub-common' should be 3.

However, the dtbs_check of such node will get following message,
arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: smi@14010000: clock-names: ['apb', 'smi', 'gals0'] is too long
         From schema: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml

It's because the 'mediatek,mt8195-smi-sub-common' compatible incorrectly
matches the 'else' conditions for gen2 HW without gals.

Rewrite the 'else' condition to specifically identify the compatibles
that utilizing gen2 HW without gals.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 .../memory-controllers/mediatek,smi-common.yaml       | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
index 71bc5cefb49c..4f5dd0a20109 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
@@ -144,7 +144,16 @@ allOf:
             - const: gals0
             - const: gals1
 
-    else:  # for gen2 HW that don't have gals
+  - if:  # for gen2 HW that don't have gals
+      properties:
+        compatible:
+          enum:
+            - mediatek,mt2712-smi-common
+            - mediatek,mt6795-smi-common
+            - mediatek,mt8167-smi-common
+            - mediatek,mt8173-smi-common
+
+    then:
       properties:
         clocks:
           minItems: 2
-- 
2.18.0


