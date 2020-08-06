Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D55DC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:29:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EE9822DFA
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:29:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vve8RQ20";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Qw1toxFF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EE9822DFA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iHJSZF/Rytdnr+qVzSjtgt9Qd9IugdAoGtk6Dknuj8g=; b=vve8RQ20fVk356CB8bwgivvDR
	gSfwaPzmcUSllJfsOQojGd13WUFTVVmtLKOfSykjWxbuRsUs2Cvo1qAcUEvwV17RZpF+bVdZ2cTGy
	1UBr0QtxPE/7kHxj79nqg0H6T/u+1ONqLodNZoxq+Iel3lPaiR552gEiDmsMsEBzT8jJIC9Rs+aHq
	wIkBY9LLJmfSQZeOZ6/NF26Oy5N2Ztk5rXUTqoAQCdjF/PDsyiLTU26cACAk66r5zyKdR7NHZuN0Q
	JJYOKybRYzGPJDgysw4Htxkh4yglaLt0lV/X43xZoYEMjVG4sOrBPj1cgbnyq/frZngaAPFys1aNA
	xepCHsNQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3f15-0005x9-Kq; Thu, 06 Aug 2020 12:29:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3f12-0005vO-Uz; Thu, 06 Aug 2020 12:29:02 +0000
X-UUID: af1bb32a1f0a4a81935d1aec3d68bb9a-20200806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=hq0WCel81lE8aBCRSm65DN3f8dXfFefcGZQW+R17dLo=; 
 b=Qw1toxFFQJRk4U5RlEVnIPvpq6QLiI2lBiEsNqoYb0QAWna18IDCPs6YG/zRKMe7CKFi+A6Ev5MvqwyAWyh0mP/iT0mRnuPUApLZdnOvinDQ4WwRJYe8xzIoz975e42gGedDijMgIuLeOUKCaxCCSRfdQZVvAESeVy+g7iO2el8=;
X-UUID: af1bb32a1f0a4a81935d1aec3d68bb9a-20200806
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1556981117; Thu, 06 Aug 2020 04:28:46 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 05:18:45 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 20:18:43 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 6 Aug 2020 20:18:44 +0800
From: Hector Yuan <hector.yuan@mediatek.com>
To: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "Viresh Kumar" <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang
 <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Anson Huang <Anson.Huang@nxp.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Olof Johansson <olof@lixom.net>
Subject: [PATCH v1 2/2] dt-bindings: cpufreq: add  MediaTek cpufreq bindings
Date: Thu, 6 Aug 2020 20:18:40 +0800
Message-ID: <1596716320-19811-3-git-send-email-hector.yuan@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1596716320-19811-1-git-send-email-hector.yuan@mediatek.com>
References: <1596716320-19811-1-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_082901_393786_F9EF9A7E 
X-CRM114-Status: GOOD (  16.01  )
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
Cc: hector.yuan@mediatek.com, wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Hector.Yuan" <hector.yuan@mediatek.com>

Add devicetree bindings for MediaTek HW driver.

Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
---
 .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |   56 ++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
new file mode 100644
index 0000000..2a35098
--- /dev/null
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/cpufreq/cpufreq-mediatek-hw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek's CPUFREQ Bindings
+
+maintainers:
+  - Hector Yuan <hector.yuan@mediatek.com>
+
+description:
+  CPUFREQ HW is a hardware engine used by MediaTek
+  SoCs to manage frequency in hardware. It is capable of controlling frequency
+  for multiple clusters.
+
+properties:
+  compatible:
+    const: mediatek,cpufreq-hw
+
+  reg:
+    minItems: 1
+    maxItems: 2
+    description: |
+      Addresses and sizes for the memory of the HW bases in each frequency domain.
+
+  reg-names:
+    items:
+      - const: "freq-domain0"
+      - const: "freq-domain1"
+    description: |
+      Frequency domain name.
+
+  "#freq-domain-cells":
+    const: 1
+    description: |
+      Number of cells in a freqency domain specifier.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#freq-domain-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    cpufreq_hw: cpufreq@11bc00 {
+            compatible = "mediatek,cpufreq-hw";
+            reg = <0 0x11bc10 0 0x8c>,
+                <0 0x11bca0 0 0x8c>;
+            reg-names = "freq-domain0", "freq-domain1";
+            #freq-domain-cells = <1>;
+    };
+
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
