Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC94C04FF6
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Apr 2024 01:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CO4wjtqJ7941YvsG3EoEYP8MkcYX0u3FXi2wAP8WwL8=; b=RFCe0edu6Fx6ywWQSeAufAwK58
	Hyz57YgxJ1+XA3G6gwk2ez/k03qc+R4UI/bGYQDCqQPKLohGiVFE/pDVDF9ZBiaw2huJ9hgKlSKWB
	1wxbrRRG2GLr1XacavgclTheaw0OzckKRrFU+l9t5PRQKlTaG9um4xIX2iuLnPz6G78MY/zdD1UoZ
	GXqCA8kUOvpQ8Ne4ajbWvJDItorWL+YvrE+IZ1yqJd/pIAEAki8/d3/ljC9xM91JEJKCfMBRq38x4
	ENJNGspai2qj8WDurC4ERk3W10MoiXbzYhE6EJocr1uhbIqVsq691oU9BRH7qsFeyVfqYlYNyT1z5
	cnSsOB6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxzO2-00000007UWv-3nPp;
	Sat, 20 Apr 2024 01:19:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxzNy-00000007UV3-3cSk;
	Sat, 20 Apr 2024 01:19:24 +0000
X-UUID: 04097b92feb411eeac1957ae9f99f617-20240419
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=CO4wjtqJ7941YvsG3EoEYP8MkcYX0u3FXi2wAP8WwL8=;
	b=PKkxjzoegg3t/jTwhy91q8W1NAUHbIDj9Wf/WL9Rq87VqAhQE53sVNa/EtsSbI8aRqPLJNDvQKD5ZnnybZIrQ75+xupSFn1OCTtNQFSbBRqujjDrrZW+FhI+nZ6lZbLWRS4rG5zUMLDzK7Lj1xNdwSdCmOVeC+j1kXgqkmivA3c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:2f1307d2-4c6c-4c13-8753-e547b7c9aeef,IP:0,U
	RL:25,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-5
X-CID-META: VersionHash:82c5f88,CLOUDID:74f2cb91-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 04097b92feb411eeac1957ae9f99f617-20240419
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1792101644; Fri, 19 Apr 2024 18:19:21 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 20 Apr 2024 09:19:18 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 20 Apr 2024 09:19:16 +0800
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
Subject: [PATCH v1 1/2] media: dt-bindings: i2c: add Giantec GT97xx VCM
Date: Sat, 20 Apr 2024 09:18:39 +0800
Message-ID: <20240420011840.23148-2-zhi.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240420011840.23148-1-zhi.mao@mediatek.com>
References: <20240420011840.23148-1-zhi.mao@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_181922_938130_DA75C688 
X-CRM114-Status: GOOD (  13.68  )
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

Add YAML device tree binding for GT9768 & GT8769 VCM,
and the relevant MAINTAINERS entries.

Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
---
 .../bindings/media/i2c/giantec,gt9769.yaml    | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/giantec,gt9769.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/giantec,gt9769.yaml b/Documentation/devicetree/bindings/media/i2c/giantec,gt9769.yaml
new file mode 100644
index 000000000000..6a9f49539b35
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/giantec,gt9769.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2020 MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/giantec,gt9769.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Giantec Semiconductor, Crop. GT9768 & GT9769 Voice Coil Motor (VCM)
+
+maintainers:
+  - Zhi Mao <zhi.mao@mediatek.com>
+
+description: |-
+  The Giantec GT9768 & GT9768 is a 10-bit DAC with current sink capability.
+  The DAC is controlled via I2C bus that operates at clock rates up to 1MHz.
+  This chip integrates Advanced Actuator Control (AAC) technology
+  and is intended for driving voice coil lens in camera modules.
+
+properties:
+  compatible:
+    enum:
+      - giantec,gt9768
+      - giantec,gt9769
+
+  reg:
+    maxItems: 1
+
+  vin-supply: true
+
+  vdd-supply: true
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
+        camera-lens@c {
+            compatible = "giantec,gt9769";
+            reg = <0x0c>;
+
+            vin-supply = <&gt97xx_vin>;
+            vdd-supply = <&gt97xx_vdd>;
+        };
+    };
+
+...
-- 
2.25.1


