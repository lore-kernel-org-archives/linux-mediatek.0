Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74637C3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 08:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OgSW6dVNnAhswj/7R39SfuUk1XTOlWR2Zu3pfGWM3Eg=; b=B+R9hyJDnzn0ezkBpaqxL3V6UV
	eRjALefiRj+/12Lc7Nhv5L4ZJFqB2mIPO48XEMe+uzO80zo/6dQP1fqmnA9fkJwFNJx43cS50Khxh
	pRl6IqJzUz1jlMPJRjdtS0993VlfSKLPf2A5Ef8C/QriQJLKaEacFOv1dAlfeOX0EOCiqT2XZwKPX
	Xn85D4RwyNs/knyniRYcdFZq/LK2QZA6c7d/K0eONJslKTObvFb80kwS/Ptq+ocSKvKc0EXQLRhPw
	+rfodym38gBohHK84uJY46wsb2WKvjTzCvghc4wYlXMn0Xm3KhL2BdtZ2qKwxPo4jNzwPvoQpjayT
	rNU3Ju6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYiBH-0000000EEdy-2eHO;
	Tue, 30 Jul 2024 08:26:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYiA2-0000000EE3l-2CEi;
	Tue, 30 Jul 2024 08:24:49 +0000
X-UUID: 2ab83e704e4d11efa6c87f6b4542ff6b-20240730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OgSW6dVNnAhswj/7R39SfuUk1XTOlWR2Zu3pfGWM3Eg=;
	b=r/US5xdhe3zjcVnU6o5EZigh2fHSco9ACC72LTaEeDVLgeM+j5+OG3hR1jxOzrE4YLcP+Bfh2JYjFKXNMlQAYbFBMwjz6u85PqMYkvOwa2T0WIp+N9rG3JDDAbxON5k1bMzecNWOPQCogF/sRXdPPZD7Yoy6x3fbhCJNlr84/C0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:a7e7303f-af20-4f33-a4ff-9df173d9286c,IP:0,U
	RL:25,TC:0,Content:-5,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:5822e245-a117-4f46-a956-71ffeac67bfa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1,IP:nil,UR
	L:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 2ab83e704e4d11efa6c87f6b4542ff6b-20240730
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <liju-clr.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 138344989; Tue, 30 Jul 2024 01:24:40 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 30 Jul 2024 16:24:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 30 Jul 2024 16:24:36 +0800
From: Liju-clr Chen <liju-clr.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	"Catalin Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	"Steven Rostedt" <rostedt@goodmis.org>, Masami Hiramatsu
	<mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Richard Cochran <richardcochran@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Liju-clr Chen
	<Liju-clr.Chen@mediatek.com>, Yingshiuan Pan <Yingshiuan.Pan@mediatek.com>,
	Ze-yu Wang <Ze-yu.Wang@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-trace-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <PeiLun.Suei@mediatek.com>, Chi-shen Yeh
	<Chi-shen.Yeh@mediatek.com>, Kevenny Hsieh <Kevenny.Hsieh@mediatek.com>
Subject: [PATCH v12 03/24] dt-bindings: hypervisor: Add MediaTek GenieZone hypervisor
Date: Tue, 30 Jul 2024 16:24:15 +0800
Message-ID: <20240730082436.9151-4-liju-clr.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240730082436.9151-1-liju-clr.chen@mediatek.com>
References: <20240730082436.9151-1-liju-clr.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.852200-8.000000
X-TMASE-MatchedRID: 9nkzMtsPLI7HCChNBbZThW3NvezwBrVmUXlp1FHYSPVQvOmOsSGiOvpo
	C/IwAOldqznouEQxFp8YGNM7XoZ5vCCzhzaU0wjghK8o4aoss8pNedaYR0zWEeg3wNKii1r5whl
	d5aALkfjI4b5i74dtIeme0b2Wkjaj05iwHvhHt5ydVNZaI2n6/yhRWQHuJ8me/5qbzhvkAsRm+j
	6YVbX2YCsiEc3CIbVZXAa2d/45j8QGtTV246rrNLcPsR57JkIza/fioJ9l4HjczkKO5k4APgXGJ
	JNKRfMg9ySTLtgiPs+wPPg9S3J+Rda/jIZoZyKFjtK7dC6UBnmANGXBz7BHpz/90OQ2nJ+7W2os
	qlcuMzDi8zVgXoAltlPcOF1Vw1gmC24oEZ6SpSkj80Za3RRg8FR0hM9p4bA9p13SbwOLufQAVtc
	ygMZANnTu9q9rxGQ2rW7Lspl6Tvo=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.852200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 632E139271ECEFA57A57B4814670D119EE01D35F456617E2B6A5A0C9DB6C13132000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_012446_599053_440F4750 
X-CRM114-Status: GOOD (  15.34  )
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

From: Yingshiuan Pan <yingshiuan.pan@mediatek.com>

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
  without the embedded GenieZone hypervisor.[1]
- By utilizing the device tree solution, we can accurately identify the
  GenieZone hypervisor's presence without relying on hypercalls,
  ensuring a more targeted and efficient detection process that
  minimizes the risk of unintended consequences on non-GenieZone systems.

[1] https://lore.kernel.org/all/2fe0c7f9-55fc-ae63-3631-8526a0212ccd@linaro.org/

Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
Signed-off-by: Liju Chen <liju-clr.chen@mediatek.com>
---
 .../bindings/firmware/mediatek,geniezone.yaml | 34 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 35 insertions(+)
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
index a61f74e258f8..e9d600ae48bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9450,6 +9450,7 @@ GENIEZONE HYPERVISOR DRIVER
 M:	Yingshiuan Pan <yingshiuan.pan@mediatek.com>
 M:	Ze-Yu Wang <ze-yu.wang@mediatek.com>
 M:	Liju Chen <liju-clr.chen@mediatek.com>
+F:	Documentation/devicetree/bindings/firmware/mediatek,geniezone.yaml
 F:	Documentation/virt/geniezone/
 
 GENWQE (IBM Generic Workqueue Card)
-- 
2.18.0


