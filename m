Return-Path: <SRS0=Ekst=DG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60DFFC4727C
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 13:48:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4FE7207C4
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 13:48:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2In42MLg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DwLJyhUo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4FE7207C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LmtAhhf54u8iRVgDXhFBbsuYbMm9/EoJTDrYBoQmPDA=; b=2In42MLgEL/DLsPb8W3iOEZMK
	Td/bsHze+RxQzmBf7NcDp50hHzTuxHTOjzmzRsvQyteQv+/oTQ7fnEN9rVhnUMsyOGJcls+897HXI
	EhLxDm1ZIatoo4zn29tQWr+Cs6sjKrSIeDdxr8AYKNLTopOuJcaC7tT7SSbBtHQnssxUKIvc4zfZV
	vdS3ydta1UZFEVpY689PhbJS11edWJDpXhAGdW0cYghPch+IwJtkfVph4pILJOA9vkfjRsx2/c/Xm
	/egIly6awe5JedK/tG+MazHXE2UOVCPurYnjbQ2gRdD2iVU5RT6U8QAN9VoTsb6/y2+pHhy1g+k8o
	S8E4PvBjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNFzQ-0006G8-8F; Tue, 29 Sep 2020 13:48:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNFyF-0005nD-Ql; Tue, 29 Sep 2020 13:47:14 +0000
X-UUID: 71c3eb74488e4d388cd164cf398f0d55-20200929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=WmWSE7IzhJl4QSCNXojtBre/0v5HhT1SrIhjLveOb40=; 
 b=DwLJyhUovKVB9chSFmABya5T24wW9pOntpI3rIuqRSBYuDnds0Msn3mVO+ESZG1L0KowBZxdkeFDuMm/q20qZD/Q+PT8+RgKyTtUDkMmVVYypscu7vf9IyrfNwpg+c9SrSgjTXGoLOw6sIyi4CyDkshyfp71RCTjOsb/AeF+fRU=;
X-UUID: 71c3eb74488e4d388cd164cf398f0d55-20200929
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 740165552; Tue, 29 Sep 2020 05:46:54 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Sep 2020 06:46:52 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Sep 2020 21:46:50 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Sep 2020 21:46:49 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [v5,1/3] dt-binding: reset-controller: mediatek: add YAML schemas
Date: Tue, 29 Sep 2020 21:46:40 +0800
Message-ID: <20200929134642.26561-2-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200929134642.26561-1-crystal.guo@mediatek.com>
References: <20200929134642.26561-1-crystal.guo@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_094708_078120_583BE1E1 
X-CRM114-Status: GOOD (  13.09  )
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
Cc: devicetree@vger.kernel.org, yong.liang@mediatek.com,
 stanley.chu@mediatek.com, srv_heupstream@mediatek.com, seiya.wang@mediatek.com,
 linux-kernel@vger.kernel.org, fan.chen@mediatek.com,
 Crystal Guo <crystal.guo@mediatek.com>, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, s-anna@ti.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a YAML documentation for Mediatek, which uses ti reset-controller
driver directly. The TI reset controller provides a common reset management,
and is suitable for Mediatek SoCs.

Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
---
 .../bindings/reset/mediatek-syscon-reset.yaml | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/mediatek-syscon-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/mediatek-syscon-reset.yaml b/Documentation/devicetree/bindings/reset/mediatek-syscon-reset.yaml
new file mode 100644
index 000000000000..dab630e95a0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/mediatek-syscon-reset.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/mediatek-syscon-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Reset Controller
+
+maintainers:
+  - Crystal Guo <crystal.guo@mediatek.com>
+
+description:
+  The bindings describe the reset-controller for Mediatek SoCs,
+  which is based on TI reset controller. For more detail, please
+  visit Documentation/devicetree/bindings/reset/ti-syscon-reset.txt.
+
+properties:
+  compatible:
+    const: mediatek,syscon-reset
+
+  '#reset-cells':
+    const: 1
+
+  mediatek,reset-bits:
+    description: >
+      Contains the reset control register information, please refer to
+      Documentation/devicetree/bindings/reset/ti-syscon-reset.txt.
+
+required:
+  - compatible
+  - '#reset-cells'
+  - mediatek,reset-bits
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/ti-syscon.h>
+    infracfg: infracfg@10001000 {
+        compatible = "mediatek,mt8192-infracfg", "syscon", "simple-mfd";
+        reg = <0 0x10001000 0 0x1000>;
+        #clock-cells = <1>;
+
+        infracfg_rst: reset-controller {
+            compatible = "mediatek,syscon-reset";
+            #reset-cells = <1>;
+            mediatek,reset-bits = <
+               0x140 15 0x144 15 0 0 (ASSERT_SET | DEASSERT_SET | STATUS_NONE)
+            >;
+        };
+    };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
