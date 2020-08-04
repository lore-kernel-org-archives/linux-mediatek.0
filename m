Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 799CEC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 16:56:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E358207FC
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 16:56:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xlm6fYzD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="lZemiGum"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E358207FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E8P2phw2/JAyyrmjtfT74SRMoB2htVAjEa7Gm+QaGYg=; b=xlm6fYzD/Q+0oCMNJ5FKD0zwT
	hzeJX/pvp8K5ru/0S/mAiV4akW+g36chwI6v38mQKg//thFc9hxoMmI2C9CLrcHQEpgiNfouiGiUZ
	5Wt9VpwpdJmDVg3xuZrYsErea2fiSOZuvAni/b3oWgR8zKYz0ayGPHdlXvoON7icrh/0xqfFHo6Bq
	0O4vanwqpCzhqPPij3hZX4AvHJh6H8L9VenVU5yMbAAjFVfXmXw26kHb6lE9ysb5W4vW2E438bJYl
	l7SRUrTZcFPlI5Q/A9lQm3Cmf0Pjpy7qY+PmcqW91P8SdWMUXdh0SvUnhcYOFfiqxbuuJdx6vi7zD
	ZUWnZ1+5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k30Eu-0004nd-7z; Tue, 04 Aug 2020 16:56:36 +0000
Received: from mxwww.masterlogin.de ([2a03:2900:1:1::b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k30EX-0004gF-2p; Tue, 04 Aug 2020 16:56:16 +0000
Received: from mxout1.routing.net (unknown [192.168.10.81])
 by forward.mxwww.masterlogin.de (Postfix) with ESMTPS id 871D59614E;
 Tue,  4 Aug 2020 16:56:09 +0000 (UTC)
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout1.routing.net (Postfix) with ESMTP id 5922040295;
 Tue,  4 Aug 2020 16:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1596560169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ewXB5FpohxgJpmkvbol3KpCl1csVHrG3vmcWsHV3gc=;
 b=lZemiGumuSpSI/q66uA5a9WrKtHLa4xuMZDfSUWRRizIvx+mbfG/VPtSmqYLA39Hq5et5F
 h65yZq4KGy3G6aV3NZvSEyUXMF5LL7fwTbzNGFn9dcv/CEFMlrz9IPGQCKJWZh2uYrT6Lo
 C0vGG9ubDs0zG+JWUhE5JtyWPK2ah70=
Received: from localhost.localdomain (fttx-pool-217.61.144.119.bambit.de
 [217.61.144.119])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id A3D223605F9;
 Tue,  4 Aug 2020 16:56:08 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v4 1/6] dt-bindings: mediatek: add mt7623 display-nodes
Date: Tue,  4 Aug 2020 18:55:49 +0200
Message-Id: <20200804165555.75159-2-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200804165555.75159-1-linux@fw-web.de>
References: <20200804165555.75159-1-linux@fw-web.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_125613_986546_FFF046B8 
X-CRM114-Status: GOOD (  13.27  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

mt7623 uses mt2701/mt8173 for drm, but have own compatibles

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
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
