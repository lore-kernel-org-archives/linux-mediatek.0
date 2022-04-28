Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC551C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 13:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a3UBOA0QhDl8ceupCph6NiP3JZYeXjKFkAfddgFnBZc=; b=qVsWl9W79NK6Ws
	OyQYwOgx0j9wy1V9iVduL27maawoD6+WT3/Fve3T+oVC16hpI3B7vBxNK0cz1/kdaQAr+dqoSJuAv
	vSDwNEr0Di0Te8Fbv7DqHRsZcwW08EYFq8G0Ez6IXD9UytOkkg4JltoWs2QNnASSdmGsJo2Tc4TxE
	pxBF1AzmCCVjeg9Pj7lmpZoBl7jV4w5I6i2LXOT8pAVIN8qx9XBqWmNbSxYwPFQ8lMVwo9Qd5Irhp
	KCmE08a6qk3PE8psSdEinaCarX8i0th/zXx/WXIcsUm4b9bqkSqPeLtZhd+hB9X0ZViYYu0ihsvPB
	aS69bEaf+z5dg/fakoaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk4Fr-0074dg-Oy; Thu, 28 Apr 2022 13:32:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk49H-0071RP-Pw; Thu, 28 Apr 2022 13:25:37 +0000
X-UUID: 581a10dc8d7a41baab624735d223fd6c-20220428
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:2315e0c5-6f6b-40b3-9718-c9345e0ac7e2, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:c817d6c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 581a10dc8d7a41baab624735d223fd6c-20220428
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 893400185; Thu, 28 Apr 2022 06:25:25 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 06:25:24 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 21:25:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 28 Apr 2022 21:25:23 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@canonical.com>
CC: Lala Lin <lala.lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v3 2/3] dt-bindings: nvmem: mediatek: document deprecated
 efuse property
Date: Thu, 28 Apr 2022 21:25:19 +0800
Message-ID: <20220428132520.2033-3-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220428132520.2033-1-allen-kh.cheng@mediatek.com>
References: <20220428132520.2033-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_062535_894630_C44F913B 
X-CRM114-Status: UNSURE (   9.92  )
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

We mark mediatek,mt8173-efuse and mediatek,efuse as deprecated to
prevent them from being the single compatible in the future.

The mediatek,efuse compatible should be used as generic fallback for
all MediaTek chipsets.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 .../devicetree/bindings/nvmem/mtk,efuse.yaml      | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/mtk,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mtk,efuse.yaml
index bb3c6c4b9fe5..f12a283d5421 100644
--- a/Documentation/devicetree/bindings/nvmem/mtk,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mtk,efuse.yaml
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
