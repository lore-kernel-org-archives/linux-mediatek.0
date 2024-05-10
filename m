Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245B6C25B10
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 May 2024 11:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kpRLxFp1HniKMgGxgeGEPO0SSPqHobCE+LsRmF4NMto=; b=GEoj1Wb3wpGl0TdweqGjbwFKLo
	k0JplWiJf3+/5JNhs+opqhQDbn8ZQcFqzCwUh1+sXWTWJWTKVNxoH3YTw97QnGxjnrKhabAYfwsBH
	yUT7SyHf0Uo5DS3Fqis7HsvRvVsCoTzY6ybYaDB8QC943XJpTxBWMDZqnr3u/sfsKG4f/QlC9Vcbr
	Pd65tP2Nq2Ig/MhWgc02vTHJn6sas+tnUnyJILKCPK/VZ9hoGtcBs8IZdJRhlw5GWHG5YJQvTyG5a
	mkT7fXab5uYtBaRDiJwidbuGU1A7ODOdXjQrdBoty7H0ZE2TPmV0DWwP8wztxkzZpRAQymP7rEW0F
	b5KQMX/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5O5L-00000004y9h-2xz9;
	Fri, 10 May 2024 11:06:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5O5I-00000004y7L-3nhW;
	Fri, 10 May 2024 11:06:42 +0000
X-UUID: 5bd78e5e0ebd11efa8f1cd58ee6c2400-20240510
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=kpRLxFp1HniKMgGxgeGEPO0SSPqHobCE+LsRmF4NMto=;
	b=pvhpW5hj2YNG0F4cXbOQvaxS1Kh8OHJ89wIUS55tbsOURE77hW3bpD8q0M3SRPeOMY4SBAVk8PdaPM1dBLePN8vH5hH9SMuUbpAMUd06ViL0vSyXO6MSm7Ji4wNBlXxa/WQJ8oebGbwsg2WxHgDt/n7lapHdOoWQNRF1f9c0z8Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:3941fdf6-cc65-4b21-8b0f-3b4caccab329,IP:0,U
	RL:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:82c5f88,CLOUDID:7715effb-ed05-4274-9204-014369d201e8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 5bd78e5e0ebd11efa8f1cd58ee6c2400-20240510
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <liankun.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2123232219; Fri, 10 May 2024 04:06:32 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 May 2024 19:05:31 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 May 2024 19:05:30 +0800
From: Liankun Yang <liankun.yang@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<chunfeng.yun@mediatek.com>, <vkoul@kernel.org>, <kishon@kernel.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<jitao.shi@mediatek.com>, <mac.shen@mediatek.com>,
	<liankun.yang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>
Subject: [PATCH v2 2/2] Add dp PHY dt-bindings
Date: Fri, 10 May 2024 19:04:15 +0800
Message-ID: <20240510110523.12524-3-liankun.yang@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240510110523.12524-1-liankun.yang@mediatek.com>
References: <20240510110523.12524-1-liankun.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_040640_956382_6CCF3FB5 
X-CRM114-Status: GOOD (  12.18  )
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

Add dp PHY dt-bindings.

Changeds in v2:
- Add dp PHY dt-bindings.
https://patchwork.kernel.org/project/linux-mediatek/patch/
20240403040517.3279-1-liankun.yang@mediatek.com/

Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
---
 .../display/mediatek/mediatek.phy-dp.yaml     | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek.phy-dp.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek.phy-dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek.phy-dp.yaml
index 000000000000..476bc329363f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek.phy-dp.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,phy-dp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Display Port Controller
+
+maintainers:
+  - Mac shen <mac.shen@mediatek.com>
+  - Liankun yang <Liankun.yang@mediatek.com>
+
+description: |
+  Special settings need to be configured by MediaTek DP based on the actual
+  hardware situation. For example, when using a certain brand's docking
+  station for display projection, garbage may appear. Adjusting the specific
+  ssc value can resolve this issue.
+
+properties:
+  status: disabled
+    description: |
+      Since the DP driver has already registered the DP PHY device
+      through mtk_dp_register_phy(), so the status is disabled.
+
+  dp-ssc-setting:
+    - ssc-delta-hbr
+    description: Specific values are set based on the actual HW situation.
+
+required:
+  - status
+  - dp-ssc-setting
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        phy-dp@1c600000 {
+          status = "disabled";
+          dp-ssc-setting {
+            ssc-delta-hbr = <0x01fe>;
+          }
+        };
+    };
-- 
2.18.0


