Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307ABC64EC7
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 10:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pvz9jF9cHWYjKN5ELO4E3SBWLGlzgvK9sGZ7ydgZBkw=; b=t0X0UUyAdaaIu4hkROOxa5pfjq
	bCKPWQ7l8mi+Tdq6vxkOQHCBofCevxv5pl9M4jFzXFMwYxNG5OF3xlbh6zuZ3Z0q/4K8eJ2n0O/dj
	FxiNOY9ESXpbnFzaK7/8qS/jDVB4J0MP3YiBFR/vQ42cz4HQUHHF0wzNmZpZIsDAwgFcS4zAA2WUp
	LoxUx9mwltXth0pEZDluLyjhd0bvxac32n/wtLF0hS+nbJP9QbHxum1HFrMa4+VVFpfmvJhoAQ6q9
	sn211nh2C8jITUquvXUaQLdnc2osI6nCu+eZjCjhqBDLQmf0QKGX0IOuuWt+GjSmBrgkH/iczKEEp
	OrdKeKVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJJ3-00FhyR-HK; Wed, 01 Mar 2023 10:03:29 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJBW-00FdRA-1E; Wed, 01 Mar 2023 09:55:43 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5676866020E6;
	Wed,  1 Mar 2023 09:55:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677664540;
	bh=zNRcNap0DKbKus9H9hYNrxN03fzRsqShpCKFraZ9Guk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n0mJRNYsI1EWGG60jwpP5XNylZ79iqYTvNxHVaQvBqOmgh4tyCnB9jzoigrQeL4/y
	 YyWqIL5PD4EkiRFXi24I9wMkKwGspShqvOKzuHrjOIgEbokLHh2k8wPLFlJ1R8F+bR
	 lw3b9RPQ7vp4d8cHepEKf2SQwtnPz0TK7uw392TUunQ7+iTozVM1tjeLWQzEkR28Bh
	 gBhUM3PaBuZiSxGAlqNoRiVU0e5D0xdkwd6khL+MCS+jFfr1GYbYIbP2DcdeJ7rq0n
	 8S2+QsMb3D9Rn9HGmxhzlxxOpp0PV2ky7lXaEri7Xi99HCN2YUo7WkCVpe3Mi0NvF9
	 /n5QiMMTjOHCg==
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
Subject: [PATCH v4 17/19] arm64: dts: mediatek: mt8186: Add GPU node
Date: Wed,  1 Mar 2023 10:55:21 +0100
Message-Id: <20230301095523.428461-18-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
References: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_015542_234725_E9EE0C2B 
X-CRM114-Status: UNSURE (   9.10  )
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

Add a GPU node for MT8186 SoC but keep it disabled.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index a0d3e1f731bd..78ff8ba5718e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1075,6 +1075,23 @@ mfgsys: clock-controller@13000000 {
 			#clock-cells = <1>;
 		};
 
+		gpu: gpu@13040000 {
+			compatible = "mediatek,mt8186-mali",
+				     "arm,mali-bifrost";
+			reg = <0 0x13040000 0 0x4000>;
+
+			clocks = <&mfgsys CLK_MFG_BG3D>;
+			interrupts = <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "job", "mmu", "gpu";
+			power-domains = <&spm MT8186_POWER_DOMAIN_MFG2>,
+					<&spm MT8186_POWER_DOMAIN_MFG3>;
+			power-domain-names = "core0", "core1";
+			#cooling-cells = <2>;
+			status = "disabled";
+		};
+
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8186-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
-- 
2.39.2


