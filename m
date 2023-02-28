Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5F9C64ED6
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Feb 2023 10:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XtjAfW7+Rlf+69wSa/p62xO+SabQsANF3Bai4Fyfo6Q=; b=AkpYuzGX2lhaAzM4dYFq6jr+0/
	8qZZrV5Qm+xKC29afR+0sHoBo3LsYp2gLYnvt1XC7RTv1u9ZjAi7N9DUofDZCJdcXRKAphtAqI++N
	0tkIhpBEPnBFOMybQi2yyDWuhJ28C7K0Ns7A5tAPfUZmTE9uTBdEM/kCaXu11+k3SWOKdOcVNzNkP
	2DWJTVvN7hPPrCjPqsnXNk3vyTy5MLlHpZTAFtQQWFfFW9GNfUWBXaTXECH8hYwGBYtnNcurmLITy
	zmipjR/IttgEU+i+BvFTSd1NHHohAAoiMziANoTMSsyjQ+tSchnz+FIMbd9mn8F7BAa0e8JqiWAUv
	tfNFYc/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxYl-00ClIu-4S; Tue, 28 Feb 2023 10:50:15 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxWV-00Cjx2-6C; Tue, 28 Feb 2023 10:47:56 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6BDA96602FD5;
	Tue, 28 Feb 2023 10:47:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677581274;
	bh=WS/5GDWx9zfOrHB3JiHOO+tDSOb8JiL3fs15woWgU4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hFiGqwIy0PW5EEBiCOUUhlRawMccNNZVVKNBuS2jqmVQkisdZSCiAw/FNWT0nfE14
	 23urU4jIHs8M5D739n8PlEArHUfAm2KIRtvD/rHiycwSKjzNmHkWYq0r0n7OlIMM2y
	 NPa6H5/c6Bg+7k8Vfy/7iwQcfIeUBS+YxS91h28an+eYDiNvSvmIvvGBOrYOxvSm5u
	 6jHdz1r9ZKc/XOXYmJAKb/kXUcLz6YFHAVcfltEm2AeNzR1yvS3ZH8NGrdPU9I0CPO
	 AeZAaWANoHuMB3VsKL3wtCNT7jyvtUcacSuAnjdIeth14V0U+3ilkvaxzPakmaIefj
	 wFwKZm9CJy7jA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH v3 07/18] arm64: dts: mediatek: mt8192: Add GPU nodes
Date: Tue, 28 Feb 2023 11:47:30 +0100
Message-Id: <20230228104741.717819-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
References: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_024755_515055_A5CFA7BD 
X-CRM114-Status: GOOD (  10.40  )
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

From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

The MediaTek MT8192 includes a Mali-G57 GPU supported in Panfrost. Add
the GPU node to the device tree to enable 3D acceleration.

The GPU node is disabled by default. It should be enabled by board with
its power supplies correctly assigned.

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
[nfraprado: removed sram supply, tweaked opp node name, adjusted commit message]
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
[wenst@: disable GPU by default; adjusted prefix; split out board change]
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
[Angelo: cosmetic fixes]
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 107 +++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 87b91c8feaf9..34631adc52c6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -312,6 +312,91 @@ timer: timer {
 		clock-frequency = <13000000>;
 	};
 
+	gpu_opp_table: opp-table-0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-358000000 {
+			opp-hz = /bits/ 64 <358000000>;
+			opp-microvolt = <606250>;
+		};
+
+		opp-399000000 {
+			opp-hz = /bits/ 64 <399000000>;
+			opp-microvolt = <618750>;
+		};
+
+		opp-440000000 {
+			opp-hz = /bits/ 64 <440000000>;
+			opp-microvolt = <631250>;
+		};
+
+		opp-482000000 {
+			opp-hz = /bits/ 64 <482000000>;
+			opp-microvolt = <643750>;
+		};
+
+		opp-523000000 {
+			opp-hz = /bits/ 64 <523000000>;
+			opp-microvolt = <656250>;
+		};
+
+		opp-564000000 {
+			opp-hz = /bits/ 64 <564000000>;
+			opp-microvolt = <668750>;
+		};
+
+		opp-605000000 {
+			opp-hz = /bits/ 64 <605000000>;
+			opp-microvolt = <681250>;
+		};
+
+		opp-647000000 {
+			opp-hz = /bits/ 64 <647000000>;
+			opp-microvolt = <693750>;
+		};
+
+		opp-688000000 {
+			opp-hz = /bits/ 64 <688000000>;
+			opp-microvolt = <706250>;
+		};
+
+		opp-724000000 {
+			opp-hz = /bits/ 64 <724000000>;
+			opp-microvolt = <725000>;
+		};
+
+		opp-748000000 {
+			opp-hz = /bits/ 64 <748000000>;
+			opp-microvolt = <737500>;
+		};
+
+		opp-772000000 {
+			opp-hz = /bits/ 64 <772000000>;
+			opp-microvolt = <750000>;
+		};
+
+		opp-795000000 {
+			opp-hz = /bits/ 64 <795000000>;
+			opp-microvolt = <762500>;
+		};
+
+		opp-819000000 {
+			opp-hz = /bits/ 64 <819000000>;
+			opp-microvolt = <775000>;
+		};
+
+		opp-843000000 {
+			opp-hz = /bits/ 64 <843000000>;
+			opp-microvolt = <787500>;
+		};
+
+		opp-866000000 {
+			opp-hz = /bits/ 64 <866000000>;
+			opp-microvolt = <800000>;
+		};
+	};
+
 	soc {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -1266,6 +1351,28 @@ mmc1: mmc@11f70000 {
 			status = "disabled";
 		};
 
+		gpu: gpu@13000000 {
+			compatible = "mediatek,mt8192-mali", "arm,mali-valhall-jm";
+			reg = <0 0x13000000 0 0x4000>;
+			interrupts = <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "job", "mmu", "gpu";
+
+			clocks = <&apmixedsys CLK_APMIXED_MFGPLL>;
+
+			power-domains = <&spm MT8192_POWER_DOMAIN_MFG2>,
+					<&spm MT8192_POWER_DOMAIN_MFG3>,
+					<&spm MT8192_POWER_DOMAIN_MFG4>,
+					<&spm MT8192_POWER_DOMAIN_MFG5>,
+					<&spm MT8192_POWER_DOMAIN_MFG6>;
+			power-domain-names = "core0", "core1", "core2", "core3", "core4";
+
+			operating-points-v2 = <&gpu_opp_table>;
+
+			status = "disabled";
+		};
+
 		mfgcfg: clock-controller@13fbf000 {
 			compatible = "mediatek,mt8192-mfgcfg";
 			reg = <0 0x13fbf000 0 0x1000>;
-- 
2.39.2


