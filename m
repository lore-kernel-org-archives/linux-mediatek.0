Return-Path: <SRS0=GIYZ=KT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C787C04FF3
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 May 2021 22:33:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C48E661400
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 May 2021 22:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C48E661400
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ja0rAIk32ophlLgtnMQKBuG8B2rMJjpcCDURN9aP0qQ=; b=QT7Y7+tLwTPQrx
	OcY7LehnXqBmpXrnUayfgdRZI4UVCRYM/Y/apQpzeMtwHVRA8vAVUAhRGc4f2rI+3K5SyZGJruQz5
	QFnytZXoIlRTIiFXeePlXi8W7sOCBog4R3pnqKYqDpmSohnHpPONBfQAX+YIJk5glIjWgNW+RjOCn
	/hIsjmQpf/bOGL2wVuDO1SxAhuQXWLekqVc6S8UM1f0Sehlm4T7lZ7DY+AQGg/OVUKlzLA7gs4atC
	9LvPIXfnegB2VqTTmAhK2cQPu/Bi8dKWDMNFX16ZPgbebnF2ZXldHrxYbpNx6HoUV3CsPG5UUzO21
	Wqx8V6jPHS2eDkGMn8mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llJ87-00298M-Pg; Mon, 24 May 2021 22:32:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll9rh-000uwI-6D; Mon, 24 May 2021 12:39:26 +0000
X-UUID: d4f7a44184a34147b0d022d4c8dc04ab-20210524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=DX36PTpX4V4eVeo8v3HBS9nJHSuZjkM2iG4AI3953PU=; 
 b=AG3PN2qfB3ToCZbo3eMUzt1KHL+Na4sZ96wI8iVFxPnxYtu7JvOy/Ak/Tye+y8aoWzImLZgPOqJnP5fBqaPsMjOjHDapSNq9ajcvEfMwZGLeE+Cq+Afvj8JOFMiGzOMl5pWmp1viJ5EVGO04tczWLfiktQy4fXJYmA+wFJLo+B4=;
X-UUID: d4f7a44184a34147b0d022d4c8dc04ab-20210524
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1134903899; Mon, 24 May 2021 05:39:13 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 May 2021 05:29:11 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 May 2021 20:29:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 24 May 2021 20:29:10 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Weiyi Lu
 <weiyi.lu@mediatek.com>, "chun-jie . chen" <chun-jie.chen@mediatek.com>
Subject: [PATCH v9 01/22] dt-bindings: ARM: Mediatek: Add new document
 bindings of imp i2c wrapper controller
Date: Mon, 24 May 2021 20:20:32 +0800
Message-ID: <20210524122053.17155-2-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210524122053.17155-1-chun-jie.chen@mediatek.com>
References: <20210524122053.17155-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_053925_258180_0D06F294 
X-CRM114-Status: GOOD (  13.90  )
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

This patch adds the new binding documentation of imp i2c wrapper controller
for Mediatek MT8192.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Signed-off-by: chun-jie.chen <chun-jie.chen@mediatek.com>
---
 .../arm/mediatek/mediatek,imp_iic_wrap.yaml   | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml
new file mode 100644
index 000000000000..fb6cb9e60ee2
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,imp_iic_wrap.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek IMP I2C Wrapper Controller
+
+maintainers:
+  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
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
+additionalProperties: false
+
+examples:
+  - |
+    imp_iic_wrap_c: syscon@11007000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_c", "syscon";
+        reg = <0x11007000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imp_iic_wrap_e: syscon@11cb1000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_e", "syscon";
+        reg = <0x11cb1000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imp_iic_wrap_s: syscon@11d03000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_s", "syscon";
+        reg = <0x11d03000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imp_iic_wrap_ws: syscon@11d23000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_ws", "syscon";
+        reg = <0x11d23000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imp_iic_wrap_w: syscon@11e01000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_w", "syscon";
+        reg = <0x11e01000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imp_iic_wrap_n: syscon@11f02000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_n", "syscon";
+        reg = <0x11f02000 0x1000>;
+        #clock-cells = <1>;
+    };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
