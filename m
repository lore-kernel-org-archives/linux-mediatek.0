Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9E8C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 03:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S2Nr5Xesft0Ue7HbwIGnOjPwUQZIG0nr48dT6/SlqPU=; b=Lvs4K4odU20Kwt
	ConauRZndFpp8vzkOIA7HsMU3ZAUtdofknHHL9akf333MB4iE+VUvW+KRD0qPpu2aqdEx+G8mBm97
	knCVezeIC2CF9u2Cd5b3B5a0scMgxq2sa54O+tU/1yPdfr79Qs4NGAap0g1dHPKec/hxdhRFvvgn/
	Pcj7jCmltcCCAu5YiPK/YbAFDxDcmQpLmPTR8BSRFnh1zJ76fGziB7poNi36p20xPPLqcNjXVBAF6
	JHdz5eP3LAMdzkEXGl1h/3ATjBFKvFFcaKNXCM8bzGjgkiQa8Q3aUuMNpEw6ETdsCSDb1KwhD1NGq
	MomQgzbZxV0HvZ46LcRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neU5U-00GcfJ-OJ; Wed, 13 Apr 2022 03:54:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neU5G-00GcVZ-2C; Wed, 13 Apr 2022 03:54:23 +0000
X-UUID: 1169612c74dc4f14b24fde077241c595-20220412
X-UUID: 1169612c74dc4f14b24fde077241c595-20220412
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 622701235; Tue, 12 Apr 2022 20:54:18 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Apr 2022 20:54:16 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Apr 2022 11:54:14 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Apr 2022 11:54:13 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>, "Steve
 Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4,
 1/7] dt-bindings: media: mediatek: vcodec: Adds decoder dt-bindings
 for lat soc
Date: Wed, 13 Apr 2022 11:54:04 +0800
Message-ID: <20220413035410.29568-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220413035410.29568-1-yunfei.dong@mediatek.com>
References: <20220413035410.29568-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_205422_151220_20F99644 
X-CRM114-Status: GOOD (  13.12  )
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

Adds decoder dt-bindings for compatible "mediatek,mtk-vcodec-lat-soc".

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../media/mediatek,vcodec-subdev-decoder.yaml | 51 +++++++++++++------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
index 6415c9f29130..6854e7f2ce9f 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
@@ -17,20 +17,20 @@ description: |
 
   About the Decoder Hardware Block Diagram, please check below:
 
-    +---------------------------------+------------------------------------+
-    |                                 |                                    |
-    | input -> lat HW -> lat buffer --|--> lat buffer -> core HW -> output |
-    |            ||                   |                     ||             |
-    +------------||-------------------+---------------------||-------------+
-              lat workqueue           |              core workqueue     <parent>
-    -------------||-----------------------------------------||------------------
-                 ||                                         ||          <child>
-                 \/ <----------------HW index-------------->\/
-           +------------------------------------------------------+
-           |                    enable/disable                    |
-           |           clk     power    irq    iommu              |
-           |                 (lat/lat soc/core0/core1)            |
-           +------------------------------------------------------+
+    +------------------------------------------------+-------------------------------------+
+    |                                                |                                     |
+    |  input -> lat soc HW -> lat HW -> lat buffer --|--> lat buffer -> core HW -> output  |
+    |            ||             ||                   |                     ||              |
+    +------------||-------------||-------------------+---------------------||--------------+
+                 ||     lat     ||                   |               core workqueue  <parent>
+    -------------||-------------||-------------------|---------------------||---------------
+                 ||<------------||----------------HW index---------------->||        <child>
+                 \/             \/                                         \/
+               +-------------------------------------------------------------+
+               |                          enable/disable                     |
+               |                 clk     power    irq    iommu               |
+               |                   (lat/lat soc/core0/core1)                 |
+               +-------------------------------------------------------------+
 
   As above, there are parent and child devices, child mean each hardware. The child device
   controls the information of each hardware independent which include clk/power/irq.
@@ -45,6 +45,13 @@ description: |
   For the smi common may not the same for each hardware, can't combine all hardware in one node,
   or leading to iommu fault when access dram data.
 
+  Lat soc is a hardware which is related with some larb(local arbiter) ports. For mt8195
+  platform, there are some ports like RDMA, UFO in lat soc larb, need to enable its power and
+  clock when lat start to work, don't have interrupt.
+
+  mt8195: lat soc HW + lat HW + core HW
+  mt8192: lat HW + core HW
+
 properties:
   compatible:
     enum:
@@ -88,7 +95,9 @@ patternProperties:
 
     properties:
       compatible:
-        const: mediatek,mtk-vcodec-lat
+        enum:
+          - mediatek,mtk-vcodec-lat
+          - mediatek,mtk-vcodec-lat-soc
 
       reg:
         maxItems: 1
@@ -126,7 +135,6 @@ patternProperties:
     required:
       - compatible
       - reg
-      - interrupts
       - iommus
       - clocks
       - clock-names
@@ -197,6 +205,17 @@ required:
   - dma-ranges
   - ranges
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - mediatek,mtk-vcodec-lat
+
+then:
+  required:
+    - interrupts
+
 additionalProperties: false
 
 examples:
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
