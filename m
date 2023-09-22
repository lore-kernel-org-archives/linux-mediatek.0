Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925E5E7D0D7
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Sep 2023 07:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WR9Wuupt4O0oO0a3UZu4E+vioQT1qXFx6TKSkBSF9B8=; b=OdP4MMfBo4ZrHzqobyZLuLsq9E
	5/ZFYrzvy4qXOALUuuNOB9vaUaFVgq+F4zZidOgNEfYFzbpp/imm9NaanXVnDMSrMZ63iL3mlZ7w2
	hjQpRJmWvWyQHQILkn8GlWMlmIrUE0GKronUvRf3FgeudK3oHog3cUgY+E0n7VXHfaaegKDgPGKdL
	tqAXrS2U+b4VogNXMH61tgWM766lznInomzYVYAkcs4TcuL+kp/wiPCdEo6K4AJ/lETCCtl4Wmycr
	hX0d/zsomU4OmUr3HBANnpLXH5o+DDeMkKmBRDu343aa+Uaq2h9dJ4teSB9nWcBWY63W01TnrtFA7
	r4SVCIIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjaV9-008B87-1E;
	Fri, 22 Sep 2023 07:22:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjaUA-008ATt-1S;
	Fri, 22 Sep 2023 07:22:00 +0000
X-UUID: b5069cdc591811ee9b7791016c24628a-20230922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=WR9Wuupt4O0oO0a3UZu4E+vioQT1qXFx6TKSkBSF9B8=;
	b=myXwF3yzG0UWpFHZN4fdwMhR2QzQ6duBZoh3ShMwiCVuROiN1d/OmZfeFbFh2QJPDFTsUn/FxiH5bcPR83q6D4fLWDc04S84n6qOiSCtI1nipNjkksNmydnoyue0yN08X6TVynpF38kMbqA7Uojaa6iIP8db5qQX4bkzNnnp23c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:a835981e-d03f-4106-af3b-eb749a3db023,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:5f78ec9,CLOUDID:c12b24bf-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b5069cdc591811ee9b7791016c24628a-20230922
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 532040421; Fri, 22 Sep 2023 00:21:54 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Sep 2023 15:21:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Sep 2023 15:21:18 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Moudy
 Ho" <moudy.ho@mediatek.com>
Subject: [PATCH v6 10/16] dt-bindings: media: mediatek: mdp3: add component TDSHP for MT8195
Date: Fri, 22 Sep 2023 15:21:10 +0800
Message-ID: <20230922072116.11009-11-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230922072116.11009-1-moudy.ho@mediatek.com>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.361600-8.000000
X-TMASE-MatchedRID: y64C6oV0e4foRPKKjGHPUxcqpH7D1rtQTJDl9FKHbrm7qpOHKudqczQz
	47GqDWjpnD3AxwqeC/rkllaluas5jhhzK7qAlTSLbBu6+EIezdwzc8FC0MEwT0dmDSBYfnJRG9v
	VgL2UulsBUGiWwC3UBKzvzl7V8a7y0KO5SGxuaaTr/EBmiNuXtw/i8FY2vTOBmyiLZetSf8lBgw
	5G4NYCZN9pjzubZ2rHec3QM3secWYGOPIjN4GX0PPR09eUeZL01cBOf1bbmc69ZSj6swuDRONWy
	7e2k2YRlExlQIQeRG0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.361600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 60CC5DE38BF86838BFE6D634946790CB913CC0221D97B694C213540CF437A1C42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_002158_516629_9E256FCE 
X-CRM114-Status: GOOD (  13.35  )
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

Add the fundamental hardware configuration of component TDSHP,
which is controlled by MDP3 on MT8195.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../bindings/media/mediatek,mdp3-tdshp.yaml   | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
new file mode 100644
index 000000000000..0ac904cbc2c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Media Data Path 3 TDSHP
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+  - Moudy Ho <moudy.ho@mediatek.com>
+
+description:
+  One of Media Data Path 3 (MDP3) components used to improve image
+  sharpness and contrast.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8195-mdp3-tdshp
+
+  reg:
+    maxItems: 1
+
+  mediatek,gce-client-reg:
+    description:
+      The register of display function block to be set by gce. There are 4 arguments,
+      such as gce node, subsys id, offset and register size. The subsys id that is
+      mapping to the register of display function blocks is defined in the gce header
+      include/dt-bindings/gce/<chip>-gce.h of each chips.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      items:
+        - description: phandle of GCE
+        - description: GCE subsys id
+        - description: register offset
+        - description: register size
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+
+required:
+  - compatible
+  - reg
+  - mediatek,gce-client-reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/gce/mt8195-gce.h>
+
+    display@14007000 {
+        compatible = "mediatek,mt8195-mdp3-tdshp";
+        reg = <0x14007000 0x1000>;
+        mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x7000 0x1000>;
+        clocks = <&vppsys0 CLK_VPP0_MDP_TDSHP>;
+    };
-- 
2.18.0


