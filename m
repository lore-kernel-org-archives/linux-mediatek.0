Return-Path: <SRS0=m1jb=F2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F13C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 13:13:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B907121D7F
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 13:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B907121D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/nOA05fvP5yIS79gT8FReqfb0D022VheICqDWD4g6rU=; b=Wp1ZNukWjRkV5nsK5GjbIurVJ
	xYHRn5RdjqtL4p5QriFqrkYTlEIYMteWFAy+WftSn2258B3wuzpmNjehntzmsXTtkAZp3deCtHl6B
	k20ApL8MSgRpdrVBY5gRUGIsLocJGdTbjz1BWvyCctmjj3aIa3kOiO0kkHMvdrAiIsg8vY0DrkguC
	0yPpeLnLQ8glyrvAl9KRZJBWAKN0ZaNs+VPHV8/DRuhjluXqI5jfzscd29abD5edkwAnxAtd6UFru
	4RSgGOyvfxO7Gl/tnx68IJiKRaSuaB/BN9pBL8YHhFS4nd9bCgjk5Wu/hB9EERZhGe+YVECNeoP/O
	jk3CguLew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krhTD-00035P-P3; Tue, 22 Dec 2020 13:12:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krhQw-0001mW-BO; Tue, 22 Dec 2020 13:10:36 +0000
X-UUID: 38f37ab4ec744184a4017fc4e54053c3-20201222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=h8zPlVqxZhGhHgUXWdmgYzf2iYnusNn7hJWQ5EpylJk=; 
 b=go8Wvw0J282PW8ny344JuDHej9vfHvk01NmO7fTGjTYsnpizviJEwlLLvV/7x4ulzJdlV9wlibSqUUhRsWm0L+w385o1+vRYzXlsKSljedG1aO0ifEkfTnHEpep92zamrTJoGPSjAYbl29u33ISqkBWev3O+SHm2raV0W12kVE0=;
X-UUID: 38f37ab4ec744184a4017fc4e54053c3-20201222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 92646851; Tue, 22 Dec 2020 05:10:02 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 05:09:52 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 21:09:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 22 Dec 2020 21:09:48 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v6 01/22] dt-bindings: ARM: Mediatek: Add new document
 bindings of imp i2c wrapper controller
Date: Tue, 22 Dec 2020 21:09:26 +0800
Message-ID: <1608642587-15634-2-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1608642587-15634-1-git-send-email-weiyi.lu@mediatek.com>
References: <1608642587-15634-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_081034_629365_A18D9E6C 
X-CRM114-Status: GOOD (  13.96  )
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
Cc: Weiyi Lu <weiyi.lu@mediatek.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds the new binding documentation of imp i2c wrapper controller
for Mediatek MT8192.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 .../arm/mediatek/mediatek,imp_iic_wrap.yaml        | 78 ++++++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml
new file mode 100644
index 0000000..5d0cf37
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,imp_iic_wrap.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek IMP I2C Wrapper Controller
+
+maintainers:
+  - Weiyi Lu <weiyi.lu@mediatek.com>
+
+description:
+  The Mediatek imp i2c wrapper controller provides functional configurations and clocks to the system.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8192-imp_iic_wrap_c
+          - mediatek,mt8192-imp_iic_wrap_e
+          - mediatek,mt8192-imp_iic_wrap_s
+          - mediatek,mt8192-imp_iic_wrap_ws
+          - mediatek,mt8192-imp_iic_wrap_w
+          - mediatek,mt8192-imp_iic_wrap_n
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    imp_iic_wrap_c: syscon@11007000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_c", "syscon";
+        reg = <0 0x11007000 0 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imp_iic_wrap_e: syscon@11cb1000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_e", "syscon";
+        reg = <0 0x11cb1000 0 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imp_iic_wrap_s: syscon@11d03000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_s", "syscon";
+        reg = <0 0x11d03000 0 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imp_iic_wrap_ws: syscon@11d23000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_ws", "syscon";
+        reg = <0 0x11d23000 0 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imp_iic_wrap_w: syscon@11e01000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_w", "syscon";
+        reg = <0 0x11e01000 0 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imp_iic_wrap_n: syscon@11f02000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_n", "syscon";
+        reg = <0 0x11f02000 0 0x1000>;
+        #clock-cells = <1>;
+    };
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
