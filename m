Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076ABC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 12:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HoABLzAGLKfDkV2ra7tswsg8BUWVedrDOTjXShYmdj8=; b=rz729T+P6sun5E
	5r+aNco+Q55Uh7hkziPm/u2BNtEjNsu5pmkQTvl61NzjG+78NyVSdOqwclv6wa0Ztf8OXKH/ZmWQJ
	th7e/CoteF5XLF5gySkbjTssHngqU2pPudStv+cw0ztw5nzbmTsFcvH0BQpRugiatioh8s85IAjfS
	qlviLHV8Dj70LtMWhtlXtgyVDHV6Se47VsqJhkXs8wSWjgHkH3AqkyDzZMrjjymfIY/O7+l7hOxhK
	pzm4QEsaJYcLHC7elPfjHv+d+XV78GnfEaBwTyQNjXpt2ovQ++AJ7YLfkxdAedYtrSynU1NtNU41y
	GhfVzgZ1+jHBErSiL13w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRCkW-00066q-7a; Mon, 07 Mar 2022 12:46:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRCXC-00015N-EM; Mon, 07 Mar 2022 12:32:19 +0000
X-UUID: bb39e17cecee4808b774fbf70fcdf087-20220307
X-UUID: bb39e17cecee4808b774fbf70fcdf087-20220307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jia-wei.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 350795103; Mon, 07 Mar 2022 05:32:13 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Mar 2022 04:22:15 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 7 Mar 2022 20:22:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Mar 2022 20:22:07 +0800
From: Tim Chang <jia-wei.chang@mediatek.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jia-Wei Chang <jia-wei.chang@mediatek.com>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <fan.chen@mediatek.com>,
 <louis.yu@mediatek.com>, <roger.lu@mediatek.com>,
 <Allen-yy.Lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
 Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
Subject: [PATCH 2/4] dt-bindings: cpufreq: mediatek: add mt8186 cpufreq
 dt-bindings
Date: Mon, 7 Mar 2022 20:21:49 +0800
Message-ID: <20220307122151.11666-3-jia-wei.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220307122151.11666-1-jia-wei.chang@mediatek.com>
References: <20220307122151.11666-1-jia-wei.chang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_043218_505648_F3B374FE 
X-CRM114-Status: GOOD (  11.35  )
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

1. add cci property.
2. add example of MT8186.

Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
---
 .../bindings/cpufreq/cpufreq-mediatek.yaml    | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.yaml
index 584946eb3790..d3ce17fd8fcf 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.yaml
@@ -48,6 +48,10 @@ properties:
       When absent, the voltage scaling flow is handled by hardware, hence no
       software "voltage tracking" is needed.
 
+  cci:
+    description:
+      Phandle of the cci to be linked with the phandle of CPU if present.
+
   "#cooling-cells":
     description:
       For details, please refer to
@@ -129,3 +133,40 @@ examples:
       /* ... */
 
     };
+
+  - |
+    /* Example 3 (MT8186 SoC) */
+    #include <dt-bindings/clock/mt8186-clk.h>
+    cluster0_opp: opp-table-0 {
+      compatible = "operating-points-v2";
+      opp-shared;
+      opp0_00: opp-500000000 {
+        opp-hz = /bits/ 64 <500000000>;
+        opp-microvolt = <600000>;
+        opp-level = <15>;
+        required-opps = <&opp2_00>;
+      };
+
+      /* ... */
+
+    };
+
+    cpus {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      cpu1: cpu@1 {
+        device_type = "cpu";
+        compatible = "arm,cortex-a55";
+        reg = <0x0100>;
+        enable-method = "psci";
+        clocks = <&mcusys CLK_MCU_ARMPLL_LL_SEL>, <&apmixedsys CLK_APMIXED_MAINPLL>;
+        clock-names = "cpu", "intermediate";
+        operating-points-v2 = <&cluster0_opp>;
+        proc-supply = <&mt6358_vproc12_reg>;
+        sram-supply = <&mt6358_vsram_proc12_reg>;
+        cci = <&cci>;
+      };
+
+      /* ... */
+
+    };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
