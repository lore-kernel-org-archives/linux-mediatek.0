Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7B7C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 13:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cPru7LgESrzi+rlA5C3ualTdyJQ3XczK/+rbf36vM20=; b=ce0uO2tApzklHV
	Omf6sunDcxeQgjIXKB1xwOa6TwUalyNyKeRCMWx+mFPbfikY0BrksSsFQ/aWoaRvvsQkhl5uPTirK
	vs+TCjFdSfg+kjiMqNlUN7ZigFsbj2/vQBJWb5dQXfOM4kI6qHmZgOnJAd0pmThFB5AGjeLMpexNd
	0GunFG1iTaCD27dd/JzonxIKTuKlLRf6Thd7fZ0UEVfH0hCt3l/BuwzJP614h+d7nvIPaRAUBG9TO
	4T71RuLjWOrIARG4c/6DzajTA3mnXZ9zTZmXXjll2szL4+g0+w4gT7KmjZzfJOLFjOj7jz0Qm/Bsf
	go99Jymb+yAvkDWkWaIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noPxK-002FYZ-Lo; Tue, 10 May 2022 13:31:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noPxG-002FTQ-3b; Tue, 10 May 2022 13:31:13 +0000
X-UUID: a871b1f55d674d15b4d02f8ddfdc5b42-20220510
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:fd27f212-55ce-4ef4-a67f-a476d706bf25, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:e386ea16-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: a871b1f55d674d15b4d02f8ddfdc5b42-20220510
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1304073615; Tue, 10 May 2022 06:31:04 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 May 2022 06:26:42 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 May 2022 21:26:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 10 May 2022 21:26:40 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@canonical.com>
CC: Lala Lin <lala.lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Allen-kh Cheng
 <allen-kh.cheng@mediatek.corp-partner.google.com>, Allen-KH Cheng
 <allen-kh.cheng@mediatek.com>
Subject: [PATCH v4 2/3] dt-bindings: nvmem: mediatek: document deprecated
 efuse property
Date: Tue, 10 May 2022 21:26:36 +0800
Message-ID: <20220510132637.5864-3-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220510132637.5864-1-allen-kh.cheng@mediatek.com>
References: <20220510132637.5864-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_063110_216742_20780697 
X-CRM114-Status: GOOD (  10.42  )
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

From: Allen-kh Cheng <allen-kh.cheng@mediatek.corp-partner.google.com>

We mark mediatek,mt8173-efuse and mediatek,efuse as deprecated to
prevent them from being the single compatible in the future.

The mediatek,efuse compatible should be used as generic fallback for
all MediaTek chipsets.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 .../devicetree/bindings/nvmem/mediatek,efuse.yaml | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
index 529f5888d93f..04ecf5980b2e 100644
--- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -16,16 +16,18 @@ allOf:
 properties:
   compatible:
     oneOf:
-      - enum:
-          - mediatek,mt8173-efuse
-          - mediatek,efuse
+      - const: mediatek,mt8173-efuse # Don't use this in new dts files
+        deprecated: true
+      - const: mediatek,efuse
+        deprecated: true
         description:
-          Only mt8173 SoC-specific compatible with generic fallback should be
-          used
+          Please use mediatek,efuse as generic fallback to enable the MediaTek
+          eFuse support.
       - items:
           - enum:
               - mediatek,mt7622-efuse
               - mediatek,mt7623-efuse
+              - mediatek,mt8173-efuse
               - mediatek,mt8183-efuse
               - mediatek,mt8192-efuse
               - mediatek,mt8195-efuse
@@ -44,7 +46,8 @@ unevaluatedProperties: false
 examples:
   - |
     efuse: efuse@10206000 {
-            compatible = "mediatek,mt8173-efuse";
+            compatible = "mediatek,mt8173-efuse",
+                         "mediatek,efuse";
             reg = <0x10206000 0x1000>;
             #address-cells = <1>;
             #size-cells = <1>;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
