Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E15E7D0D8
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Sep 2023 07:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oH8Nt2FJxbSC6XlUFbOHgHkV1YGvPLdakMF+MvPR6Co=; b=Mx3SAx6Pd2VuulRyc0Rx1JB4ea
	GyThMNT1Vdww+QZKupzAuPv8/+4wQ2yeVIoyKVpiR2QgZv2sHR7ziBgl3d1Hu6b+mDW66yt0UgScq
	37WmryUObGdGEapesKpE6sFCUfJbEJ65lICrwgAcV7eyB4bqAdENs1tnclQykR/yBIobUyi+fIdMz
	TcLJ4Pd0a+vHmjl01ca9iPSweXVUFoFnlTcJSczzP3oCczhxkCCUmdyG8QzAvO3RhqsX/q7u5n/TP
	7yhX2FlbqhVsh4fuLPQtQEEuogf2n99sngaKW7jcrCDIMcNwnfckpijBb3S7gXYkoJ4YV1IFiPiTW
	d76Od1Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjaUg-008AsH-1P;
	Fri, 22 Sep 2023 07:22:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjaU8-008ATt-25;
	Fri, 22 Sep 2023 07:21:58 +0000
X-UUID: b5598474591811ee9b7791016c24628a-20230922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=oH8Nt2FJxbSC6XlUFbOHgHkV1YGvPLdakMF+MvPR6Co=;
	b=RY4Ee3rRAhXRVNI0XXlSqubgf+JmxXvvmTI8n2gSLUbQP09O4FHn6TpeXv3rclxKEgp4D1Em87PlhX5pLYit3CXvpOVOFjW4nQUEI0CQLoyr3WomDaO59aUyCad2bzVIbxbRtlZ3b/Q5eTv3UnlbPaue8T4xYSuV7NVjzdSlSQg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:f518ac6a-4995-459d-98fd-f11e1b416b94,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:5f78ec9,CLOUDID:a88c00f0-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b5598474591811ee9b7791016c24628a-20230922
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 127810786; Fri, 22 Sep 2023 00:21:55 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Sep 2023 15:21:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Sep 2023 15:21:17 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Moudy
 Ho <moudy.ho@mediatek.com>
Subject: [PATCH v6 02/16] dt-bindings: media: mediatek: mdp3: split out general properties
Date: Fri, 22 Sep 2023 15:21:02 +0800
Message-ID: <20230922072116.11009-3-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230922072116.11009-1-moudy.ho@mediatek.com>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_002156_692505_EDBF8AE2 
X-CRM114-Status: GOOD (  15.63  )
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

In order to minimize duplication and standardize the document style,
it is necessary to separate the general properties specific to
MediaTek MDP3 RDMA.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../media/mediatek,mdp3-rdma-common.yaml      | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rdma-common.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma-common.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma-common.yaml
new file mode 100644
index 000000000000..8d2085f67d43
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma-common.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Read Direct Memory Access
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+  - Moudy Ho <moudy.ho@mediatek.com>
+
+description: |
+  MediaTek Read Direct Memory Access(RDMA) component used to do read DMA.
+  It contains one line buffer to store the sufficient pixel data, and
+  must be siblings to the central MMSYS_CONFIG node.
+  For a description of the MMSYS_CONFIG binding, see
+  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+  for details.
+
+properties:
+  reg:
+    maxItems: 1
+
+  mediatek,gce-client-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      items:
+        - description: phandle of GCE
+        - description: GCE subsys id
+        - description: register offset
+        - description: register size
+    description: The register of client driver can be configured by gce with
+      4 arguments defined in this property. Each GCE subsys id is mapping to
+      a client defined in the header include/dt-bindings/gce/<chip>-gce.h.
+    maxItems: 1
+
+  mediatek,gce-events:
+    description:
+      The event id which is mapping to the specific hardware event signal
+      to gce. The event id is defined in the gce header
+      include/dt-bindings/gce/<chip>-gce.h of each chips.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 2
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  iommus:
+    maxItems: 1
+
+  mboxes:
+    minItems: 1
+    maxItems: 5
+
+  '#dma-cells':
+    const: 1
+
+required:
+  - reg
+  - mediatek,gce-client-reg
+  - power-domains
+  - clocks
+  - iommus
+  - '#dma-cells'
+
+additionalProperties: true
-- 
2.18.0


