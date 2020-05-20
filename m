Return-Path: <SRS0=i2Ig=7C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07FD3C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 03:54:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC778204EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 03:54:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pmXVsJHk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="u0PHdVo7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC778204EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hhHEXJd0OdRII+u2oq1I8ngJ6+Qyq30dVZrT76xs28w=; b=pmXVsJHkYZhbpk
	Y8TEQO4MDMd3ruIcTEF7XyYcxYiXJmbcgFOmdEmZ3N591imvgsaqTHqQ8hmHAi3mbb3abFil09jBn
	x0KL7xEt/DyaLJIag0+3AFJwljSMvZtcgS6WXf6e+WNGyUN4usgLqL0Mwu0rlyEc0itOVAgttr7hS
	YWIs56rPvJuA8GuZjvWYC7v9n10Fes1CMoHaY7zY6aD0tKPB5L6PnDpOmeS3MljlB+EjAPYazLazE
	5vKQrssBwYAVtjzU8CdAraWTA9GfTXDNSP2Y7/+yaNbv3kfGI9U3na3Sof3VMgeZcN47KRDcQl726
	4ADx4UuhyI3factcdtVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbFoc-00019q-0h; Wed, 20 May 2020 03:54:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbFna-0000B7-0D; Wed, 20 May 2020 03:53:44 +0000
X-UUID: 741f67a8588145c2b774e858889033a4-20200519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=bG7r/AFnSfOWygVJK4Wk1moPOECpYXlJiZSAryERaAg=; 
 b=u0PHdVo7XqVMLO4/dEcDHgdHDdM+FUGCmNWwO2WvokZ+0khVnOfUlmFG2iDs6fVQ716RQ+s3rnnB/iPg9xC19ET0x/JDyzZg627lCaewuX+4q0WFz3hmeMakDekWGNaiE2rHr0BqDcxuPP12Yi/kVUQUcE27xo5MH97xIi4xOa4=;
X-UUID: 741f67a8588145c2b774e858889033a4-20200519
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 768780155; Tue, 19 May 2020 19:53:37 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 19 May 2020 20:43:34 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 May 2020 11:43:32 +0800
Received: from mtkslt209.mediatek.inc (10.21.15.96) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 May 2020 11:43:32 +0800
From: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, "Rob
 Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, Nishanth Menon <nm@ti.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>
Subject: [PATCH 08/12] dt-bindings: devfreq: add compatible for mt8183 cci
 devfreq
Date: Wed, 20 May 2020 11:43:03 +0800
Message-ID: <20200520034307.20435-9-andrew-sh.cheng@mediatek.com>
X-Mailer: git-send-email 2.12.5
In-Reply-To: <20200520034307.20435-1-andrew-sh.cheng@mediatek.com>
References: <20200520034307.20435-1-andrew-sh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_205342_135193_026D3C27 
X-CRM114-Status: GOOD (  11.83  )
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
Cc: devicetree@vger.kernel.org,
 "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>, srv_heupstream@mediatek.com,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This adds dt-binding documentation of cci devfreq
for Mediatek MT8183 SoC platform.

Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
---
 .../devicetree/bindings/devfreq/mt8183-cci.yaml    | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/devfreq/mt8183-cci.yaml

diff --git a/Documentation/devicetree/bindings/devfreq/mt8183-cci.yaml b/Documentation/devicetree/bindings/devfreq/mt8183-cci.yaml
new file mode 100644
index 000000000000..a7341fd94097
--- /dev/null
+++ b/Documentation/devicetree/bindings/devfreq/mt8183-cci.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/devfreq/mt8183-cci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CCI_DEVFREQ driver for MT8183.
+
+maintainers:
+  - Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
+
+description: |
+  This module is used to create CCI DEVFREQ.
+  The performance will depend on both CCI frequency and CPU frequency.
+  For MT8183, CCI co-buck with Little core.
+  Contain CCI opp table for voltage and frequency scaling.
+
+properties:
+  compatible:
+    const: "mediatek,mt8183-cci"
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: "cci"
+
+  operating-points-v2: true
+  opp-table: true
+
+  proc-supply:
+    description:
+      Phandle of the regulator that provides the supply voltage.
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - proc-supply
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+    cci: cci {
+      compatible = "mediatek,mt8183-cci";
+      clocks = <&apmixedsys CLK_APMIXED_CCIPLL>;
+      clock-names = "cci";
+      operating-points-v2 = <&cci_opp>;
+      proc-supply = <&mt6358_vproc12_reg>;
+    };
+
-- 
2.12.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
