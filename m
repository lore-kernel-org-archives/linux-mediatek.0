Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6845C52D7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Aug 2024 08:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9dWeFxAg2xqXsmzDG1ltKi5lpCetx2eU857d2YS9e1I=; b=CoSWvPol0nw8VnNNz5OJFXGUTk
	vOJcAaM3CyeavOHlNOOwIpVxJvD49g138SESRxYwx6cLJY/yJgO+mlWoVDuF86LfWkGZ9M78JnCLL
	3LpGIZ6JiC6iYL8YMpy0x2vBt6JYRq9pA84TMPALOnEKq8rO1TgmOz4Hz2dNF9WnR3WaEhgRuDs/1
	N7sMiSKFvlLK/hTKTFVQhISYDSw06QIWD90KjuHc1U3bg5sEx+Qj2myw/ZS0tIPeeauLr76xTex8j
	CXYVmKc9a4bF+YnfcgtPNlhlAYkVEzplBv3GlEvQa2EG7jgDyn9eXM/j6FBbJGaRtd+G6xLWi4AmO
	/9phVL5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sggo0-000000085wd-1aiR;
	Wed, 21 Aug 2024 08:35:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sggip-000000084Ix-1O4F;
	Wed, 21 Aug 2024 08:29:40 +0000
X-UUID: 7f67bf585f9711efba0aef63c0775dbf-20240821
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=9dWeFxAg2xqXsmzDG1ltKi5lpCetx2eU857d2YS9e1I=;
	b=R7lBLD5FfFIG3XsLBblwikB1qrejib1tlmHOPOfNqrbhR50HctKQUsJ4UaMi7dz1xE4WJhbQIMrxAez650CI3TbzNecazfxcKR7bmc0fSdyUwjt2j8ZYNl+wsqW5B4rR6ipUw6rUipGM/zMDDeUwW6AzQ8bIJhwQ1iyFPj3m/Z0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:2c7f9ded-2673-4d0c-b200-7e0ec0abb4b6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:cf90f1ce-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7f67bf585f9711efba0aef63c0775dbf-20240821
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2117590822; Wed, 21 Aug 2024 01:29:35 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 21 Aug 2024 16:29:02 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 21 Aug 2024 16:29:01 +0800
From: friday.yang <friday.yang@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Yong Wu <yong.wu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Friday Yang <friday.yang@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 2/4] dt-bindings: memory: mediatek: Add smi-sub-common property for reset
Date: Wed, 21 Aug 2024 16:26:50 +0800
Message-ID: <20240821082845.11792-3-friday.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821082845.11792-1-friday.yang@mediatek.com>
References: <20240821082845.11792-1-friday.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_012939_459924_FB9E240E 
X-CRM114-Status: GOOD (  11.48  )
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

On the MediaTek platform, some SMI LARBs are directly linked to SMI
common. While some SMI LARBs are linked to SMI sub common, then SMI
sub common is linked to SMI common. Add 'mediatek,smi-sub-comm' and
'mediatek,smi-sub-comm-in-portid' properties here. The SMI reset
driver could query which port of the SMI sub common the current LARB
is linked to through the two properties. The hardware block diagram
could be described as below.

             SMI Common(Smart Multimedia Interface Common)
                 |
         +----------------+-------
         |                |
         |                |
         |                |
         |                |
         |                |
       larb0       SMI Sub Common
                   |      |     |
                  larb1  larb2 larb3

Signed-off-by: friday.yang <friday.yang@mediatek.com>
---
 .../mediatek,smi-common.yaml                  |  2 ++
 .../memory-controllers/mediatek,smi-larb.yaml | 22 +++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
index 2f36ac23604c..4392d349878c 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
@@ -39,6 +39,7 @@ properties:
           - mediatek,mt8186-smi-common
           - mediatek,mt8188-smi-common-vdo
           - mediatek,mt8188-smi-common-vpp
+          - mediatek,mt8188-smi-sub-common
           - mediatek,mt8192-smi-common
           - mediatek,mt8195-smi-common-vdo
           - mediatek,mt8195-smi-common-vpp
@@ -107,6 +108,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - mediatek,mt8188-smi-sub-common
               - mediatek,mt8195-smi-sub-common
     then:
       required:
diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
index 2381660b324c..5f162bb360db 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
@@ -69,6 +69,16 @@ properties:
     description: the hardware id of this larb. It's only required when this
       hardware id is not consecutive from its M4U point of view.
 
+  mediatek,smi-sub-comm:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: a phandle of smi_sub_common that the larb is linked to.
+
+  mediatek,smi-sub-comm-in-portid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 7
+    description: which port of smi_sub_common that the larb is linked to.
+
 required:
   - compatible
   - reg
@@ -125,6 +135,18 @@ allOf:
       required:
         - mediatek,larb-id
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8188-smi-larb
+
+    then:
+      required:
+        - mediatek,smi-sub-comm
+        - mediatek,smi-sub-comm-in-portid
+
 additionalProperties: false
 
 examples:
-- 
2.46.0


