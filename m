Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCAACDB485
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 04:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5RMBeAtAJ3QWTJFC7HXa4Omx7QtPIe8uwySAvSyeRk=; b=SNpjBSqFAc69ZSbWuhANakfyD4
	HRha41aK+hv2GI/HAO6BfLcw8Qc2cg/ilaVypoW5sJydHv3K/UlOUk6bbWJeJq7/Fo6mk/MWI2RSJ
	PTpkFbm70s1OZC5pcCHF8SIIjCVJ/QwVBr8GDO9m5L3yga5kflhGXiJRFPlYv8b6ZdF3XU0KmRGnB
	4651ilfijt1tzUWoN8tKDVqPdJ2ZoWrnOsZ6wpoQt8KKw0vw30RpDVqHM6ckdFN1dt7ucqyxVtUmI
	hXr+0WUwi7RC98E8/Wb+m3HP4QoD6BkWeoBael62xLrFiQibwxyVL+xuBMsMykG00ozOGf3jcvf+1
	ZVXtBSZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsyJa-00Dkl5-1X;
	Wed, 18 Oct 2023 04:37:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsyIp-00DjtP-1H;
	Wed, 18 Oct 2023 04:37:06 +0000
X-UUID: f7d8329e6d6f11ee86758d4a7c00f3a0-20231017
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=W5RMBeAtAJ3QWTJFC7HXa4Omx7QtPIe8uwySAvSyeRk=;
	b=lbpnYpD0H5mPwctA+n9f+nivUhzz+imO/vPfAS5lMQxE8sHWxhkAqXZUij2MraIsFoPxAx2Odvshk065I9HOvi8TTdYy4/5Z1tpXCNVF2hTBi44FLqFWGt0/emhVKL9uh/KqPIcxXqQpuKcljEQJCmO4YDFEA/CXySdRLJYbzHI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:fae87f30-0734-4414-8240-7744d31a6e1e,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:5f78ec9,CLOUDID:c854ecf0-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f7d8329e6d6f11ee86758d4a7c00f3a0-20231017
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 855965062; Tue, 17 Oct 2023 21:36:56 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 18 Oct 2023 12:36:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 18 Oct 2023 12:36:51 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v9 04/23] dt-bindings: display: mediatek: padding: Add MT8188
Date: Wed, 18 Oct 2023 12:36:31 +0800
Message-ID: <20231018043650.22532-5-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231018043650.22532-1-shawn.sung@mediatek.com>
References: <20231018043650.22532-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.513800-8.000000
X-TMASE-MatchedRID: 9rm+L2YNiKzyZ92BnYqk5lz+axQLnAVB6SXuwUgGH0hbKBBN5zqG8FaP
	6AhhdqyDBRj5e39v/eGsMR/ATxTHjWVnjx+sD6Kytw+xHnsmQjOMp+s3ceVcmb/Yg8aa0YTZdd3
	vE6bWkcHv3WZroeUzUI1xSG08E+c3VHcNS6pil71CnGIuUMP0VUEKKv3+tzX7UiwXYafXfD6kB0
	1zVAshlyIvUI0oiRYyZMzrwqima4jmyenDbONxLaEtILqFekmXLoYOuiLW+uXW4BShNeq/ewpCM
	S7M3CBmkHg+Xqfv+GzQvEuTNHaCJh0QUKM89Lf/o65WJt1k1O+H7D1bP/FcOglbhF7ZTanLYeGP
	4tValiDG3TRnfVX2PIAy6p60ZV62v2ThXg3lx4DdB/CxWTRRu4as+d5/8j56Yxdi4F8nEfi5OCV
	GY5JudjeHtrlqvPTaQnQ6/WjRw2GXmU/FzSSM1Q==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.513800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: BEA73C3609E4C71771ADCFBC57CC5502AE115990252F4F242B6702D18DAFF7992000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_213703_444802_792752C7 
X-CRM114-Status: GOOD (  16.56  )
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


