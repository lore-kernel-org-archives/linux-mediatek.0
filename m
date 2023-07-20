Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57826EB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 20:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YTmc75LfHTa7TCmgPznB1cxeujrYHdCm4+YQn7nJwTc=; b=0eoL0P1+k01egJh9ZW1Rf0azbn
	rp3WPtl2akzuuKaB086FGpZS+gUXfYxmRqiHmuUs8IxEisXF6dM27zN/e7OyjSH7CvEQzyqhLQRz1
	O1p55LOhoPw8gqUP97CSMvcfiKMaVko8zs/dGwnik7CyTrcW43m3gfTjvRYzd/StGkt8NDTsX45VL
	+nhO0vS0/irEDPgcULqYriiuImdLSC2tST4MUiyWIazF2R9l/+GT9Q6tu/vQbubXLaeIlWTYCM3UW
	DdiwtF0YKgEruVFf6Cwjr6YX/kys+9+C7kJACZYLMxgAD4A0CrHuXRw4zPbin4l/tybP3yFGNLpXD
	gIJOKHOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMZwe-00C81L-2m;
	Thu, 20 Jul 2023 20:08:16 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMZwc-00C7zR-0E;
	Thu, 20 Jul 2023 20:08:15 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 134E86607090;
	Thu, 20 Jul 2023 21:08:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689883683;
	bh=q4fuY2sBxPima8ZJjGLmr5uxehT6OzQWdozbhPSZu+U=;
	h=From:To:Cc:Subject:Date:From;
	b=gGgk+y0lWDU7OZlur4njWxpvtgz8F37oiLPkhWxHa94nXWnBkfsmBcUQ7igmMplxt
	 oIYzYgPseJV4YazM7MPyfWHuk1gxRJTcJ8VvrZKN4K/rUcoj94z6Kr2+X7l/hgDSWY
	 kr1+GxlBcLIfWel5c4HAI0iiD1xGBCZcEY27Jyy1FQG5m3Wx2fxaewu5v8rvV1T+n+
	 dEpKpdI/FFJtAfHCj46UzJ2Q30esCp79qalPhv6eWZoRneXzKxPzBBhnoToW+a5WJg
	 ZcsKJvqtCTx+b0P1bHl+YSoQpwUS6OFGmamZVc85AECSE0wIwBcCdJSnwRR/trvouG
	 oLt54JiNIBomg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Seiya Wang <seiya.wang@mediatek.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: mt8195: Set DSU PMU status to fail
Date: Thu, 20 Jul 2023 16:07:51 -0400
Message-ID: <20230720200753.322133-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_130814_261327_4BDC2B05 
X-CRM114-Status: GOOD (  13.88  )
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

The DSU PMU allows monitoring performance events in the DSU cluster,
which is done by configuring and reading back values from the DSU PMU
system registers. However, for write-access to be allowed by ELs lower
than EL3, the EL3 firmware needs to update the setting on the ACTLR3_EL3
register, as it is disallowed by default.

That configuration is not done on the firmware used by the MT8195 SoC,
as a consequence, booting a MT8195-based machine like
mt8195-cherry-tomato-r2 with CONFIG_ARM_DSU_PMU enabled hangs the kernel
just as it writes to the CLUSTERPMOVSCLR_EL1 register, since the
instruction faults to EL3, and BL31 apparently just re-runs the
instruction over and over.

Mark the DSU PMU node in the Devicetree with status "fail", as the
machine doesn't have a suitable firmware to make use of it from the
kernel, and allowing its driver to probe would hang the kernel.

Fixes: 37f2582883be ("arm64: dts: Add mediatek SoC mt8195 and evaluation board")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 5c670fce1e47..0705d9c3a6a7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -313,6 +313,7 @@ dsu-pmu {
 		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH 0>;
 		cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>,
 		       <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
+		status = "fail";
 	};
 
 	dmic_codec: dmic-codec {
-- 
2.41.0


