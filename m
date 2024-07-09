Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE9CC2BD09
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jul 2024 10:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z4cX1DCeKrW/X4IO3UhVEF3ikjjO45cZPJayAiaU02Q=; b=ksVDf3QWb+jQOD
	yIaET6jUJhw5PewxTqUQHyngai7BCFjqvT7mJb4buLfC6Wf1L9Ts7aT6uVaby4YMaZQliIgn0tAGQ
	zgbqA4YjUoYCYB1jR3iHbCcxhLfdq7K5ocDYlJwBH69AbRMSDU/rXIMdO6P3DxfoA9pYCzntR08TX
	OfKPHYdFHwNMK/NsQIsu86A6vsGPgd21ZpwsPBYs7TtUOo3Bvk/SOo8rhh/i31pmg/H0p6LVlP+pT
	LHfZ6AOqSA3s5P7V4E/jSdT/sR3seyzgk3bduc/zadM7mQcMmAZBBo5GoB3Xs2RKQxAZg52dz+vXD
	sz62rBv3zVVnR9RORwgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR7rm-00000006m7U-37KP;
	Tue, 09 Jul 2024 10:14:34 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR7qu-00000006lm3-1PNu;
	Tue, 09 Jul 2024 10:13:41 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id EE4AA41A4A;
	Tue,  9 Jul 2024 10:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1720520017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z4cX1DCeKrW/X4IO3UhVEF3ikjjO45cZPJayAiaU02Q=;
	b=RloNW+Y/inqFUfV9np27yttZrQpJsm+ipZrlEC0rcEe/R8qGC+xHcqasecIGg6p0XtmBJz
	X9mZV0G/uFYp5W02UwvKJij1pRWMlDDOM1dGlgQOZRwoKU9Q49j8LxRJ9ZWjs6k6EEqx8x
	K+y8rhNN3sahRJMVTPcf9mr0L5A+ssw=
Received: from frank-u24.. (fttx-pool-217.61.149.221.bambit.de [217.61.149.221])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id BFC7D100628;
	Tue,  9 Jul 2024 10:13:35 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v1 2/4] dt-bindings: clock: mediatek: add syscon requirement for mt7988 xfi-pll
Date: Tue,  9 Jul 2024 12:13:24 +0200
Message-ID: <20240709101328.102969-3-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709101328.102969-1-linux@fw-web.de>
References: <20240709101328.102969-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 81349dc7-a37f-460e-ab98-b22b9184569c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_031340_549549_A3471D33 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

This is needed by u-boot-driver when using OF_UPSTREAM.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../devicetree/bindings/clock/mediatek,mt7988-xfi-pll.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7988-xfi-pll.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7988-xfi-pll.yaml
index 192f1451f0af..c3686712505a 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt7988-xfi-pll.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt7988-xfi-pll.yaml
@@ -15,7 +15,10 @@ description:
 
 properties:
   compatible:
-    const: mediatek,mt7988-xfi-pll
+    items:
+      - enum:
+          - mediatek,mt7988-xfi-pll
+      - const: syscon
 
   reg:
     maxItems: 1
@@ -40,7 +43,7 @@ examples:
         #address-cells = <2>;
         #size-cells = <2>;
         clock-controller@11f40000 {
-            compatible = "mediatek,mt7988-xfi-pll";
+            compatible = "mediatek,mt7988-xfi-pll", "syscon";
             reg = <0 0x11f40000 0 0x1000>;
             resets = <&watchdog 16>;
             #clock-cells = <1>;
-- 
2.43.0


