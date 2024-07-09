Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD54CC3DA41
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jul 2024 10:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A6xXij2X8BH/8d0tWoHxSFtMClwNOD6a+irryyVsrSg=; b=diC62LAToDgH8K
	QadnapRA2pkar9Jai2d7tkyATKubQwkOkPjIGSMs6zIAg/nZOXUD9lcZftpBxryxSXKfRz3rSEZWz
	ikrbCXsIctL+YsDtuXQ5NF5pj+FJnD95X9/uMEGNhwiXkMjjTlon6WIAw/AQYpRGTC45R1eCtMllV
	zTiutN0+hzJ24FEu2W17EkL9CAt0IThqgPA1M5MnGfrTdReD/aBdphORIAnL69x/LZxC3x1iElirg
	mNmB45djxcx3cGAAFNY8Q+NefXNAWaqACTnmmwlTZECe9o6cELXMOCcVP51Rz3G2BOzwEj9BSjVWp
	cL+dQ+3CwA7gbUOL9CJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR7rM-00000006lw8-0zGo;
	Tue, 09 Jul 2024 10:14:08 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR7qr-00000006ll7-1KAS;
	Tue, 09 Jul 2024 10:13:38 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id AFEAF41A49;
	Tue,  9 Jul 2024 10:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1720520015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A6xXij2X8BH/8d0tWoHxSFtMClwNOD6a+irryyVsrSg=;
	b=YSJDkGCEzplhkljyu5qASGz7Wek4bD9njpCdk8J3AQwudP9J3ovswPumfGsxEZl6337EV2
	Q+lMzjq8vOANYTii0QAYui28qGjoRQTVlzTDsGts4moPi9QuP8V81ANgtT/++a1ACisLoh
	kGBy9qAEXNV/nbprGuUZ3XEnnlPQcWY=
Received: from frank-u24.. (fttx-pool-217.61.149.221.bambit.de [217.61.149.221])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id B87B410075A;
	Tue,  9 Jul 2024 10:13:34 +0000 (UTC)
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
Subject: [PATCH v1 1/4] dt-bindings: watchdog: mediatek,mtk-wdt: add MT7988 syscon requirement
Date: Tue,  9 Jul 2024 12:13:23 +0200
Message-ID: <20240709101328.102969-2-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709101328.102969-1-linux@fw-web.de>
References: <20240709101328.102969-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 3691708b-d2e9-40a6-b21e-134ff95be4e9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_031337_525678_DFADC67D 
X-CRM114-Status: UNSURE (   9.98  )
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
 .../devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml       | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 8d2520241e37..681df2ff9f2e 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -25,7 +25,6 @@ properties:
           - mediatek,mt6735-wdt
           - mediatek,mt6795-wdt
           - mediatek,mt7986-wdt
-          - mediatek,mt7988-wdt
           - mediatek,mt8183-wdt
           - mediatek,mt8186-wdt
           - mediatek,mt8188-wdt
@@ -43,6 +42,10 @@ properties:
               - mediatek,mt8365-wdt
               - mediatek,mt8516-wdt
           - const: mediatek,mt6589-wdt
+      - items:
+          - enum:
+              - mediatek,mt7988-wdt
+          - const: syscon
 
   reg:
     maxItems: 1
-- 
2.43.0


