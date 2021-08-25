Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB66C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 14:55:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 751FB610CF
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 14:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 751FB610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=no8RjPW/KVIgyAKnfVr+8uLo/Qz4m4iu2y0ALKm9VbQ=; b=KMojIqdPCQAfQL
	3ayghKPada/kWAHQfywQ16qg3AApbnc5qXiiVfiYVDj/c94A9kIokivgXJa8KcIkCTAz/j7nxJCyA
	EFQr9NdDUYL+Io2/CzZfmiFORl48kTO8XOFNB5Cu0XeY36A30JkROB9a0+M6r61/yAUQlkd5A5yFv
	L9pvmltd/gj9gost1nE87b0wfdKWKSpvURGGGjbFD8X8j3PPtmqqYPRzt+ZVoPKHI5Hs+h8gDsL7I
	TEgxvn6herrWWf3TJERlt7KNpgKGkG8wgr/Pnioe2heDBe70s5UPcvy9FbhXqHAtlMmYjy6ufSAAd
	Gd204ptQ/pzLT/aEsFzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIuJ3-007MGV-6e; Wed, 25 Aug 2021 14:55:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIuD2-007J8K-95; Wed, 25 Aug 2021 14:49:00 +0000
X-UUID: cc53dec671664f078b6a3b90ebed7ea9-20210825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2ls3xDP2yb+Mq/KeFKWodxofGg69TdO0+13KkMhz0sM=; 
 b=KFSYk3UpbFRJRBpomVIKFCDSu5+M9f/f/5k916Pw1nN/9K7fbOwjoUfhyeakuqnPK1N0+o3UgLOrZGckIqsHo5ZoNEaI/OFzJI/WL0vWnpVGmPBULGy0k894l3A9Sl2hI2F0JxF8Vscdcu7tlrP1xUKIUeAdOBEPimIGYwkE5Mw=;
X-UUID: cc53dec671664f078b6a3b90ebed7ea9-20210825
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 670290351; Wed, 25 Aug 2021 07:48:38 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Aug 2021 07:48:37 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Aug 2021 22:48:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 25 Aug 2021 22:48:35 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>
CC: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Frank Wunderlich
 <frank-w@public-files.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Fabien Parent <fparent@baylibre.com>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Jitao shi
 <jitao.shi@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v9 05/14] dt-bindings: mediatek: display: add mt8195 SoC
 binding
Date: Wed, 25 Aug 2021 22:48:24 +0800
Message-ID: <20210825144833.7757-6-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210825144833.7757-1-jason-jh.lin@mediatek.com>
References: <20210825144833.7757-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_074856_444753_0F956761 
X-CRM114-Status: GOOD (  12.84  )
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

1. Add mt8195 SoC binding to AAL, CCORR, COLOR, DITHER, GAMMA, MERGE,
   MUTEX, OVL and RDMA yaml schema.

2. Add MERGE additional property description for mt8195
- async clock
- fifo setting enable
- reset controller

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 .../display/mediatek/mediatek,aal.yaml        |  1 +
 .../display/mediatek/mediatek,ccorr.yaml      |  2 ++
 .../display/mediatek/mediatek,color.yaml      |  1 +
 .../display/mediatek/mediatek,dither.yaml     |  5 +++
 .../display/mediatek/mediatek,gamma.yaml      |  5 +++
 .../display/mediatek/mediatek,merge.yaml      | 32 +++++++++++++++++++
 .../display/mediatek/mediatek,mutex.yaml      |  2 ++
 .../display/mediatek/mediatek,ovl.yaml        |  5 +++
 .../display/mediatek/mediatek,rdma.yaml       |  2 ++
 9 files changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index faa764c12dfc..1599184a4dd1 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -26,6 +26,7 @@ properties:
           - enum:
               - mediatek,mt2712-disp-aal
               - mediatek,mt8183-disp-aal
+              - mediatek,mt8195-disp-aal
           - enum:
               - mediatek,mt8173-disp-aal
 
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index e848879d755c..f9b697604ab9 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -22,6 +22,8 @@ properties:
     oneOf:
       - items:
           - const: mediatek,mt8183-disp-ccorr
