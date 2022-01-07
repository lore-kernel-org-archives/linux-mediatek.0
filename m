Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80930C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jan 2022 11:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l+AmJZITgeWPhLyuD5mAFG3tB2zeR4ihk1cnHd0mbYQ=; b=EFPzcjh0Ew70kj
	U7lNlKcgMCtUhFe8x87JRuCHcao+ralFXL7M4pC3KSUcar95qWCwmWyvevmGWhx0SYQ/KM7n9x9Da
	MdFUyc7w1/D8LgIaODsW5t+nU/RfFWq2EPcoLOE/679S7WahYq1XFb52bh04p9wzSdRQMKOjGRDRO
	kwzREZIpYQZEzbtE3kggLq0EUJ2oi4tFNUADritHKpl9pem0wrcjJCEwOAFxZBNkZu/KGJB1op+HT
	c0hf6D7KhgySOZAWSGMC3q0VELkGleLPlMat/bDPEse8LNgzuKd1+Z/HfSOofAJ5vbSwHoIdLo1/w
	kVm5TytkrGvjhF5SUpqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5nqa-003igB-MW; Fri, 07 Jan 2022 11:55:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5npk-003iFi-Uy; Fri, 07 Jan 2022 11:55:02 +0000
X-UUID: f23d8591a2d04c23ae615f9c5e54b009-20220107
X-UUID: f23d8591a2d04c23ae615f9c5e54b009-20220107
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 720159074; Fri, 07 Jan 2022 04:54:55 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 Jan 2022 03:54:53 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 7 Jan 2022 19:54:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 7 Jan 2022 19:54:39 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bartosz Golaszewski
 <bgolaszewski@baylibre.com>, Sean Wang <sean.wang@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <ryder.lee@kernel.org>,
 <wenst@chromium.org>, <chunfeng.yun@mediatek.com>, Tinghan Shen
 <tinghan.shen@mediatek.com>
Subject: [PATCH v8 3/4] dt-bindings: pinctrl: mt8195: Add mediatek,
 drive-strength-adv property
Date: Fri, 7 Jan 2022 19:53:44 +0800
Message-ID: <20220107115345.9075-4-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20220107115345.9075-1-tinghan.shen@mediatek.com>
References: <20220107115345.9075-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_035501_040497_5A9169D7 
X-CRM114-Status: GOOD (  11.65  )
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

Extend pin driving support for I2C pins on SoC mt8195.
This property is also documented in mediatek,mt8183-pinctrl.yaml.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 .../bindings/pinctrl/pinctrl-mt8195.yaml      | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
index 567f71cab7b4..5e27e01d6588 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
@@ -98,6 +98,32 @@ patternProperties:
           drive-strength:
             enum: [2, 4, 6, 8, 10, 12, 14, 16]
 
+          mediatek,drive-strength-adv:
+            description: |
+              Describe the specific driving setup property.
+              For I2C pins, the existing generic driving setup can only support
+              2/4/6/8/10/12/14/16mA driving. But in specific driving setup, they
+              can support 0.125/0.25/0.5/1mA adjustment. If we enable specific
+              driving setup, the existing generic setup will be disabled.
+              The specific driving setup is controlled by E1E0EN.
+              When E1=0/E0=0, the strength is 0.125mA.
+              When E1=0/E0=1, the strength is 0.25mA.
+              When E1=1/E0=0, the strength is 0.5mA.
+              When E1=1/E0=1, the strength is 1mA.
+              EN is used to enable or disable the specific driving setup.
+              Valid arguments are described as below:
+              0: (E1, E0, EN) = (0, 0, 0)
+              1: (E1, E0, EN) = (0, 0, 1)
+              2: (E1, E0, EN) = (0, 1, 0)
+              3: (E1, E0, EN) = (0, 1, 1)
+              4: (E1, E0, EN) = (1, 0, 0)
+              5: (E1, E0, EN) = (1, 0, 1)
+              6: (E1, E0, EN) = (1, 1, 0)
+              7: (E1, E0, EN) = (1, 1, 1)
+              So the valid arguments are from 0 to 7.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 3, 4, 5, 6, 7]
+
           bias-pull-down:
             description: |
               For pull down type is normal, it don't need add RSEL & R1R0 define
@@ -265,4 +291,13 @@ examples:
           bias-pull-down;
         };
       };
+
+      i2c0-pins {
+        pins {
+          pinmux = <PINMUX_GPIO8__FUNC_SDA0>,
+                   <PINMUX_GPIO9__FUNC_SCL0>;
+          bias-disable;
+          mediatek,drive-strength-adv = <7>;
+        };
+      };
     };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
