Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8552C4727C
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 02:22:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 720DB20874
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 02:22:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X0DL28XR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="R1Mi678o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 720DB20874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pJljRgUCut0VFNSAYKPt+61uHK9te93S+RZy/skPJq8=; b=X0DL28XRgLuojZCl4pLJLIGvs
	Fgjr2uMvphpVbhfDkSzL4n/IBD0kl5y947BP0wxfn3tnRmb4glc4HUcv56VNhyeBkS/Wn6o2P3i2f
	8fMgb9zVESjuwncd142Um5Z65yQL2mPX2VZ2OhQpRYJeX+BwxWaJHI8egJLEPXvJdz1gxOlD1nvCj
	58+OoKC74ppxq+fktT7jWLTc45TY4r5ZOjS2Dm0oATixAysFoVzUkiZf8EI8sfSSvHCa/Ps9VqGeZ
	9kIY5NYtTAp3prMhoI8erf2jMRpvXIDZu+8ZdEdI5bds6rdZLZ7MLczEFhQiF8iQ0RvAAg++BXPzR
	XJWIo1YEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNRlD-0007Uz-SL; Wed, 30 Sep 2020 02:22:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNRl3-0007Rg-7X; Wed, 30 Sep 2020 02:22:18 +0000
X-UUID: 0381abece7584958adeb8175f3c8339e-20200929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=PTUVFD+apyy6mQmY58fFDkNYQDyfBeyrLgmoDEvIU44=; 
 b=R1Mi678oPirLVImcuDo/QvjfU1NG/H5UrP0H2kOLJs4xGpWCsrTI/nCdY/W2lsbnQFf9Sgn5HqyLWVJa5hLGrLWFN4X808DdaHr5Kouhx8h/zrtiG+5SXVqfoMCY8QKiXfcxBdK3NfUbNshGNA1HJhPSiwLAHWr/brchm5iaiVo=;
X-UUID: 0381abece7584958adeb8175f3c8339e-20200929
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 898721143; Tue, 29 Sep 2020 18:22:05 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Sep 2020 19:22:02 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 10:21:59 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Sep 2020 10:22:02 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [v6,1/3] dt-binding: reset-controller: mediatek: add YAML schemas
Date: Wed, 30 Sep 2020 10:21:57 +0800
Message-ID: <20200930022159.5559-2-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200930022159.5559-1-crystal.guo@mediatek.com>
References: <20200930022159.5559-1-crystal.guo@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_222217_449916_7C2F73BE 
X-CRM114-Status: GOOD (  13.05  )
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
driver directly. The TI reset controller provides a common reset
management, and is suitable for Mediatek SoCs.

Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
---
 .../bindings/reset/mediatek-syscon-reset.yaml | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/mediatek-syscon-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/mediatek-syscon-reset.yaml b/Documentation/devicetree/bindings/reset/mediatek-syscon-reset.yaml
new file mode 100644
index 000000000000..7871550c3c69
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/mediatek-syscon-reset.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
+        reg = <0 0x10001000>;
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
