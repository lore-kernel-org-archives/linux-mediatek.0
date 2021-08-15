Return-Path: <SRS0=EFw0=NG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 567ACC4338F
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Aug 2021 14:57:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 139276115C
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Aug 2021 14:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 139276115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pjuOQKGmYAUA9MSSk6i7CW4XhLq+dTbLpTPNIdwWFhs=; b=OUVqp7bM4PpDCP
	UtAWjoMmTlCZyEsjAEEdY/Wka7vu9YxWabf/ir1wpnUNYblatKwk3+A20YfZ3DvG/87MxtUh8ZBij
	77QkJ5/gdwR7hFedKdEEVFfTx2WAJzQTQZ/hS+Yq81MILCrD4dfm+ozrl+jJeFqaEJ22WCs3oloau
	uWTwuzj4GTeX8FZcG5W7uDnEoOfeYXhLvfb9e/LMJ/e4I1CsuKJG88yHEp5nYvWigtHfRRIUT6xxA
	VXd604jmoVWDq32J3aT4eCFmLTT+UTN7YnyCwLEW18AllXnqM/GAW5qpqmCUrTK23HzdANS5WqBTL
	SkQ3lIBWlzRhJypUXcYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFHZw-00FLv1-35; Sun, 15 Aug 2021 14:57:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFHYr-00FLVR-4A; Sun, 15 Aug 2021 14:56:33 +0000
X-UUID: c79129db50a24f3380b8c36d1ebb100c-20210815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=NiP/PyAF0zjYYuodQ4hnfPoqd+QSrCpP6Fc/6FavYjE=; 
 b=u//40afTn1kXfsoJPcMmH5Ek2zkAK4DOCd5Zwt/tzCZfup9gy9WLAbLvKWqRtLc7/lpLW+TBGlvXO7R36RHeKrnxw+ksBxXZD/lyzIZQDBeeMJwewE4JdmD0F/oiXXBEpT+FTOlOLIHcQ8erkuH6AX39dO6h4LbaOVyJ4Z6i2C0=;
X-UUID: c79129db50a24f3380b8c36d1ebb100c-20210815
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1975305241; Sun, 15 Aug 2021 07:56:18 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Aug 2021 07:56:17 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Aug 2021 22:56:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 15 Aug 2021 22:56:15 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, <fshao@chromium.org>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Fabien
 Parent" <fparent@baylibre.com>, <hsinyi@chromium.org>, "jason-jh . lin"
 <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 03/13] dt-bindings: mediatek: add mediatek,
 dsc.yaml for mt8195 SoC binding
Date: Sun, 15 Aug 2021 22:56:00 +0800
Message-ID: <20210815145610.2050-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210815145610.2050-1-jason-jh.lin@mediatek.com>
References: <20210815145610.2050-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_075629_220349_2D5F584B 
X-CRM114-Status: GOOD (  14.66  )
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
---
 .../display/mediatek/mediatek,dsc.yaml        | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
new file mode 100644
index 000000000000..f94a95c6a1c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: mediatek display DSC controller
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
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
+      description:
+        The register of display function block to be set by gce. There are 4 arguments,
+        such as gce node, subsys id, offset and register size. The subsys id that is
+        mapping to the register of display function blocks is defined in the gce header
+        include/include/dt-bindings/gce/<chip>-gce.h of each chips.
+      $ref: /schemas/types.yaml#/definitions/phandle-array
+      maxItems: 1
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
+
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
