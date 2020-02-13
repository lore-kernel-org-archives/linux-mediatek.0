Return-Path: <SRS0=7p0Y=4B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFC7C352A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2020 20:21:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AEFD206DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2020 20:21:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XAKACtdV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pWADn2lh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AEFD206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WrfkPo149mNAW2cvQ/xVBKYU9+ymqN+60HhzvtzdqoE=; b=XAKACtdVWh6rqt
	QcNKW7EXEOA/JHxb5jWxJCcOXw6R5GrrPJdkp0T6YRESCCc2x+XuR+VxZBhvjEYuWR1pwY1GQelUK
	yFgD4EH1Q7zRDeCbgdcpytn7PeAuNXctK0XhFuj22K6qY5K26Gh1fG+a8guIzttFegPrVtBU4Ysqz
	gSq7vtySrTr5tb0JByvY1/Fyiv5k7YsisSRJb04TcC9tL/CfVo8NcIr+GdTCXnGZQT7gtYnSOXRQg
	4vZhTtraVX7mTypRm5E9t/Cn4XNHyaWPkaVj0EEiRzls+gbGlXmwM+KDW5ZMQe/qYGlPDFgqUYQNG
	It5alQR/yJIpHIBS+NzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2KzI-00018Y-QW; Thu, 13 Feb 2020 20:21:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2Ky6-0008GQ-Mf; Thu, 13 Feb 2020 20:20:18 +0000
Received: from ziggy.cz (unknown [37.223.145.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5BEAB246A8;
 Thu, 13 Feb 2020 20:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581625213;
 bh=ehStHP3E8G3itjw39Biu5GSOM0CCrrWUDNJnpLV+iXc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pWADn2lh1JUvcFH4fQLwgW4G9zEau5IXUI5fA+HuPWfEv1HUC1bsdqMRuylKH7TqW
 79ysP1oE4wVSbEGedeOEEPA/xly3kDAKqXojIn8QUQrmdkZcn0ROruGqrqYdpkd0sM
 144Bs1UAVeEgjSpyz+Zu2E90g+cBgw/lbavln5hk=
From: matthias.bgg@kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
 sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com
Subject: [PATCH v7 02/13] dt-bindings: display: mediatek: Add mmsys binding
 description
Date: Thu, 13 Feb 2020 21:19:42 +0100
Message-Id: <20200213201953.15268-3-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213201953.15268-1-matthias.bgg@kernel.org>
References: <20200213201953.15268-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200213_122014_904371_5F53D9E8 
X-CRM114-Status: GOOD (  12.43  )
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
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org, frank-w@public-files.de,
 sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org,
 Matthias Brugger <mbrugger@suse.com>, linux-mediatek@lists.infradead.org,
 rdunlap@infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 matthias.bgg@kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 hsinyi@chromium.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <mbrugger@suse.com>

The MediaTek DRM has a block called mmsys, which sets
the routing and enables the different blocks.
This patch adds one line for the mmsys bindings description and changes
the mmsys description to use the generic form of referring to a specific
Soc.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>

---

Changes in v7:
- add hint to the mmsys binding document
- make mmsys description generic
- fix typo in commit message

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 .../bindings/display/mediatek/mediatek,disp.txt          | 3 +++
 .../bindings/display/mediatek/mediatek,mmsys.txt         | 9 +--------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index b91e709db7a4..8e453026ef78 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -24,6 +24,7 @@ connected to.
 For a description of the display interface sink function blocks, see
 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt and
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt.
+Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt.
 
 Required properties (all function blocks):
 - compatible: "mediatek,<chip>-disp-<function>", one of
@@ -43,7 +44,9 @@ Required properties (all function blocks):
 	"mediatek,<chip>-dpi"        		- DPI controller, see mediatek,dpi.txt
 	"mediatek,<chip>-disp-mutex" 		- display mutex
 	"mediatek,<chip>-disp-od"    		- overdrive
+	"mediatek,<chip>-mmsys", "syscon"	- provide clocks and components management
   the supported chips are mt2701, mt2712 and mt8173.
+
 - reg: Physical base address and length of the function block register space
 - interrupts: The interrupt signal from the function block (required, except for
   merge and split function blocks).
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt
index 301eefbe1618..7bbadee820e3 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt
@@ -5,14 +5,7 @@ The Mediatek mmsys controller provides various clocks to the system.
 
 Required Properties:
 
-- compatible: Should be one of:
-	- "mediatek,mt2701-mmsys", "syscon"
-	- "mediatek,mt2712-mmsys", "syscon"
-	- "mediatek,mt6779-mmsys", "syscon"
-	- "mediatek,mt6797-mmsys", "syscon"
-	- "mediatek,mt7623-mmsys", "mediatek,mt2701-mmsys", "syscon"
-	- "mediatek,mt8173-mmsys", "syscon"
-	- "mediatek,mt8183-mmsys", "syscon"
+- compatible: "mediatek,<chip>-mmsys"
 - #clock-cells: Must be 1
 
 The mmsys controller uses the common clk binding from
-- 
2.24.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
