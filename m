Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37355CD128A
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 10:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IbvyZleKeBzCkSQwcR5/JyUse6gQVlPZjhR9xVr78M0=; b=wh4CFsSWY2/2KdOLe3GncnE2W0
	nPaIAv/cJNhS7G8axaBOpLaJWkAAcC21gPugbt86yqlyVXJqA2l1YoAt3ZD+rL/vdqTcRAEAGO9z+
	uCo2Vj5KD7U3MHho9JT2Z25haGjja0ces0KrdgiNtRLoxodB289xxT6CvqcWUyaMFtCkYOQyupuZT
	rxZAemrhoBugnt60WHCMzNwprtXvGjRnCy0booq9qkkce7HSKiaUr72sdF23YDhVubADBhGzfgE8J
	ElbJTGjhswjsaqbXP+ds1LOCv3xcUA+x5GjN6GuAFoiTtT2nrkszMkDfEgvwGnRod+qoorWvInGDL
	K7t4jybg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruVOJ-00000006SA7-2YLI;
	Wed, 10 Apr 2024 10:41:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruVO8-00000006Rzz-00dc;
	Wed, 10 Apr 2024 10:41:14 +0000
X-UUID: d215bd9cf72611eeac1957ae9f99f617-20240410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=IbvyZleKeBzCkSQwcR5/JyUse6gQVlPZjhR9xVr78M0=;
	b=S+C085kn1yqfCj88x8QZUlirtUkES7TSYul1woxoBAYbx5v3OB9X2ru6sP8ZkKHJ0DPS/rvaHOqwH85SNlpaPoM/GEQF/nrAMkJfVh9RlcUo/QjZvgD2Hd0E/3tzjWYDcghA8DAliDny+UkA1KpH3lzcTtRQiyVrH+Qt1cwfbZE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:33f38e17-e85d-44dd-ac87-15b4e406c5c2,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6f543d0,CLOUDID:e0d2bffa-ed05-4274-9204-014369d201e8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d215bd9cf72611eeac1957ae9f99f617-20240410
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2003010229; Wed, 10 Apr 2024 03:41:00 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 Apr 2024 18:40:25 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 Apr 2024 18:40:23 +0800
From: Zhi Mao <zhi.mao@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Zhi Mao <zhi.mao@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Heiko Stuebner
	<heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, Hans de Goede <hdegoede@redhat.com>, Tomi
 Valkeinen <tomi.valkeinen@ideasonboard.com>, Alain Volmat
	<alain.volmat@foss.st.com>, Paul Elder <paul.elder@ideasonboard.com>, Mehdi
 Djait <mehdi.djait@bootlin.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
	Bingbu Cao <bingbu.cao@intel.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<shengnan.wang@mediatek.com>, <yaya.chang@mediatek.com>,
	<yunkec@chromium.org>, <10572168@qq.com>
Subject: [PATCH 1/2] media: dt-bindings: i2c: add Giantec GT97xx VCM driver
Date: Wed, 10 Apr 2024 18:40:01 +0800
Message-ID: <20240410104002.1197-2-zhi.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240410104002.1197-1-zhi.mao@mediatek.com>
References: <20240410104002.1197-1-zhi.mao@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_034108_188508_70559288 
X-CRM114-Status: GOOD (  13.95  )
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

Add YAML device tree binding for GT97xx VCM driver,
and the relevant MAINTAINERS entries.

Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
---
 .../bindings/media/i2c/giantec,gt97xx.yaml    | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/giantec,gt97xx.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/giantec,gt97xx.yaml b/Documentation/devicetree/bindings/media/i2c/giantec,gt97xx.yaml
new file mode 100644
index 000000000000..8c9f1eb4dac8
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/giantec,gt97xx.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2020 MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/giantec,gt97xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Giantec Semiconductor, Crop. GT97xx Voice Coil Motor (VCM)
+
+maintainers:
+  - Zhi Mao <zhi.mao@mediatek.com>
+
+description: |-
+  The Giantec GT97xx is a 10-bit DAC with current sink capability.
+  The DAC is controlled via I2C bus that operates at clock rates up to 1MHz.
+  This chip integrates Advanced Actuator Control (AAC) technology
+  and is intended for driving voice coil lens in camera modules.
+
+properties:
+  compatible:
+    enum:
+      - giantec,gt9768 # for GT9768 VCM
+      - giantec,gt9769 # for GT9769 VCM
+
+  reg:
+    maxItems: 1
+
+  vin-supply: true
+
+  vdd-supply: true
+
+  giantec,aac-mode:
+    description:
+      Indication of AAC mode select.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 1    #  AAC2 mode(operation time# 0.48 x Tvib)
+      - 2    #  AAC3 mode(operation time# 0.70 x Tvib)
+      - 3    #  AAC4 mode(operation time# 0.75 x Tvib)
+      - 5    #  AAC8 mode(operation time# 1.13 x Tvib)
+    default: 2
+
+  giantec,aac-timing:
+    description:
+      Number of AAC Timing count that controlled by one 6-bit period of
+      vibration register AACT[5:0], the unit of which is 100 us.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0x20
+    minimum: 0x00
+    maximum: 0x3f
+
+  giantec,clock-presc:
+    description:
+      Indication of VCM internal clock dividing rate select, as one multiple
+      factor to calculate VCM ring periodic time Tvib.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0    #  Dividing Rate -  2
+      - 1    #  Dividing Rate -  1
+      - 2    #  Dividing Rate -  1/2
+      - 3    #  Dividing Rate -  1/4
+      - 4    #  Dividing Rate -  8
+      - 5    #  Dividing Rate -  4
+    default: 1
+
+required:
+  - compatible
+  - reg
+  - vin-supply
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        vcm@c {
+            compatible = "giantec,gt9768";
+            reg = <0x0c>;
+
+            vin-supply = <&gt97xx_vin>;
+            vdd-supply = <&gt97xx_vdd>;
+            giantec,aac-timing = <0x20>;
+        };
+    };
+
+...
-- 
2.25.1


