Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80FFC83F26
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 09:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TiHDxYiZi3dqvqtnxJmgsoUcNq6lDBhqNsRJaoLs1dc=; b=FTIDsEK/V6mhJO
	AZh00/Ev/oi0RJF0cDs5nOmNYTwDM6NClJVv2+uDi0WvU+FdFKsxpesUajkAleQaun3+Rb/QtlHNj
	8iVDBPCYz8Yr9vuQLaURcOEfvCHR0VnYP5RaQuikzZ9nHrhWBtO603g8L70A9kgpaUtXZ4bWE6nkK
	B3lBzMqdfZaHsXJqaLFOmx2WD5YeWtgJ0TYWG8v7kVwC2SKQNJhnhpgUXiLRoPR7/cFpl0QtRAuRR
	mzmQtMwawxqdzqRExtIuIPlxwrg8mntCvQI4cuFEkRkDFF0icJLBYXrTctyvD4igSXIaDNTothocO
	ec/ZIceegJw8ijjWAb8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesZO-000000076n7-2oOq;
	Thu, 24 Jul 2025 09:48:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerUv-00000006tk6-0UjN;
	Thu, 24 Jul 2025 08:40:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346415;
	bh=Vv0shnN9g1ePIaORYYq4AyKEuij4pF1KI9I2e0+TYB8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UeuzP731yFY5Q9EFmtrRdH0PJV1QSUFS2GBCAM/cBWNi1E1vp9zrFZVHDkyFncbrp
	 f3SBoo3L88z/N5w8F4+vXn8LYm157by9xTOq/KSHLGEv3jpYm3ZDK73IqzBwQv/Dq7
	 V6S7BW4Wzyj4XjCCNbxUJgWEyrvAP9s+kHr11EzFU3ojylvxr15LpjYoxrx5JcdJ0A
	 vWe8034BRxuhRmDRRQiU18NT/uLkiCWSQtIxA2orLQI5KJI12gJ7OgDdRD52fJFSeP
	 ZVH5LXcOKlws3QAAdxX3mF+b7KIGUH0jpKkbt00fJ7Iyq+bCsfpSIvWeaoYnQizmMp
	 9MlKWkFBk2vJA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5616517E11EE;
	Thu, 24 Jul 2025 10:40:13 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Subject: [PATCH 19/38] arm64: dts: mediatek: mt6795: Add mediatek,infracfg to iommu node
Date: Thu, 24 Jul 2025 10:38:55 +0200
Message-ID: <20250724083914.61351-20-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_014017_311133_06B59163 
X-CRM114-Status: UNSURE (   7.37  )
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

The "M4U" IOMMU requires a handle to the infracfg to switch to
the 4gb/pae addressing mode: add it.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index e5e269a660b1..38f65aad2802 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -427,6 +427,7 @@ iommu: iommu@10205000 {
 			clocks = <&infracfg CLK_INFRA_M4U>;
 			clock-names = "bclk";
 			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_LOW>;
+			mediatek,infracfg = <&infracfg>;
 			mediatek,larbs = <&larb0 &larb1 &larb2 &larb3>;
 			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
 			#iommu-cells = <1>;
-- 
2.50.1