+      - items:
+          - const: mediatek,mt8195-disp-ccorr
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index 019fc09bbddd..563755095a4f 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -36,6 +36,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8183-disp-color
+              - mediatek,mt8195-disp-color
           - enum:
               - mediatek,mt8173-disp-color
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 8e7c87c39f9c..b6f57243270c 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -23,6 +23,11 @@ properties:
     oneOf:
       - items:
           - const: mediatek,mt8183-disp-dither
+      - items:
+          - enum:
+              - mediatek,mt8195-disp-dither
+          - enum:
+              - mediatek,mt8183-disp-dither
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index 8fa1b373a8da..ab1e18da6bed 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -24,6 +24,11 @@ properties:
           - const: mediatek,mt8173-disp-gamma
       - items:
           - const: mediatek,mt8183-disp-gamma
+      - items:
+          - enum:
+              - mediatek,mt8195-disp-gamma
+          - enum:
+              - mediatek,mt8183-disp-gamma
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
index ca51a4c4a8c7..b15c6e17b421 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
@@ -22,6 +22,8 @@ properties:
     oneOf:
       - items:
           - const: mediatek,mt8173-disp-merge
+      - items:
+          - const: mediatek,mt8195-disp-merge
 
   reg:
     maxItems: 1
@@ -37,6 +39,19 @@ properties:
   clocks:
     items:
       - description: MERGE Clock
+      - description: MERGE Async Clock
+          Controlling the synchronous process between MERGE and other display function
+          blocks cross clock domain.
+
+  mediatek,merge-fifo-en:
+    description:
+      The setting of merge fifo is mainly provided for the display latency buffer.
+      to ensure that the back-end panel display data will not be underrun,
+      a little more data is needed in the fifo. According to the merge fifo settings,
+      when the water level is detected to be insufficient, it will trigger RDMA sending
+      ultra and preulra command to SMI to speed up the data rate.
+    type: boolean
+
 
   mediatek,gce-client-reg:
     description:
@@ -47,6 +62,10 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
 
+  resets:
+    description: reset controller
+      See Documentation/devicetree/bindings/reset/reset.txt for details.
+
 required:
   - compatible
   - reg
@@ -64,3 +83,16 @@ examples:
         power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
         clocks = <&mmsys CLK_MM_DISP_MERGE>;
     };
+
+    merge5: disp_vpp_merge5@1c110000 {
+        compatible = "mediatek,mt8195-disp-merge";
+        reg = <0 0x1c110000 0 0x1000>;
+        interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&vdosys1 CLK_VDO1_VPP_MERGE4>,
+                 <&vdosys1 CLK_VDO1_MERGE4_DL_ASYNC>;
+        clock-names = "merge","merge_async";
+        power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+        mediatek,gce-client-reg = <&gce1 SUBSYS_1c11XXXX 0x0000 0x1000>;
+        mediatek,merge-fifo-en = <1>;
+        resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE4_DL_ASYNC>;
+    };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
index 939dff14d989..db9db182318d 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
@@ -31,6 +31,8 @@ properties:
           - const: mediatek,mt8173-disp-mutex
       - items:
           - const: mediatek,mt8183-disp-mutex
+      - items:
+          - const: mediatek,mt8195-disp-mutex
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index a0c29cd3377a..5008f900d81f 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -32,6 +32,11 @@ properties:
               - mediatek,mt2712-disp-ovl
           - enum:
               - mediatek,mt2701-disp-ovl
+      - items:
+          - enum:
+              - mediatek,mt8195-disp-ovl
+          - enum:
+              - mediatek,mt8183-disp-ovl
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index 837659ab4ebd..806437166e3c 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -28,6 +28,8 @@ properties:
           - const: mediatek,mt8173-disp-rdma
       - items:
           - const: mediatek,mt8183-disp-rdma
+      - items:
+          - const: mediatek,mt8195-disp-rdma
       - items:
           - enum:
               - mediatek,mt7623-disp-rdma
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
