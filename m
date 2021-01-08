Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55260C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 07:50:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E552F2343F
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 07:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E552F2343F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kMjNQJoIH/t5557CHkEx7Lbdo1e3tZccWO4ItVDbz6s=; b=xR4iVJIGLAi7oTR8RsxjpaWt0
	ZWAwi2qCINsAUow5AekcLZfl1C9B3wxW4wECA6eAXMbqvDjMish+kXxhVxbfxBhsrZdh1fXeAn5A2
	M3sNlmXxb9fNAQ01hksRBawtlj0LiPZ0qmf4ay7ehyPSrv6dkblE5Nm5V+woxy3ouoRAUjY2O1w8E
	psho4SZAlIX1mgn1/nF4/YQ/7woRiGCpU9q/B1P1MQULO3/Fl6YTBRDp4Jif4i+ulfA92wSM5BOcy
	VuXHEMlQXJJEqcA3VDb6behoi13t6yNZt11n9fS/PvO3hTt6vbgVUvg8ml2cAlWcntZ2ogA6EbfLb
	wxEnaabkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxmWf-00054R-8y; Fri, 08 Jan 2021 07:49:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxmWU-0004yC-Mn; Fri, 08 Jan 2021 07:49:28 +0000
X-UUID: 78a63a31aab5485399c327cd30425ad3-20210107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=uiY0ZcsSRs5D+27jPmyu8iLntO2vISe/cdAG3Ca6p4Y=; 
 b=i9awYXP06pOc7fqAk+Y8vpdqg4BzczbZOapPOG6U73Yyero9JccaNAOrqy0KrEPI3TCy3G7z2Di49sC8FOTGUtiS29rsEerHqLuaWacy3slvHmgn8xuROynn8VWP/HREeeXFeDFeFzuUotAsWZaSgGzaC2zZcG8BRl7iRHjaltU=;
X-UUID: 78a63a31aab5485399c327cd30425ad3-20210107
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <henryc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 83686005; Thu, 07 Jan 2021 23:49:20 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Jan 2021 23:48:21 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 Jan 2021 15:48:19 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 8 Jan 2021 15:48:19 +0800
From: Henry Chen <henryc.chen@mediatek.com>
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>, Mark Brown
 <broonie@kernel.org>
Subject: [PATCH V7 01/13] dt-bindings: soc: Add dvfsrc driver bindings
Date: Fri, 8 Jan 2021 15:48:03 +0800
Message-ID: <1610092095-5113-2-git-send-email-henryc.chen@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1610092095-5113-1-git-send-email-henryc.chen@mediatek.com>
References: <1610092095-5113-1-git-send-email-henryc.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: F1ECC0EEE3CA26308E40AD586395996065F407322B65FC1FD3987900641B45122000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_024926_927026_E297969E 
X-CRM114-Status: GOOD (  14.90  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Henry Chen <henryc.chen@mediatek.com>,
 Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Arvin Wang <arvin.wang@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Document the binding for enabling dvfsrc on MediaTek SoC.

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
---
 .../devicetree/bindings/soc/mediatek/dvfsrc.yaml   | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/dvfsrc.yaml

diff --git a/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.yaml b/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.yaml
new file mode 100644
index 0000000..0b746a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/mediatek/dvfsrc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek dynamic voltage and frequency scaling resource collector (DVFSRC)
+
+description: |
+  The Dynamic Voltage and Frequency Scaling Resource Collector (DVFSRC) is a
+  HW module which is used to collect all the requests from both software and
+  hardware and turn into the decision of minimum operating voltage and minimum
+  DRAM frequency to fulfill those requests.
+
+maintainers:
+  - henryc.chen <henryc.chen@mediatek.com>
+
+properties:
+  reg:
+    description: DVFSRC common register address and length.
+
+  compatible:
+    enum:
+      - mediatek,mt6873-dvfsrc
+      - mediatek,mt8183-dvfsrc
+      - mediatek,mt8192-dvfsrc
+
+  '#interconnect-cells':
+    const: 1
+
+patternProperties:
+  dvfsrc-vcore:
+    type: object
+    description:
+      The DVFSRC regulator is modelled as a subdevice of the DVFSRC.
+      Because DVFSRC can request power directly via register read/write, likes
+      vcore which is a core power of mt8183. As such, the DVFSRC regulator
+      requires that DVFSRC nodes be present.
+    $ref: /schemas/regulator/regulator.yaml#
+
+required:
+  - compatible
+  - reg
+  - "#interconnect-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interconnect/mtk,mt8183-emi.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dvfsrc@10012000 {
+            compatible = "mediatek,mt8183-dvfsrc";
+            reg = <0 0x10012000 0 0x1000>;
+            #interconnect-cells = <1>;
+            dvfsrc_vcore: dvfsrc-vcore {
+                    regulator-name = "dvfsrc-vcore";
+                    regulator-min-microvolt = <725000>;
+                    regulator-max-microvolt = <800000>;
+                    regulator-always-on;
+            };
+        };
+    };
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
