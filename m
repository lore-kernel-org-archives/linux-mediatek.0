Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8D3C3DA42
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jul 2024 10:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Cz+tcKOoLj5PHmzKXgFnpnZXQbpoa1J8fX2KzN0JB0=; b=R0/0PxpNij9EDG
	YfJ/7pzul15Qb07ewQbZA2O4NMsAVMderIoLCxWp9pY0tU/HObBCfQAa+fNHo/z+HdCOesY5NtRc6
	St2cWSpctlaK7PTZ55HcYroAsBRNm4hM4XMcxFc4IoggIVkC3fJbkE7kt+0lGBevrKi4qSJ3GtzPG
	kVtLSW7dFrTtBIxL31rAwXGzUmVtA6rm59N4hCX72O43Qb72sws4MeyfN0qtNtw0czVctwLu5UQTE
	Yf9nVKZcwIF9TXavk2ZpJISaZCRP8y0V+9NzmIUmZDfPy+rG7olCAWXLHWHU878yFjS9ZC8eoLdnR
	LbeNWn0ZR6fOheXcxuow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR7rn-00000006m7t-0gph;
	Tue, 09 Jul 2024 10:14:35 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR7qu-00000006lm5-1VOA;
	Tue, 09 Jul 2024 10:13:41 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id 0B2B541A4D;
	Tue,  9 Jul 2024 10:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1720520018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Cz+tcKOoLj5PHmzKXgFnpnZXQbpoa1J8fX2KzN0JB0=;
	b=pQyfAGKLWsucu2KTiPOeG4tD8bX/99jx/zCXtk7YVjoyljQW2r6XHAGmfSwYS1oAwbKyGC
	JaJUWTSX63WSh33ETPGj808x02lgYIuG+loM4NwBemXgirs24hpZp1Jhw7x0AespEd/Jbr
	9ix4IXZTTxvL7OM+IFDgKSeRGrVfHuQ=
Received: from frank-u24.. (fttx-pool-217.61.149.221.bambit.de [217.61.149.221])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id D03A8100758;
	Tue,  9 Jul 2024 10:13:36 +0000 (UTC)
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
Subject: [PATCH v1 3/4] dt-bindings: clock: mediatek: add syscon requirement for mt7988 ethwarp
Date: Tue,  9 Jul 2024 12:13:25 +0200
Message-ID: <20240709101328.102969-4-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709101328.102969-1-linux@fw-web.de>
References: <20240709101328.102969-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 211e5e16-6cca-4117-b4fa-ed6227b76485
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_031340_589136_3E35CFE4 
X-CRM114-Status: UNSURE (   9.59  )
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
 .../devicetree/bindings/clock/mediatek,mt7988-ethwarp.yaml  | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7988-ethwarp.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7988-ethwarp.yaml
index e32a0251ff6a..b460a0de8503 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt7988-ethwarp.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt7988-ethwarp.yaml
@@ -17,7 +17,9 @@ description:
 properties:
   compatible:
     items:
-      - const: mediatek,mt7988-ethwarp
+      - enum:
+          - mediatek,mt7988-ethwarp
+      - const: syscon
 
   reg:
     maxItems: 1
@@ -44,7 +46,7 @@ examples:
         #size-cells = <2>;
 
         clock-controller@15031000 {
-            compatible = "mediatek,mt7988-ethwarp";
+            compatible = "mediatek,mt7988-ethwarp", "syscon";
             reg = <0 0x15031000 0 0x1000>;
             #clock-cells = <1>;
             #reset-cells = <1>;
-- 
2.43.0


