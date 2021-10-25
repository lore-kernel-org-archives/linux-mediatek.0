Return-Path: <SRS0=S3hZ=PN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5694FC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 11:01:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11754604AC
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 11:01:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11754604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mHYeY2ANGnSFShaKrocESg/kpMARUEfjqj25TFbDFzg=; b=I0ziK1Hy4RhIap
	LbUsJkp52GK6WwMntzfTifCrwZmGV+77NRa88Vy1/uSahL7EaCBqe4C90YDDV+QhWkavyv+LqXc8g
	D4ka7L3WY6o+Dmjv+QWDV/xKQBQlulp4gqEtaXEKBC5IJ5NDg8aArwMNtugsGMbuRi8JYbJnq4D4v
	BQpzXU+5MwXxjF3Id8f8//Exr7upPQv8wGDkCiO7N/4EpOR1elsPLZVtupQJljz/Dlcxhko2Tak8G
	hE709lj6gbbwfsQ1yTkoGgwydThPfICqqqMLGxnyF6tyvbxUigj7tkWMY6D0PDkLWRAU+BjjMMEER
	ufsbH3cJrvse12A6f6DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mexjK-00GBlJ-36; Mon, 25 Oct 2021 11:01:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mexf6-00G9si-Qi; Mon, 25 Oct 2021 10:57:06 +0000
X-UUID: 368813ed983e4923824fe6f4d5a6ab7b-20211025
X-UUID: 368813ed983e4923824fe6f4d5a6ab7b-20211025
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yc.hung@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 734417538; Mon, 25 Oct 2021 03:56:58 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 Oct 2021 03:56:57 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 25 Oct 2021 18:56:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 25 Oct 2021 18:56:51 +0800
From: YC Hung <yc.hung@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <yc.hung@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <daniel.baluta@nxp.com>, <trevor.wu@mediatek.com>,
 <allen-kh.cheng@mediatek.com>, <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 2/2] dt-bindings: dsp: mediatek: Add mt8195 DSP binding
 support
Date: Mon, 25 Oct 2021 18:56:35 +0800
Message-ID: <20211025105635.30625-3-yc.hung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211025105635.30625-1-yc.hung@mediatek.com>
References: <20211025105635.30625-1-yc.hung@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_035704_928732_36784117 
X-CRM114-Status: GOOD (  12.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This describes the mt8195 DSP device tree node.

Signed-off-by: YC Hung <yc.hung@mediatek.com>
---
 .../bindings/dsp/mtk,mt8195-dsp.yaml          | 139 ++++++++++++++++++
 1 file changed, 139 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml

diff --git a/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml b/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
new file mode 100644
index 000000000000..f113f71ca094
--- /dev/null
+++ b/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
@@ -0,0 +1,139 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dsp/mtk,mt8195-dsp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek mt8195 DSP core
+
+maintainers:
+  - YC Hung <yc.hung@mediatek.com>
+
+description: |
+  Some boards from mt8195 contain a DSP core used for
+  advanced pre- and post- audio processing.
+properties:
+  compatible:
+    const: mediatek,mt8195-dsp
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: mux for audio dsp clock
+      - description: 26M clock
+      - description: mux for audio dsp local bus
+      - description: default audio dsp local bus clock source
+      - description: clock gate for audio dsp clock
+      - description: mux for audio dsp access external bus
+
+  clock-names:
+    items:
+      - const: adsp_sel
+      - const: clk26m_ck
+      - const: audio_local_bus
+      - const: mainpll_d7_d2
+      - const: scp_adsp_audiodsp
+      - const: audio_h
+
+  power-domains:
+    maxItems: 1
+
+  mboxes:
+    maxItems: 2
+
+  mbox-names:
+    description:
+      Specifies the mailboxes used to communicate with audio DSP
+    items:
+      - const: mbox0
+      - const: mbox1
+
+  memory-region:
+    description:
+      phandle to a node describing reserved memory (System RAM memory)
+      used by DSP (see bindings/reserved-memory/reserved-memory.txt)
+    maxItems: 2
+
+  sound:
+    description:
+      Sound subnode includes ASoC platform, DPTx codec node, and
+      HDMI codec node.
+
+    type: object
+
+    properties:
+      mediatek,platform:
+        $ref: "/schemas/types.yaml#/definitions/phandle"
+        description: The phandle of MT8195 ASoC platform.
+
+      mediatek,dptx-codec:
+        $ref: "/schemas/types.yaml#/definitions/phandle"
+        description: The phandle of MT8195 Display Port Tx codec node.
+
+      mediatek,hdmi-codec:
+        $ref: "/schemas/types.yaml#/definitions/phandle"
+        description: The phandle of MT8195 HDMI codec node.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - memory-region
+  - power-domains
+  - mbox-names
+  - mboxes
+  - sound
+
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    adsp: adsp@10803000 {
+       compatible =  "mediatek,mt8195-dsp";
+       reg = <0x10803000  0x1000>,
+             <0x10840000  0x40000>;
+       reg-names = "cfg", "sram";
+       interrupts = <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH 0>;
+       interrupt-names = "wdt";
+       clocks = <&topckgen 10>, //CLK_TOP_ADSP
+                <&clk26m>,
+                <&topckgen 107>, //CLK_TOP_AUDIO_LOCAL_BUS
+                <&topckgen 136>, //CLK_TOP_MAINPLL_D7_D2
+                <&scp_adsp 0>, //CLK_SCP_ADSP_AUDIODSP
+                <&topckgen 34>; //CLK_TOP_AUDIO_H
+       clock-names = "adsp_sel",
+                     "clk26m_ck",
+                     "audio_local_bus",
+                     "mainpll_d7_d2",
+                     "scp_adsp_audiodsp",
+                     "audio_h";
+       memory-region = <&adsp_dma_mem_reserved>,
+                       <&adsp_mem_reserved>;
+       power-domains = <&spm 6>; //MT8195_POWER_DOMAIN_ADSP
+       mbox-names = "mbox0", "mbox1";
+       mboxes = <&adsp_mailbox 0>, <&adsp_mailbox 1>;
+       status = "disabled";
+       sound {
+              mediatek,dptx-codec = <&dp_tx>;
+              mediatek,hdmi-codec = <&hdmi0>;
+              mediatek,platform = <&afe>;
+             };
+       };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
