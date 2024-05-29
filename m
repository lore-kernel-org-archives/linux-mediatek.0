Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761D9C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 09:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mwk/tyTv9CQDrGBR2+J82VIQl88qfKTbtJvAZBieAtw=; b=W47DQTdYxnxBBSbqoQe+kA3XFf
	kWYRYyVdCg+IfNE4k2RabudjU2eQ6js0KoW0GCJWI+jGSEiGxM6/ZLmIfl95T8BUX1CKw+iTvIR4q
	0WRFLP5VDedmvIqOidyw1Cq7urZCGfO3Vl0BGDunusR0dDQkVawyqLcSlTP90EiRdLdvNK/isoSCN
	kXTNG9hOKillN2dbnJRH10MMYi3fFDN0neZPcK6ZhbWA617qR2dR8h53iMkksHSdOjZHQ5Y+VPId4
	YJNOMOi7h/uZRK3OK+GrkEnbc6GZXKuSIVJyECO0EHFULJ4P0gcK9TjWOLjXc0aCgMep2fCifsUZi
	SAt5dsFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCFsS-00000003gCA-08Wn;
	Wed, 29 May 2024 09:45:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCEtV-00000003SJ4-3SSv;
	Wed, 29 May 2024 08:42:53 +0000
X-UUID: 69fcbe621d9711efbf6c7d4f5c147266-20240529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Mwk/tyTv9CQDrGBR2+J82VIQl88qfKTbtJvAZBieAtw=;
	b=uHmGkS5EuB/f9Lb6jRlHAlPhyS2Lff2BoLLZVJJi6BFRfctpuqcSWr9IgBkVYI6R/gMul984Z1THWrsYW47g/pqdr3uXgd4j4U93nt3ZrYW8s3fU6xqZeLdT3D9F4m+xozLpuFgAnH9J24mky6zE3u2EZh3ZJ1xYnQBLovhz3FU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:8e7ec439-0c08-418d-87c1-1648847669a4,IP:0,U
	RL:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:393d96e,CLOUDID:6977f243-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 69fcbe621d9711efbf6c7d4f5c147266-20240529
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <liju-clr.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1978795764; Wed, 29 May 2024 01:42:42 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 29 May 2024 16:42:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 29 May 2024 16:42:39 +0800
From: Liju-clr Chen <liju-clr.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Steven
 Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Richard Cochran
	<richardcochran@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liju-clr Chen <Liju-clr.Chen@mediatek.com>, Yingshiuan Pan
	<Yingshiuan.Pan@mediatek.com>, Ze-yu Wang <Ze-yu.Wang@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-trace-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, David Bradil <dbrazdil@google.com>,
	Trilok Soni <quic_tsoni@quicinc.com>, Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <PeiLun.Suei@mediatek.com>, Chi-shen Yeh
	<Chi-shen.Yeh@mediatek.com>, Kevenny Hsieh <Kevenny.Hsieh@mediatek.com>
Subject: [PATCH v11 03/21] dt-bindings: hypervisor: Add MediaTek GenieZone hypervisor
Date: Wed, 29 May 2024 16:42:21 +0800
Message-ID: <20240529084239.11478-4-liju-clr.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240529084239.11478-1-liju-clr.chen@mediatek.com>
References: <20240529084239.11478-1-liju-clr.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_014249_917982_9FEF0D7D 
X-CRM114-Status: GOOD (  17.92  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yi-De Wu <yi-de.wu@mediatek.com>

From: "Yingshiuan Pan" <yingshiuan.pan@mediatek.com>

Add documentation for GenieZone(gzvm) node. This node informs gzvm
driver to start probing if proprietary geniezone hypervisor firmware is
available and capable of executing virtual machine operations.

[Reason to use dt solution]
The GenieZone hypervisor acts as a vendor firmware to enable platform
virtualization, offering an implementation that is independent of
Linux-specific implementations.
- Previously, our approach involved probing via hypercalls to detect the
  presence of our hypervisor firmware. However, this method raised
  concerns about potential impacts on all systems, including those
  without the embedded GenieZone hypervisor.
- By utilizing the device tree solution, we can accurately identify the
  GenieZone hypervisor's presence without relying on hypercalls,
  ensuring a more targeted and efficient detection process that
  minimizes the risk of unintended consequences on non-GenieZone systems.

Link: https://lore.kernel.org/all/2fe0c7f9-55fc-ae63-3631-8526a0212ccd@linaro.org/

Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
Signed-off-by: Liju Chen <liju-clr.chen@mediatek.com>
Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
---
 .../bindings/firmware/mediatek,geniezone.yaml | 34 +++++++++++++++++++
 MAINTAINERS                                   |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/firmware/mediatek,geniezone.yaml

diff --git a/Documentation/devicetree/bindings/firmware/mediatek,geniezone.yaml b/Documentation/devicetree/bindings/firmware/mediatek,geniezone.yaml
new file mode 100644
index 000000000000..9955890cb8b7
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/mediatek,geniezone.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/mediatek,geniezone.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek GenieZone hypervisor
+
+maintainers:
+  - Yingshiuan Pan <yingshiuan.pan@mediatek.com>
+
+description:
+  GenieZone is a proprietary type-II hypervisor firmware developed by MediaTek,
+  providing an isolated execution environment for mTEE (MediaTek Trusted
+  Execution Environment) and AVF (Android Virtualization Framework) virtual
+  machines. This binding facilitates the integration of GenieZone into the
+  Android Virtualization Framework (AVF) with Crosvm as the VMM. The driver
+  exposes hypervisor control interfaces to the VMM for managing virtual
+  machine lifecycles and assisting virtual device emulation.
+
+properties:
+  compatible:
+    const: mediatek,geniezone
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    hypervisor {
+        compatible = "mediatek,geniezone";
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 59481b0764d6..f42bd174caad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9273,7 +9273,8 @@ F:	lib/vdso/
 GENIEZONE HYPERVISOR DRIVER
 M:	Yingshiuan Pan <yingshiuan.pan@mediatek.com>
 M:	Ze-Yu Wang <ze-yu.wang@mediatek.com>
-M:	Yi-De Wu <yi-de.wu@mediatek.com>
+M:	Liju Chen <liju-clr.chen@mediatek.com>
+F:	Documentation/devicetree/bindings/firmware/mediatek,geniezone.yaml
 F:	Documentation/virt/geniezone/
 
 GENWQE (IBM Generic Workqueue Card)
-- 
2.18.0


