Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CC2CD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 08:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=txrlSTJmD4m7g1rRXo19At8jB+TYL5mIq3JSM0gYRBk=; b=1wuKPcP7r8HGa9qtk0MObf8PhF
	G6vt5PSDZcAdgBmHIRHfuyFTJixbJ0AkGBDPPxwvSiBToDP8b4T0aaTHCn1B1EoMJ6lJPEk7rFTsf
	0tgedpvHBMwMrpON15ZHf5FumKzKZ5yBfNxK3yewAf6vA2aQZUD5J/gDoY2I7JRnOHZlL9K4Q8qan
	BW3MRCSQWC7NZ/abBs2btMZmA2xBcUgQXa/sBIeLZwLudIvjBHHff9p/+H6BSfL4t5UsYO1vf0zZ1
	1Zjg5JKnVdMEj6132CFh8HIZwQADHQ4xUABg+P453Sym7TvAbZU1f5z9AHn4h4ZlN74Vb2bYonzhs
	jIMRHv1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTLY-00000005s3J-3TOR;
	Wed, 10 Apr 2024 08:30:20 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTLQ-00000005rxk-3gYX;
	Wed, 10 Apr 2024 08:30:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712737811;
	bh=+nU/7bNYGGkqgDvePENQLG3lijjBSCCDYfWzHR3Q5Qk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AE8fvlolajpaZ0UHcpOutZ5YLh0h2EOsLJfr4dn0DyNGKn7ELAmdA+6n+ZyXcTc3i
	 TMften1Ff6dqXwhGWuidRTqYol6HEKFpkFa9Oh1mNEK4ATgq3acAQ7yt4eJ+jT/MYW
	 A0N0FbrCyT8sRBRn7BKulmYi/1uMt79XmdH4MtFx3V7Dag9VcJaaZyH+5xGg+3Utb7
	 YC3f2yI07bdtfJfXhbw2XTJFdPzxpdMzK11igcGxUZ8cUaGWjEoqWNWceT5eUgdDr+
	 TWZTy/tF5/ieEgGGK4zaaNVSVldJqVygTGLuAqYE0Dn1hBo8sFZs7cVVmszBrdAOmT
	 /E1+rV3GBjljw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 73C933781453;
	Wed, 10 Apr 2024 08:30:10 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	bchihi@baylibre.com,
	bero@baylibre.com,
	amergnat@baylibre.com,
	nfraprado@collabora.com,
	michael.kao@mediatek.com,
	mka@chromium.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 1/3] arm64: dts: mediatek: mt8195: Fix GPU thermal zone name for SVS
Date: Wed, 10 Apr 2024 10:30:00 +0200
Message-ID: <20240410083002.1357857-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410083002.1357857-1-angelogioacchino.delregno@collabora.com>
References: <20240410083002.1357857-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_013013_149390_9A0C9773 
X-CRM114-Status: GOOD (  10.18  )
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

This SoC has two GPU related thermal zones: the primary zone must be
called "gpu-thermal" for SVS to pick it up.

Fixes: 1e5b6725199f ("arm64: dts: mediatek: mt8195: Add AP domain thermal zones")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 30ee39045e7b..d3254ff74953 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -3877,7 +3877,7 @@ vpu1_crit: trip-crit {
 			};
 		};
 
-		gpu0-thermal {
+		gpu-thermal {
 			polling-delay = <1000>;
 			polling-delay-passive = <250>;
 			thermal-sensors = <&lvts_ap MT8195_AP_GPU0>;
-- 
2.44.0


