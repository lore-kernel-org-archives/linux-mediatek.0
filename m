Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718CAC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 06:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4NM4WHXvgGHuuOipCUkWTmtju1wQilBTUjr22G5ZXc=; b=qxXSxc76gA9mgwEZaWU5hzsJzs
	EObO7jlEcQyt/Oo+UNygma9r6rrQIhvzJ6PzT1NzFcHdPLjWNoP279ltVt5Dit1DdouvwEztA0wAH
	XZMLOWVGElbB69gCDO7/7zraxBTuQPYV3MwVdH+VWvpCPx3MXkHlwzAvfRep0Fmzos7on4jClw8WD
	9vN+YC8Sj7hSuEs9j6ss+giJHXEj9pXEMelMV4Zx+MCEiXSRC85PaV1TK5AWhreo+BltUZawmz2nf
	1zklyFOofZNdtZb9c+qvIz51LvwKRDlT+KQY4X5jZugnVRae174dokoLf0F2rr8ui26A/zjMsEZ+L
	vsMEGVLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNSVC-00AXgt-1O;
	Wed, 10 Jan 2024 06:55:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNSV8-00AXfc-1z;
	Wed, 10 Jan 2024 06:55:48 +0000
X-UUID: 451b4760af8511ee9a662f17bb45267e-20240109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=l4NM4WHXvgGHuuOipCUkWTmtju1wQilBTUjr22G5ZXc=;
	b=lyq1J+MuL4VGxOhFMRDfDczKJRGceE4ezVlP09ojBpDnpVwo2SUFzNsfN03r1gXLwvp8XREkKqMwxJ+GvL4DKZOwIGr9rYN+9OcNb0Qntb/kT8CBGM2Xgb4PxwgOLHsUKapzXsj20MqpsjKNiHs7ZGq6clOmzxvhE5bkTNhP6kc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:a99ffc41-920b-4514-9f58-74bc69486b36,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:5d391d7,CLOUDID:f1fa2f7f-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 451b4760af8511ee9a662f17bb45267e-20240109
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1317817472; Tue, 09 Jan 2024 23:55:41 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 Jan 2024 14:35:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 Jan 2024 14:35:33 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 1/4] dt-bindings: mailbox: Add mediatek,gce-props.yaml
Date: Wed, 10 Jan 2024 14:35:29 +0800
Message-ID: <20240110063532.14124-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240110063532.14124-1-jason-jh.lin@mediatek.com>
References: <20240110063532.14124-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.118600-8.000000
X-TMASE-MatchedRID: l/nE+SiO7IYdj9vNGYhpke7KTDtx8CggFuNF4lJG6xtnnK6mXN72myxV
	Tnd/2+hkRLNsboQSGqkAQnv84ocXVz95f95FaTdFx9eKAyUg50pbAoaK+wS4jb/tumWFs8JCABh
	pcjjrL9DibhAVW/2FX7dnCNkrUAnNBFvtFhU06+GzI1v7J4hECgrefVId6fzVt2rjS6M+VNkRgq
	CiBaeM80L/0cWZPQ9Rjo9/NbZjvDLQo7lIbG5ppGG7NUiB8AhK5eIYmexVYWNjyv+d0Z0Oxbu9b
	SM2pMfUo+XXdVMhrBMH637f7m1F7EgMxOkBoMP0QpxiLlDD9FWOJZyIAulM00oCplsay+SBo8WM
	kQWv6iVfx6Zf83Do5eTCMddcL/gjOwBXM346/+xNCCFUIgLNRA2IEnyL2YkYCcA2Po60OLvkaoX
	mWZTQJvAB0fNALMoA
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.118600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 628B0BC7F1D1E13276DE3C8EBA7E4AAAD4E305B87DE893A65D89B695D2F1A5582000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_225546_666429_22E169F3 
X-CRM114-Status: GOOD (  17.71  )
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

Add mediatek,gce-props.yaml for specific GCE properties for both
Mailbox Providers and Consumers.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 .../bindings/mailbox/mediatek,gce-props.yaml  | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml
new file mode 100644
index 000000000000..aac776b74e88
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/mediatek,gce-props.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Global Command Engine common propertes for both Mailbox Providers and Consumers.
+
+maintainers:
+  - Houlong Wei <houlong.wei@mediatek.com>
+
+description:
+  The Global Command Engine (GCE) is used to implement a Command Queue (CMDQ)
+  driver using the Linux Mailbox framework. The GCE is an instruction based,
+  multi-threaded, single-core command dispatcher for MediaTek hardware.
+  We use GCE Mailbox binding to define GCE core properties for GCE Mailbox Provider.
+  A device that uses the CMDQ driver to confige its hardware registers by requesting
+  the Linux Mailbox Channels in the GCE Mailbox Controller is a Mailbox Consumer.
+  This binding defines the common GCE properties for both Mailbox Providers and Consumers.
+
+properties:
+  mediatek,gce-events:
+    description:
+      Each gce-events is an event id corresponding to a specific hardware event
+      signal sent to GCE. The event id is defined in the GCE header
+      include/dt-bindings/gce/<chip>-gce.h of each chips.
+      CMDQ client drivers have two usage of GCE event signals,
+      one is sfotware tokens and the other is hardware events.
+      Software tokens refer to GCE event signals triggered by drivers.
+      e.g. software drivers append GCE commands to set a GCE event after specific
+      GCE commands. Or CMDQ client driver uses the CPU to write the event id
+      into GCE register to trigger the GCE event corresponding to the event id.
+      Hardware events refer to GCE event signals triggered by hardware engines.
+      e.g. When OVL fetches all the data in the frame buffer, OVL will send
+      a frame done irq and send a frame done GCE event via hardware bus directly
+      at the same time.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 1024
+
+additionalProperties: true
-- 
2.18.0


