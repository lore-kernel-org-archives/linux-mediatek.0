Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CECEE92FF1
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Oct 2023 07:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XD7Kji7ciP/fwwyRVZtec3ggSG5HKczsfxe/WsQLylg=; b=DHOpczzcWowdaMclSsr5s3sC8P
	oqWWTUZUjLIJwf3QoYNJa5RMVWyEC+0IT3lJDbF6APH9NXpHP1xtwqLNdHioulcr2IRJfkiwWPXQj
	e/86zrM9jFlKPee1IVDEMFXAyK84fSVGYb7Iq9iB3IRXafibwba3JEUd9Rj/30qdElN074iWSkVWx
	KAJ99NqteprdDODJQ2SMABSlnNk69wPe9RaNcfc+B376t1Fat6qqnHfLPsMzNOyGkkCjhZi2bqdTt
	wXeTuL8mRx3i+UBOX1KvKMjjxAiRuSVLMdtSfTXuWRwzFNPDwhMvU4pgdRpw0fiKjm5d1JIzQR/Lk
	lzXaHKJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qofRA-005B7q-2M;
	Fri, 06 Oct 2023 07:39:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qofR4-005B1a-1V;
	Fri, 06 Oct 2023 07:39:50 +0000
X-UUID: 82ed9b52641b11ee86758d4a7c00f3a0-20231006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=XD7Kji7ciP/fwwyRVZtec3ggSG5HKczsfxe/WsQLylg=;
	b=RBmcc9OJq+EHQJyB+VGgSlfDL+chT3mwe8TfZydG1L0jwwMssVX/5iqHZdmTpOev8xtKYnwOByPgKTauxKeYg1pwJCMI8R2t5hjqsKA4xNsGQQTp074sivF2Hk8qfas2fTitQdn9kn0XzwJIGZnK6TQ4gNV3F+cB2FT8iYcKJIg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:89fbcdf7-4506-425f-908e-cd235e5fa0d0,IP:0,U
	RL:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:5f78ec9,CLOUDID:2575d7c3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 82ed9b52641b11ee86758d4a7c00f3a0-20231006
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 839252155; Fri, 06 Oct 2023 00:39:41 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 6 Oct 2023 15:38:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 6 Oct 2023 15:38:34 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	Singo Chang <singo.chang@mediatek.com>, "Nancy . Lin"
	<nancy.lin@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	"Hsiao Chien Sung" <shawn.sung@mediatek.com>
Subject: [PATCH v7 04/23] dt-bindings: display: mediatek: padding: Add MT8188
Date: Fri, 6 Oct 2023 15:38:12 +0800
Message-ID: <20231006073831.10402-5-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231006073831.10402-1-shawn.sung@mediatek.com>
References: <20231006073831.10402-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.027100-8.000000
X-TMASE-MatchedRID: 9nkzMtsPLI7yZ92BnYqk5lz+axQLnAVB6SXuwUgGH0gIgSDinsA6bIpb
	wG9fIuITLSHDQi/tZU9ZyJKwWJFJUwAwGIAo3Shb71Wx2uUbPLcT0Sn1/3AIbWHZ+cd7VyKXTo+
	d5kYVw/ElbBPuTv/lL9eHLWzVm2BdhPc4FTJN6V5LxLYX2WS87+AAYRasBjMekR+/pTNS9t0o0E
	qA13zQc0cN36UB4MN7MHwFGlhAi2EZjarFLqLUbBuZoNKc6pl+zKnr9zj6h3Hz9QBty8t029xBt
	1UDX817nXOXTNRLXkt5pD5YlcDpcqtL0wBaA/G+DB+ErBr0bANimi8LvNfmr87EPIkVcg+OWaGV
	MLZ5ERLi8zVgXoAltlPcOF1Vw1gmC24oEZ6SpSlsZUSYh+N/e1y+CBp++apoPGTyqIGg9SOvbOj
	ruqzYvxGsAoAZQYxikZYoGfUjrBk=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.027100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 9AFC50BDCCB9EE517525ABEF72E329014F3E5419632779778C12402605F5233B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_003946_536372_3CB2CEFC 
X-CRM114-Status: GOOD (  15.38  )
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

Padding is a new hardware module on MediaTek MT8188,
add dt-bindings for it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 .../display/mediatek/mediatek,padding.yaml    | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
new file mode 100644
index 000000000000..db24801ebc48
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,padding.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Display Padding
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+description:
+  Padding provides ability to add pixels to width and height of a layer with
+  specified colors. Due to hardware design, Mixer in VDOSYS1 requires
+  width of a layer to be 2-pixel-align, or 4-pixel-align when ETHDR is enabled,
+  we need Padding to deal with odd width.
+  Please notice that even if the Padding is in bypass mode, settings in
+  register must be cleared to 0, or undefined behaviors could happen.
+
+properties:
+  compatible:
+    const: mediatek,mt8188-padding
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: RDMA Clock
+
+  mediatek,gce-client-reg:
+    description:
+      GCE (Global Command Engine) is a multi-core micro processor that helps
+      its clients to execute commands without interrupting CPU. This property
+      describes GCE client's information that is composed by 4 fields.
+      1. Phandle of the GCE (there may be several GCE processors)
+      2. Sub-system ID defined in the dt-binding like a user ID
+         (Please refer to include/dt-bindings/gce/<chip>-gce.h)
+      3. Offset from base address of the subsys you are at
+      4. Size of the register the client needs
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      items:
+        - description: Phandle of the GCE
+        - description: Subsys ID defined in the dt-binding
+        - description: Offset from base address of the subsys
+        - description: Size of register
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - clocks
+  - mediatek,gce-client-reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mediatek,mt8188-clk.h>
+    #include <dt-bindings/power/mediatek,mt8188-power.h>
+    #include <dt-bindings/gce/mt8195-gce.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        padding0: padding@1c11d000 {
+            compatible = "mediatek,mt8188-padding";
+            reg = <0 0x1c11d000 0 0x1000>;
+            clocks = <&vdosys1 CLK_VDO1_PADDING0>;
+            power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+            mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX 0xd000 0x1000>;
+        };
+    };
-- 
2.18.0


