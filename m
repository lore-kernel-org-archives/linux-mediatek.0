Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC199C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Oct 2023 13:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qlMBBBsUND18kQrlQDhIC/0O/jLCk383IVH7HhMmPP4=; b=Pml+J4ogjfmwSbCGUKOAIUCaf8
	RJZzWif9xqruh20vubghRHLc1++r4qPhfpNoDWCxEyn7epTjtXvPC8V1BSQA1mxTThm7Q9av3Nc8c
	zQ1FLg0POSR6vpEna5ExJX350U8lCTZtwZplEeUwdfZp9l3GtyGrxH6a3kM6TuD+hkeUytqCJPA6N
	fvsTb0z4ya2EEyur8ckf6hXBjrb0ehN31kk1SVmneC5myDqY0qxMwQP4zx8kScz4Hvy13cdDX32ZW
	+9AQdud2/cx4aVa2CVom2SAIaN0cAFtKLLecSQTDWXOW58n+BI9KWFaLDFIn4/CiMnueLhkzi3SAS
	rYuB3lkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxSHE-003Opx-2y;
	Mon, 30 Oct 2023 13:25:56 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxSGt-003OhG-1S;
	Mon, 30 Oct 2023 13:25:37 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A18E066071A3;
	Mon, 30 Oct 2023 13:25:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698672329;
	bh=wz7abYmfV4HWaoeOBzSJ/u42aKuYiLe917d2C8mb5w8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g5d3n2kjct0RdiYJ2bIBv+u77xHD+a/Xe50Ftl6FrwLrmq6VJKBJHeZtux6N/oc3G
	 8MP0yY2Y8pKZFBS3ZfiFylxV2MNqs8io8vMR1jbdiEbwu8LDds0tc16ksi984h36C+
	 THCNL/LMtbUEUMn3hnqLk2NkMXb3b/+T49OP92oIJk3O5X1hyh+7sSZQgLAxKnPxQ0
	 m2ag56ESKBdROQmUzVlokbKeYJRijBz1jql+jgpO/8/Sr/tdeLtcMcXigwTenbOjBC
	 Iaf1ZhcwhMqaGa/usFd7w+DOcVIUePCtWf2qHiddEMWa2KKsSuAlKnKJw4naU7G8VS
	 CTi0fs0zu8/6w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	wenst@chromium.org,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 1/2] arm64: dts: mediatek: mt8195-cherry: Add MFG0 domain supply
Date: Mon, 30 Oct 2023 14:25:22 +0100
Message-ID: <20231030132523.86123-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231030132523.86123-1-angelogioacchino.delregno@collabora.com>
References: <20231030132523.86123-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_062535_658376_027C9A00 
X-CRM114-Status: GOOD (  11.10  )
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

MFG0 is the main power domain for the GPU and its surrounding glue
logic, and has a specific power rail.

Add its power supply on Cherry platforms and remove the now useless
(and wrong) regulator-always-on property from the vbuck1 regulator.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 2c2f079600ba..26213100419a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -478,6 +478,10 @@ pmic@34 {
 	};
 };
 
+&mfg0 {
+	domain-supply = <&mt6315_7_vbuck1>;
+};
+
 &mmc0 {
 	status = "okay";
 
@@ -1231,7 +1235,6 @@ mt6315_7_vbuck1: vbuck1 {
 				regulator-enable-ramp-delay = <256>;
 				regulator-ramp-delay = <6250>;
 				regulator-allowed-modes = <0 1 2>;
-				regulator-always-on;
 			};
 		};
 	};
-- 
2.42.0


