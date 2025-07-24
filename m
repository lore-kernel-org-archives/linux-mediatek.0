Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D36C83F1A
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 09:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IdoOScIKryjTnc9uuQaCAx2fQ1RSGpWkGF5lUBFo3Gs=; b=cFVCnixhboyy7/
	1HzOCjphqZqUA3wO4IMvFuuWNjmClOC/Q39bk7Ucz88GJWS5h50YZS/orXBmncJF+Krdd5MzStoP8
	VR9GIl2Djp85JUO0OyDb3X97vJjtejJVCmDfNmgzZy8sy5k6xNZMX8+qog6rJaDhe5VEhFkfogEL3
	3E2LKO7HSpQO3zgg6DrfLDen7aIvLUnxuRKqZQtXdqg6JGlMI8BTejf8GaK0A4bYRmk48NpgvnfkE
	gJ2NGnTzjR6U8aYs4yzEgG72k7WbXdXsY2mX1QYxwUaT+TXZu0zNhUhHFpPBqhiV4jXZEca06Agv1
	sovpDUCMWtR7x2sEGKBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesZu-000000076wX-44Ox;
	Thu, 24 Jul 2025 09:49:30 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerV3-00000006tou-15Ai;
	Thu, 24 Jul 2025 08:40:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346423;
	bh=HmcM0WeCZU7S4LzqqW3oQHysgDBq3tk4yf4yJqDJOZY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YUcauFlv/b9vDuXRLNiXYP5fX6JLVhE2p5S2nlvhh8SjU50Eebfq3Km5CMp8paEVi
	 xMIYIYOZjSGJ2BmtPCEHEZisaGV2nY2me9bSngW4ysRMzTnLqsfKj47VMO//FEhSZ4
	 wWiz/zHDd18LGWCFuls9E2VjeKey52GoZ7U43O5foDLbDoG3rOJysSu8ZmsJQH1Zgq
	 wdIaPt6lTMkADy/C/REo+6HH4P2zKErEBI3VSFtofio5OdnBqWoiAlffopBK627c0+
	 wSx5wrl8I6jIGHoQjAcyz083dAlke8YtbqxH7JaUzcDsuT4r7dgkPsrElJ8EVmD/Er
	 Cj4JPDO2tipDw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 464D117E1110;
	Thu, 24 Jul 2025 10:40:21 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Subject: [PATCH 22/38] arm64: dts: mediatek: Fix node name for SYSIRQ controller on all SoCs
Date: Thu, 24 Jul 2025 10:38:58 +0200
Message-ID: <20250724083914.61351-23-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_014025_485108_8AA7D589 
X-CRM114-Status: UNSURE (   9.77  )
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

The sysirq has "intpol-controller" as node name, but being this an
interrupt controller, it needs to be named "interrupt-controller"
as per what the bindings (correctly) expect.

This commit brings no functional changes, but fixes a dtbs_check
warning.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6755.dtsi | 2 +-
 arch/arm64/boot/dts/mediatek/mt6779.dtsi | 2 +-
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 2 +-
 arch/arm64/boot/dts/mediatek/mt6797.dtsi | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6755.dtsi b/arch/arm64/boot/dts/mediatek/mt6755.dtsi
index b55d3fac9bd4..8da5c0a56a02 100644
--- a/arch/arm64/boot/dts/mediatek/mt6755.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6755.dtsi
@@ -98,7 +98,7 @@ timer {
 			     (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
-	sysirq: intpol-controller@10200620 {
+	sysirq: interrupt-controller@10200620 {
 		compatible = "mediatek,mt6755-sysirq",
 			     "mediatek,mt6577-sysirq";
 		interrupt-controller;
diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
index 5c579e88e749..70f3375916e8 100644
--- a/arch/arm64/boot/dts/mediatek/mt6779.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
@@ -138,7 +138,7 @@ ppi_cluster1: interrupt-partition-1 {
 
 		};
 
-		sysirq: intpol-controller@c53a650 {
+		sysirq: interrupt-controller@c53a650 {
 			compatible = "mediatek,mt6779-sysirq",
 				     "mediatek,mt6577-sysirq";
 			interrupt-controller;
diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 38f65aad2802..58833e5135c8 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -404,7 +404,7 @@ pwrap: pwrap@1000d000 {
 			clock-names = "spi", "wrap";
 		};
 
-		sysirq: intpol-controller@10200620 {
+		sysirq: interrupt-controller@10200620 {
 			compatible = "mediatek,mt6795-sysirq",
 				     "mediatek,mt6577-sysirq";
 			interrupt-controller;
diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
index f2d93bf6a055..8ac98a378fd6 100644
--- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
@@ -228,7 +228,7 @@ apmixedsys: apmixed@1000c000 {
 		#clock-cells = <1>;
 	};
 
-	sysirq: intpol-controller@10200620 {
+	sysirq: interrupt-controller@10200620 {
 		compatible = "mediatek,mt6797-sysirq",
 			     "mediatek,mt6577-sysirq";
 		interrupt-controller;
-- 
2.50.1


