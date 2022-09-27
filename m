Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D372FC54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 03:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5/g02O+FAb76avY7mpBFXThZP45BZFh3KJ/fyx8Lr4=; b=cHhbcxmulbuKFRdCXwpxkhVH8w
	/vFjPJttlDl8d8x06WXYlV8yo2BjLJ4sycIE641VOK/t9lWkN6SE8u8Pu24k8RPNxmzKZ0nsUo8Aw
	dtx5JHtkfaS3Wei2r1WhxRoPv5iCcUeRblBR6Kcf2Hc5YPc9Ayt8zZeoHt0/2Z5OUdANXvRv4srjm
	fnJSVgIIZ1zsYffO4roWTaUmz8nXSEiEiDFj1A97aSJ2Kop++VW87dp1Z9b277/3iqqdbvjfmWHLL
	pMHyUDFEqpbLf/+wJY5L5uWk21soG7Q/3jKfG9VOaHcyQaNvemIJPK9P6T2OIgimipHU9dMnV6heF
	xRToRuAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od1GY-0085Ah-5A; Tue, 27 Sep 2022 03:28:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od1GW-00859W-A3; Tue, 27 Sep 2022 03:28:13 +0000
X-UUID: a32a75cac82743a5a0d18e0a1d14e1c3-20220926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=X5/g02O+FAb76avY7mpBFXThZP45BZFh3KJ/fyx8Lr4=;
	b=tUcEPDvbmymY6ZOQPDv7DTn2C5mwgZsSIDk+3AXq4tFG3qA9gDEbNQGbStjsvJPNKmni62HECGNejXTlq44xMom52kQqPG1GlFgUnNSIuGek2Qm9Qy9JrY5umz3fDAnpcCEMSOX14yhFK2CzDoUZi/EeAQBWzlyTeOJYUzJ3hVc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:b53e3945-e2c6-425e-87fa-73cb9f386cc9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:07e62ba3-dc04-435c-b19b-71e131a5fc35,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a32a75cac82743a5a0d18e0a1d14e1c3-20220926
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 257001965; Mon, 26 Sep 2022 20:28:02 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 27 Sep 2022 10:56:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 27 Sep 2022 10:56:25 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tiffany Lin <tiffany.lin@mediatek.com>, "Andrew-CT
 Chen" <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Tinghan Shen
	<tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v3 01/11] dt-bindings: remoteproc: mediatek: Give the subnode a persistent name
Date: Tue, 27 Sep 2022 10:55:56 +0800
Message-ID: <20220927025606.26673-2-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220927025606.26673-1-tinghan.shen@mediatek.com>
References: <20220927025606.26673-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_202812_359927_B85D759C 
X-CRM114-Status: GOOD (  13.48  )
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

The node name doesn't matter to add the subnode as a cros-ec rpmsg device.
Give it a clear persistent node name to simplify scp yaml.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 .../bindings/remoteproc/mtk,scp.yaml          | 35 ++++++++++---------
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  2 +-
 2 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index 7e091eaffc18..786bed897916 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -58,6 +58,23 @@ properties:
   memory-region:
     maxItems: 1
 
+  cros-ec-rpmsg:
+    type: object
+    description:
+      This subnode represents the rpmsg device. The names of the devices
+      are not important. The properties of this node are defined by the
+      individual bindings for the rpmsg devices.
+
+    properties:
+      mediatek,rpmsg-name:
+        $ref: /schemas/types.yaml#/definitions/string-array
+        description:
+          Contains the name for the rpmsg device. Used to match
+          the subnode to rpmsg device announced by SCP.
+
+    required:
+      - mediatek,rpmsg-name
+
 required:
   - compatible
   - reg
@@ -89,21 +106,7 @@ allOf:
         reg-names:
           maxItems: 2
 
-additionalProperties:
-  type: object
-  description:
-    Subnodes of the SCP represent rpmsg devices. The names of the devices
-    are not important. The properties of these nodes are defined by the
-    individual bindings for the rpmsg devices.
-  properties:
-    mediatek,rpmsg-name:
-      $ref: /schemas/types.yaml#/definitions/string-array
-      description:
-        Contains the name for the rpmsg device. Used to match
-        the subnode to rpmsg device announced by SCP.
-
-  required:
-    - mediatek,rpmsg-name
+additionalProperties: false
 
 examples:
   - |
@@ -118,7 +121,7 @@ examples:
         clocks = <&infracfg CLK_INFRA_SCPSYS>;
         clock-names = "main";
 
-        cros_ec {
+        cros-ec-rpmsg {
             mediatek,rpmsg-name = "cros-ec-rpmsg";
         };
     };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index b4b86bb1f1a7..693ad5f2a82e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -816,7 +816,7 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&scp_pins>;
 
-	cros_ec {
+	cros-ec-rpmsg {
 		compatible = "google,cros-ec-rpmsg";
 		mediatek,rpmsg-name = "cros-ec-rpmsg";
 	};
-- 
2.18.0


