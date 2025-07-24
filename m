Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08016C83F26
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 09:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pn+G/5dnAw/eByDHIBbEhddWgZEm9f0u1jbC+qoWY10=; b=BQ91B2VkBuiM2s
	Te3MR+eV6BTp8a0nMnftWts6aPuW1j7hKv3/Xe0E+F9G/0XB2NVFX/MHcAe5W+sL/WnzBWCk/xbhm
	3vrXb3D/aLmYtqkRp4Z88JlPkEAzJRMPxeoJ+gcGYCLLSy0uOqXATmKhs5xRcgZ3mIv+sPHPY1Mnd
	j2LjwKM26WPLsHqGEj/oqVYNo1UOrBA3MNRRw9rtG/K49m3UzonZDUWncFylVHW9FyvkB89iXzswb
	n8c1XPyLNYPXg3kMjWZCFbL8Tq8WE3s9ADZUErYzNz6svq5zACsmVkez6bc4jrapum/BRX6isGz5S
	Qi67XuaI8WdtDaSYM1cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesaG-0000000771Z-0UiS;
	Thu, 24 Jul 2025 09:49:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerV8-00000006ts1-2PqT;
	Thu, 24 Jul 2025 08:40:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346429;
	bh=0DgY9cU46pjIhmPm0+MTo+Bi+k/CtkPLKu052hg+mTE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LBRcX8RJRFSQT2v9ykuBE9DYadrEmw/VH4l4PViELy9uGyfu7sBNIYEyR3fsx1kiZ
	 yTvrHatS5O6PJ+ii0OMChdf8AzMm0991NFmPobbKE+NoWWszZe2SWf/TXFcYbPs8me
	 r2pv6TlaplaOtPvQKgPCv/j0Cxi/GS9NLiZeu5jESIZvaN6CNjHKFmEE/gTSyex+eX
	 HPnFTVp+sbXcQodsiTdV0ag69QUbgzsuydtrfmkWT8OygG5/mWHQ14ZPG5Ib7icIG9
	 aroAydfviw/i0f495KFi+ws5GHPFcvYGuc902otlo/U7muKMXmD5g9GRAvkpRiokrY
	 u4KPQ8nfoh4rg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8E93B17E11EE;
	Thu, 24 Jul 2025 10:40:26 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Subject: [PATCH 24/38] arm64: dts: mediatek: mt7986a-bpi-r3: Fix SFP I2C node names
Date: Thu, 24 Jul 2025 10:39:00 +0200
Message-ID: <20250724083914.61351-25-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_014030_789581_47DA60DF 
X-CRM114-Status: UNSURE (   9.17  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The binding wants the node to be named "i2c-number", alternatively
"i2c@address", but those are named "i2c-gpio-number" instead.

Rename those to i2c-0, i2c-1 to adhere to the binding and suppress
dtbs_check warnings.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index ed79ad1ae871..6d2762866a1a 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -64,23 +64,19 @@ wps-key {
 	};
 
 	/* i2c of the left SFP cage (wan) */
-	i2c_sfp1: i2c-gpio-0 {
+	i2c_sfp1: i2c-0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&pio 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&pio 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		i2c-gpio,delay-us = <2>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 	};
 
 	/* i2c of the right SFP cage (lan) */
-	i2c_sfp2: i2c-gpio-1 {
+	i2c_sfp2: i2c-1 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&pio 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&pio 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		i2c-gpio,delay-us = <2>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 	};
 
 	leds {
-- 
2.50.1


