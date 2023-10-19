Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEEBCDB465
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 05:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5RMBeAtAJ3QWTJFC7HXa4Omx7QtPIe8uwySAvSyeRk=; b=gcDQe+o9h0lciJ4zW3acJoGOoB
	UAO9EjLrUefWPjQzVeHg4Z0W0wGegY6nbulSOmvPc0RamZCcMubWvHoZIxAuuB6Ji92i0zj4K7Qbg
	6IntjMcNGqZPp//XNLaJkoaA0pzMrTKIME3Er17V139ADzrtN8iHqEXFcI57U9RlumbjcjJjXx5iz
	YZjcUY/4N6/a5Mo8P1vRuNUG6GsnR+LfecAAHR7B6C6bEYpF4PZYqeA4Y2gFAMMVSJ/wtZS8Kqe1+
	wogvwP8z/xbZ+Ybr98NwsUtk43j1Om6g1aRFyhyRjVgrsVhJmTGqLBgnu1T2LpC/MeWOm6KVw3gCV
	93C7okpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtM2Y-00GQek-0M;
	Thu, 19 Oct 2023 05:57:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtM2I-00GQQO-0Q;
	Thu, 19 Oct 2023 05:57:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=W5RMBeAtAJ3QWTJFC7HXa4Omx7QtPIe8uwySAvSyeRk=; b=QXEF024w71wOU7/Q7DFO1za2kk
	j9shJo4VEL4VIV3bcKCLt5cLCdGqA1bC0FwjOXDL/6kxwJGnqw1qW1V1ipADZ76raKC7lLfUiElCD
	o5Q6oUGWQgIlEWSouF3EkK+U1eSHFW2QGSwQk/RNIdkMOYqGPFo+FkpISyTJeZsI2leBdN9h8Fd/w
	ajKKaAy4HIb/4LzjdElpYjYar9DERZXyxcYwW0P5RuHiWG6zQRhF90irnEBbICZFshyzSAR/d55GB
	Co0V5VqmOZXbnDLUGSmUQEhBY219EurI8FUiT47tDBWDSdnK7ULvhSDJrysfJvtrBMzGf3J3XkuHv
	K19f8wQw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtM22-009cwx-07;
	Thu, 19 Oct 2023 05:57:32 +0000
X-UUID: 50bb56f06e4411ee86758d4a7c00f3a0-20231018
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=W5RMBeAtAJ3QWTJFC7HXa4Omx7QtPIe8uwySAvSyeRk=;
	b=k4VdEb32mn9AkSwSLYbH7PzB22g/WiMDwT/BxAQDMtXgz8M4qVr9RkzLAxDkgeT9CIDhkgxSrhnKyCfGDQRECO8Kb0XND1R916QmkbKIFXJ3Fo9vro1RS1XssXh/4VDGXK+gM+aAju7plIqEvmwDMiJEj7Pkdhtv2vo4tO+3NjE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:4185d028-89a9-4485-9fba-36f8cc7d9013,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:5f78ec9,CLOUDID:4ea64dc4-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 50bb56f06e4411ee86758d4a7c00f3a0-20231018
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 307185029; Wed, 18 Oct 2023 22:56:58 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 19 Oct 2023 13:56:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 19 Oct 2023 13:56:20 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK
 Hu <ck.hu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v10 04/24] dt-bindings: display: mediatek: padding: Add MT8188
Date: Thu, 19 Oct 2023 13:55:59 +0800
Message-ID: <20231019055619.19358-5-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231019055619.19358-1-shawn.sung@mediatek.com>
References: <20231019055619.19358-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_065725_071798_01A98FEC 
X-CRM114-Status: GOOD (  16.90  )
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>, Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Padding is a new hardware module on MediaTek MT8188,
add dt-bindings for it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 .../display/mediatek/mediatek,padding.yaml    | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
new file mode 100644
index 000000000000..db24801ebc48
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,padding.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Display Padding
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+description:
+  Padding provides ability to add pixels to width and height of a layer with
+  specified colors. Due to hardware design, Mixer in VDOSYS1 requires
+  width of a layer to be 2-pixel-align, or 4-pixel-align when ETHDR is enabled,
+  we need Padding to deal with odd width.
+  Please notice that even if the Padding is in bypass mode, settings in
+  register must be cleared to 0, or undefined behaviors could happen.
+
+properties:
+  compatible:
+    const: mediatek,mt8188-padding
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: RDMA Clock
+
+  mediatek,gce-client-reg:
+    description:
+      GCE (Global Command Engine) is a multi-core micro processor that helps
+      its clients to execute commands without interrupting CPU. This property
+      describes GCE client's information that is composed by 4 fields.
+      1. Phandle of the GCE (there may be several GCE processors)
+      2. Sub-system ID defined in the dt-binding like a user ID
+         (Please refer to include/dt-bindings/gce/<chip>-gce.h)
+      3. Offset from base address of the subsys you are at
+      4. Size of the register the client needs
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      items:
+        - description: Phandle of the GCE
+        - description: Subsys ID defined in the dt-binding
+        - description: Offset from base address of the subsys
+        - description: Size of register
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - clocks
+  - mediatek,gce-client-reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mediatek,mt8188-clk.h>
+    #include <dt-bindings/power/mediatek,mt8188-power.h>
+    #include <dt-bindings/gce/mt8195-gce.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        padding0: padding@1c11d000 {
+            compatible = "mediatek,mt8188-padding";
+            reg = <0 0x1c11d000 0 0x1000>;
+            clocks = <&vdosys1 CLK_VDO1_PADDING0>;
+            power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+            mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX 0xd000 0x1000>;
+        };
+    };
-- 
2.18.0


