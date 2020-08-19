Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B754C433E3
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 08:18:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EE1E20738
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 08:18:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DjHTXUDa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="IdJvEcOu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EE1E20738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CbVexru+UEb21d/bnynRcjfdLQiVf5bB10/JX4ZcQF4=; b=DjHTXUDaPzK9p+CJgkMkbCg4D
	PJhzplocVO6p8jXooZ10J51Uc9wk4nLaqhHfOgy4ffCERgv5KwZB8WEVcr6phuxzda0LSZk7PcMAC
	YFGlTpvrtNr9F93onGMcieKEStgNXfSbdiRINjycw3okSjrMrk0geQKFTFHYe3s0citb5Cw3HQhnn
	NZ8ADQyRDpZYyXvM8LShszqaljBdraMikUfm2hyLp9VMJgFnm2E4HvQFB1VGb3DAchIdiF6NwM4wJ
	WAwLLvNMIGb6j86V0fDu9r3dP3zjPM6lAgJr42e/4pkmlBDaEDMlhMEz3ED5JAtsvqTMT8Vnj7k+K
	SUquaeelA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8JIe-00081D-0H; Wed, 19 Aug 2020 08:18:24 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8JIP-0007u9-VW; Wed, 19 Aug 2020 08:18:11 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
 by mxout3.routing.net (Postfix) with ESMTP id DCAD360090;
 Wed, 19 Aug 2020 08:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1597825080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sfRT6Jdl5DYhGl5q2Gfdj5vkPkIaNa57DcrwbMLC9oE=;
 b=IdJvEcOu+ws9otAGTUsoMhlVHJ4qbu5NvQuUIgth9c9ZfTkZ2AHCQne8FryOD0+mHjDKBL
 8m3z6Ob7wF/na07aS87171uwMtvi+F8wXG2/wPC7nh2eI1MuyoLD69MSIM1SMcmgR+jrjP
 sVTxheILoADgswXdlG84u8YpVE/aDQU=
Received: from localhost.localdomain (fttx-pool-185.76.97.101.bambit.de
 [185.76.97.101])
 by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 3209310054E;
 Wed, 19 Aug 2020 08:17:59 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v5 1/7] dt-bindings: mediatek: add mt7623 display-nodes
Date: Wed, 19 Aug 2020 10:17:46 +0200
Message-Id: <20200819081752.4805-2-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200819081752.4805-1-linux@fw-web.de>
References: <20200819081752.4805-1-linux@fw-web.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_041810_269821_84CA4FC8 
X-CRM114-Status: GOOD (  13.24  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

mt7623 uses mt2701/mt8173 for drm, but have own compatibles

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 .../devicetree/bindings/display/mediatek/mediatek,disp.txt    | 2 +-
 .../devicetree/bindings/display/mediatek/mediatek,dpi.txt     | 2 +-
 .../devicetree/bindings/display/mediatek/mediatek,dsi.txt     | 4 ++--
 .../devicetree/bindings/display/mediatek/mediatek,hdmi.txt    | 4 ++++
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index b91e709db7a4..121220745d46 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -43,7 +43,7 @@ Required properties (all function blocks):
 	"mediatek,<chip>-dpi"        		- DPI controller, see mediatek,dpi.txt
 	"mediatek,<chip>-disp-mutex" 		- display mutex
 	"mediatek,<chip>-disp-od"    		- overdrive
-  the supported chips are mt2701, mt2712 and mt8173.
+  the supported chips are mt2701, mt7623, mt2712 and mt8173.
 - reg: Physical base address and length of the function block register space
 - interrupts: The interrupt signal from the function block (required, except for
   merge and split function blocks).
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
index 77def4456706..dc1ebd13cc88 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
@@ -7,7 +7,7 @@ output bus.
 
 Required properties:
 - compatible: "mediatek,<chip>-dpi"
-  the supported chips are mt2701 , mt8173 and mt8183.
+  the supported chips are mt2701, mt7623, mt8173 and mt8183.
 - reg: Physical base address and length of the controller's registers
 - interrupts: The interrupt signal from the function block.
 - clocks: device clocks
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
index 8e4729de8c85..f06f24d405a5 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
@@ -7,7 +7,7 @@ channel output.
 
 Required properties:
 - compatible: "mediatek,<chip>-dsi"
-  the supported chips are mt2701, mt8173 and mt8183.
+- the supported chips are mt2701, mt7623, mt8173 and mt8183.
 - reg: Physical base address and length of the controller's registers
 - interrupts: The interrupt signal from the function block.
 - clocks: device clocks
@@ -26,7 +26,7 @@ The MIPI TX configuration module controls the MIPI D-PHY.
 
 Required properties:
 - compatible: "mediatek,<chip>-mipi-tx"
-  the supported chips are mt2701, mt8173 and mt8183.
+- the supported chips are mt2701, 7623, mt8173 and mt8183.
 - reg: Physical base address and length of the controller's registers
 - clocks: PLL reference clock
 - clock-output-names: name of the output clock line to the DSI encoder
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
index 7b124242b0c5..6b1c586403e4 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
@@ -6,6 +6,7 @@ its parallel input.
 
 Required properties:
 - compatible: Should be "mediatek,<chip>-hdmi".
+- the supported chips are mt2701, mt7623 and mt8173
 - reg: Physical base address and length of the controller's registers
 - interrupts: The interrupt signal from the function block.
 - clocks: device clocks
@@ -32,6 +33,7 @@ The HDMI CEC controller handles hotplug detection and CEC communication.
 
 Required properties:
 - compatible: Should be "mediatek,<chip>-cec"
+- the supported chips are mt7623 and mt8173
 - reg: Physical base address and length of the controller's registers
 - interrupts: The interrupt signal from the function block.
 - clocks: device clock
@@ -44,6 +46,7 @@ The Mediatek's I2C controller is used to interface with I2C devices.
 
 Required properties:
 - compatible: Should be "mediatek,<chip>-hdmi-ddc"
+- the supported chips are mt7623 and mt8173
 - reg: Physical base address and length of the controller's registers
 - clocks: device clock
 - clock-names: Should be "ddc-i2c".
@@ -56,6 +59,7 @@ output and drives the HDMI pads.
 
 Required properties:
 - compatible: "mediatek,<chip>-hdmi-phy"
+- the supported chips are mt2701, mt7623 and mt8173
 - reg: Physical base address and length of the module's registers
 - clocks: PLL reference clock
 - clock-names: must contain "pll_ref"
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
