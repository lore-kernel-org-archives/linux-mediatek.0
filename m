Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE55AC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 08:17:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 820B261076
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 08:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 820B261076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=96TeIa1Uu98+VAXXQxIzSiBMzqZKLL1sYFM4/vdcYaA=; b=dAq0ZzkI0mOdQS
	zmLpt9d9WMlkJlLStFE1u2GKawYsq1AlFur5eFmrgmhFbxDV0LYvezsP8/sbOPt60N8VuG+GERp1P
	6ZxQSlyjyS0f/DHQs8x9PzQWTjVg4jwiwvDVboM79WKv31EqZADAmYuWLY3ap1EQg/9vueHlxRxBw
	ddlg0vrCU/6xNguG2XJrxqU9DpjnKYJ3u1jrIKpx0GQpCqphFI4WMm0J7ikyUe5bH3gN/aUz1qr7V
	MQBUCDMC6GubR575R02L07+I4sgvPfIbY94pgxI/nsKV0Ef4Zb4Js1jlfKCpR1umT8fkiUJfx17K3
	p0aC4Nk2c0M47kNwdJTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTgOP-00DTYS-PO; Fri, 24 Sep 2021 08:17:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTgNz-00DTRz-OD; Fri, 24 Sep 2021 08:16:49 +0000
X-UUID: 987b5b6c34984a2082b4c80bc4ace4f1-20210924
X-UUID: 987b5b6c34984a2082b4c80bc4ace4f1-20210924
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 91071344; Fri, 24 Sep 2021 01:16:43 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Sep 2021 01:06:47 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Sep 2021 16:06:46 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Sep 2021 16:06:45 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <mark.rutland@arm.com>, 
 <matthias.bgg@gmail.com>, <sean.wang@kernel.org>
CC: <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <hui.liu@mediatek.com>, <light.hsieh@mediatek.com>,
 <biao.huang@mediatek.com>, <hongzhou.yang@mediatek.com>,
 <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-gpio@vger.kernel.org>
Subject: [PATCH v14 2/5] dt-bindings: pinctrl: mt8195: change pull up/down
 description
Date: Fri, 24 Sep 2021 16:06:29 +0800
Message-ID: <20210924080632.28410-3-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924080632.28410-1-zhiyong.tao@mediatek.com>
References: <20210924080632.28410-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_011647_825566_9885EC95 
X-CRM114-Status: GOOD (  11.31  )
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

For supporting SI units in "bias-pull-down" & "bias-pull-up",
change pull up/down description
and add "mediatek,rsel_resistance_in_si_unit" description.

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
 .../bindings/pinctrl/pinctrl-mt8195.yaml      | 86 ++++++++++++++++++-
 1 file changed, 84 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
index 2f12ec59eee5..5f642bef72af 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
@@ -49,6 +49,12 @@ properties:
     description: The interrupt outputs to sysirq.
     maxItems: 1
 
+  mediatek,rsel_resistance_in_si_unit:
+    type: boolean
+    description: |
+      Identifying i2c pins pull up/down type which is RSEL. It can support
+      RSEL define or si unit value(ohm) to set different resistance.
+
 #PIN CONFIGURATION NODES
 patternProperties:
   '-pins$':
@@ -85,9 +91,85 @@ patternProperties:
           2/4/6/8/10/12/14/16mA in mt8195.
         enum: [0, 1, 2, 3, 4, 5, 6, 7]
 
-      bias-pull-down: true
+      bias-pull-down:
+        description: |
+          For pull down type is normal, it don't need add RSEL & R1R0 define
+          and resistance value.
+          For pull down type is PUPD/R0/R1 type, it can add R1R0 define to
+          set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
+          "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" & "MTK_PUPD_SET_R1R0_11"
+          define in mt8195.
+          For pull down type is RSEL, it can add RSEL define & resistance value(ohm)
+          to set different resistance by identifying property "mediatek,rsel_resistance_in_si_unit".
+          It can support "MTK_PULL_SET_RSEL_000" & "MTK_PULL_SET_RSEL_001"
+          & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" & "MTK_PULL_SET_RSEL_100"
+          & "MTK_PULL_SET_RSEL_101" & "MTK_PULL_SET_RSEL_110" & "MTK_PULL_SET_RSEL_111"
+          define in mt8195. It can also support resistance value(ohm) "75000" & "5000" in mt8195.
+          oneOf:
+            - enum: [100, 101, 102, 103]
+            - description: mt8195 pull down PUPD/R0/R1 type define value.
+            - enum: [200, 201, 202, 203, 204, 205, 206, 207]
+            - description: mt8195 pull down RSEL type define value.
+            - enum: [75000, 5000]
+            - description: mt8195 pull down RSEL type si unit value(ohm).
+
+          An example of using RSEL define:
+          pincontroller {
+            i2c0_pin {
+              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
+              bias-pull-down = <MTK_PULL_SET_RSEL_001>;
+            };
+          };
+          An example of using si unit resistance value(ohm):
+          &pio {
+            mediatek,rsel_resistance_in_si_unit;
+          }
+          pincontroller {
+            i2c0_pin {
+              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
+              bias-pull-down = <75000>;
+            };
+          };
 
-      bias-pull-up: true
+      bias-pull-up:
+        description: |
+          For pull up type is normal, it don't need add RSEL & R1R0 define
+          and resistance value.
+          For pull up type is PUPD/R0/R1 type, it can add R1R0 define to
+          set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
+          "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" & "MTK_PUPD_SET_R1R0_11"
+          define in mt8195.
+          For pull up type is RSEL, it can add RSEL define & resistance value(ohm)
+          to set different resistance by identifying property "mediatek,rsel_resistance_in_si_unit".
+          It can support "MTK_PULL_SET_RSEL_000" & "MTK_PULL_SET_RSEL_001"
+          & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" & "MTK_PULL_SET_RSEL_100"
+          & "MTK_PULL_SET_RSEL_101" & "MTK_PULL_SET_RSEL_110" & "MTK_PULL_SET_RSEL_111"
+          define in mt8195. It can also support resistance value(ohm)
+          "1000" & "1500" & "2000" & "3000" & "4000" & "5000" & "10000" & "75000" in mt8195.
+          oneOf:
+            - enum: [100, 101, 102, 103]
+            - description: mt8195 pull up PUPD/R0/R1 type define value.
+            - enum: [200, 201, 202, 203, 204, 205, 206, 207]
+            - description: mt8195 pull up RSEL type define value.
+            - enum: [1000, 1500, 2000, 3000, 4000, 5000, 10000, 75000]
+            - description: mt8195 pull up RSEL type si unit value(ohm).
+          An example of using RSEL define:
+          pincontroller {
+            i2c0_pin {
+              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
+              bias-pull-up = <MTK_PULL_SET_RSEL_001>;
+            };
+          };
+          An example of using si unit resistance value(ohm):
+          &pio {
+            mediatek,rsel_resistance_in_si_unit;
+          }
+          pincontroller {
+            i2c0_pin {
+              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
+              bias-pull-up = <1000>;
+            };
+          };
 
       bias-disable: true
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
