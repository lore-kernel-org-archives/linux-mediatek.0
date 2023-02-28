Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8106C7EE2E
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Feb 2023 10:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5X0eqramAMz+tYV9t3z/PRvMrYdEJZZalH63bZ/oQU=; b=aWCoHZEBA3TFto1smX0xEzf9ps
	aLaSlINoy18HpIEqcr2wHtloj+QyjyAQMf888jDq5cNxTNx56bUwyRPv24fvpaqSqqzapJp/TL8R4
	SvNAq/ecegXDveqtVcN5q8nMtSplXMj1WzOu2p2axSM0rGYkA6pmwRgbpmjLgfhw1wRp/A7K72Zp4
	wvbEdR/b+V3XyRwILm1PK+7f/neBNV6pJ+Gtu+Wd5jnXmEOmsu+s6bVXkMyDphIYlizlvvdt+qtXh
	pHzS7/4dPSPGC0nCmGNECI58jq1CBvrJqVJuCiY8ralVsoZ42WJmQq/XlqDvzDH7mXzBL5TA7znHx
	OQ+oBg4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxYJ-00Cl49-J1; Tue, 28 Feb 2023 10:49:47 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxWU-00CjwS-Fq; Tue, 28 Feb 2023 10:47:55 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C902D6602FDD;
	Tue, 28 Feb 2023 10:47:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677581273;
	bh=7nrUbCRYVnwYMTUi2s51QYeV3DhvJQJoBM8PfyrS3Ok=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AdrM3BuVZzfiKKrYYkFPomdI7sp+7R98ThxfEuzos9BLkOXV4Y202LwUlimO5rp5g
	 1yxBPpnu07eB1MuQhc9/fqvuLWPiwyhtkwe/6r+JSectev19ZNrmaQNemuMTc5+GRB
	 pELshWUNgV4trouIlEFAmLeOz4IE5nw/cPU3cMwBT4bCPZndvKcUnaXQsvfjtpDmCu
	 45nULDczz1ts90NEc0e1Lm9qXRgyyCwJZEgs9GxaKtw1JouNAHW3U/PU3XtdBTajO5
	 n2Prbgj13wA4R6LphJuDRTUwYYkOeu68I2W9t/x+zlm8R+4hX5MIE+TXwa6oRw95C5
	 z/CIDWEtXTyLg==
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
Subject: [PATCH v3 06/18] arm64: dts: mediatek: mt8183: Use mediatek,mt8183b-mali as GPU compatible
Date: Tue, 28 Feb 2023 11:47:29 +0100
Message-Id: <20230228104741.717819-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
References: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_024754_695207_B59E45D7 
X-CRM114-Status: GOOD (  10.46  )
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
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
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
2.39.2


