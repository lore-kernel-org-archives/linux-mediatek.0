Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6AFC25B79
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 May 2024 11:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CsDipHrMcSMQZ5T1xzar/uAvtmPl0zEeVcCMjR5KaC0=; b=uFeOkPE0q5TPu8eXW9bQ/qKowK
	p3pl/RKHJoy2ptu/TgBEIVJ8YCSroOJGZdeBQgy2Gl1gvDrqEBRQ2Hw+0gg4leKVt6Zoir5dE5SGe
	cXreqyWh6gZoERrzn6UZlq0+EYy1FxhE1e9UJL1ZO+xNm2r/ElTLZ2WHm84QdDgKoTlB8OVpxmRBa
	vUdHS3Oqu2Xhflvlo0NKcEOR5P7eh0p4EpovZM4PwLzvyJGFFV+ixwQOLa75dpViZjxdnqu+5IH5v
	aIqJ1/wfu4nZsih9zzr/TVFhWyg2XFhmL8P49F4lDp94B7lUPafNvQC4bGdrzsUYcGvmW9smtf6UM
	oV80mRGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Cjg-00000001M8D-2CMw;
	Wed, 15 May 2024 11:23:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Cjc-00000001M6M-3ZWR;
	Wed, 15 May 2024 11:23:50 +0000
X-UUID: 95f0e09c12ad11efa8f1cd58ee6c2400-20240515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=CsDipHrMcSMQZ5T1xzar/uAvtmPl0zEeVcCMjR5KaC0=;
	b=c5i5rGnnJH3cA62MBtwDtZc6hm/5liYJDd3mi5O3txRo3QBUwqth6IeDGnLCUfL3ofUnyM181II9a1vWpUTv0VpCWe4O9PPQn3H8Fyi41hHoK7C213GLoj0m7oHTVR2D0FHyK5MvsmTMNuNJ9Vmyus5vJTCAuwyQF13v6k7x2ng=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:3d71601b-16b8-4892-87bd-edee090b7d70,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:82c5f88,CLOUDID:3bc81ffc-ed05-4274-9204-014369d201e8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 95f0e09c12ad11efa8f1cd58ee6c2400-20240515
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1174990795; Wed, 15 May 2024 04:23:42 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 15 May 2024 19:23:36 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 15 May 2024 19:23:35 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <christian.koenig@amd.com>, Sumit Semwal
	<sumit.semwal@linaro.org>, Andrew Morton <akpm@linux-foundation.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
	<tjmercier@google.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yong Wu <yong.wu@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>,
	Vijayanand Jitta <quic_vjitta@quicinc.com>, Joakim Bech
	<joakim.bech@linaro.org>, Jeffrey Kardatzke <jkardatzke@google.com>, "Pavel
 Machek" <pavel@ucw.cz>, Simon Ser <contact@emersion.fr>, Pekka Paalanen
	<ppaalanen@gmail.com>, <willy@infradead.org>, Logan Gunthorpe
	<logang@deltatee.com>, Daniel Vetter <daniel@ffwll.ch>,
	<jianjiao.zeng@mediatek.com>, <kuohong.wang@mediatek.com>,
	<youlin.pei@mediatek.com>
Subject: [PATCH v5 1/9] dt-bindings: reserved-memory: Add mediatek,dynamic-restricted-region
Date: Wed, 15 May 2024 19:23:00 +0800
Message-ID: <20240515112308.10171-2-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240515112308.10171-1-yong.wu@mediatek.com>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.946300-8.000000
X-TMASE-MatchedRID: l5qCKP2S+CYxaBEU4bKrV8LPXKYZysJRecvjbu/xDjpMOjKUxCZwr6oy
	tXMP4p4T7Oz5SO8AjrT8deRGOD4hQJ/vdeQQfVo4zfqlpbtmcWhMkOX0Uoduubuqk4cq52pzNDP
	jsaoNaOmcPcDHCp4L+uSWVqW5qzmOGHMruoCVNItsG7r4Qh7N3J15MaKbV6Qv92wasZo4p00VN8
	HXIE+U8k5/nzWZD6z607K+59sjwLdAXbiRmn1bD54CIKY/Hg3AaZGo0EeYG978V77yhJRgo99pj
	zubZ2rHwrbXMGDYqV+FR9Hau8GO7oCxaPcRWGBYkik2Q7DaYM+FM1ZvdZds7crl8mP4ERMT9yXU
	za0W6DonyDffjvbK+iB9TparQODyGAhBST/DW+QK0fPSRjZItaWn1XP+V4+Y82Gj2QC3yG0smXV
	K/H8eHzG7sr7xobSAsPEFD+rZA81DDKa3G4nrLQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.946300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 92DBBFBA56F52E6A5E22EDA4524B47671DD9FFB83DFC8A6B06D3DD2320D9BA292000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_042348_918209_4A010D26 
X-CRM114-Status: GOOD (  13.93  )
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

Add a binding for describing the dynamic restricted reserved memory range.
The memory range also will be defined in the TEE firmware. It means the TEE
will be configured with the same address/size that is being set in this
DT node. Regarding to the detail TEE command, Please search
MTK_TZCMD_SECMEM_ZALLOC and MTK_TZCMD_SECMEM_FREE.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 .../mediatek,dynamic-restricted-region.yaml   | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/mediatek,dynamic-restricted-region.yaml

diff --git a/Documentation/devicetree/bindings/reserved-memory/mediatek,dynamic-restricted-region.yaml b/Documentation/devicetree/bindings/reserved-memory/mediatek,dynamic-restricted-region.yaml
new file mode 100644
index 000000000000..5cbe3a5637fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/mediatek,dynamic-restricted-region.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/mediatek,dynamic-restricted-region.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Dynamic Reserved Region
+
+description:
+  A memory region that can dynamically transition as a whole between
+  secure and non-secure states. This memory will be protected by OP-TEE
+  when allocations are active and unprotected otherwise.
+
+maintainers:
+  - Yong Wu <yong.wu@mediatek.com>
+
+allOf:
+  - $ref: reserved-memory.yaml
+
+properties:
+  compatible:
+    const: mediatek,dynamic-restricted-region
+
+required:
+  - compatible
+  - reg
+  - reusable
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        reserved-memory@80000000 {
+            compatible = "mediatek,dynamic-restricted-region";
+            reg = <0x80000000 0x18000000>;
+            reusable;
+        };
+    };
-- 
2.25.1


