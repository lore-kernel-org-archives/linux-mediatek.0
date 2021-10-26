Return-Path: <SRS0=kfxU=PO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D930C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 16:03:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 237F860D43
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 16:03:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 237F860D43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0fdyXAblAttY3rgPDtVvlzXXXGxZOJM+7bDC1XKTwC4=; b=IRqTpnkDccdolP
	O5jNLUwMPzy7gsMKEFPqOiCdjj6kwcOB3lSuhSOhXIb0qhUcwHTna0fJNBata6wMzVIupHzQftQ5t
	vnGWiIZLWDTrlYTC3vBpBcxCqZHEMBAGItgmxC6iWBppT1f6eTXT1tEl35zvZmz7io/av4yZikvlP
	gWk3z5EenOWV0eljb72r6HFAfo73PbWwky07DlVNGp/K/2IcJrFwLPPm19/thU8vp+Gg8HfSv3Uk3
	8gBCBA1hT2kmxQdZBk8BvP0iprqG5e0a9sjKUbCJICYRfoXpVdJSHyQuK3OYa7O0QYpulcMO9Ejc6
	R2NyHDyXVlV268EIk75w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfOvC-002JVZ-Py; Tue, 26 Oct 2021 16:03:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfOrJ-002HXr-Ne; Tue, 26 Oct 2021 15:59:31 +0000
X-UUID: 9c07121f14c149b5a9d02cf2f649667b-20211026
X-UUID: 9c07121f14c149b5a9d02cf2f649667b-20211026
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1290520054; Tue, 26 Oct 2021 08:59:27 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Oct 2021 08:59:26 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 26 Oct 2021 23:59:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 26 Oct 2021 23:59:12 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <moudy.ho@mediatek.com>,
 <roy-cw.yeh@mediatek.com>, <jason-jh.lin@mediatek.com>, Fabien Parent
 <fparent@baylibre.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 04/16] dt-bindings: display: mediatek: dsc: add yaml for
 mt8195 SoC binding
Date: Tue, 26 Oct 2021 23:58:59 +0800
Message-ID: <20211026155911.17651-5-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211026155911.17651-1-jason-jh.lin@mediatek.com>
References: <20211026155911.17651-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_085929_820177_0A47E951 
X-CRM114-Status: GOOD (  15.43  )
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

1. Add mediatek,dsc.yaml to describe DSC module in details.
2. Add mt8195 SoC binding to mediatek,dsc.yaml.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 .../display/mediatek/mediatek,dsc.yaml        | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
new file mode 100644
index 000000000000..1ec083eff824
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: mediatek display DSC controller
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+description: |
+  The DSC standard is a specification of the algorithms used for
+  compressing and decompressing image display streams, including
+  the specification of the syntax and semantics of the compressed
+  video bit stream. DSC is designed for real-time systems with
+  real-time compression, transmission, decompression and Display.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: mediatek,mt8195-disp-dsc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: DSC Wrapper Clock
+
+  power-domains:
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
+  mediatek,gce-client-reg:
+    description:
+      The register of client driver can be configured by gce with 4 arguments
+      defined in this property, such as phandle of gce, subsys id,
+      register offset and size.
+      Each subsys id is mapping to a base address of display function blocks
+      register which is defined in the gce header
+      include/dt-bindings/gce/<chip>-gce.h.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+
+    dsc0: disp_dsc_wrap@1c009000 {
+        compatible = "mediatek,mt8195-disp-dsc";
+        reg = <0 0x1c009000 0 0x1000>;
+        interrupts = <GIC_SPI 645 IRQ_TYPE_LEVEL_HIGH 0>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+        clocks = <&vdosys0 CLK_VDO0_DSC_WRAP0>;
+        mediatek,gce-client-reg = <&gce1 SUBSYS_1c00XXXX 0x9000 0x1000>;
+    };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
