Return-Path: <SRS0=LwTv=Z5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 890B3C2D0C2
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 22:25:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5450524685
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 22:25:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DuBUfVZ2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="E88N+dHr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5450524685
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WqPVfep7ymz8yVJwwO5B+XHeLYtcYDVPpyl0FjQHvIE=; b=DuBUfVZ2DvDF+8
	dOkG3asYxaInURcBd6JK9lhEmOrAevEhebuTHss6/d4Dqk+eIYxCpa97Lv2dFnLCNI+8wQd4Eo52q
	G5SNAY/hJOCmgMQAaYB4ArYRfWQ37cj2HsFtuotX2ZYk7s7ik9EzFBDFpSHhKICktQpAa7tIQBRod
	35ewUOscCV+g+3UmOoW8uY3aG4swh7S//+npqFzHJqKD1P90GY/cveVH0ebFBzq7f20IX7xcksBuZ
	pB0Lqq5DTgysS7hKR+y+7eUD1UwjReOjPRkBmDxx/CBc9KHmYXjKBczcqAwCcqsn8T24XlHeWjSej
	b6kEC0Ya0DQGr74x1zug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1idiVc-00086Y-RA; Sat, 07 Dec 2019 22:25:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1idiV7-0007WB-25; Sat, 07 Dec 2019 22:24:34 +0000
Received: from ziggy.de (unknown [95.169.229.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0A9622467B;
 Sat,  7 Dec 2019 22:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575757472;
 bh=yS94gpuqS6tiHsqCJmY/O8oa8kDut8tm51xSNkTZ76A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E88N+dHr4B9LMmu2YL5b4Ufwkb7SxzGaIEKT07wumDn+KHCXw47y38Y0PM5Dst7Ux
 TncGVS8eTiDlA6u47fYhj+JunvHahIwg9D6V/xDbhs+AZs1xDOjJGJMcmTswxeF/fq
 krvJEijvc6e6lNxuHKxt3P/eTdyhfWOIgr9Zm83c=
From: matthias.bgg@kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
 sboyd@codeaurora.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com
Subject: [PATCH v6 01/12] dt-bindings: display: mediatek: Add mmsys binding
 description
Date: Sat,  7 Dec 2019 23:23:38 +0100
Message-Id: <20191207222349.23161-2-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191207222349.23161-1-matthias.bgg@kernel.org>
References: <20191207222349.23161-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191207_142433_177401_8ABB1078 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, rdunlap@infradead.org, frank-w@public-files.de,
 sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sean.wang@kernel.org, wens@csie.org,
 drinkcat@chromium.org, linux-mediatek@lists.infradead.org, mbrugger@suse.com,
 hsinyi@chromium.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <mbrugger@suse.com>

The MediaTek DRM has a block called mmsys, which sets
the routing and enalbes the different blocks.
This patch adds one line for the mmsys bindings description.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---
 .../display/mediatek/mediatek,disp.txt        | 28 ++++++++++---------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index 8469de510001..c71c8a4b73ff 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -27,20 +27,22 @@ Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt.
 
 Required properties (all function blocks):
 - compatible: "mediatek,<chip>-disp-<function>", one of
-	"mediatek,<chip>-disp-ovl"   - overlay (4 layers, blending, csc)
-	"mediatek,<chip>-disp-rdma"  - read DMA / line buffer
-	"mediatek,<chip>-disp-wdma"  - write DMA
-	"mediatek,<chip>-disp-color" - color processor
-	"mediatek,<chip>-disp-aal"   - adaptive ambient light controller
-	"mediatek,<chip>-disp-gamma" - gamma correction
-	"mediatek,<chip>-disp-merge" - merge streams from two RDMA sources
-	"mediatek,<chip>-disp-split" - split stream to two encoders
-	"mediatek,<chip>-disp-ufoe"  - data compression engine
-	"mediatek,<chip>-dsi"        - DSI controller, see mediatek,dsi.txt
-	"mediatek,<chip>-dpi"        - DPI controller, see mediatek,dpi.txt
-	"mediatek,<chip>-disp-mutex" - display mutex
-	"mediatek,<chip>-disp-od"    - overdrive
+	"mediatek,<chip>-disp-ovl"		- overlay (4 layers, blending, csc)
+	"mediatek,<chip>-disp-rdma"		- read DMA / line buffer
+	"mediatek,<chip>-disp-wdma"		- write DMA
+	"mediatek,<chip>-disp-color"		- color processor
+	"mediatek,<chip>-disp-aal"		- adaptive ambient light controller
+	"mediatek,<chip>-disp-gamma"		- gamma correction
+	"mediatek,<chip>-disp-merge"		- merge streams from two RDMA sources
+	"mediatek,<chip>-disp-split"		- split stream to two encoders
+	"mediatek,<chip>-disp-ufoe"		- data compression engine
+	"mediatek,<chip>-dsi"			- DSI controller, see mediatek,dsi.txt
+	"mediatek,<chip>-dpi"			- DPI controller, see mediatek,dpi.txt
+	"mediatek,<chip>-disp-mutex"		- display mutex
+	"mediatek,<chip>-disp-od"		- overdrive
+	"mediatek,<chip>-mmsys", "syscon"	- provide clocks and components management
   the supported chips are mt2701, mt2712 and mt8173.
+
 - reg: Physical base address and length of the function block register space
 - interrupts: The interrupt signal from the function block (required, except for
   merge and split function blocks).
-- 
2.24.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
