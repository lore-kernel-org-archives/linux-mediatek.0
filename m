Return-Path: <SRS0=rC0f=3F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 665EFC32771
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2020 02:15:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AD512081E
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2020 02:15:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YhIaEpse";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="N49eJHkk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AD512081E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uCSdFwloXJg61aRqMoXJ+VwHbQeA93gTspcBhK7xM/U=; b=YhIaEpseXbWXMS
	kTKKLKk2qlmerAkqVTALAAyXtsYkjOlcm5AZu1kIyy+dqV07Hk4n8nkynBYPxbX0qBbhB4R1VTs7j
	oNEFxF+mZnyBcdSezL8zfsl0sGLjmH2M68s1SJk1FqQNJmH4hkunMQv0ejQZe/MjQNvyD8iI/nP6Y
	+gYiZ7YmSEZ0biUjDi9JwjX2x5msKCYkeWyLDKdDSihc+EBEtwoFV9vWyC9Le41Bwo7ZmPCdJePUt
	YTp55aggvTu6V959G3U5Ghvc8r3KkgLNc7PftyxiLfwH9O8lboEpiQB/pi9i/VngkIJr5GGOYrNIR
	uIRRJ5+Rr0calRLtx7xA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irugz-0005EG-Bo; Thu, 16 Jan 2020 02:15:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irugt-0005CK-S3
 for linux-mediatek@lists.infradead.org; Thu, 16 Jan 2020 02:15:27 +0000
X-UUID: 2e160e69cca44ab8a31b6b1a29da79c1-20200115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=F462LuZJcy34TtYCZva80mss9EgKryG7r/I9+ALwST4=; 
 b=N49eJHkk530AC6bCBoUfE50iMj1gk6izH0E+xit/8mx+DgYjyiqfTx6Y4eEUfTPHwc8PtsvC5Ao1Lr6r4j3xLpP1J0H86kR8kHYNGyiCzmzRFyLfdXfq2K93hW2p3a16a8XLG4S5Y2W2W1oKRssZuwe0EN+55J4wfp3YksbA4z0=;
X-UUID: 2e160e69cca44ab8a31b6b1a29da79c1-20200115
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1298525203; Wed, 15 Jan 2020 18:15:22 -0800
Received: from MTKMBS33DR.mediatek.inc (172.27.6.106) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 15 Jan 2020 18:16:14 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 16 Jan 2020 10:12:01 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Thu, 16 Jan 2020 10:14:23 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 1/5] dt-bindings: display: panel: Add boe tv101wum-n16
 panel bindings
Date: Thu, 16 Jan 2020 10:15:07 +0800
Message-ID: <20200116021511.22675-2-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200116021511.22675-1-jitao.shi@mediatek.com>
References: <20200116021511.22675-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 21036B83BB708D1CF0E3FC3487B37E48F2C220B640ABD57B0284D2C68176BDB82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_181523_909684_E8E7D98E 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, srv_heupstream@mediatek.com,
 stonea168@163.com, cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 bibby.hsieh@mediatek.com, ck.hu@mediatek.com, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add documentation for "boe,tv101wum-n16", "auo,kd101n80-45na",
"boe,tv101wum-n53" and "auo,b101uan08.3" panels.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/boe,tv101wum-nl6.yaml       | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
new file mode 100644
index 000000000000..cc4e058f5eee
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BOE TV101WUM-NL6 DSI Display Panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+  - Rob Herring <robh+dt@kernel.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+        # BOE TV101WUM-NL6 10.1" WUXGA TFT LCD panel
+      - boe,tv101wum-nl6
+        # AUO KD101N80-45NA 10.1" WUXGA TFT LCD panel
+      - auo,kd101n80-45na
+        # BOE TV101WUM-N53 10.1" WUXGA TFT LCD panel
+      - boe,tv101wum-n53
+        # AUO B101UAN08.3 10.1" WUXGA TFT LCD panel
+      - auo,b101uan08.3
+
+  reg:
+    description: the virtual channel number of a DSI peripheral
+
+  enable-gpios:
+    description: a GPIO spec for the enable pin
+
+  pp1800-supply:
+    description: core voltage supply
+
+  avdd-supply:
+    description: phandle of the regulator that provides positive voltage
+
+  avee-supply:
+    description: phandle of the regulator that provides negative voltage
+
+  backlight:
+    description: phandle of the backlight device attached to the panel
+
+  port: true
+
+required:
+ - compatible
+ - reg
+ - enable-gpios
+ - pp1800-supply
+ - avdd-supply
+ - avee-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "boe,tv101wum-nl6";
+            reg = <0>;
+            enable-gpios = <&pio 45 0>;
+            avdd-supply = <&ppvarn_lcd>;
+            avee-supply = <&ppvarp_lcd>;
+            pp1800-supply = <&pp1800_lcd>;
+            backlight = <&backlight_lcd0>;
+            status = "okay";
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.21.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
