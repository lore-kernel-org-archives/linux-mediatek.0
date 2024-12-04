Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E83AE77170
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Dec 2024 19:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+lSfZLSwrFfKO4D+tL1HHWmCXCga7hprCT6tDTU5BJ4=; b=WZgeDvsSS5WfQFvQwAlUMxN4/V
	hYs/pR/ZPDecrJO2qO6QhxlH+XiQ0Q7JHFgbZ4GK4WSc4D8XRbx3qb5ZI1l9+Fr39qtapfsbxUIoh
	gjV+XVw/MlT3IpVoysEDC2WwGj+7aHsorL2CSUdz4Xv8Wrx2DBZq9xb3dfoEOk5AELVfAVJom7uPm
	GRtHnMsrsGHgvsNEBe2xYH7aPDTwc1cLxmC+f6mqTwZv8ZcGMGeQ3U2FSJr0/80zAbrwGzWqor62R
	Gd5BvVVZ0fSH8efrTETe81X6BwMnLgrvFQGzLn1rGI7fkErPxUHSAhFS4KrPhoIGHa92YL9AGMzcx
	NtT5pDvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIulO-0000000Dcw4-0fHQ;
	Wed, 04 Dec 2024 19:10:18 +0000
Received: from out-183.mta1.migadu.com ([2001:41d0:203:375::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIuiP-0000000DcEU-30Do;
	Wed, 04 Dec 2024 19:07:14 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1733339231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+lSfZLSwrFfKO4D+tL1HHWmCXCga7hprCT6tDTU5BJ4=;
	b=eQrkpD6hvWCLJmo0fgibWsvez7c+vM0S65jUKaHpvVUrSn0Q8GlqRUmwS4dtLeTCIRhXoc
	0L/2ohKwmjRH6aWARiXJLulyt2uW2pjWRE4mip+enrD7Iw2GL6ftKxZ4lABYeTGHNomu8F
	kuyyHirZ9VZnIg9MkTnYuG4b/u6XO4VRzmbQ5YTEzEy4Ppm0T6vFS7eNwoqlJ+588K1HGJ
	x3s61U8qk5vVHAt4elheQ4WX+U8ts76nKqA12wsSzG0Iy1ZZMTokOY70FxpRyHLK59P9j6
	Ac4J6LgR9KOcr8NkAj9q/NGW6fw0qH5jjJA6T7QPuarmYeJ+QxtOErVGwGcqNg==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/5] arm64: dts: mediatek: mt8516: fix wdt irq type
Date: Wed,  4 Dec 2024 16:05:05 -0300
Message-ID: <20241204190524.21862-3-val@packett.cool>
In-Reply-To: <20241204190524.21862-1-val@packett.cool>
References: <20241204190524.21862-1-val@packett.cool>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_110713_895451_8D765BB1 
X-CRM114-Status: GOOD (  10.39  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The GICv2 does not support EDGE_FALLING interrupts, so the watchdog
would refuse to attach due to a failing check coming from the GIC driver.

Fixes: 5236347bde42 ("arm64: dts: mediatek: add dtsi for MT8516")
Signed-off-by: Val Packett <val@packett.cool>
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index 444429341302..098c32ebf678 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -206,7 +206,7 @@ watchdog@10007000 {
 			compatible = "mediatek,mt8516-wdt",
 				     "mediatek,mt6589-wdt";
 			reg = <0 0x10007000 0 0x1000>;
-			interrupts = <GIC_SPI 198 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
 			#reset-cells = <1>;
 		};
 
-- 
2.47.1


