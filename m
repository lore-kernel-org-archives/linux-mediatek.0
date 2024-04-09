Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6397EC67861
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 11:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHjax8GzPpWW5MhmJxyFbVbN9F+mshV4y/CO+mDfdFE=; b=MRoQffblL7y82b3dWdfblVVY9t
	FeFAw1ifj1SpTsCn7TFlymDBzMlKsUJBSKuu0Ioo3+VJiNiWirYI7RhusaZruBXyEkuwpcoqYaBUK
	0XhWgtR1oUhLAIYGxB8PacUB7iJUzKQWGwrXXBcD46sB/YjXt7NDKKBTogmzjRLdUNnW2XrmhPgXI
	f6g4Eiuw1hexdbzyNNzNgC99TMFXVbaKckyDfK/HawQrAxnRJvvYNMPQJSBiC4z2JL0esu4W74Vhh
	PqR+KMFAXUfQrgd3Qs7hk/CFmndhsE4Jl0tG8Zt46tdhKOidOHZCJ7sOQ8N3a1vxwmIWlWkPawVLj
	BIbuGfuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9sA-00000001kpV-2VYs;
	Tue, 09 Apr 2024 11:42:42 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9rw-00000001kff-2ukV;
	Tue, 09 Apr 2024 11:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712662947;
	bh=o1ZO250f2gq4FpmkK9DlGabPiZaW6bBFlLH8cfcJxfM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vxz4zJaWymPrDOsrclq/ElwXrIy58HmDaaNpOunu1zE/lVlGv1flya+vlciMTeEpx
	 Cf11bvlfux9qs2/iVPccNsq2G3Jx2AZyXcNehgB93I7jM/WVvPmKoGmMYVf75JmxSc
	 UojyZl7vhlj5V8yT8sYkljQh0Oht6ZyqpnD3dCqxQq0+XvLxE4fcwqArti3neqT0y/
	 dvjLfqCoQ1r1cGS/TxRN3Cntk8oKtq7NENDZWzQ2nGUsj2tLBmkENn7mCAbI9HXDNv
	 HYAOzjgl7p4k+2D3qXGf5pNqu5sy4B7KavgXJIIcCGVAa1XQkWdlE+Wd9F1GS/FjLF
	 Es/HBEx5YbNRQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B999E37820FD;
	Tue,  9 Apr 2024 11:42:26 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 2/5] arm64: dts: medaitek: mt8395-nio-12l: Set i2c6 pins to bias-disable
Date: Tue,  9 Apr 2024 13:42:08 +0200
Message-ID: <20240409114211.310462-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409114211.310462-1-angelogioacchino.delregno@collabora.com>
References: <20240409114211.310462-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_044228_963204_1C000701 
X-CRM114-Status: GOOD (  10.68  )
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

GPIOs 25 and 26 do not support pull-up/pull-down when those are muxed
as I2C6's SDA6/SCL6 lines: set those to bias-disable to avoid warning
messages from the pinctrl driver.

Fixes: 96564b1e2ea4 ("arm64: dts: mediatek: Introduce the MT8395 Radxa NIO 12L board")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index 18182cf073fb..86f7d4dd5eae 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -528,7 +528,7 @@ i2c6_pins: i2c6-pins {
 		pins {
 			pinmux = <PINMUX_GPIO25__FUNC_SDA6>,
 				 <PINMUX_GPIO26__FUNC_SCL6>;
-			bias-pull-up = <MTK_PULL_SET_RSEL_111>;
+			bias-disable;
 		};
 	};
 
-- 
2.44.0


