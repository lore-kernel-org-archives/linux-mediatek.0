Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48591C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 06:02:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0B0961453
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 06:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0B0961453
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W3Tqdw4jj/GOzNPIj1HvmXpR/1rbd0PdVVrnGEM6lqo=; b=WyPOudQ4CIfL8asQSyJ5V72Zq
	XMVIvm6YZuGjx0ZJ0wLQzW+xFQ0PCcM20CufF8mb/OjTMRhaAFuZ4E7Eou/radgzqhOBtLLV0iZxT
	nP1OjlJ14VUv6G9+rXNjKu9GkMGRXbxmoAVhBXHfu6aIqCn5GZWC2zirqBNEcUQ2jkJvwNlRIWxpc
	5ZZCatLzG1UII31MsZ/M+ryCmExIryWMFqYkGXuL9JqMzaK1MAenPCimcGtCzMKODnpLX9ior/hJW
	8m8Kaz/rK+y5XydZvJBZSfgAduFLR3Lp0IIn/4+FQ+Ye2YKYxlEmrGcavAhUGAtdRfmj5u14NVnoG
	b3sEx326A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWv4o-00EzDD-DU; Thu, 15 Apr 2021 06:02:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWv4J-00Ez7D-LR; Thu, 15 Apr 2021 06:01:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=hjl5qwY+W+euj6mzALr9luf306t0fF/MAMAdSjVhIK8=; b=gSF1M5a0meMLWjrLwLphRpGCn6
 q10XtciC12lgeRwvzSGHh3e07O3t4HMNez9QPoVqaSS7FtMucHbVDHRebOEaMiEKv6biUUHgXfJ9I
 0ZKqseHA1xFqY/fYqvn5fCtZJltiBrHBIdX9uDneUPKFM94ppaM3zHIZ8RIi3uZmDpEXm5vvlOMet
 COx9L6FlMlBiRS3XDNIxO/cP6TdBJ3QQn58C10dBd4kgBnmH7wwBgCtRrG8oudLOStnvrOjtkQc6t
 MMXf4YPs47eRDdEdvHhkii0r/xpsvQ88oX3i12yuYZpyaR5ARDr0Jt3bBGfUKsQEmE5s6tpMH0OWd
 ky2bYEgA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWv4H-008IO8-0N; Thu, 15 Apr 2021 06:01:34 +0000
X-UUID: cbc61eebec3e415c8a1e33be20ca4301-20210414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=hjl5qwY+W+euj6mzALr9luf306t0fF/MAMAdSjVhIK8=; 
 b=KYBiS3e3VgJFO+KOE2vUtsAME0Xu5gf1diQg7R6aqmAN2g9vUtlapISyvSwDhLjdB8rYG93ZZG1h3MvKmEm8mbSbjDztlk9F+vuzhJwTeKeo54i9AGuBNU4R0KWfIaQdjT2gZu7id2kuVsdeOQUfW97mkC8PdxCVymjXxvQL0So=;
X-UUID: cbc61eebec3e415c8a1e33be20ca4301-20210414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 72604468; Wed, 14 Apr 2021 23:01:27 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Apr 2021 22:52:54 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Apr 2021 13:52:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 15 Apr 2021 13:52:50 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Pi-Cheng Chen <pi-cheng.chen@mediatek.com>, 
 Chiawen Lee <chiawen.lee@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <srv_heupstream@mediatek.com>
Subject: [PATCH v2 3/7] dt-bindings: arm: mediatek: Add new document bindings
 for APU
Date: Thu, 15 Apr 2021 13:52:36 +0800
Message-ID: <1618465960-3013-4-git-send-email-flora.fu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1618465960-3013-1-git-send-email-flora.fu@mediatek.com>
References: <1618465960-3013-1-git-send-email-flora.fu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 16CE3117B475B4EDD03E74C2F10B07A397CF72A65CC12EBB254D20C05A6BDD232000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_230133_073575_6D94A460 
X-CRM114-Status: GOOD (  12.30  )
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

Document the apusys bindings.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>
---
 .../arm/mediatek/mediatek,apusys.yaml         | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,apusys.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apusys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apusys.yaml
new file mode 100644
index 000000000000..d46290548b34
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apusys.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,apusys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek APUSYS Controller
+
+maintainers:
+  - Flora Fu <flora.fu@mediatek.com>
+
+description:
+  The Mediatek apusys controller provides functional configurations and clocks
+  to the system.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8192-apu-mbox
+          - mediatek,mt8192-apu-conn
+          - mediatek,mt8192-apu-vcore
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
+    apu_mbox: apu_mbox@19000000 {
+        compatible = "mediatek,mt8192-apu-mbox", "syscon";
+        reg = <0x19000000 0x1000>;
+    };
+
+  - |
+    apu_conn: apu_conn@19020000 {
+        compatible = "mediatek,mt8192-apu-conn", "syscon";
+        reg = <0x19020000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    apu_vcore: apu_vcore@19029000 {
+        compatible = "mediatek,mt8192-apu-vcore", "syscon";
+        reg = <0x19029000 0x1000>;
+        #clock-cells = <1>;
+    };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
