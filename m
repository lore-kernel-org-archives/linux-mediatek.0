Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07BBAC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jan 2022 10:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/BSo02leHw7aKbMGU9N0pwatt8BgljgkHUPt1s7vXMM=; b=DjDRzuWDCtzExN
	cowtCpnyUGoNYX3RRqiG0ZuSVs98/vfLB903DS1ITkb7LDuoEGMKUufJL91CcJ/Vecj7Qn/AMEMXK
	K1WI4ZQEqZp87sdhnTJyHE9Aj+/P9wIN09DGSIeHhrFIwjp+kHhU0KtQf5OUEgKVgfNNeqmLnNHTb
	AB3uZjJV9k90IqAXvz7tv8+2lIrIOCS9Qv/HSv4PraekdgtF8qRkaHWAJfc5lGZWSR9zg8aOXDax7
	brUKrXn/O+Dl1A7YMPlZ90AUblxwEj+GpKNN6NqhDee36GMUwH8fKJCovSM9RvbyQSwv0eQRLqgTH
	h0OtZlwi5+ePM/msOMiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5mR0-003L4q-Kc; Fri, 07 Jan 2022 10:25:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5mQT-003Koh-0H; Fri, 07 Jan 2022 10:24:50 +0000
X-UUID: 90b977c1b4bf49f4951d95809fad6d6e-20220107
X-UUID: 90b977c1b4bf49f4951d95809fad6d6e-20220107
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1291985034; Fri, 07 Jan 2022 03:24:44 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 Jan 2022 02:14:42 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 7 Jan 2022 18:14:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 7 Jan 2022 18:14:28 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v14 05/12] dt-bindings: display: mediatek: merge: add
 additional prop for mt8195
Date: Fri, 7 Jan 2022 18:14:18 +0800
Message-ID: <20220107101425.6917-6-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220107101425.6917-1-jason-jh.lin@mediatek.com>
References: <20220107101425.6917-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_022449_076539_1D79C799 
X-CRM114-Status: GOOD (  11.64  )
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
Cc: devicetree@vger.kernel.org, Jitao shi <jitao.shi@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 Fabien Parent <fparent@baylibre.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, roy-cw.yeh@mediatek.com,
 linux-kernel@vger.kernel.org, CK
 Hu <ck.hu@mediatek.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 nancy.lin@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

add MERGE additional properties description for mt8195:
1. async clock
2. fifo setting enable
3. reset controller

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 .../display/mediatek/mediatek,merge.yaml      | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
index 7aa6974d509d..fae106cf1753 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
@@ -36,8 +36,28 @@ properties:
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
   clocks:
+    maxItems: 2
     items:
       - description: MERGE Clock
+      - description: MERGE Async Clock
+          Controlling the synchronous process between MERGE and other display
+          function blocks cross clock domain.
+
+  clock-names:
+    maxItems: 2
+    items:
+      - const: merge
+      - const: merge_async
+
+  mediatek,merge-fifo-en:
+    description:
+      The setting of merge fifo is mainly provided for the display latency
+      buffer to ensure that the back-end panel display data will not be
+      underrun, a little more data is needed in the fifo.
+      According to the merge fifo settings, when the water level is detected
+      to be insufficient, it will trigger RDMA sending ultra and preulra
+      command to SMI to speed up the data rate.
+    type: boolean
 
   mediatek,gce-client-reg:
     description: The register of client driver can be configured by gce with
@@ -47,6 +67,11 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
 
+  resets:
+    description: reset controller
+      See Documentation/devicetree/bindings/reset/reset.txt for details.
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -64,3 +89,16 @@ examples:
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
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
