Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07D6C4706C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 09:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CsDipHrMcSMQZ5T1xzar/uAvtmPl0zEeVcCMjR5KaC0=; b=owSUuETRsxZM94yNVCvVljIjhp
	rqpxjyi4f8svqs6NTgQr4j7p9SNhOR8lo11NabyceEDy9olaLXCrHv95P2VZnM+jcIJUnFAsu/TUt
	ZHDepx6zvQGTG/pQOsqkwe61vgAuvbOAzVyJjhXaeSzWQODiiJgWKWp7YOdotnA4jox7TkM+fQwzR
	IpZDOwxBtPNLR8bkifPYAQwNAjo3YQtSwV0nZbe78JmU6Qu3rfdmsS7kqYkKmkwxtMwA1ZQKSuIHa
	WJWgIVBSD+6FvZVLvuQznC8nns9fiVNFVjF1h2hMK4ZW4Jn58j0+K8+eSyyStsXBiMG+r2MGmpT70
	QlOSd7kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rODj4-002IEK-2Q;
	Fri, 12 Jan 2024 09:21:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rODj1-002ICZ-1m;
	Fri, 12 Jan 2024 09:21:17 +0000
X-UUID: ed43dbbcb12b11ee9a662f17bb45267e-20240112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=CsDipHrMcSMQZ5T1xzar/uAvtmPl0zEeVcCMjR5KaC0=;
	b=NYil9XfQ59lQJZnRBfKxJX4IprCQ+NqbmOVP0ER+PCCi6z58brkkuvS6WzvMLOzUV/aumuzlWaQvV3VsFtP+vHWAgm1Nmp9ief31omekrHLuATa4xbGWh5N3flygjEsku9JtliN1xAuypamveEmKz8kYUubTPryIIsP7j5cE1Bk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:bd3d6d82-8617-4c51-af95-9ade720a0a68,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:5d391d7,CLOUDID:c0a5182f-1ab8-4133-9780-81938111c800,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: ed43dbbcb12b11ee9a662f17bb45267e-20240112
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 780378147; Fri, 12 Jan 2024 02:21:11 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 12 Jan 2024 17:20:37 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 Jan 2024 17:20:35 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <christian.koenig@amd.com>, Sumit Semwal
	<sumit.semwal@linaro.org>
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
	<ppaalanen@gmail.com>, <jianjiao.zeng@mediatek.com>,
	<kuohong.wang@mediatek.com>, <youlin.pei@mediatek.com>
Subject: [PATCH v4 1/7] dt-bindings: reserved-memory: Add mediatek,dynamic-restricted-region
Date: Fri, 12 Jan 2024 17:20:08 +0800
Message-ID: <20240112092014.23999-2-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240112092014.23999-1-yong.wu@mediatek.com>
References: <20240112092014.23999-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.946300-8.000000
X-TMASE-MatchedRID: YXgS1C6OPWwxaBEU4bKrV8LPXKYZysJRecvjbu/xDjpMOjKUxCZwr6oy
	tXMP4p4T7Oz5SO8AjrT8deRGOD4hQJ/vdeQQfVo4zfqlpbtmcWhMkOX0Uoduubuqk4cq52pzNDP
	jsaoNaOmcPcDHCp4L+uSWVqW5qzmOGHMruoCVNItsG7r4Qh7N3J15MaKbV6Qv92wasZo4p00VN8
	HXIE+U8k5/nzWZD6z607K+59sjwLdAXbiRmn1bD54CIKY/Hg3AaZGo0EeYG978V77yhJRgo99pj
	zubZ2rH33fj+sMArfMJpevTilEwkFjGlbPXfDBGCFErBhF4CgwJ/T+F/HKSEHCVsvSCvlbfzLv5
	+XaqEeZwkCae1ANnop9RAYWhalwdisxAtDy5oyiZqjnDjmy9xW1Rjoup2VCcWve+eVz4Pp5Vk5u
	tmQ1VlGVF3+d9rnoxXsgQSqx49gY=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.946300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D68D2818C77DD63E4E15ABE939F9C3F9AD0BFE5F39B89A44924D760DB8D2C71A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_012115_594445_41B3CA04 
X-CRM114-Status: GOOD (  14.00  )
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


