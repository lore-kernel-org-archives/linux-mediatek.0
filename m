Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24595C6FA82
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 03:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EnCltdT6Z6EH/J8fbqpmMgDX4Y07nMwnORWprAExDOA=; b=H+wVmyZ6qwVDhBRMvOGqy8lnQt
	qv9HEXSw0pTe+gJFSuGPvlTu44H5Wbd28etZT+NREE7FL7u5GtTWrHQ1F36xiq5cZDD6W8er+FRNv
	nAIh3Pwnfu9ZIzlxBUdgVitK/hwL2JhzQGjLvPi3Was7vokLOe5Kyzn7+evJ0bTTY01Mpg01eJxn4
	WsorpgL0slpeFLDZ1xTRVyWAicpG+3Fgw11rEOkbApkTmBbeqn9OtTl9ZPsS78577jaS8v5myUUhc
	r5/dP+h9xG6pppEEGI0zUi2JA3yX1YPux+RpmuOAyynuWVHxrhh6RDEovUlGpKlNVnrH0OOYwlAZb
	YtRBqBUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od15s-0083Pi-RC; Tue, 27 Sep 2022 03:17:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od15m-0083Mw-6s; Tue, 27 Sep 2022 03:17:09 +0000
X-UUID: 92f67857c1714b00b22fb5049d9067a8-20220926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=EnCltdT6Z6EH/J8fbqpmMgDX4Y07nMwnORWprAExDOA=;
	b=Rhnrz91+BeB+Ryi2/BhFcSSzivY+PT0t6PwKGYL3CjA0YSJH58K1A4XZbFvqHwdLddq0OJEWquXIxuOkhdezmVRDRDp3HverVEPa178lZtQuJroZm0CrVtR1hObe3/jnsQffjjGcS1lEnXntpyqs0D8UEZp/+Rhu1hq2Ke5LMuc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:90b0516f-3243-478d-8bd1-a9e2e4574bb5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:877a2ba3-dc04-435c-b19b-71e131a5fc35,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 92f67857c1714b00b22fb5049d9067a8-20220926
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1306038186; Mon, 26 Sep 2022 20:17:00 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 27 Sep 2022 10:56:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 27 Sep 2022 10:56:25 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT
 Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Tinghan Shen
	<tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v3 02/11] dt-bindings: remoteproc: mediatek: Support MT8195 dual-core SCP
Date: Tue, 27 Sep 2022 10:55:57 +0800
Message-ID: <20220927025606.26673-3-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220927025606.26673-1-tinghan.shen@mediatek.com>
References: <20220927025606.26673-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_201707_696489_DA3625C5 
X-CRM114-Status: GOOD (  17.21  )
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

The MT8195 SCP is a dual-core RISC-V MCU. Extend the yaml file
to describe the 2nd core as a subnode of the boot core.

The configuration register is shared by MT8195 SCP core 0
and core 1. The core 1 can retrieve the information of configuration
registers from parent node.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 .../bindings/remoteproc/mtk,scp.yaml          | 97 ++++++++++++++++++-
 1 file changed, 92 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index 786bed897916..c012265be4eb 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -75,6 +75,83 @@ properties:
     required:
       - mediatek,rpmsg-name
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^scp-c[0-9]+@[a-f0-9]+$":
+    type: object
+    description:
+      The MediaTek SCP integrated to SoC might be a multi-core version.
+      The other cores are represented as child nodes of the boot core.
+      There are some integration differences for the IP like the usage of
+      address translator for translating SoC bus addresses into address space
+      for the processor.
+
+      Each SCP core has own cache memory. The SRAM and L1TCM are shared by
+      cores. The power of cache, SRAM and L1TCM power should be enabled
+      before booting SCP cores. The size of cache, SRAM, and L1TCM are varied
+      on differnt SoCs.
+
+      The SCP cores do not use an MMU, but has a set of registers to
+      control the translations between 32-bit CPU addresses into system bus
+      addresses. Cache and memory access settings are provided through a
+      Memory Protection Unit (MPU), programmable only from the SCP.
+
+    properties:
+      compatible:
+        enum:
+          - mediatek,mt8195-scp-core
+
+      reg:
+        description: The base address and size of SRAM.
+        maxItems: 1
+
+      reg-names:
+        const: sram
+
+      interrupts:
+        maxItems: 1
+
+      firmware-name:
+        $ref: /schemas/types.yaml#/definitions/string
+        description:
+          If present, name (or relative path) of the file within the
+          firmware search path containing the firmware image used when
+          initializing sub cores of multi-core SCP.
+
+      memory-region:
+        maxItems: 1
+
+      cros-ec-rpmsg:
+        type: object
+        description:
+          This subnode represents the rpmsg device. The namesof the devices
+          are not important. The properties of this node are defined by the
+          individual bindings for the rpmsg devices.
+
+        properties:
+          mediatek,rpmsg-name:
+            $ref: /schemas/types.yaml#/definitions/string-array
+            description:
+              Contains the name for the rpmsg device. Used to match
+              the subnode to rpmsg device announced by SCP.
+
+        required:
+          - mediatek,rpmsg-name
+
+    required:
+      - compatible
+      - reg
+      - reg-names
+
+    additionalProperties: false
+
 required:
   - compatible
   - reg
@@ -110,16 +187,26 @@ additionalProperties: false
 
 examples:
   - |
-    #include <dt-bindings/clock/mt8192-clk.h>
-
     scp@10500000 {
-        compatible = "mediatek,mt8192-scp";
+        compatible = "mediatek,mt8195-scp";
         reg = <0x10500000 0x80000>,
               <0x10700000 0x8000>,
               <0x10720000 0xe0000>;
         reg-names = "sram", "cfg", "l1tcm";
-        clocks = <&infracfg CLK_INFRA_SCPSYS>;
-        clock-names = "main";
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x105a0000 0x105a0000 0x20000>;
+
+        scp-c1@105a0000 {
+                compatible = "mediatek,mt8195-scp-core";
+                reg = <0x105a0000 0x20000>;
+                reg-names = "sram";
+
+                cros-ec-rpmsg {
+                    mediatek,rpmsg-name = "cros-ec-rpmsg";
+                };
+        };
 
         cros-ec-rpmsg {
             mediatek,rpmsg-name = "cros-ec-rpmsg";
-- 
2.18.0


