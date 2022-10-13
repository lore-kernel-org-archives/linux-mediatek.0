Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BABDC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 15:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ad1tn7M4++ED6HJTqr/hUrrB+5uL/84fu7TaH5LZF80=; b=t6OXRS4BKW7rek2g11r+RsdlWi
	qBdV2dFZf3CNMMc5vuGx/d+tBIbj2IcQcz/RiOwuvh71c3BYwA3HzBlpc7sszALop67Ga8PBNRDwU
	6leLReLV5GaW4CwiIKbckBQYhkgNYYEctcA+KHs0kIT/7IBSyjjU5wPdIH2CNrjxcoq60M575Z+F8
	OFmYy7SGzO4fQijCuICC2QVhN59h1KZh4au40KAwKX9LgZA5fNTx8o1BlwcXcFLjMEcH8YxVIh8vA
	q2E9f+wfGUu0o5mSJZMedjXD0lefiYU11JnTwnvjwLMmQCiazFDigTcND48zKvwsHEOR/RMO15vm7
	Czm1x3vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj04R-00CGXr-8n; Thu, 13 Oct 2022 15:24:27 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj02U-00CFcI-AK; Thu, 13 Oct 2022 15:22:27 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D6512660236D;
	Thu, 13 Oct 2022 16:22:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665674544;
	bh=INS243mzP1SOOPeVeBL+nO0voOGFkQsw8mK81vzcoE8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WEkzPELACCOpLtieCfb86aQW4zYRZxtvPnkjdPkGb8F3YXQHBMM4LiUY+obierQvd
	 VWaJIjwwpYs0HwHNx3voVk68x3suZUB3UC7Qnpa0AGPm+BFy7gaqXL13enmjBEOfP7
	 yin6LuJSi2MN0YJCuaCbr6FwwJPD1dD358CiLfOvlOzUR2LmAY2P6hOffaO/aQxvy0
	 GZfFGe9ZtPrc+BMFU9nGKesNaF5Jr0nwJ9njbOVjxdsk4MAzQCT2EajVprPsxHa+uy
	 1Y30jrGEsAU6oWrCCByoHyUwYWX7LILjkPdAruE77WK2RB2gG+2zrtJTywDzbEM+Us
	 dxsyzbCThjboA==
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
Subject: [PATCH 5/8] arm64: dts: mt2712-evb: Fix vproc fixed regulators unit names
Date: Thu, 13 Oct 2022 17:22:09 +0200
Message-Id: <20221013152212.416661-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221013152212.416661-1-angelogioacchino.delregno@collabora.com>
References: <20221013152212.416661-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_082226_529370_F804758D 
X-CRM114-Status: UNSURE (   9.54  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Update the names to regulator-vproc-buck{0,1} to fix unit_addres_vs_reg
warnings for those.

Fixes: f75dd8bdd344 ("arm64: dts: mediatek: add mt2712 cpufreq related device nodes")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt2712-evb.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
index 9b1af9c80130..638908773706 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
@@ -26,14 +26,14 @@ chosen {
 		stdout-path = "serial0:921600n8";
 	};
 
-	cpus_fixed_vproc0: fixedregulator@0 {
+	cpus_fixed_vproc0: regulator-vproc-buck0 {
 		compatible = "regulator-fixed";
 		regulator-name = "vproc_buck0";
 		regulator-min-microvolt = <1000000>;
 		regulator-max-microvolt = <1000000>;
 	};
 
-	cpus_fixed_vproc1: fixedregulator@1 {
+	cpus_fixed_vproc1: regulator-vproc-buck1 {
 		compatible = "regulator-fixed";
 		regulator-name = "vproc_buck1";
 		regulator-min-microvolt = <1000000>;
-- 
2.37.2


