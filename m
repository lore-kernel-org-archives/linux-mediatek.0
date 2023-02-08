Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D770C636CC
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 10:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BM/wQ0GjQQhuwJkOHYUjmZLCPsuFCevOdzB/7yBJ8fY=; b=N/rPfYdr5Lr/8+/IHPMIIiSt5V
	QoVup/L9LqKgkLstN3RwrnniRqLvBKF8QrEjNTF8qkMluZTcwJNsjdglGkysXWumh6RBjndAWu4ZZ
	WuPBNDDBJRJTg0+BJXNCmZYBHSIaZ/po7gQU/N9vlE4OW8ktNqadh3fdhbWyr6qdFhPcSvxSvOL0s
	9HoUlUMuyjbszzzXta4NF7bzeHulzi0dpFMT+3+A0yz7FkNdZQaSMdT10xwVmHrhSgl9Q7j5/NXJV
	Ta4RZTpObY1s5xhrvL4z0HK0HLTOfeouP9i/RmRI/8sZX+c49Jybn7FmnfKtSebpGTYQXEtFWG7dM
	kNjL70Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPi0S-00FJeG-Nh; Wed, 08 Feb 2023 10:48:52 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPhxM-00FHuK-TN; Wed, 08 Feb 2023 10:45:42 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1DBC3660209D;
	Wed,  8 Feb 2023 10:45:39 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675853139;
	bh=Kyw2J37yTMs+/IFvIgq6RScB8xGutn0waYPGo+ad3gc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mdMKI0XCYWOhNvof5hBIFwXJUvk9MzRLZC/RzM0UbxJPth8f1ceEu1P/rrMv08dvj
	 QTLnGz61+Am649UnQQRL3z1vgKDccBjKXs7LAAp4w1d4Ce2tcuVGhR020aOrnxrtQG
	 v4d1qeAH+K6Vb/5nva8X3T2cKgac829z6pm5exAcnpAMdf0D1Ew7Hi+WRxe2T3nVGj
	 SBvnyJLqFK57rRmYDIOCVOCsiJXxtdFQwjJJdL2hjja8hjFvalj+vXzEkG9HMc1jzA
	 0YC+E0QBzQvRFqts1r6QTnLR2hGBXSp6bFt6NGzlKFuY3QICLo2YtMe95bs09Hwphc
	 Xj6yRdkExi5oQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org
Subject: [PATCH 06/16] arm64: dts: mediatek: mt8183: Use mediatek,mt8183b-mali as GPU compatible
Date: Wed,  8 Feb 2023 11:45:17 +0100
Message-Id: <20230208104527.118929-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208104527.118929-1-angelogioacchino.delregno@collabora.com>
References: <20230208104527.118929-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_024541_110730_6A46CC35 
X-CRM114-Status: GOOD (  10.43  )
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

Use the new GPU related compatible to finally enable GPU DVFS on
the MT8183 SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index e01b96adef02..5169779d01df 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1752,7 +1752,7 @@ mfgcfg: syscon@13000000 {
 		};
 
 		gpu: gpu@13040000 {
-			compatible = "mediatek,mt8183-mali", "arm,mali-bifrost";
+			compatible = "mediatek,mt8183b-mali", "arm,mali-bifrost";
 			reg = <0 0x13040000 0 0x4000>;
 			interrupts =
 				<GIC_SPI 280 IRQ_TYPE_LEVEL_LOW>,
-- 
2.39.1


