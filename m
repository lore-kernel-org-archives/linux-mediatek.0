Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA40CF6491
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 08:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4IuKCJoWzdo/6tX2Pw5AgRGRlw9O8xJDbg1miK4gOrA=; b=ktieyOohrqpVHqK+q43d0EFr3/
	qqBkaAJUuOtN7Z5Hnkmd67nqEgfSJ8l0ZyiPGLicnF8FlUaIHXXsWvb54xs4XhZPmDC/oVZf3Zd1e
	Mmg/pqOeOJVnUCPhKFljO447Fjya8FLJ4IfCy7nPxkB8/kcFUnUxaDz1gWkie7It/9/qPAHZGvfpN
	B7E2r8kTPCGTThpM/8fz52OvJhL6cqWFqlNH1zsQqHTKdI5dhWK2e098ZWvCwINiqGj4qblv7hprN
	GF61chMpmo6DhglqOEoA0D8RK4L8RtwnktUOrcqGaHdBLt5xeYQSbrebylpnaXEdSl6EG9XpXJ/0x
	l4YDVBjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svC1i-0000000GNav-0acr;
	Mon, 30 Sep 2024 08:45:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svBvy-0000000GLrq-16Q4;
	Mon, 30 Sep 2024 08:39:12 +0000
X-UUID: 73d468007f0711efb3adad29d29602c1-20240930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=4IuKCJoWzdo/6tX2Pw5AgRGRlw9O8xJDbg1miK4gOrA=;
	b=M+uCJd8TdpPkBbylY+troQmaBa8PDzmWqxiMhBkoC60QZH7CSyln2lj8gaAvuNIlh4RJ1ArKSyyYMqknhjyrycBWsPGw73mVy37dkDANepACNVO8DhGQji/H8wJcU2zDd+cOuW2MbTnY5j2bE1CNnDwXWD4PH8oO8cAKj6Sge1M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:f3021ed2-e06a-4bd1-afd6-dd8a16111201,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:c59f7818-b42d-49a6-94d2-a75fa0df01d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 73d468007f0711efb3adad29d29602c1-20240930
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1986694525; Mon, 30 Sep 2024 01:39:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 30 Sep 2024 16:38:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 30 Sep 2024 16:38:59 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>, "Joerg
 Roedel" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
	<robin.murphy@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rohit
 Agarwal" <rohiagar@chromium.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, Alexandre Mergnat
	<amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, "Sen
 Chu" <sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
Subject: [PATCH v4 2/5] dt-bindings: iommu: mediatek: Fix interrupt count constraint for new SoCs
Date: Mon, 30 Sep 2024 16:38:51 +0800
Message-ID: <20240930083854.7267-2-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240930083854.7267-1-macpaul.lin@mediatek.com>
References: <20240930083854.7267-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10-0.066800-8.000000
X-TMASE-MatchedRID: 6VS/gXvOej7wBTQ+XvV6VYzb2GR6Ttd3YQXxsZnRwoIY0A95tjAn+9EQ
	LJPlYQqE0KHDXPxFjpCs8FHZk8InNB1YpEPWJiyzKaMQ6tw7oDLFUZ7q8HqQFFwpnAAvAwazMq+
	en+OaNuuJTSQ4G0hWQKE5/zgY/QEPEJ5+KkdAau4CNMj/7qB/g9KVa2W234pInLVhzy0+RX3vv/
	IA2HPk+BmgGxBaKosCumMCMwce1mUfE8yM4pjsDwtuKBGekqUpUfEQFBqv0mf6BLxMbKNKofiYv
	kPboinq+lntxotXEOKl8iXdC/JPodE2sd0En/ZTPssWDagviKmo0yLXtfRrTamy9MoOsRvVf9aG
	99lhLx/yNp7g4PXe0BXsxz6ujBxUq1f8XSkHBUmNJXmEMVvLtmibAjrSm2HJwL6SxPpr1/I=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-0.066800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: BAB5FEF623D5FE6F7C836EADEACAB6F65D86D69A811BF108131AC4EA26F6FB792000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_013910_342468_475B85D7 
X-CRM114-Status: GOOD (  13.52  )
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

The infra-iommu node in mt8195.dtsi was triggering a CHECK_DTBS error due
to an excessively long 'interrupts' property. The error message was:

  infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0],
                     [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]]
                     is too long

To address this issue, update the compatbile matching rule for
'interrupts' property. This change allows flexibility in the number
of interrupts for new SoCs like MT8195.
The purpose of these 5 interrupts is also added into description.

Fixes: bca28426805d ("dt-bindings: iommu: mediatek: Convert IOMMU to DT schema")
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 .../bindings/iommu/mediatek,iommu.yaml        | 28 ++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

Changes for v2:
 - commit message: re-formatting and add a description of adding 5 interrupts.
 - add 'description' and 'maxItems: 5' for 'interrupt' property of
   'mt8195-iommu-infra'
 - others keeps 'maxItems: 1'

Changes for v3:
 - Refine the description for 'interrupts' property and fixes the compatible
   matching rules.
 - Refine commit message.

Changes for v4:
  - add missing 'minItems: 5' to 'mediatek,mt8195-iommu-infra'.
    Thanks the explanation from Conor and Krzysztof. 

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index ea6b0f5f24de..33b330d83e01 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -96,7 +96,15 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    description: |
+      Usually, the IOMMU requires only 1 interrupt.
+
+      The IOMMU of MT8195 has 5 banks: 0/1/2/3/4.
+      Each bank has a set of APB registers corresponding to the
+      normal world, protected world 1/2/3, and secure world, respectively.
+      Therefore, 5 interrupt numbers are needed for MT8195.
+    minItems: 1
+    maxItems: 5
 
   clocks:
     items:
@@ -210,6 +218,24 @@ allOf:
       required:
         - mediatek,larbs
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8195-iommu-infra
+
+    then:
+      properties:
+        interrupts:
+          minItems: 5
+          maxItems: 5
+
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.45.2


