Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD0BC64EC7
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Feb 2023 10:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5oRSpIobVVOm5zAwE8uKlw+FZ2mFRE+ZG4eEdLudhgI=; b=2ybFVoyH4XIJi97ktypl9nuEAI
	YcRsxQi5stvsbW6daRszcGTKkW7M0lEEGMuITQjYeL8/R7rzg5vf983TwGXRmZL6wgwV5F7I+UO+O
	LiyD5FoIhLI630Agr4k6JhGcddENcfP2PVytdx3gTwB+zLn8pELAu010P5K7TXlJyJESAxzTwLKtV
	qZiiDQ3+Quz0ZXI8kio8jY+djrrOHd3AG5jm/zTeSNvoSk/ikFZcHZpI7eSkDRaoEo3yneRMWNv99
	tZmUsFLB+mQ0aX/nYzCv8aVQD56B/D8uf/vt06ytu9UrpEaonaR8IBaiIMrdRlcQaw7i0vC+jFNNs
	DO2qWSYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxXY-00CkaL-E2; Tue, 28 Feb 2023 10:49:00 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxWS-00CjvA-Hi; Tue, 28 Feb 2023 10:47:54 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E106E6602FDA;
	Tue, 28 Feb 2023 10:47:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677581271;
	bh=lArSKCx17mh1O30bNJ4tPf+I/p5uXQpXGMq90jh0j/I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OWM8GNat2cxz2dHig+YugKoL+OwAddx+1YznjJbNxnFhTFXspLxH6Dy8FDq+jOA+K
	 xtgtptCoLnOc3iLfGHxYuTQEBIbgLRsBCg0+QxL9KmQ8NPZq47vcKMNz8glpon+/bj
	 dKalxWeJIqHFmg/dtfgl3NY1gYcxP4VpAgFZAwvgCykLjxSdelXoqZE0QpZdJZnbX/
	 YIPUJqXJYiCZLPPYoXgJO0/4mGr4CIURa8oX6q0Ar9ImBiy5AlMxFLsMe4RvVH1OiT
	 38mD8GR5LzccWvMr9szI6SNtknO51dwE5D/Qn1HmViPM9snCYMWgOxkY6NR2K9RSIm
	 WwwWJotS+u4+Q==
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
Subject: [PATCH v3 03/18] arm64: dts: mediatek: mt8183: Remove second opp-microvolt entries from gpu table
Date: Tue, 28 Feb 2023 11:47:26 +0100
Message-Id: <20230228104741.717819-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
References: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_024752_728847_615D6E43 
X-CRM114-Status: UNSURE (   8.78  )
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

This was done to keep a strict relation between VSRAM and VGPU, but
it never worked: now we're doing it transparently with the new
mediatek-regulator-coupler driver.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 32 ++++++++++++------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 3d1d7870a5f1..e01b96adef02 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -563,82 +563,82 @@ gpu_opp_table: opp-table-0 {
 
 		opp-300000000 {
 			opp-hz = /bits/ 64 <300000000>;
-			opp-microvolt = <625000>, <850000>;
+			opp-microvolt = <625000>;
 		};
 
 		opp-320000000 {
 			opp-hz = /bits/ 64 <320000000>;
-			opp-microvolt = <631250>, <850000>;
+			opp-microvolt = <631250>;
 		};
 
 		opp-340000000 {
 			opp-hz = /bits/ 64 <340000000>;
-			opp-microvolt = <637500>, <850000>;
+			opp-microvolt = <637500>;
 		};
 
 		opp-360000000 {
 			opp-hz = /bits/ 64 <360000000>;
-			opp-microvolt = <643750>, <850000>;
+			opp-microvolt = <643750>;
 		};
 
 		opp-380000000 {
 			opp-hz = /bits/ 64 <380000000>;
-			opp-microvolt = <650000>, <850000>;
+			opp-microvolt = <650000>;
 		};
 
 		opp-400000000 {
 			opp-hz = /bits/ 64 <400000000>;
-			opp-microvolt = <656250>, <850000>;
+			opp-microvolt = <656250>;
 		};
 
 		opp-420000000 {
 			opp-hz = /bits/ 64 <420000000>;
-			opp-microvolt = <662500>, <850000>;
+			opp-microvolt = <662500>;
 		};
 
 		opp-460000000 {
 			opp-hz = /bits/ 64 <460000000>;
-			opp-microvolt = <675000>, <850000>;
+			opp-microvolt = <675000>;
 		};
 
 		opp-500000000 {
 			opp-hz = /bits/ 64 <500000000>;
-			opp-microvolt = <687500>, <850000>;
+			opp-microvolt = <687500>;
 		};
 
 		opp-540000000 {
 			opp-hz = /bits/ 64 <540000000>;
-			opp-microvolt = <700000>, <850000>;
+			opp-microvolt = <700000>;
 		};
 
 		opp-580000000 {
 			opp-hz = /bits/ 64 <580000000>;
-			opp-microvolt = <712500>, <850000>;
+			opp-microvolt = <712500>;
 		};
 
 		opp-620000000 {
 			opp-hz = /bits/ 64 <620000000>;
-			opp-microvolt = <725000>, <850000>;
+			opp-microvolt = <725000>;
 		};
 
 		opp-653000000 {
 			opp-hz = /bits/ 64 <653000000>;
-			opp-microvolt = <743750>, <850000>;
+			opp-microvolt = <743750>;
 		};
 
 		opp-698000000 {
 			opp-hz = /bits/ 64 <698000000>;
-			opp-microvolt = <768750>, <868750>;
+			opp-microvolt = <768750>;
 		};
 
 		opp-743000000 {
 			opp-hz = /bits/ 64 <743000000>;
-			opp-microvolt = <793750>, <893750>;
+			opp-microvolt = <793750>;
 		};
 
 		opp-800000000 {
 			opp-hz = /bits/ 64 <800000000>;
-			opp-microvolt = <825000>, <925000>;
+			opp-microvolt = <825000>;
 		};
 	};
 
-- 
2.39.2


