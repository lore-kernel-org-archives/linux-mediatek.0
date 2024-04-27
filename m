Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89268C4345F
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Apr 2024 01:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=csC8MkY3DsP6u4dCYvKlXOs1d6t+aJumI4zvk6wekyA=; b=PBDimm6//DIc/Y8u4qbuIjbrDm
	V0CU2BG4ym6qq9y2Sq+sbZBBJng28He7UgK9+MTNEzJBCPPU4RWbMHf0cTI7pWTRufEQvEvVzP31G
	KW9avMvFh/FYiYE/PlWkEJJNv5IoEJYt/tUOEcxYY43ClzbmYjX+ckyfTCdciUf5hDPHfRdVrL4rJ
	jnbxaSPTaDvICOiy6rrXAfI529NkBDD45hHYlLUYVTQXOqp0KUqxxVb9ARqFcP7hu+m+y/T1ujt0r
	aiXnweA8TnD1C4dTaTTwHCIV5FWE5B1+nKZlsCU59VUpVQoDtjEhkaqYbLxMv2eYixa3ps1Pi9TI4
	7dC0PMPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Wq7-0000000EZO4-068d;
	Sat, 27 Apr 2024 01:26:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Wq0-0000000EZK1-0oPX;
	Sat, 27 Apr 2024 01:26:50 +0000
X-UUID: 349e44dc043511efa8f1cd58ee6c2400-20240426
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=csC8MkY3DsP6u4dCYvKlXOs1d6t+aJumI4zvk6wekyA=;
	b=BvUJgiM0YAvCAUMP+7AuI8Y5WkhD5XK8Idh8Psz/Gz6fHznoHC6RvfZWtrnT/gGV5Q0xU49Az8n0E4+KewmRBKHtCTYTuPK/efN0ZK/AOfaJpPJ3gQh3JEfpO7t4tkPW3OSZYD6qQJ+xu/3/7KtSLD0sqJr24XT8nfUwYJTlQhQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:b778f0fe-1716-40dd-bbe7-0d7d88e45d28,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:82c5f88,CLOUDID:8f9d67fb-ed05-4274-9204-014369d201e8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 349e44dc043511efa8f1cd58ee6c2400-20240426
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1262217773; Fri, 26 Apr 2024 18:26:43 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 27 Apr 2024 09:26:38 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 27 Apr 2024 09:26:37 +0800
From: Zhi Mao <zhi.mao@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Zhi Mao <zhi.mao@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Heiko Stuebner
	<heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, Hans de Goede <hdegoede@redhat.com>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>, Alain Volmat
	<alain.volmat@foss.st.com>, Paul Elder <paul.elder@ideasonboard.com>, "Mehdi
 Djait" <mehdi.djait@bootlin.com>, Andy Shevchenko
	<andy.shevchenko@gmail.com>, Bingbu Cao <bingbu.cao@intel.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <shengnan.wang@mediatek.com>,
	<yaya.chang@mediatek.com>, <yunkec@chromium.org>, <10572168@qq.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] media: dt-bindings: i2c: add Giantec GT97xx VCM
Date: Sat, 27 Apr 2024 09:26:12 +0800
Message-ID: <20240427012613.6621-2-zhi.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240427012613.6621-1-zhi.mao@mediatek.com>
References: <20240427012613.6621-1-zhi.mao@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.057800-8.000000
X-TMASE-MatchedRID: OXh+vcntO3CuhCBFl/b63mNW0DAjL5p+TJDl9FKHbrm7qpOHKudqczQz
	47GqDWjpnD3AxwqeC/rkllaluas5jhhzK7qAlTSLKsQ0fogDWarCVnYZIUPsuFcBEC9mTU6S0Yx
	t4RVNuTU1V4pHjQhImxu3Nc6RZT0N0w6McbedQHDr/EBmiNuXt/+UEb65dgmQN52WkvVbWa6jxY
	yRBa/qJV/Hpl/zcOjl5MIx11wv+CPGVuWouVipcjd8OspumIi18++FztvfNby2FqEABPH3IiNnw
	tiAkJqjj0SaSBggbdz/HV3qQCcKgAcfIsC9wKfF2FxrnvbkbGkAlb4J5IdAvm1Rjoup2VCcWve+
	eVz4Pp5Vk5utmQ1VlGVF3+d9rnoxpI8EFEZVbig=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.057800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 68AA6855CA5B7F2F1B46D94FAF96CD7B97702B69AFCB4F58415C8BEDA11ABF312000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_182648_291852_87A9F057 
X-CRM114-Status: GOOD (  13.28  )
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

Add YAML device tree binding for GT9768 & GT9769 VCM,
and the relevant MAINTAINERS entries.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
---
 .../bindings/media/i2c/giantec,gt9769.yaml    | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/giantec,gt9769.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/giantec,gt9769.yaml b/Documentation/devicetree/bindings/media/i2c/giantec,gt9769.yaml
new file mode 100644
index 000000000000..92d603acc53c
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/giantec,gt9769.yaml
@@ -0,0 +1,55 @@
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
+description:
+  The Giantec GT9768 & GT9769 is a 10-bit DAC with current sink capability.
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


