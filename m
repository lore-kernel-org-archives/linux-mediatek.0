Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D4CC52D6F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Aug 2024 08:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRroNHsS4kq/bMO8WRnvcohyyXmbFWhG9LUftxAm+Co=; b=fFNz4NXxLgw06stDaRfMyrTIjU
	/XojgsrR5svfJSRIOAVSWuAjp7nzxnULfwGV0g56J0239cVV7kPKEFG9isRTvfswF09/KfXmyLQtB
	/A2t86Ar7Zz0bXDHswHeZtkwku0SZGkFk4JERD8DF3QrUsBTVED3/VVNePcsE0zEAo6JxheQfmNLX
	SvRaJfD2UboQ0BBs5fnncVQhTrROBQAvALtX15TfWl1yueMWG9rFHL5mt4z9fs47yjFBjLKin9bqy
	DHQQUOCJSumSa2WDQFfb7kvgKLmGTaGFRh/z6b1O5GZBG7cI803KUrZKy1IN7iyh6Esc1FSlZSgcn
	ExMQcE4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sggnp-000000085sC-3g1x;
	Wed, 21 Aug 2024 08:34:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sggio-000000084IN-3RAJ;
	Wed, 21 Aug 2024 08:29:40 +0000
X-UUID: 7e3a168a5f9711efb3adad29d29602c1-20240821
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=jRroNHsS4kq/bMO8WRnvcohyyXmbFWhG9LUftxAm+Co=;
	b=WnKNyyQL5bEzDIVBV1CCGSwCdZnYj/+jk/sGMHwvN+6PODF/kDxmO0cCGyUK8PzYxRC+K21tGyjiXbHKX0L378L9mKZ4en/l8WDXZoKr2Fl+/eIFD5+FNO5PscF84ndDVTOC26v96enXo0dtUeVc45TgH/JrWKAg4XY8KuIQWz4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:4a2a67ac-8cb6-46b2-af3e-e2428cbc7d8e,IP:0,U
	RL:25,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:6dc6a47,CLOUDID:6fe4ca5b-248b-45cb-bde8-d789f49f4e1e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 7e3a168a5f9711efb3adad29d29602c1-20240821
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 448165403; Wed, 21 Aug 2024 01:29:33 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 21 Aug 2024 16:28:55 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 21 Aug 2024 16:28:54 +0800
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
Subject: [PATCH 1/4] dt-bindings: memory: mediatek: Add mt8188 SMI reset control binding
Date: Wed, 21 Aug 2024 16:26:49 +0800
Message-ID: <20240821082845.11792-2-friday.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821082845.11792-1-friday.yang@mediatek.com>
References: <20240821082845.11792-1-friday.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.829500-8.000000
X-TMASE-MatchedRID: R3B6Edw+gpAxFdXyW/P+XcnUT+eskUQPLEOkDuO6MI8km/L/MIL+8pM5
	rPAxB6p1lTJXKqh1ne1M8qdoCvOVvms/tFw6ZTQWuIwLnB3Aqp2WHGENdT+VP5uc2X2zst+xDrG
	3Q1PIT6iJh4lfRksIUHAdyhB0oDzs9mia1kFQhdCQ+GmkZu94cv+UEb65dgmQ+5+93dPb6/eAzY
	IjHF+VJeLzNWBegCW2U9w4XVXDWCYLbigRnpKlKTpcQTtiHDgWQxitkXat1SEypeIkTB5qDJNG+
	ExD2vU/Pay9KaxQKp7x9BkkBFqz7g==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.829500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: BBD090C5ECD942BC4A586DC9F9181C138D2C8BE75586C512F0FFFF14353E0B132000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_012938_931109_30F12C55 
X-CRM114-Status: GOOD (  15.45  )
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

To support SMI clamp and reset operation in genpd callback, add
SMI LARB reset register offset and mask related information in
the bindings. Add index in mt8188-resets.h to query the register
offset and mask in the SMI reset control driver.

Signed-off-by: friday.yang <friday.yang@mediatek.com>
---
 .../bindings/reset/mediatek,smi-reset.yaml    | 46 +++++++++++++++++++
 include/dt-bindings/reset/mt8188-resets.h     | 11 +++++
 2 files changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/mediatek,smi-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/mediatek,smi-reset.yaml b/Documentation/devicetree/bindings/reset/mediatek,smi-reset.yaml
new file mode 100644
index 000000000000..66ac121d2396
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/mediatek,smi-reset.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2024 MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/mediatek,smi-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek SMI Reset Controller
+
+maintainers:
+  - Friday Yang <friday.yang@mediatek.com>
+
+description: |
+  This reset controller node is used to perform reset management
+  of SMI larbs on MediaTek platform. It is used to implement various
+  reset functions required when SMI larbs apply clamp operation.
+
+  For list of all valid reset indices see
+    <dt-bindings/reset/mt8188-resets.h> for MT8188.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,smi-reset-mt8188
+
+  "#reset-cells":
+    const: 1
+
+  mediatek,larb-rst-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle of the SMI larb's reset controller syscon.
+
+required:
+  - compatible
+  - "#reset-cells"
+  - mediatek,larb-rst-syscon
+
+additionalProperties: false
+
+examples:
+  - |
+    imgsys1_dip_top_rst: reset-controller {
+          compatible = "mediatek,smi-reset-mt8188";
+          #reset-cells = <1>;
+          mediatek,larb-rst-syscon = <&imgsys1_dip_top>;
+    };
diff --git a/include/dt-bindings/reset/mt8188-resets.h b/include/dt-bindings/reset/mt8188-resets.h
index 5a58c54e7d20..387a4beac688 100644
--- a/include/dt-bindings/reset/mt8188-resets.h
+++ b/include/dt-bindings/reset/mt8188-resets.h
@@ -113,4 +113,15 @@
 #define MT8188_VDO1_RST_HDR_GFX_FE1_DL_ASYNC	52
 #define MT8188_VDO1_RST_HDR_VDO_BE_DL_ASYNC	53
 
+#define MT8188_SMI_RST_LARB10			0
+#define MT8188_SMI_RST_LARB11A			1
+#define MT8188_SMI_RST_LARB11C			2
+#define MT8188_SMI_RST_LARB12			3
+#define MT8188_SMI_RST_LARB11B			4
+#define MT8188_SMI_RST_LARB15			5
+#define MT8188_SMI_RST_LARB16B			6
+#define MT8188_SMI_RST_LARB17B			7
+#define MT8188_SMI_RST_LARB16A			8
+#define MT8188_SMI_RST_LARB17A			9
+
 #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8188 */
-- 
2.46.0


