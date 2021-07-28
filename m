Return-Path: <SRS0=pZ6D=MU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15704C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 04:00:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCC056056B
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 04:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BCC056056B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ptGK8Qe0ikn5iFwHwXRWhojXwTBe3BrhgFzxH54CYfM=; b=YguVYq8IZOPzYK
	+wFcAZn2hG3EaAOuql/RV6/lM28XlQPVfo8GFVjtW4sWbrc4EMVHOW0clr1NpQICr32kUhrUPROOv
	1Z+qcafTjRjOf57n/dZUfseoaNipev7F/y81QoVR6+hKLRM9EDeb+2fa1oKPi9aHZFFAt6uqsprOZ
	kbx9zr6DFgxGE+mCU6O0opstABBqIIYc1wgfT4BGViJCl7BG9Qp1hH1ip6jvTkMXrhVIU5Muw4UBf
	CF00qyjIer56ws60kyCGF64hRQGW0pdvwTRqKbXD2aftB/5QXImNf2NrhnF0+Shhvcf/4JfoxgOSj
	guUyBsKpZas0RI/NV/kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8ajy-00Gz86-16; Wed, 28 Jul 2021 04:00:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8ajk-00Gz4w-1G; Wed, 28 Jul 2021 04:00:05 +0000
X-UUID: 9e2a88fe2e6b49f3b6d8ea1456221af4-20210727
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=h+2/maPZ4K0/zsb2Q5NVI7il28+kaHw1wrx5BdyL0zI=; 
 b=NT+HKnKAX1OWaUzStXeUKpDtN2KxDOPwBdRU91JT/hep0cd5yGK8nbYJDYSVL02w0inNxLKeDApre9fj1jRoShyJqvqINusnYLVeG+kTgEscnboXD3aq8n8F5pRVFR4QwIqQQhgZ/t3YYCpaNd1bJgUL18954l6xP2hkiE1qwbc=;
X-UUID: 9e2a88fe2e6b49f3b6d8ea1456221af4-20210727
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 30145488; Tue, 27 Jul 2021 21:00:01 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Jul 2021 20:59:05 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Jul 2021 11:59:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 28 Jul 2021 11:59:03 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <ohad@wizery.com>, <bjorn.andersson@linaro.org>,
 <mathieu.poirier@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <tzungbi@google.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>
Subject: [PATCH v4 3/4] dt-bindings: remoteproc: mediatek: Convert mtk,
 scp to json-schema
Date: Wed, 28 Jul 2021 11:58:58 +0800
Message-ID: <20210728035859.5405-4-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210728035859.5405-1-tinghan.shen@mediatek.com>
References: <20210728035859.5405-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_210004_111275_5460E5E8 
X-CRM114-Status: GOOD (  19.06  )
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

Convert the mtk,scp binding to DT schema format using json-schema.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 .../bindings/remoteproc/mtk,scp.txt           | 41 ---------
 .../bindings/remoteproc/mtk,scp.yaml          | 85 +++++++++++++++++++
 2 files changed, 85 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
deleted file mode 100644
index 88f37dee7bca..000000000000
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-Mediatek SCP Bindings
-----------------------------------------
-
-This binding provides support for ARM Cortex M4 Co-processor found on some
-Mediatek SoCs.
-
-Required properties:
-- compatible		Should be one of:
-				"mediatek,mt8183-scp"
-				"mediatek,mt8192-scp"
-				"mediatek,mt8195-scp"
-- reg			Should contain the address ranges for memory regions:
-			SRAM, CFG, and L1TCM.
-- reg-names		Contains the corresponding names for the memory regions:
-			"sram", "cfg", and "l1tcm".
-- clocks		Required by mt8183 and mt8192. Clock for co-processor
-			(See: ../clock/clock-bindings.txt)
-- clock-names		Required by mt8183 and mt8192. Contains the
-			corresponding name for the clock. This should be
-			named "main".
-
-Subnodes
---------
-
-Subnodes of the SCP represent rpmsg devices. The names of the devices are not
-important. The properties of these nodes are defined by the individual bindings
-for the rpmsg devices - but must contain the following property:
-
-- mtk,rpmsg-name	Contains the name for the rpmsg device. Used to match
-			the subnode to rpmsg device announced by SCP.
-
-Example:
-
-	scp: scp@10500000 {
-		compatible = "mediatek,mt8183-scp";
-		reg = <0 0x10500000 0 0x80000>,
-		      <0 0x105c0000 0 0x5000>;
-		reg-names = "sram", "cfg";
-		clocks = <&infracfg CLK_INFRA_SCPSYS>;
-		clock-names = "main";
-	};
diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
new file mode 100644
index 000000000000..dc5fcbe65dae
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek SCP Bindings
+
+maintainers:
+  - Tinghan Shen <tinghan.shen@mediatek.com>
+
+description:
+  This binding provides support for ARM Cortex M4 Co-processor found on some
+  Mediatek SoCs.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8183-scp
+      - mediatek,mt8192-scp
+      - mediatek,mt8195-scp
+
+  reg:
+    description: |
+      Should contain the address ranges for memory regions SRAM and CFG,
+    maxItems: 2
+
+  reg-names:
+    description: |
+      Contains the corresponding names for the two memory regions. These
+      should be named "sram", "cfg".
+
+  clocks:
+    description: |
+        Clock for co-processor (see ../clock/clock-bindings.txt).
+        Required by mt8183 and mt8192.
+    maxItems: 1
+
+  clock-names:
+    description: |
+      Contains the corresponding name for the clock. This should be
+      named "main". Required by mt8183 and mt8192.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+patternProperties:
+  ".*":
+    if:
+      type: object
+    then:
+      description:
+        Subnodes of the SCP represent rpmsg devices. The names of the devices
+        are not important. The properties of these nodes are defined by the
+        individual bindings for the rpmsg devices.
+
+      properties:
+        mtk,rpmsg-name:
+          description:
+            Contains the name for the rpmsg device. Used to match
+            the subnode to rpmsg device announced by SCP.
+
+      required:
+        - mtk,rpmsg-name
+
+additionalProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        scp: scp@10500000 {
+            compatible = "mediatek,mt8183-scp";
+            reg = <0 0x10500000 0 0x80000>,
+                  <0 0x105c0000 0 0x5000>;
+            reg-names = "sram", "cfg";
+            clocks = <&infracfg CLK_INFRA_SCPSYS>;
+            clock-names = "main";
+        };
+    };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
