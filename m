Return-Path: <SRS0=kfxU=PO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B79C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 16:00:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1218661078
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 16:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1218661078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q5pxg+105wAnX0qqUmlC6UeCFGMWgFhso9zJO/jHEi8=; b=m0bK4ZhYoXqMwt
	G/7g2H34qdw4ybEE71JjvuT7lSm4UzydddEo1TICmby/jJEsafThBwzld+k777ZK2JuTZEiLOFZci
	mLwDLhinzax3ZuIjgmSuxIS5UAqG3yiO2enZ3QslQUn9Bx4fG3+Ym0NrXfZOXT/6TCOmjxqEyTibR
	REZDNqWMOnbsgHK+j4YLjPclKt9V1IwUNdKNsL/ztKwHIGNHvnYMW8AJBb7sPCGtEpq61q5O3ENR/
	sjNlK+zYdIN7JjliVoDblbvuMFlHGpVJJh8YjUVYdNGxHNJchKA9QAD/qIhaoLBc8wxratXSDqrZf
	1U2h2hLwDBTp1w+fUbaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfOsO-002Hxd-Fr; Tue, 26 Oct 2021 16:00:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfOr9-002HSI-Ve; Tue, 26 Oct 2021 15:59:21 +0000
X-UUID: 8ed8aa278d4b49ef92f8d11f68f64838-20211026
X-UUID: 8ed8aa278d4b49ef92f8d11f68f64838-20211026
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1016139854; Tue, 26 Oct 2021 08:59:15 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Oct 2021 08:59:14 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Oct 2021 23:59:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 26 Oct 2021 23:59:13 +0800
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
Subject: [PATCH v12 05/16] dt-bindings: display: mediatek: merge: add
 additional prop for mt8195
Date: Tue, 26 Oct 2021 23:59:00 +0800
Message-ID: <20211026155911.17651-6-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211026155911.17651-1-jason-jh.lin@mediatek.com>
References: <20211026155911.17651-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_085920_061199_1E7D589A 
X-CRM114-Status: GOOD (  11.30  )
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

add MERGE additional properties description for mt8195:
1. async clock
2. fifo setting enable
3. reset controller

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 .../display/mediatek/mediatek,merge.yaml      | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
index 75beeb207ceb..614721bdbf73 100644
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
     description:
@@ -50,6 +70,11 @@ properties:
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
@@ -67,3 +92,16 @@ examples:
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
