Return-Path: <SRS0=+2Q0=DW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E366C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2020 12:59:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4E3C2225A
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2020 12:59:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LavZ+dmD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OytQrD+T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4E3C2225A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QqtyskcXMNHRg+BMRK6prosLWJUYbU93TvdNMHwwoMM=; b=LavZ+dmD0j4Svm3ZDWVEilw7C
	PcHaYMcKUfZqSxBpggG6o6e9i6xWOUt4MiWilW/T+1/vsCml18+3LsDRAm60iytluWkk98I+AfLNJ
	prP3wqUKLV/MOESuEM15im0k5bObq10eQ5bbsGUjBwY2sK89aKKFmkPN03V+4hDnq4vzOjh2iOGC8
	gQHMabd+h+4K4C6gd134fKiZ7JXq14gEIMNGmFXipI3aIKnCy+mLGLApenLHMt+6GiYX4BZquPDme
	fNRCWMST2p2ioqOoCrUgIFsTu9SVstiGoNZw9x+qYhnMANSwd8Rysm3iQvCpvcnPHQGlGSCZUxX4b
	HzeY7AW9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kT2qu-0001o0-DR; Thu, 15 Oct 2020 12:59:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kT2qk-0001kd-Su; Thu, 15 Oct 2020 12:59:20 +0000
X-UUID: 2d6ab95cb9b6414cbc98229c9d155c3a-20201015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FLPCDUAskVZvAtsDNHb6TvCzZkL8/uiNYJKOELwOJe8=; 
 b=OytQrD+TYHcHcEvIsoFkxMmwDUTsNn56+6hxSGFc2aLX7cu29kmdrhvEvhea8PSCxQoNzNDZoYSlixzQEInuYhgE4+VCY/0Rjk+2O26IoUA2xFbw9PYkUVC8x9edrycjkgo8yP0gdMEi+Vox5E3QLRZq5znXygXSqtNPBFJRxIg=;
X-UUID: 2d6ab95cb9b6414cbc98229c9d155c3a-20201015
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 546087428; Thu, 15 Oct 2020 04:59:13 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Oct 2020 05:59:11 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Oct 2020 20:59:09 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 15 Oct 2020 20:59:09 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: spmi: document binding for the Mediatek
 SPMI controller
Date: Thu, 15 Oct 2020 20:59:07 +0800
Message-ID: <1602766748-25490-2-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1602766748-25490-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1602766748-25490-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201015_085919_064410_861431A5 
X-CRM114-Status: GOOD (  13.83  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This adds documentation for the SPMI controller found on Mediatek SoCs.

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
 .../bindings/spmi/spmi-mtk-pmif.yaml          | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spmi/spmi-mtk-pmif.yaml

diff --git a/Documentation/devicetree/bindings/spmi/spmi-mtk-pmif.yaml b/Documentation/devicetree/bindings/spmi/spmi-mtk-pmif.yaml
new file mode 100644
index 000000000000..39459ca2e0da
--- /dev/null
+++ b/Documentation/devicetree/bindings/spmi/spmi-mtk-pmif.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spmi/spmi-mtk-pmif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek SPMI Controller Device Tree Bindings
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+description: |+
+  On MediaTek SoCs the PMIC is connected via SPMI and the controller allows
+  for multiple SoCs to control a single SPMI master.
+
+properties:
+  compatible:
+    const: mediatek,mt6873-spmi
+
+  reg:
+    minItems: 2
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: "pmif"
+      - const: "spmimst"
+
+  clocks:
+    minItems: 3
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: "pmif_sys_ck"
+      - const: "pmif_tmr_ck"
+      - const: "spmimst_clk_mux"
+
+  assigned-clocks:
+    maxItems: 1
+
+  assigned-clock-parents:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8192-clk.h>
+
+    spmi: spmi@10027000 {
+        compatible = "mediatek,mt6873-spmi";
+        reg = <0 0x10027000 0 0x000e00>,
+              <0 0x10029000 0 0x000100>;
+        reg-names = "pmif", "spmimst";
+        clocks = <&infracfg CLK_INFRA_PMIC_AP>,
+                 <&infracfg CLK_INFRA_PMIC_TMR>,
+                 <&topckgen CLK_TOP_SPMI_MST_SEL>;
+        clock-names = "pmif_sys_ck",
+                      "pmif_tmr_ck",
+                      "spmimst_clk_mux";
+        assigned-clocks = <&topckgen CLK_TOP_PWRAP_ULPOSC_SEL>;
+        assigned-clock-parents = <&topckgen CLK_TOP_OSC_D10>;
+    };
+...
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
