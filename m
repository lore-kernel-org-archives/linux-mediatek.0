Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE724C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 11:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nSY8gO9qNvha5RynMpl7sH2kyQpk/ZRPSukUCX9vkOU=; b=v2oyKYUy03XfQqZ9vIlOf66yCZ
	K16Me82LlD3WPxwSDnEudEp2fJlka0BX0QU6Is4C2SZSthKVnS1Ttt2Nj/2lULCmw8ilqpSEzDoEe
	eKr+bdMqkbScJIu6kMgurbOfBb6QccEXuAIaH5Hb4fwr5HYapK0SjnjPx5SeE2FWxshClquCYQfz7
	fYIxsJu4uoCdwnTRLhQtHQaBTCZu44FPIRR5tSdKluY2aDkzfD33pLGzFKzkjEdJ8EroCHhhuajwG
	Caujfc1hyJphqQuLsfBczoG8GHAQKbAGsS4D3ujkKrIiX0mnUzEH1VIgUxpeo59CY6QxnU1zUTgWH
	wiP9uz7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFvwN-008fLG-ID; Mon, 25 Jul 2022 11:07:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFvwB-008fAI-34; Mon, 25 Jul 2022 11:07:48 +0000
X-UUID: 23bb352823d14bbe8a2e7c438635a9f7-20220725
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:5bfe7871-d35a-4e13-9b79-a0945e62fff6,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:359b6eb3-06d2-48ef-b2dd-540836705165,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 23bb352823d14bbe8a2e7c438635a9f7-20220725
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2094475658; Mon, 25 Jul 2022 04:07:41 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 25 Jul 2022 19:07:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 25 Jul 2022 19:07:06 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
CC: <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v2 2/2] dt-bindings: pinctrl: mt8186: Add and use drive-strength-microamp
Date: Mon, 25 Jul 2022 19:07:02 +0800
Message-ID: <20220725110702.11362-3-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220725110702.11362-1-allen-kh.cheng@mediatek.com>
References: <20220725110702.11362-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_040747_154661_55A53F94 
X-CRM114-Status: GOOD (  12.66  )
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

Commit e5fabbe43f3f ("pinctrl: mediatek: paris: Support generic
PIN_CONFIG_DRIVE_STRENGTH_UA") added support for using
drive-strength-microamp instead of mediatek,drive-strength-adv.

Similarly to the mt8192 and mt8195, there's no user of property
'mediatek,drive-strength-adv', hence removing it is safe.

Fixes: 338e953f1bd1 ("dt-bindings: pinctrl: mt8186: add pinctrl file and binding document")
Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/pinctrl/pinctrl-mt8186.yaml      | 29 ++-----------------
 1 file changed, 3 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml
index 6784885edc5c..1eeb885ce0c6 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml
@@ -107,31 +107,8 @@ patternProperties:
           drive-strength:
             enum: [2, 4, 6, 8, 10, 12, 14, 16]
 
-          mediatek,drive-strength-adv:
-            description: |
-              Describe the specific driving setup property.
-              For I2C pins, the existing generic driving setup can only support
-              2/4/6/8/10/12/14/16mA driving. But in specific driving setup, they
-              can support 0.125/0.25/0.5/1mA adjustment. If we enable specific
-              driving setup, the existing generic setup will be disabled.
-              The specific driving setup is controlled by E1E0EN.
-              When E1=0/E0=0, the strength is 0.125mA.
-              When E1=0/E0=1, the strength is 0.25mA.
-              When E1=1/E0=0, the strength is 0.5mA.
-              When E1=1/E0=1, the strength is 1mA.
-              EN is used to enable or disable the specific driving setup.
-              Valid arguments are described as below:
-              0: (E1, E0, EN) = (0, 0, 0)
-              1: (E1, E0, EN) = (0, 0, 1)
-              2: (E1, E0, EN) = (0, 1, 0)
-              3: (E1, E0, EN) = (0, 1, 1)
-              4: (E1, E0, EN) = (1, 0, 0)
-              5: (E1, E0, EN) = (1, 0, 1)
-              6: (E1, E0, EN) = (1, 1, 0)
-              7: (E1, E0, EN) = (1, 1, 1)
-              So the valid arguments are from 0 to 7.
-            $ref: /schemas/types.yaml#/definitions/uint32
-            enum: [0, 1, 2, 3, 4, 5, 6, 7]
+          drive-strength-microamp:
+            enum: [125, 250, 500, 1000]
 
           bias-pull-down:
             oneOf:
@@ -293,7 +270,7 @@ examples:
           pinmux = <PINMUX_GPIO127__FUNC_SCL0>,
                    <PINMUX_GPIO128__FUNC_SDA0>;
           bias-pull-up = <MTK_PULL_SET_RSEL_001>;
-          mediatek,drive-strength-adv = <7>;
+          drive-strength-microamp = <1000>;
         };
       };
     };
-- 
2.18.0


