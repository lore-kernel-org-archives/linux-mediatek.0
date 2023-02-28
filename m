Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFCFC64EC7
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Feb 2023 10:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cHonwNaD+m1C7FdcuBBExSgPDVNzKwbqbEIk7xjFbP0=; b=Xt6/m7YstJbhhK5yjx6iJp9mz4
	dH5i019HjiSOBr0Mfo/KWQ99q5M7yisU8ESoCISQiLl18kKIMkjsRolqVx9yhOO9pMyku9F2fA61S
	Mixmz/CmmPsRhhH/7NOUCVBZAX3bWO1ZkDb5UHtlHe82KfZ5MVb54rtVL5HdnooMB86xplxSSwTc1
	HNRemikbKH1IasZuFLFA1hnvmXnPbHP+jYyGX/uL26ZZHckS+9jEbp2qMqtTrLLiKnFIrBnMjTqGf
	Sb+yphWETYEsGFH9YWPkvXDQ8qxNu4ELhE/nYTclZWNgjJvVipbGbO+VIIEmXdyPrtgGmIykNfV9/
	bT6Vm1Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxau-00CmgD-W9; Tue, 28 Feb 2023 10:52:29 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxWX-00CjzV-NW; Tue, 28 Feb 2023 10:47:59 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 141D16602FDA;
	Tue, 28 Feb 2023 10:47:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677581276;
	bh=VIfsardJ+9N5gfD68eWHLQAfgPXFsPsNOQTEezXqqYc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eDNm0LLCVYLdi20WIoODyMKMVC8P5uQS2p5Qq97qO2zAHV0ibUPx5RkZf217/B6HT
	 YNaBX3d/fmf1/ozomdQdlCY+gCjJQ27LOO3yElthsZAG1GZKO8Uwl81ywVL62MKWpc
	 qNE2PN7EJ/0QHu968Oe44E4LcH/imaprFBoPeHbMiKcAJFI2Zntw8ahIFUq781sYJE
	 V1kbO6LRhave0fc3ySnfaSXgmrTw/sE3nc6weSJHeDwqLhrsFVlmeZcM7VNOnub5og
	 Z922lNkLrWn8fVCIyqwjZyxYF1AyhPOx5JQxthHqlKAySNCKvK48INWrtOoNI5xctj
	 TV/uQQSB/aNlA==
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
Subject: [PATCH v3 11/18] arm64: dts: mediatek: mt8192-asurada: Couple VGPU and VSRAM_OTHER regulators
Date: Tue, 28 Feb 2023 11:47:34 +0100
Message-Id: <20230228104741.717819-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
References: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_024757_957416_58F2094E 
X-CRM114-Status: UNSURE (   8.53  )
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

Add coupling for these regulators, as VSRAM_OTHER is used to power the
GPU SRAM, and they have a strict voltage output relation to satisfy in
order to ensure GPU stable operation.
While at it, also add voltage constraint overrides for the GPU SRAM
regulator "mt6359_vsram_others", but don't touch mt6315's vbuck1 as
its constraints are fine.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index df477eb89f21..c8b6e1a9605b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -447,6 +447,13 @@ &mt6359_vrf12_ldo_reg {
 	regulator-always-on;
 };
 
+&mt6359_vsram_others_ldo_reg {
+	regulator-min-microvolt = <750000>;
+	regulator-max-microvolt = <850000>;
+	regulator-coupled-with = <&mt6315_7_vbuck1>;
+	regulator-coupled-max-spread = <10000>;
+};
+
 &mt6359_vufs_ldo_reg {
 	regulator-always-on;
 };
@@ -1411,6 +1418,8 @@ mt6315_7_vbuck1: vbuck1 {
 				regulator-max-microvolt = <1193750>;
 				regulator-enable-ramp-delay = <256>;
 				regulator-allowed-modes = <0 1 2>;
+				regulator-coupled-with = <&mt6359_vsram_others_ldo_reg>;
+				regulator-coupled-max-spread = <10000>;
 			};
 		};
 	};
-- 
2.39.2


