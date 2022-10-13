Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AA8C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 15:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ygxOAKdsXNlSEUeeAPUI1kvBZVqOGjtXG8ijnZHzfZE=; b=MkUfPIFFIdPIW8own02EyPn2fr
	dva9KRe0dz29j7jZrwa1DiaA6JVyMmh2N1Kn6UEQYReTBKbt8Xxv7Xr8DxWAso7DYPo6n67poG9H5
	8DEvi2faw/avIyDiwLjNMz37usKTIbhwWrGoJ2OfmEp08LhE2rjvzwNpOsVsbP7ss2sIz0e/OYmj8
	wwVxOT7VeCneeOUPY+tkm+SzQejaZINmNvxvJ7hV/w8Gqd7JBXAVzEjtA22OQowp/Drs1ct6pKOJ2
	dP+BCYDk7xIxlin/dgacxHRW1NW5I5ojHLgWmw3+OUgGi9cP9Dcbq9f3H2cW/R6kPnBylK1w6/MCh
	8u1l6gAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj04S-00CGYY-1k; Thu, 13 Oct 2022 15:24:28 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj02S-00CFaR-Sc; Thu, 13 Oct 2022 15:22:27 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C4AD3660236C;
	Thu, 13 Oct 2022 16:22:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665674543;
	bh=n1VsYKLDI6PI2eMbYjiYOxjPp4ZKxO4cNBs/kLUYXlw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DuxDOr5lO+fvYGFOQ3d3ZeTzDX9yrftkAzjvQl/vFLs0yoVdm3kAK1VP87aCVSgTH
	 gxlI032FQ5EXq4TsnkCqSMC+ewTrA5xEXMFVmXEQGhEse6J4RuqLkSQzl2UV06vkMi
	 h5BKnYC4B0XNH4Hya+GL6RjLF+9J8ZC13yAfkphYZ0N9H01uHOKffkWNc2/sQbYcFG
	 Bbg2f42IBPHntlc/fUQ6M/0f2RBxEiTm0gRSvAgJmGRUqS3TS3ggwu/t5lBuQz/fjE
	 gn4h/IhDc2seSstvE5LuTQsnFUFLAT3Rwk+FmoOPehlk2tfYzHr3WDcQMvATm4Rg3J
	 5qKVzqmlrgtIw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	sam.shih@mediatek.com,
	hanks.chen@mediatek.com,
	weiyi.lu@mediatek.com,
	zhiyong.tao@mediatek.com,
	andrew-sh.cheng@mediatek.com,
	viresh.kumar@linaro.org,
	chunfeng.yun@mediatek.com,
	fparent@baylibre.com,
	mars.cheng@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 4/8] arm64: dts: mt2712e: Fix unit address for pinctrl node
Date: Thu, 13 Oct 2022 17:22:08 +0200
Message-Id: <20221013152212.416661-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221013152212.416661-1-angelogioacchino.delregno@collabora.com>
References: <20221013152212.416661-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_082225_077490_69E812E0 
X-CRM114-Status: GOOD (  10.05  )
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

The unit address for the pinctrl node is (0x)1000b000 and not
(0x)10005000, which is the syscfg_pctl_a address instead.

This fixes the following warning:
arch/arm64/boot/dts/mediatek/mt2712e.dtsi:264.40-267.4: Warning
(unique_unit_address): /syscfg_pctl_a@10005000: duplicate
unit-address (also used in node /pinctrl@10005000)

Fixes: f0c64340b748 ("arm64: dts: mt2712: add pintcrl device node.")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
index ff6b26cdda81..1ac0b2cf3d40 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
@@ -266,7 +266,7 @@ syscfg_pctl_a: syscfg_pctl_a@10005000 {
 		reg = <0 0x10005000 0 0x1000>;
 	};
 
-	pio: pinctrl@10005000 {
+	pio: pinctrl@1000b000 {
 		compatible = "mediatek,mt2712-pinctrl";
 		reg = <0 0x1000b000 0 0x1000>;
 		mediatek,pctl-regmap = <&syscfg_pctl_a>;
-- 
2.37.2


